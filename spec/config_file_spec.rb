require 'spec_helper'

describe ConfigFile do

  it{respond_to :validate_existence!}
  it{respond_to :validate_existence}
  it{respond_to :validate_key}
  it{respond_to :validate_key!}
  it{respond_to :data}

  describe ".configure" do
    it "yields configuration object" do
      ConfigFile.configure do |c|
        c.class.should eq ConfigFile::Configuration
      end
    end
  end
end
