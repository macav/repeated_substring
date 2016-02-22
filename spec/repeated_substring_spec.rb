require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  it 'should print repeated substring for the most simple case' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('oranange')).to eq('an')
  end

  it 'should print the first substring from the beginning of the string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banana')).to eq('an')
  end

  it 'should print NONE in case no repeated substrings are found' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('am so uniqe')).to eq('NONE')
  end

  it 'should not consider spaces as a correct substring' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('a   b')).to eq('NONE')
  end

  it 'should correctly find substring if there are spaces too' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banana   orange')).to eq('an')
  end

  it 'should not count newlines as a valid substring' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring("a\n\n\n\na")).to eq('NONE')
  end

  it 'should not count national characters as regular' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banäna')).to eq('NONE')
  end

  it 'should count substring containing spaces' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('ba na nana')).to eq('a n')
  end

  it 'should pick the longest substring if there are smaller substrings as well' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banana oraorange')).to eq('ora')
  end

  it 'should not count overlapping substrings' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('anana')).to eq('an')
  end

  xit 'find the most repeated substring for every line of a file' do
    expect(RepeatedSubstring.new.find_repeated_substring_file('data/sample.txt')).to eq(['an', 'NONE', 'NONE', 'oo'])
  end
end
