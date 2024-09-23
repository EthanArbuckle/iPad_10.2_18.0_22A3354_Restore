@implementation PDURootViewController

- (PDURootViewController)initWithApplicationIdentity:(id)a3 consentStore:(id)a4
{
  id v7;
  id v8;
  PDURootViewController *v9;
  PDURootViewController *v10;
  PDURootViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDURootViewController;
  v9 = -[PDURootViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationIdentity, a3);
    objc_storeStrong((id *)&v10->_consentStore, a4);
    v11 = v10;
  }

  return v10;
}

- (void)welcomeViewController:(id)a3 didDismissWithUserResponse:(unint64_t)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  -[PDURootViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (a4 > 2)
      v8 = 0;
    else
      v8 = qword_244A0D1C8[a4];
    -[PDURootViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootViewController:didDismissWithUserResponse:", self, v8);

    -[PDURootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_showWelcomeViewIfNeeded
{
  UIViewController *v3;
  UIViewController *welcomeViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_welcomeViewController)
  {
    PDUWelcomeViewControllerForApplicationWithConsentStore(self->_applicationIdentity, self, self->_consentStore);
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    welcomeViewController = self->_welcomeViewController;
    self->_welcomeViewController = v3;

    -[UIViewController view](self->_welcomeViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDURootViewController addChildViewController:](self, "addChildViewController:", self->_welcomeViewController);
    -[PDURootViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[UIViewController didMoveToParentViewController:](self->_welcomeViewController, "didMoveToParentViewController:", self);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDURootViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    objc_msgSend(v5, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDURootViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(v5, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDURootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v10;
    objc_msgSend(v5, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDURootViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

  }
}

+ (BOOL)deviceIsPad
{
  if (deviceIsPad_onceToken != -1)
    dispatch_once(&deviceIsPad_onceToken, &__block_literal_global_1);
  return deviceIsPad_isPad;
}

uint64_t __36__PDURootViewController_deviceIsPad__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsPad_isPad = (_DWORD)result == 3;
  return result;
}

+ (unint64_t)preferredOrientation
{
  if (objc_msgSend(a1, "deviceIsPad"))
    return 30;
  else
    return 2;
}

- (void)_presentWelcomeViewIfNeeded
{
  UIViewController *v3;
  UIViewController *welcomeViewController;
  uint64_t v5;

  if (!self->_welcomeViewController)
  {
    PDUWelcomeViewControllerForApplicationWithConsentStore(self->_applicationIdentity, self, self->_consentStore);
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    welcomeViewController = self->_welcomeViewController;
    self->_welcomeViewController = v3;

    if (objc_msgSend((id)objc_opt_class(), "deviceIsPad"))
      v5 = 2;
    else
      v5 = 5;
    -[UIViewController setModalPresentationStyle:](self->_welcomeViewController, "setModalPresentationStyle:", v5);
    -[UIViewController setModalInPresentation:](self->_welcomeViewController, "setModalInPresentation:", 1);
    -[PDURootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_welcomeViewController, 0, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PDURootViewController _presentWelcomeViewIfNeeded](self, "_presentWelcomeViewIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)PDURootViewController;
  -[PDURootViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PDURootViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController:didDismissWithUserResponse:", self, 3);

  v6.receiver = self;
  v6.super_class = (Class)PDURootViewController;
  -[PDURootViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PDURootViewControllerDelegate)delegate
{
  return (PDURootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_consentStore, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_welcomeViewController, 0);
}

@end
