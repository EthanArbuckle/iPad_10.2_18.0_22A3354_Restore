@implementation _UISimpleTransitioningDelegate

- (_UISimpleTransitioningDelegate)initWithAnimator:(id)a3
{
  id v5;
  _UISimpleTransitioningDelegate *v6;
  _UISimpleTransitioningDelegate *v7;
  _UISimpleTransitioningDelegate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISimpleTransitioningDelegate;
  v6 = -[_UISimpleTransitioningDelegate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animator, a3);
    v8 = v7;
  }

  return v7;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if (a4 == 1)
    return self->_animator;
  else
    return 0;
}

- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3
{
  return !self->__suppressCrossFadeNavigationBarAnimation;
}

- (BOOL)_suppressCrossFadeNavigationBarAnimation
{
  return self->__suppressCrossFadeNavigationBarAnimation;
}

- (void)_setSuppressCrossFadeNavigationBarAnimation:(BOOL)a3
{
  self->__suppressCrossFadeNavigationBarAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
