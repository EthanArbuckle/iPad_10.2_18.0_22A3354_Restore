@implementation SBCAAnimationBlockDelegate

- (void)animationDidStart:(id)a3
{
  void (**animationDidStartHandler)(id, id);
  id v5;

  animationDidStartHandler = (void (**)(id, id))self->_animationDidStartHandler;
  if (animationDidStartHandler)
  {
    animationDidStartHandler[2](animationDidStartHandler, a3);
    v5 = self->_animationDidStartHandler;
    self->_animationDidStartHandler = 0;

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**animationDidStopHandler)(id, id, BOOL);
  id v6;

  animationDidStopHandler = (void (**)(id, id, BOOL))self->_animationDidStopHandler;
  if (animationDidStopHandler)
  {
    animationDidStopHandler[2](animationDidStopHandler, a3, a4);
    v6 = self->_animationDidStopHandler;
    self->_animationDidStopHandler = 0;

  }
}

- (id)animationDidStartHandler
{
  return self->_animationDidStartHandler;
}

- (void)setAnimationDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)animationDidStopHandler
{
  return self->_animationDidStopHandler;
}

- (void)setAnimationDidStopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidStopHandler, 0);
  objc_storeStrong(&self->_animationDidStartHandler, 0);
}

@end
