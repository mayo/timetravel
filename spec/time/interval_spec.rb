require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/timetravel/time'

describe "Timetravel::Time::Interval" do
  before do
    @t = Time.local(2008,1,1,1,1,1)
  end
  
  it "should add intervals" do
    (@t + 1.second).should == Time.local(2008,1,1,1,1,2)
  end
  
  it "should subtract intervals" do
    (@t - 1.second).should == Time.local(2008,1,1,1,1,0)
  end
  
  it "should add minutes" do
    (@t + 1.minute).should == Time.local(2008,1,1,1,2,1)
  end
  
  it "should add 2 minutes" do
    (@t + 2.minutes).should == Time.local(2008,1,1,1,3,1)
  end
  
  it "should add hours" do
    (@t + 1.hour).should == Time.local(2008,1,1,2,1,1)
  end
  
  it "should add years" do
    (@t + 2.years).should == Time.local(2010,1,1,1,1,1)
  end
  
  it "should add months" do
    (@t + 2.months).should == Time.local(2008,3,1,1,1,1)
  end
  
  it "should add weeks" do
    (@t + 2.weeks).should == Time.local(2008,1,15,1,1,1)
  end
  
  it "should add days" do
    (@t + 2.days).should == Time.local(2008,1,3,1,1,1)
  end
  
end