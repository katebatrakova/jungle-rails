require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should succesfully register new user when all required fields are valid' do
    @user = User.new(name:'Kate', email:'kate43@mail.com', password:'12345678', password_confirmation:'12345678')
    expect(@user).to be_valid

  end

  context "Password" do
  it 'user must input a password' do
    @user = User.new(name:'Kate', email:'kate@mail.com', password:nil, password_confirmation:nil)
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include("can't be blank")
    # puts (@user.errors.messages)
  end

  it "user's password confirmation should match the password" do
    @user = User.new(name:'Kate', email:'kate@mail.com', password:'12345678', password_confirmation:'87654321')
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password_confirmation]).to include("doesn't match Password")
  end

  it "user's password must respect the minimum length of 8" do
    @user = User.new(name:'Kate', email:'kate@mail.com', password:'123', password_confirmation:'123')
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include("is too short (minimum is 8 characters)")
  end

 end

 context "Name" do
  it "user can't leave name blank" do
    @user = User.new(name:'', email:'kate@mail.com', password:'12345678', password_confirmation:'12345678')
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:name]).to include("can't be blank")
  end
 end

 context "Email" do
  it "user can't leave email blank" do
    @user = User.new(name:'Kate', email:'', password:'12345678', password_confirmation:'12345678')
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:email]).to include("can't be blank")
  end

  it "user's email must be unique" do
    @user = User.new(name:'Kate', email:'kiki@mail.com', password:'12345678', password_confirmation:'12345678')
    @user.save!
    @user1 = User.new(name:'Mike', email:'kiki@mail.com', password:'12345678', password_confirmation:'12345678')
    expect(@user1).to_not be_valid
    expect(@user1.errors.messages[:email]).to include("has already been taken")
  end

 end

 describe '.authenticate_with_credentials' do
  it "should return an instance of the user when successfully authenticated" do
  @user = User.new(name:'Kate', email:'kate@mail.com', password:'12345678', password_confirmation:'12345678')
  @user.save
  user_authenticated = User.authenticate_with_credentials('kate@mail.com', '12345678')
  expect(user_authenticated).to eq(@user)
  
end
end

describe '.authenticate_with_credentials' do
  it "should return nil if unsuccessfully authenticated" do
  @user = User.new(name:'Kate', email:'kate@mail.com', password:'12345678', password_confirmation:'12345678')
  @user.save
  user_authenticated = User.authenticate_with_credentials('kate@mail.com', '1234567')
  expect(user_authenticated).to eq(nil) 
end
end


end
