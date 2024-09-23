@implementation _UIScreenRoutePickerViewController

- (_UIScreenRoutePickerViewController)init
{
  _UIScreenRoutePickerViewController *v2;
  _UIScreenRoutePickerViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIScreenRoutePickerViewController;
  v2 = -[UIViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
    -[_UIScreenRoutePickerViewController _commonInitWithCompletion:](v2, "_commonInitWithCompletion:", &__block_literal_global_285);
  return v3;
}

- (void)dealloc
{
  _UIResilientRemoteViewContainerViewController *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _UIResilientRemoteViewContainerViewController *v7;
  objc_super v8;
  _QWORD block[4];
  _UIResilientRemoteViewContainerViewController *v10;

  v3 = self->_childViewController;
  -[_UIResilientRemoteViewContainerViewController remoteViewController](v3, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidate");

  v6 = dispatch_time(0, 15000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___UIScreenRoutePickerViewController_dealloc__block_invoke;
  block[3] = &unk_1E16B1B28;
  v10 = v3;
  v7 = v3;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  v8.receiver = self;
  v8.super_class = (Class)_UIScreenRoutePickerViewController;
  -[UIViewController dealloc](&v8, sel_dealloc);
}

- (void)_commonInitWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_semaphore *v5;
  OS_dispatch_semaphore *remoteViewControllerSemaphore;
  void *v7;
  UIAlertController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIAlertController *alertController;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  remoteViewControllerSemaphore = self->_remoteViewControllerSemaphore;
  self->_remoteViewControllerSemaphore = v5;

  -[UIViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v8 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke;
  v23[3] = &unk_1E16CBA18;
  objc_copyWeak(&v24, &location);
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v8, "addAction:", v11);

  -[_UIScreenRoutePickerViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", -[UIViewController modalPresentationStyle](v8, "modalPresentationStyle"));
  -[UIViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", -[UIViewController modalTransitionStyle](v8, "modalTransitionStyle"));
  -[UIViewController transitioningDelegate](v8, "transitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", v12);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  alertController = self->_alertController;
  self->_alertController = v8;

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.UIKit.screenpicker"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v17 = v10;
  v18 = 3221225472;
  v19 = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_2;
  v20 = &unk_1E16CBA68;
  objc_copyWeak(&v22, &location);
  v15 = v4;
  v21 = v15;
  +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:completion:](_UIResilientRemoteViewContainerViewController, "instantiateWithExtension:completion:", v14, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIScreenRoutePickerViewController _setChildViewController:](self, "_setChildViewController:", v16, v17, v18, v19, v20);
  objc_msgSend(v16, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (_UIScreenRoutePickerViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerViewController;
  return -[UIViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_setChildViewController:(id)a3
{
  void *v5;
  _UIResilientRemoteViewContainerViewController *childViewController;
  UIAlertController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIViewController view](self->_childViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_childViewController, a3);
  childViewController = self->_childViewController;
  if (childViewController)
  {
    v7 = self->_alertController;
    -[UIAlertController setContentViewController:](v7, "setContentViewController:", childViewController);
    -[UIViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", self);
    -[UIViewController addChildViewController:](self, "addChildViewController:", v7);
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[UIViewController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
  }

}

- (id)remoteViewController
{
  return -[_UIResilientRemoteViewContainerViewController remoteViewController](self->_childViewController, "remoteViewController");
}

- (void)disconnectRoute
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setCurrentOutputDeviceEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke;
  v6[3] = &unk_1E16B1B78;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIScreenRoutePickerViewController;
  -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[UIViewController preferredContentSize](self->_childViewController, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v5;
  objc_super v7;

  if (self->_alertController)
  {
    -[UIAlertController _presentationControllerForPresentedController:presentingController:sourceController:](self->_alertController, "_presentationControllerForPresentedController:presentingController:sourceController:", a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIScreenRoutePickerViewController;
    -[UIViewController _presentationControllerForPresentedController:presentingController:sourceController:](&v7, sel__presentationControllerForPresentedController_presentingController_sourceController_, a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_containedAlertController
{
  return self->_alertController;
}

- (int64_t)modalPresentationStyle
{
  return -[UIViewController modalPresentationStyle](self->_alertController, "modalPresentationStyle");
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  -[UIAlertController setModalPresentationStyle:](self->_alertController, "setModalPresentationStyle:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerSemaphore, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
