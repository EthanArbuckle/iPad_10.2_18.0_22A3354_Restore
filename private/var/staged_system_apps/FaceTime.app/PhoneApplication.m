@implementation PhoneApplication

- (PhoneApplication)init
{
  PhoneApplication *v2;
  TUFeatureFlags *v3;
  TUFeatureFlags *featureFlags;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhoneApplication;
  v2 = -[PhoneApplication init](&v6, "init");
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;

  }
  return v2;
}

- (void)warmInCallServiceIfNecessary
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  dispatch_queue_global_t global_queue;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", TUBundleIdentifierMobilePhoneApplication);

  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "asking to prewarm InCallService...", buf, 2u);
    }

    global_queue = dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v6, &stru_1000899F8);
  }
  else if (v7)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", v9, 2u);
  }

}

- (void)applicationDidFinishLaunching:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((byte_1000A3678 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
    objc_msgSend(v4, "addListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameCalling);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
    objc_msgSend(v5, "addListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameFaceTime);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_localeChangedNotification:", NSCurrentLocaleDidChangeNotification, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleIDSServiceAvailabilityDidChangeNotification:", IDSServiceAvailabilityDidChangeNotification, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleApplicationFinishedSnapshottingNotification:", _UIApplicationDidFinishSuspensionSnapshotNotification, 0);
    -[PhoneApplication setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "setDelegate:", self);

    getenv("LogPhoneTransitionTimes");
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    byte_1000A3678 = 1;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "registerDefaults:", &off_10008DC88);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 != (id)1)
    ABAddressBookSetAutorotationEnabled(0);
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PhoneApplication _setDefaultTopNavBarTintColor:](self, "_setDefaultTopNavBarTintColor:", v11);

  }
}

- (BOOL)inCall
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedCalls"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(UIApp, "showsCallsFromService:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "service")) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (PhoneRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (BOOL)isDeviceCapableOfTelephonyCalls
{
  return +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
}

- (BOOL)isDeviceCapableOfFaceTimeVideo
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls](TUCallCapabilities, "supportsDisplayingFaceTimeVideoCalls");
}

- (BOOL)isDeviceCapableOfFaceTimeAudio
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls](TUCallCapabilities, "supportsDisplayingFaceTimeAudioCalls");
}

- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3
{
  return +[TUCallHistoryController sharedControllerWithCoalescingStrategy:options:](TUCallHistoryController, "sharedControllerWithCoalescingStrategy:options:", a3, -[PhoneApplication callHistoryControllerOptions](self, "callHistoryControllerOptions"));
}

- (unint64_t)callHistoryControllerOptions
{
  unint64_t v3;

  v3 = -[PhoneApplication showsFaceTimeAudioRecents](self, "showsFaceTimeAudioRecents");
  if (-[PhoneApplication showsFaceTimeVideoRecents](self, "showsFaceTimeVideoRecents"))
    v3 |= 2uLL;
  if (-[PhoneApplication showsTelephonyRecents](self, "showsTelephonyRecents"))
    v3 |= 4uLL;
  if (-[PhoneApplication showsThirdPartyRecents](self, "showsThirdPartyRecents"))
    return v3 | 8;
  else
    return v3;
}

- (UIColor)applicationTintColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (BOOL)shouldSnapshot
{
  return !objc_msgSend(UIApp, "alwaysShowLocalVideo")
      || (objc_msgSend(UIApp, "tabBarCanSlide") & 1) == 0;
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[PhoneApplication shouldSnapshot](self, "shouldSnapshot"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseViewController"));

    if (objc_msgSend(v4, "shouldSnapshot"))
    {
      v5 = objc_msgSend((id)objc_opt_class(v4), "defaultPNGName");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  unsigned int v20;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen:%@", (uint8_t *)&v17, 0xCu);
  }

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (v7 == v4)
  {
    v8 = -[PhoneApplication shouldSnapshot](self, "shouldSnapshot");
    v9 = sub_10000E6C4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109120;
      LODWORD(v18) = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: is considering snapshotting for main screen, shouldSnapshot=%d", (uint8_t *)&v17, 8u);
    }

    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseViewController"));

      v13 = objc_msgSend(v12, "shouldSnapshot");
      v14 = sub_10000E6C4();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412546;
        v18 = v12;
        v19 = 1024;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "-prepareForDefaultImageShapshotForScreen: view controller %@ should snapshot=%d", (uint8_t *)&v17, 0x12u);
      }

      if (v13)
        objc_msgSend(v12, "prepareForSnapshot");
      if (-[PhoneApplication alwaysShowLocalVideo](self, "alwaysShowLocalVideo"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self->_rootController, "localVideoViewController"));
        objc_msgSend(v16, "fadeOutAnimated:", 0);

      }
    }
  }

}

- (void)handleApplicationFinishedSnapshottingNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "-handleApplicationFinishedSnapshottingNotification:%@", (uint8_t *)&v7, 0xCu);
  }

  -[PhoneApplication _resetCurrentViewController](self, "_resetCurrentViewController");
}

- (BOOL)applicationSuspendWithSettings:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(UIApp, "usesUnifiedInterface") & 1) != 0)
  {
    v5 = CFSTR("Default");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self->_rootController, "baseViewController"));
    v7 = objc_msgSend((id)objc_opt_class(v6), "defaultPNGName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);

    if (!v5)
    {
      objc_msgSend(v4, "removeObjectForKey:", kUISuspendedDefaultPNGKey);
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "setObject:forKey:", v5, kUISuspendedDefaultPNGKey);

LABEL_6:
  return 0;
}

- (void)_resetCurrentViewController
{
  id v3;

  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self->_rootController, "localVideoViewController"));
    objc_msgSend(v3, "fadeOutAnimated:", 0);

  }
}

- (void)showInitialView
{
  -[PhoneRootViewController ensureBaseViewControllerIsShowing](self->_rootController, "ensureBaseViewControllerIsShowing");
}

- (CGRect)phoneViewTabBarContentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self->_rootController, "contentView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t Default;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  objc_super v8;

  -[PhoneApplication _resetCurrentViewController](self, "_resetCurrentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameCalling);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
  objc_msgSend(v4, "removeListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameFaceTime);

  Default = CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver(Default, self, kCTIndicatorsVoiceMailNotification, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)PhoneApplication;
  -[PhoneApplication dealloc](&v8, "dealloc");
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)_localeChangedNotification:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)qword_1000A3670;
  qword_1000A3670 = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PhoneApplicationLocaleChangedNotification"), 0);

}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[PhoneApplication callHistoryControllerOptions](self, "callHistoryControllerOptions", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication callHistoryController](self, "callHistoryController"));
  objc_msgSend(v5, "setOptions:", v4);

  if ((!-[PhoneApplication showsTelephonyCalls](self, "showsTelephonyCalls")
     || !-[PhoneApplication telephonyCallingIsAvailable](self, "telephonyCallingIsAvailable"))
    && (!-[PhoneApplication showsFaceTimeAudio](self, "showsFaceTimeAudio")
     || !-[PhoneApplication faceTimeAudioIsAvailable](self, "faceTimeAudioIsAvailable"))
    && (!-[PhoneApplication showsFaceTimeVideo](self, "showsFaceTimeVideo")
     || !-[PhoneApplication faceTimeVideoIsAvailable](self, "faceTimeVideoIsAvailable")))
  {
    -[PhoneRootViewController showFaceTimeFirstRunViewIfNeeded](self->_rootController, "showFaceTimeFirstRunViewIfNeeded");
  }
}

- (void)didReceiveMemoryWarning
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneApplication didReceiveMemoryWarning", v6, 2u);
  }

  if (-[PhoneApplication isSuspended](self, "isSuspended"))
  {
    if ((-[PhoneApplication isSuspendedEventsOnly](self, "isSuspendedEventsOnly") & 1) == 0)
    {
      v5 = (void *)qword_1000A3670;
      qword_1000A3670 = 0;

    }
  }
}

- (void)tabBarControllerViewDidAppear:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_msgSend(v4, "currentTabViewType");

  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "tabBarControllerViewDidAppear with tab: %d", (uint8_t *)v8, 8u);
  }

  if (v5 == 2)
    -[PhoneApplication warmInCallServiceIfNecessary](self, "warmInCallServiceIfNecessary");
}

- (BOOL)openURL:(id)a3
{
  -[PhoneApplication openURL:withCompletionHandler:](self, "openURL:withCompletionHandler:", a3, 0);
  return 1;
}

- (void)openURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  const __CFString *v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("non-nil");
    if (!v7)
      v10 = CFSTR("nil");
    *(_DWORD *)buf = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }

  v11.receiver = self;
  v11.super_class = (Class)PhoneApplication;
  -[PhoneApplication openURL:withCompletionHandler:](&v11, "openURL:withCompletionHandler:", v6, v7);

}

- (void)applicationOpenURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "applicationOpenURL %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseViewController"));

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("vmshow")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "voicemailMessageUUID"));
    if (!-[PhoneApplication hasEnhancedVoicemail](self, "hasEnhancedVoicemail") && !v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B8F0;
      block[3] = &unk_1000898B8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v10 = 0;
    }

  }
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "setAlpha:", 1.0);

    if ((objc_opt_respondsToSelector(v10, "handleURL:") & 1) != 0)
      objc_msgSend(v10, "handleURL:", v4);
  }

}

- (BOOL)dialVoicemail
{
  return -[PhoneApplication dialVoicemailWithAccountID:](self, "dialVoicemailWithAccountID:", 0);
}

- (BOOL)dialVoicemailWithAccountID:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint8_t v23[16];

  v4 = a3;
  v5 = objc_alloc_init((Class)TUCallProviderManager);
  v6 = objc_alloc((Class)TUDialRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "telephonyProvider"));
  v8 = objc_msgSend(v6, "initWithProvider:", v7);

  objc_msgSend(v8, "setDialType:", 2);
  if (v4)
    objc_msgSend(v8, "setLocalSenderIdentityAccountUUID:", v4);
  v9 = (uint64_t)objc_msgSend(v8, "dialType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localSenderIdentityUUID"));
  LOBYTE(v9) = sub_100021630(v9, v10);

  if ((v9 & 1) == 0)
  {
    v14 = sub_10000E6C4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Aborting voicemail call, the device is in airplane mode", v23, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
    v11 = objc_claimAutoreleasedReturnValue(+[UIAlertController networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:](UIAlertController, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:", v16, objc_msgSend(v8, "dialType"), 0));

    if (!v11)
      goto LABEL_16;
    v17 = objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    -[NSObject presentViewController:animated:completion:](v17, "presentViewController:animated:completion:", v11, 1, 0);
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "isValid"))
  {
    v18 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100054DD8((uint64_t)v8, v11, v19);
    goto LABEL_16;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  if (!v11)
  {
    v20 = sub_10000E6C4();
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100054D6C((uint64_t)v8, v17, v21);
LABEL_15:

LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v12, "openURL:withCompletionHandler:", v11, 0);

  v13 = 1;
LABEL_17:

  return v13;
}

- (int)userInterfaceScreenType
{
  if (qword_1000A3680 != -1)
    dispatch_once(&qword_1000A3680, &stru_100089A58);
  return byte_1000A367C;
}

- (BOOL)faceTimeVideoIsAvailable
{
  void *v2;
  BOOL v3;

  if (!-[PhoneApplication isDeviceCapableOfFaceTimeVideo](self, "isDeviceCapableOfFaceTimeVideo"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameFaceTime) == (id)1;

  return v3;
}

- (BOOL)telephonyCallingIsAvailable
{
  return objc_msgSend(UIApp, "isDeviceCapableOfTelephonyCalls");
}

- (BOOL)faceTimeAudioIsAvailable
{
  void *v2;
  BOOL v3;

  if (!-[PhoneApplication isDeviceCapableOfFaceTimeAudio](self, "isDeviceCapableOfFaceTimeAudio"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServiceAvailabilityController sharedInstance](IDSServiceAvailabilityController, "sharedInstance"));
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.mobilephone.FTCServiceAvailabilityListenerID"), IDSServiceNameCalling) == (id)1;

  return v3;
}

- (BOOL)isLowGraphicsPerformanceDevice
{
  if (qword_1000A3690 != -1)
    dispatch_once(&qword_1000A3690, &stru_100089A78);
  return qword_1000A3688 == 10;
}

- (unsigned)userInterfaceStyle
{
  return 0;
}

- (int64_t)backdropStyle
{
  return -2;
}

- (int)defaultAction
{
  return 0;
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return objc_msgSend(UIApp, "defaultAction") == 2;
}

- (BOOL)defaultActionIsFaceTimeVideo
{
  return objc_msgSend(UIApp, "defaultAction") == 1;
}

- (BOOL)showsCallsFromService:(int)a3
{
  if (a3 == 2)
    return objc_msgSend(UIApp, "showsFaceTimeAudio");
  if (a3 == 1)
    return objc_msgSend(UIApp, "showsTelephonyCalls");
  return 0;
}

- (BOOL)usesUnifiedInterface
{
  return 0;
}

- (unsigned)contentViewOffscreenEdge
{
  return 0;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return 0;
}

- (BOOL)usesBlendModes
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("usesBlendModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 530, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)alwaysShowLocalVideo
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("alwaysShowLocalVideo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 531, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)contentViewCanRotate
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("contentViewCanRotate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 532, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)tabBarFillsScreen
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("tabBarFillsScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 533, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)tabBarCanSlide
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("tabBarCanSlide");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 534, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showSplashScreenOnSignin
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showSplashScreenOnSignin");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 535, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsTelephonyCalls
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsTelephonyCalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 536, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeAudio");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 537, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeVideo
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeVideo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 538, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsTelephonyFavorites
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsTelephonyFavorites");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 539, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeAudioFavorites");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 540, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeVideoFavorites
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeVideoFavorites");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 541, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsTelephonyRecents
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsTelephonyRecents");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 542, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsThirdPartyRecents
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsThirdPartyRecents");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 543, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeAudioRecents
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeAudioRecents");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 544, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsFaceTimeVideoRecents
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsFaceTimeVideoRecents");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 545, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)badgesMissedTelephonyCalls
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("badgesMissedTelephonyCalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 546, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)badgesMissedFaceTimeAudio
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("badgesMissedFaceTimeAudio");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 547, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)badgesMissedFaceTimeVideo
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("badgesMissedFaceTimeVideo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 548, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsPhoneDialer
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsPhoneDialer");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 549, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)showsPhoneVoicemail
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("showsPhoneVoicemail");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 550, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

- (BOOL)hasEnhancedVoicemail
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("hasEnhancedVoicemail");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneApplication.m"), 551, CFSTR("Subclass of PhoneApplication should implement %@"), v6);

  return 0;
}

+ (id)sharedNumberFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A3670;
  if (!qword_1000A3670)
  {
    v3 = objc_alloc_init((Class)NSNumberFormatter);
    v4 = (void *)qword_1000A3670;
    qword_1000A3670 = (uint64_t)v3;

    v2 = (void *)qword_1000A3670;
  }
  return v2;
}

- (id)callHistoryController
{
  return -[PhoneApplication callHistoryControllerWithCoalescingStrategy:](self, "callHistoryControllerWithCoalescingStrategy:", 1);
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;

  v4 = a4;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activity continuity - Will continue with type = %@", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return self->_headerViewShowsAllRecentCalls;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return self->_headerViewNumberOfCallsToShow;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return self->_audioButtonAllowsPhoneCallsAndFaceTimeAudio;
}

- (BOOL)suspendingApplication
{
  return self->_suspendingApplication;
}

- (BOOL)resumingApplication
{
  return self->_resumingApplication;
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_cachedApplicationBadgeString, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
}

- (BOOL)_faceTimeInvitationExists
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingVideoCall"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_activeFaceTimeCallExists
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeVideoCall"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)inFaceTime
{
  unsigned int v2;

  v2 = objc_msgSend(UIApp, "showsFaceTimeVideo");
  if (v2)
  {
    if ((objc_msgSend(UIApp, "_faceTimeInvitationExists") & 1) != 0)
      LOBYTE(v2) = 1;
    else
      LOBYTE(v2) = _objc_msgSend(UIApp, "_activeFaceTimeCallExists");
  }
  return v2;
}

- (BOOL)faceTimeInvitationExists
{
  unsigned int v2;

  v2 = objc_msgSend(UIApp, "showsFaceTimeVideo");
  if (v2)
    LOBYTE(v2) = objc_msgSend(UIApp, "_faceTimeInvitationExists");
  return v2;
}

- (BOOL)activeFaceTimeCallExists
{
  unsigned int v2;

  v2 = objc_msgSend(UIApp, "showsFaceTimeVideo");
  if (v2)
    LOBYTE(v2) = _objc_msgSend(UIApp, "_activeFaceTimeCallExists");
  return v2;
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(self, &_s8ProviderVN);
}

@end
