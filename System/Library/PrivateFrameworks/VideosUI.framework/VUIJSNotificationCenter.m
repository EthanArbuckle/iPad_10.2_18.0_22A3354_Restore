@implementation VUIJSNotificationCenter

- (VUIJSNotificationCenter)initWithAppContext:(id)a3
{
  VUIJSNotificationCenter *v3;
  WLKNotificationCenter *v4;
  WLKNotificationCenter *center;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIJSNotificationCenter;
  v3 = -[VUIJSObject initWithAppContext:](&v7, sel_initWithAppContext_, a3);
  if (v3)
  {
    v4 = (WLKNotificationCenter *)objc_alloc_init(MEMORY[0x1E0DC87E0]);
    center = v3->_center;
    v3->_center = v4;

    -[WLKNotificationCenter setDelegate:](v3->_center, "setDelegate:", v3);
  }
  return v3;
}

void __73__VUIJSNotificationCenter_showSignupAlertPushNotificationWithAppContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("wlNotifications"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasProperty:", CFSTR("showLocalNotificationsSignupAlert")))
    v2 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("showLocalNotificationsSignupAlert"), 0);

}

uint64_t __73__VUIJSNotificationCenter_showSignupAlertPushNotificationWithAppContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluate:", &__block_literal_global_88);
}

+ (void)showSignupAlertPushNotificationWithAppContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__VUIJSNotificationCenter_showSignupAlertPushNotificationWithAppContext___block_invoke;
  v6[3] = &unk_1E9F9B4F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "isFullTVAppEnabledwithCompletion:", v6);

}

void __73__VUIJSNotificationCenter_showSignupAlertPushNotificationWithAppContext___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__VUIJSNotificationCenter_showSignupAlertPushNotificationWithAppContext___block_invoke_2;
    block[3] = &unk_1E9F98DF0;
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)setBadgeNumber:(id)a3
{
  -[WLKNotificationCenter setBadgeNumber:withCompletionHandler:](self->_center, "setBadgeNumber:withCompletionHandler:", a3, 0);
}

- (void)clearBadgeData
{
  objc_msgSend(MEMORY[0x1E0DC8758], "clearSavedBadgeIdentifiers");
}

- (void)post:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  objc_msgSend(v14, "addEntriesFromDictionary:", v13);

  objc_msgSend(v14, "setObject:forKey:", &unk_1EA0B9BC8, *MEMORY[0x1E0DC8988]);
  v15 = *MEMORY[0x1E0DC8968];
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0DC8968]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v14, "removeObjectForKey:", v15);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v14, "setObject:forKey:", v17, v15);

  }
  -[WLKNotificationCenter post:title:body:options:](self->_center, "post:title:body:options:", v18, v10, v11, v14);

}

- (void)setBadgeString:(id)a3
{
  id v4;
  WLKNotificationCenter *center;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  center = self->_center;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__VUIJSNotificationCenter_setBadgeString___block_invoke;
  v7[3] = &unk_1E9F9E178;
  v8 = v4;
  v6 = v4;
  -[WLKNotificationCenter setBadgeString:withCompletionHandler:](center, "setBadgeString:withCompletionHandler:", v6, v7);

}

void __42__VUIJSNotificationCenter_setBadgeString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("VUIJSNotificationCenter - An error occured setting the badge string to %@: %@"), *(_QWORD *)(a1 + 32), a2);
}

- (id)badgeData
{
  return (id)objc_msgSend(MEMORY[0x1E0DC8758], "badgeIdentifiers");
}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  -[VUIJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  objc_initWeak(&from, self);
  v6 = objc_loadWeakRetained(&location);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__VUIJSNotificationCenter_handleAction___block_invoke;
  v8[3] = &unk_1E9F9CBA8;
  objc_copyWeak(&v10, &from);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "evaluate:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __40__VUIJSNotificationCenter_handleAction___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasProperty:", CFSTR("onAction")))
  {
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "invokeMethod:withArguments:", CFSTR("onAction"), v7);

  }
}

+ (void)showAppInstallCompletePushNotificationWithAppContext:(id)a3 appName:(id)a4 contentName:(id)a5 punchoutURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "length") && objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __112__VUIJSNotificationCenter_showAppInstallCompletePushNotificationWithAppContext_appName_contentName_punchoutURL___block_invoke;
    v13[3] = &unk_1E9F99DB0;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

void __112__VUIJSNotificationCenter_showAppInstallCompletePushNotificationWithAppContext_appName_contentName_punchoutURL___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__VUIJSNotificationCenter_showAppInstallCompletePushNotificationWithAppContext_appName_contentName_punchoutURL___block_invoke_2;
  v3[3] = &unk_1E9F9F790;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "evaluate:", v3);

}

void __112__VUIJSNotificationCenter_showAppInstallCompletePushNotificationWithAppContext_appName_contentName_punchoutURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("wlNotifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasProperty:", CFSTR("showLocalNotificationsAppInstallComplete")))
  {
    v6 = *(_OWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("showLocalNotificationsAppInstallComplete"), v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
}

@end
