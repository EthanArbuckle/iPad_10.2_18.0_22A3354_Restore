@implementation _UIResilientRemoteViewContainerViewController

- (CGRect)_defaultInitialViewFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIViewController _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!__SplashBoardOverrideStatusBarOrientation)
    objc_msgSend((id)UIApp, "_safeInterfaceOrientationForNoWindow");
  objc_msgSend(v2, "_boundsForInterfaceOrientation:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (id)instantiateWithExtension:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtension:completion:", v7, v6);

  return v8;
}

- (_UIResilientRemoteViewContainerViewController)initWithExtension:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _UIResilientRemoteViewContainerViewController *v8;
  _UIResilientRemoteViewContainerViewController *v9;
  _UIWaitingForRemoteViewContainerViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  v8 = -[UIViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[_UIResilientRemoteViewContainerViewController setExtension:](v8, "setExtension:", v6);
    v10 = objc_alloc_init(_UIWaitingForRemoteViewContainerViewController);
    -[_UIResilientRemoteViewContainerViewController setWaitingController:](v9, "setWaitingController:", v10);

    -[_UIResilientRemoteViewContainerViewController waitingController](v9, "waitingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIResilientRemoteViewContainerViewController setContainedViewController:](v9, "setContainedViewController:", v11);

    if (v6)
    {
      -[UIViewController _beginDelayingPresentation:cancellationHandler:](v9, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
      objc_initWeak(&location, v9);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78___UIResilientRemoteViewContainerViewController_initWithExtension_completion___block_invoke;
      v17[3] = &unk_1E16C0468;
      objc_copyWeak(&v19, &location);
      v18 = v7;
      objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x1E0C9AA60], v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      _UINSLocalizedStringWithDefaultValue(CFSTR("The requested app extension could not be found"), CFSTR("The requested app extension could not be found"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIResilientRemoteViewContainerViewController _displayError:](v9, "_displayError:", v15);
    }
  }

  return v9;
}

- (void)_displayRemoteViewController
{
  -[_UIResilientRemoteViewContainerViewController setWaitingController:](self, "setWaitingController:", 0);
  -[_UIResilientRemoteViewContainerViewController setContainedViewController:](self, "setContainedViewController:", self->_remoteViewController);
  -[UIViewController preferredContentSize](self->_remoteViewController, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)delayDisplayOfRemoteController
{
  self->_delayingDisplayOfRemoteView = 1;
}

- (void)endDelayingDisplayOfRemoteController
{
  if (self->_delayingDisplayOfRemoteView)
    -[_UIResilientRemoteViewContainerViewController _displayRemoteViewController](self, "_displayRemoteViewController");
  self->_delayingDisplayOfRemoteView = 0;
}

- (void)setContainedViewController:(id)a3
{
  UIViewController **p_containedViewController;
  UIViewController *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;
  id v12;

  v12 = a3;
  p_containedViewController = &self->_containedViewController;
  v6 = self->_containedViewController;
  objc_storeStrong((id *)&self->_containedViewController, a3);
  -[UIViewController preferredContentSize](self->_containedViewController, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_containedViewController);
  v7 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3) - 1;
  if (v7 <= 1)
  {
    -[UIViewController beginAppearanceTransition:animated:](*p_containedViewController, "beginAppearanceTransition:animated:", 1, 0);
    -[UIViewController beginAppearanceTransition:animated:](v6, "beginAppearanceTransition:animated:", 0, 0);
  }
  -[UIViewController willMoveToParentViewController:](v6, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](v6, "removeFromParentViewController");
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](*p_containedViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[UIViewController view](v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  v11 = *p_containedViewController;
  if (v7 > 1)
  {
    -[UIViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
  }
  else
  {
    -[UIViewController endAppearanceTransition](v11, "endAppearanceTransition");
    -[UIViewController didMoveToParentViewController:](*p_containedViewController, "didMoveToParentViewController:", self);
    -[UIViewController endAppearanceTransition](v6, "endAppearanceTransition");
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  -[UIViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIViewController view](self->_containedViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)dealloc
{
  objc_super v3;

  -[_UIResilientRemoteViewContainerViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  -[UIViewController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSCopying *extensionRequestIdentifier;

  if (self->_extensionRequestIdentifier)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    extensionRequestIdentifier = self->_extensionRequestIdentifier;
    self->_extensionRequestIdentifier = 0;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  -[UIViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[_UIResilientRemoteViewContainerViewController errorViewController](self, "errorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIResilientRemoteViewContainerViewController errorViewController](self, "errorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)_displayError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  _UINSLocalizedStringWithDefaultValue(CFSTR("Internal error"), CFSTR("Internal error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___UIResilientRemoteViewContainerViewController__displayError___block_invoke;
  v11[3] = &unk_1E16B3EC8;
  v11[4] = self;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v9);

  -[UIViewController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  else
    -[_UIResilientRemoteViewContainerViewController setErrorViewController:](self, "setErrorViewController:", v7);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIResilientRemoteViewContainerViewController;
  -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[UIViewController preferredContentSize](self->_containedViewController, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)remoteViewController
{
  return self->_remoteViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (UIViewController)containedViewController
{
  return self->_containedViewController;
}

- (_UIWaitingForRemoteViewContainerViewController)waitingController
{
  return self->_waitingController;
}

- (void)setWaitingController:(id)a3
{
  objc_storeStrong((id *)&self->_waitingController, a3);
}

- (UIViewController)errorViewController
{
  return self->_errorViewController;
}

- (void)setErrorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_errorViewController, a3);
}

- (BOOL)delayingDisplayOfRemoteView
{
  return self->_delayingDisplayOfRemoteView;
}

- (void)setDelayingDisplayOfRemoteView:(BOOL)a3
{
  self->_delayingDisplayOfRemoteView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_waitingController, 0);
  objc_storeStrong((id *)&self->_containedViewController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
