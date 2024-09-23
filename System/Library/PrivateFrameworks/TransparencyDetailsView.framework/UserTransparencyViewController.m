@implementation UserTransparencyViewController

- (UserTransparencyViewController)initWithUserTransparencyDetails:(id)a3
{
  id v4;
  UserTransparencyViewController *v5;
  UserTransparencyViewController *v6;
  _QWORD block[4];
  UserTransparencyViewController *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UserTransparencyViewController;
  v5 = -[UserTransparencyViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[UserTransparencyViewController setUserTransparencyDetails:](v5, "setUserTransparencyDetails:", v4);
    -[UserTransparencyViewController setIsiPad:](v6, "setIsiPad:", MGGetBoolAnswer());
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__UserTransparencyViewController_initWithUserTransparencyDetails___block_invoke;
    block[3] = &unk_24D8FBBD0;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v6;
}

uint64_t __66__UserTransparencyViewController_initWithUserTransparencyDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commonInit");
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (self->_userTransparencyDetails)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: The initWithUserTransparencyDetails passed in a non nil payload."), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[UserTransparencyViewController errorDelegate](self, "errorDelegate");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadIDs");

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_renderingStatusForPAPermission = objc_msgSend(v5, "isPersonalizedAdsEnabled");

    -[UserTransparencyViewController immediatelyLoadViewControllerBeforeNetworkRequest](self, "immediatelyLoadViewControllerBeforeNetworkRequest");
    -[UserTransparencyViewController presentViewDelegate](self, "presentViewDelegate");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__UserTransparencyViewController__commonInit__block_invoke;
    v6[3] = &unk_24D8FBBF8;
    v6[4] = self;
    -[UserTransparencyViewController requestUserTransparencyDetailsWithCompletionHandler:](self, "requestUserTransparencyDetailsWithCompletionHandler:", v6);
  }
}

void __45__UserTransparencyViewController__commonInit__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Connection to UserTransparencyViewController established with TransparencyDetailsView framework."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__UserTransparencyViewController__commonInit__block_invoke_2;
  block[3] = &unk_24D8FBBD0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __45__UserTransparencyViewController__commonInit__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadWebView");
}

- (void)requestUserTransparencyDetailsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  UserTransparencyViewController *v21;
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("zh"));

  if (v9)
  {
    objc_msgSend(v6, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UserTransparencyViewController normalizeChineseLanguage:](self, "normalizeChineseLanguage:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke;
  v17[3] = &unk_24D8FBC48;
  v18 = v6;
  v19 = v7;
  v20 = v5;
  v21 = self;
  v22 = v4;
  v13 = v4;
  v14 = v5;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v12, "addOperationWithBlock:", v17);

}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_24D8FBC48;
  v7 = v2;
  v8 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v9 = v3;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v7, "reloadStorefront:", v6);

}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE02248]);
  objc_msgSend(v2, "encryptedIDForClientType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentiAdID:", v4);

  objc_msgSend(v2, "encryptedIDForClientType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDPID:", v5);

  objc_msgSend(v2, "encryptedIDForClientType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIAdID:", v6);

  objc_msgSend(*(id *)(a1 + 32), "iTunesStorefront");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setITunesStore:", v7);

  objc_msgSend(v3, "setLocaleIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setLimitAdTracking:", objc_msgSend(*(id *)(a1 + 32), "isPersonalizedAdsEnabled") ^ 1);
  objc_msgSend(v2, "activeDSIDRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsSignedInToiTunes:", objc_msgSend(v9, "BOOLValue"));

  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "defaultServerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_24D8FBC20;
  v12 = *(void **)(a1 + 64);
  v13[4] = *(_QWORD *)(a1 + 56);
  v14 = v12;
  objc_msgSend(v10, "handleRequest:serverURL:responseHandler:", v3, v11, v13);

}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
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
  void *v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: The requestUserTransparencyDetailsWithCompletionHandler failed with error %ld."), objc_opt_class(), objc_msgSend(v8, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02250]), "initWithData:", v27);
    objc_msgSend(*(id *)(a1 + 32), "setUserTransparencyResponseData:", v10);

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "userTransparencyResponseData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "AD_jsonString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Received response for ADUserTransparencyRequest: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 32), "userTransparencyResponseData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transparencyDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transparencyRendererPayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUserTransparencyRendererPayload:", v17);

    objc_msgSend(*(id *)(a1 + 32), "userTransparencyResponseData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transparencyDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transparencyRendererURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUserTransparencyRendererURL:", v20);

    objc_msgSend(*(id *)(a1 + 32), "userTransparencyResponseData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transparencyDetails");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transparencyDetailsUnavailableMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUserTransparencyDetailsUnavailableMessage:", v23);

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "userTransparencyRendererPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("The privacy data key being used is: %@."), v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v8);

}

- (void)presentViewDelegate
{
  void *v3;
  char v4;
  void *v5;

  -[UserTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UserTransparencyViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userTransparencyViewControllerDidLoad:", self);

  }
  -[UserTransparencyViewController _reportUserTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportUserTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyUserTransparencyDidAppear"), 0);
}

- (void)errorDelegate
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[UserTransparencyViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UserTransparencyViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("UserTransparencyViewControllerErrorDomain"), 0, &unk_24D8FEE10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userTransparencyViewController:didFailWithError:", self, v5);

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
  void *v25;
  id v26;

  v26 = a3;
  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating");
  -[UserTransparencyViewController errorLabel](self, "errorLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[UserTransparencyViewController setErrorLabel:](self, "setErrorLabel:", v6);

    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UserTransparencyViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("errorLabel"), v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UserTransparencyViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[errorLabel]-20-|"), 0, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addConstraints:", v20);

    -[UserTransparencyViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[errorLabel]-|"), 0, 0, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addConstraints:", v22);

  }
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Advertising information isn’t available right now. Try again later."), &stru_24D8FBF78, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UserTransparencyViewController errorLabel](self, "errorLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v26);

  -[UserTransparencyViewController errorLabel](self, "errorLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 0);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[UIActivityIndicatorView stopAnimating](self->activityIndicator, "stopAnimating", a3, a4);
  -[UserTransparencyViewController _hideErrorMessage](self, "_hideErrorMessage");
  -[UserTransparencyViewController _reportUserTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportUserTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyUserTransparencyDidRenderTransparency"), 0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[UserTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  void *v6;

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[UserTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
}

- (void)_hideErrorMessage
{
  void *v3;
  id v4;

  -[UserTransparencyViewController errorLabel](self, "errorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UserTransparencyViewController errorLabel](self, "errorLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)_closeViewController:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[UserTransparencyViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__UserTransparencyViewController__closeViewController___block_invoke;
  v5[3] = &unk_24D8FBBD0;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

  -[UserTransparencyViewController _reportUserTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportUserTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyUserTransparencyDidDisappear"), 0);
}

void __55__UserTransparencyViewController__closeViewController___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "userTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)immediatelyLoadViewControllerBeforeNetworkRequest
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
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
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIActivityIndicatorView *v51;
  UIActivityIndicatorView *activityIndicator;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[4];
  uint64_t v102;
  void *v103;
  void *v104;
  _QWORD v105[5];

  v105[3] = *MEMORY[0x24BDAC8D0];
  if (-[UserTransparencyViewController isiPad](self, "isiPad"))
    v3 = 2;
  else
    v3 = 1;
  -[UserTransparencyViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v3);
  -[UserTransparencyViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[UserTransparencyViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF6BE0]);
  -[UserTransparencyViewController setTransparencyNavBar:](self, "setTransparencyNavBar:", v6);

  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslucent:", 0);

  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizesSubviews:", 1);

  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 18);

  -[UserTransparencyViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v86 = (void *)MEMORY[0x24BDD1628];
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v92);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v90;
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rightAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v15;
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "activateConstraints:", v21);

  v22 = objc_alloc(MEMORY[0x24BDF6C00]);
  objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Ad Targeting Information"), &stru_24D8FBF78, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTitle:", v23);

  objc_msgSend(v24, "setStyle:", 0);
  v25 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D8FBF78, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "initWithTitle:style:target:action:", v26, 2, self, sel__closeViewController_);

  v97 = (void *)v27;
  objc_msgSend(v24, "setRightBarButtonItem:", v27);
  v99 = v24;
  v104 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setItems:", v28);

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceStyle");

  if (v31 == 2)
  {
    v32 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
    objc_msgSend(v32, "configureWithOpaqueBackground");
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v33);

    v102 = *MEMORY[0x24BDF6600];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTitleTextAttributes:", v35);

    -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setStandardAppearance:", v32);

    -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setScrollEdgeAppearance:", v32);

    -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslucent:", 0);

  }
  v39 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
  v40 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UserTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("        window.transparency = {            isLocationPermissionGranted: () => { return 0 },            isPAEnabled: () => { return %@ }         }    "), v41);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = v39;
  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v95, 0, 1);
  objc_msgSend(v39, "addUserScript:", v93);
  v89 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(v89, "setUserContentController:", v39);
  v42 = objc_alloc(MEMORY[0x24BDFA918]);
  v43 = (void *)objc_msgSend(v42, "initWithFrame:configuration:", v89, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UserTransparencyViewController setMyUserPrivacyWebView:](self, "setMyUserPrivacyWebView:", v43);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNavigationDelegate:", self);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setOpaque:", 0);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "scrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setContentInsetAdjustmentBehavior:", 2);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAutoresizesSubviews:", 1);

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAutoresizingMask:", 18);

  v51 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v51;

  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "frame");
  v55 = v54 * 0.5;
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "frame");
  v58 = v57 * 0.5;
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "frame");
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v55, v58 - v60);

  -[UIActivityIndicatorView setAutoresizingMask:](self->activityIndicator, "setAutoresizingMask:", 45);
  -[UIActivityIndicatorView startAnimating](self->activityIndicator, "startAnimating");
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSubview:", self->activityIndicator);

  -[UserTransparencyViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", v63);

  v76 = (void *)MEMORY[0x24BDD1628];
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController transparencyNavBar](self, "transparencyNavBar");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v81;
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v75;
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v67;
  -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leftAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UserTransparencyViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leftAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v72;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "activateConstraints:", v73);

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
  id v10;
  void *v11;
  id v12;

  -[UserTransparencyViewController userTransparencyRendererURL](self, "userTransparencyRendererURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[UserTransparencyViewController userTransparencyRendererURL](self, "userTransparencyRendererURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v12);
    objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
    -[UserTransparencyViewController userTransparencyRendererPayload](self, "userTransparencyRendererPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHTTPBody:", v8);

    -[UserTransparencyViewController myUserPrivacyWebView](self, "myUserPrivacyWebView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "loadRequest:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: We don't have the URL for the rendering server."), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[UserTransparencyViewController _showErrorMessage:](self, "_showErrorMessage:", 0);
  }
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
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(id, _QWORD);
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  _QWORD v32[5];
  _QWORD v33[5];

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = objc_opt_class();
  objc_msgSend(v10, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ The URL for the link generated by the rendering server is: %@."), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "rangeOfString:options:", CFSTR("prefs:root=Privacy&path=ADVERTISING"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  objc_msgSend(v15, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "rangeOfString:options:", CFSTR("App-Prefs:root=Privacy&path=ADVERTISING"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v10, "absoluteString");
  v20 = v8;
  v21 = v7;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v22, "containsString:", CFSTR("Privacy_Advertising"));

  v7 = v21;
  v8 = v20;

  if ((v31 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy&path=ADVERTISING"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "openSensitiveURL:withOptions:", v24, MEMORY[0x24BDBD1B8]);

    -[UserTransparencyViewController presentingViewController](self, "presentingViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v33[3] = &unk_24D8FBBD0;
    v33[4] = self;
    v27 = v33;
LABEL_9:
    objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 1, v27);

    -[UserTransparencyViewController _reportUserTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportUserTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyUserTransparencyDidLinkOut"), 0);
    -[UserTransparencyViewController _reportUserTransparencyViewControllerEventWithType:withCompletionHandler:](self, "_reportUserTransparencyViewControllerEventWithType:withCompletionHandler:", CFSTR("PrivacyUserTransparencyDidDisappear"), 0);
    v8[2](v8, 0);
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "navigationType"))
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "openURL:options:completionHandler:", v30, MEMORY[0x24BDBD1B8], &__block_literal_global);

    -[UserTransparencyViewController presentingViewController](self, "presentingViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3;
    v32[3] = &unk_24D8FBBD0;
    v32[4] = self;
    v27 = v32;
    goto LABEL_9;
  }
  v20[2](v20, 1);
LABEL_10:

}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "userTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, int a2)
{
  const __CFString *v2;
  id v3;

  v2 = CFSTR("NOT");
  if (a2)
    v2 = CFSTR("successfully");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This is an external link. Launch it in Safari and not our WebView. The link can %@ be opened"), v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1)
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
    objc_msgSend(v4, "userTransparencyViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_reportUserTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4
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
  v10[2] = __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke;
  v10[3] = &unk_24D8FBCD8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

}

void __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke(uint64_t a1)
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
  objc_msgSend(v7, "setBundleID:", *MEMORY[0x24BE02268]);
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
  v18[2] = __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_24D8FBCB0;
  v16 = *(id *)(a1 + 40);
  v19 = v7;
  v20 = v16;
  v17 = v7;
  objc_msgSend(v5, "handleRequest:serverURL:responseHandler:", v17, v3, v18);

}

void __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
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

- (id)normalizeChineseLanguage:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  v4 = CFSTR("zh_HK");
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh_HK")) & 1) == 0)
  {
    v4 = CFSTR("zh_TW");
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh_TW")) & 1) == 0)
    {
      if (objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hant")))
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "regionCode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "isEqualToString:", CFSTR("HK")))
          v7 = CFSTR("zh_HK");
        else
          v7 = CFSTR("zh_TW");
        v4 = v7;

      }
      else
      {
        v4 = CFSTR("zh_CN");
      }
    }
  }

  return v4;
}

- (UserTransparencyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)userTransparencyDetails
{
  return self->_userTransparencyDetails;
}

- (void)setUserTransparencyDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (ADUserTransparencyResponse)userTransparencyResponseData
{
  return self->_userTransparencyResponseData;
}

- (void)setUserTransparencyResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_userTransparencyResponseData, a3);
}

- (NSString)userTransparencyDetailsUnavailableMessage
{
  return self->_userTransparencyDetailsUnavailableMessage;
}

- (void)setUserTransparencyDetailsUnavailableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_userTransparencyDetailsUnavailableMessage, a3);
}

- (NSString)userTransparencyRendererPayload
{
  return self->_userTransparencyRendererPayload;
}

- (void)setUserTransparencyRendererPayload:(id)a3
{
  objc_storeStrong((id *)&self->_userTransparencyRendererPayload, a3);
}

- (NSString)userTransparencyRendererURL
{
  return self->_userTransparencyRendererURL;
}

- (void)setUserTransparencyRendererURL:(id)a3
{
  objc_storeStrong((id *)&self->_userTransparencyRendererURL, a3);
}

- (BOOL)renderingStatusForPAPermission
{
  return self->_renderingStatusForPAPermission;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (UINavigationBar)transparencyNavBar
{
  return self->_transparencyNavBar;
}

- (void)setTransparencyNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyNavBar, a3);
}

- (WKWebView)myUserPrivacyWebView
{
  return self->_myUserPrivacyWebView;
}

- (void)setMyUserPrivacyWebView:(id)a3
{
  objc_storeStrong((id *)&self->_myUserPrivacyWebView, a3);
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myUserPrivacyWebView, 0);
  objc_storeStrong((id *)&self->_transparencyNavBar, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_userTransparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_userTransparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_userTransparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_userTransparencyResponseData, 0);
  objc_storeStrong((id *)&self->_userTransparencyDetails, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end
