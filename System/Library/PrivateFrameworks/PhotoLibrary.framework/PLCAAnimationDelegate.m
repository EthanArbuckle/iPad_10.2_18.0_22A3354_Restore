@implementation PLCAAnimationDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCAAnimationDelegate;
  -[PLCAAnimationDelegate dealloc](&v3, sel_dealloc);
}

- (void)animationDidStart:(id)a3
{
  if (-[PLCAAnimationDelegate start](self, "start", a3))
    (*(void (**)(void))(-[PLCAAnimationDelegate start](self, "start") + 16))();
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(id, _BOOL8);

  v4 = a4;
  if (-[PLCAAnimationDelegate completion](self, "completion", a3))
  {
    v6 = -[PLCAAnimationDelegate completion](self, "completion");
    v6[2](v6, v4);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
