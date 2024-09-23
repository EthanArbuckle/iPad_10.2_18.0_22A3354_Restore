@implementation XBLaunchImageContextWrapper

+ (id)contextWrapperForApplicationWithCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithApplicationCompatibilityInfo:launchRequest:captureOptions:", v9, v8, a5);

  return v10;
}

- (XBLaunchImageContextWrapper)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v9;
  id v10;
  XBLaunchImageContextWrapper *v11;
  XBLaunchImageContextWrapper *v12;
  void *v13;
  uint64_t v14;
  XBLaunchInterface *launchInterface;
  XBLaunchCaptureInformation *v16;
  XBLaunchCaptureInformation *captureInformation;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  XBLaunchInterface *v22;
  int64_t captureOptions;
  XBLaunchStateRequest *launchRequest;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  XBLaunchInterface *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  XBLaunchStateRequest *v36;

  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)XBLaunchImageContextWrapper;
  v11 = -[XBLaunchImageContextWrapper init](&v26, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appInfo, a3);
    objc_storeStrong((id *)&v12->_launchRequest, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "launchInterfaceIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "launchInterfaceWithIdentifier:", v13));
    launchInterface = v12->_launchInterface;
    v12->_launchInterface = (XBLaunchInterface *)v14;

    v12->_captureOptions = a5;
    if (a5)
    {
      v16 = (XBLaunchCaptureInformation *)objc_alloc_init((Class)XBLaunchCaptureInformation);
      captureInformation = v12->_captureInformation;
      v12->_captureInformation = v16;

    }
    v18 = sub_100002CBC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](v12->_appInfo, "bundleIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "launchInterfaceIdentifier"));
      v22 = v12->_launchInterface;
      captureOptions = v12->_captureOptions;
      launchRequest = v12->_launchRequest;
      *(_DWORD *)buf = 138544386;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      v33 = 2048;
      v34 = captureOptions;
      v35 = 2114;
      v36 = launchRequest;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] XBLaunchImageContextWrapper configuring with\nlaunchInterfaceIdentifier: %{public}@\nlaunchInterface: %{public}@\ncaptureOptions: %ld\nlaunchRequest: %{public}@", buf, 0x34u);

    }
    -[XBLaunchImageContextWrapper _configureNewWindow](v12, "_configureNewWindow");
  }

  return v12;
}

- (unsigned)contextID
{
  _XBWrapperWindow *wrapperWindow;

  wrapperWindow = self->_wrapperWindow;
  if (wrapperWindow)
    return -[_XBWrapperWindow _contextId](wrapperWindow, "_contextId");
  else
    return XBInvalidContextId;
}

- (id)_errorForParsingException:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UIWindowRestrictedSplashboardViewException"));
  v9 = objc_alloc((Class)XBLaunchImageError);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exception thrown attempting to load a storyboard using a restricted view class: %@"), v10));
    v12 = v9;
    v13 = 5;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exception thrown during load: %@"), v10));
    v12 = v9;
    v13 = 2;
  }
  v14 = objc_msgSend(v12, "initWithCode:bundleID:reason:fatal:", v13, v5, v11, 0);

  return v14;
}

- (id)_parseInterfaceWithStoryboardName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v9, v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instantiateInitialViewController"));

  if (a6 && !v13 && !*a6)
  {
    v14 = objc_alloc((Class)XBLaunchImageError);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not load any content for the interface named \"%@\"."), v9));
    *a6 = objc_msgSend(v14, "initWithCode:bundleID:reason:fatal:", 3, v11, v15, 0);

  }
  return v13;
}

- (id)_parseInterfaceWithNibName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];

  v9 = a3;
  v10 = a4;
  v26 = a5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v9, v10));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "instantiateWithOwner:options:", 0, 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(UIWindow);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = sub_100002CBC();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
            sub_100006EE8(v19, buf, &v33, v18);
          }

        }
        else
        {
          v20 = objc_opt_class(UIViewController);
          if ((objc_opt_isKindOfClass(v15, v20) & 1) != 0)
          {
            v12 = v15;
            goto LABEL_17;
          }
          v21 = objc_opt_class(UIView);
          if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
          {
            v12 = objc_alloc_init((Class)UIViewController);
            objc_msgSend(v12, "setView:", v15);
            goto LABEL_17;
          }
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_17:

  if (a6 && !v12 && !*a6)
  {
    v22 = objc_alloc((Class)XBLaunchImageError);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not load any content for the interface named \"%@\"."), v9));
    *a6 = objc_msgSend(v22, "initWithCode:bundleID:reason:fatal:", 3, v26, v23, 0);

  }
  return v12;
}

- (id)_parseInterfaceConfiguration:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  XBUpdatingImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  XBViewMatchingImageView *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  XBViewMatchingImageView *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[4];

  v8 = a3;
  v51 = a4;
  v48 = a5;
  v50 = objc_alloc_init((Class)UIViewController);
  v9 = objc_alloc_init((Class)UIView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorName"));

  if (v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorName")),
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", v11, v51, 0)), v11, (v12 = v49) != 0))
  {
    v13 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v49 = 0;
    v13 = 1;
  }
  objc_msgSend(v9, "setBackgroundColor:", v12);
  if (v13)

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageName"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v51, 0));

    if (v16)
    {
      v17 = objc_alloc_init(XBUpdatingImageView);
      objc_msgSend(v9, "addSubview:", v17);
      if (objc_msgSend(v8, "imageRespectsSafeAreaInsets"))
      {
        -[XBUpdatingImageView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView leadingAnchor](v17, "leadingAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
        v52[0] = v44;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView trailingAnchor](v17, "trailingAnchor"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
        v52[1] = v41;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView topAnchor](v17, "topAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v18));
        v52[2] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView bottomAnchor](v17, "bottomAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
        v52[3] = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

      }
      else
      {
        -[XBUpdatingImageView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
      }
      -[XBUpdatingImageView setImage:](v17, "setImage:", v16);

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bars"));
  v25 = objc_msgSend(v24, "containsObject:", XBLaunchConfigurationToolbarKey);

  if (v25)
  {
    v26 = objc_alloc_init((Class)UIToolbar);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toolbarImageName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v27, v51, 0));

    v29 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]([XBViewMatchingImageView alloc], "initWithMatchingView:image:bottom:", v26, v28, 1);
    -[XBViewMatchingImageView setAutoresizingMask:](v29, "setAutoresizingMask:", 18);
    objc_msgSend(v9, "addSubview:", v29);
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bars"));
    v31 = objc_msgSend(v30, "containsObject:", XBLaunchConfigurationTabBarKey);

    if (!v31)
      goto LABEL_19;
    v26 = objc_alloc_init((Class)UITabBar);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tabBarImageName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v32, v51, 0));

    v29 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]([XBViewMatchingImageView alloc], "initWithMatchingView:image:bottom:", v26, v28, 1);
    -[XBViewMatchingImageView setAutoresizingMask:](v29, "setAutoresizingMask:", 18);
    objc_msgSend(v9, "addSubview:", v29);
  }

LABEL_19:
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bars"));
  v34 = objc_msgSend(v33, "containsObject:", XBLaunchConfigurationNavigationBarKey);

  if (v34)
  {
    v35 = objc_alloc_init((Class)UINavigationBar);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBarImageName"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v36, v51, 0));

    v38 = -[XBViewMatchingImageView initWithMatchingView:image:bottom:]([XBViewMatchingImageView alloc], "initWithMatchingView:image:bottom:", v35, v37, 0);
    -[XBViewMatchingImageView setAutoresizingMask:](v38, "setAutoresizingMask:", 18);
    objc_msgSend(v9, "addSubview:", v38);

  }
  objc_msgSend(v50, "setView:", v9);

  return v50;
}

- (id)_parseLaunchInterface:(id)a3 bundle:(id)a4 bundlePath:(id)a5 bundleID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v30;
  NSObject *v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    v20 = sub_100002CBC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_100006F40();

    if (a7)
    {
      v22 = objc_alloc((Class)XBLaunchImageError);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to construct NSBundle for %@ at %@."), v15, v14));
      *a7 = objc_msgSend(v22, "initWithCode:bundleID:reason:fatal:", 4, v15, v23, 0);

    }
LABEL_10:
    v24 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v12, "isStoryboard"))
  {
    v16 = sub_100002CBC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100006F6C();

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface name](self->_launchInterface, "name"));
    v19 = objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _parseInterfaceWithStoryboardName:bundle:bundleID:error:](self, "_parseInterfaceWithStoryboardName:bundle:bundleID:error:", v18, v13, v15, a7));
LABEL_19:
    v24 = (void *)v19;

    goto LABEL_20;
  }
  if (objc_msgSend(v12, "isXIB"))
  {
    v25 = sub_100002CBC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_100006F98();

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface name](self->_launchInterface, "name"));
    v19 = objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _parseInterfaceWithNibName:bundle:bundleID:error:](self, "_parseInterfaceWithNibName:bundle:bundleID:error:", v18, v13, v15, a7));
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "isConfiguration"))
  {
    v27 = sub_100002CBC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_100006FC4();

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface configuration](self->_launchInterface, "configuration"));
    v19 = objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _parseInterfaceConfiguration:bundle:bundleID:error:](self, "_parseInterfaceConfiguration:bundle:bundleID:error:", v18, v13, v15, a7));
    goto LABEL_19;
  }
  if (!a7)
    goto LABEL_10;
  v30 = sub_100002CBC();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    sub_100006FF0();

  v24 = 0;
  *a7 = objc_msgSend(objc_alloc((Class)XBLaunchImageError), "initWithCode:bundleID:reason:fatal:", 1, v15, CFSTR("No such interface found."), 0);
LABEL_20:

  return v24;
}

- (void)_configureRootViewForRTL:(id)a3 bundle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSWritingDirection v10;
  id v11;

  v5 = a3;
  if (v5)
  {
    v11 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle localizations](self->_bundle, "localizations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v6, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", v9);

    if (v10 == NSWritingDirectionRightToLeft)
      sub_10000415C(v11);

    v5 = v11;
  }

}

- (BOOL)_verifyMemoryImpactOfViewHierarchy:(id)a3 bundleID:(id)a4 size:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  int IsEnabled;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "setNeedsLayout");
  objc_msgSend(v11, "layoutIfNeeded");
  v12 = -[XBLaunchImageContextWrapper _estimatedMemorySizeOfViewHierarchy:](self, "_estimatedMemorySizeOfViewHierarchy:", v11);

  if (a5)
    *a5 = v12;
  v13 = sub_100002AFC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_1000070A0();

  if (v12 >= 0x17D7840)
  {
    IsEnabled = _XBDebugCaptureIsEnabled();
    if (!IsEnabled)
    {
      if (a6)
      {
        v18 = objc_alloc((Class)XBLaunchImageError);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] Estimated size (%zu) is over limit (%zu)"), v10, v12, 25000000));
        *a6 = objc_msgSend(v18, "initWithCode:bundleID:reason:fatal:", 6, v10, v19, 0);

      }
      v20 = sub_100002AFC();
      v17 = objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v17))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
        *(_DWORD *)buf = 138543874;
        v24 = v21;
        v25 = 2050;
        v26 = v12;
        v27 = 2050;
        v28 = 25000000;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverMemoryLimit", "BundleIdOverride=%{public, signpost.description:attribute}@ estimate=%{signpost.telemetry:number1, public}zu limit=%{signpost.telemetry:number2, public}zu enableTelemetry=YES ", buf, 0x20u);

      }
      goto LABEL_15;
    }
    if (v12 > 0x17D7840)
    {
      v16 = sub_100002AFC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_10000701C();
LABEL_15:

      goto LABEL_16;
    }
  }
  LOBYTE(IsEnabled) = 1;
LABEL_16:

  return IsEnabled;
}

- (void)_configureNewWindow
{
  void *v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  NSBundle *bundle;
  XBLaunchInterface *launchInterface;
  NSBundle *v10;
  void *v11;
  UIViewController *v12;
  id v13;
  UIViewController *rootViewController;
  UIViewController *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  _XBWrapperWindow *v21;
  _XBWrapperWindow *v22;
  _XBWrapperWindow *wrapperWindow;
  _XBWrapperWindow *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  NSObject *v31;
  UIViewController *v32;
  void *v33;
  void *v34;
  UIViewController *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  UIViewController *v43;
  __int16 v44;
  void *v45;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v37 = _NSFullMethodName(self, a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageContextWrapper.m"), 403, CFSTR("%@ must be called on the main thread"), v38);

  }
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "_setUIIBAlwaysProvidePeripheryInsets:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundlePath](self->_appInfo, "bundlePath"));
  v7 = (NSBundle *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v6));
  bundle = self->_bundle;
  self->_bundle = v7;

  launchInterface = self->_launchInterface;
  v10 = self->_bundle;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
  v40 = 0;
  v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _parseLaunchInterface:bundle:bundlePath:bundleID:error:](self, "_parseLaunchInterface:bundle:bundlePath:bundleID:error:", launchInterface, v10, v6, v11, &v40));
  v13 = v40;
  rootViewController = self->_rootViewController;
  self->_rootViewController = v12;

  v15 = self->_rootViewController;
  if (v15 && !v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v15, "view"));
    v17 = sub_100002AFC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
      v35 = self->_rootViewController;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v34;
      v42 = 2112;
      v43 = v35;
      v44 = 2112;
      v45 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%@] rootViewController: %@; rootView: %@",
        buf,
        0x20u);

    }
    -[XBLaunchImageContextWrapper _configureRootViewForRTL:bundle:](self, "_configureRootViewForRTL:bundle:", v16, self->_bundle);
    *(_QWORD *)buf = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
    v39 = 0;
    v20 = -[XBLaunchImageContextWrapper _verifyMemoryImpactOfViewHierarchy:bundleID:size:error:](self, "_verifyMemoryImpactOfViewHierarchy:bundleID:size:error:", v16, v19, buf, &v39);
    v13 = v39;

    if (v20)
    {
      v21 = [_XBWrapperWindow alloc];
      BSRectWithSize(-[XBLaunchStateRequest naturalSize](self->_launchRequest, "naturalSize"));
      v22 = -[_XBWrapperWindow initWithFrame:](v21, "initWithFrame:");
      wrapperWindow = self->_wrapperWindow;
      self->_wrapperWindow = v22;

      v24 = self->_wrapperWindow;
      v25 = -[XBApplicationLaunchCompatibilityInfo launchesOpaque](self->_appInfo, "launchesOpaque")
          ? objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"))
          : objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v26 = (void *)v25;
      -[_XBWrapperWindow setBackgroundColor:](v24, "setBackgroundColor:", v25);

      -[_XBWrapperWindow setRootViewController:](self->_wrapperWindow, "setRootViewController:", self->_rootViewController);
      -[XBLaunchImageContextWrapper _update](self, "_update");
      if ((self->_captureOptions & 1) != 0)
        -[XBLaunchCaptureInformation setEstimatedMemoryImpact:](self->_captureInformation, "setEstimatedMemoryImpact:", *(_QWORD *)buf);
    }

  }
  if (v13)
  {
    objc_storeStrong((id *)&self->_error, v13);
    v27 = objc_msgSend(v13, "isFatal");
    v28 = CFSTR("Error");
    if (v27)
      v28 = CFSTR("Fatal error");
    v29 = v28;
    v30 = sub_100002CBC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "succinctDescription"));
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v29;
      v42 = 2114;
      v43 = v32;
      v44 = 2114;
      v45 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@ generating launch image for %{public}@: %{public}@", buf, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_update
{
  void *v3;
  id v4;
  NSObject *v5;
  XBLaunchStateRequest *launchRequest;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _XBWrapperWindow *wrapperWindow;
  void *v22;
  void *v23;
  _XBWrapperWindow *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  int64_t captureOptions;
  uint64_t v30;
  XBApplicationLaunchCompatibilityInfo *appInfo;
  XBLaunchStateRequest *v32;
  _XBWrapperWindow *v33;
  XBLaunchInterface *launchInterface;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[3];
  uint8_t buf[4];
  XBLaunchStateRequest *v40;

  v3 = objc_autoreleasePoolPush();
  v4 = sub_100002CBC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    launchRequest = self->_launchRequest;
    *(_DWORD *)buf = 138543362;
    v40 = launchRequest;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating window to %{public}@", buf, 0xCu);
  }

  v7 = -[XBLaunchStateRequest interfaceOrientation](self->_launchRequest, "interfaceOrientation");
  v8 = BSRectWithSize(-[XBLaunchStateRequest naturalSize](self->_launchRequest, "naturalSize"));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[XBLaunchStateRequest userInterfaceStyle](self->_launchRequest, "userInterfaceStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_XBWrapperWindow screen](self->_wrapperWindow, "screen"));
  objc_msgSend(v16, "_updateUserInterfaceIdiom");
  objc_msgSend(v16, "_setInterfaceOrientation:", v7);
  _UIAppSetStatusBarOrientation(v7);
  v17 = sub_100002FA4((uint64_t)-[XBLaunchStateRequest statusBarState](self->_launchRequest, "statusBarState"));
  _UIAppSetStatusBarHeight(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_launchImageTraitCollectionForInterfaceOrientation:inBounds:", v7, v8, v10, v12, v14));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v16, "_userInterfaceIdiom")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v15));
  wrapperWindow = self->_wrapperWindow;
  v38[0] = v18;
  v38[1] = v19;
  v38[2] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v22));
  -[_XBWrapperWindow _setLocalOverrideTraitCollection:](wrapperWindow, "_setLocalOverrideTraitCollection:", v23);

  -[_XBWrapperWindow _setWindowInterfaceOrientation:](self->_wrapperWindow, "_setWindowInterfaceOrientation:", v7);
  -[_XBWrapperWindow _setRotatableViewOrientation:updateStatusBar:duration:force:](self->_wrapperWindow, "_setRotatableViewOrientation:updateStatusBar:duration:force:", v7, 0, 0, 0.0);
  v24 = self->_wrapperWindow;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchStateRequest customSafeAreaInsets](self->_launchRequest, "customSafeAreaInsets"));
  -[_XBWrapperWindow _setCustomSafeAreaInsets:](v24, "_setCustomSafeAreaInsets:", v25);

  -[_XBWrapperWindow setHidden:](self->_wrapperWindow, "setHidden:", 0);
  -[_XBWrapperWindow setFrame:](self->_wrapperWindow, "setFrame:", v8, v10, v12, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_rootViewController, "view"));
  -[_XBWrapperWindow bounds](self->_wrapperWindow, "bounds");
  objc_msgSend(v26, "setFrame:");

  -[_XBWrapperWindow setNeedsUpdateConstraints](self->_wrapperWindow, "setNeedsUpdateConstraints");
  -[_XBWrapperWindow setNeedsLayout](self->_wrapperWindow, "setNeedsLayout");
  -[_XBWrapperWindow layoutIfNeeded](self->_wrapperWindow, "layoutIfNeeded");
  -[_XBWrapperWindow setNeedsDisplay](self->_wrapperWindow, "setNeedsDisplay");
  v27 = sub_100002CBC();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updated window", buf, 2u);
  }

  +[CATransaction flush](CATransaction, "flush");
  +[CATransaction synchronize](CATransaction, "synchronize");
  captureOptions = self->_captureOptions;
  v30 = -[XBLaunchImageContextWrapper contextID](self, "contextID");
  appInfo = self->_appInfo;
  v32 = self->_launchRequest;
  launchInterface = self->_launchInterface;
  v33 = self->_wrapperWindow;
  if ((captureOptions & 2) != 0)
  {
    v37 = 0;
    _XBPreparedLaunchInterfaceForCapture(v30, v33, appInfo, v32, launchInterface, &v37);
    v35 = v37;
    if (v35)
    {
      v36 = v35;
      -[XBLaunchCaptureInformation setCaarFilePath:](self->_captureInformation, "setCaarFilePath:", v35);

    }
  }
  else
  {
    _XBPreparedLaunchInterfaceForCapture(v30, v33, appInfo, v32, launchInterface, 0);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_ioSurfaceForLayerContents:(void *)a3
{
  CFTypeID v4;
  uint64_t ImageProvider;
  void *v6;

  v4 = CFGetTypeID(a3);
  if (v4 == CGImageGetTypeID())
  {
    ImageProvider = CGImageGetImageProvider(a3);
    v6 = (void *)CGImageProviderCopyIOSurface(ImageProvider, 0);
  }
  else if (v4 == IOSurfaceGetTypeID())
  {
    v6 = a3;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)_estimatedMemorySizeOfViewHierarchy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  char isKindOfClass;
  double v18;
  double v19;
  void *v20;
  id v21;
  NSObject *v22;
  CFTypeID v23;
  size_t Width;
  size_t Height;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  id v28;
  NSObject *v29;
  uint64_t v30;
  size_t v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  size_t v56;
  __int16 v57;
  size_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contents"));
  if (!v6)
  {
    v14 = sub_100002AFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = objc_opt_class(UIImageView);
      isKindOfClass = objc_opt_isKindOfClass(v4, v16);

      if ((isKindOfClass & 1) == 0)
      {
LABEL_16:
        v11 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v4, "bounds");
      v11 = 0;
      if (v19 <= 0.0 || v18 <= 0.0)
        goto LABEL_30;
      v15 = v4;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject image](v15, "image"));
      if (v20)
      {
        v21 = sub_100002AFC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          *(_DWORD *)buf = 138543874;
          v54 = (uint64_t)v46;
          v55 = 2114;
          v56 = (size_t)v15;
          v57 = 2114;
          v58 = (size_t)v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}@] found UIImageView with no contents, but has image: %{public}@ %{public}@", buf, 0x20u);

        }
      }

    }
    goto LABEL_16;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageContextWrapper _ioSurfaceForLayerContents:](self, "_ioSurfaceForLayerContents:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "width");
    v10 = objc_msgSend(v8, "height");
    v11 = (unint64_t)objc_msgSend(v8, "allocationSize");
    v12 = sub_100002AFC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
      *(_DWORD *)buf = 138544642;
      v54 = (uint64_t)v44;
      v55 = 2048;
      v56 = (size_t)v9;
      v57 = 2048;
      v58 = (size_t)v10;
      v59 = 2048;
      v60 = v11;
      v61 = 2114;
      v62 = v4;
      v63 = 2114;
      v64 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}@] found IOSurface in layer hierarchy; size: {%zu, %zu}; allocSize: %zu; view: %{public}@; layer: %{public}@",
        buf,
        0x3Eu);

    }
  }
  else
  {
    v23 = CFGetTypeID(v6);
    if (v23 == CGImageGetTypeID())
    {
      Width = CGImageGetWidth((CGImageRef)v6);
      Height = CGImageGetHeight((CGImageRef)v6);
      BitsPerPixel = CGImageGetBitsPerPixel((CGImageRef)v6);
      BytesPerRow = CGImageGetBytesPerRow((CGImageRef)v6);
      if (CGImageGetAlphaInfo((CGImageRef)v6) == kCGImageAlphaOnly)
      {
        v28 = sub_100002AFC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v30 = objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          v31 = BitsPerPixel >> 3;
          *(_DWORD *)buf = 138543874;
          v54 = v30;
          v32 = (void *)v30;
          v55 = 2048;
          v56 = v31;
          v57 = 2048;
          v58 = BytesPerRow;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage that's alpha only. Trusting %zu bytes per pixel and %zu bytes per row", buf, 0x20u);

        }
      }
      else
      {
        v33 = BitsPerPixel >> 3;
        v34 = 4;
        if (v33 > 4)
          v34 = v33;
        BytesPerRow = v34 * Width;
        v35 = sub_100002AFC();
        v29 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
          *(_DWORD *)buf = 138543874;
          v54 = (uint64_t)v47;
          v55 = 2048;
          v56 = v33;
          v57 = 2048;
          v58 = BytesPerRow;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage that's NOT alpha only. Taking MAX(4, %zu) bytes per pixel to calculate %zu bytes per row", buf, 0x20u);

        }
      }

      v36 = sub_100002AFC();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationLaunchCompatibilityInfo bundleIdentifier](self->_appInfo, "bundleIdentifier"));
        *(_DWORD *)buf = 138544642;
        v54 = (uint64_t)v45;
        v55 = 2048;
        v56 = Width;
        v57 = 2048;
        v58 = Height;
        v59 = 2048;
        v60 = BytesPerRow;
        v61 = 2114;
        v62 = v4;
        v63 = 2114;
        v64 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage in layer hierarchy; size: {%zu, %zu}; bytesPerRow: %zu; view: %{public}@; layer: %{public}@",
          buf,
          0x3Eu);

      }
      v11 = BytesPerRow * Height;
    }
    else
    {
      v11 = 0;
    }
  }

LABEL_30:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        v11 += -[XBLaunchImageContextWrapper _estimatedMemorySizeOfViewHierarchy:](self, "_estimatedMemorySizeOfViewHierarchy:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v40);
  }

  return v11;
}

- (void)updateLaunchRequest:(id)a3
{
  XBLaunchStateRequest *v5;
  XBLaunchStateRequest *v6;

  v5 = (XBLaunchStateRequest *)a3;
  if (self->_launchRequest != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_launchRequest, a3);
    v5 = v6;
    if (v6)
    {
      -[XBLaunchImageContextWrapper _update](self, "_update");
      v5 = v6;
    }
  }

}

- (void)invalidate
{
  _XBWrapperWindow *wrapperWindow;
  UIViewController *rootViewController;
  NSBundle *bundle;
  XBLaunchCaptureInformation *captureInformation;

  -[_XBWrapperWindow setHidden:](self->_wrapperWindow, "setHidden:", 1);
  -[_XBWrapperWindow setRootViewController:](self->_wrapperWindow, "setRootViewController:", 0);
  wrapperWindow = self->_wrapperWindow;
  self->_wrapperWindow = 0;

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  -[NSBundle unload](self->_bundle, "unload");
  bundle = self->_bundle;
  self->_bundle = 0;

  captureInformation = self->_captureInformation;
  self->_captureInformation = 0;

  self->_captureOptions = 0;
  +[_UIAssetManager _clearAllCachedImagesAndAssets](_UIAssetManager, "_clearAllCachedImagesAndAssets");
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (XBLaunchInterface)launchInterface
{
  return self->_launchInterface;
}

- (_XBWrapperWindow)wrapperWindow
{
  return self->_wrapperWindow;
}

- (void)setWrapperWindow:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperWindow, a3);
}

- (XBApplicationLaunchCompatibilityInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appInfo, a3);
}

- (XBLaunchStateRequest)launchRequest
{
  return self->_launchRequest;
}

- (void)setLaunchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_launchRequest, a3);
}

- (XBLaunchImageError)error
{
  return self->_error;
}

- (XBLaunchCaptureInformation)captureInformation
{
  return self->_captureInformation;
}

- (void)setCaptureInformation:(id)a3
{
  objc_storeStrong((id *)&self->_captureInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureInformation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_wrapperWindow, 0);
  objc_storeStrong((id *)&self->_launchInterface, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
