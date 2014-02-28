require 'spec_helper'

describe User do
  
  subject(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:username) }

  it { should validate_uniqueness_of(:username)}

  it { should have_secure_password }

end