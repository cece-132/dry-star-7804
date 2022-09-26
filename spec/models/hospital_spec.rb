require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validatiuons' do
    it {should validate_presence_of :name }
  end
  
  describe 'relationships' do
    it {should have_many :doctors}
    it {should have_many(:patients).through(:doctors)}
  end
end
