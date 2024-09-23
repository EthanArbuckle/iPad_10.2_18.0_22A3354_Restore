@implementation RAPWebBundleBaseViewController

- (RAPWebBundleBaseViewController)initWithReport:(id)a3
{
  id v5;
  RAPWebBundleBaseViewController *v6;
  RAPWebBundleBaseViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWebBundleBaseViewController;
  v6 = -[RAPWebBundleBaseViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_report, a3);

  return v7;
}

- (void)viewDidLoad
{
  RAPWebBundleConfigurationManager *v3;
  RAPWebBundleConfiguration *v4;
  RAPWebBundleConfiguration *configuration;
  WebBundleManager *v6;
  void *v7;
  WebBundleManager *v8;
  WebBundleManager *webBundleManager;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  NSMutableSet *photoIdentifiers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleBaseViewController;
  -[RAPWebBundleBaseViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = objc_alloc_init(RAPWebBundleConfigurationManager);
  v4 = (RAPWebBundleConfiguration *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleConfigurationManager configuration](v3, "configuration"));
  configuration = self->_configuration;
  self->_configuration = v4;

  v6 = [WebBundleManager alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleConfigurationManager configuration](v3, "configuration"));
  v8 = -[WebBundleManager initWithConfiguration:delegate:](v6, "initWithConfiguration:delegate:", v7, self);
  webBundleManager = self->_webBundleManager;
  self->_webBundleManager = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController entryPointString](self, "entryPointString"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController entryPointString](self, "entryPointString"));
    -[WebBundleManager setEntryPointString:](self->_webBundleManager, "setEntryPointString:", v11);

  }
  -[RAPWebBundleBaseViewController setupViews](self, "setupViews");
  -[RAPWebBundleBaseViewController _setupConstraints](self, "_setupConstraints");
  v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  photoIdentifiers = self->_photoIdentifiers;
  self->_photoIdentifiers = v12;

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleBaseViewController;
  -[RAPWebBundleBaseViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[WebBundleManager cancelLoadRequest](self->_webBundleManager, "cancelLoadRequest");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleBaseViewController;
  -[RAPWebBundleBaseViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController delegate](self, "delegate"));
  objc_msgSend(v3, "updatePreferredContentSize");

}

- (void)loadWebView
{
  -[WebBundleManager loadRequest](self->_webBundleManager, "loadRequest");
}

- (void)presentAccessoryViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "pushViewController:animated:", v4, 1);

  }
  else
  {
    objc_msgSend(v4, "setModalInPresentation:", 1);
    v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
    objc_msgSend(v9, "setModalPresentationStyle:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v7, "overrideUserInterfaceStyle"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v8, "overrideUserInterfaceStyle"));

    -[RAPWebBundleBaseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

- (RAPWebBundleQuestion)webBundleQuestion
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v4 = objc_opt_class(RAPWebBundleQuestion);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  else
    v6 = 0;
  return (RAPWebBundleQuestion *)v6;
}

- (void)saveImageData:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043292C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self->_configuration, "webBundleDirectory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self->_configuration, "absoluteCachedWebBundleDirectory"));
    v21 = 138412802;
    v22 = v6;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will try to save icon with data: %@, at path: %@ and path: %@", (uint8_t *)&v21, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self->_configuration, "webBundleDirectory"));
  v14 = +[RAPImageStorage saveImageWithImageIdentifier:imageData:directory:](RAPImageStorage, "saveImageWithImageIdentifier:imageData:directory:", v7, v6, v13);

  if ((v14 & 1) == 0)
  {
    v15 = sub_100431F8C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to save image.", (uint8_t *)&v21, 2u);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self->_configuration, "absoluteCachedWebBundleDirectory"));
  v18 = +[RAPImageStorage saveImageWithImageIdentifier:imageData:directory:](RAPImageStorage, "saveImageWithImageIdentifier:imageData:directory:", v7, v6, v17);

  if ((v18 & 1) == 0)
  {
    v19 = sub_100431F8C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to save image in on-device writable directory.", (uint8_t *)&v21, 2u);
    }

  }
  -[NSMutableSet addObject:](self->_photoIdentifiers, "addObject:", v7);

}

- (void)saveImage:(id)a3 withIdentifier:(id)a4
{
  UIImage *v6;
  id v7;
  NSData *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  UIImage *v13;

  v6 = (UIImage *)a3;
  v7 = a4;
  v8 = UIImagePNGRepresentation(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    -[RAPWebBundleBaseViewController saveImageData:withIdentifier:](self, "saveImageData:withIdentifier:", v9, v7);
  }
  else
  {
    v10 = sub_10043292C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create imageData from image: %@.", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)removeAllPhotos
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  NSMutableSet *photoIdentifiers;
  void *v13;
  NSMutableSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geotaggedPhotoCommentQuestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photos"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        -[RAPWebBundleBaseViewController _removePhotoWithId:](self, "_removePhotoWithId:", v11);

        photoIdentifiers = self->_photoIdentifiers;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        -[NSMutableSet removeObject:](photoIdentifiers, "removeObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_photoIdentifiers;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[RAPWebBundleBaseViewController _removePhotoWithId:](self, "_removePhotoWithId:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), (_QWORD)v19);
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)setupViews
{
  UIVisualEffectView *v3;
  UIVisualEffectView *blurView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UGCUserInformationCell *v11;
  UGCUserInformationCell *nutritionLabelView;
  UGCUserInformationCell *v13;
  void *v14;
  void *v15;
  UGCUserInformationCell *v16;
  void *v17;
  void *v18;
  RAPWebBundleBaseViewController *v19;
  uint64_t v20;
  RAPWebBundleBaseViewController *v21;
  RAPWebBundleBaseViewController *v22;
  void *v23;
  void *v24;
  UGCUserInformationViewModel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  blurView = self->_blurView;
  self->_blurView = v3;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_blurView);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleManager webView](self->_webBundleManager, "webView"));
  -[RAPWebBundleBaseViewController setWebView:](self, "setWebView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("RAPWebView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  objc_msgSend(v9, "addSubview:", v10);

  v32 = (id)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  if (-[RAPWebBundleBaseViewController _shouldShowNutritionLabel](self, "_shouldShowNutritionLabel"))
  {
    v11 = -[UGCUserInformationCell initWithEmphasis:]([UGCUserInformationCell alloc], "initWithEmphasis:", 0);
    nutritionLabelView = self->_nutritionLabelView;
    self->_nutritionLabelView = v11;

    -[UGCUserInformationCell setTranslatesAutoresizingMaskIntoConstraints:](self->_nutritionLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = self->_nutritionLabelView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 12.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UGCUserInformationCell setOverallFont:overallColor:](v13, "setOverallFont:overallColor:", v14, v15);

    v16 = self->_nutritionLabelView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 12.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UGCUserInformationCell setOverallFont:overallColor:](v16, "setOverallFont:overallColor:", v17, v18);

    v19 = self;
    v20 = objc_opt_class(MacRAPBaseViewController);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      v21 = v19;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessoryView"));
      objc_msgSend(v24, "addSubview:", self->_nutritionLabelView);

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
      objc_msgSend(v23, "addSubview:", self->_nutritionLabelView);
    }

    v25 = objc_alloc_init(UGCUserInformationViewModel);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Reporting As User's Information"), CFSTR("localized string not found"), 0));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28));
    -[UGCUserInformationViewModel setUserName:](v25, "setUserName:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userEmail"));
    -[UGCUserInformationViewModel setUserEmail:](v25, "setUserEmail:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userIcon"));
    -[UGCUserInformationViewModel setUserIcon:](v25, "setUserIcon:", v31);

    -[UGCUserInformationCell setViewModel:](self->_nutritionLabelView, "setViewModel:", v25);
  }
  -[RAPWebBundleBaseViewController _submitButtonEnabled:](self, "_submitButtonEnabled:", 0);

}

- (BOOL)_shouldShowNutritionLabel
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if ((sub_1003DF9A0() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
    v3 = objc_msgSend(v4, "loggedIn");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v6 = objc_msgSend(v5, "isAnonymous");

  return v3 & ~v6;
}

- (void)_setupConstraints
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  RAPWebBundleBaseViewController *v19;
  uint64_t v20;
  RAPWebBundleBaseViewController *v21;
  RAPWebBundleBaseViewController *v22;
  UGCUserInformationCell *nutritionLabelView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  RAPWebBundleBaseViewController *v28;
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
  char *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
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
  void *v89;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  _QWORD v122[2];
  _QWORD v123[3];
  _QWORD v124[6];
  void *v125;
  void *v126;
  _QWORD v127[7];

  v120 = objc_alloc_init((Class)NSMutableArray);
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_blurView, "topAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "topAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v112));
  v127[0] = v108;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_blurView, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v99));
  v127[1] = v96;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_blurView, "trailingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v89));
  v127[2] = v87;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v81));
  v127[3] = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "safeAreaLayoutGuide"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v69));
  v127[4] = v67;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v4));
  v127[5] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v127[6] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v127, 7));
  objc_msgSend(v120, "addObjectsFromArray:", v11);

  v12 = sub_1002A8AA0(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v14 = v13;
  if (v12 == 5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "safeAreaLayoutGuide"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  }

  if (MapsFeature_IsEnabled_RAPCommunityID(v17, v18)
    && !-[RAPWebBundleBaseViewController _shouldShowNutritionLabel](self, "_shouldShowNutritionLabel"))
  {
    v22 = (RAPWebBundleBaseViewController *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController bottomAnchor](v22, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v16));
    v126 = v37;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v126, 1));
    v36 = v120;
    objc_msgSend(v120, "addObjectsFromArray:", v35);
  }
  else
  {
    v19 = self;
    v20 = objc_opt_class(MacRAPBaseViewController);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      v21 = v19;
    else
      v21 = 0;
    v22 = v21;

    nutritionLabelView = v19->_nutritionLabelView;
    if (nutritionLabelView)
    {
      v119 = v16;
      if (v22)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](v19, "webView"));
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "bottomAnchor"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "safeAreaLayoutGuide"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v113));
        v124[0] = v109;
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell leadingAnchor](v19->_nutritionLabelView, "leadingAnchor"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "accessoryView"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "leadingAnchor"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v97));
        v124[1] = v94;
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell trailingAnchor](v19->_nutritionLabelView, "trailingAnchor"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "accessoryView"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v82));
        v124[2] = v80;
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell layoutMarginsGuide](v19->_nutritionLabelView, "layoutMarginsGuide"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "accessoryView"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "topAnchor"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:", v68));
        v124[3] = v66;
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell layoutMarginsGuide](v19->_nutritionLabelView, "layoutMarginsGuide"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bottomAnchor"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "accessoryView"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v59));
        v124[4] = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell layoutMarginsGuide](v19->_nutritionLabelView, "layoutMarginsGuide"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController footerView](v22, "footerView"));
        v28 = v22;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "accessoryView"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v30));
        v124[5] = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 6));
        objc_msgSend(v120, "addObjectsFromArray:", v32);

        v33 = v78;
        v34 = v86;

        v22 = v28;
        v35 = v84;

        v36 = v120;
        v37 = v115;

      }
      else
      {
        v110 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell topAnchor](nutritionLabelView, "topAnchor"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](v19, "webView"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bottomAnchor"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v107, 8.0));
        v123[0] = v104;
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell leadingAnchor](v19->_nutritionLabelView, "leadingAnchor"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "safeAreaLayoutGuide"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v38));
        v123[1] = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell trailingAnchor](v19->_nutritionLabelView, "trailingAnchor"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "safeAreaLayoutGuide"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v43));
        v123[2] = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 3));
        objc_msgSend(v120, "addObjectsFromArray:", v45);

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](v19, "webBundleQuestion"));
        v47 = (char *)objc_msgSend(v46, "questionType") - 13;

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell bottomAnchor](v19->_nutritionLabelView, "bottomAnchor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "safeAreaLayoutGuide"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
        if ((unint64_t)v47 > 7)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
          v121 = v57;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v121, 1));
          objc_msgSend(v120, "addObjectsFromArray:", v58);

          v36 = v120;
        }
        else
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v33));
          v122[0] = v111;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationCell bottomAnchor](v19->_nutritionLabelView, "bottomAnchor"));
          v117 = v37;
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](v19, "view"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "keyboardLayoutGuide"));
          v51 = v35;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
          LODWORD(v53) = 1144750080;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:priority:", v52, -8.0, v53));
          v122[1] = v54;
          v55 = v33;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v122, 2));
          v36 = v120;
          objc_msgSend(v120, "addObjectsFromArray:", v56);

          v33 = v55;
          v35 = v51;

          v37 = v117;
        }
        v16 = v119;
        v22 = 0;
      }
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](v19, "webView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v16));
      v125 = v35;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v125, 1));
      v36 = v120;
      objc_msgSend(v120, "addObjectsFromArray:", v33);
    }

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

}

- (void)_removePhotoWithId:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self->_configuration, "webBundleDirectory"));
  v6 = +[RAPImageStorage removeImageWithImageIdentifier:directory:](RAPImageStorage, "removeImageWithImageIdentifier:directory:", v4, v5);

  if ((v6 & 1) == 0)
  {
    v7 = sub_10043292C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot remove image from device with id: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration absoluteCachedWebBundleDirectory](self->_configuration, "absoluteCachedWebBundleDirectory"));
  v10 = +[RAPImageStorage removeImageWithImageIdentifier:directory:](RAPImageStorage, "removeImageWithImageIdentifier:directory:", v4, v9);

  if ((v10 & 1) == 0)
  {
    v11 = sub_10043292C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot remove image in on-device directory from device with id: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geotaggedPhotoCommentQuestion"));
  v15 = objc_msgSend(v14, "removePhotoForIdentifier:", v4);

  if ((v15 & 1) == 0)
  {
    v16 = sub_10043292C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot remove image from rap question with id: %@", (uint8_t *)&v18, 0xCu);
    }

  }
}

- (void)_submitButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_presentPrivacyView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_addAnalyticsEventToCombinedUserPath:(id)a3
{
  RAPReport *report;
  id v4;
  id v5;

  report = self->_report;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](report, "combinedUserPath"));
  objc_msgSend(v5, "addWebPath:", v4);

}

- (void)_saveInlineCardHeightIfNeeded:(double)a3
{
  id v4;

  if (self->_needsCardHeightSave)
  {
    self->_needsCardHeightSave = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController delegate](self, "delegate"));
    objc_msgSend(v4, "saveInitialCardHeight:", a3);

  }
}

- (id)_photoPickerAnchoringViewForBoundingBox:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIView *v8;
  UIView *photoPickerAnchoringView;
  void *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_photoPickerAnchoringView)
  {
    v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    photoPickerAnchoringView = self->_photoPickerAnchoringView;
    self->_photoPickerAnchoringView = v8;

    -[UIView setUserInteractionEnabled:](self->_photoPickerAnchoringView, "setUserInteractionEnabled:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
    objc_msgSend(v10, "addSubview:", self->_photoPickerAnchoringView);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  objc_msgSend(v11, "convertRect:fromView:", v12, x, y, width, height);
  -[UIView setFrame:](self->_photoPickerAnchoringView, "setFrame:");

  return self->_photoPickerAnchoringView;
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  RAPPhotoPickerController *v30;
  RAPPhotoPickerController *photoPicker;
  void *v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  void *v42;
  unsigned int v43;
  void *v44;
  id v45;
  void *v46;
  unsigned int v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  RAPWebBundleBaseViewController *v53;
  uint64_t v54;
  RAPWebBundleBaseViewController *v55;
  RAPWebBundleBaseViewController *v56;
  UGCUserInformationCell *nutritionLabelView;
  void *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  uint64_t v62;
  char isKindOfClass;
  void *v64;
  id v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  os_log_type_t v69;
  void *v70;
  unsigned int v71;
  void *v72;
  uint64_t v73;
  char v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  _BYTE v82[128];
  CGRect v83;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("setValid"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isValid")));
    -[RAPWebBundleBaseViewController _submitButtonEnabled:](self, "_submitButtonEnabled:", objc_msgSend(v11, "BOOLValue"));
LABEL_11:

    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("getPhotos"));

  if (v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boundingBox")));
    v15 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boundingBox")));

      if (!v16)
      {
LABEL_8:
        v30 = (RAPPhotoPickerController *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController _photoPickerReplyHandler:](self, "_photoPickerReplyHandler:", v8));
        -[RAPPhotoPickerController setAnchoringView:](v30, "setAnchoringView:", v11);
        -[RAPPhotoPickerController setPresentingViewController:](v30, "setPresentingViewController:", self);
        -[RAPPhotoPickerController startPicking](v30, "startPicking");
        photoPicker = self->_photoPicker;
        self->_photoPicker = v30;

        goto LABEL_11;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boundingBox")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("xCoordinate")));
      objc_msgSend(v17, "doubleValue");
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("yCoordinate")));
      objc_msgSend(v20, "doubleValue");
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("width")));
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("height")));
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      v29 = objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController _photoPickerAnchoringViewForBoundingBox:](self, "_photoPickerAnchoringViewForBoundingBox:", v19, v22, v25, v28));
      v11 = (void *)v29;
    }

    goto LABEL_8;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("removePhoto"));

  if (v33)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id")));
    -[RAPWebBundleBaseViewController _removePhotoWithId:](self, "_removePhotoWithId:", v11);
    goto LABEL_11;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("showPrivacy"));

  if (v35)
  {
    -[RAPWebBundleBaseViewController _presentPrivacyView](self, "_presentPrivacyView");
    goto LABEL_12;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("sendAnalyticsEvent"));

  if (v37)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("values")));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v77 != v40)
            objc_enumerationMutation(v11);
          -[RAPWebBundleBaseViewController _addAnalyticsEventToCombinedUserPath:](self, "_addAnalyticsEventToCombinedUserPath:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i));
        }
        v39 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      }
      while (v39);
    }
    goto LABEL_11;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("pageShown"));

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("success")));
    v45 = objc_msgSend(v44, "BOOLValue");

    -[WebBundleManager didLoadPageWithSuccess:](self->_webBundleManager, "didLoadPageWithSuccess:", v45);
    self->_needsCardHeightSave = 1;
    goto LABEL_12;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
  v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("pageResized"));

  if (!v47)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
    v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("logWebBundleMsg"));

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value")));
      v62 = objc_opt_class(NSString);
      isKindOfClass = objc_opt_isKindOfClass(v61, v62);

      if ((isKindOfClass & 1) == 0)
        goto LABEL_12;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value")));
      v65 = sub_10043292C();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v64;
        v67 = "Message from WebBundle: %@";
        v68 = v66;
        v69 = OS_LOG_TYPE_INFO;
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v68, v69, v67, buf, 0xCu);
      }
    }
    else
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name")));
      v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("logWebBundleError"));

      if (!v71)
        goto LABEL_12;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value")));
      v73 = objc_opt_class(NSString);
      v74 = objc_opt_isKindOfClass(v72, v73);

      if ((v74 & 1) == 0)
        goto LABEL_12;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value")));
      v75 = sub_10043292C();
      v66 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v64;
        v67 = "Error from WebBundle: %@";
        v68 = v66;
        v69 = OS_LOG_TYPE_ERROR;
        goto LABEL_43;
      }
    }

    goto LABEL_12;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pageHeight")));
  objc_msgSend(v48, "cgFloatValue");
  v50 = v49;

  if ((MapsFeature_IsEnabled_RAPCommunityID(v51, v52) & 1) == 0)
  {
    v53 = self;
    v54 = objc_opt_class(MacRAPBaseViewController);
    v55 = (objc_opt_isKindOfClass(v53, v54) & 1) != 0 ? v53 : 0;
    v56 = v55;

    nutritionLabelView = v53->_nutritionLabelView;
    if (nutritionLabelView)
    {
      if (!v56)
      {
        -[UGCUserInformationCell frame](nutritionLabelView, "frame");
        v50 = v50 + CGRectGetHeight(v83) + 8.0;
      }
    }
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController delegate](self, "delegate"));
  objc_msgSend(v58, "updateCardHeight:", v50);

  -[RAPWebBundleBaseViewController _saveInlineCardHeightIfNeeded:](self, "_saveInlineCardHeightIfNeeded:", v50);
LABEL_12:

}

- (id)_photoPickerReplyHandler:(id)a3
{
  id v4;
  RAPPhotoPickerController *v5;
  _QWORD v7[6];
  id v8;
  id location;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = -[RAPPhotoPickerController initWithInitialPhoto:]([RAPPhotoPickerController alloc], "initWithInitialPhoto:", 0);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1006D6308;
  v10[4] = sub_1006D6330;
  v11 = objc_retainBlock(v4);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006D6338;
  v7[3] = &unk_1011C07E0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v7[5] = v10;
  -[RAPPhotoPickerController addObserver:changeHandler:](v5, "addObserver:changeHandler:", self, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v10, 8);

  return v5;
}

- (NSString)entryPointString
{
  return self->_entryPointString;
}

- (void)setEntryPointString:(id)a3
{
  objc_storeStrong((id *)&self->_entryPointString, a3);
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (RAPWebBundleViewControllerDelegate)delegate
{
  return (RAPWebBundleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_entryPointString, 0);
  objc_storeStrong((id *)&self->_photoIdentifiers, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_photoPickerAnchoringView, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_nutritionLabelView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_webBundleManager, 0);
}

@end
