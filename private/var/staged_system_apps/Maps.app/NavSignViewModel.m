@implementation NavSignViewModel

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
  objc_storeStrong((id *)&self->_step, a3);
}

- (_NSRange)stepIndexRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_stepIndexRange.length;
  location = self->_stepIndexRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStepIndexRange:(_NSRange)a3
{
  self->_stepIndexRange = a3;
}

- (NavSignManeuverGuidanceInfo)maneuverInfo
{
  return self->_maneuverInfo;
}

- (void)setManeuverInfo:(id)a3
{
  objc_storeStrong((id *)&self->_maneuverInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverInfo, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end
