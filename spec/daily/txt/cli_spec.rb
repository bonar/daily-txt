require 'spec_helper'

describe Daily::Txt::CLI do

  it 'has a class' do
    expect(Daily::Txt::CLI).not_to be nil
  end

  it 'has an entry point' do
    expect(Daily::Txt::CLI).to respond_to(:bootstrap)
  end

  describe "actions" do

    before(:each) do
      allow(Daily::Txt::Config).to receive(:load)
        .and_return({
          "home" => File.dirname(__FILE__),
          "editor" => "vim",
        })
    end

    it "opens today's file when no args specified" do
      allow(Daily::Txt::CLI).to receive(:parse_option)
        .and_return({})
      allow(Daily::Txt::System).to receive(:exec)

      Daily::Txt::CLI.bootstrap("")

      expect(Daily::Txt::System).to have_received(:exec)
        .with("vim", an_instance_of(String))
    end

  end

end
