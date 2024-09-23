@implementation PKPaymentSetupDismissibleNavigationController

- (PKPaymentSetupDismissibleNavigationController)init
{

  return 0;
}

- (PKPaymentSetupDismissibleNavigationController)initWithContext:(int64_t)a3
{
  PKPaymentSetupDismissibleNavigationController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  result = -[PKNavigationController init](&v5, sel_init);
  if (result)
    result->_context = a3;
  return result;
}

- (void)dealloc
{
  PKUIFlowManagerRendererDelegate **p_flowDelegate;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  p_flowDelegate = &self->_flowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "rendererDidDisappearWithRenderer:", self);

  objc_storeWeak((id *)p_flowDelegate, 0);
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: Calling didCompleteFlow for Buddy", buf, 2u);
  }

  -[objc_class sharedInstance](_MergedGlobals_3(), "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  off_1EE4C0B20();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didCompleteFlow:", v7);

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  -[PKNavigationController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  -[PKNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  -[PKPaymentSetupDismissibleNavigationController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  -[PKPaymentSetupDismissibleNavigationController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[PKPaymentSetupDismissibleNavigationController isBeingDismissed](self, "isBeingDismissed"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(WeakRetained, "rendererDidDisappearWithRenderer:", self);

    objc_storeWeak((id *)&self->_flowDelegate, 0);
  }
}

- (void)_configureRootViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_configureRootViewController)
  {
    self->_configureRootViewController = 1;
    if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      -[PKPaymentSetupDismissibleNavigationController viewControllers](self, "viewControllers");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
      objc_msgSend(v4, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE522C48))
      {
        v10 = v5;
        v7 = (void *)MEMORY[0x1E0C99D20];
        v8 = v4;
        objc_msgSend(v7, "arrayWithObjects:count:", &v10, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_setLeftBarButtonItems:animated:", v9, 0, v10, v11);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v6, "setHidesBackButton:", 1);
            objc_msgSend(v6, "setLeftBarButtonItem:", v5);
            goto LABEL_9;
          }
        }
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel_cancelButtonPressed_);
        objc_msgSend(v6, "setHidesBackButton:", 1);
        objc_msgSend(v6, "setRightBarButtonItem:", v9);
      }

LABEL_9:
    }
  }
}

- (void)useStandardPlatformPresentationStyle
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](self, "setCustomFormSheetPresentationStyleForiPad");
  }
  else
  {
    -[PKPaymentSetupDismissibleNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", 3);
  }
}

- (void)cancelButtonPressed:(id)a3
{
  -[PKPaymentSetupDismissibleNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  objc_super v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PKPaymentSetupDismissibleNavigationController _configureRootViewController](self, "_configureRootViewController");
  PKPaymentSetupApplyContextAppearance(self->_context, v8);
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  -[PKNavigationController navigationController:willShowViewController:animated:](&v12, sel_navigationController_willShowViewController_animated_, v9, v8, v5);

  if ((-[PKPaymentSetupDismissibleNavigationController isModalInPresentation](self, "isModalInPresentation") & 1) == 0)
  {
    -[PKPaymentSetupDismissibleNavigationController viewControllers](self, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= 2)
      -[PKPaymentSetupDismissibleNavigationController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  char v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v4 = a3;
  v6 = a4;
  -[PKPaymentSetupDismissibleNavigationController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EE539050);
  v9 = v8;
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "viewWillDismissModalView");
  v13[1] = 3221225472;
  v13[2] = __90__PKPaymentSetupDismissibleNavigationController_dismissViewControllerAnimated_completion___block_invoke;
  v13[3] = &unk_1E3E66830;
  v16 = v9;
  v14 = v7;
  v15 = v6;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupDismissibleNavigationController;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v6;
  v11 = v7;
  -[PKPaymentSetupDismissibleNavigationController dismissViewControllerAnimated:completion:](&v12, sel_dismissViewControllerAnimated_completion_, v4, v13);

}

uint64_t __90__PKPaymentSetupDismissibleNavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "viewDidDismissModalView");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  char v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE50DDA0)
    && (v12 = objc_opt_respondsToSelector(), v13 = v10, (v12 & 1) != 0)
    || objc_msgSend(v11, "conformsToProtocol:", &unk_1EE50DDA0)
    && (v14 = objc_opt_respondsToSelector(), v13 = v11, (v14 & 1) != 0))
  {
    objc_msgSend(v13, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v9, a4, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)context
{
  return self->_context;
}

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  return (PKUIFlowManagerRendererDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowDelegate);
}

@end
