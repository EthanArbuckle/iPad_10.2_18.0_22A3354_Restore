@implementation WFFocusConfigurationViewController

- (WFFocusConfigurationViewController)initWithOptions:(id)a3
{
  id v4;
  WFFocusConfigurationRequest *v5;
  WFFocusConfigurationViewController *v6;

  v4 = a3;
  v5 = -[WFFocusConfigurationRequest initWithOptions:]([WFFocusConfigurationRequest alloc], "initWithOptions:", v4);

  v6 = -[WFFocusConfigurationViewController initWithRequest:](self, "initWithRequest:", v5);
  return v6;
}

- (WFFocusConfigurationViewController)initWithContextualActionOptions:(id)a3
{
  id v4;
  WFFocusConfigurationRequest *v5;
  WFFocusConfigurationViewController *v6;

  v4 = a3;
  v5 = -[WFFocusConfigurationRequest initWithContextualActionOptions:]([WFFocusConfigurationRequest alloc], "initWithContextualActionOptions:", v4);

  v6 = -[WFFocusConfigurationViewController initWithRequest:](self, "initWithRequest:", v5);
  return v6;
}

- (WFFocusConfigurationViewController)initWithRequest:(id)a3
{
  id v5;
  WFFocusConfigurationViewController *v6;
  WFFocusConfigurationViewController *v7;
  WFFocusConfigurationViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFocusConfigurationViewController;
  v6 = -[WFFocusConfigurationViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    -[WFFocusConfigurationViewController loadFocusConfigurationUI](v7, "loadFocusConfigurationUI");
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFFocusConfigurationViewController extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController extensionRequest](self, "extensionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelExtensionRequestWithIdentifier:", v4);

  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationViewController;
  -[WFFocusConfigurationViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationViewController;
  -[WFFocusConfigurationViewController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)WFFocusConfigurationViewController;
  -[WFFocusConfigurationViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[WFFocusConfigurationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFFocusConfigurationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "startAnimating");
  -[WFFocusConfigurationViewController setActivityIndicator:](self, "setActivityIndicator:", v4);
  v15 = (void *)MEMORY[0x24BDD1628];
  -[WFFocusConfigurationViewController activityIndicator](self, "activityIndicator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  -[WFFocusConfigurationViewController activityIndicator](self, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (void)loadFocusConfigurationUI
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  _QWORD aBlock[5];
  BOOL v16;

  -[WFFocusConfigurationViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke;
  aBlock[3] = &unk_24C5AB970;
  aBlock[4] = self;
  v16 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFFocusConfigurationViewController request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isHidden"))
  {
    if (objc_msgSend(v11, "isLocked"))
    {
      objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_3;
      v13[3] = &unk_24C5AB1F8;
      v13[4] = self;
      v14 = v7;
      objc_msgSend(v12, "authenticateForSubject:completion:", v11, v13);

      goto LABEL_6;
    }

LABEL_8:
    v7[2](v7);
    goto LABEL_9;
  }
  -[WFFocusConfigurationViewController showErrorMessage:](self, "showErrorMessage:", 0);
LABEL_6:

LABEL_9:
}

- (void)loadFocusConfigurationRemoteViewController
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BEC1750];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke;
    v12[3] = &unk_24C5AB888;
    objc_copyWeak(&v13, (id *)location);
    objc_msgSend(v4, "setRequestCancellationBlock:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_3;
    v10[3] = &unk_24C5AB8B0;
    objc_copyWeak(&v11, (id *)location);
    objc_msgSend(v4, "setRequestInterruptionBlock:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_50;
    v8[3] = &unk_24C5AB248;
    objc_copyWeak(&v9, (id *)location);
    objc_msgSend(v4, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    getWFFocusConfigurationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]";
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_20CE0F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to load a Focus Filter Extension: %{public}@", location, 0x16u);
    }

    -[WFFocusConfigurationViewController showErrorMessage:](self, "showErrorMessage:", v5);
  }

}

- (void)clearAllViews
{
  void *v3;

  -[WFFocusConfigurationViewController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[WFFocusConfigurationViewController setActivityIndicator:](self, "setActivityIndicator:", 0);
}

- (void)showErrorMessage:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFFocusConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WFFocusConfigurationViewController showErrorMessage:]";
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_ERROR, "%s Failing with error %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WFFocusConfigurationViewController_showErrorMessage___block_invoke;
  block[3] = &unk_24C5ABB88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)embedRemoteViewController:(id)a3 withExtension:(id)a4 extensionRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  -[WFFocusConfigurationViewController remoteViewController](self, "remoteViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v18)
    goto LABEL_9;
  -[WFFocusConfigurationViewController remoteViewController](self, "remoteViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "willMoveToParentViewController:", 0);
  -[WFFocusConfigurationViewController extension](self, "extension");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v8)
  {

LABEL_5:
    -[WFFocusConfigurationViewController extension](self, "extension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFocusConfigurationViewController extensionRequest](self, "extensionRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelExtensionRequestWithIdentifier:", v15);

    goto LABEL_6;
  }
  -[WFFocusConfigurationViewController extensionRequest](self, "extensionRequest");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v9)
    goto LABEL_5;
LABEL_6:
  -[WFFocusConfigurationViewController remoteViewController](self, "remoteViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", 0);

  -[WFFocusConfigurationViewController setExtension:](self, "setExtension:", v8);
  -[WFFocusConfigurationViewController setExtensionRequest:](self, "setExtensionRequest:", v9);
  -[WFFocusConfigurationViewController setRemoteViewController:](self, "setRemoteViewController:", v18);
  -[WFFocusConfigurationViewController remoteViewController](self, "remoteViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  if (-[WFFocusConfigurationViewController isViewLoaded](self, "isViewLoaded"))
    -[WFFocusConfigurationViewController installRemoteViewController:](self, "installRemoteViewController:", v18);
  objc_msgSend(v11, "removeFromParentViewController");

LABEL_9:
}

- (void)installRemoteViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  WFFocusConfigurationViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[WFFocusConfigurationViewController addChildViewController:](self, "addChildViewController:", v4);
    -[WFFocusConfigurationViewController clearAllViews](self, "clearAllViews");
  }
  getWFFocusConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[WFFocusConfigurationViewController installRemoteViewController:]";
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEBUG, "%s Installing Focus Filter Remote View Controller: %@", buf, 0x16u);
  }

  -[WFFocusConfigurationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  objc_msgSend(v4, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFFocusConfigurationViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v32 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v37;
  objc_msgSend(v4, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v31;
  objc_msgSend(v4, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v21;
  objc_msgSend(v4, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v29 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v27);

  objc_msgSend(v4, "didMoveToParentViewController:", v29);
}

- (void)notifyDelegateWithUIState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  -[WFFocusConfigurationViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[WFFocusConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "focusConfigurationViewController:configurationUIStateDidChange:", self, v12);
LABEL_8:

    goto LABEL_9;
  }
  v8 = objc_opt_respondsToSelector();

  -[WFFocusConfigurationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v12, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "focusConfigurationViewController:didUpdateConfigurationWithAction:displayRepresentation:", self, v9, v10);

LABEL_7:
    goto LABEL_8;
  }
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[WFFocusConfigurationViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "focusConfigurationViewController:didUpdateConfigurationWithAction:", self, v9);
    goto LABEL_7;
  }
LABEL_9:

}

- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  -[WFFocusConfigurationViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFFocusConfigurationViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusConfigurationViewController:didPressButtonWithIdentifier:cellFrame:", self, v12, x, y, width, height);

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  char v15;
  id v16;

  v16 = a3;
  -[WFFocusConfigurationViewController remoteViewController](self, "remoteViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16)
    goto LABEL_2;
  -[WFFocusConfigurationViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v16, "preferredContentSize");
  v10 = v9;
  v12 = v11;

  if (v6 != v10 || v8 != v12)
  {
    objc_msgSend(v16, "preferredContentSize");
    -[WFFocusConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    -[WFFocusConfigurationViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WFFocusConfigurationViewController delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredContentSize");
      objc_msgSend(v4, "focusConfigurationViewController:preferredContentSizeDidChange:", self);
LABEL_2:

    }
  }

}

- (void)focusConfigurationRemoteViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
  -[WFFocusConfigurationViewController notifyDelegateWithUIState:](self, "notifyDelegateWithUIState:", a4);
}

- (void)focusConfigurationRemoteViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  -[WFFocusConfigurationViewController notifyDelegateWithPressedButtonIdentifier:cellFrame:](self, "notifyDelegateWithPressedButtonIdentifier:cellFrame:", a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (WFFocusConfigurationViewControllerDelegate)delegate
{
  return (WFFocusConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFFocusConfigurationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (WFFocusConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIStackView)errorStackView
{
  return self->_errorStackView;
}

- (void)setErrorStackView:(id)a3
{
  objc_storeStrong((id *)&self->_errorStackView, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequest
{
  return self->_extensionRequest;
}

- (void)setExtensionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_errorStackView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__WFFocusConfigurationViewController_showErrorMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Could not load Focus Filter"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithPaletteColors:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", (uint64_t)*MEMORY[0x24BEBB608], 3, 60.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "configurationByApplyingConfiguration:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v25, "setImage:", v26);
  v5 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v5, "setText:", v27);
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(*(id *)(a1 + 32), "clearAllViews");
  v8 = objc_alloc(MEMORY[0x24BEBD978]);
  v32[0] = v25;
  v32[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArrangedSubviews:", v9);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setAxis:", 1);
  objc_msgSend(v10, "setSpacing:", 25.0);
  objc_msgSend(v10, "setDistribution:", 0);
  objc_msgSend(v10, "setAlignment:", 3);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setErrorStackView:", v10);
  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  objc_msgSend(v10, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutMarginsGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_2;
  v6[3] = &unk_24C5AB590;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v8);
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_4;
  block[3] = &unk_24C5AB860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_50(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v6;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFFocusConfigurationLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      _os_log_impl(&dword_20CE0F000, v10, OS_LOG_TYPE_INFO, "%s Loading Focus Extension succeeded", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_52;
    v14[3] = &unk_24C5AB220;
    v14[4] = WeakRetained;
    v15 = v9;
    v12 = v9;
    objc_msgSend(v12, "startConfigurationWithRequest:completion:", v11, v14);

  }
  else
  {

    getWFFocusConfigurationLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_20CE0F000, v13, OS_LOG_TYPE_ERROR, "%s Loading Focus Extension failed with error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "showErrorMessage:", v7);
  }

}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFFocusConfigurationLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start configuration with error: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "showErrorMessage:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "embedRemoteViewController:withExtension:extensionRequest:", *(_QWORD *)(a1 + 40), 0, 0);
  }

}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFFocusConfigurationLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_20CE0F000, v2, OS_LOG_TYPE_ERROR, "%s Extension connection was interrupted", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "showErrorMessage:", 0);
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showErrorMessage:", *(_QWORD *)(a1 + 32));

}

void __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_2;
  v3[3] = &unk_24C5AB1D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "loadFocusActionWithCompletion:", v3);

}

uint64_t __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "showErrorMessage:");
}

void __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  WFFocusConfigurationUIState *v4;
  void *v5;
  void *v6;
  WFFocusConfigurationUIState *v7;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "showErrorMessage:", a2);
  }
  else
  {
    objc_msgSend(v3, "loadFocusConfigurationRemoteViewController");
    if (*(_BYTE *)(a1 + 40))
    {
      v4 = [WFFocusConfigurationUIState alloc];
      objc_msgSend(*(id *)(a1 + 32), "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "action");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WFFocusConfigurationUIState initWithEnabled:uiValidity:action:displayRepresentation:](v4, "initWithEnabled:uiValidity:action:displayRepresentation:", 1, 1, v6, 0);

      objc_msgSend(*(id *)(a1 + 32), "notifyDelegateWithUIState:", v7);
    }
  }
}

@end
