SimpleCov.command_name 'test:units'
require 'rails_helper'

RSpec.describe Forum, type: :model do
  it {should belong_to :user}
  it {should validate_length_of :name}
  it {should validate_length_of :description}
  it {should have_many :posts}
end
