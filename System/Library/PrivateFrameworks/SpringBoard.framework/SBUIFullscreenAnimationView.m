@implementation SBUIFullscreenAnimationView

- (void)_animationBegan
{
  self->_animating = 1;
}

- (void)_animationEnded
{
  self->_animating = 0;
}

- (void)_notifyDelegateAnimationBeganWithDuration:(double)a3 delay:(double)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appTransitionView:animationWillStartWithDuration:afterDelay:", self, a3, a4);

}

- (void)_notifyDelegateThatAnimationIsDone
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appTransitionViewAnimationDidStop:", self);

}

- (SBUIFullscreenAnimationViewDelegate)delegate
{
  return (SBUIFullscreenAnimationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
