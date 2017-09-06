require 'run_length_encoding'

describe "#run_length_encode" do
  it "encodes an empty string" do
    expect(run_length_encode(' ')).to eq(' ')
  end

  it "encodes single characters without count" do
    expect(run_length_encode('XYZ')).to eq('XYZ')
  end

  it "encodes a string with no single characters" do
    expect(run_length_encode('AABBBCCCC')).to eq('2A3B4C')
  end

  it "encodes single characters mixed with repeated characters" do
    expect(run_length_encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')).to eq('12WB12W3B24WB')
  end

  it "encodes a string with multipe whitespaces" do
    expect(run_length_encode('  hsqq qww  ')).to eq('2 hs2q q2w2 ')
  end

  it "encodes lowercase characters" do
    expect(run_length_encode('aabbbcccc')).to eq('2a3b4c')
  end
end

describe "#run_length_decode" do
  it "decodes an empty string" do
    expect(run_length_decode(' ')).to eq(' ')
  end

  it "decodes single characters only" do
    expect(run_length_decode('XYZ')).to eq('XYZ')
  end

  it "decodes a string with no single characters" do
    expect(run_length_decode('2a2b')).to eq('aabb')
  end

  it "decodes a string with single and repeated characters" do
    expect(run_length_decode('12WB12W3B24WB')).to eq('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')
  end

  it "decodes a string with multiple whitespaces" do
    expect(run_length_decode('2 hs2q q2w2 ')).to eq('  hsqq qww  ')
  end

  it "decodes a lowercase string" do
    expect(run_length_decode('2a3b4c')).to eq('aabbbcccc')
  end
end


