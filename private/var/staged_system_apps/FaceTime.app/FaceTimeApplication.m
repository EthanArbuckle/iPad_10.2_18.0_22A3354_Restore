@implementation FaceTimeApplication

- (void)applicationDidFinishLaunching:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FaceTimeApplication;
  -[PhoneApplication applicationDidFinishLaunching:](&v7, "applicationDidFinishLaunching:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
  objc_msgSend(v4, "createFaceTimeFirstRunViewIfNeeded");

  +[PHThumperSetupController showThumperAvailableDialogIfNecessary](PHThumperSetupController, "showThumperAvailableDialogIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  -[FaceTimeApplication setNotificationCenter:](self, "setNotificationCenter:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceTimeApplication notificationCenter](self, "notificationCenter"));
  objc_msgSend(v6, "setDelegate:", self);

  +[CNKNameAndPhotoUtilities prewarm](CNKNameAndPhotoUtilities, "prewarm");
}

- (BOOL)_styleIsActuallyGoingToBlur
{
  if (qword_1000A3980 != -1)
    dispatch_once(&qword_1000A3980, &stru_10008A2C0);
  return byte_1000A3978 && !UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityIsReduceTransparencyEnabled();
}

- (id)recentsController
{
  PHRecentsController *recentsController;
  void *v4;
  PHRecentsController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PHRecentsController *v11;
  PHRecentsController *v12;

  recentsController = self->_recentsController;
  if (!recentsController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTApplicationServices sharedInstance](FTApplicationServices, "sharedInstance"));
    v5 = [PHRecentsController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FaceTimeApplication callHistoryController](self, "callHistoryController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callProviderManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedContactStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataCache"));
    v11 = -[PHRecentsController initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:](v5, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:", v6, v7, v8, v9, v10);
    v12 = self->_recentsController;
    self->_recentsController = v11;

    recentsController = self->_recentsController;
  }
  return recentsController;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (BOOL)alwaysShowLocalVideo
{
  _BOOL4 v3;

  if (-[FaceTimeApplication tabBarFillsScreen](self, "tabBarFillsScreen"))
  {
    v3 = -[FaceTimeApplication _isBlurUI](self, "_isBlurUI");
    if (v3)
      LOBYTE(v3) = -[FaceTimeApplication _styleIsActuallyGoingToBlur](self, "_styleIsActuallyGoingToBlur");
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)tabBarFillsScreen
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));

  LOBYTE(v2) = objc_msgSend(v3, "horizontalSizeClass") == (id)1;
  return (char)v2;
}

- (BOOL)_isBlurUI
{
  return objc_msgSend(UIApp, "userInterfaceStyle") == 1;
}

- (unsigned)userInterfaceStyle
{
  return 1;
}

- (BOOL)usesUnifiedInterface
{
  return 1;
}

- (BOOL)tabBarCanSlide
{
  return 1;
}

- (BOOL)showsThirdPartyRecents
{
  return 0;
}

- (BOOL)showsTelephonyRecents
{
  if ((objc_msgSend(UIApp, "isDeviceCapableOfTelephonyCalls") & 1) != 0)
    return 0;
  else
    return +[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls");
}

- (BOOL)showsFaceTimeVideoRecents
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeVideo");
}

- (BOOL)showsFaceTimeAudioRecents
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeAudio");
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return !-[FaceTimeApplication tabBarFillsScreen](self, "tabBarFillsScreen")
      && (id)+[PHUIConfiguration contentViewSizeForFaceTime](PHUIConfiguration, "contentViewSizeForFaceTime") != (id)2;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)contentViewCanRotate
{
  return +[PHUIConfiguration canAutoRotateInCallUIForFaceTime](PHUIConfiguration, "canAutoRotateInCallUIForFaceTime");
}

- (id)callHistoryController
{
  return -[PhoneApplication callHistoryControllerWithCoalescingStrategy:](self, "callHistoryControllerWithCoalescingStrategy:", 2);
}

- (int64_t)backdropStyle
{
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    return 2030;
  else
    return -2;
}

- (id)applicationTintColor
{
  return +[UIColor systemGreenColor](UIColor, "systemGreenColor");
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;

  v6 = a4;
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FaceTime was launched via URL", (uint8_t *)&v15, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pseudonymForLinkDetailsView"));
  if (v9)
  {
    v10 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Showing link detail view for pseudonym %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "faceTimeContainerViewController"));
    objc_msgSend(v13, "showLinkDetailViewControllerForPseudonym:", v9);

  }
  return 1;
}

- (void)handleVideoMessagePlaybackURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoMessageUUID"));
  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing video message player for message UUID %@", (uint8_t *)&v16, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject faceTimeContainerViewController](v8, "faceTimeContainerViewController"));
    objc_msgSend(v9, "showVideoPlayerForMessageWithUUID:", v5);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10005589C((uint64_t)v4, v8, v10, v11, v12, v13, v14, v15);
  }

}

- (void)handleRecentsDetailsViewURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recentsUniqueID"));
  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing recents details view for call with uniqueID: %@", (uint8_t *)&v16, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject faceTimeContainerViewController](v8, "faceTimeContainerViewController"));
    objc_msgSend(v9, "presentRecentsDetailsViewFor:", v5);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100055904((uint64_t)v4, v8, v10, v11, v12, v13, v14, v15);
  }

}

- (void)applicationOpenURL:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isFaceTimeAppVideoMessagePlaybackURL"))
  {
    -[FaceTimeApplication handleVideoMessagePlaybackURL:](self, "handleVideoMessagePlaybackURL:", v4);
  }
  else if (objc_msgSend(v4, "isFaceTimeRecentsDetailsViewURL"))
  {
    -[FaceTimeApplication handleRecentsDetailsViewURL:](self, "handleRecentsDetailsViewURL:", v4);
  }

}

- (BOOL)_isIPad
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

- (BOOL)usesBlendModes
{
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    return -[FaceTimeApplication _styleIsActuallyGoingToBlur](self, "_styleIsActuallyGoingToBlur");
  else
    return 0;
}

- (unsigned)contentViewOffscreenEdge
{
  return 2 * (objc_msgSend(UIApp, "userInterfaceLayoutDirection") != 0);
}

- (BOOL)showSplashScreenOnSignin
{
  return 1;
}

- (int)defaultAction
{
  return 1;
}

- (BOOL)showsTelephonyCalls
{
  return 0;
}

- (BOOL)showsFaceTimeAudio
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeAudio");
}

- (BOOL)showsFaceTimeVideo
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeVideo");
}

- (BOOL)showsTelephonyFavorites
{
  return 0;
}

- (BOOL)showsFaceTimeAudioFavorites
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeAudio");
}

- (BOOL)showsFaceTimeVideoFavorites
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeVideo");
}

- (BOOL)badgesMissedTelephonyCalls
{
  return 0;
}

- (BOOL)badgesMissedFaceTimeAudio
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeAudio");
}

- (BOOL)badgesMissedFaceTimeVideo
{
  return objc_msgSend(UIApp, "isDeviceCapableOfFaceTimeVideo");
}

- (BOOL)showsPhoneDialer
{
  return 0;
}

- (BOOL)showsPhoneVoicemail
{
  return 0;
}

- (BOOL)audioButtonAllowsPhoneCallsAndFaceTimeAudio
{
  return +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling") ^ 1;
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return 0;
}

- (BOOL)hasEnhancedVoicemail
{
  return 0;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return 1;
}

+ (id)allowedNotificationCategories
{
  if (qword_1000A3990 != -1)
    dispatch_once(&qword_1000A3990, &stru_10008A2E0);
  return (id)qword_1000A3988;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);

  v13 = (void (**)(id, uint64_t))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "categoryIdentifier"));

  if (!objc_msgSend(v9, "length"))
    goto LABEL_8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FaceTimeApplication allowedNotificationCategories](FaceTimeApplication, "allowedNotificationCategories"));
  if (!objc_msgSend(v10, "containsObject:", v9))
  {
    if (-[FaceTimeApplication applicationState](self, "applicationState"))
    {
      v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("group-facetime-invite"));

      if ((v11 & 1) != 0)
        goto LABEL_6;
    }
    else
    {

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }

LABEL_6:
  v12 = 24;
LABEL_9:
  v13[2](v13, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  -[FaceTimeApplication performTestWithName:options:](self, "performTestWithName:options:", a4, a5);
  return 1;
}

- (void)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("Scroll"))
    && ((objc_msgSend(v7, "hasSuffix:", CFSTR("Recents")) & 1) != 0
     || (objc_msgSend(v7, "hasSuffix:", CFSTR("RecentsGlitch")) & 1) != 0
     || objc_msgSend(v7, "hasSuffix:", CFSTR("RecentsGlitchExtended"))))
  {
    -[FaceTimeApplication performScrollTestWithName:options:](self, "performScrollTestWithName:options:", v7, v6);
  }

}

- (void)performScrollTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  int v51;
  id v52;
  __int16 v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("offset")));
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0
    && (v10 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v8, v10) & 1) == 0)
    || (v11 = (uint64_t)objc_msgSend(v8, "intValue"), (v11 - 0x7FFFFFFF) <= 1))
  {
    -[FaceTimeApplication _ftFailedTest:](self, "_ftFailedTest:", v6);
    v12 = sub_10000E6C4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100055A34((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0x7FFFFFFFLL;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterations")));

  v21 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0
    || (v22 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v20, v22) & 1) != 0))
  {
    v23 = objc_msgSend(v20, "intValue");
    if (((_DWORD)v23 - 0x7FFFFFFF) > 1)
    {
      if ((_DWORD)v11 == 0x7FFFFFFF)
        goto LABEL_13;
      v32 = v23;
      if ((objc_msgSend(v6, "hasSuffix:", CFSTR("Recents")) & 1) == 0
        && (objc_msgSend(v6, "hasSuffix:", CFSTR("RecentsGlitch")) & 1) == 0
        && !objc_msgSend(v6, "hasSuffix:", CFSTR("RecentsGlitchExtended"))
        || (v33 = objc_claimAutoreleasedReturnValue(-[FaceTimeApplication _fetchScrollView](self, "_fetchScrollView"))) == 0)
      {
        -[FaceTimeApplication _ftFailedTest:](self, "_ftFailedTest:", v6);
        v42 = sub_10000E6C4();
        v25 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000559D0((uint64_t)v6, v25, v43, v44, v45, v46, v47, v48);
        goto LABEL_12;
      }
      v25 = v33;
      v34 = sub_10000E6C4();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v51 = 138412546;
        v52 = v6;
        v53 = 2112;
        v54 = v7;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Performing scroll test %@ with the following options: %@", (uint8_t *)&v51, 0x16u);
      }

      -[FaceTimeApplication _ftStartedTest:](self, "_ftStartedTest:", v6);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("recapBased")));
      if (objc_msgSend(v36, "BOOLValue"))
      {
        v37 = +[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable");

        if (v37)
        {
          v38 = sub_10000E6C4();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v51) = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Running recap based scroll view test", (uint8_t *)&v51, 2u);
          }

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[FaceTimeApplication scrollTestsWithCount:forScrollView:name:](self, "scrollTestsWithCount:forScrollView:name:", (int)v32, v25, v6));
          v41 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v6, v40, &stru_10008A408);

          +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v41);
          goto LABEL_12;
        }
      }
      else
      {

      }
      -[NSObject _performScrollTest:iterations:delta:](v25, "_performScrollTest:iterations:delta:", v6, v32, v11);
      v49 = sub_10000E6C4();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = 138412290;
        v52 = v6;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Finished test %@", (uint8_t *)&v51, 0xCu);
      }

      goto LABEL_12;
    }
  }
  -[FaceTimeApplication _ftFailedTest:](self, "_ftFailedTest:", v6);
  v24 = sub_10000E6C4();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_10005596C((uint64_t)v20, v25, v26, v27, v28, v29, v30, v31);
LABEL_12:

LABEL_13:
}

- (id)scrollTestsWithCount:(int64_t)a3 forScrollView:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init((Class)NSMutableArray);
  if (a3 >= 2)
  {
    v10 = 0;
    do
    {
      v11 = objc_alloc((Class)RPTScrollViewTestParameters);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003F618;
      v16[3] = &unk_100089B18;
      v16[4] = v10;
      v12 = objc_msgSend(v11, "initWithTestName:scrollView:completionHandler:", v8, v7, v16);
      objc_msgSend(v12, "setShouldFlick:", 0);
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (a3 - 1 != v10);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F6C0;
  v15[3] = &unk_100089B18;
  v15[4] = a3;
  v13 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollView:completionHandler:", v8, v7, v15);
  objc_msgSend(v9, "addObject:", v13);

  return v9;
}

- (id)_fetchScrollView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneApplication rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "faceTimeContainerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

  return v4;
}

- (void)_ftFailedTest:(id)a3
{
  -[FaceTimeApplication failedTest:](self, "failedTest:", a3);
}

- (void)_ftStartedTest:(id)a3
{
  -[FaceTimeApplication startedTest:](self, "startedTest:", a3);
}

@end
