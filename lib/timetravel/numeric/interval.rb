module Timetravel
  module NumericExtensions
    module Interval
    
      def seconds
        Timetravel::Interval.new(self, [[:seconds, self]])
      end
      alias :second :seconds
    
      def minutes
        Timetravel::Interval.new(self * 60, [[:seconds, self * 60]])
      end
      alias :minute :minutes  
    
      def hours
        Timetravel::Interval.new(self * 3600, [[:seconds, self * 3600]])
      end
      alias :hour :hours
    
      def days
        Timetravel::Interval.new(self * 24.hours, [[:days, self]])
      end
      alias :day :days
    
      def weeks
        Timetravel::Interval.new(self * 7.days, [[:days, self * 7]])
      end
      alias :week :weeks
    
      def months
        Timetravel::Interval.new(self * 30.days, [[:months, self]])
      end
      alias :month :months
    
      def years
        Timetravel::Interval.new(self * 365.25.days, [[:years, self]])
      end
      alias :year :years
    
    end #module Interval
  end #module NumericExtensions
end #module Timetravel

class Numeric
  include Timetravel::NumericExtensions::Interval
end
