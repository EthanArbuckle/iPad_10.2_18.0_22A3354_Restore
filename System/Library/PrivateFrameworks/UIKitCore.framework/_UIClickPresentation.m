@implementation _UIClickPresentation

- (_UIClickPresentation)initWithPresentedViewController:(id)a3 presentationController:(id)a4
{
  id v7;
  id v8;
  _UIClickPresentation *v9;
  _UIClickPresentation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIClickPresentation;
  v9 = -[_UIClickPresentation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewController, a3);
    objc_storeStrong((id *)&v10->_presentationController, a4);
  }

  return v10;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

- (UIView)customContainerView
{
  return self->_customContainerView;
}

- (void)setCustomContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_customContainerView, a3);
}

- (UIView)customViewForTouchContinuation
{
  return self->_customViewForTouchContinuation;
}

- (void)setCustomViewForTouchContinuation:(id)a3
{
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, a3);
}

- (_UIClickPresentationTransition)appearanceTransition
{
  return self->_appearanceTransition;
}

- (void)setAppearanceTransition:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceTransition, a3);
}

- (_UIClickPresentationTransition)disappearanceTransition
{
  return self->_disappearanceTransition;
}

- (void)setDisappearanceTransition:(id)a3
{
  objc_storeStrong((id *)&self->_disappearanceTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disappearanceTransition, 0);
  objc_storeStrong((id *)&self->_appearanceTransition, 0);
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, 0);
  objc_storeStrong((id *)&self->_customContainerView, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (BOOL)_presentsSelf
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!objc_msgSend((id)UIApp, "_isSpringBoard"))
    return 0;
  -[_UIClickPresentation viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentation presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

@end
