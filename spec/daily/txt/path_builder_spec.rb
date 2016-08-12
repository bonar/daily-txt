
describe Daily::Txt::PathBuilder do
  let(:root_dir) { '/tmp/root' }
  let(:text_dir) {
    "#{root_dir}/#{Daily::Txt::PathBuilder::DIR_TEXT}" }

  it "creates date text path" do
    date = Date.new(2016, 4, 29)
    path = Daily::Txt::PathBuilder.by_date(root_dir, date)
    expect(path).to eq "#{text_dir}/2016/04/2016_04_29.txt"
  end

end

