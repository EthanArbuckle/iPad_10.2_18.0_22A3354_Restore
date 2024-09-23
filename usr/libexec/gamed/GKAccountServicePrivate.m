@implementation GKAccountServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKAccountServicePrivateInterface, a2);
}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialForPlayerID:environment:", v7, objc_msgSend(v9, "environment")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_appleAccountWithUsername:", v12));

  if (v13)
  {
    v15 = -[GKAccountServicePrivate playerAgeCategoryForAccount:](self, "playerAgeCategoryForAccount:", v13);
    v16 = v15;
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v15);
    v18 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "aa_ageCategory")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
      v24 = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID - Found a matching Apple Account for the player ID with aa_ageCategory:%@, returning GKPlayerAgeCategory:%@", (uint8_t *)&v24, 0x16u);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(v14);
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      v16 = 2;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID - No matching Apple Account found for the player ID. Returning the most restrictive age category.", (uint8_t *)&v24, 2u);
    }
    else
    {
      v16 = 2;
    }
  }
  v6[2](v6, v16, 0);

}

- (int)playerAgeCategoryForAccount:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "aa_ageCategory");
  if ((unint64_t)(v3 - 1) > 8)
    return 2;
  else
    return dword_100232860[(_QWORD)(v3 - 1)];
}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)GKPlayerInternalOnboarding), "initWithPlayerID:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B20C;
  v13[3] = &unk_1002BB450;
  v14 = v8;
  v15 = v6;
  v11 = v8;
  v12 = v6;
  dispatch_async(v10, v13);

}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
}

+ (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "integerForKey:", v6);

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "lastWelcomeWhatsNewCopyVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);

  }
  return (unint64_t)v10;
}

+ (unint64_t)lastPrivacyNoticeVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "integerForKey:", v6);

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "lastPrivacyNoticeVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);

  }
  return (unint64_t)v10;
}

+ (id)lastPersonalizationVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", v6));

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "lastPersonalizationVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v10;
}

+ (id)lastProfilePrivacyVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", v6));

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "lastProfilePrivacyVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v10;
}

+ (id)lastFriendSuggestionsVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", v6));

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "lastFriendSuggestionsVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v10;
}

+ (id)lastContactsIntegrationConsentVersionDisplayedForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkSHA256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@"), v5));

  v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", v6));

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "lastContactsIntegrationConsentVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v10;
}

- (void)isICloudAvailableWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKAccountServicePrivate *v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAccountService isICloudAvailableWithHandler", buf, 2u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001BB8C;
  v16[3] = &unk_1002BB590;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("isICloudAvailable")));
  v17 = v8;
  v18 = self;
  objc_msgSend(v8, "perform:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001BD50;
  v13[3] = &unk_1002BB450;
  v14 = v8;
  v15 = v5;
  v11 = v8;
  v12 = v5;
  objc_msgSend(v11, "notifyOnQueue:block:", v10, v13);

}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  objc_super v6;

  if (sel_isEqual("getAccountNameWithHandler:", a3)
    || sel_isEqual("getAuthenticatedPlayerIDWithHandler:", a3)
    || sel_isEqual("getAuthenticatedLocalPlayersWithStatus:handler:", a3))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)GKAccountServicePrivate;
  return -[GKService requiresAuthenticationForSelector:](&v6, "requiresAuthenticationForSelector:", a3);
}

- (void)updateBadgeCounts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 724, "-[GKAccountServicePrivate updateBadgeCounts]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v4));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001BFB4;
  v13[3] = &unk_1002BBB70;
  v13[4] = self;
  objc_msgSend(v5, "perform:", v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C058;
  v11[3] = &unk_1002BB850;
  v11[4] = self;
  v12 = v5;
  v6 = v5;
  objc_msgSend(v6, "performOnManagedObjectContext:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "replyQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C348;
  v9[3] = &unk_1002BBBD8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v6, "notifyOnQueue:block:", v7, v9);

}

- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  GKAccountServicePrivate *v26;
  id v27;
  BOOL v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 771, "-[GKAccountServicePrivate _authenticateUsername:password:altDSID:validateOnly:handler:]"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001C534;
  v22[3] = &unk_1002BBC78;
  v23 = v12;
  v24 = v13;
  v28 = a6;
  v25 = v14;
  v26 = self;
  v27 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v16, v22);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v21, "reportEvent:type:", GKReporterDomainLogin, GKLoginSignIn);

}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001D404;
    v6[3] = &unk_1002BB450;
    v8 = v4;
    v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushToken"));
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)_constructAuthenticationResponseWithError:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 1097, "-[GKAccountServicePrivate _constructAuthenticationResponseWithError:handler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D5B8;
  v11[3] = &unk_1002BB568;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (void)_addGameListEntryForGame:(id)a3 profile:(id)a4 moc:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  GKGameListEntryCacheObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "gameList"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001DD14;
    v14[3] = &unk_1002BBD68;
    v11 = v10;
    v15 = v11;
    v12 = (GKGameListEntryCacheObject *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "findEntry:", v14));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mutableOrderedSetValueForKeyPath:", CFSTR("entries")));
    if (!v12)
    {
      v12 = -[GKCacheObject initWithManagedObjectContext:]([GKGameListEntryCacheObject alloc], "initWithManagedObjectContext:", v7);
      -[GKGameListEntryCacheObject setBundleID:](v12, "setBundleID:", v11);
      objc_msgSend(v13, "addObject:", v12);
    }
    objc_msgSend(v13, "insertObject:atIndex:", v12, 0);

  }
}

- (void)_addAchievementPointsEntryForGame:(id)a3 record:(id)a4 profile:(id)a5 moc:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  GKAchievementPointsEntryCacheObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a4;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "achievementPointsList"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001DE9C;
    v17[3] = &unk_1002BBD90;
    v14 = v13;
    v18 = v14;
    v15 = (GKAchievementPointsEntryCacheObject *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "findEntry:", v17));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mutableOrderedSetValueForKeyPath:", CFSTR("entries")));
    if (!v15)
    {
      v15 = -[GKCacheObject initWithManagedObjectContext:]([GKAchievementPointsEntryCacheObject alloc], "initWithManagedObjectContext:", v10);
      -[GKAchievementPointsEntryCacheObject setGameRecord:](v15, "setGameRecord:", v9);
      objc_msgSend(v16, "addObject:", v15);
    }
    objc_msgSend(v16, "insertObject:atIndex:", v15, 0);

  }
}

- (void)_postLaunchEventsForGame:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  _BYTE v31[14];
  __int16 v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAccountService _postLaunchEventsForGame:", (uint8_t *)&v30, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "launchEvent"));

  if (v12)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    v15 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = objc_msgSend(v12, "eventType");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "context"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v30 = 67109634;
      *(_DWORD *)v31 = v17;
      *(_WORD *)&v31[4] = 2112;
      *(_QWORD *)&v31[6] = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Launch event(%d) context %@ for client %@", (uint8_t *)&v30, 0x1Cu);

    }
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "context"));
    v21 = objc_msgSend(v12, "eventType");
    if (v21 == (id)2)
    {
      v27 = objc_opt_class(GKFriendRequestInternal, v22);
      objc_opt_isKindOfClass(v20, v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      objc_msgSend(v24, "friendRequestSelected:", v20);
    }
    else if (v21 == (id)1)
    {
      v28 = objc_opt_class(GKChallengeInternal, v22);
      objc_opt_isKindOfClass(v20, v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      objc_msgSend(v24, "completedChallengeSelected:", v20);
    }
    else
    {
      if (v21)
      {
LABEL_21:

        goto LABEL_22;
      }
      v23 = objc_opt_class(GKChallengeInternal, v22);
      objc_opt_isKindOfClass(v20, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      objc_msgSend(v24, "receivedChallengeSelected:", v20);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!os_log_GKGeneral)
    v25 = (id)GKOSLoggers(v13);
  v26 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v20 = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v30 = 138412290;
    *(_QWORD *)v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "No launch event for client %@", (uint8_t *)&v30, 0xCu);
    goto LABEL_20;
  }
LABEL_22:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v29, "setLaunchEvent:", 0);

}

- (void)renewAuthToken
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKAccountService renewAuthToken", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E334;
  v7[3] = &unk_1002BBDD8;
  v7[4] = self;
  objc_msgSend(v5, "issueRequest:bagKey:clientProxy:handler:", 0, CFSTR("gk-renew-auth-token"), v6, v7);

}

- (void)_initGameForLaunchedApp:(BOOL)a3 withHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t *v20;
  _QWORD v21[4];
  id v22;
  GKAccountServicePrivate *v23;
  id v24;
  id v25;
  uint8_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a4;
  v6 = v5;
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v5);
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _initGame", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x2020000000;
  v30 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 1276, "-[GKAccountServicePrivate _initGameForLaunchedApp:withHandler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001E770;
  v21[3] = &unk_1002BBE70;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = v12;
  v23 = self;
  v13 = v11;
  v24 = v13;
  v26 = buf;
  v14 = v9;
  v25 = v14;
  objc_msgSend(v13, "perform:", v21);
  if (v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001EF24;
    v17[3] = &unk_1002BBE98;
    v19 = v6;
    v18 = v13;
    v20 = buf;
    objc_msgSend(v18, "notifyOnQueue:block:", v15, v17);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v16, "reportEvent:type:", GKReporterDomainLogin, GKLoginAppInit);

  _Block_object_dispose(buf, 8);
}

- (void)_syncPlayerOnboardingParametersInManagedObjectContext:(id)a3 withServerResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  void *v44;
  NSObject *log;
  void *v46;
  void *v47;
  _QWORD v49[5];
  uint8_t buf[4];
  unsigned int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  unsigned int v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:](GKPlayerProfileCacheObject, "localPlayerInManagedObjectContext:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedItem"));

  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    log = v10;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v42 = objc_msgSend(v46, "forcePrivacyNotice");
    v11 = GKAccountPrivacyNoticeVersionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountPrivacyNoticeVersionKey));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v41 = objc_msgSend(v44, "forceDefaultNickname");
    v13 = GKAccountIsDefaultNicknameKey;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountIsDefaultNicknameKey));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v39 = objc_msgSend(v43, "forceDefaultPrivacy");
    v14 = GKAccountHasPrivacySettingsKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountHasPrivacySettingsKey));
    v47 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v17 = objc_msgSend(v16, "forceDefaultContactsIntegrationConsent");
    v18 = GKContactsIntegrationConsentKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKContactsIntegrationConsentKey));
    *(_DWORD *)buf = 67111938;
    v51 = v42;
    v52 = 2112;
    v53 = v11;
    v54 = 2112;
    v55 = v12;
    v56 = 1024;
    v57 = v41;
    v58 = 2112;
    v59 = v13;
    v60 = 2112;
    v61 = v40;
    v62 = 1024;
    v63 = v39;
    v64 = 2112;
    v65 = v14;
    v66 = 2112;
    v67 = v15;
    v68 = 1024;
    v69 = v17;
    v70 = 2112;
    v71 = v18;
    v72 = 2112;
    v73 = v19;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Updating onboarding parameters for the player:\n GKPreferences.shared.forcePrivacyNotice=%d, server has %@=%@\n GKPreferences.shared.forceDefaultNickname=%d, server has %@=%@\n GKPreferences.shared.forceDefaultPrivacy=%d, server has %@=%@\n GKPreferences.shared.forceDefaultContactsIntegrationConsent=%d, server has %@=%@", buf, 0x6Au);

    v6 = v47;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v21 = objc_msgSend(v20, "forcePrivacyNotice");

  if (v21)
  {
    if (!os_log_GKGeneral)
      v23 = (id)GKOSLoggers(v22);
    v24 = os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Going to skip syncing the privacy notice version from the server because the test flag is set.", buf, 2u);
    }
  }
  else
  {
    v25 = GKAccountPrivacyNoticeVersionKey;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountPrivacyNoticeVersionKey));

    if (v26)
    {
      if (!os_log_GKGeneral)
        v28 = (id)GKOSLoggers(v27);
      v29 = os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "The server has a valid privacy notice version.", buf, 2u);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v25));
      -[GKAccountService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:](self, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:", objc_msgSend(v30, "unsignedIntegerValue"));

    }
    else
    {
      if (!os_log_GKGeneral)
        v31 = (id)GKOSLoggers(v27);
      v32 = os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "The server doesn't have this player's privacy notice version.", buf, 2u);
      }
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10001F534;
      v49[3] = &unk_1002BBEE0;
      v49[4] = self;
      -[GKAccountService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:](self, "getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:", v49);
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountIsDefaultNicknameKey));
  if (objc_msgSend(v33, "BOOLValue"))
  {
    objc_msgSend(v6, "setDefaultNickname:", 1);
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    objc_msgSend(v6, "setDefaultNickname:", objc_msgSend(v34, "forceDefaultNickname"));

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAccountHasPrivacySettingsKey));
  if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    objc_msgSend(v6, "setDefaultPrivacyVisibility:", objc_msgSend(v36, "forceDefaultPrivacy"));

  }
  else
  {
    objc_msgSend(v6, "setDefaultPrivacyVisibility:", 1);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKContactsIntegrationConsentKey));
  if (objc_msgSend(v37, "isEqualToString:", GKContactsIntegrationConsentUndetermined))
  {
    objc_msgSend(v6, "setDefaultContactsIntegrationConsent:", 1);
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    objc_msgSend(v6, "setDefaultContactsIntegrationConsent:", objc_msgSend(v38, "forceDefaultContactsIntegrationConsent"));

  }
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  -[GKAccountServicePrivate authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:](self, "authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:", a3, a4, 0, 0, a5);
}

- (id)_authenticatedLocalPlayerWithUsername:(id)a3 inContext:(id)a4 isValid:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  GKAccountServicePrivate *v24;
  uint8_t *v25;
  BOOL *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (username != ((void *)0))\n[%s (%s:%d)]"), v11, "-[GKAccountServicePrivate _authenticatedLocalPlayerWithUsername:inContext:isValid:]", objc_msgSend(v13, "UTF8String"), 1435));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  if (!os_log_GKGeneral)
    v15 = (id)GKOSLoggers(v9);
  v16 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKAccountService _authenticatedLocalPlayerWithUsername:", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x3032000000;
  v30 = sub_10001D904;
  v31 = sub_10001D914;
  v32 = 0;
  *a5 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001F7DC;
  v21[3] = &unk_1002BBF08;
  v17 = v8;
  v22 = v17;
  v18 = v10;
  v25 = buf;
  v26 = a5;
  v23 = v18;
  v24 = self;
  objc_msgSend(v18, "performBlockAndWait:", v21);
  v19 = *((id *)v28 + 5);

  _Block_object_dispose(buf, 8);
  return v19;
}

- (void)_primeCacheWithGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CFAbsoluteTime Current;
  id v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  CFAbsoluteTime v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKFriendServicePrivate, "serviceFromService:", self));
  Current = CFAbsoluteTimeGetCurrent();
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10001FB58;
  v14 = &unk_1002BBF58;
  v8 = v6;
  v15 = v8;
  v16 = Current;
  objc_msgSend(v4, "perform:", &v11);

  if ((objc_msgSend(v5, "isUIService", v11, v12, v13, v14) & 1) == 0
    && (objc_msgSend(v5, "isExtension") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKMultiplayerMatchService, "serviceFromService:", self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameDescriptor"));
    objc_msgSend(v9, "getCompatibilityMatrix:handler:", v10, 0);

  }
}

- (void)_fetchCredentialsForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKAccountServicePrivate *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 1498, "-[GKAccountServicePrivate _fetchCredentialsForUsername:password:altDSID:handler:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001FDBC;
  v19[3] = &unk_1002BB4C8;
  v20 = v10;
  v21 = v11;
  v22 = self;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v14, v19);

}

- (void)_preloadDataForGameCenterTabs
{
  dispatch_time_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000202B4;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_after(v3, v5, block);

}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
  -[GKAccountServicePrivate authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:](self, "authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:", a3, a4, a5, 1, a6, a7);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  uint8_t buf[4];
  id v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = v16;
  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v16);
  v19 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "GKAccountService auth username:%@", buf, 0xCu);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 1626, "-[GKAccountServicePrivate authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100020684;
  v25[3] = &unk_1002BBC78;
  v30 = a6;
  v25[4] = self;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v17;
  v21 = v17;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v20, v25);

}

- (void)notifyClient:(id)a3 authenticationDidChangeWithError:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100020F4C;
  v9[3] = &unk_1002BB568;
  v9[4] = self;
  v10 = a4;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  objc_msgSend(a3, "sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:completionHandler:", 0, v9);

}

- (void)_loadProfileWithGroup:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v5);
  v8 = os_log_GKTrace;
  v9 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _loadProfile", buf, 2u);
  }
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = (id)GKOSLoggers(v9);
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100028340(v10, (void *)a2);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002118C;
  v13[3] = &unk_1002BB590;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v12, "perform:", v13);

}

- (void)_appInitWithGroup:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  CFAbsoluteTime Current;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v5);
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _appInit", buf, 2u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002149C;
  v10[3] = &unk_1002BC148;
  v11 = v6;
  v12 = a2;
  v10[4] = self;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = v6;
  objc_msgSend(v9, "perform:", v10);

}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  GKAccountServicePrivate *v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "notifyClient:playerAuthenticatedFromClient:", buf, 2u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021C98;
  v14[3] = &unk_1002BC170;
  v15 = v6;
  v16 = self;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v18 = v8;
  v11 = v8;
  v12 = v17;
  v13 = v6;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v14);

}

- (void)notifyClient:(id)a3 playerAuthenticatedWithCredential:(id)a4 authenticatingBundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v11 = GKGetApplicationStateForBundleID(v10);

  if (v11 == 8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transportWithCredential:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:credential:](GKAccountServicePrivate, "serviceWithTransport:forClient:credential:", v12, v7, v8));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021E3C;
    v14[3] = &unk_1002BC1F8;
    v15 = v7;
    v16 = v9;
    objc_msgSend(v13, "_initGameForLaunchedApp:withHandler:", 0, v14);

  }
  else
  {
    objc_msgSend(v7, "sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:completionHandler:", v9, &stru_1002BC218);
  }

}

- (void)_notifyAllClientsPlayerAuthenticatedFromClient:(id)a3 withCredential:(id)a4 replyGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  GKAccountServicePrivate *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022014;
  v13[3] = &unk_1002BC170;
  v14 = v8;
  v15 = a5;
  v16 = self;
  v17 = v9;
  v10 = v9;
  v11 = v15;
  v12 = v8;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v13);

}

- (void)_fetchLoginDisabledWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  BOOL v35;
  uint8_t buf[8];
  _QWORD v37[10];

  v4 = a3;
  v5 = objc_alloc_init((Class)GKSignInVisibilityConfig);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeBag"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeBag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", GKSignInBannerEnabled));

    v12 = objc_opt_class(NSNumber, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      LOBYTE(v7) = objc_msgSend(v10, "BOOLValue");
    else
      LOBYTE(v7) = 0;

  }
  v13 = -[GKAccountServicePrivate shouldSuppressFullscreenSignInSheet](self, "shouldSuppressFullscreenSignInSheet");
  v14 = v13;
  if (v13)
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v13);
    v16 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKAccountService _fetchLoginDisabledWithHandler: Suppressing full screen sign in sheet", buf, 2u);
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storeBag"));
  if (!v18)
    LOBYTE(v7) = 0;

  if ((v7 & 1) != 0)
  {
    v37[0] = GKFullscreenSignInSheetLimit;
    v37[1] = GKFullscreenSignInSheetInitialLimit;
    v37[2] = GKFullscreenSignInSheetCooldown;
    v37[3] = GKFullscreenSignInSheetMinTimeBetween;
    v37[4] = GKFullscreenSignInSheetEnabled;
    v37[5] = GKSignInBannerLimit;
    v37[6] = GKSignInBannerInitialLimit;
    v37[7] = GKSignInBannerCooldown;
    v37[8] = GKSignInBannerMinTimeBetween;
    v37[9] = GKSignInBannerEnabled;
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 10));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storeBag"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100022578;
    v29[3] = &unk_1002BC268;
    v30 = v5;
    v31 = v4;
    v32 = v14;
    v24 = v4;
    objc_msgSend(v21, "getValuesForKeys:queue:completion:", v19, v23, v29);

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sheetConfig"));
    objc_msgSend(v25, "setLimit:", 3);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerConfig"));
    objc_msgSend(v26, "setEnabled:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "signInVisibilityManager"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100022560;
    v33[3] = &unk_1002BC240;
    v34 = v4;
    v35 = v14;
    v19 = v4;
    objc_msgSend(v28, "promptsDisabledWithConfig:scope:handler:", v5, 1, v33);

    v24 = v34;
  }

}

- (BOOL)shouldSuppressFullscreenSignInSheet
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  if (v3)
    v4 = objc_msgSend(&off_1002DC590, "containsObject:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)_continueAuthenticationWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  GKAccountServicePrivate *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022980;
  v4[3] = &unk_1002BC290;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[GKAccountServicePrivate _fetchLoginDisabledWithHandler:](v5, "_fetchLoginDisabledWithHandler:", v4);

}

- (void)_continueAuthenticationWithLoginDisabled:(BOOL)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  CFAbsoluteTime Current;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  GKAccountServicePrivate *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  GKAccountServicePrivate *v54;
  id v55;
  id v56;
  CFAbsoluteTime v57;
  SEL v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[5];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;

  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    *(_DWORD *)buf = 138412546;
    v64 = v12;
    v65 = 2112;
    v66 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ cred:%@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountName"));

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (credential.accountName)\n[%s (%s:%d)]"), v16, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]", objc_msgSend(v18, "UTF8String"), 2176));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerInternal"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "playerID"));

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (credential.playerInternal.playerID)\n[%s (%s:%d)]"), v22, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]", objc_msgSend(v24, "UTF8String"), 2177));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v25);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2180, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v27));

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100022F4C;
  v62[3] = &unk_1002BBBD8;
  v62[4] = self;
  -[GKAccountServicePrivate updateClientSettings:](self, "updateClientSettings:", v62);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2188, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "context"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100022F84;
  v59[3] = &unk_1002BB658;
  v32 = v14;
  v60 = v32;
  v33 = v30;
  v61 = v33;
  objc_msgSend(v31, "performBlockAndWait:", v59);

  Current = CFAbsoluteTimeGetCurrent();
  if (v32 && !a3)
  {
    -[GKAccountServicePrivate _loadProfileWithGroup:](self, "_loadProfileWithGroup:", v33);
    -[GKAccountServicePrivate _appInitWithGroup:](self, "_appInitWithGroup:", v33);
    -[GKAccountServicePrivate _primeCacheWithGroup:](self, "_primeCacheWithGroup:", v33);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100023028;
  v51[3] = &unk_1002BC2E0;
  v57 = Current;
  v36 = v28;
  v52 = v36;
  v37 = v33;
  v53 = v37;
  v54 = self;
  v38 = v32;
  v55 = v38;
  v58 = a2;
  v39 = v26;
  v56 = v39;
  objc_msgSend(v36, "join:queue:block:", v37, v35, v51);

  if (v7)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000237D4;
    v49[3] = &unk_1002BB590;
    v49[4] = self;
    v40 = v36;
    v50 = v40;
    objc_msgSend(v40, "perform:", v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "replyQueue"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000238E0;
    v43[3] = &unk_1002BC330;
    v48 = v7;
    v44 = v40;
    v45 = v38;
    v46 = v39;
    v47 = self;
    objc_msgSend(v44, "notifyOnQueue:block:", v41, v43);

  }
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  GKAccountServicePrivate *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  GKAccountServicePrivate *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;

  v34 = a7;
  v13 = a4;
  v14 = a6;
  v35 = a8;
  v15 = a5;
  v16 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredential internalRepresentation](GKPlayerCredential, "internalRepresentation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal internalRepresentation](GKLocalPlayerInternal, "internalRepresentation"));
  objc_msgSend(v18, "setPlayerID:", v13);
  objc_msgSend(v18, "setAlias:", v14);
  objc_msgSend(v17, "setAccountName:", v16);

  objc_msgSend(v17, "setAuthenticationToken:", v15);
  objc_msgSend(v17, "setPlayerInternal:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v17, "setEnvironment:", objc_msgSend(v19, "environment"));

  objc_msgSend(v17, "setScope:", 14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2332, "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:finished:handler:]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v20));

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100023D74;
  v54[3] = &unk_1002BBB70;
  v22 = v17;
  v55 = v22;
  objc_msgSend(v21, "perform:", v54);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100023E9C;
  v53[3] = &unk_1002BBB70;
  v53[4] = self;
  objc_msgSend(v21, "perform:", v53);
  v23 = objc_alloc_init((Class)GKAuthenticateResponse);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "context"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100023F24;
  v46[3] = &unk_1002BC358;
  v25 = v13;
  v47 = v25;
  v26 = v21;
  v48 = v26;
  v49 = self;
  v27 = v14;
  v50 = v27;
  v28 = v23;
  v51 = v28;
  v29 = v22;
  v52 = v29;
  objc_msgSend(v24, "performBlockAndWait:", v46);

  if (v34)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100024094;
    v44[3] = &unk_1002BB590;
    v44[4] = self;
    v45 = v26;
    objc_msgSend(v45, "perform:", v44);
    v30 = v45;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "context"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100024188;
    v40[3] = &unk_1002BC380;
    v41 = v26;
    v42 = self;
    v43 = v36;
    objc_msgSend(v31, "performBlockAndWait:", v40);

    v30 = v41;
  }

  if (v35)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "replyQueue"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000243A4;
    v37[3] = &unk_1002BB450;
    v39 = v35;
    v38 = v26;
    objc_msgSend(v38, "notifyOnQueue:block:", v33, v37);

  }
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  GKAccountServicePrivate *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  GKAccountServicePrivate *v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;

  v36 = a8;
  v14 = a4;
  v15 = a6;
  v37 = a9;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredential internalRepresentation](GKPlayerCredential, "internalRepresentation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal internalRepresentation](GKLocalPlayerInternal, "internalRepresentation"));
  objc_msgSend(v20, "setPlayerID:", v14);
  objc_msgSend(v20, "setAlias:", v15);
  objc_msgSend(v19, "setAccountName:", v18);

  objc_msgSend(v19, "setAuthenticationToken:", v17);
  objc_msgSend(v19, "setPlayerInternal:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v19, "setEnvironment:", objc_msgSend(v21, "environment"));

  objc_msgSend(v19, "setScope:", 14);
  objc_msgSend(v19, "setAltDSID:", v16);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2430, "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v22));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100024800;
  v56[3] = &unk_1002BBB70;
  v24 = v19;
  v57 = v24;
  objc_msgSend(v23, "perform:", v56);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100024928;
  v55[3] = &unk_1002BBB70;
  v55[4] = self;
  objc_msgSend(v23, "perform:", v55);
  v25 = objc_alloc_init((Class)GKAuthenticateResponse);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "context"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000249B0;
  v48[3] = &unk_1002BC358;
  v27 = v14;
  v49 = v27;
  v28 = v23;
  v50 = v28;
  v51 = self;
  v29 = v15;
  v52 = v29;
  v30 = v25;
  v53 = v30;
  v31 = v24;
  v54 = v31;
  objc_msgSend(v26, "performBlockAndWait:", v48);

  if (v36)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100024B20;
    v46[3] = &unk_1002BB590;
    v46[4] = self;
    v47 = v28;
    objc_msgSend(v47, "perform:", v46);
    v32 = v47;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "context"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100024C14;
    v42[3] = &unk_1002BC380;
    v43 = v28;
    v44 = self;
    v45 = v38;
    objc_msgSend(v33, "performBlockAndWait:", v42);

    v32 = v43;
  }

  if (v37)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "replyQueue"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100024E30;
    v39[3] = &unk_1002BB450;
    v41 = v37;
    v40 = v28;
    objc_msgSend(v40, "notifyOnQueue:block:", v35, v39);

  }
}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)GKAuthenticateResponse);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2509, "-[GKAccountServicePrivate validateAccountWithUsername:password:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100025074;
  v26[3] = &unk_1002BC3A8;
  v26[4] = self;
  v27 = v8;
  v28 = v9;
  v14 = v13;
  v29 = v14;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "perform:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100025150;
  v22[3] = &unk_1002BC3D0;
  v24 = v14;
  v25 = v10;
  v23 = v11;
  v19 = v14;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v22);

}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unsigned int v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  NSObject *v65;
  int v66;
  void *v67;
  unsigned __int8 v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  NSObject *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
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
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint8_t buf[4];
  uint64_t v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", GKOptedOutOfGameCenter));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    v14 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v15 = (id)GKOSLoggers(v13);
      v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate ignoring authentication response since user has opted out of game center.", buf, 2u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", GKInternalErrorDomain, 100, 0));
    v7[2](v7, v16);
    goto LABEL_55;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  if (objc_msgSend(v17, "isAccountModificationRestricted"))
  {

LABEL_10:
    if (!os_log_GKGeneral)
      v21 = (id)GKOSLoggers(v18);
    v22 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Game Center account will not be saved as accounts are restricted", buf, 2u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:](NSError, "userErrorForServerCode:reason:", 5000, CFSTR("Game Center accounts are disabled")));
    if (v7)
      v7[2](v7, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKUtilityServicePrivate, "serviceFromService:", self));
    objc_msgSend(v23, "terminate");

    goto LABEL_55;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v20 = objc_msgSend(v19, "isGameCenterDisabled");

  if (v20)
    goto LABEL_10;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountName"));

  v95 = v24;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_gkAccountForAppleID:", v26));
  v28 = (void *)v27;
  if (v26)
    v29 = v27 == 0;
  else
    v29 = 1;
  v30 = v29;
  v91 = v30;
  v31 = objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v92 = (void *)v31;
  if (!os_log_GKGeneral)
    v32 = (id)GKOSLoggers(v31);
  v33 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v114 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Account setup parameters: %@", buf, 0xCu);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("player-id")));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alias")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("apple-id")));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auth-token")));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstName")));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastName")));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altDSID")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid")));
  v38 = objc_opt_class(NSNumber, v37);
  v93 = v36;
  if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0)
  {
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringValue"));
  }
  else
  {
    v41 = objc_opt_class(NSString, v39);
    if ((objc_opt_isKindOfClass(v36, v41) & 1) == 0)
    {
      v96 = 0;
      goto LABEL_33;
    }
    v40 = v36;
  }
  v96 = v40;
LABEL_33:
  v42 = objc_msgSend(v26, "isEqualToString:", v35);
  v43 = objc_msgSend(v34, "length");
  v94 = v28;
  if (v43 && (v43 = objc_msgSend(v101, "length")) != 0 && (v43 = objc_msgSend(v35, "length")) != 0)
  {
    v88 = v35;
    v89 = v34;
    v86 = v26;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v84 = objc_msgSend(v44, "environment");

    v90 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredential internalRepresentation](GKPlayerCredential, "internalRepresentation"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal internalRepresentation](GKLocalPlayerInternal, "internalRepresentation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "authenticationToken"));
    v48 = objc_msgSend(v47, "isEqual:", v101);

    v87 = v45;
    if (v91)
    {
      objc_msgSend(v45, "setPlayerID:", v89);
      objc_msgSend(v45, "setAlias:", v100);
      objc_msgSend(v45, "setFirstName:", v99);
      objc_msgSend(v45, "setLastName:", v98);
      v51 = objc_msgSend((id)objc_opt_class(v45, v50), "compositeNameForFirstName:lastName:", v99, v98);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      objc_msgSend(v45, "setCompositeName:", v52);

      objc_msgSend(v90, "setAccountName:", v88);
      objc_msgSend(v90, "setPlayerInternal:", v45);
      objc_msgSend(v90, "setAuthenticationToken:", v101);
      objc_msgSend(v90, "setEnvironment:", 5);
      if (v96)
        objc_msgSend(v90, "setDSID:");
      v26 = v86;
      if (v97)
        objc_msgSend(v90, "setAltDSID:");
      objc_msgSend(v90, "setScope:", 14);
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
      v53 = objc_msgSend(v85, "setPrimaryCredential:completionHandler:", v90, 0);
      if (!os_log_GKGeneral)
        v54 = (id)GKOSLoggers(v53);
      v55 = os_log_GKDaemon;
      v56 = v92;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v114 = 5;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Account setup (No existing player): Switching environment(%ld) and recording player credentials, will terminate", buf, 0xCu);
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[GKStoreBag storeBagForEnvironment:](GKStoreBag, "storeBagForEnvironment:", 5));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataTransport transportWithBag:clientProxy:credential:](GKDataTransport, "transportWithBag:clientProxy:credential:", v57, v92, v90));
      -[GKService setTransport:](self, "setTransport:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
      objc_msgSend(v59, "setEnvironment:", 5);
      +[GKClientProxy removeAllCaches](GKClientProxy, "removeAllCaches");
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2645, "-[GKAccountServicePrivate setupAccountForParameters:handler:]"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v60));

      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "context"));
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472;
      v107[2] = sub_100025E74;
      v107[3] = &unk_1002BBE20;
      v34 = v89;
      v108 = v89;
      v109 = v61;
      v110 = v100;
      v111 = v99;
      v112 = v98;
      v63 = v61;
      objc_msgSend(v62, "performBlockAndWait:", v107);

      -[GKAccountServicePrivate _loadProfileWithGroup:](self, "_loadProfileWithGroup:", v63);
      -[GKAccountServicePrivate _appInitWithGroup:](self, "_appInitWithGroup:", v63);
      -[GKAccountServicePrivate _primeCacheWithGroup:](self, "_primeCacheWithGroup:", v63);
      -[GKAccountServicePrivate updateBadgeCounts](self, "updateBadgeCounts");

      v45 = v87;
      v35 = v88;
    }
    else
    {
      if (v84 == (id)5)
        v68 = v48;
      else
        v68 = 0;
      v34 = v89;
      if ((v68 & 1) != 0 || ((v42 ^ 1) & 1) != 0)
      {
        v26 = v86;
        if (!os_log_GKGeneral)
          v82 = (id)GKOSLoggers(v49);
        v83 = os_log_GKDaemon;
        v56 = v92;
        v35 = v88;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "Account setup not new and no change:", buf, 2u);
        }
      }
      else
      {
        v26 = v86;
        if (!os_log_GKGeneral)
          v69 = (id)GKOSLoggers(v49);
        v70 = os_log_GKDaemon;
        v35 = v88;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v114 = (uint64_t)v45;
          v115 = 2112;
          v116 = v90;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Account setup (Player did not change): Recording new credentials and updating profile. Previous player:%@ credential:%@", buf, 0x16u);
        }
        objc_msgSend(v45, "setPlayerID:", v89);
        objc_msgSend(v45, "setAlias:", v100);
        objc_msgSend(v45, "setFirstName:", v99);
        objc_msgSend(v45, "setLastName:", v98);
        v72 = objc_msgSend((id)objc_opt_class(v45, v71), "compositeNameForFirstName:lastName:", v99, v98);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        objc_msgSend(v45, "setCompositeName:", v73);

        objc_msgSend(v90, "setAccountName:", v88);
        objc_msgSend(v90, "setPlayerInternal:", v45);
        objc_msgSend(v90, "setAuthenticationToken:", v101);
        objc_msgSend(v90, "setEnvironment:", 5);
        if (v96)
          objc_msgSend(v90, "setDSID:");
        if (v97)
          objc_msgSend(v90, "setAltDSID:");
        objc_msgSend(v90, "setScope:", 14);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
        v75 = objc_msgSend(v74, "setPrimaryCredential:completionHandler:", v90, 0);
        if (!os_log_GKGeneral)
          v76 = (id)GKOSLoggers(v75);
        v77 = os_log_GKDaemon;
        v56 = v92;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v114 = (uint64_t)v90;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Account setup (Player did not change): saving the received credentials:%@", buf, 0xCu);
        }
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2695, "-[GKAccountServicePrivate setupAccountForParameters:handler:]"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v78));

        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "context"));
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472;
        v102[2] = sub_100025F20;
        v102[3] = &unk_1002BC3F8;
        v103 = v79;
        v104 = v100;
        v105 = v99;
        v106 = v98;
        v81 = v79;
        objc_msgSend(v80, "performBlockAndWait:", v102);

        v34 = v89;
        v45 = v87;
      }
    }

    v16 = 0;
    v66 = v91;
    if (!v7)
      goto LABEL_52;
  }
  else
  {
    if (!os_log_GKGeneral)
      v64 = (id)GKOSLoggers(v43);
    v65 = os_log_GKError;
    v56 = v92;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v114 = (uint64_t)v34;
      v115 = 2112;
      v116 = v101;
      v117 = 2112;
      v118 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "SetupAccountForParameters: Missing expected account setup parameters playerID:%@ token:%@ accountName:%@", buf, 0x20u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:](NSError, "userErrorForServerCode:reason:", 5000, CFSTR("Missing expected account setup parameters")));
    v66 = 0;
    if (!v7)
      goto LABEL_52;
  }
  v7[2](v7, v16);
LABEL_52:
  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKUtilityServicePrivate, "serviceFromService:", self));
    objc_msgSend(v67, "terminate");

  }
LABEL_55:

}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKAccountServicePrivate *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2730, "-[GKAccountServicePrivate accountEdited:alias:firstName:lastName:handler:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "context"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100026240;
  v26[3] = &unk_1002BC420;
  v27 = v18;
  v28 = self;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v15;
  v33 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v18;
  objc_msgSend(v19, "performBlock:", v26);

}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  void ***v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  GKAccountServicePrivate *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "credential"));

  }
  v10 = objc_msgSend(v8, "scope");
  v11 = v10;
  if ((v4 & 4) != 0)
    v12 = v10 | 0xC;
  else
    v12 = v10 & 0xFFFFFFF3 | v4 & 8;
  if (!os_log_GKGeneral)
    v13 = (id)GKOSLoggers(v10);
  v14 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v24 = v8;
    v25 = 2048;
    v26 = v12;
    v27 = 2048;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "setLoginStatus cred:(%@) new:%lX old:%lX", buf, 0x20u);
  }
  objc_msgSend(v8, "setScope:", v12);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10002659C;
  v20 = &unk_1002BB6E8;
  v21 = self;
  v22 = v6;
  v15 = v6;
  v16 = objc_retainBlock(&v17);
  if ((v4 & 4) != 0)
    objc_msgSend(v7, "setPrimaryCredential:completionHandler:", v8, v16, v17, v18, v19, v20, v21, v22);
  else
    objc_msgSend(v7, "setCredential:completionHandler:", v8, v16, v17, v18, v19, v20, v21, v22);

}

- (void)updateClientSettings:(id)a3
{
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
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  GKAccountServicePrivate *v26;
  id v27;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2822, "-[GKAccountServicePrivate updateClientSettings:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeBag"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isStoreDemoModeEnabled")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("storeDemoModeEnabled"));

  objc_msgSend(v8, "debugRequestTimeout");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("GKDebugRequestTimeout"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal archivedProfile](GKLocalPlayerInternal, "archivedProfile"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GKAllowNearbyMultiplayer"), v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "shouldAllowNearbyMultiplayer")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);

  if (v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "shouldUseHTTPPipelining")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("GKHTTPPipelining"));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100026948;
    v24[3] = &unk_1002BB4A0;
    v25 = v7;
    v26 = self;
    v27 = v5;
    objc_msgSend(v27, "perform:", v24);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100026C24;
  v21[3] = &unk_1002BB568;
  v21[4] = self;
  v22 = v5;
  v23 = v20;
  v18 = v20;
  v19 = v5;
  objc_msgSend(v19, "notifyOnQueue:block:", v17, v21);

}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "checkActivitySharingRepromptWithCompletion", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m", 2860, "-[GKAccountServicePrivate checkActivitySharingRepromptWithCompletion:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100026E5C;
  v18[3] = &unk_1002BB590;
  v18[4] = self;
  v10 = v9;
  v19 = v10;
  objc_msgSend(v10, "perform:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027368;
  v15[3] = &unk_1002BB450;
  v16 = v10;
  v17 = v5;
  v13 = v10;
  v14 = v5;
  objc_msgSend(v13, "notifyOnQueue:block:", v12, v15);

}

- (BOOL)shouldCadencedActivitySharingRepromptWithLimit:(int64_t)a3 minDaysBetween:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL8 v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  int64_t v25;
  id v26;
  NSObject *v27;
  _BOOL8 v28;
  BOOL v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v43;
  uint8_t buf[4];
  int64_t v45;

  v6 = objc_msgSend((id)objc_opt_class(self, a2), "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("GKActivitySharingReprompt")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("totalTriggerCount")));
  v10 = objc_msgSend(v9, "integerValue");

  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v11);
  v13 = os_log_GKTrace;
  v14 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v14)
  {
    *(_DWORD *)buf = 134217984;
    v45 = (int64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: totalTriggerCount=%ld", buf, 0xCu);
  }
  if ((uint64_t)v10 < a3)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastTriggerDate")));
    v16 = (void *)v15;
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v15);
    v18 = os_log_GKTrace;
    v19 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v45 = (int64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: lastTriggerDate=%@", buf, 0xCu);
    }
    if (!v16)
    {
      if (!os_log_GKGeneral)
        v38 = (id)GKOSLoggers(v19);
      v39 = os_log_GKTrace;
      v30 = 1;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: Yes, the reprompt has never been triggered before.", buf, 2u);
      }
      goto LABEL_35;
    }
    v20 = a4;
    v21 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v43 = (void *)v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "components:fromDate:toDate:options:", 16, v16, v21, 0));
    v24 = objc_msgSend(v23, "day");
    v25 = (int64_t)v24;
    if (!os_log_GKGeneral)
      v26 = (id)GKOSLoggers(v24);
    v27 = os_log_GKTrace;
    v28 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v28)
    {
      *(_DWORD *)buf = 134217984;
      v45 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: days diff=%ld", buf, 0xCu);
    }
    v29 = v25 <= v20;
    v30 = v25 > v20;
    if (v29)
    {
      if (!os_log_GKGeneral)
        v40 = (id)GKOSLoggers(v28);
      v41 = os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      *(_DWORD *)buf = 134217984;
      v45 = v20;
      v33 = "shouldCadencedActivitySharingReprompt: No, last trigger was under %ld days ago.";
      v34 = v41;
      v35 = 12;
    }
    else
    {
      if (!os_log_GKGeneral)
        v31 = (id)GKOSLoggers(v28);
      v32 = os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v33 = "shouldCadencedActivitySharingReprompt: Yes, last trigger was a long time ago and it hasn't reached the limit.";
      v34 = v32;
      v35 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, v33, buf, v35);
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  if (!os_log_GKGeneral)
    v36 = (id)GKOSLoggers(v14);
  v37 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v45 = a3;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: No, the reprompt has reached the limit of %ld.", buf, 0xCu);
  }
  v30 = 0;
LABEL_36:

  return v30;
}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setActivitySharingRepromptLastTriggerDate: %@", buf, 0xCu);
  }
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("GKActivitySharingReprompt")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("totalTriggerCount")));
  v13 = objc_msgSend(v12, "intValue");

  v15 = v13 + 1;
  if (!os_log_GKGeneral)
    v16 = (id)GKOSLoggers(v14);
  v17 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "setActivitySharingRepromptLastTriggerDate: new count is %d", buf, 8u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15, CFSTR("lastTriggerDate"), CFSTR("totalTriggerCount"), v5));
  v21[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, &v20, 2));
  objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("GKActivitySharingReprompt"));

}

@end
