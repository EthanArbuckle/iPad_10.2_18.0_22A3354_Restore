@implementation ADTransparencyViewController

- (ADTransparencyViewController)initWithTransparencyDetails:(id)a3
{
  id v4;
  ADTransparencyViewController *v5;
  ADTransparencyViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ADTransparencyViewController;
  v5 = -[ADTransparencyViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[ADTransparencyViewController setTransparencyDetails:](v5, "setTransparencyDetails:", v4);

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADTransparencyViewController;
  -[ADTransparencyViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[ADTransparencyViewController _commonInit](self, "_commonInit");
  -[ADTransparencyViewController configureWebView](self, "configureWebView");
  -[ADTransparencyViewController renderWebView](self, "renderWebView");
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
  v13.super_class = (Class)ADTransparencyViewController;
  -[ADTransparencyViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  v4 = (id)*MEMORY[0x24BDF75D8];
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __46__ADTransparencyViewController_viewDidAppear___block_invoke;
  v10 = &unk_24D8FBD30;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __46__ADTransparencyViewController_viewDidAppear___block_invoke(uint64_t a1)
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
  void *v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController notificationObserver](self, "notificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  -[ADTransparencyViewController _postDismissedNotification](self, "_postDismissedNotification");
  v7.receiver = self;
  v7.super_class = (Class)ADTransparencyViewController;
  -[ADTransparencyViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (void)requestViewWithTransparencyDetails:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSDictionary *v7;
  id v8;
  NSDictionary *transparencyDetailsData;
  NSDictionary *v10;
  NSDictionary *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  uint64_t v15;
  NSDictionary *v16;
  void *v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = (objc_class *)MEMORY[0x24BDBCE50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBase64EncodedString:options:", v5, 0);

  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v21);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  transparencyDetailsData = self->_transparencyDetailsData;
  self->_transparencyDetailsData = v7;

  if (v8)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02238]), "initWithData:", v6);
    objc_msgSend(v20, "dictionaryRepresentation");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_transparencyDetailsData;
    self->_transparencyDetailsData = v10;

    v12 = objc_alloc_init(MEMORY[0x24BDBFA88]);
    v13 = objc_msgSend(v12, "authorizationStatus") - 3 < 2;
    v14 = objc_alloc_init(MEMORY[0x24BE5F7B8]);
    v15 = objc_msgSend(v14, "personalizedAds");
    v16 = self->_transparencyDetailsData;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v16, "setValue:forKey:", v17, CFSTR("renderingStateForLocation"));

    v18 = self->_transparencyDetailsData;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v18, "setValue:forKey:", v19, CFSTR("renderingStateForPA"));

  }
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  return v3;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
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
  uint64_t v56;
  void *v57;
  _QWORD v58[4];

  v58[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Connection to ADTransparencyViewController established with TransparencyDetailsView framework."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The Storefront Bundle Locale that will be used is: %@"), v53);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADTransparencyViewController setIsiPad:](self, "setIsiPad:", MGGetBoolAnswer());
  if (-[ADTransparencyViewController isiPad](self, "isiPad"))
    v5 = 2;
  else
    v5 = 1;
  -[ADTransparencyViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v5);
  -[ADTransparencyViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[ADTransparencyViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v8 = objc_alloc_init(MEMORY[0x24BDF6BE0]);
  -[ADTransparencyViewController setTransparencyNavBar:](self, "setTransparencyNavBar:", v8);

  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslucent:", 0);

  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizesSubviews:", 1);

  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoresizingMask:", 2);

  -[ADTransparencyViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  v46 = (void *)MEMORY[0x24BDD1628];
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v48;
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v17;
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v23);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D8FBF78, 0);

  objc_msgSend(v54, "storefrontLocalizationLanguage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:localization:", CFSTR("Done"), 0, 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v27, 2, self, sel__closeViewController_);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("About This Ad"), &stru_24D8FBF78, 0);

  objc_msgSend(v54, "storefrontLocalizationLanguage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:localization:", CFSTR("About This Ad"), 0, 0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C00]), "initWithTitle:", v32);
  objc_msgSend(v33, "setRightBarButtonItem:", v28);
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceStyle");

  if (v35 == 2)
  {
    v36 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
    objc_msgSend(v36, "configureWithOpaqueBackground");
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v37);

    v56 = *MEMORY[0x24BDF6600];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTitleTextAttributes:", v39);

    -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setStandardAppearance:", v36);

    -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setScrollEdgeAppearance:", v36);

    -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslucent:", 0);

  }
  v55 = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setItems:", v43);

  -[ADTransparencyViewController prepareRenderingPayload](self, "prepareRenderingPayload");
}

- (void)prepareRenderingPayload
{
  NSString *transparencyDetails;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *v9;
  NSString *transparencyRendererPayload;
  NSString *v11;
  NSString *transparencyRendererURL;
  void *v13;
  void *v14;

  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[NSString description](transparencyDetails, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("The privacy data key being used is: %@."), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADTransparencyViewController requestViewWithTransparencyDetails:](self, "requestViewWithTransparencyDetails:", self->_transparencyDetails);
    -[NSDictionary objectForKey:](self->_transparencyDetailsData, "objectForKey:", CFSTR("transparencyDetailsUnavailableMessage"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
    self->_transparencyDetailsUnavailableMessage = v7;

    -[NSDictionary objectForKey:](self->_transparencyDetailsData, "objectForKey:", CFSTR("transparencyRendererPayload"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyRendererPayload = self->_transparencyRendererPayload;
    self->_transparencyRendererPayload = v9;

    -[NSDictionary objectForKey:](self->_transparencyDetailsData, "objectForKey:", CFSTR("transparencyRendererURL"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    transparencyRendererURL = self->_transparencyRendererURL;
    self->_transparencyRendererURL = v11;

    -[NSDictionary objectForKey:](self->_transparencyDetailsData, "objectForKey:", CFSTR("renderingStateForLocation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderingStatusForLocationPermission = objc_msgSend(v13, "BOOLValue");

    -[NSDictionary objectForKey:](self->_transparencyDetailsData, "objectForKey:", CFSTR("renderingStateForPA"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderingStatusForPAPermission = objc_msgSend(v14, "BOOLValue");

  }
  if (!self->_transparencyDetailsData)
    -[ADTransparencyViewController errorDelegate](self, "errorDelegate");
}

- (void)configureWebView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIActivityIndicatorView *v22;
  UIActivityIndicatorView *activityIndicator;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
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
  id v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[6];

  v58[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ADTransparencyViewController renderingStatusForLocationPermission](self, "renderingStatusForLocationPermission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ADTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("        window.transparency = {            isLocationPermissionGranted: () => { return %@ },            isPAEnabled: () => { return %@ }         }    "), v5, v6);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v3;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v57, 0, 1);
  objc_msgSend(v3, "addUserScript:", v56);
  v54 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v54, "setUserContentController:", v3);
  v7 = objc_alloc(MEMORY[0x24BDFA918]);
  -[ADTransparencyViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[ADTransparencyViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = (void *)objc_msgSend(v7, "initWithFrame:configuration:", v54, 0.0, 44.0, v10, v12 + -44.0);
  -[ADTransparencyViewController setMyWebView:](self, "setMyWebView:", v13);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsLinkPreview:", 0);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNavigationDelegate:", self);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOpaque:", 0);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentInsetAdjustmentBehavior:", 2);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizesSubviews:", 1);

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAutoresizingMask:", 18);

  v22 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v22;

  -[ADTransparencyViewController myWebView](self, "myWebView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25 * 0.5;
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v26, v28 * 0.5 + -44.0);

  -[UIActivityIndicatorView setAutoresizingMask:](self->activityIndicator, "setAutoresizingMask:", 45);
  -[UIActivityIndicatorView startAnimating](self->activityIndicator, "startAnimating");
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->activityIndicator);

  -[ADTransparencyViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  v44 = (void *)MEMORY[0x24BDD1628];
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v49;
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v43;
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v35;
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTransparencyViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leftAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v41);

}

- (void)renderWebView
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
  id v29;

  -[ADTransparencyViewController transparencyRendererURL](self, "transparencyRendererURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v29, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItemWithName:value:", CFSTR("locale"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v8 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v29, "osIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryItemWithName:value:", CFSTR("os"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    v11 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v29, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryItemWithName:value:", CFSTR("app_id"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    v14 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v29, "shortBuildVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryItemWithName:value:", CFSTR("build"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    v17 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v29, "shortModelType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "queryItemWithName:value:", CFSTR("model"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    v20 = (void *)MEMORY[0x24BDD1808];
    -[ADTransparencyViewController transparencyRendererURL](self, "transparencyRendererURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setQueryItems:", v4);
    objc_msgSend(v22, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v23);
    objc_msgSend(v24, "setHTTPMethod:", CFSTR("POST"));
    -[ADTransparencyViewController transparencyRendererPayload](self, "transparencyRendererPayload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHTTPBody:", v26);

    -[ADTransparencyViewController myWebView](self, "myWebView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v27, "loadRequest:", v24);

  }
  else
  {
    -[ADTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
  }
}

- (void)presentViewDelegate
{
  void *v3;
  char v4;
  void *v5;

  -[ADTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ADTransparencyViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adTransparencyViewControllerDidLoad:", self);

  }
  -[ADTransparencyViewController _reportTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyAdTransparencyDidAppear"), 0);
}

- (void)errorDelegate
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[ADTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ADTransparencyViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADTransparencyViewControllerErrorDomain"), 0, &unk_24D8FEE60);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adTransparencyViewController:didFailWithError:", self, v5);

  }
}

- (void)_closeViewController:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[ADTransparencyViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__ADTransparencyViewController__closeViewController___block_invoke;
  v5[3] = &unk_24D8FBBD0;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

  -[ADTransparencyViewController _reportTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyAdTransparencyDidDisappear"), 0);
}

void __53__ADTransparencyViewController__closeViewController___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "adTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating");
  -[ADTransparencyViewController errorLabel](self, "errorLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[ADTransparencyViewController setErrorLabel:](self, "setErrorLabel:", v6);

    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ADTransparencyViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("errorLabel"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADTransparencyViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[errorLabel]-20-|"), 0, 0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addConstraints:", v19);

    -[ADTransparencyViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[errorLabel]-|"), 0, 0, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v21);

  }
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Advertising information isn’t available right now. Try again later."), &stru_24D8FBF78, 0);

    objc_msgSend(v23, "storefrontLocalizationLanguage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:localization:", CFSTR("Advertising information isn’t available right now. Try again later."), 0, 0, v26);
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ADTransparencyViewController myWebView](self, "myWebView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setScrollEnabled:", 0);

  -[ADTransparencyViewController errorLabel](self, "errorLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v31);

  -[ADTransparencyViewController errorLabel](self, "errorLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", 0);

  -[ADTransparencyViewController presentViewDelegate](self, "presentViewDelegate");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating", a3, a4);
  -[ADTransparencyViewController _hideErrorMessage](self, "_hideErrorMessage");
  -[ADTransparencyViewController presentViewDelegate](self, "presentViewDelegate");
  -[ADTransparencyViewController _reportTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyAdTransparencyDidRenderTransparency"), 0);
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
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  ADTransparencyViewController *v55;
  void *v56;
  void *v57;
  _QWORD *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(id, _QWORD);
  ADTransparencyViewController *v68;
  _QWORD v69[5];
  _QWORD v70[5];
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
  v68 = self;
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
  if (v17)
  {
    v18 = v17;
    v65 = v15;
    v66 = v10;
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
    v15 = v65;
    v10 = v66;
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
  v67 = v8;
  v29 = v7;
  v30 = v26;
  v31 = v15;
  objc_msgSend(v15, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastPathComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "rangeOfString:options:", CFSTR("App-Prefs:root=Privacy&path=ADVERTISING"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {

    v26 = v30;
    v7 = v29;
    v8 = v67;
    v15 = v31;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v10, "absoluteString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "containsString:", CFSTR("Privacy_Advertising"));

  v26 = v30;
  v7 = v29;
  v8 = v67;
  v15 = v31;
  if ((v35 & 1) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy&path=ADVERTISING"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "openSensitiveURL:withOptions:", v54, MEMORY[0x24BDBD1B8]);

    v55 = v68;
    -[ADTransparencyViewController presentingViewController](v68, "presentingViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v71[3] = &unk_24D8FBBD0;
    v71[4] = v68;
    v58 = v71;
LABEL_26:
    objc_msgSend(v56, "dismissViewControllerAnimated:completion:", 1, v58);

    -[ADTransparencyViewController _reportTransparencyViewControllerEventWithType:withCompletionHandler:](v55, "_reportTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyAdTransparencyDidLinkOut"), 0);
    -[ADTransparencyViewController _reportTransparencyViewControllerEventWithType:withCompletionHandler:](v55, "_reportTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyAdTransparencyDidDisappear"), 0);
    v8[2](v8, 0);
    goto LABEL_27;
  }
  objc_msgSend(v31, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastPathComponent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "rangeOfString:options:", CFSTR("prefs:root=Privacy&path=LOCATION"), 1);

  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This is the Settings->App Settings->Location link. Launch this in the settings app."));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=STORE"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "openSensitiveURL:withOptions:", v61, MEMORY[0x24BDBD1B8]);

    v55 = v68;
    -[ADTransparencyViewController presentingViewController](v68, "presentingViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v70[3] = &unk_24D8FBBD0;
    v70[4] = v68;
    v58 = v70;
    goto LABEL_26;
  }
  objc_msgSend(v31, "path");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastPathComponent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "rangeOfString:options:", CFSTR("embedded:root=Privacy"), 1);

  if (!v26 || v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v7, "navigationType"))
    {
      v67[2](v67, 1);
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "URL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "openURL:options:completionHandler:", v64, MEMORY[0x24BDBD1B8], &__block_literal_global_1);

    v55 = v68;
    -[ADTransparencyViewController presentingViewController](v68, "presentingViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_4;
    v69[3] = &unk_24D8FBBD0;
    v69[4] = v68;
    v58 = v69;
    goto LABEL_26;
  }
  v42 = (void *)MEMORY[0x24BE6E438];
  v43 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v26, "value");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("com.apple.onboarding.%@"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "presenterForPrivacySplashWithIdentifier:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "setPresentingViewController:", v68);
  if (-[ADTransparencyViewController isiPad](v68, "isiPad"))
    v47 = 2;
  else
    v47 = 1;
  objc_msgSend(v46, "setModalPresentationStyle:", v47);
  -[ADTransparencyViewController navigationController](v68, "navigationController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "presentInNavigationStack:", v48);

  v49 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v26, "value");
  v50 = v10;
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringWithFormat:", CFSTR("This is the Data & Privacy link for the about page with path %@. Present this in the modal sheet."), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v10 = v50;
  v67[2](v67, 0);

LABEL_27:
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "adTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
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
    objc_msgSend(v4, "adTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1, int a2)
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

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_4(uint64_t a1)
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
    objc_msgSend(v4, "adTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[ADTransparencyViewController myWebView](self, "myWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[ADTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[ADTransparencyViewController myWebView](self, "myWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[ADTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)_hideErrorMessage
{
  void *v3;
  id v4;

  -[ADTransparencyViewController errorLabel](self, "errorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ADTransparencyViewController errorLabel](self, "errorLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)_reportTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke;
  v10[3] = &unk_24D8FBCD8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

}

void __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultServerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Requesting ADLogAnalyticsRequest with ADAnalyticsEvent for %@ event to: %@"), *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BE021E0]);
  objc_msgSend(v7, "setBundleID:", *MEMORY[0x24BE02150]);
  objc_msgSend(v6, "encryptedIDForClientType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentiAdID:", v8);

  objc_msgSend(v6, "encryptedIDForClientType:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDPID:", v9);

  objc_msgSend(v6, "encryptedIDForClientType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIAdID:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BE02170]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimestamp:", (double)(int)objc_msgSend(v12, "AD_toServerTime"));

  v13 = *(id *)(a1 + 32);
  v14 = 0;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrerollRequested")) & 1) == 0)
  {
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidAppear")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidRenderTransparency")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidDisappear")) & 1) != 0)
    {
      v14 = 3;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidLinkOut")) & 1) != 0)
    {
      v14 = 4;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidAppear")) & 1) != 0)
    {
      v14 = 5;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidRenderTransparency")) & 1) != 0)
    {
      v14 = 6;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidDisappear")) & 1) != 0)
    {
      v14 = 7;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidLinkOut")))
    {
      v14 = 8;
    }
    else
    {
      v14 = 0;
    }
  }

  objc_msgSend(v11, "setEvent:", v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEvents:", v15);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_24D8FBCB0;
  v16 = *(id *)(a1 + 40);
  v19 = v7;
  v20 = v16;
  v17 = v7;
  objc_msgSend(v5, "handleRequest:serverURL:responseHandler:", v17, v3, v18);

}

void __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received an ADLogAnalyticsResponse ERROR: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE021E8]), "initWithData:", v15);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Received an ADLogAnalyticsResponse: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
}

- (void)_postDismissedNotification
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Posting ADTransparencyViewControllerDismissed notification."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ADTransparencyViewControllerDismissed"), 0);

}

- (ADTransparencyViewControllerDelegate)delegate
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

- (NSString)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSDictionary)transparencyDetailsData
{
  return self->_transparencyDetailsData;
}

- (void)setTransparencyDetailsData:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetailsData, a3);
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (WKWebView)myWebView
{
  return self->_myWebView;
}

- (void)setMyWebView:(id)a3
{
  objc_storeStrong((id *)&self->_myWebView, a3);
}

- (UINavigationBar)transparencyNavBar
{
  return self->_transparencyNavBar;
}

- (void)setTransparencyNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyNavBar, a3);
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
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
  objc_storeStrong((id *)&self->_transparencyNavBar, 0);
  objc_storeStrong((id *)&self->_myWebView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsData, 0);
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end
