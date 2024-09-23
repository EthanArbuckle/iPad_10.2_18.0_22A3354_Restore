@implementation WLKNotificationsImpl_iOS

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  WLKPushNotificationsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didChangeSettings. %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0CFDCB0];
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "notificationCenter:didChangeSettings:bag:", v5, v6, v9);

}

- (void)_fetchTopics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  id location;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  v20 = 0;
  objc_initWeak(&location, self);
  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke;
  v11[3] = &unk_1E68A93F0;
  objc_copyWeak(&v17, &location);
  v15 = v21;
  v16 = v19;
  v8 = v6;
  v12 = v8;
  v9 = v4;
  v14 = v9;
  v10 = v5;
  v13 = v10;
  objc_msgSend(v7, "getNotificationSettingsForTopicsWithCompletionHandler:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
}

- (id)_displayNameForSubsectionID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.tv.bulletins.explicit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SPORTS_IN_UP_NEXT");
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.tv.bulletins.implicit")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FEATURED_SPORTS_AND_EVENTS");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqual:", CFSTR("com.apple.tv.bulletins.marketing")))
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MARKETING_PUSH_NOTIFICATIONS");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E68AA228, CFSTR("WatchListKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (unint64_t)_authOptions
{
  return 7;
}

- (void)setTopicsAreInitialized:(BOOL)a3
{
  self->_topicsAreInitialized = a3;
}

- (WLKNotificationsImpl_iOS)init
{
  WLKNotificationsImpl_iOS *v2;
  WLKNotificationsImpl_iOS *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLKNotificationsImpl_iOS;
  v2 = -[WLKNotificationsImpl_iOS init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[WLKNotificationsImpl_iOS _notificationCenter](v2, "_notificationCenter");
    -[WLKNotificationsImpl_iOS setTopicsAreInitialized:](v3, "setTopicsAreInitialized:", 0);
    -[WLKNotificationsImpl_iOS _initializeTopics](v3, "_initializeTopics");
  }
  return v3;
}

- (id)_notificationCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WLKNotificationsImpl_iOS__notificationCenter__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  if (_notificationCenter_onceToken_0 != -1)
    dispatch_once(&_notificationCenter_onceToken_0, block);
  return (id)_notificationCenter__center_0;
}

- (void)_initializeTopics
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke;
  v2[3] = &unk_1E68A9378;
  v2[4] = self;
  -[WLKNotificationsImpl_iOS _fetchTopics:](self, "_fetchTopics:", v2);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");

  objc_msgSend(v9, "setBadgeCount:withCompletionHandler:", v8, v6);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WLKNotificationsImpl_iOS;
  -[WLKNotificationsImpl_iOS dealloc](&v4, sel_dealloc);
}

- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a6;
  v10 = (objc_class *)MEMORY[0x1E0CEC6E0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("interruptionLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = objc_msgSend((id)objc_opt_class(), "_interruptionLevelForNumber:", v15);
  else
    v16 = 1;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sound"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("silent")) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setInterruptionLevel:", v16, v13);
  objc_msgSend(v14, "setTitle:", v12);

  objc_msgSend(v14, "setBody:", v11);
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("threadID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setThreadIdentifier:", v19);

  objc_msgSend(v14, "setSound:", v18);
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpirationDate:", v20);

  if (objc_msgSend(v34, "wlk_BOOLForKey:defaultValue:", CFSTR("isSession"), 0))
    objc_msgSend(v14, "setCategoryIdentifier:", CFSTR("SESSION"));
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("actionURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v14, "setDefaultActionURL:", v21);
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("category"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  -[WLKNotificationsImpl_iOS _topicIdentifierForCategory:](self, "_topicIdentifierForCategory:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopicIdentifiers:", v25);

  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("actionMetrics"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("actionMetrics"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("actionMetrics"));

  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("bannerOnly"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("bannerOnly"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("bannerOnly"));

  }
  objc_msgSend(v14, "setUserInfo:", v26);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v33, v14, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addNotificationRequest:withCompletionHandler:", v31, &__block_literal_global_39);

}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeString:withCompletionHandler:", v7, v6);

}

- (BOOL)isCategoryEnabledByUser:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettingsForTopics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKNotificationsImpl_iOS _topicIdentifierForCategory:](self, "_topicIdentifierForCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "authorizationStatus") == 2;
  return (char)v7;
}

- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettingsForTopics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKNotificationsImpl_iOS _topicIdentifierForCategory:](self, "_topicIdentifierForCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "badgeSetting") == 2;
  return (char)v7;
}

- (void)getNotificationSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WLKNotificationsImpl_iOS _notificationCenter](self, "_notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WLKNotificationsImpl_iOS_getNotificationSettings___block_invoke;
  v7[3] = &unk_1E68A9330;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

}

- (id)_topicIdentifierForCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return off_1E68A9410[a3 - 1];
}

+ (unint64_t)_interruptionLevelForNumber:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "intValue");
    if (v5 >= 4)
      v6 = 1;
    else
      v6 = v5;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_networkReachabilityDidChangeNotification:(id)a3
{
  id v4;
  WLKNotificationsImpl_iOS *v5;
  BOOL v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[WLKNotificationsImpl_iOS topicsAreInitialized](v5, "topicsAreInitialized");
  objc_sync_exit(v5);

  if (!v6)
  {
    +[WLKReachabilityMonitor sharedInstance](WLKReachabilityMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isNetworkReachable");

    if (v8)
    {
      WLKPushNotificationsLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - reachability changed, will refresh topics", v10, 2u);
      }

      -[WLKNotificationsImpl_iOS _initializeTopics](v5, "_initializeTopics");
    }
  }

}

- (void)_accountChangedNotification:(id)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  WLKPushNotificationsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Account changed, will refresh topics", buf, 2u);
  }

  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WLKNotificationsImpl_iOS__accountChangedNotification___block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

- (void)_storeFrontChangedNotification:(id)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  WLKPushNotificationsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Storefront changed, will refresh topics", buf, 2u);
  }

  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WLKNotificationsImpl_iOS__storeFrontChangedNotification___block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  WLKPushNotificationsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - willPresentNotification. %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v6, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("bannerOnly"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "BOOLValue");

  if ((_DWORD)v10)
    v13 = 16;
  else
    v13 = 27;
  v7[2](v7, v13);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  WLKPushNotificationsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didReceiveNotificationResponse. %@", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0CFDCB0], "shouldHandleNotificationResponse:", v7))
  {
    WLKPushNotificationsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didReceiveNotificationResponse will be handled by AMS", buf, 2u);
    }

    v11 = (void *)MEMORY[0x1E0CFDCB0];
    objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleNotificationResponse:bag:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__WLKNotificationsImpl_iOS_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E68A7DB8;
    v16 = v8;
    objc_msgSend(v13, "addFinishBlock:", v15);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_JSONDictForResponse:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKNotificationsImpl_iOS delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleAction:", v13);

    v8[2](v8);
  }

}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WLKPushNotificationsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didOpenApplicationForResponse. %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_JSONDictForResponse:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKNotificationsImpl_iOS delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleAction:", v7);

}

+ (id)_JSONDictForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC808]) & 1) != 0)
  {
    v6 = WLKNotificationsOnActionKeyReasonActivation;
LABEL_5:
    objc_msgSend(v4, "setObject:forKey:", *v6, CFSTR("reason"));
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC818]))
  {
    v6 = WLKNotificationsOnActionKeyReasonDismissed;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v3, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v10, CFSTR("identifier"));

  objc_msgSend(v9, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v11, CFSTR("title"));

  objc_msgSend(v9, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v12, CFSTR("body"));

  objc_msgSend(v9, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("actionMetrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v14, CFSTR("actionMetrics"));

  return v4;
}

- (WLKNotificationCenterDelegate)delegate
{
  return (WLKNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (BOOL)topicsAreInitialized
{
  return self->_topicsAreInitialized;
}

- (NSMutableSet)notificationTopics
{
  return self->_notificationTopics;
}

- (void)setNotificationTopics:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTopics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTopics, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
