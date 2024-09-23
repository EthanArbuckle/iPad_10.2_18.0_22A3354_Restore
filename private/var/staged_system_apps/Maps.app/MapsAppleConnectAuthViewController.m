@implementation MapsAppleConnectAuthViewController

- (MapsAppleConnectAuthViewController)initWithProxyURL:(id)a3
{
  id v3;
  MapsAppleConnectAuthViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsAppleConnectAuthViewController;
  v3 = a3;
  v4 = -[MapsAppleConnectAuthViewController init](&v6, "init");
  -[MapsAppleConnectAuthViewController setAuthProxyURL:](v4, "setAuthProxyURL:", v3, v6.receiver, v6.super_class);

  return v4;
}

+ (void)presentAppleConnectAuthControllerFrom:(id)a3 withProxyURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MapsAppleConnectAuthViewController *v14;
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v7)
  {
    do
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentedViewController"));
      v10 = v16;
      v5 = v16;
    }
    while (v9);
  }
  else
  {
    v10 = v5;
  }
  v17 = v10;
  if (v6
    || (v11 = GEOGetURL(39, v8), (v6 = (id)objc_claimAutoreleasedReturnValue(v11)) != 0)
    || (v13 = GEOGetURL(51, v12), (v6 = (id)objc_claimAutoreleasedReturnValue(v13)) != 0))
  {
    v14 = -[MapsAppleConnectAuthViewController initWithProxyURL:]([MapsAppleConnectAuthViewController alloc], "initWithProxyURL:", v6);
    v15 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v14);
    if (objc_msgSend(v17, "isViewLoaded"))
    {
      objc_msgSend(v15, "setModalPresentationStyle:", 2);
      objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);
    }

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("I'm afraid I can't do that"), CFSTR("No Maps Authentication URL found. Refusing to attempt Apple Connect Auth. Try switching to a secure environment before re-attempting."), 1));
    v14 = (MapsAppleConnectAuthViewController *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
    objc_msgSend(v6, "addAction:", v14);
    objc_msgSend(v17, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)viewDidLoad
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelButton;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  void *v14;
  id v15;
  UILabel *v16;
  UILabel *statusLabel;
  void *v18;
  UIButton *v19;
  UIButton *reAuthButton;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  objc_super v79;
  _QWORD v80[15];

  v79.receiver = self;
  v79.super_class = (Class)MapsAppleConnectAuthViewController;
  -[MapsAppleConnectAuthViewController viewDidLoad](&v79, "viewDidLoad");
  v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismissViewController");
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 0);
  v5 = self->_cancelButton;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "setText:", CFSTR("AppleConnect for Maps Environment Authentication"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
  objc_msgSend(v13, "setFont:", v14);

  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(v13, "setLineBreakMode:", 0);
  objc_msgSend(v13, "setNumberOfLines:", 0);
  v15 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_statusLabel, "setFont:", v18);

  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_statusLabel, "setLineBreakMode:", 0);
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  reAuthButton = self->_reAuthButton;
  self->_reAuthButton = v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_reAuthButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTitle:forState:](self->_reAuthButton, "setTitle:forState:", CFSTR("Retry"), 0);
  -[UIButton addTarget:action:forControlEvents:](self->_reAuthButton, "addTarget:action:forControlEvents:", self, "_doAppleConnectAuthentication", 64);
  -[UIButton setHidden:](self->_reAuthButton, "setHidden:", 1);
  v21 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "addSubview:", v13);
  objc_msgSend(v21, "addSubview:", v15);
  objc_msgSend(v21, "addSubview:", self->_statusLabel);
  objc_msgSend(v21, "addSubview:", self->_reAuthButton);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  objc_msgSend(v22, "addSubview:", v21);

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "layoutMarginsGuide"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v75, 3.0));
  v80[0] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "layoutMarginsGuide"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v70, 5.0));
  v80[1] = v69;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "layoutMarginsGuide"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v65, 1.0));
  v80[2] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "layoutMarginsGuide"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v60, 1.0));
  v80[3] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v80[4] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v52, 1.0));
  v80[5] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_statusLabel, "topAnchor"));
  v58 = v15;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v49, 3.0));
  v80[6] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_reAuthButton, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_statusLabel, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 3.0));
  v80[7] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_reAuthButton, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v80[8] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v80[9] = v39;
  v54 = v13;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v37, 1.0));
  v80[10] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v34, 1.0));
  v80[11] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_statusLabel, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v23, 1.0));
  v80[12] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_statusLabel, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v26, 1.0));
  v80[13] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_reAuthButton, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  v80[14] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsAppleConnectAuthViewController;
  -[MapsAppleConnectAuthViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (!self->_alreadyDisplayedACAuth)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10070EF78;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateStatus:(BOOL)a3 message:(id)a4
{
  id v4;
  _QWORD block[5];
  id v6;
  BOOL v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10070F034;
  block[3] = &unk_1011AC838;
  v7 = a3;
  block[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_dismissViewController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10070F12C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_doAppleConnectAuthentication
{
  int BOOL;
  AppleConnectSSOAuthenticator *v4;
  AppleConnectSSOAuthenticator *appleConnectAuthenticator;
  __CFString **v6;
  dispatch_time_t v7;
  _QWORD block[5];

  -[MapsAppleConnectAuthViewController _updateStatus:message:](self, "_updateStatus:message:", 1, CFSTR("Authenticating..."));
  BOOL = GEOConfigGetBOOL(MapsConfig_MapsProxyAuthUseACProd, off_1014B2DF8);
  v4 = objc_alloc_init(AppleConnectSSOAuthenticator);
  appleConnectAuthenticator = self->_appleConnectAuthenticator;
  self->_appleConnectAuthenticator = v4;

  -[AppleConnectSSOAuthenticator setDelegate:](self->_appleConnectAuthenticator, "setDelegate:", self);
  -[AppleConnectSSOAuthenticator setAppIdentifier:](self->_appleConnectAuthenticator, "setAppIdentifier:", CFSTR("135828"));
  v6 = &off_1011DC6D8;
  if (!BOOL)
    v6 = &off_1011DC6E0;
  -[AppleConnectSSOAuthenticator setEnvIdentifier:](self->_appleConnectAuthenticator, "setEnvIdentifier:", *v6);
  -[AppleConnectSSOAuthenticator authenticate](self->_appleConnectAuthenticator, "authenticate");
  self->_state = 0;
  v7 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10070F25C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v5 = a4;
  self->_state = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "token"));
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personId"));
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
LABEL_7:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed: missing token or personID")));
    -[MapsAppleConnectAuthViewController _updateStatus:message:](self, "_updateStatus:message:", 0, v16);

    -[MapsAppleConnectAuthViewController setPersonID:](self, "setPersonID:", 0);
    goto LABEL_8;
  }
  v9 = GEOGetMapsProxyAuthLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
    v17 = 138412290;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Apple Connect Authentication Success for User: %@", (uint8_t *)&v17, 0xCu);

  }
  -[MapsAppleConnectAuthViewController _updateStatus:message:](self, "_updateStatus:message:", 1, CFSTR("Complete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "token"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController authProxyURL](self, "authProxyURL"));
  objc_msgSend(v12, "renewMapsAuthProxyToken:fromToken:authProxyURL:suppressNotification:", 0, v13, v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personId"));
  -[MapsAppleConnectAuthViewController setPersonID:](self, "setPersonID:", v15);

  -[MapsAppleConnectAuthViewController _dismissViewController](self, "_dismissViewController");
LABEL_8:

}

- (void)authenticator:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  void *v21;

  v5 = a4;
  self->_state = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = MapsAuthDidFinishNotification;
  v20 = GEOMapsAuthSuccessKey;
  v21 = &__kCFBooleanFalse;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, self, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  LODWORD(v7) = objc_msgSend(v9, "isEqualToString:", CFSTR("AppleConnectErrorDomain"));

  if (!(_DWORD)v7)
  {
    v14 = GEOGetMapsProxyAuthLog();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v15 = "Apple Connect Authentication failed with error: %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    }
LABEL_11:

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed with error: %@"), v16));
    -[MapsAppleConnectAuthViewController _updateStatus:message:](self, "_updateStatus:message:", 0, v17);

    goto LABEL_12;
  }
  v10 = objc_msgSend(v5, "code");
  v11 = GEOGetMapsProxyAuthLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10 != (id)-100)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v10;
      v15 = "Apple Connect Authentication failed with error %ld";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Apple Connect Authentication cancelled", buf, 2u);
  }

  -[MapsAppleConnectAuthViewController _updateStatus:message:](self, "_updateStatus:message:", 0, CFSTR("Canceled"));
LABEL_12:
  -[MapsAppleConnectAuthViewController setPersonID:](self, "setPersonID:", 0);

}

- (NSString)personID
{
  return (NSString *)GEOConfigGetString(MapsConfig_ACPersonID, off_1014B3E38);
}

- (void)setPersonID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MapsAppleConnectAuthViewController personID](self, "personID"));
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = sub_10043284C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating AppleConnect ID", v10, 2u);
      }

      if (v4)
        GEOConfigSetString(MapsConfig_ACPersonID, off_1014B3E38, v4);
      else
        _GEOConfigRemoveValue(MapsConfig_ACPersonID, off_1014B3E38);
    }
  }

}

- (NSURL)authProxyURL
{
  return self->_authProxyURL;
}

- (void)setAuthProxyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)alreadyDisplayedACAuth
{
  return self->_alreadyDisplayedACAuth;
}

- (void)setAlreadyDisplayedACAuth:(BOOL)a3
{
  self->_alreadyDisplayedACAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_reAuthButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_appleConnectAuthenticator, 0);
}

@end
