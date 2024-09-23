@implementation PKExplanationViewController

- (PKExplanationViewController)init
{
  return -[PKExplanationViewController initWithContext:](self, "initWithContext:", 0);
}

- (PKExplanationViewController)initWithContext:(int64_t)a3
{
  PKExplanationViewController *v4;
  PKExplanationViewController *v5;
  PKExplanationView *v6;
  PKExplanationView *explanationView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKExplanationViewController;
  v4 = -[PKExplanationViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = -[PKExplanationView initWithContext:delegate:]([PKExplanationView alloc], "initWithContext:delegate:", v4->_context, v4);
    explanationView = v5->_explanationView;
    v5->_explanationView = v6;

    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v5, "setPrivacyLinkController:", v8);

    -[PKExplanationViewController navigationItem](v5, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v9, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    -[PKExplanationViewController setShowCancelButton:](v5, "setShowCancelButton:", 1);
    -[PKExplanationViewController setShowDoneButton:](v5, "setShowDoneButton:", 0);

  }
  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExplanationViewController;
  -[PKExplanationViewController loadView](&v5, sel_loadView);
  -[PKExplanationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "addSubview:", self->_explanationView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (id)contentScrollView
{
  return -[PKExplanationView scrollView](self->_explanationView, "scrollView");
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKExplanationViewController;
  -[PKExplanationViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  -[PKExplanationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  -[PKExplanationView setFrame:](self->_explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
  -[PKExplanationView scrollView](self->_explanationView, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v15);

}

- (void)_cancelPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewControllerDidSelectCancel:", self);
  else
    -[PKExplanationViewController _dismissViewController](self, "_dismissViewController");

}

- (void)_donePressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "explanationViewControllerDidSelectDone:", self);
  else
    -[PKExplanationViewController _dismissViewController](self, "_dismissViewController");

}

- (void)_dismissViewController
{
  -[PKExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setShowDoneButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_showDoneButton = a3;
  if (a3)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68128]);
    -[PKExplanationViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", v5);

  }
  else
  {
    -[PKExplanationViewController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }

}

- (void)setShowCancelButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_showCancelButton = a3;
  if (a3)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CD8]);
    -[PKExplanationViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v5);

  }
  else
  {
    -[PKExplanationViewController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", 0);
  }

}

- (void)setShowCloseButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_showCloseButton = a3;
  -[PKExplanationViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_showCloseButton)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelPressed);
  else
    v4 = 0;
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  if (self->_prefersCloseButtonOnLeft)
    objc_msgSend(v5, "setLeftBarButtonItem:", v4);
  else
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)setPrefersCloseButtonOnLeft:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_prefersCloseButtonOnLeft != a3)
  {
    self->_prefersCloseButtonOnLeft = a3;
    if (self->_showCloseButton)
    {
      -[PKExplanationViewController navigationItem](self, "navigationItem");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelPressed);
      if (self->_prefersCloseButtonOnLeft)
      {
        objc_msgSend(v5, "setRightBarButtonItem:", 0);
        objc_msgSend(v5, "setLeftBarButtonItem:", v4);
      }
      else
      {
        objc_msgSend(v5, "setLeftBarButtonItem:", 0);
        objc_msgSend(v5, "setRightBarButtonItem:", v4);
      }

    }
  }
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *hiddenRightBarButtonItem;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  _BOOL8 wasBackHidden;
  UIActivityIndicatorView *v17;
  UIActivityIndicatorView *activityIndicatorView;
  UIBarButtonItem *v19;
  UIBarButtonItem *spinningItem;
  id v21;

  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    v4 = !a3;
    -[PKExplanationViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKExplanationViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v8;

    objc_msgSend(v21, "setUserInteractionEnabled:", v4);
    -[PKExplanationView dockView](self->_explanationView, "dockView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setButtonsEnabled:", v4);

    -[PKExplanationViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (self->_showingSpinner)
    {
      self->_wasBackHidden = objc_msgSend(v10, "hidesBackButton");
      objc_msgSend(v11, "rightBarButtonItem");
      v12 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v12;

      if (!self->_spinningItem)
      {
        v17 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v17;

        v19 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicatorView);
        spinningItem = self->_spinningItem;
        self->_spinningItem = v19;

      }
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      objc_msgSend(v11, "setRightBarButtonItem:", self->_spinningItem);
      wasBackHidden = 1;
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
      objc_msgSend(v11, "rightBarButtonItem");
      v14 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      v15 = self->_spinningItem;

      if (v14 == v15)
        objc_msgSend(v11, "setRightBarButtonItem:", self->_hiddenRightBarButtonItem);
      wasBackHidden = self->_wasBackHidden;
    }
    objc_msgSend(v11, "setHidesBackButton:", wasBackHidden);
    -[PKExplanationViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v4);
    objc_msgSend(v21, "setNeedsLayout");

  }
}

- (void)showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_showingSpinner != a3)
  {
    v3 = a3;
    -[PKExplanationView dockView](self->_explanationView, "dockView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      self->_showingSpinner = v3;
      objc_msgSend(v6, "setButtonsEnabled:", v3 ^ 1);
      objc_msgSend(v5, "setShowSpinner:", v3);
    }
    else
    {
      -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", v3);
    }

  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKExplanationViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKExplanationViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)setPrivacyLinkController:(id)a3
{
  OBPrivacyLinkController **p_privacyLinkController;
  void *v6;
  id v7;

  p_privacyLinkController = &self->_privacyLinkController;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (*p_privacyLinkController)
    {
      -[OBPrivacyLinkController willMoveToParentViewController:](*p_privacyLinkController, "willMoveToParentViewController:", 0);
      -[OBPrivacyLinkController view](*p_privacyLinkController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      -[OBPrivacyLinkController removeFromParentViewController](*p_privacyLinkController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_privacyLinkController, a3);
    if (*p_privacyLinkController)
      -[PKExplanationViewController addChildViewController:](self, "addChildViewController:");
    -[PKExplanationView setPrivacyLink:](self->_explanationView, "setPrivacyLink:");
    -[OBPrivacyLinkController didMoveToParentViewController:](*p_privacyLinkController, "didMoveToParentViewController:", self);
  }

}

- (unint64_t)paymentSetupMarker
{
  return 2;
}

- (BOOL)paymentSetupMarkerRemovalIsInclusive
{
  return 1;
}

- (PKExplanationViewControllerDelegate)explanationViewControllerDelegate
{
  return (PKExplanationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_explanationViewControllerDelegate);
}

- (void)setExplanationViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_explanationViewControllerDelegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (BOOL)prefersCloseButtonOnLeft
{
  return self->_prefersCloseButtonOnLeft;
}

- (PKExplanationView)explanationView
{
  return self->_explanationView;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_destroyWeak((id *)&self->_explanationViewControllerDelegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningItem, 0);
}

@end
