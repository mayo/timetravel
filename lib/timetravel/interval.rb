module Timetravel
  class Interval
    attr_accessor :value
    attr_accessor :components
    
    def initialize(value, components)
      @value = value
      @components = components
    end
    
    def +(other)
      if Interval === other
        Interval.new(value + other.value, @components + other.components)
      else
        Interval.new(value + other, @components + [[ :seconds, other ]])
      end
    end
    
    def -(other)
      self + (-other)
    end
    
    def -@(other)
      Interval.new(-value, @components.map { |c, val| [ c, -val ] })
    end
    
    def is_a?(klass)
      klass == Interval || super
    end
    
    def self.===(other)
      other.is_a?(Interval) rescue super
    end
    
    def since(time = ::Time.now)
      sum(1, time)
    end
    
    def until(time = ::Time.now)
      sum(-1, time)
    end
    
    def inspect
      value
    end
    
    def test(v1)
      v1.class.ancestors.include?(Date)
    end
    
    protected
    
    def sum(sign, time = ::Time.now)
      components.inject(time) do |t, (component, value)|
        if [Time, Date, DateTime].inject(false) { |sum, klass| sum || t.class.ancestors.include?(klass) }
          t.advance(component => sign * value)
        else
          raise ArgumentError, "expected a time or date, got #{time.inspect}"
        end
      end
    end
    
    private
    
    def method_missing(method, *args, &block)
      value.send(method, *args)
    end
  end #class Interval
end #module #Timetravel