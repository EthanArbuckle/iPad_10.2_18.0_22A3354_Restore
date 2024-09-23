@implementation SBFluidDismissalState

- (double)backgroundWeighting
{
  return self->_backgroundWeighting;
}

- (void)setBackgroundWeighting:(double)a3
{
  self->_backgroundWeighting = a3;
}

- (double)contentWeighting
{
  return self->_contentWeighting;
}

- (void)setContentWeighting:(double)a3
{
  self->_contentWeighting = a3;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->_contentRect = a3;
}

- (CGRect)homeGrabberContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_homeGrabberContentRect.origin.x;
  y = self->_homeGrabberContentRect.origin.y;
  width = self->_homeGrabberContentRect.size.width;
  height = self->_homeGrabberContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHomeGrabberContentRect:(CGRect)a3
{
  self->_homeGrabberContentRect = a3;
}

- (int64_t)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(int64_t)a3
{
  self->_dismissalType = a3;
}

- (int64_t)transitionPhase
{
  return self->_transitionPhase;
}

- (void)setTransitionPhase:(int64_t)a3
{
  self->_transitionPhase = a3;
}

@end
