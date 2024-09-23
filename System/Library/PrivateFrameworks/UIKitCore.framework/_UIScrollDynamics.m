@implementation _UIScrollDynamics

- (_UIScrollDynamics)init
{
  uint64_t v3;
  _UIScrollDynamics *v5;
  objc_super v6;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = (_UIScrollDynamics *)objc_opt_new();

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIScrollDynamics;
    return -[_UIScrollDynamics init](&v6, sel_init);
  }
}

- (_UIScrollDynamics)initWithInitialContentOffset:(CGPoint)a3 velocity:(CGVector)a4 contentFrame:(CGRect)a5 viewSize:(CGSize)a6 screenScale:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  double dy;
  double dx;
  double v13;
  double v14;
  _UIScrollDynamics *v15;
  _UIScrollDynamics *v16;
  double v18;
  CGFloat v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  dy = a4.dy;
  dx = a4.dx;
  v13 = a3.y;
  v14 = a3.x;
  v15 = -[_UIScrollDynamics init](self, "init", *(_QWORD *)&a6.width, *(_QWORD *)&a6.height);
  v16 = v15;
  if (v15)
  {
    -[_UIScrollDynamics setInitialContentOffset:](v15, "setInitialContentOffset:", v14, v13);
    -[_UIScrollDynamics setInitialVelocity:](v16, "setInitialVelocity:", dx, dy);
    -[_UIScrollDynamics setContentFrame:](v16, "setContentFrame:", x, y, width, height);
    -[_UIScrollDynamics setContentOrigin:](v16, "setContentOrigin:", x, y);
    -[_UIScrollDynamics setViewSize:](v16, "setViewSize:", a7, v18);
    v16->_tolerance.width = v19;
    v16->_tolerance.height = v19;
    -[_UIScrollDynamics setShouldRoundCalculations:](v16, "setShouldRoundCalculations:", 1);
    -[_UIScrollDynamics calculateDecelerationTarget](v16, "calculateDecelerationTarget");
  }
  return v16;
}

- (double)durationUntilStop
{
  return 0.0;
}

- (double)speedAfterDuration:(double)a3
{
  return 0.0;
}

- (CGVector)velocityAfterDuration:(double)a3
{
  double v3;
  double v4;
  CGVector result;

  v3 = 0.0;
  v4 = 0.0;
  result.dy = v4;
  result.dx = v3;
  return result;
}

- (CGPoint)positionAfterDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isRubberBandingAfterDuration:(double)a3
{
  return 0;
}

- (void)recalculateForDecelerationTarget:(CGPoint)a3
{
  -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", a3.x, a3.y);
  -[_UIScrollDynamics calculateToReachDecelerationTarget](self, "calculateToReachDecelerationTarget");
}

- (BOOL)shouldRoundCalculations
{
  return self->_shouldRoundCalculations;
}

- (void)setShouldRoundCalculations:(BOOL)a3
{
  self->_shouldRoundCalculations = a3;
}

- (CGSize)tolerance
{
  double width;
  double height;
  CGSize result;

  width = self->_tolerance.width;
  height = self->_tolerance.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)decelerationTarget
{
  double x;
  double y;
  CGPoint result;

  x = self->_decelerationTarget.x;
  y = self->_decelerationTarget.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDecelerationTarget:(CGPoint)a3
{
  self->_decelerationTarget = a3;
}

- (CGPoint)initialContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialContentOffset.x;
  y = self->_initialContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialContentOffset:(CGPoint)a3
{
  self->_initialContentOffset = a3;
}

- (CGVector)initialVelocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_initialVelocity.dx;
  dy = self->_initialVelocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setInitialVelocity:(CGVector)a3
{
  self->_initialVelocity = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGPoint)contentOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOrigin.x;
  y = self->_contentOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOrigin:(CGPoint)a3
{
  self->_contentOrigin = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

@end
