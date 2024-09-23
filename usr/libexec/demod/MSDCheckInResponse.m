@implementation MSDCheckInResponse

- (BOOL)eligible
{
  return self->_eligible;
}

- (void)setEligible:(BOOL)a3
{
  self->_eligible = a3;
}

- (BOOL)showUI
{
  return self->_showUI;
}

- (void)setShowUI:(BOOL)a3
{
  self->_showUI = a3;
}

@end
