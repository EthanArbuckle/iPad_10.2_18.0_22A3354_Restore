@implementation THTransitionView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTransitionView;
  -[THTransitionView dealloc](&v3, "dealloc");
}

- (void)beginTransition
{
  -[THTransitionViewDelegate transitionWillBegin:](-[THTransitionView delegate](self, "delegate"), "transitionWillBegin:", self);
  objc_msgSend(-[THTransitionView window](self, "window"), "setUserInteractionEnabled:", 0);
}

- (void)transitionDidFinish
{
  -[THTransitionView transitionDidFinishShouldRemoveFromSuperview:](self, "transitionDidFinishShouldRemoveFromSuperview:", 1);
}

- (void)transitionDidFinishShouldRemoveFromSuperview:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  objc_msgSend(-[THTransitionView window](self, "window"), "setUserInteractionEnabled:", 1);
  if (v3)
    -[THTransitionView removeFromSuperview](self, "removeFromSuperview");
  -[THTransitionViewDelegate transitionDidFinish:](-[THTransitionView delegate](self, "delegate"), "transitionDidFinish:", self);
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THTransitionViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THTransitionViewDelegate *)a3;
}

@end
