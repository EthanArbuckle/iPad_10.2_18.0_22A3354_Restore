@implementation ICStartupDeviceListViewController

- (void)viewDidLoad
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICStartupDeviceListViewController;
  -[ICStartupBaseViewController viewDidLoad](&v20, "viewDidLoad");
  -[ICStartupDeviceListViewController applyAccessibilityInfo](self, "applyAccessibilityInfo");
  -[ICStartupDeviceListViewController updateDeviceList](self, "updateDeviceList");
  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[ICStartupDeviceListViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v12));
  objc_msgSend(v7, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutMarginsGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  objc_msgSend(v7, "addObject:", v19);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);
}

- (double)standardFontSize
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "horizontalSizeClass") == (id)1)
    v3 = 17.0;
  else
    v3 = 20.0;

  return v3;
}

- (id)disclaimerStringForCurrentDevice
{
  void *v2;
  void *v3;
  const __CFString *v4;
  unsigned int v5;
  void *v6;

  if (+[UIDevice ic_isiPhone](UIDevice, "ic_isiPhone"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = v2;
    v4 = CFSTR("Upgraded notes may look different. Notes on this iPhone will also be upgraded.");
  }
  else if (+[UIDevice ic_isiPad](UIDevice, "ic_isiPad"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = v2;
    v4 = CFSTR("Upgraded notes may look different. Notes on this iPad will also be upgraded.");
  }
  else
  {
    v5 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = v2;
    if (v5)
      v4 = CFSTR("Upgraded notes may look different. Notes on this Vision Pro will also be upgraded.");
    else
      v4 = CFSTR("Upgraded notes may look different. Notes on this device will also be upgraded.");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1005704B8, 0));

  return v6;
}

- (void)updateDeviceList
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryAccountDevices"));

  v28 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICStartupController importantDisclaimerAttributedString](ICStartupController, "importantDisclaimerAttributedString"));
  objc_msgSend(v4, "appendAttributedString:", v5);

  objc_msgSend(v4, "ic_appendString:", CFSTR("\n"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v27 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        if (objc_msgSend(v12, "length")
          && ((unint64_t)objc_msgSend(v11, "notesVersion") & 0x8000000000000000) != 0)
        {
          objc_msgSend(v28, "addObject:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController attributedStringWithString:font:color:](self, "attributedStringWithString:font:color:", v13, 0, 0));
          v15 = objc_msgSend(v14, "mutableCopy");

          if (((unint64_t)objc_msgSend(v11, "maximumNotesVersion") & 0x8000000000000000) != 0)
          {
            v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
            objc_msgSend(v15, "appendAttributedString:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController redAsteriskAttributedString](self, "redAsteriskAttributedString"));
            objc_msgSend(v15, "appendAttributedString:", v17);

            v27 = 1;
          }
          if (objc_msgSend(v4, "length"))
          {
            v18 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
            objc_msgSend(v4, "appendAttributedString:", v18);

          }
          objc_msgSend(v4, "appendAttributedString:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }
  else
  {
    v27 = 0;
  }

  v19 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "All Devices Received: %@", buf, 0xCu);
  }

  v20 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Non-Upgraded Devices: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "ic_appendString:", CFSTR("\n"));
  if ((v27 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController redAsteriskAttributedString](self, "redAsteriskAttributedString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR(" Device can’t be upgraded."), &stru_1005704B8, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController attributedStringWithString:font:color:](self, "attributedStringWithString:font:color:", v23, 0, 0));

    objc_msgSend(v21, "appendAttributedString:", v24);
    objc_msgSend(v4, "ic_appendString:", CFSTR("\n"));
    objc_msgSend(v4, "appendAttributedString:", v21);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  objc_msgSend(v25, "setDetailText:", v26);

}

- (id)attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    -[ICStartupDeviceListViewController standardFontSize](self, "standardFontSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_fontWithSingleLineA"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = objc_alloc((Class)NSAttributedString);
  v17[0] = NSFontAttributeName;
  v17[1] = NSForegroundColorAttributeName;
  v18[0] = v9;
  v18[1] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v14 = objc_msgSend(v12, "initWithString:attributes:", v8, v13);

  return v14;
}

- (id)redAsteriskAttributedString
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController redColor](self, "redColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController attributedStringWithString:font:color:](self, "attributedStringWithString:font:color:", CFSTR("*"), 0, v3));
  v5 = objc_msgSend(v4, "mutableCopy");

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICStartupDeviceListViewController;
  -[ICStartupDeviceListViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesBackButton:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLeftBarButtonItem:", 0);

}

- (id)redColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.235294118, 0.0784313725, 1.0);
}

- (void)didCompleteAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
  objc_msgSend(v2, "dismiss");

}

- (void)startIndicatorAnimation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v2, "startAnimating");

}

- (void)stopIndicatorAnimation
{
  id v3;

  -[ICStartupDeviceListViewController updateDeviceList](self, "updateDeviceList");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v3, "stopAnimating");

}

- (void)applyAccessibilityInfo
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupDeviceListViewController view](self, "view"));
  objc_msgSend(v2, "setAccessibilityViewIsModal:", 1);

}

- (id)choiceLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Upgrade Now"), &stru_1005704B8, 0));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Upgrade Later"), &stru_1005704B8, 0));
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

- (void)choiceSelected:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "noUpgradeAction");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
    objc_msgSend(v7, "dismiss");

  }
  else
  {
    objc_msgSend(v5, "upgradeAction");

    -[ICStartupDeviceListViewController didCompleteAction](self, "didCompleteAction");
  }
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return *(UIActivityIndicatorView **)(&self->super + 1);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)(&self->super + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end
