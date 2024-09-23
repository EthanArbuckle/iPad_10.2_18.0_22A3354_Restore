@implementation SBHClockHandsImageSet

- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3
{
  memmove(a3, &self->_metrics, 0xE8uLL);
}

- (UIImage)secondDot
{
  return self->_secondDot;
}

- (UIImage)hourMinuteDot
{
  return self->_hourMinuteDot;
}

- (UIImage)seconds
{
  return self->_seconds;
}

- (UIImage)minutes
{
  return self->_minutes;
}

- (UIImage)hours
{
  return self->_hours;
}

- (void)setMetrics:(const SBHClockApplicationIconImageMetrics *)a3
{
  memmove(&self->_metrics, a3, 0xE8uLL);
}

- (void)setSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_seconds, a3);
}

- (void)setMinutes:(id)a3
{
  objc_storeStrong((id *)&self->_minutes, a3);
}

- (void)setHours:(id)a3
{
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)setHourMinuteDot:(id)a3
{
  objc_storeStrong((id *)&self->_hourMinuteDot, a3);
}

- (void)setSecondDot:(id)a3
{
  objc_storeStrong((id *)&self->_secondDot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondDot, 0);
  objc_storeStrong((id *)&self->_hourMinuteDot, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_seconds, 0);
}

@end
