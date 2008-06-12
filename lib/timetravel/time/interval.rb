require 'rubygems'
require 'facets/time/change'
require 'timetravel/interval'
require 'timetravel/numeric/interval'
require 'timetravel/date/interval'

class Time
  def plus_interval(other)
    return other.since(self) if Timetravel::Interval === other
    old_plus(other)
  end
  
  def minus_interval(other)
    return other.until(self) if Timetravel::Interval === other
    old_minus(other)
  end
  
  alias_method :old_plus, :+
  alias_method :+, :plus_interval
  
  alias_method :old_minus, :-
  alias_method :-, :minus_interval
  
  def advance(options)
    # on Time + operates in seconds
    out = self
    
    # advance date
    if [ :year, :years, :month, :months, :day, :days ].inject(false) { |sum, c| sum || options.has_key?(c) }
      date = to_date.advance(options)
      out = out.change(:year => date.year, :month => date.month, :day => date.day)
    end
    
    # this may not work, as it may end up being recursive. might have to
    # add up seconds and use #since
    out += options[:seconds] || 0
    out += options[:minutes] * 60 if options[:minutes]
    out += options[:hours] * 3600 if options[:hours]
    
    out
  end
end