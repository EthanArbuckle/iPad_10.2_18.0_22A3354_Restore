@implementation GKAccountService

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKAccountServiceInterface, a2);
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "replyQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017C98;
  v8[3] = &unk_1002BB758;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)notifyWidgetPlayerAuthenticationUpdated
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(self);
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG))
    sub_100027B88();
  v3 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("FriendsArePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"));
  v4 = objc_msgSend(v3, "reloadTimelineWithReason:", CFSTR("GC player authentication updated"));
  v5 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("ContinuePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"));
  v6 = objc_msgSend(v5, "reloadTimelineWithReason:", CFSTR("GC player authentication updated"));
  v7 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("ActivityFeedWidget"), CFSTR("com.apple.gamecenter.widgets.extension"));
  v8 = objc_msgSend(v7, "reloadTimelineWithReason:", CFSTR("GC player authentication updated"));

}

- (id)ampController
{
  return +[GKAMPController controller](GKAMPController, "controller");
}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v5, "authenticatePlayerWithUsername:password:handler:", 0, 0, v4);

}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017FB8;
  v8[3] = &unk_1002BBA68;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "issueRequest:bagKey:clientProxy:handler:", &off_1002DC310, CFSTR("gk-get-auth-token-for-third-party"), v6, v8);

}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018090;
  v8[3] = &unk_1002BBA68;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "issueRequest:bagKey:clientProxy:handler:", &off_1002DC338, CFSTR("gk-get-auth-token-for-third-party"), v6, v8);

}

- (void)didShowSignInBanner
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signInVisibilityManager"));
  objc_msgSend(v2, "didShowBanner");

}

- (void)didShowFullscreenSignIn
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signInVisibilityManager"));
  objc_msgSend(v2, "didShowFullscreen");

}

- (void)resetCredentialsWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v5, "signOutPlayerWithOptOut:handler:", 0, v4);

}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  GKAccountService *v31;
  id v32;
  BOOL v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  unint64_t v37;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = (void *)os_log_GKDaemon;
  v10 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v10)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alias"));
    *(_DWORD *)buf = 138412290;
    v37 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "signOutPlayerWithOptOut:%@", buf, 0xCu);

  }
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v10);
  v15 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKAccountService signOutPlayerWithOptOut:%lu", buf, 0xCu);
  }
  v34 = CFSTR("timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](NSDate, "_gkServerTimestamp"));
  v35 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 257, "-[GKAccountService signOutPlayerWithOptOut:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v18));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000184B0;
  v29[3] = &unk_1002BBAD8;
  v30 = v17;
  v31 = self;
  v20 = v19;
  v32 = v20;
  v33 = v4;
  v21 = v17;
  objc_msgSend(v20, "perform:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100018CF8;
  v26[3] = &unk_1002BB450;
  v27 = v20;
  v28 = v7;
  v24 = v20;
  v25 = v7;
  objc_msgSend(v24, "notifyOnQueue:block:", v23, v26);

}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerInternal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (a3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v20, "setObject:forKey:", v21, v16);

  }
  else
  {
    objc_msgSend(v19, "removeObjectForKey:", v16);
  }
  objc_msgSend(v20, "synchronize");

}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 367, "-[GKAccountService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001910C;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001929C;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;

  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(self);
  v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerInternal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v16));
  v21 = objc_msgSend(v20, "integerValue");

  if (v21 != (id)a3)
  {
    if (a3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      objc_msgSend(v19, "setObject:forKey:", v22, v16);

      -[GKAccountService didAcceptPrivacyNotice](self, "didAcceptPrivacyNotice");
    }
    else
    {
      objc_msgSend(v19, "removeObjectForKey:", v16);
    }
    -[GKAccountService notifyWidgetPlayerAuthenticationUpdated](self, "notifyWidgetPlayerAuthenticationUpdated");
  }

}

- (void)didAcceptPrivacyNotice
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
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  objc_msgSend(v3, "setForcePrivacyNotice:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAccountService ampController](self, "ampController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeBag"));
  objc_msgSend(v4, "setupAsyncWithStoreBag:withCompletion:", v6, &stru_1002BBAF8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKProfileServicePrivate, "serviceFromService:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerInternal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerID"));

  if (v10)
  {
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v7, "preloadInstalledGamesScopedPlayerIDs:completion:", v11, 0);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKUtilityServicePrivate, "serviceFromService:", self));
  objc_msgSend(v12, "updateNotificationTopicsForcefully:", 1);

}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 427, "-[GKAccountService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001987C;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019A0C;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerID"));
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setLastPersonalizationVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v19, "setObject:forKey:", v5, v16);
  else
    objc_msgSend(v19, "removeObjectForKey:", v16);
  objc_msgSend(v19, "synchronize");

}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 458, "-[GKAccountService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019DC4;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019F18;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 475, "-[GKAccountService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A0DC;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A230;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerID"));
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setLastProfilePrivacyVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v19, "setObject:forKey:", v5, v16);
  else
    objc_msgSend(v19, "removeObjectForKey:", v16);
  objc_msgSend(v19, "synchronize");

}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 506, "-[GKAccountService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A5D8;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A72C;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerID"));
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setLastFriendSuggestionsVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v19, "setObject:forKey:", v5, v16);
  else
    objc_msgSend(v19, "removeObjectForKey:", v16);
  objc_msgSend(v19, "synchronize");

}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 537, "-[GKAccountService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001AAD4;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AC28;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerID"));
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerInternal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_gkSHA256Hash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@"), v15));

  v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v19, "setObject:forKey:", v5, v16);
  else
    objc_msgSend(v19, "removeObjectForKey:", v16);
  objc_msgSend(v19, "synchronize");

}

@end
