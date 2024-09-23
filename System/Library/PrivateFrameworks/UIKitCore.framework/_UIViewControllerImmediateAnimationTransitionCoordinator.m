@implementation _UIViewControllerImmediateAnimationTransitionCoordinator

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *);
  void (**v10)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *);

  v8 = a3;
  v9 = (void (**)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *))a4;
  v10 = (void (**)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *))a5;
  if (v9)
    v9[2](v9, self);
  if (v10)
    v10[2](v10, self);

  return 1;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[_UIViewControllerImmediateAnimationTransitionCoordinator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
}

- (BOOL)isInteractive
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (_UIViewControllerImmediateAnimationTransitionCoordinator)initWithContainerView:(id)a3
{
  id v4;
  _UIViewControllerImmediateAnimationTransitionCoordinator *v5;
  UIView *v6;
  UIView *containerView;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerImmediateAnimationTransitionCoordinator;
  v5 = -[_UIViewControllerImmediateAnimationTransitionCoordinator init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (UIView *)v4;
    else
      v6 = objc_alloc_init(UIView);
    containerView = v5->_containerView;
    v5->_containerView = v6;

  }
  return v5;
}

- (BOOL)isCancelled
{
  return 0;
}

- (BOOL)isAnimated
{
  return 0;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (double)percentComplete
{
  return 1.0;
}

- (double)completionVelocity
{
  return 0.0;
}

- (int64_t)completionCurve
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

@end
