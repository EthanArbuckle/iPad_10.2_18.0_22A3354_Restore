@implementation HVEligibilityCheckResult

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (void)setIsEligible:(BOOL)a3
{
  self->_isEligible = a3;
}

- (BOOL)isEligibleExceptForAge
{
  return self->_isEligibleExceptForAge;
}

- (void)setIsEligibleExceptForAge:(BOOL)a3
{
  self->_isEligibleExceptForAge = a3;
}

@end
