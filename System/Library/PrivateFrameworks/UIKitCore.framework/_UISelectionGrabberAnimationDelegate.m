@implementation _UISelectionGrabberAnimationDelegate

+ (id)delegateWithCompletionBlock:(id)a3
{
  id v3;
  _UISelectionGrabberAnimationDelegate *v4;
  void *v5;
  id block;

  v3 = a3;
  v4 = objc_alloc_init(_UISelectionGrabberAnimationDelegate);
  v5 = _Block_copy(v3);

  block = v4->block;
  v4->block = v5;

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**block)(id, BOOL);

  block = (void (**)(id, BOOL))self->block;
  if (block)
    block[2](block, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->block, 0);
}

@end
