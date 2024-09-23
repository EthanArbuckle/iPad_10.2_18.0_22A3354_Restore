@implementation WLKNotificationsImpl

void __47__WLKNotificationsImpl_iOS__notificationCenter__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[16];

  if (WLKIsDaemon())
  {
    v2 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    WLKTVAppBundleID();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "initWithBundleIdentifier:", v3);
    v5 = (void *)_notificationCenter__center_0;
    _notificationCenter__center_0 = v4;

    objc_msgSend((id)_notificationCenter__center_0, "setWantsNotificationResponsesDelivered");
    objc_msgSend((id)_notificationCenter__center_0, "setPrivateDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    +[WLKReachabilityMonitor sharedInstance](WLKReachabilityMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel__networkReachabilityDidChangeNotification_, CFSTR("WLKReachabilityMonitorReachabilityDidChange"), v8);

    v9 = *(_QWORD *)(a1 + 32);
    +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v9, sel__accountChangedNotification_, CFSTR("WLKAccountMonitorAccountDidChange"), v10);

    v11 = *(_QWORD *)(a1 + 32);
    +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v11, sel__storeFrontChangedNotification_, CFSTR("WLKAccountMontiorStoreFrontDidChange"), v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_notificationCenter__center_0;
    _notificationCenter__center_0 = v13;
  }

  objc_msgSend((id)_notificationCenter__center_0, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.tv-default"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)_notificationCenter__center_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNotificationCategories:", v16);

  WLKPushNotificationsLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Center setup", buf, 2u);
  }

}

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  uint8_t buf[8];
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_initWeak(&location, WeakRetained);
  WLKPushNotificationsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Fetch topics", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_38;
  v7[3] = &unk_1E68A93C8;
  objc_copyWeak(&v14, &location);
  v13 = *(_OWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v9 = WeakRetained;
  v6 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  WLKFetchNotificationCategories(v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WLKPushNotificationsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = &stru_1E68AA228;
    if (v6)
      v8 = v6;
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - fetch topics complete. %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNotificationTopics:withCompletionHandler:", v5, &__block_literal_global_34_0);

  }
}

void __52__WLKNotificationsImpl_iOS_post_title_body_options___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  WLKPushNotificationsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = &stru_1E68AA228;
    if (v2)
      v4 = v2;
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Add notification request complete. %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __52__WLKNotificationsImpl_iOS_getNotificationSettings___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke_33(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  WLKPushNotificationsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = &stru_1E68AA228;
    if (v2)
      v4 = v2;
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Set topics complete. %@", (uint8_t *)&v5, 0xCu);
  }

}

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 *p_buf;
  id v32;
  id location;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_sync_enter(v7);
  if ((objc_msgSend(v7, "topicsAreInitialized") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNotificationTopics:", v8);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v9, "objectForKey:", CFSTR("WLKBulletinDataProviderLastRegisteredSections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    WLKPushNotificationsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Notification categories fetch from bag resulted in error %@:", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v7, "setTopicsAreInitialized:", 0);
    if (v10)
    {
      WLKPushNotificationsLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1B515A000, v15, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Falling-back to last-known categories %@:", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);
    }
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("WLKBulletinDataProviderLastRegisteredSections"));
    v17 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "notificationTopics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

  }
  else
  {
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if ((v19 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("com.apple.tv.bulletins.explicit"));
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    if ((v19 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("com.apple.tv.bulletins.implicit"));
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    if ((v19 & 4) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("com.apple.tv.bulletins.marketing"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x2020000000;
    v36 = 0;
    objc_initWeak(&location, v7);
    v20 = (void *)objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_42;
    v23[3] = &unk_1E68A93A0;
    objc_copyWeak(&v32, &location);
    v21 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 80);
    v24 = v21;
    v30 = v22;
    v25 = v10;
    v26 = *(id *)(a1 + 48);
    p_buf = &buf;
    v27 = *(id *)(a1 + 56);
    v28 = v9;
    v29 = *(id *)(a1 + 64);
    objc_msgSend(v20, "isFullTVAppEnabledwithCompletion:", v23);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  objc_sync_exit(v7);
}

void __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke_42(uint64_t a1, int a2)
{
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = objc_loadWeakRetained((id *)(a1 + 96));
  objc_sync_enter(v33);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v4 = 1;
  else
    v4 = a2 == 0;
  if (!v4)
  {
    WLKPushNotificationsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v39 = v6;
      v40 = 1024;
      LODWORD(v41) = 1;
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Falling-back to last-known categories as we might have gotten a 304%@, and is tvappenabled%d", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  WLKPushNotificationsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v8;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - SubsectionInfos: %@", buf, 0xCu);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 32);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v35;
    *(_QWORD *)&v10 = 134218242;
    v31 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v13, v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v33, "_authOptions");
        if (v14)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
          v16 = objc_msgSend(v14, "soundSetting");
          v17 = objc_msgSend(v14, "alertSetting");
          v18 = objc_msgSend(v14, "badgeSetting");
          WLKPushNotificationsLogObject();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v17 | v16 | v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v31;
            v39 = v20;
            v40 = 2112;
            v41 = v13;
            _os_log_impl(&dword_1B515A000, v19, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Overriding auth options from user's settings to:%lu for %@", buf, 0x16u);
          }

        }
        else
        {
          v20 = v15;
        }
        v21 = (void *)MEMORY[0x1E0CEC770];
        objc_msgSend(v33, "_displayNameForSubsectionID:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "topicRequestWithIdentifier:displayName:options:", v13, v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v9);
  }

  objc_msgSend(v33, "notificationTopics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");
  if (v25 == objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v26 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) == 0;

    if (v26)
    {
      WLKPushNotificationsLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B515A000, v27, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Previous topics being returned", buf, 2u);
      }
      goto LABEL_30;
    }
  }
  else
  {

  }
  WLKPushNotificationsLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v28, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Topics successfully initialized", buf, 2u);
  }

  v27 = objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  objc_msgSend(v33, "setNotificationTopics:", v27);
LABEL_30:

  objc_msgSend(v33, "setTopicsAreInitialized:", 1);
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("WLKBulletinDataProviderLastRegisteredSections"));
  v29 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v33, "notificationTopics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v29 + 16))(v29, v30, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

  objc_sync_exit(v33);
}

uint64_t __56__WLKNotificationsImpl_iOS__accountChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeTopics");
}

uint64_t __59__WLKNotificationsImpl_iOS__storeFrontChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeTopics");
}

void __104__WLKNotificationsImpl_iOS_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKPushNotificationsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Failure");
    if (a2)
      v7 = CFSTR("Success");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - AMS did handle %@ Error:%@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
