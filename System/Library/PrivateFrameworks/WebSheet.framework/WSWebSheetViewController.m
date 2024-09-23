@implementation WSWebSheetViewController

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  WSWebSheetView *v8;

  NSLog(CFSTR("loadView"), a2);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = -[WSWebSheetView initWithFrame:webSheetViewController:]([WSWebSheetView alloc], "initWithFrame:webSheetViewController:", self, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), v5, v7);
  -[WSWebSheetViewController setView:](self, "setView:", v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WSWebSheetViewController;
  -[WSWebSheetViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[WSWebSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeKeyWindow");

}

- (void)dismissViewController:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[WSWebSheetViewController webSheetView](self, "webSheetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__WSWebSheetViewController_dismissViewController___block_invoke;
    v7[3] = &unk_24FD35260;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }
}

void __50__WSWebSheetViewController_dismissViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "webSheetView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissWebSheetWithCaptiveWebSheetResult:", *(_QWORD *)(a1 + 40));

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 enableTVMode:(BOOL)a7 delegate:(id)a8
{
  _BOOL8 v8;
  void *v10;
  id v11;

  v8 = a7;
  -[WSWebSheetViewController startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:](self, "startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:", a3, a4, a5, a6, !a7, a8);
  -[WSWebSheetViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WSWebSheetViewController view](self, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnableTVMode:", v8);

  }
}

- (void)startWithURL:(id)a3 ssid:(id)a4 interface:(id)a5 proxyConfiguration:(id)a6 showCancelMenu:(BOOL)a7 delegate:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v9 = a7;
  v26 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  -[WSWebSheetViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDB7448], "sharedHTTPCookieStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "webui_applySafariCookieAcceptPolicy");
    objc_msgSend(MEMORY[0x24BEC2798], "standardPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_synchronizeWebStoragePolicyWithCookiePolicy");
    objc_msgSend(v20, "setStorageTrackerEnabled:", 0);
    objc_msgSend(v20, "setOfflineWebApplicationCacheEnabled:", 0);
    objc_msgSend(v20, "setDatabasesEnabled:", 0);
    objc_msgSend(v20, "setLocalStorageEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEC2798], "standardPreferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPrivateBrowsingEnabled:", 1);

    -[WSWebSheetViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", v17);
    objc_msgSend(v22, "setCurrentURL:", v26);
    objc_msgSend(v22, "setProbeURL:", v26);
    objc_msgSend(v22, "setSSID:", v14);
    if (v16)
      objc_msgSend(v22, "setProxyConfiguration:", v16);
    objc_msgSend(v22, "setShouldShowStayConnectedOptions:", v9);
    objc_msgSend(v22, "setWebViewWithInterfaceName:", v15);
    objc_msgSend(v22, "webView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "loadRequest:", v24);

  }
  else
  {
    NSLog(CFSTR("WebSheet view is not constructed"));
  }

}

- (void)handleProbeResult:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WSWebSheetViewController_handleProbeResult_completionHandler___block_invoke;
  block[3] = &unk_24FD353E8;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __64__WSWebSheetViewController_handleProbeResult_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "webSheetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleProbeResult:", *(_QWORD *)(a1 + 48));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
