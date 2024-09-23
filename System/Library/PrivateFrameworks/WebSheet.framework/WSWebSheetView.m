@implementation WSWebSheetView

- (WSWebSheetView)initWithFrame:(CGRect)a3 webSheetViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  WSWebSheetView *v11;
  WSWebSheetView *v12;
  UINavigationBar *v13;
  UINavigationBar *navigationBar;
  UINavigationBar *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UINavigationItem *navigationItem;
  id v20;
  void *v21;
  uint64_t v22;
  UIBarButtonItem *cancelDoneBarButtonItem;
  uint64_t v24;
  UIBarButtonItem *backButtonItem;
  void *v26;
  uint64_t v27;
  UIBarButtonItem *forwardButtonItem;
  void *v29;
  UINavigationItem *v30;
  void *v31;
  UIView *v32;
  UIView *addressView;
  UILabel *v34;
  UILabel *addressLabel;
  UILabel *v36;
  UILabel *ssidLabel;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  UIImageView *lockIconView;
  void *v46;
  void *v47;
  UIImageView *v48;
  void *v49;
  dispatch_queue_t v50;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v52;
  NSMutableDictionary *resultOptions;
  NSMutableArray *v54;
  NSMutableArray *redirectTypeQueue;
  NSURL *navigationURLAtStart;
  objc_super v58;
  _QWORD v59[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v59[2] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)WSWebSheetView;
  v11 = -[WSWebSheetView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webSheetViewController, a4);
    v13 = (UINavigationBar *)objc_alloc_init(MEMORY[0x24BDF6BE0]);
    navigationBar = v12->_navigationBar;
    v12->_navigationBar = v13;

    v15 = v12->_navigationBar;
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar setBarTintColor:](v15, "setBarTintColor:", v16);

    -[UINavigationBar setTranslucent:](v12->_navigationBar, "setTranslucent:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WSWebSheetView setBackgroundColor:](v12, "setBackgroundColor:", v17);

    -[UINavigationBar setRequestedContentSize:](v12->_navigationBar, "setRequestedContentSize:", 2);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C00]), "initWithTitle:", &stru_24FD35608);
    navigationItem = v12->_navigationItem;
    v12->_navigationItem = (UINavigationItem *)v18;

    v20 = objc_alloc(MEMORY[0x24BDF6860]);
    GetLocalizedString((uint64_t)"Cancel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithTitle:style:target:action:", v21, 2, v12, sel_cancelTapped);
    cancelDoneBarButtonItem = v12->_cancelDoneBarButtonItem;
    v12->_cancelDoneBarButtonItem = (UIBarButtonItem *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 101, v12, sel__backButtonPressed);
    backButtonItem = v12->_backButtonItem;
    v12->_backButtonItem = (UIBarButtonItem *)v24;

    objc_msgSend(MEMORY[0x24BDF6950], "linkColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](v12->_backButtonItem, "setTintColor:", v26);

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 102, v12, sel__forwardButtonPressed);
    forwardButtonItem = v12->_forwardButtonItem;
    v12->_forwardButtonItem = (UIBarButtonItem *)v27;

    objc_msgSend(MEMORY[0x24BDF6950], "linkColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](v12->_forwardButtonItem, "setTintColor:", v29);

    -[UIBarButtonItem setEnabled:](v12->_backButtonItem, "setEnabled:", 0);
    -[UIBarButtonItem setEnabled:](v12->_forwardButtonItem, "setEnabled:", 0);
    v30 = v12->_navigationItem;
    v59[0] = v12->_backButtonItem;
    v59[1] = v12->_forwardButtonItem;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationItem setLeftBarButtonItems:](v30, "setLeftBarButtonItems:", v31);

    -[UINavigationItem setRightBarButtonItem:](v12->_navigationItem, "setRightBarButtonItem:", v12->_cancelDoneBarButtonItem);
    -[UINavigationBar pushNavigationItem:animated:](v12->_navigationBar, "pushNavigationItem:animated:", v12->_navigationItem, 0);
    -[UINavigationBar setDelegate:](v12->_navigationBar, "setDelegate:", v12);
    v32 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    addressView = v12->_addressView;
    v12->_addressView = v32;

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    addressLabel = v12->_addressLabel;
    v12->_addressLabel = v34;

    v36 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    ssidLabel = v12->_ssidLabel;
    v12->_ssidLabel = v36;

    v38 = v12->_addressLabel;
    -[WSWebSheetView _promptLabelFont](v12, "_promptLabelFont");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v38, "setFont:", v39);

    -[WSWebSheetView addSubview:](v12, "addSubview:", v12->_addressView);
    v40 = v12->_ssidLabel;
    -[WSWebSheetView _promptLabelFont](v12, "_promptLabelFont");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v40, "setFont:", v41);

    -[UILabel setTextAlignment:](v12->_ssidLabel, "setTextAlignment:", 1);
    v42 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[WSWebSheetView _lockIconImage](v12, "_lockIconImage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "initWithImage:", v43);
    lockIconView = v12->_lockIconView;
    v12->_lockIconView = (UIImageView *)v44;

    -[UIImageView image](v12->_lockIconView, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageWithRenderingMode:", 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v12->_lockIconView, "setImage:", v47);

    v48 = v12->_lockIconView;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v48, "setTintColor:", v49);

    -[WSWebSheetView addSubview:](v12, "addSubview:", v12->_navigationBar);
    v50 = dispatch_queue_create("_redirectTypeQueue access thread", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v50;

    v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    resultOptions = v12->_resultOptions;
    v12->_resultOptions = v52;

    v54 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    redirectTypeQueue = v12->_redirectTypeQueue;
    v12->_redirectTypeQueue = v54;

    v12->_currentRedirectURLTypeSet = 0;
    v12->_firstNavigation = 1;
    navigationURLAtStart = v12->_navigationURLAtStart;
    v12->_navigationURLAtStart = 0;

    v12->_everReceivedUntrustedCertificate = 0;
  }

  return v12;
}

- (void)dequeueRedirectTypeQueue
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WSWebSheetView_dequeueRedirectTypeQueue__block_invoke;
  block[3] = &unk_24FD35238;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__WSWebSheetView_dequeueRedirectTypeQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "count");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "removeObjectAtIndex:", 0);
  return result;
}

- (void)pushBackToRedirectTypeQueue
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WSWebSheetView_pushBackToRedirectTypeQueue__block_invoke;
  block[3] = &unk_24FD35238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__WSWebSheetView_pushBackToRedirectTypeQueue__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "firstObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "addObject:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "removeObjectAtIndex:", 0);

  }
}

- (void)updateResultOptions
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WSWebSheetView_updateResultOptions__block_invoke;
  block[3] = &unk_24FD35238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__WSWebSheetView_updateResultOptions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v2, "unsignedIntegerValue");
    else
      v3 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "removeAllObjects");

  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __37__WSWebSheetView_updateResultOptions__block_invoke_2;
    v5[3] = &unk_24FD35260;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

void __37__WSWebSheetView_updateResultOptions__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCompleteNotificationWithRedirectURLtype:result:", *(_QWORD *)(a1 + 40), 0);

}

- (void)updateToDoneButton
{
  UIBarButtonItem *cancelDoneBarButtonItem;
  id v4;

  self->_inDoneState = 1;
  -[WSWebSheetView setShouldShowStayConnectedOptions:](self, "setShouldShowStayConnectedOptions:", 0);
  -[UIBarButtonItem setAction:](self->_cancelDoneBarButtonItem, "setAction:", sel_doneTapped);
  cancelDoneBarButtonItem = self->_cancelDoneBarButtonItem;
  GetLocalizedString((uint64_t)"Done");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](cancelDoneBarButtonItem, "setTitle:", v4);

}

- (void)setWebViewWithInterfaceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  WKWebView *v15;
  WKWebView *webView;
  WSWebSheetDownloadManager *v17;
  WSWebSheetDownloadManager *downloadManager;
  WSWebSheetDownloadManager *v19;
  void *v20;
  void *v21;
  _SFFormAutoFillController *v22;
  _SFFormAutoFillController *autoFillController;
  id v24;

  v4 = (objc_class *)MEMORY[0x24BDFA978];
  v5 = a3;
  v24 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "builtInPlugInsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("SafariServices.wkbundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInjectedBundleURL:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "setJITEnabled:", 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA8E8]), "_initWithConfiguration:", v24);
  v10 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v10, "_setApplePayEnabled:", 1);
  objc_msgSend(v10, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(v10, "setDataDetectorTypes:", 3);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA9C8]), "initNonPersistentConfiguration");
  objc_msgSend(v11, "setBoundInterfaceIdentifier:", v5);

  objc_msgSend(v11, "setAllowsCellularAccess:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setLegacyTLSEnabled:", 1);
  objc_msgSend(v11, "setProxyConfiguration:", self->_proxyConfiguration);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA928]), "_initWithConfiguration:", v11);
  objc_msgSend(v10, "setWebsiteDataStore:", v12);

  objc_msgSend(v10, "setProcessPool:", v9);
  objc_msgSend(v10, "_setClientNavigationsRunAtForegroundPriority:", 1);
  objc_msgSend(v10, "preferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setDeviceOrientationEventEnabled:", 0);

  v14 = objc_alloc(MEMORY[0x24BDFA918]);
  -[WSWebSheetView frame](self, "frame");
  v15 = (WKWebView *)objc_msgSend(v14, "initWithFrame:configuration:", v10);
  webView = self->_webView;
  self->_webView = v15;

  v17 = objc_alloc_init(WSWebSheetDownloadManager);
  downloadManager = self->_downloadManager;
  self->_downloadManager = v17;

  -[WSWebSheetDownloadManager setDelegate:](self->_downloadManager, "setDelegate:", self);
  v19 = self->_downloadManager;
  -[WKWebView configuration](self->_webView, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "processPool");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setDownloadDelegate:", v19);

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[WKWebView setUIDelegate:](self->_webView, "setUIDelegate:", self);
  -[WKWebView _setInputDelegate:](self->_webView, "_setInputDelegate:", self);
  -[WKWebView becomeFirstResponder](self->_webView, "becomeFirstResponder");
  -[WKWebView setAllowsBackForwardNavigationGestures:](self->_webView, "setAllowsBackForwardNavigationGestures:", 1);
  v22 = (_SFFormAutoFillController *)objc_msgSend(objc_alloc(MEMORY[0x24BDE81C0]), "initWithWebView:delegate:", self->_webView, self);
  autoFillController = self->_autoFillController;
  self->_autoFillController = v22;

  -[WSWebSheetView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_webView, self->_navigationBar);
}

- (void)setSSID:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_ssid, a3);
  v5 = a3;
  -[UILabel setText:](self->_ssidLabel, "setText:", v5);

  -[WSWebSheetView _updateTitle](self, "_updateTitle");
}

- (id)_titleString:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v12;

  v3 = a3;
  v5 = -[WSWebSheetView isChinaRegion](self, "isChinaRegion");
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    if (v5)
      v7 = "Captive WLAN - %@";
    else
      v7 = "Captive Wi-Fi - %@";
    GetLocalizedString((uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, self->_ssid);
  }
  else
  {
    if (v5)
      v9 = "Captive WLAN";
    else
      v9 = "Captive Wi-Fi";
    GetLocalizedString((uint64_t)v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateTitle
{
  _BOOL8 v3;
  id v4;

  v3 = !-[WSWebSheetView _shouldShowPromptLabels](self, "_shouldShowPromptLabels") && self->_ssid != 0;
  -[WSWebSheetView _titleString:](self, "_titleString:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationItem setTitle:](self->_navigationItem, "setTitle:", v4);

}

- (double)getHeaderFrameHeight
{
  return 44.0;
}

- (double)getAddressViewHeight
{
  double v2;

  -[WSWebSheetView _promptLabelFontLineHeight](self, "_promptLabelFontLineHeight");
  return v2 * 2.0 + 10.0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat MaxY;
  uint64_t v28;
  double v29;
  CGRect v30;

  -[WSWebSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[WSWebSheetView getHeaderFrameHeight](self, "getHeaderFrameHeight");
  v8 = v7;
  v9 = -[WSWebSheetView _shouldShowPromptLabels](self, "_shouldShowPromptLabels");
  -[WSWebSheetView _addAndRemoveAddressViewsAsNeeded](self, "_addAndRemoveAddressViewsAsNeeded");
  -[WSWebSheetView _updateTitle](self, "_updateTitle");
  v10 = 0.0;
  if (v9)
  {
    -[WSWebSheetView getTopSafeAreaInsetTop](self, "getTopSafeAreaInsetTop");
    v12 = v11;
    -[WSWebSheetView getAddressViewHeight](self, "getAddressViewHeight");
    v10 = v12 + v13;
    -[UIView setFrame:](self->_addressView, "setFrame:", 0.0, v12, v4, v13);
  }
  -[UINavigationBar setFrame:](self->_navigationBar, "setFrame:", 0.0, v10, v4, v8);
  if (v9)
  {
    v29 = v6;
    v14 = -[WSWebSheetView _isSecureAddress](self, "_isSecureAddress");
    -[WSWebSheetView _promptLabelFontLineHeight](self, "_promptLabelFontLineHeight");
    v16 = v15;
    -[UIImageView image](self->_lockIconView, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v28 = v20;

    if (v14)
      v21 = v19 + 5.0;
    else
      v21 = 0.0;
    -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v4 + -20.0 - v21, v16, v28);
    v24 = v23;
    if (v22 >= v4 + -20.0 - v21)
      v25 = v4 + -20.0 - v21;
    else
      v25 = v22;
    v26 = v21 + RoundFloatToPixels((v4 - v25 - v21) * 0.5);
    if (v14)
      -[UIImageView setFrame:](self->_lockIconView, "setFrame:");
    -[UILabel setFrame:](self->_addressLabel, "setFrame:", v26, 2.0, v25, v24);
    -[UILabel setFrame:](self->_ssidLabel, "setFrame:", 10.0, v16 + 4.0, v4 + -20.0, v16);
    -[UIView addSubview:](self->_addressView, "addSubview:", self->_addressLabel);
    -[UIView addSubview:](self->_addressView, "addSubview:", self->_ssidLabel);
    v6 = v29;
  }
  else
  {
    -[UILabel removeFromSuperview](self->_addressLabel, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_ssidLabel, "removeFromSuperview");
  }
  -[UINavigationBar frame](self->_navigationBar, "frame");
  MaxY = CGRectGetMaxY(v30);
  -[WKWebView setFrame:](self->_webView, "setFrame:", 0.0, MaxY, v4, v6 - MaxY);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  WebThreadLock();
  -[WSWebSheetDownloadManager setDelegate:](self->_downloadManager, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WSWebSheetView;
  -[WSWebSheetView dealloc](&v4, sel_dealloc);
}

- (void)setProbeURL:(id)a3
{
  NSURL *v4;
  NSURL *probeURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  probeURL = self->_probeURL;
  self->_probeURL = v4;

}

- (void)setCurrentURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_currentURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentURL, a3);
    -[WSWebSheetView _updateAddress](self, "_updateAddress");
    v5 = v6;
  }

}

- (id)_evCertColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_evCertColor_color_0;
  if (!_evCertColor_color_0)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.262745098, 0.749019608, 0.345098039, 1.0);
    v4 = (void *)_evCertColor_color_0;
    _evCertColor_color_0 = v3;

    v2 = (void *)_evCertColor_color_0;
  }
  return v2;
}

- (id)_lockIconImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  GetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("Lock"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setHasEVCert:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_hasEVCert != a3)
  {
    self->_hasEVCert = a3;
    if (a3)
      -[WSWebSheetView _evCertColor](self, "_evCertColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_addressLabel, "setTextColor:", v6);
    -[UIImageView image](self->_lockIconView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_lockIconView, "setImage:", v5);

    -[UIImageView setTintColor:](self->_lockIconView, "setTintColor:", v6);
    -[WSWebSheetView _updateAddress](self, "_updateAddress");

  }
}

- (void)_addAndRemoveAddressViewsAsNeeded
{
  id v3;

  if (-[WSWebSheetView _shouldShowPromptLabels](self, "_shouldShowPromptLabels"))
  {
    -[UIView setHidden:](self->_addressView, "setHidden:", 0);
    -[NSURL _lp_simplifiedDisplayString](self->_currentURL, "_lp_simplifiedDisplayString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_addressLabel, "setText:");
    if (-[WSWebSheetView _isSecureAddress](self, "_isSecureAddress"))
      -[UIView addSubview:](self->_addressView, "addSubview:", self->_lockIconView);
    else
      -[UIImageView removeFromSuperview](self->_lockIconView, "removeFromSuperview");

  }
  else
  {
    -[UIImageView removeFromSuperview](self->_lockIconView, "removeFromSuperview");
    -[UIView setHidden:](self->_addressView, "setHidden:", 1);
  }
}

- (BOOL)_isSecureAddress
{
  void *v2;
  void *v3;
  char v4;

  -[NSURL scheme](self->_currentURL, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("https"));

  return v4;
}

- (BOOL)_shouldShowPromptLabels
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;

  -[WSWebSheetView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  return v4 < v6 || (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (id)_promptLabelFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
}

- (double)_promptLabelFontLineHeight
{
  void *v2;
  double v3;
  double v4;

  -[WSWebSheetView _promptLabelFont](self, "_promptLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = RoundFloatToPixels(v3);

  return v4;
}

- (void)_updateBackForwardButtons
{
  -[UIBarButtonItem setEnabled:](self->_backButtonItem, "setEnabled:", -[WKWebView canGoBack](self->_webView, "canGoBack"));
  -[UIBarButtonItem setEnabled:](self->_forwardButtonItem, "setEnabled:", -[WKWebView canGoForward](self->_webView, "canGoForward"));
}

- (void)_backButtonPressed
{
  id v2;

  v2 = -[WKWebView goBack](self->_webView, "goBack");
}

- (void)_forwardButtonPressed
{
  id v2;

  v2 = -[WKWebView goForward](self->_webView, "goForward");
}

- (void)cancelTapped
{
  _BOOL4 v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIAlertController *v10;
  UIAlertController *stayConnectedAlertController;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  const char *v17;
  void *v18;
  void *v19;
  UIBarButtonItem *cancelDoneBarButtonItem;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[6];

  NSLog(CFSTR("user tapped Cancel button"), a2);
  if (self->_shouldShowStayConnectedOptions)
  {
    v3 = -[WSWebSheetView isChinaRegion](self, "isChinaRegion");
    v4 = (void *)MEMORY[0x24BDD17C8];
    if (v3)
      v5 = "The WLAN “%@” is not connected to the Internet.";
    else
      v5 = "The Wi-Fi network “%@” is not connected to the Internet.";
    GetLocalizedString((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, self->_ssid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    GetLocalizedString((uint64_t)"Cancel (stay connected sheet)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GetLocalizedString((uint64_t)"Use Other Network");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v7, &stru_24FD35608, 0);
    v10 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    stayConnectedAlertController = self->_stayConnectedAlertController;
    self->_stayConnectedAlertController = v10;

    v12 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __30__WSWebSheetView_cancelTapped__block_invoke;
    v25[3] = &unk_24FD35288;
    v25[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v9, 0, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __30__WSWebSheetView_cancelTapped__block_invoke_2;
    v24[3] = &unk_24FD35288;
    v24[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 1, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WSWebSheetView isSetupAssistantRunning](self, "isSetupAssistantRunning");
    v16 = v15;
    v17 = "is not";
    if (v15)
      v17 = "is";
    NSLog(CFSTR("Setup Assistant %s running"), v17);
    if (!v16)
    {
      GetLocalizedString((uint64_t)"Use Without Internet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __30__WSWebSheetView_cancelTapped__block_invoke_3;
      v23[3] = &unk_24FD35288;
      v23[4] = self;
      objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v18, 2, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](self->_stayConnectedAlertController, "addAction:", v19);

    }
    -[UIAlertController addAction:](self->_stayConnectedAlertController, "addAction:", v13);
    -[UIAlertController addAction:](self->_stayConnectedAlertController, "addAction:", v14);
    -[UIAlertController setModalPresentationStyle:](self->_stayConnectedAlertController, "setModalPresentationStyle:", 7);
    cancelDoneBarButtonItem = self->_cancelDoneBarButtonItem;
    -[UIAlertController popoverPresentationController](self->_stayConnectedAlertController, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBarButtonItem:", cancelDoneBarButtonItem);

    -[WSWebSheetView webSheetViewController](self, "webSheetViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentViewController:animated:completion:", self->_stayConnectedAlertController, 1, &__block_literal_global);

  }
  else
  {
    -[WSWebSheetView dismissWebSheetWithCaptiveWebSheetResult:](self, "dismissWebSheetWithCaptiveWebSheetResult:", 1);
  }
}

uint64_t __30__WSWebSheetView_cancelTapped__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 576);
  *(_QWORD *)(v2 + 576) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 7);
}

void __30__WSWebSheetView_cancelTapped__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 576);
  *(_QWORD *)(v1 + 576) = 0;

}

uint64_t __30__WSWebSheetView_cancelTapped__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 576);
  *(_QWORD *)(v2 + 576) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 5);
}

- (void)doneTapped
{
  -[WSWebSheetView dismissWebSheetWithCaptiveWebSheetResult:](self, "dismissWebSheetWithCaptiveWebSheetResult:", 0);
}

- (BOOL)shouldShowStayConnectedOptions
{
  return self->_shouldShowStayConnectedOptions;
}

- (void)dismissWebSheetWithCaptiveWebSheetResult:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  NSLog(CFSTR("dismissing sheet with websheetResult %ld"), a2, a3);
  -[WSWebSheetView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WSWebSheetView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleCompleteNotificationWithRedirectURLtype:result:", self->_currentRedirectURLType, a3);

    -[WSWebSheetView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleDismissal");

  }
}

- (id)_sheetController
{
  WBUSheetController *sheetController;
  WBUSheetController *v4;
  WBUSheetController *v5;

  sheetController = self->_sheetController;
  if (!sheetController)
  {
    v4 = (WBUSheetController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC27D0]), "initWithDelegate:", self);
    v5 = self->_sheetController;
    self->_sheetController = v4;

    sheetController = self->_sheetController;
  }
  return sheetController;
}

- (void)addAlert:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *alerts;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (WebThreadIsCurrent())
  {
    WebThreadMakeNSInvocation();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArgument:atIndex:", &v10, 2);
    WebThreadCallDelegate();

    v4 = v10;
  }
  else
  {
    alerts = self->_alerts;
    if (!alerts)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v8 = self->_alerts;
      self->_alerts = v7;

      alerts = self->_alerts;
    }
    -[NSMutableArray addObject:](alerts, "addObject:", v4);
    -[WSWebSheetView _sheetController](self, "_sheetController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showSheetForAlert:inView:", v4, 0);

  }
}

- (BOOL)isChinaRegion
{
  if (isChinaRegion_once != -1)
    dispatch_once(&isChinaRegion_once, &__block_literal_global_95);
  return isChinaRegion_isChinaRegion;
}

uint64_t __31__WSWebSheetView_isChinaRegion__block_invoke()
{
  uint64_t v0;
  uint64_t result;

  v0 = CPGetDeviceRegionCode();
  NSLog(CFSTR("Device Region Code: %@"), v0);
  result = objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
  isChinaRegion_isChinaRegion = result;
  return result;
}

- (void)_precheckTrustForServerCertificate:(__SecTrust *)a3 host:(id)a4
{
  BOOL v6;
  uint64_t TrustResult;
  int64_t v8;
  SecTrustResultType result;
  CFErrorRef error;

  if (!self->_inDoneState)
  {
    result = kSecTrustResultInvalid;
    error = 0;
    v6 = SecTrustEvaluateWithError(a3, &error);
    TrustResult = SecTrustGetTrustResult(a3, &result);
    if (!v6 && error)
    {
      NSLog(CFSTR("SecTrustEvaluateWithError failed, %@\n"), error);
      CFRelease(error);
    }
    if ((_DWORD)TrustResult)
    {
      NSLog(CFSTR("SecTrustGetTrustResult failed, %d\n"), TrustResult);
LABEL_7:
      self->_everReceivedUntrustedCertificate = 1;
      v8 = 3;
    }
    else
    {
      switch(result)
      {
        case kSecTrustResultProceed:
        case kSecTrustResultUnspecified:
          NSLog(CFSTR("Got SecTrustEvaluate result %u. Allowing."), result);
          v8 = 2;
          break;
        case kSecTrustResultDeny:
          NSLog(CFSTR("Got SecTrustEvaluate result %u. Denying."), 3);
          goto LABEL_7;
        case kSecTrustResultRecoverableTrustFailure:
          NSLog(CFSTR("Got SecTrustEvaluate result %u. Need to prompt."), 5);
          goto LABEL_7;
        default:
          NSLog(CFSTR("Don't know how to handle SecTrustEvaluate result %u. Denying"), result);
          goto LABEL_7;
      }
    }
    self->_currentRedirectURLType = v8;
    self->_currentRedirectURLTypeSet = 1;
  }
}

- (BOOL)_handleCertificateError:(__SecTrust *)a3 newhost:(id)a4
{
  return objc_msgSend(MEMORY[0x24BEC27E0], "userAllowsCertificateTrust:host:", a3, a4);
}

- (id)_specializedMessageForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSErrorFailingURLKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "_web_userVisibleString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x24BDD1308]))
    {
      v8 = objc_msgSend(v3, "code");
      if (v8 > -1103)
      {
        switch(v8)
        {
          case -1018:
            v9 = "Data Roaming is turned off. You can enable Data Roaming in the Cellular Data section of Settings.";
            goto LABEL_33;
          case -1017:
          case -1016:
          case -1015:
          case -1013:
          case -1012:
            goto LABEL_18;
          case -1014:
          case -1008:
            v9 = "Hotspot login cannot open the page because it could not load any data.";
            goto LABEL_33;
          case -1011:
            v9 = "Hotspot login cannot open the page because the page is invalid.";
            goto LABEL_33;
          case -1010:
            v9 = "Hotspot login cannot open the page because the page does not exist.";
            goto LABEL_33;
          case -1009:
            goto LABEL_14;
          case -1007:
            v9 = "Hotspot login cannot open the page because too many redirects occurred.";
            goto LABEL_33;
          case -1006:
          case -1003:
            v9 = "Hotspot login cannot open the page because the server cannot be found.";
            goto LABEL_33;
          case -1005:
            v9 = "Hotspot login cannot open the page because the network connection was lost.";
            goto LABEL_33;
          case -1004:
            v9 = "Hotspot login cannot open the page because it could not connect to the server.";
            goto LABEL_33;
          case -1002:
            v15 = (void *)MEMORY[0x24BDD17C8];
            GetLocalizedString((uint64_t)"Hotspot login cannot open the page because it cannot redirect to locations start"
                                        "ing with “%@:”.");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "URLScheme");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", v12, v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          case -1001:
            v9 = "Hotspot login could not open the page because the server stopped responding.";
            goto LABEL_33;
          case -1000:
            v9 = "Hotspot login cannot open the page because the address is invalid.";
            goto LABEL_33;
          default:
            if (v8 == -1102)
            {
              v17 = (void *)MEMORY[0x24BDD17C8];
              GetLocalizedString((uint64_t)"You do not have permission to view “%@”.");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "path");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "displayNameAtPath:", v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", v12, v18);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (v8 != -1100)
                goto LABEL_18;
              v11 = (void *)MEMORY[0x24BDD17C8];
              GetLocalizedString((uint64_t)"No file exists at the address “%@”.");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "path");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "stringWithFormat:", v12, v14);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
            }

LABEL_38:
            break;
        }
        goto LABEL_34;
      }
      if (v8 > -1201)
      {
        if (v8 == -1200)
        {
          v9 = "Hotspot login cannot open the page because it could not establish a secure connection to the server.";
          goto LABEL_33;
        }
        if (v8 == -1103)
        {
          v9 = "Hotspot login cannot open the page because it is too large.";
          goto LABEL_33;
        }
      }
      else
      {
        if (v8 == -2000)
        {
LABEL_14:
          v9 = "Hotspot login cannot open the page because it is not connected to the Internet.";
          goto LABEL_33;
        }
        if (v8 == -1205)
        {
          v9 = "The website did not accept the certificate.";
          goto LABEL_33;
        }
      }
    }
LABEL_18:
    if (!objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x24BDD1128])
      || objc_msgSend(v3, "code") != 54)
    {
      v10 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v9 = "Hotspot login cannot open the page because the network connection was reset. The server may be busy.";
LABEL_33:
    GetLocalizedString((uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v10 = 0;
LABEL_35:

  return v10;
}

- (id)_titleForError:(id)a3
{
  uint64_t v3;
  const char *v4;
  void *v5;

  v3 = objc_msgSend(a3, "code");
  switch(v3)
  {
    case -1205:
      v4 = "Certificate Error";
      break;
    case -1100:
      v4 = "No File Exists";
      break;
    case -1102:
      v4 = "No Permission";
      break;
    default:
      v5 = 0;
      return v5;
  }
  GetLocalizedString((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFDictionary *SSLCertificateContext;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(v18, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && v9)
  {
    if (objc_msgSend(v9, "rangeOfString:", v8) != 0x7FFFFFFFFFFFFFFFLL)
      -[WSWebSheetView setCurrentURL:](self, "setCurrentURL:", v7);
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("https://")))
    {
      objc_msgSend(v18, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_CFURLResponse");
      SSLCertificateContext = (const __CFDictionary *)_CFURLResponseGetSSLCertificateContext();
      if (SSLCertificateContext && CFDictionaryGetValue(SSLCertificateContext, (const void *)*MEMORY[0x24BDB77A8]))
      {
        v14 = (void *)SecTrustCopyInfo();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDE94F0]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v16, "BOOLValue"))
              {
                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDE94E8]);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[WSWebSheetView setHasEVCert:](self, "setHasEVCert:", v17 != 0);

              }
            }
          }

        }
      }

    }
  }

}

- (void)_showProfileDownloadAlert
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BEC27D8]);
  GetLocalizedString((uint64_t)"Cannot Download Profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GetLocalizedString((uint64_t)"Hotspot login could not download this profile due to an unknown error.");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithType:title:bodyText:defaultAction:otherAction:", 8, v4, v5, 1, 0);

  -[WSWebSheetView addAlert:](self, "addAlert:", v6);
}

- (void)_showGenericDownloadAlert
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BEC27D8]);
  GetLocalizedString((uint64_t)"Download Failed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GetLocalizedString((uint64_t)"This file cannot be downloaded.");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithType:title:bodyText:defaultAction:otherAction:", 9, v4, v5, 1, 0);

  -[WSWebSheetView addAlert:](self, "addAlert:", v6);
}

- (void)handleProbeResult:(int64_t)a3
{
  void *v4;
  void *v5;
  NSString *loginURL;

  if (a3 != 3)
  {
    if (!a3)
    {
      NSLog(CFSTR("captive probe was successful"), a2);
      -[WSWebSheetView delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4 && self->_postMessage)
      {
        loginURL = self->_loginURL;

        if (!loginURL)
        {
LABEL_8:
          -[WSWebSheetView updateToDoneButton](self, "updateToDoneButton");
          -[WSWebSheetView updateResultOptions](self, "updateResultOptions");
          return;
        }
        -[WSWebSheetView delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scrapeCredentialsUsingPOSTMessage:loginURL:", self->_postMessage, self->_loginURL);
      }

      goto LABEL_8;
    }
    goto LABEL_10;
  }
  if (self->_lastResultWasTimeoutError)
  {
LABEL_10:
    NSLog(CFSTR("captive probe failed with error %ld"), a2, a3);
    -[WSWebSheetView dequeueRedirectTypeQueue](self, "dequeueRedirectTypeQueue");
    return;
  }
  NSLog(CFSTR("captive probe timed out"), a2);
  self->_lastResultWasTimeoutError = 1;
  -[WSWebSheetView pushBackToRedirectTypeQueue](self, "pushBackToRedirectTypeQueue");
  -[WSWebSheetView dispatchCaptiveProbe](self, "dispatchCaptiveProbe");
}

- (void)_showProfileInstallAlert
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BEC27D8]);
  GetLocalizedString((uint64_t)"Cannot Install Profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GetLocalizedString((uint64_t)"Hotspot login could not install this profile due to an unknown error.");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithType:title:bodyText:defaultAction:otherAction:", 7, v4, v5, 1, 0);

  -[WSWebSheetView addAlert:](self, "addAlert:", v6);
}

- (void)downloadDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;

  -[WSWebSheetDownloadManager fileDownloadPath](self->_downloadManager, "fileDownloadPath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v8 = (id)objc_msgSend(v6, "queueFileDataForAcceptance:originalFileName:outError:", v5, v7, &v11);
      v9 = v11;

      -[WSWebSheetDownloadManager removeFromDisk](self->_downloadManager, "removeFromDisk");
      if (v9)
      {
        NSLog(CFSTR("Failed to install the configuration profile. error: %@"), v9);
        -[WSWebSheetView _showProfileInstallAlert](self, "_showProfileInstallAlert");
      }

    }
    else
    {
      NSLog(CFSTR("Failed to read data from downloaded configuration profile"));
      -[WSWebSheetView _showProfileDownloadAlert](self, "_showProfileDownloadAlert");
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__WSWebSheetView_downloadDidFinish___block_invoke;
    block[3] = &unk_24FD35238;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    NSLog(CFSTR("Failed to find downloaded configuration file"));
  }

}

uint64_t __36__WSWebSheetView_downloadDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 0);
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  objc_msgSend(a5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "loadRequest:", v8);

  return 0;
}

- (id)_presentingViewControllerForWebView:(id)a3
{
  return self->_webSheetViewController;
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a5;
  self->_currentRedirectURLTypeSet = 0;
  NSLog(CFSTR("[WEB_SHEET_LOGGING] failed navigation with error %@"), v6);
  -[WSWebSheetView displayLoadingSpinner:](self, "displayLoadingSpinner:", 0);
  v7 = objc_msgSend(v6, "code");
  if ((!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x24BEC27A8]) || v7 != 102 && v7 != 204)
    && (!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x24BDD1308]) || v7 != -1012 && v7 != -999))
  {
    objc_msgSend(v6, "userInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      NSLog(CFSTR("WebSheet: did fail loading with error: %@"), v8);
    -[WSWebSheetView _specializedMessageForError:](self, "_specializedMessageForError:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      GetLocalizedString((uint64_t)"An error occurred. The page could not be opened.");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WSWebSheetView _titleForError:](self, "_titleForError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      GetLocalizedString((uint64_t)"Error Opening Page");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v11, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDF67E8];
    GetLocalizedString((uint64_t)"OK");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke;
    v17[3] = &unk_24FD35288;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v15);
    -[WSWebSheetView webSheetViewController](self, "webSheetViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v12, 1, &__block_literal_global_162);

  }
}

void __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke_2;
  block[3] = &unk_24FD35238;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 1);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a5;
  self->_currentRedirectURLTypeSet = 0;
  NSLog(CFSTR("[WEB_SHEET_LOGGING] web view failed to load content with error %@"), v6);
  v7 = objc_msgSend(v6, "code");
  if ((!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x24BEC27A8]) || v7 != 102 && v7 != 204)
    && (!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x24BDD1308]) || v7 != -1012 && v7 != -999))
  {
    objc_msgSend(v6, "userInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      NSLog(CFSTR("WebSheet: did fail loading with error: %@"), v8);
    -[WSWebSheetView _specializedMessageForError:](self, "_specializedMessageForError:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      GetLocalizedString((uint64_t)"An error occurred. The page could not be opened.");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WSWebSheetView _titleForError:](self, "_titleForError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      GetLocalizedString((uint64_t)"Error Opening Page");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v11, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDF67E8];
    GetLocalizedString((uint64_t)"OK");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke;
    v17[3] = &unk_24FD35288;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v15);
    -[WSWebSheetView webSheetViewController](self, "webSheetViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v12, 1, &__block_literal_global_165);

  }
}

void __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke_2;
  block[3] = &unk_24FD35238;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 1);
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "_committedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSWebSheetView setCurrentURL:](self, "setCurrentURL:", v5);

  v6 = objc_msgSend(v13, "hasOnlySecureContent");
  v7 = v13;
  if (v6)
  {
    v8 = objc_msgSend(v13, "serverTrust");
    v7 = v13;
    if (v8)
    {
      objc_msgSend(v13, "serverTrust");
      v9 = (void *)SecTrustCopyInfo();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDE94F0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v11, "BOOLValue"))
            {
              objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDE94E8]);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[WSWebSheetView setHasEVCert:](self, "setHasEVCert:", v12 != 0);

            }
          }
        }

      }
      v7 = v13;
    }
  }

}

- (BOOL)isUserAprroved:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  const __CFString *LocalizedString;
  const __CFString *v7;
  SInt32 v8;
  BOOL v10;
  CFOptionFlags v12;

  v12 = 0;
  v3 = a3;
  GetLocalizedString((uint64_t)"Open in “%@”?");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v4, v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  LocalizedString = (const __CFString *)GetLocalizedString((uint64_t)"SCHEME_APPROVAL_OPEN_BUTTON");
  v7 = (const __CFString *)GetLocalizedString((uint64_t)"SCHEME_APPROVAL_DO_NOT_OPEN_BUTTON");
  v8 = CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v5, 0, LocalizedString, v7, 0, &v12);
  v10 = (v12 & 3) == 0 && v8 == 0;

  return v10;
}

- (id)appNametoOpenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v4 = a3;
  NSLog(CFSTR("looking for an app that can open url: [%@]"), v4);
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("http")))
  {

  }
  else
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("https"));

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applicationsAvailableForOpeningURL:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v17 = (void *)MEMORY[0x24BDC1538];
        objc_msgSend(v10, "applicationIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applicationProxyForIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedNameForContext:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        NSLog(CFSTR("app [%@] can open the url"), v14);
      }
      else
      {
        NSLog(CFSTR("%@ failed to find an app that can open the link"), self);
        v14 = 0;
      }
      goto LABEL_16;
    }
  }
  v21 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1560]), "initWithURL:error:", v4, &v21);
  v9 = v21;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "bundleRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      if (objc_msgSend(v12, "isWebBrowser"))
      {
        objc_msgSend(v12, "localizedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("App [%@] is a web browser"), v13);

        objc_msgSend(v12, "localizedName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("failed to find claim binding, error: %@"), v9);
    v14 = 0;
  }

LABEL_16:
  return v14;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  __CFString *v47;
  id v48;
  _QWORD v49[5];
  _QWORD block[5];
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v9, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "navigationType");
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 <= 1)
  {
    if (objc_msgSend(v13, "hasTelephonyScheme"))
    {
      NSLog(CFSTR("found telephony scheme in the URL"));
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v14, "phoneNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "telephonyURLWithDestinationID:promptUser:", v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "openURL:withOptions:", v18, 0);

LABEL_4:
LABEL_15:
      v10[2](v10, 0);
      goto LABEL_16;
    }
    objc_msgSend(v14, "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("mailto"));

    if (v20)
    {
      NSLog(CFSTR("found mailto scheme in the URL"));
      objc_msgSend(v9, "targetFrame");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(v9, "targetFrame");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isMainFrame");

        if (!v24)
          goto LABEL_15;
      }
      if (!objc_msgSend((id)*MEMORY[0x24BDF74F8], "canOpenURL:", v14)
        || !-[WSWebSheetView isUserAprroved:](self, "isUserAprroved:", CFSTR("Mail")))
      {
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "openURL:withOptions:", v14, 0);
      goto LABEL_4;
    }
  }
  if (self->_inDoneState && !self->_enableTVMode)
  {
    NSLog(CFSTR("[authenticated state]: url %@"), v14);
    -[WSWebSheetView appNametoOpenURL:](self, "appNametoOpenURL:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10[2](v10, 1);
    }
    else
    {
      NSLog(CFSTR("This is a navigation to user activated link (WKNavigationTypeLinkActivated)"));
      if (v27)
      {
        if (!-[WSWebSheetView isUserAprroved:](self, "isUserAprroved:", v27))
        {
          NSLog(CFSTR("[authenticated state]/[WKNavigationTypeLinkActivated] user did not approve openURL"));
          v10[2](v10, 0);
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v29 = objc_msgSend(v28, "openURL:withOptions:error:", v14, 0, &v51);
        v30 = v51;

        if (v29)
        {
          NSLog(CFSTR("[authenticated state]/[WKNavigationTypeLinkActivated] openURL succeeded. exiting ..."));
          v10[2](v10, 0);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
          block[3] = &unk_24FD35238;
          block[4] = self;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

          goto LABEL_19;
        }
        NSLog(CFSTR("[authenticated state]/[WKNavigationTypeLinkActivated]: openURL failed with error %@"), v30);
      }
      else
      {
        v30 = 0;
      }
      v31 = (void *)MEMORY[0x24BEC27A0];
      objc_msgSend(v9, "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = objc_msgSend(v31, "_canHandleRequest:", v32);

      if (!(_DWORD)v31)
      {

        goto LABEL_14;
      }
      v48 = v30;
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("com-apple-mobilesafari-tab:"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      escapedStringFromURL(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "appendString:", v35);

      objc_msgSend(v8, "URL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v33, "appendString:", CFSTR("?back="));
        objc_msgSend(v8, "URL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        escapedStringFromURL(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "appendString:", v38);

      }
      objc_msgSend(v14, "host");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("itunes.apple.com"));
      v41 = CFSTR("Safari");
      if (v40)
        v41 = CFSTR("iTunes Store");
      v42 = v41;

      if (-[WSWebSheetView isUserAprroved:](self, "isUserAprroved:", v42))
      {
        v47 = v42;
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "openSensitiveURL:withOptions:", v44, 0);

        if ((v45 & 1) == 0)
          NSLog(CFSTR("[authenticated state]/[WKNavigationTypeLinkActivated]: Failed to open safari tab URL %@"), v33);
        v10[2](v10, 0);
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
        v49[3] = &unk_24FD35238;
        v49[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], v49);
        v42 = v47;
        v46 = v48;
      }
      else
      {
        NSLog(CFSTR("[authenticated state]/[WKNavigationTypeLinkActivated] user did not approve openURL"));
        v10[2](v10, 0);
        v46 = v48;
      }

      v27 = v42;
    }
LABEL_19:

    goto LABEL_16;
  }
  NSLog(CFSTR("[pre-authenticated state]: url %@"), v14);
  v25 = (void *)MEMORY[0x24BEC27A0];
  objc_msgSend(v9, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v25, "_canHandleRequest:", v26);

  if ((v25 & 1) == 0)
    goto LABEL_15;
LABEL_14:
  v10[2](v10, 3);
LABEL_16:

}

uint64_t __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 0);
}

uint64_t __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 0);
}

- (BOOL)isConfigurationProfileMIMEType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptedMIMETypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(v3, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);

  v14 = (void (**)(void))a5;
  v7 = a4;
  NSLog(CFSTR("decidePolicyForNavigationResponse"));
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "MIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WSWebSheetView isConfigurationProfileMIMEType:](self, "isConfigurationProfileMIMEType:", v9))
  {
    objc_msgSend(v8, "suggestedFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isEqualToString:", CFSTR("mobileconfig"));

    v14[2]();
  }
  else
  {
    -[WSWebSheetView dispatchCaptiveProbe](self, "dispatchCaptiveProbe");
    ((void (*)(void (**)(void), uint64_t))v14[2])(v14, 1);
  }

}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  WSWebSheetView *v25;
  int v26;
  _QWORD block[5];
  id v28;
  void (**v29)(id, uint64_t, _QWORD);
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v9, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB7410]))
    goto LABEL_6;
  objc_msgSend(v9, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "serverTrust"))
  {

LABEL_6:
    goto LABEL_7;
  }
  v25 = self;
  objc_msgSend(v9, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v16 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v15, "isEqualToString:", v18);

  v8 = v16;
  if (!v26)
  {
LABEL_7:
    v10[2](v10, 1, 0);
    goto LABEL_8;
  }
  objc_msgSend(v9, "protectionSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "serverTrust");

  objc_msgSend(v9, "protectionSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "host");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[WSWebSheetView _precheckTrustForServerCertificate:host:](v25, "_precheckTrustForServerCertificate:host:", v20, v22);
  dispatch_get_global_queue(25, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
  block[3] = &unk_24FD35378;
  v30 = v20;
  block[4] = v25;
  v28 = v22;
  v29 = v10;
  v24 = v22;
  dispatch_async(v23, block);

LABEL_8:
}

void __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  char v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_handleCertificateError:newhost:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_24FD35350;
  v8 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v7 = v4;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 2, 0);
    objc_msgSend(*(id *)(a1 + 32), "dismissWebSheetWithCaptiveWebSheetResult:", 1);
  }
}

- (void)updateRedirectURLTypeSetting
{
  void *v3;
  int v4;
  NSURL *navigationURLAtStart;
  void *v6;
  void *v7;
  int64_t currentRedirectURLType;
  int64_t v9;
  NSURL *v10;

  if (!self->_inDoneState)
  {
    if (self->_firstNavigation
      && (-[WKWebView URL](self->_webView, "URL"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "isEqual:", self->_probeURL),
          v3,
          v4))
    {
      NSLog(CFSTR("first navigation did not fetch HTTP redirect"));
      self->_firstNavigation = 0;
      self->_currentRedirectURLType = 1;
    }
    else
    {
      navigationURLAtStart = self->_navigationURLAtStart;
      if (!navigationURLAtStart)
        return;
      -[NSURL scheme](navigationURLAtStart, "scheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("http")))
      {
        v9 = 3;
        if (!self->_everReceivedUntrustedCertificate)
          v9 = 1;
        self->_currentRedirectURLType = v9;
      }
      else
      {
        if (self->_currentRedirectURLTypeSet)
          currentRedirectURLType = self->_currentRedirectURLType;
        else
          currentRedirectURLType = 2;
        self->_currentRedirectURLType = currentRedirectURLType;
        if (self->_everReceivedUntrustedCertificate)
          currentRedirectURLType = 3;
        self->_currentRedirectURLType = currentRedirectURLType;
      }

    }
    self->_currentRedirectURLTypeSet = 1;
    v10 = self->_navigationURLAtStart;
    if (v10)
    {
      self->_navigationURLAtStart = 0;

    }
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  NSURL *navigationURLAtStart;
  NSURL *v6;
  NSURL *v7;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_beginShowingNetworkActivityIndicator", a3, a4);
  if (!self->_inDoneState)
  {
    self->_currentRedirectURLTypeSet = 0;
    navigationURLAtStart = self->_navigationURLAtStart;
    if (navigationURLAtStart)
    {
      self->_navigationURLAtStart = 0;

    }
    -[WKWebView URL](self->_webView, "URL");
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_navigationURLAtStart;
    self->_navigationURLAtStart = v6;

  }
}

- (void)dispatchCaptiveProbe
{
  uint64_t v3;
  NSObject *queue;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD block[5];

  if (!self->_inDoneState)
  {
    v3 = MEMORY[0x24BDAC760];
    if (self->_currentRedirectURLTypeSet)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke;
      block[3] = &unk_24FD35238;
      block[4] = self;
      dispatch_async(queue, block);
    }
    -[WSWebSheetView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WSWebSheetView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v3;
      v7[1] = 3221225472;
      v7[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_2;
      v7[3] = &unk_24FD353A0;
      v7[4] = self;
      objc_msgSend(v6, "handleWebNavigationWithCompletionHandler:", v7);

    }
  }
}

void __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 520);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(v1 + 536));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_3;
  v2[3] = &unk_24FD35260;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleProbeResult:", *(_QWORD *)(a1 + 40));
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSLog(CFSTR("didFinishNavigation"), a2, a3, a4);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_endShowingNetworkActivityIndicator");
  -[WSWebSheetView _stopCaptiveProbeDispatchTimer](self, "_stopCaptiveProbeDispatchTimer");
  -[WSWebSheetView _updateBackForwardButtons](self, "_updateBackForwardButtons");
  -[WSWebSheetView updateRedirectURLTypeSetting](self, "updateRedirectURLTypeSetting");
  -[WSWebSheetView dispatchCaptiveProbe](self, "dispatchCaptiveProbe");
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  -[_SFFormAutoFillController fieldFocusedWithInputSession:](self->_autoFillController, "fieldFocusedWithInputSession:", a4);
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *postMessage;
  void *v18;
  NSString *v19;
  NSString *loginURL;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("username"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("user"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("password"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    NSLog(CFSTR("found valid credentials from values provided by willSubmitFormValues"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("username=%@&password=%@"), v13, v15);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    postMessage = self->_postMessage;
    self->_postMessage = v16;

    objc_msgSend(v21, "_committedURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "relativeString");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    loginURL = self->_loginURL;
    self->_loginURL = v19;

    v12[2](v12);
  }
  else
  {
    -[_SFFormAutoFillController willSubmitFormValues:userObject:submissionHandler:](self->_autoFillController, "willSubmitFormValues:userObject:submissionHandler:", v10, v11, v12);
  }

}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded", a3, a4);
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded", a3, a4);
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
  -[_SFFormAutoFillController autoFill](self->_autoFillController, "autoFill", a3, a4);
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
  -[_SFFormAutoFillController insertTextSuggestion:](self->_autoFillController, "insertTextSuggestion:", a4);
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return 0;
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return 1;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  return -[WKWebView URL](self->_webView, "URL", a3);
}

- (void)_captiveProbeDispatchTimerDidFire:(id)a3
{
  -[WSWebSheetView dispatchCaptiveProbe](self, "dispatchCaptiveProbe", a3);
  -[WSWebSheetView _stopCaptiveProbeDispatchTimer](self, "_stopCaptiveProbeDispatchTimer");
}

- (void)_stopCaptiveProbeDispatchTimer
{
  NSTimer *captiveProbeDispatchTimer;

  -[NSTimer invalidate](self->_captiveProbeDispatchTimer, "invalidate");
  captiveProbeDispatchTimer = self->_captiveProbeDispatchTimer;
  self->_captiveProbeDispatchTimer = 0;

}

- (void)_startCaptiveProbeDispatchTimer
{
  NSTimer *v3;
  NSTimer *captiveProbeDispatchTimer;

  -[WSWebSheetView _stopCaptiveProbeDispatchTimer](self, "_stopCaptiveProbeDispatchTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__captiveProbeDispatchTimerDidFire_, 0, 0, 10.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  captiveProbeDispatchTimer = self->_captiveProbeDispatchTimer;
  self->_captiveProbeDispatchTimer = v3;

}

- (NSUUID)tabIDForAutoFill
{
  return self->tabIDForAutoFill;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (WSWebSheetViewController)webSheetViewController
{
  return self->_webSheetViewController;
}

- (void)setWebSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_webSheetViewController, a3);
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (NSURL)probeURL
{
  return self->_probeURL;
}

- (void)setShouldShowStayConnectedOptions:(BOOL)a3
{
  self->_shouldShowStayConnectedOptions = a3;
}

- (BOOL)enableTVMode
{
  return self->_enableTVMode;
}

- (void)setEnableTVMode:(BOOL)a3
{
  self->_enableTVMode = a3;
}

- (NSDictionary)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void)setProxyConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSMutableDictionary)resultOptions
{
  return self->_resultOptions;
}

- (void)setResultOptions:(id)a3
{
  objc_storeStrong((id *)&self->_resultOptions, a3);
}

- (WSWebSheetViewDelegate)delegate
{
  return (WSWebSheetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasEVCert
{
  return self->_hasEVCert;
}

- (BOOL)isCertTrustDone
{
  return self->_isCertTrustDone;
}

- (void)setIsCertTrustDone:(BOOL)a3
{
  self->_isCertTrustDone = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultOptions, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong((id *)&self->tabIDForAutoFill, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_postMessage, 0);
  objc_storeStrong((id *)&self->_loginURL, 0);
  objc_storeStrong((id *)&self->_captiveProbeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_stayConnectedAlertController, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_navigationURLAtStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_redirectTypeQueue, 0);
  objc_storeStrong((id *)&self->_sheetController, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
  objc_storeStrong((id *)&self->_ssidLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_lockIconView, 0);
  objc_storeStrong((id *)&self->_addressView, 0);
  objc_storeStrong((id *)&self->_forwardButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelDoneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
