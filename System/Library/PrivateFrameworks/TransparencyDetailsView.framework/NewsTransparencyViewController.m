@implementation NewsTransparencyViewController

- (NewsTransparencyViewController)initWithNewsTransparencyDetailsDictionary:(id)a3
{
  id v4;
  NewsTransparencyViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  NewsTransparencyViewController *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NewsTransparencyViewController;
  v5 = -[NewsTransparencyViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "AD_jsonString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("AdLib provided TransparencyDetailsView the following transparencyDetailsDictionary: %@."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[NewsTransparencyViewController setTransparencyDetailsDictionary:](v5, "setTransparencyDetailsDictionary:", v4);
    -[NewsTransparencyViewController setIsiPad:](v5, "setIsiPad:", MGGetBoolAnswer());
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NewsTransparencyViewController setIsClientTodayWidget:](v5, "setIsClientTodayWidget:", objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE02168]));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke;
    block[3] = &unk_24D8FBBD0;
    v13 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v5;
}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_2;
  v5[3] = &unk_24D8FBD08;
  v6 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x219A1611C](v5);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isDeviceLocked");
  v4 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "requestUserPassCodeUnlockUIWithBlock:", v2);
  else
    objc_msgSend(v4, "_commonInit");

}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_commonInit");
  }
  else
  {
    objc_msgSend(v3, "errorDelegate");
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_3;
    v5[3] = &unk_24D8FBBD0;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

  }
}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newsTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)NewsTransparencyViewController;
  -[NewsTransparencyViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[NewsTransparencyViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
      objc_msgSend(v6, "configureWithOpaqueBackground");
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

      v14 = *MEMORY[0x24BDF6600];
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitleTextAttributes:", v9);

      objc_msgSend(v3, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStandardAppearance:", v6);

      objc_msgSend(v3, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setScrollEdgeAppearance:", v6);

      objc_msgSend(v3, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslucent:", 0);

    }
  }

}

- (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

- (void)requestUserPassCodeUnlockUIWithBlock:(id)a3
{
  SBSRequestPasscodeUnlockAlertUI();
}

- (void)_commonInit
{
  NSDictionary *transparencyDetailsDictionary;
  NSString *v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *v6;
  NSString *transparencyRendererPayload;
  NSString *v8;
  NSString *transparencyRendererURL;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
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
  void *v42;
  UIActivityIndicatorView *v43;
  UIActivityIndicatorView *activityIndicator;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  id v51;

  transparencyDetailsDictionary = self->_transparencyDetailsDictionary;
  if (transparencyDetailsDictionary)
  {
    -[NSDictionary objectForKey:](transparencyDetailsDictionary, "objectForKey:", CFSTR("transparencyDetailsUnavailableMessage"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
    self->_transparencyDetailsUnavailableMessage = v4;

    -[NSDictionary objectForKey:](self->_transparencyDetailsDictionary, "objectForKey:", CFSTR("transparencyRendererPayload"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyRendererPayload = self->_transparencyRendererPayload;
    self->_transparencyRendererPayload = v6;

    -[NSDictionary objectForKey:](self->_transparencyDetailsDictionary, "objectForKey:", CFSTR("transparencyRendererURL"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyRendererURL = self->_transparencyRendererURL;
    self->_transparencyRendererURL = v8;

    -[NSDictionary objectForKey:](self->_transparencyDetailsDictionary, "objectForKey:", CFSTR("renderingStateForLocation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderingStatusForLocationPermission = objc_msgSend(v10, "BOOLValue");

    -[NSDictionary objectForKey:](self->_transparencyDetailsDictionary, "objectForKey:", CFSTR("renderingStateForPA"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderingStatusForPAPermission = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    -[NewsTransparencyViewController errorDelegate](self, "errorDelegate");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Connection to NewsTransparencyViewController established with TransparencyDetailsView framework."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (-[NewsTransparencyViewController isiPad](self, "isiPad"))
    v13 = 2;
  else
    v13 = 1;
  -[NewsTransparencyViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v13);
  -[NewsTransparencyViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NewsTransparencyViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[NewsTransparencyViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D8FBF78, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 2, self, sel__closeViewController_);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v19);

  -[NewsTransparencyViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v18);

  objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("About This Ad"), &stru_24D8FBF78, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NewsTransparencyViewController setTitle:](self, "setTitle:", v21);

  v22 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NewsTransparencyViewController renderingStatusForLocationPermission](self, "renderingStatusForLocationPermission"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NewsTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("        window.transparency = {            isLocationPermissionGranted: () => { return %@ },            isPAEnabled: () => { return %@ }         }    "), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v26, 0, 1);
  objc_msgSend(v22, "addUserScript:", v27);
  v28 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v28, "setUserContentController:", v22);
  v29 = objc_alloc(MEMORY[0x24BDFA918]);
  v30 = (void *)objc_msgSend(v29, "initWithFrame:configuration:", v28, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[NewsTransparencyViewController setMyNewsPrivacyWebView:](self, "setMyNewsPrivacyWebView:", v30);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAllowsLinkPreview:", 0);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setNavigationDelegate:", self);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setOpaque:", 0);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentInsetAdjustmentBehavior:", 2);

  if (-[NewsTransparencyViewController isClientTodayWidget](self, "isClientTodayWidget"))
  {
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setScrollEnabled:", 0);

    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scrollView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBounces:", 0);

  }
  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAutoresizesSubviews:", 1);

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAutoresizingMask:", 18);

  v43 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v43;

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "frame");
  v47 = v46 * 0.5;
  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "frame");
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v47, v49 * 0.5);

  -[UIActivityIndicatorView setAutoresizingMask:](self->activityIndicator, "setAutoresizingMask:", 45);
  -[UIActivityIndicatorView startAnimating](self->activityIndicator, "startAnimating");
  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", self->activityIndicator);

  -[NewsTransparencyViewController presentViewDelegate](self, "presentViewDelegate");
  -[NewsTransparencyViewController loadWebView](self, "loadWebView");

}

- (void)loadWebView
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[6];

  v61[4] = *MEMORY[0x24BDAC8D0];
  -[NewsTransparencyViewController transparencyRendererURL](self, "transparencyRendererURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1838];
    v7 = v4;
    objc_msgSend(v4, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItemWithName:value:", CFSTR("locale"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    v10 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v7, "osIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryItemWithName:value:", CFSTR("os"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    v13 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v7, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryItemWithName:value:", CFSTR("app_id"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    v16 = (void *)MEMORY[0x24BDD1838];
    v60 = v7;
    objc_msgSend(v7, "shortBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryItemWithName:value:", CFSTR("build"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

    v19 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v7, "shortModelType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryItemWithName:value:", CFSTR("model"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v5;
    objc_msgSend(v5, "addObject:", v21);

    v22 = (void *)MEMORY[0x24BDD1808];
    -[NewsTransparencyViewController transparencyRendererURL](self, "transparencyRendererURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsWithString:", v23);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "setQueryItems:", v5);
    objc_msgSend(v58, "URL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v57);
    objc_msgSend(v24, "setHTTPMethod:", CFSTR("POST"));
    -[NewsTransparencyViewController transparencyRendererPayload](self, "transparencyRendererPayload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v24;
    objc_msgSend(v24, "setHTTPBody:", v26);

    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v27, "loadRequest:", v24);

    -[NewsTransparencyViewController navigationController](self, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "navigationBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTranslucent:", 0);

    -[NewsTransparencyViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    v46 = (void *)MEMORY[0x24BDD1628];
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v51;
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v45;
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v36;
    -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leftAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v42);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: We don't have the URL for the rendering server."), objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[NewsTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
  }
}

- (void)_showErrorMessage:(id)a3
{
  void *v4;
  id v5;
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
  id v25;

  v25 = a3;
  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating");
  -[NewsTransparencyViewController errorLabel](self, "errorLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[NewsTransparencyViewController setErrorLabel:](self, "setErrorLabel:", v6);

    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[NewsTransparencyViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("errorLabel"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NewsTransparencyViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[errorLabel]-20-|"), 0, 0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addConstraints:", v19);

    -[NewsTransparencyViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[errorLabel]-|"), 0, 0, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v21);

  }
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Advertising information isn’t available right now. Try again later."), &stru_24D8FBF78, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[NewsTransparencyViewController errorLabel](self, "errorLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v25);

  -[NewsTransparencyViewController errorLabel](self, "errorLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating", a3, a4);
  -[NewsTransparencyViewController _hideErrorMessage](self, "_hideErrorMessage");
  -[NewsTransparencyViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NewsTransparencyViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "newsTransparencyViewControllerDidRenderView:", self);

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[NewsTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[NewsTransparencyViewController myNewsPrivacyWebView](self, "myNewsPrivacyWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[NewsTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)_hideErrorMessage
{
  void *v3;
  id v4;

  -[NewsTransparencyViewController errorLabel](self, "errorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NewsTransparencyViewController errorLabel](self, "errorLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)_closeViewController:(id)a3
{
  id v3;

  -[NewsTransparencyViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentViewDelegate
{
  void *v3;
  char v4;
  id v5;

  -[NewsTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NewsTransparencyViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "newsTransparencyViewControllerDidLoad:", self);

  }
}

- (void)errorDelegate
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[NewsTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NewsTransparencyViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NewsTransparencyViewControllerErrorDomain"), 0, &unk_24D8FEE38);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "newsTransparencyViewController:didFailWithError:", self, v5);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NewsTransparencyViewController;
  -[NewsTransparencyViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  v4 = (id)*MEMORY[0x24BDF75D8];
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __48__NewsTransparencyViewController_viewDidAppear___block_invoke;
  v10 = &unk_24D8FBD30;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NewsTransparencyViewController setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__NewsTransparencyViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "_closeViewController:", 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[NewsTransparencyViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NewsTransparencyViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "newsTransparencyViewControllerDidDismiss:", self);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NewsTransparencyViewController notificationObserver](self, "notificationObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", v9);

  v10.receiver = self;
  v10.super_class = (Class)NewsTransparencyViewController;
  -[NewsTransparencyViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(id, _QWORD);
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void (**v29)(id, _QWORD);
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NewsTransparencyViewController *v69;
  void *v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  v69 = self;
  v12 = objc_opt_class();
  objc_msgSend(v10, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ The URL for the link generated by the rendering server is: %@."), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v15, "queryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  v70 = v10;
  if (v17)
  {
    v18 = v17;
    v68 = v15;
    v19 = v8;
    v20 = v7;
    v21 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v73 != v21)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("path"));

        if (v25)
        {
          v26 = v23;
          goto LABEL_11;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v18)
        continue;
      break;
    }
    v26 = 0;
LABEL_11:
    v7 = v20;
    v8 = v19;
    v15 = v68;
  }
  else
  {
    v26 = 0;
  }

  objc_msgSend(v15, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "rangeOfString:options:", CFSTR("prefs:root=Privacy&path=ADVERTISING"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_24;
  v29 = v8;
  v30 = v7;
  v31 = v26;
  objc_msgSend(v15, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastPathComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "rangeOfString:options:", CFSTR("App-Prefs:root=Privacy&path=ADVERTISING"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {

    v26 = v31;
    v7 = v30;
    v8 = v29;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v70, "absoluteString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "containsString:", CFSTR("Privacy_Advertising"));

  v26 = v31;
  v7 = v30;
  v8 = v29;
  if ((v35 & 1) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy&path=ADVERTISING"));
    v55 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "openSensitiveURL:withOptions:", v55, MEMORY[0x24BDBD1B8]);

    -[NewsTransparencyViewController delegate](v69, "delegate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v55) = objc_opt_respondsToSelector();

    if ((v55 & 1) != 0)
    {
      -[NewsTransparencyViewController delegate](v69, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "newsTransparencyViewControllerDidLinkOut:", v69);

    }
    v8[2](v8, 0);
    v43 = v70;
    goto LABEL_28;
  }
  objc_msgSend(v15, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastPathComponent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = CFSTR("prefs:root=Privacy&path=LOCATION");
  v39 = objc_msgSend(v37, "rangeOfString:options:", CFSTR("prefs:root=Privacy&path=LOCATION"), 1);

  if (v39 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This is the Settings->App Settings->Location link. Launch this in the settings app."));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bundleIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v70;
    if ((objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
    {
      v38 = CFSTR("prefs:root=NEWS");
    }
    else if (objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.stocks")))
    {
      v38 = CFSTR("prefs:root=STOCKS");
    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v38);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "openSensitiveURL:withOptions:", v61, MEMORY[0x24BDBD1B8]);

    -[NewsTransparencyViewController presentingViewController](v69, "presentingViewController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v71[3] = &unk_24D8FBBD0;
    v71[4] = v69;
    objc_msgSend(v62, "dismissViewControllerAnimated:completion:", 1, v71);

    goto LABEL_36;
  }
  objc_msgSend(v15, "path");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "lastPathComponent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "rangeOfString:options:", CFSTR("embedded:root=Privacy"), 1);

  v43 = v70;
  if (v26 && v42 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v44 = (void *)MEMORY[0x24BE6E438];
    v45 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v26, "value");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("com.apple.onboarding.%@"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "presenterForPrivacySplashWithIdentifier:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "setPresentingViewController:", v69);
    if (-[NewsTransparencyViewController isiPad](v69, "isiPad"))
      v49 = 2;
    else
      v49 = 1;
    objc_msgSend(v48, "setModalPresentationStyle:", v49);
    -[NewsTransparencyViewController navigationController](v69, "navigationController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "presentInNavigationStack:", v50);

    v51 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v26, "value");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithFormat:", CFSTR("This is the Data & Privacy link for the about page with path %@. Present this in the modal sheet."), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v43 = v70;
LABEL_36:
    v8[2](v8, 0);

    goto LABEL_28;
  }
  if (objc_msgSend(v7, "navigationType"))
  {
    v8[2](v8, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v64 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v64, "URL");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "openURL:options:completionHandler:", v65, MEMORY[0x24BDBD1B8], &__block_literal_global_0);

    -[NewsTransparencyViewController delegate](v69, "delegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v64) = objc_opt_respondsToSelector();

    if ((v64 & 1) != 0)
    {
      -[NewsTransparencyViewController delegate](v69, "delegate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "newsTransparencyViewControllerDidLinkOut:", v69);

    }
    v8[2](v8, 0);
  }
LABEL_28:

}

void __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newsTransparencyViewControllerDidLinkOut:", *(_QWORD *)(a1 + 32));

  }
}

void __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, int a2)
{
  const __CFString *v2;
  id v3;

  v2 = CFSTR("NOT");
  if (a2)
    v2 = CFSTR("successfully");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This is NOT the Settings->Privacy->Advertising link. Launch this in Safari and not our WebView. The link can %@ be opened"), v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)displayDebugButtonWaitingIndicator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v3);

  objc_msgSend(v6, "startAnimating");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v6);
  -[NewsTransparencyViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

}

- (void)debugDetailsViewControllerReady:(id)a3
{
  UIViewController *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *leftButton;
  UIBarButtonItem *v7;
  void *v8;
  UIViewController *debugViewController;

  v4 = (UIViewController *)a3;
  v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", CFSTR("Debug"), 0, self, sel__openDebugView_);
  leftButton = self->leftButton;
  self->leftButton = v5;

  v7 = self->leftButton;
  -[NewsTransparencyViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  debugViewController = self->debugViewController;
  self->debugViewController = v4;

}

- (void)_openDebugView:(id)a3
{
  id v4;

  -[UIViewController setModalPresentationStyle:](self->debugViewController, "setModalPresentationStyle:", 7);
  -[UIViewController popoverPresentationController](self->debugViewController, "popoverPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButtonItem:", self->leftButton);
  -[NewsTransparencyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->debugViewController, 1, 0);

}

- (NewsTransparencyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (BOOL)renderingStatusForLocationPermission
{
  return self->_renderingStatusForLocationPermission;
}

- (BOOL)renderingStatusForPAPermission
{
  return self->_renderingStatusForPAPermission;
}

- (NSDictionary)transparencyDetailsDictionary
{
  return self->_transparencyDetailsDictionary;
}

- (void)setTransparencyDetailsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetailsDictionary, a3);
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (WKWebView)myNewsPrivacyWebView
{
  return self->_myNewsPrivacyWebView;
}

- (void)setMyNewsPrivacyWebView:(id)a3
{
  objc_storeStrong((id *)&self->_myNewsPrivacyWebView, a3);
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (BOOL)isClientTodayWidget
{
  return self->_isClientTodayWidget;
}

- (void)setIsClientTodayWidget:(BOOL)a3
{
  self->_isClientTodayWidget = a3;
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_notificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_myNewsPrivacyWebView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsDictionary, 0);
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->debugViewController, 0);
  objc_storeStrong((id *)&self->leftButton, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end
