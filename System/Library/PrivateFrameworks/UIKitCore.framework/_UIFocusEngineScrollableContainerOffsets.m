@implementation _UIFocusEngineScrollableContainerOffsets

- (BOOL)adjustsTargetsOnContentOffsetChanges
{
  return self->_adjustsTargetsOnContentOffsetChanges;
}

- (void)setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3
{
  self->_adjustsTargetsOnContentOffsetChanges = a3;
}

- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer
{
  return self->_environmentScrollableContainer;
}

- (void)setEnvironmentScrollableContainer:(id)a3
{
  objc_storeStrong((id *)&self->_environmentScrollableContainer, a3);
}

- (UIScrollViewDelegate)scrollDelegate
{
  return self->_scrollDelegate;
}

- (void)setScrollDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_scrollDelegate, a3);
}

- (CGPoint)startContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_startContentOffset.x;
  y = self->_startContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartContentOffset:(CGPoint)a3
{
  self->_startContentOffset = a3;
}

- (CGPoint)lastContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastContentOffset.x;
  y = self->_lastContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastContentOffset:(CGPoint)a3
{
  self->_lastContentOffset = a3;
}

- (CGPoint)lastRoundedOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastRoundedOffset.x;
  y = self->_lastRoundedOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastRoundedOffset:(CGPoint)a3
{
  self->_lastRoundedOffset = a3;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (double)convergenceRate
{
  return self->_convergenceRate;
}

- (void)setConvergenceRate:(double)a3
{
  self->_convergenceRate = a3;
}

- (CGPoint)lastVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastVelocity.x;
  y = self->_lastVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastVelocity:(CGPoint)a3
{
  self->_lastVelocity = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_scrollDelegate, 0);
  objc_storeStrong((id *)&self->_environmentScrollableContainer, 0);
}

@end
