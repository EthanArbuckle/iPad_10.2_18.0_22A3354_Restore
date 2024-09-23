@implementation WFWidgetConfigurationViewController

- (WFWidgetConfigurationViewController)initWithOptions:(id)a3
{
  id v4;
  WFWidgetConfigurationRequest *v5;
  WFWidgetConfigurationViewController *v6;

  v4 = a3;
  v5 = -[WFWidgetConfigurationRequest initWithOptions:]([WFWidgetConfigurationRequest alloc], "initWithOptions:", v4);

  v6 = -[WFWidgetConfigurationViewController initWithRequest:](self, "initWithRequest:", v5);
  return v6;
}

- (WFWidgetConfigurationViewController)initWithRequest:(id)a3
{
  id v5;
  WFWidgetConfigurationViewController *v6;
  WFWidgetConfigurationViewController *v7;
  WFWidgetConfigurationViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWidgetConfigurationViewController;
  v6 = -[WFWidgetConfigurationViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    -[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController](v7, "loadWidgetConfigurationRemoteViewController");
    v8 = v7;
  }

  return v7;
}

- (WFWidgetConfigurationView)configurationView
{
  void *v2;
  void *v3;
  void *v4;
  WFWidgetConfigurationView *v5;

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (void)loadView
{
  WFWidgetConfigurationLoadingContentViewController *v3;
  WFWidgetConfigurationLoadingContentViewController *loadingContentViewController;
  WFWidgetConfigurationCardContainerViewController *v5;
  void *v6;
  void *v7;
  WFWidgetConfigurationContainerViewControllerProtocol *v8;
  WFWidgetConfigurationContainerViewControllerProtocol *containerViewController;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WFWidgetConfigurationViewController;
  -[WFWidgetConfigurationViewController loadView](&v23, sel_loadView);
  v3 = objc_alloc_init(WFWidgetConfigurationLoadingContentViewController);
  loadingContentViewController = self->_loadingContentViewController;
  self->_loadingContentViewController = v3;

  v5 = [WFWidgetConfigurationCardContainerViewController alloc];
  -[WFWidgetConfigurationViewController request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationViewController loadingContentViewController](self, "loadingContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFWidgetConfigurationCardContainerViewController initWithRequest:contentViewController:](v5, "initWithRequest:contentViewController:", v6, v7);
  containerViewController = self->_containerViewController;
  self->_containerViewController = v8;

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationViewController addChildViewController:](self, "addChildViewController:", v10);

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWidgetConfigurationViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "setFrame:");

  -[WFWidgetConfigurationViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v12);

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", self);

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContainerDelegate:", self);

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSize");
  -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  -[WFWidgetConfigurationViewController request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widgetTintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTintColor:", v19);

  -[WFWidgetConfigurationViewController remoteViewController](self, "remoteViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[WFWidgetConfigurationViewController remoteViewController](self, "remoteViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationViewController installRemoteViewController:](self, "installRemoteViewController:", v22);

  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWidgetConfigurationViewController;
  -[WFWidgetConfigurationViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WFWidgetConfigurationViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[WFWidgetConfigurationViewController showErrorMessage](self, "showErrorMessage");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFWidgetConfigurationViewController extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationViewController extensionRequest](self, "extensionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelExtensionRequestWithIdentifier:", v4);

  v5.receiver = self;
  v5.super_class = (Class)WFWidgetConfigurationViewController;
  -[WFWidgetConfigurationViewController dealloc](&v5, sel_dealloc);
}

- (void)showErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFWidgetConfigurationViewController setRemoteViewController:extension:extensionRequest:](self, "setRemoteViewController:extension:extensionRequest:", 0, 0, 0);
  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[WFWidgetConfigurationViewController loadingContentViewController](self, "loadingContentViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringFromTable(CFSTR("Unable to Load"), CFSTR("WidgetConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showMessage:", v5);

}

- (void)loadWidgetConfigurationRemoteViewController
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[WFWidgetConfigurationViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWidgetConfigurationViewController request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke;
    v6[3] = &unk_24C5AB928;
    v6[4] = self;
    objc_msgSend(v4, "loadWidgetExtensionInformationWithCompletion:", v6);

  }
  else
  {
    getWFWidgetConfigurationLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]";
    }

  }
}

- (void)setRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5
{
  NSExtension *v9;
  NSCopying *v10;
  WFWidgetConfigurationRemoteViewController **p_remoteViewController;
  void *v12;
  NSExtension *extension;
  void *v15;
  void *v16;
  WFWidgetConfigurationRemoteViewController *v17;

  v17 = (WFWidgetConfigurationRemoteViewController *)a3;
  v9 = (NSExtension *)a4;
  v10 = (NSCopying *)a5;
  p_remoteViewController = &self->_remoteViewController;
  if (self->_remoteViewController != v17)
  {
    -[WFWidgetConfigurationViewController remoteViewController](self, "remoteViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willMoveToParentViewController:", 0);
    extension = self->_extension;
    if (extension != v9 || self->_extensionRequest != v10)
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
    -[WFWidgetConfigurationRemoteViewController setDelegate:](*p_remoteViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_extension, a4);
    objc_storeStrong((id *)&self->_extensionRequest, a5);
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    -[WFWidgetConfigurationRemoteViewController setDelegate:](*p_remoteViewController, "setDelegate:", self);
    if (!v17)
    {
      -[WFWidgetConfigurationViewController request](self, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultCardSize");
      -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
    if (-[WFWidgetConfigurationViewController isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(v12, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[WFWidgetConfigurationViewController installRemoteViewController:](self, "installRemoteViewController:", v17);
    }
    objc_msgSend(v12, "removeFromParentViewController");

  }
}

- (void)installRemoteViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
    -[WFWidgetConfigurationViewController addChildViewController:](self, "addChildViewController:", v4);
  getWFWidgetConfigurationLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315394;
    v13 = "-[WFWidgetConfigurationViewController installRemoteViewController:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEBUG, "%s Installing Widget Configuration Remote View Controller: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  -[WFWidgetConfigurationViewController configurationView](self, "configurationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overridingCardViewFrame");
  objc_msgSend(v4, "setConfigurationCardViewFrame:");

  -[WFWidgetConfigurationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSubview:atIndex:", v6, 0);

  -[WFWidgetConfigurationViewController containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
}

- (void)finishWithCurrentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFWidgetConfigurationViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    objc_msgSend(v3, "requestViewControllerDismissal");
  }
  else
  {
    -[WFWidgetConfigurationViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationViewController request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetConfigurationViewController:didFinishWithIntent:", self, v6);

  }
}

- (void)widgetConfigurationRemoteViewController:(id)a3 didReceiveConfiguredIntent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[WFWidgetConfigurationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFWidgetConfigurationViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetConfigurationViewController:didFinishWithIntent:", self, v8);

  }
}

- (void)widgetConfigurationRemoteViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  char v8;
  id v9;

  height = a4.height;
  width = a4.width;
  -[WFWidgetConfigurationViewController delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFWidgetConfigurationViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgetConfigurationViewController:preferredContentSizeDidChange:", self, width, height);

  }
}

- (WFWidgetConfigurationViewController)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFWidgetConfigurationViewController *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFWidgetConfigurationViewController initWithRequest:](self, "initWithRequest:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWidgetConfigurationViewController request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("request"));

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
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
  -[WFWidgetConfigurationViewController remoteViewController](self, "remoteViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16)
    goto LABEL_2;
  -[WFWidgetConfigurationViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v16, "preferredContentSize");
  v10 = v9;
  v12 = v11;

  if (v6 != v10 || v8 != v12)
  {
    objc_msgSend(v16, "preferredContentSize");
    -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    -[WFWidgetConfigurationViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WFWidgetConfigurationViewController delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredContentSize");
      objc_msgSend(v4, "widgetConfigurationViewController:preferredContentSizeDidChange:", self);
LABEL_2:

    }
  }

}

- (WFWidgetConfigurationViewControllerDelegate)delegate
{
  return (WFWidgetConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (WFWidgetConfigurationContainerViewControllerProtocol)containerViewController
{
  return self->_containerViewController;
}

- (WFWidgetConfigurationLoadingContentViewController)loadingContentViewController
{
  return self->_loadingContentViewController;
}

- (WFWidgetConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
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
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_loadingContentViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2;
  v6[3] = &unk_24C5ABBB0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    getWFWidgetConfigurationLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke_2";
      v35 = 2114;
      v36 = v3;
      _os_log_impl(&dword_20CE0F000, v2, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension Information error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "showErrorMessage");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isViewLoaded"))
    {
      objc_msgSend(*(id *)(a1 + 40), "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "widgetPrimaryColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_defaultWidgetConfigurationCardBackgroundColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 40), "containerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContainerBackgroundColor:", v6);

      if (!v5)
      objc_msgSend(*(id *)(a1 + 40), "containerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerBackgroundColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = WFCGColorPerceivedLightness((CGColor *)objc_msgSend(v9, "CGColor"));

      if (v10 > 0.7)
        v11 = 1;
      else
        v11 = 2;
      objc_msgSend(*(id *)(a1 + 40), "containerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceStyle");

      if (v15 != v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "containerViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setOverrideUserInterfaceStyle:", v11);

      }
      objc_msgSend(*(id *)(a1 + 40), "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "widgetTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v19);

    }
    v21 = *MEMORY[0x24BEC1778];
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v21, &v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v22)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v24 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_48;
      v30[3] = &unk_24C5AB888;
      objc_copyWeak(&v31, (id *)buf);
      objc_msgSend(v22, "setRequestCancellationBlock:", v30);
      v28[0] = v24;
      v28[1] = 3221225472;
      v28[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_3;
      v28[3] = &unk_24C5AB8B0;
      objc_copyWeak(&v29, (id *)buf);
      objc_msgSend(v22, "setRequestInterruptionBlock:", v28);
      v25[0] = v24;
      v25[1] = 3221225472;
      v25[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_53;
      v25[3] = &unk_24C5AB900;
      objc_copyWeak(&v27, (id *)buf);
      v26 = v22;
      objc_msgSend(v26, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "showErrorMessage");
    }

  }
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_48(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2_49;
  block[3] = &unk_24C5AB860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_4;
  block[3] = &unk_24C5AB860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_53(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFWidgetConfigurationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_INFO, "%s Loading Widget Extension succeed", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_55;
    v16[3] = &unk_24C5AB8D8;
    v16[4] = WeakRetained;
    v17 = v11;
    v18 = *(id *)(a1 + 32);
    v19 = v7;
    v14 = v11;
    objc_msgSend(v14, "startConfigurationWithRequest:completion:", v13, v16);

  }
  else
  {

    getWFWidgetConfigurationLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_20CE0F000, v15, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension failed with error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "showErrorMessage");
  }

}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_55(uint64_t a1, void *a2)
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
    getWFWidgetConfigurationLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension failed with error: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "showErrorMessage");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:extension:extensionRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFWidgetConfigurationLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_20CE0F000, v2, OS_LOG_TYPE_ERROR, "%s Extenstion extension connection was interrupted", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "showErrorMessage");
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2_49(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showErrorMessage");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
