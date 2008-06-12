require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/timetravel/date'

describe "Timetravel::Date::Interval" do
  before do
    @d = Date.new(2008,1,1)
  end
  
  it "should add intervals" do
    (@d + 1.day).should == @d + 1
  end
  
  it "should subtract intervals" do
    (@d - 1.day).should == @d - 1
  end
  
  it "should add years" do
    (@d + 2.years).should == Date.new(2010,1,1)
  end
  
  it "should add months" do
    (@d + 2.months).should == Date.new(2008,3,1)
  end
  
  it "should add weeks" do
    (@d + 2.weeks).should == Date.new(2008,1,15)
  end
  
  it "should add days" do
    (@d + 2.days).should == Date.new(2008,1,3)
  end
  
  it "should ignore adding hours" do
    (@d + 1.hour).should == Date.new(2008,1,1)
  end
  
  it "should add 11 months" do
    (Date.new(2008,4,1) + 11.months).should == Date.new(2009,3,1)
  end
end