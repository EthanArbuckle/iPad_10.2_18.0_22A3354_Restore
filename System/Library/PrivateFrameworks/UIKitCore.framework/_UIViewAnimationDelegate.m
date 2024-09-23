@implementation _UIViewAnimationDelegate

- (_UIViewAnimationDelegate)initWithCompletionBlock:(id)a3
{
  id v4;
  _UIViewAnimationDelegate *v5;
  void *v6;
  id completionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewAnimationDelegate;
  v5 = -[_UIViewAnimationDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    completionBlock = v5->_completionBlock;
    v5->_completionBlock = v6;

  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
