@implementation PushNotificationPrompt

+ (void)checkShouldRepeatForUserAction:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t Integer;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = a3;
  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PushNotificationPrompt checkShouldRepeatForUserAction", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MapsNotificationAuthLastPromptedDate")));

  v8 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = objc_msgSend(v10, "integerForKey:", CFSTR("MapsNotificationAuthRepromptCount"));

    Integer = GEOConfigGetInteger(MapsConfig_NotificationAuthorizationRepromptAllowedAttempts, off_1014B4898);
    v13 = sub_100431A4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PushNotificationPrompt: user was prompted previously on %@, has been repeat prompted %@ times, with a maximum repeat prompt count of %@", buf, 0x20u);

    }
    if ((uint64_t)v11 >= Integer)
    {
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100B3BDD8;
      v20[3] = &unk_1011BAED8;
      v21 = v3;
      objc_msgSend(v17, "getNotificationSettingsWithCompletionHandler:", v20);

    }
  }
  else
  {
    v18 = sub_100431A4C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "PushNotificationPrompt: user has never been prompted. This may be a user who set their notification preference to NO before Sky E.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

+ (BOOL)shouldRepeatPromptForLaunch
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t Integer;
  void *v9;
  double v10;
  double v11;
  double Double;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  id v22;
  int v24;
  NSObject *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MapsNotificationAuthLastPromptedDate")));

  v4 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v21 = sub_100431A4C();
    v5 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldRepeatPromptForLaunch user has never been prompted. This may be an initial launch, or a user who set their notification preference to NO before Sky E.", (uint8_t *)&v24, 2u);
    }
    goto LABEL_14;
  }
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "integerForKey:", CFSTR("MapsNotificationAuthRepromptCount"));

  Integer = GEOConfigGetInteger(MapsConfig_NotificationAuthorizationRepromptAllowedAttempts, off_1014B4898);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSinceDate:", v5);
  v11 = v10;
  Double = GEOConfigGetDouble(MapsConfig_NotificationAuthorizationRepromptInterval, off_1014B4888);

  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
    v24 = 138412802;
    v25 = v5;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldRepeatPromptForLaunch user was prompted previously on %@, has been repeat prompted %@ times, with a maximum repeat prompt count of %@", (uint8_t *)&v24, 0x20u);

  }
  if (v11 <= Double || (uint64_t)v7 >= Integer)
  {
LABEL_14:

    v22 = sub_100431A4C();
    v5 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PushNotificationPrompt: returning NO for shouldRepeatPromptForLaunch", (uint8_t *)&v24, 2u);
    }
    v20 = 0;
    goto LABEL_17;
  }
  v18 = sub_100431A4C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "PushNotificationPrompt: returning YES for shouldRepeatPromptForLaunch", (uint8_t *)&v24, 2u);
  }

  v20 = 1;
LABEL_17:

  return v20;
}

+ (BOOL)shouldPromptForLaunch
{
  void *v2;
  id v3;
  uint64_t Integer;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MapsNotificationAuthPromptCount"));

  Integer = GEOConfigGetInteger(MapsConfig_NotificationAuthorizationLaunchPromptAllowedAttempts, off_1014B48A8);
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (uint64_t)v3 < Integer));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "PushNotificationPrompt: shouldPromptForLaunch %@ with prompt count %@ max prompts %@", (uint8_t *)&v11, 0x20u);

  }
  return (uint64_t)v3 < Integer;
}

- (id)titleString
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  switch(self->_promptReason)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      if ((SBUIIsSystemApertureEnabled(self) & 1) != 0
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration")), v4 = objc_msgSend(v3, "currentCountrySupportsNavigation"), v3, (v4 & 1) == 0))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Get Notified when Friends Share Their ETAs");
      }
      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Get Turn-by-Turn Directions");
      }
      goto LABEL_8;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Get Updates on Your Reports");
      goto LABEL_8;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Learn When Your Photos Go Live");
LABEL_8:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)detailText
{
  int64_t authorizationStatus;
  char v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;

  authorizationStatus = self->_authorizationStatus;
  v4 = SBUIIsSystemApertureEnabled(self);
  if (authorizationStatus)
  {
    if ((v4 & 1) != 0
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration")), v6 = objc_msgSend(v5, "currentCountrySupportsNavigation"), v5, (v6 & 1) == 0))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("Notifications include shared ETAs and updates about your photos and reports. You can turn notifications for Maps on and off in Settings.");
    }
    else
    {
      v7 = sub_1002A8AA0(self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      if (v7 == 5)
        v10 = CFSTR("Notifications include shared ETAs and updates about your photos and reports. You can turn notifications for Maps on and off in System Settings.");
      else
        v10 = CFSTR("Notifications include turn-by-turn directions, shared ETAs, and updates about your photos and reports. You can turn notifications for Maps on and off in Settings.");
    }
  }
  else if ((v4 & 1) != 0
         || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration")), v12 = objc_msgSend(v11, "currentCountrySupportsNavigation"), v11, (v12 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("Notifications include shared ETAs and updates about your photos and reports.");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("Notifications include turn-by-turn directions, shared ETAs, and updates about your photos and reports.");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

  return v13;
}

- (id)primaryButtonTitle
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (self->_authorizationStatus)
  {
    v2 = sub_1002A8AA0(self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    if (v2 == 5)
      v5 = CFSTR("[Notification Prewarm] Open System Settings");
    else
      v5 = CFSTR("[Notification Prewarm] Go to Settings");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("[Notification Prewarm] Enable Notifications");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (id)secondaryButtonTitle
{
  void *v3;
  id v4;
  uint64_t Integer;
  unint64_t promptReason;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("MapsNotificationAuthRepromptCount"));

  Integer = GEOConfigGetInteger(MapsConfig_NotificationAuthorizationRepromptAllowedAttempts, off_1014B4898);
  promptReason = self->_promptReason;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if ((uint64_t)v4 + 1 < Integer || promptReason == 0)
    v10 = CFSTR("[Notification Prewarm] Not Now");
  else
    v10 = CFSTR("[Notification Prewarm] Dismiss");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

  return v11;
}

- (PushNotificationPrompt)initWithReason:(unint64_t)a3 authorizationStatus:(int64_t)a4 completion:(id)a5
{
  id v8;
  PushNotificationPrompt *v9;
  id v10;
  id completion;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PushNotificationPrompt;
  v9 = -[PushNotificationPrompt initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  if (v9)
  {
    v10 = objc_retainBlock(v8);
    completion = v9->_completion;
    v9->_completion = v10;

    v9->_authorizationStatus = a4;
    v9->_promptReason = a3;
    -[PushNotificationPrompt setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt presentationController](v9, "presentationController"));
    objc_msgSend(v12, "setDelegate:", v9);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
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
  id v18;
  double y;
  double width;
  double height;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *titleToDetailConstraint;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PushNotificationPrompt *v53;
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
  uint64_t v67;
  NSLayoutConstraint *notNowToContinueConstraint;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSLayoutConstraint *continueToBottomConstraint;
  NSLayoutConstraint *v75;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  PushNotificationPrompt *v125;
  _QWORD v126[5];
  _QWORD v127[5];
  objc_super v128;
  _QWORD v129[2];
  _QWORD v130[4];
  _QWORD v131[13];

  v128.receiver = self;
  v128.super_class = (Class)PushNotificationPrompt;
  -[PushNotificationPrompt viewDidLoad](&v128, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc_init((Class)UIScrollView);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  objc_msgSend(v7, "addSubview:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v8, "setButtonSize:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "background"));
  objc_msgSend(v9, "setCornerRadius:", 14.0);

  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_100B3D4EC;
  v127[3] = &unk_1011B2810;
  v127[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v127));
  v121 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v8, v10));

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  objc_msgSend(v12, "addSubview:", v11);

  v123 = v11;
  objc_storeStrong((id *)&self->_continueButton, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_100B3D4F4;
  v126[3] = &unk_1011B2810;
  v126[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v126));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v13, v14));

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configuration"));
  objc_msgSend(v16, "setButtonSize:", 3);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  objc_msgSend(v17, "addSubview:", v15);

  objc_storeStrong((id *)&self->_notNowButton, v15);
  v18 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v22 = objc_msgSend(v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v22, "setTextColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt titleString](self, "titleString"));
  objc_msgSend(v22, "setText:", v24);

  objc_msgSend(v22, "setNumberOfLines:", 0);
  objc_msgSend(v22, "setTextAlignment:", 1);
  objc_msgSend(v6, "addSubview:", v22);
  objc_storeStrong((id *)&self->_titleLabel, v22);
  v25 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v25, "setTextColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt detailText](self, "detailText"));
  objc_msgSend(v25, "setText:", v27);

  objc_msgSend(v25, "setNumberOfLines:", 0);
  objc_msgSend(v25, "setTextAlignment:", 1);
  v124 = v6;
  objc_msgSend(v6, "addSubview:", v25);
  v122 = v25;
  objc_storeStrong((id *)&self->_detailLabel, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v28));

  v118 = v29;
  v30 = objc_msgSend(v29, "containsString:", CFSTR("a"));
  v120 = v15;
  if (sub_1002A8AA0(self) == 5)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MacNotificationWarmingHeader")));
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localeIdentifier"));

    v34 = _CFLocaleCopyNumberingSystemForLocaleIdentifier(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (objc_msgSend(v35, "isEqualToString:", CFSTR("arab")))
    {
      if ((v30 & 1) != 0)
        v36 = CFSTR("Arabic12hrNotificationWarmingHeader");
      else
        v36 = CFSTR("Arabic24hrNotificationWarmingHeader");
    }
    else if (objc_msgSend(v35, "isEqualToString:", CFSTR("deva")))
    {
      if ((v30 & 1) != 0)
        v36 = CFSTR("Devanagar12hrNotificationWarmingHeader");
      else
        v36 = CFSTR("Devanagar24hrNotificationWarmingHeader");
    }
    else if ((v30 & 1) != 0)
    {
      v36 = CFSTR("12hrNotificationWarmingHeader");
    }
    else
    {
      v36 = CFSTR("24hrNotificationWarmingHeader");
    }
    v31 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v36));

  }
  v117 = (void *)v31;
  v37 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v31);
  objc_msgSend(v37, "setContentMode:", 2);
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v37, "setClipsToBounds:", 1);
  objc_msgSend(v124, "addSubview:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "firstBaselineAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastBaselineAnchor"));
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  titleToDetailConstraint = self->_titleToDetailConstraint;
  self->_titleToDetailConstraint = v40;

  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "topAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "topAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v109));
  v131[0] = v107;
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "widthAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "widthAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v101));
  v131[1] = v99;
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "leadingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
  v131[2] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "bottomAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, -16.0));
  v131[3] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "widthAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "widthAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v131[4] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v131[5] = v85;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "heightAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "heightAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintLessThanOrEqualToAnchor:multiplier:", v82, 0.48));
  v131[6] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerXAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "centerXAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
  v131[7] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstBaselineAnchor"));
  v116 = v37;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
  v125 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 54.0));
  v131[8] = v42;
  v119 = v22;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
  v46 = v125->_titleToDetailConstraint;
  v131[9] = v45;
  v131[10] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "centerXAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "centerXAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
  v131[11] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:constant:", v51, -8.0));
  v131[12] = v52;
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 13));

  v53 = v125;
  if (sub_1002A8AA0(v125) == 5)
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "bottomAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](v125, "view"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "bottomAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:constant:", v112, -20.0));
    v130[0] = v110;
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "trailingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](v125, "view"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v104, -20.0));
    v130[1] = v102;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "centerYAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v54));
    v130[2] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -20.0));
    v130[3] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 4));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "arrayByAddingObjectsFromArray:", v59));

    v61 = v100;
    v62 = v120;

    v53 = v125;
    v63 = v114;
    v64 = v123;
  }
  else
  {
    v62 = v120;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "firstBaselineAnchor"));
    v64 = v123;
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "bottomAnchor"));
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v66));
    notNowToContinueConstraint = v125->_notNowToContinueConstraint;
    v125->_notNowToContinueConstraint = (NSLayoutConstraint *)v67;

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "bottomAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](v125, "view"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "safeAreaLayoutGuide"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v72));
    continueToBottomConstraint = v125->_continueToBottomConstraint;
    v125->_continueToBottomConstraint = (NSLayoutConstraint *)v73;

    v75 = v125->_continueToBottomConstraint;
    v129[0] = v125->_notNowToContinueConstraint;
    v129[1] = v75;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 2));
    v63 = v115;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "arrayByAddingObjectsFromArray:", v61));
  }

  -[PushNotificationPrompt _contentSizeDidChange](v53, "_contentSizeDidChange");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  NSAttributedStringKey v15;
  void *v16;
  NSAttributedStringKey v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  -[UILabel setFont:](self->_detailLabel, "setFont:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightSemibold));
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt primaryButtonTitle](self, "primaryButtonTitle"));
  v17 = NSFontAttributeName;
  v18 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v9 = objc_msgSend(v6, "initWithString:attributes:", v7, v8);

  -[UIButton setAttributedTitle:forState:](self->_continueButton, "setAttributedTitle:forState:", v9, 0);
  v10 = objc_alloc((Class)NSAttributedString);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt secondaryButtonTitle](self, "secondaryButtonTitle"));
  v15 = NSFontAttributeName;
  v16 = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v13 = objc_msgSend(v10, "initWithString:attributes:", v11, v12);

  -[UIButton setAttributedTitle:forState:](self->_notNowButton, "setAttributedTitle:forState:", v13, 0);
  objc_msgSend(v3, "_scaledValueForValue:", 30.0);
  -[NSLayoutConstraint setConstant:](self->_notNowToContinueConstraint, "setConstant:");
  objc_msgSend(v3, "_scaledValueForValue:", 44.0);
  -[NSLayoutConstraint setConstant:](self->_titleToDetailConstraint, "setConstant:");
  objc_msgSend(v3, "_scaledValueForValue:", 54.0);
  -[NSLayoutConstraint setConstant:](self->_continueToBottomConstraint, "setConstant:", -v14);

}

- (void)_setHorizontalLayoutWide:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *horizontalConstraints;
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
  NSArray *v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[2];

  v3 = a3;
  if (!self->_horizontalConstraints || self->_horizontalLayoutIsWide != a3)
  {
    self->_horizontalLayoutIsWide = a3;
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_horizontalConstraints);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_titleLabel, "widthAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    if (v3)
      v8 = -74.0;
    else
      v8 = -48.0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, v8));
    v42[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_detailLabel, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "widthAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v8));
    v42[1] = v13;
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));

    if (v3)
    {
      v14 = v39;
      if (sub_1002A8AA0(self) == 5)
      {
LABEL_11:
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
        horizontalConstraints = self->_horizontalConstraints;
        self->_horizontalConstraints = v14;

        return;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_notNowButton, "centerXAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:"));
      v40[0] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_notNowButton, "widthAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 360.0));
      v40[1] = v35;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_continueButton, "centerXAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v34 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:"));
      v40[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_continueButton, "widthAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 360.0));
      v40[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
      v22 = v39;
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v39, "arrayByAddingObjectsFromArray:", v21));
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_notNowButton, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", 24.0));
      v41[0] = v37;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_notNowButton, "trailingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v36 = v23;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", -24.0));
      v41[1] = v33;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_continueButton, "leadingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v19, 24.0));
      v41[2] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_continueButton, "trailingAnchor"));
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray trailingAnchor](v22, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v24, -24.0));
      v41[3] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
      v27 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v39, "arrayByAddingObjectsFromArray:", v26));

      v18 = v29;
      v14 = (NSArray *)v27;

      v16 = v31;
      v15 = v30;
    }

    goto LABEL_11;
  }
}

- (void)_updateHorizontalLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  double Width;
  void *v10;
  CGRect v11;
  CGRect v12;

  if (sub_1002A8AA0(self))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
    v6 = objc_msgSend(v5, "horizontalSizeClass") != (id)1;

  }
  else
  {
    v6 = 0;
  }
  if (sub_1002A8AA0(self))
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
    objc_msgSend(v8, "bounds");
    Width = CGRectGetWidth(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationPrompt view](self, "view"));
    objc_msgSend(v10, "bounds");
    v7 = Width > CGRectGetHeight(v12);

  }
  -[PushNotificationPrompt _setHorizontalLayoutWide:](self, "_setHorizontalLayoutWide:", v6 | v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PushNotificationPrompt;
  -[PushNotificationPrompt viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PushNotificationPrompt _updateHorizontalLayoutIfNeeded](self, "_updateHorizontalLayoutIfNeeded");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PushNotificationPrompt;
  v7 = a4;
  -[PushNotificationPrompt viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B3DE78;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t promptReason;
  void *v5;
  void *v6;
  const __CFString *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PushNotificationPrompt;
  -[PushNotificationPrompt viewDidAppear:](&v12, "viewDidAppear:", a3);
  promptReason = self->_promptReason;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = v5;
  if (promptReason)
    v7 = CFSTR("MapsNotificationAuthRepromptCount");
  else
    v7 = CFSTR("MapsNotificationAuthPromptCount");
  v8 = (char *)objc_msgSend(v5, "integerForKey:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "setInteger:forKey:", v8 + 1, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("MapsNotificationAuthLastPromptedDate"));

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, -[PushNotificationPrompt _analyticsTarget](self, "_analyticsTarget"), 0);
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = 600.0;
    v4 = 480.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PushNotificationPrompt;
    -[PushNotificationPrompt preferredContentSize](&v5, "preferredContentSize");
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)continueSelected
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void (**completion)(void);
  _QWORD v10[5];
  _QWORD v11[5];
  BOOL v12;

  v3 = sub_1002A8AA0(self);
  if (self->_authorizationStatus)
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 271, -[PushNotificationPrompt _analyticsTarget](self, "_analyticsTarget"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", UIApplicationOpenNotificationSettingsURLString));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B3E26C;
    v10[3] = &unk_1011AE8F8;
    v10[4] = self;
    objc_msgSend(v5, "openURL:options:completionHandler:", v4, &__NSDictionary0__struct, v10);

  }
  else
  {
    v6 = v3;
    v7 = v3 == 5;
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2119, -[PushNotificationPrompt _analyticsTarget](self, "_analyticsTarget"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B3E194;
    v11[3] = &unk_1011E3CE8;
    v12 = v7;
    v11[4] = self;
    objc_msgSend(v8, "requestAuthorizationWithOptions:completionHandler:", 14, v11);

    if (v6 == 5)
    {
      completion = (void (**)(void))self->_completion;
      if (completion)
        completion[2]();
    }
  }
}

- (int)_analyticsTarget
{
  unint64_t promptReason;

  promptReason = self->_promptReason;
  if (promptReason > 4)
    return 0;
  else
    return dword_100E3EF38[promptReason];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_notNowToContinueConstraint, 0);
  objc_storeStrong((id *)&self->_titleToDetailConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
