require 'spec_helper'

describe Daily::Txt::Config do

  it 'has a class' do
    expect(Daily::Txt::Config).not_to be nil
    expect(Daily::Txt::Config).to respond_to(:load)
  end

  describe 'load' do

    let(:basedir) { File.dirname(__FILE__)  + '/' }

    it 'raises error if file not found' do
      expect {
        Daily::Txt::Config.load(basedir + 'hoge.json')
      }.to raise_error(Daily::Txt::Config::NotFound)
    end

    it 'raises error if file is not in JSON format' do
      expect {
        Daily::Txt::Config.load(basedir + 'config/parse_error.json')
      }.to raise_error(Daily::Txt::Config::ParseError)
    end

    it 'raises error if file doesnt have required key' do
      expect {
        Daily::Txt::Config.load(basedir + 'config/ng.json')
      }.to raise_error(Daily::Txt::Config::Invalid)
    end

    it 'loads and parses config JSON' do
      config = Daily::Txt::Config.load(basedir + 'config/ok.json')
      expect(config["home"]).to be_a String
      expect(config["editor"]).to be_a String
      expect(config["color"]).to be true
    end

  end

end
