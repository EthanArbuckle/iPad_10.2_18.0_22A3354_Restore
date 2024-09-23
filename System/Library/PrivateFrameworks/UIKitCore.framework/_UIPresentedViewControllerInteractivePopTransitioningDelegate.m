@implementation _UIPresentedViewControllerInteractivePopTransitioningDelegate

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (void)setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_interactor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
