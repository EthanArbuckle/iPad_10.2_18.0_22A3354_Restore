@implementation _UIRootPresentationController

- (UIWindow)presentingWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_presentingWindow);
}

- (int)_preferredStatusBarVisibility
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters
{
  return 0;
}

- (BOOL)_isRootPresentation
{
  return 1;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  return (id)objc_msgSend(a3, "styleForRootPresentationController:", self);
}

+ (BOOL)_allowsDeferredTransitions
{
  return 0;
}

- (_UIRootPresentationController)initWithPresentedViewController:(id)a3 presentingWindow:(id)a4
{
  id v6;
  _UIRootPresentationController *v7;
  _UIRootPresentationController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIRootPresentationController;
  v7 = -[UISheetPresentationController initWithPresentedViewController:presentingViewController:](&v10, sel_initWithPresentedViewController_presentingViewController_, a3, 0);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_presentingWindow, v6);

  return v8;
}

- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController
{
  return self->__shouldDisableAppearanceCallbacksForPresentedViewController;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIRootPresentationController;
  v6 = a4;
  -[UIPresentationController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91___UIRootPresentationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E16B2150;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingWindow);
}

- (id)_transitionCoordinator
{
  return 0;
}

- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters
{
  return 0;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)set_shouldDisableAppearanceCallbacksForPresentedViewController:(BOOL)a3
{
  self->__shouldDisableAppearanceCallbacksForPresentedViewController = a3;
}

@end
