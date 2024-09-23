@implementation _UIDynamicItemObservingBehavior

- (void)willMoveToAnimator:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[_UIDynamicItemObservingBehavior setEnabled:](self, "setEnabled:", 1);
  -[_UIDynamicItemObservingBehavior setFrameCount:](self, "setFrameCount:", 0);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___UIDynamicItemObservingBehavior_willMoveToAnimator___block_invoke;
  v5[3] = &unk_1E16B3F40;
  objc_copyWeak(&v6, &location);
  -[UIDynamicBehavior setAction:](self, "setAction:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)cancel
{
  -[UIDynamicBehavior setAction:](self, "setAction:", 0);
}

- (CGVector)targetVelocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_targetVelocity.dx;
  dy = self->_targetVelocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setTargetVelocity:(CGVector)a3
{
  self->_targetVelocity = a3;
}

- (double)completionHandlerInvocationDelay
{
  return self->_completionHandlerInvocationDelay;
}

- (void)setCompletionHandlerInvocationDelay:(double)a3
{
  self->_completionHandlerInvocationDelay = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
