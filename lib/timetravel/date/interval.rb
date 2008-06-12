require 'date'
require 'timetravel/interval'
require 'timetravel/numeric/interval'

class Date
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
    # on Date >> operates in months, + operates in days
    out = self
    out >>= options[:years] * 12 if options[:years]
    out >>= options[:months] if options[:months]
    out += options[:weeks] * 7 if options[:weeks]
    out += options[:days] if options[:days]
    out
  end
end