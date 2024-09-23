@implementation PKUIAnimationDelegate

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKUIAnimationDelegate;
  -[PKUIAnimationDelegate dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
}

- (void)setDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)animationDidStart:(id)a3
{
  id didStartHandler;
  id v5;
  void (**v6)(void);

  didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    v6 = (void (**)(void))_Block_copy(didStartHandler);
    v5 = self->_didStartHandler;
    self->_didStartHandler = 0;

    v6[2]();
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id completionHandler;
  _BOOL8 v6;
  id v7;
  void (**v8)(id, _BOOL8);

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v6 = a4;
    v8 = (void (**)(id, _BOOL8))_Block_copy(completionHandler);
    v7 = self->_completionHandler;
    self->_completionHandler = 0;

    v8[2](v8, v6);
  }
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
