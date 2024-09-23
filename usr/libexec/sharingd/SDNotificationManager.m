@implementation SDNotificationManager

+ (id)sharedManager
{
  if (qword_1007C6AB8 != -1)
    dispatch_once(&qword_1007C6AB8, &stru_100719098);
  return (id)qword_1007C6AC0;
}

- (SDNotificationManager)init
{
  SDNotificationManager *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDNotificationManager;
  v2 = -[SDNotificationManager init](&v7, "init");
  if (v2)
  {
    v3 = CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSString)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *m;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("-- SDNotificationManager --\n"));
  if (self->_activated)
    objc_msgSend(v3, "appendString:", CFSTR("activated "));
  if (self->_homePodNotifGranted)
    objc_msgSend(v3, "appendString:", CFSTR("HomePod granted "));
  if (self->_tvNotifGranted)
    objc_msgSend(v3, "appendString:", CFSTR("TV granted "));
  if (self->_watchNotifGranted)
    objc_msgSend(v3, "appendString:", CFSTR("Watch granted "));
  if (self->_autoFillRequests)
  {
    objc_msgSend(v3, "appendString:", CFSTR("AutoFill requests:\n"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR(" - %@\n"), *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v6);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if (self->_homePodRequests)
  {
    objc_msgSend(v3, "appendString:", CFSTR("HomePod requests:\n"));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_homePodRequests, "allKeys"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v11; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v3, "appendFormat:", CFSTR(" - %@\n"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if (self->_tvKeyboardRequests)
  {
    objc_msgSend(v3, "appendString:", CFSTR("TVKeyboard requests:\n"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tvKeyboardRequests, "allKeys"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v16; k = (char *)k + 1)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v3, "appendFormat:", CFSTR(" - %@\n"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)k));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
      }
      while (v16);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if (self->_watchKeyboardRequests)
  {
    objc_msgSend(v3, "appendString:", CFSTR("WatchKeyboard requests:\n"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_watchKeyboardRequests, "allKeys"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (m = 0; m != v21; m = (char *)m + 1)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v3, "appendFormat:", CFSTR(" - %@\n"), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)m));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      }
      while (v21);
    }

  }
  return (NSString *)v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C4E0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
    if (dword_1007B2DE0 <= 30
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _activate]", 30, "Activate\n");
    }
    self->_activated = 1;
    -[SDNotificationManager prefsChanged](self, "prefsChanged");
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C5D4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _invalidate]", 30, "Invalidated\n");
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    -[SDNotificationManager _homePodEnsureStarted:completion:](self, "_homePodEnsureStarted:completion:", 0, 0);
    -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 0, 0);
    -[SDNotificationManager _watchEnsureStarted:completion:](self, "_watchEnsureStarted:completion:", 0, 0);
  }
}

- (void)_riServerEnsureStarted:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  UNUserNotificationCenter *v7;
  UNUserNotificationCenter *tvNotifCenter;
  UNUserNotificationCenter *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  if (self->_tvNotifCenter)
  {
LABEL_2:
    if (v6)
      v6[2](v6);
    goto LABEL_12;
  }
  if (a3)
  {
    CFPrefs_SetValue(CFSTR("com.apple.Sharing"), CFSTR("riClientTriggered"), kCFBooleanTrue);
  }
  else if (!CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("riClientTriggered"), 0))
  {
    goto LABEL_2;
  }
  notify_post("com.apple.ContinuityKeyBoard.enabled");
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerEnsureStarted:completion:]", 30, "Starting TV\n");
  v7 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(off_1007B2E50()), "initWithBundleIdentifier:", CFSTR("com.apple.Sharing.TVRemoteNotifications"));
  tvNotifCenter = self->_tvNotifCenter;
  self->_tvNotifCenter = v7;

  -[UNUserNotificationCenter setDelegate:](self->_tvNotifCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_tvNotifCenter, "setWantsNotificationResponsesDelivered");
  v9 = self->_tvNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016C828;
  v10[3] = &unk_1007190E8;
  v10[4] = self;
  v11 = v6;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v9, "getNotificationSettingsWithCompletionHandler:", v10);

LABEL_12:
}

- (void)_watchEnsureStarted:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  UNUserNotificationCenter *v7;
  UNUserNotificationCenter *watchNotifCenter;
  UNUserNotificationCenter *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  if (self->_watchNotifCenter)
  {
LABEL_2:
    if (v6)
      v6[2](v6);
    goto LABEL_12;
  }
  if (a3)
  {
    CFPrefs_SetValue(CFSTR("com.apple.Sharing"), CFSTR("watchKBTriggered"), kCFBooleanTrue);
  }
  else if (!CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("watchKBTriggered"), 0))
  {
    goto LABEL_2;
  }
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchEnsureStarted:completion:]", 30, "Starting Watch\n");
  v7 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(off_1007B2E50()), "initWithBundleIdentifier:", CFSTR("com.apple.Sharing.WatchRemoteNotifications"));
  watchNotifCenter = self->_watchNotifCenter;
  self->_watchNotifCenter = v7;

  -[UNUserNotificationCenter setDelegate:](self->_watchNotifCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_watchNotifCenter, "setWantsNotificationResponsesDelivered");
  v9 = self->_watchNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016CBE8;
  v10[3] = &unk_1007190E8;
  v10[4] = self;
  v11 = v6;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v9, "getNotificationSettingsWithCompletionHandler:", v10);

LABEL_12:
}

- (void)_homePodEnsureStarted:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  UNUserNotificationCenter *v8;
  UNUserNotificationCenter *homePodNotifCenter;
  UNUserNotificationCenter *v10;
  UNUserNotificationCenter *v11;
  UNUserNotificationCenter *homePodMiniNotificationCenter;
  UNUserNotificationCenter *v13;
  NSObject *dispatchQueue;
  _QWORD block[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  NSObject *v18;
  _QWORD v19[5];
  NSObject *v20;

  v6 = (void (**)(_QWORD))a4;
  if (a3)
  {
    CFPrefs_SetValue(CFSTR("com.apple.Sharing"), CFSTR("hhNotifTriggered"), kCFBooleanTrue);
LABEL_4:
    v7 = dispatch_group_create();
    if (!self->_homePodNotifCenter)
    {
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodEnsureStarted:completion:]", 30, "Starting HomePod\n");
      }
      v8 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(off_1007B2E50()), "initWithBundleIdentifier:", CFSTR("com.apple.Sharing.HomePodRemoteNotifications"));
      homePodNotifCenter = self->_homePodNotifCenter;
      self->_homePodNotifCenter = v8;

      -[UNUserNotificationCenter setDelegate:](self->_homePodNotifCenter, "setDelegate:", self);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_homePodNotifCenter, "setWantsNotificationResponsesDelivered");
      dispatch_group_enter(v7);
      v10 = self->_homePodNotifCenter;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10016D0E8;
      v19[3] = &unk_100719138;
      v19[4] = self;
      v20 = v7;
      -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v10, "getNotificationSettingsWithCompletionHandler:", v19);

    }
    if (!self->_homePodMiniNotificationCenter)
    {
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodEnsureStarted:completion:]", 30, "Starting HomePod mini\n");
      }
      v11 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(off_1007B2E50()), "initWithBundleIdentifier:", CFSTR("com.apple.Sharing.b7ce1794a1c8766816fc7b7500742862"));
      homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
      self->_homePodMiniNotificationCenter = v11;

      -[UNUserNotificationCenter setDelegate:](self->_homePodMiniNotificationCenter, "setDelegate:", self);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_homePodMiniNotificationCenter, "setWantsNotificationResponsesDelivered");
      dispatch_group_enter(v7);
      v13 = self->_homePodMiniNotificationCenter;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10016D314;
      v17[3] = &unk_100719138;
      v17[4] = self;
      v18 = v7;
      -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v13, "getNotificationSettingsWithCompletionHandler:", v17);

    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016D540;
    block[3] = &unk_100717180;
    v16 = v6;
    dispatch_group_notify(v7, dispatchQueue, block);

    goto LABEL_19;
  }
  if (CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("hhNotifTriggered"), 0))
    goto LABEL_4;
  if (v6)
    v6[2](v6);
LABEL_19:

}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5
{
  -[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:](self, "_addRequestWithID:content:type:isHomePodMini:", a3, a4, *(_QWORD *)&a5, 0);
}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5 isHomePodMini:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *homePodRequests;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  UNUserNotificationCenter *v22;
  UNUserNotificationCenter *v23;
  NSMutableDictionary *autoFillRequests;
  NSMutableDictionary *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *tvKeyboardRequests;
  UNUserNotificationCenter *tvNotifCenter;
  NSMutableDictionary *watchKeyboardRequests;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  const __CFString *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  SDNotificationManager *v37;
  id v38;
  unsigned int v39;
  BOOL v40;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = -[objc_class requestWithIdentifier:content:trigger:](off_1007B2E58(), "requestWithIdentifier:content:trigger:", v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = a5 - 2;
  switch(a5)
  {
    case 2u:
    case 3u:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homePodRequests, "objectForKeyedSubscript:", v10));

      if (v15
        && dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 30, "Duplicate HomePod Handoff request\n");
      }
      homePodRequests = self->_homePodRequests;
      if (!homePodRequests)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v21 = self->_homePodRequests;
        self->_homePodRequests = v20;

        homePodRequests = self->_homePodRequests;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](homePodRequests, "setObject:forKeyedSubscript:", v13, v10);
      v22 = self->_homePodNotifCenter;
      if (v6)
      {
        v23 = self->_homePodMiniNotificationCenter;

        v22 = v23;
      }
      goto LABEL_41;
    case 4u:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_autoFillRequests, "objectForKeyedSubscript:", v10));

      if (v16
        && dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 30, "Duplicate TV autofill request\n");
      }
      autoFillRequests = self->_autoFillRequests;
      if (!autoFillRequests)
      {
        v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v26 = self->_autoFillRequests;
        self->_autoFillRequests = v25;

        autoFillRequests = self->_autoFillRequests;
      }
      goto LABEL_35;
    case 5u:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tvKeyboardRequests, "objectForKeyedSubscript:", v10));

      if (v17
        && dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 30, "Duplicate TV needsKeyboard request\n");
      }
      autoFillRequests = self->_tvKeyboardRequests;
      if (!autoFillRequests)
      {
        v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        tvKeyboardRequests = self->_tvKeyboardRequests;
        self->_tvKeyboardRequests = v27;

        autoFillRequests = self->_tvKeyboardRequests;
      }
LABEL_35:
      -[NSMutableDictionary setObject:forKeyedSubscript:](autoFillRequests, "setObject:forKeyedSubscript:", v13, v10);
      tvNotifCenter = self->_tvNotifCenter;
      goto LABEL_40;
    case 6u:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_watchKeyboardRequests, "objectForKeyedSubscript:", v10));

      if (v18
        && dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 30, "Duplicate watch needsKeyboard request");
      }
      watchKeyboardRequests = self->_watchKeyboardRequests;
      if (!watchKeyboardRequests)
      {
        v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v32 = self->_watchKeyboardRequests;
        self->_watchKeyboardRequests = v31;

        watchKeyboardRequests = self->_watchKeyboardRequests;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](watchKeyboardRequests, "setObject:forKeyedSubscript:", v13, v10);
      tvNotifCenter = self->_watchNotifCenter;
LABEL_40:
      v22 = tvNotifCenter;
LABEL_41:
      if (v22)
      {
        if (dword_1007B2DE0 <= 30
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
        {
          if (v14 > 4)
            v33 = CFSTR("?");
          else
            v33 = off_100719210[v14];
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 30, "Adding %@ notification request from %@\n", v33, v10);
        }
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10016DA38;
        v34[3] = &unk_100719188;
        v35 = v13;
        v36 = v11;
        v37 = self;
        v38 = v10;
        v39 = a5;
        v40 = v6;
        -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](v22, "addNotificationRequest:withCompletionHandler:", v35, v34);

      }
      else
      {
        if (dword_1007B2DE0 <= 90
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 90, "### No notification center for request");
        }
LABEL_28:
        v22 = 0;
      }

      return;
    default:
      if (dword_1007B2DE0 <= 60
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]", 60, "### Unsupported notification type: %d\n");
      }
      goto LABEL_28;
  }
}

- (id)attachmentFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  Class v14;
  id v15;
  void *v16;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = off_1007B2E68();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6)
    {
      v7 = off_1007B2E68();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      objc_msgSend(v4, "setObject:forKey:", kUTTypePNG, v8);

    }
    v9 = off_1007B2E70();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v12 = off_1007B2E70();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v4, "setObject:forKey:", v11, v13);

    }
    v14 = off_1007B2E78();
    v15 = objc_msgSend(v4, "copy");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class attachmentWithIdentifier:URL:options:error:](v14, "attachmentWithIdentifier:URL:options:error:", &stru_10072FE60, v3, v15, 0));

    if (!v16
      && dword_1007B2DE0 <= 90
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager attachmentFromURL:]", 90, "### Failed to create attachment from URL %@\n", v3);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_tvHandleResponse:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  _QWORD v33[4];
  id v34;

  v5 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10016E354;
  v33[3] = &unk_100717180;
  v6 = a4;
  v34 = v6;
  v7 = objc_retainBlock(v33);
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 30, "Handle TV response: %@\n", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      if (dword_1007B2DE0 <= 90
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 90, "### No device ID?\n");
      }
      goto LABEL_50;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionIdentifier"));
    v13 = off_1007B2E80();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v12;
    v16 = v14;
    v17 = v16;
    if (v15 == v16)
    {
      v18 = 1;
    }
    else if ((v15 == 0) == (v16 != 0))
    {
      v18 = 0;
    }
    else
    {
      v18 = objc_msgSend(v15, "isEqual:", v16);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionIdentifier"));
    v20 = off_1007B2E88();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v19;
    v23 = v21;
    v24 = v23;
    if (v22 == v23)
    {
      v25 = 1;
    }
    else if ((v22 == 0) == (v23 != 0))
    {
      v25 = 0;
    }
    else
    {
      v25 = objc_msgSend(v22, "isEqual:", v23);
    }

    v26 = objc_alloc_init((Class)SFDevice);
    objc_msgSend(v26, "setIdentifier:", v11);
    if (v25)
    {
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 30, "Handling dismiss");
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
      v29 = objc_msgSend(v28, "containsObject:", v10);

      if (v29)
      {
        -[SDNotificationManager tvAutoFillRemove:](self, "tvAutoFillRemove:", v26);
      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tvKeyboardRequests, "allKeys"));
        v31 = objc_msgSend(v30, "containsObject:", v10);

        if (v31)
        {
          -[SDNotificationManager riServerRemove:](self, "riServerRemove:", v26);
        }
        else if (dword_1007B2DE0 <= 60
               && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 60, "### Remove of unrecognized notification?\n");
        }
      }
      goto LABEL_49;
    }
    if (v18)
    {
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 30, "Handling default");
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDRemoteInteractionAgent sharedAgent](SDRemoteInteractionAgent, "sharedAgent"));
      objc_msgSend(v27, "clientUserDidTapNotification:", v11);
    }
    else
    {
      if (dword_1007B2DE0 > 90
        || dword_1007B2DE0 == -1 && !_LogCategory_Initialize(&dword_1007B2DE0, 90))
      {
        goto LABEL_49;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionIdentifier"));
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 90, "### Unrecognized action: %@\n", v27);
    }

LABEL_49:
LABEL_50:

    goto LABEL_51;
  }
  if (dword_1007B2DE0 <= 90 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvHandleResponse:completion:]", 90, "### No notification ID?\n");
LABEL_51:

  ((void (*)(_QWORD *))v7[2])(v7);
}

- (id)riServerContentForDevice:(id)a3 backgroundAction:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[2];
  _QWORD v29[2];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)v7;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (v6 && v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));

    v14 = objc_msgSend(v5, "deviceActionType");
    v15 = CFSTR("REMOTE_BULLETIN_MESSAGE");
    if (v14 == 19)
    {
      v15 = CFSTR("REMOTE_BULLETIN_MESSAGE_AUTOFILL");
      v16 = CFSTR("REMOTE_BULLETIN_SUBTITLE_AUTOFILL");
    }
    else
    {
      v16 = CFSTR("REMOTE_BULLETIN_SUBTITLE");
    }
    v10 = v15;
    v12 = v16;
    v9 = objc_alloc_init(off_1007B2E90());
    v18 = SFLocalizedStringForKey(v10, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v9, "setBody:", v19);

    objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("continuityRemoteCategory"));
    objc_msgSend(v9, "setShouldHideTime:", 1);
    objc_msgSend(v9, "setShouldHideDate:", 1);
    objc_msgSend(v9, "setShouldIgnoreDoNotDisturb:", 1);
    v20 = -[objc_class soundWithAlertType:](off_1007B2E98(), "soundWithAlertType:", 23);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v9, "setSound:", v21);

    v23 = SFLocalizedStringForKey(v12, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v9, "setSubtitle:", v24);

    v28[0] = CFSTR("deviceIdentifier");
    v28[1] = CFSTR("sessionID");
    v29[0] = v8;
    v29[1] = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
    objc_msgSend(v9, "setUserInfo:", v25);

    if (v4)
      objc_msgSend(v9, "setShouldBackgroundDefaultAction:", 1);
    else
      objc_msgSend(v9, "setShouldSuppressDefaultAction:", 1);
  }
  v26 = v9;

  return v26;
}

- (void)riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016E644;
  block[3] = &unk_100715D58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[7];
  BOOL v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDNotificationManager riServerContentForDevice:backgroundAction:](self, "riServerContentForDevice:backgroundAction:", v6, v4));
    v10 = (void *)v9;
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10016E72C;
      v11[3] = &unk_1007191B0;
      v12 = v4;
      v11[4] = v8;
      v11[5] = self;
      v11[6] = v9;
      -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 1, v11);
    }

  }
}

- (void)riServerRemove:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016E84C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_riServerRemove:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UNUserNotificationCenter *tvNotifCenter;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tvKeyboardRequests, "objectForKeyedSubscript:", v5));

      if (v6)
      {
        if (dword_1007B2DE0 <= 30
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerRemove:]", 30, "TV KBRemove %@\n", v5);
        }
        tvNotifCenter = self->_tvNotifCenter;
        v9 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](tvNotifCenter, "removeDeliveredNotificationsWithIdentifiers:", v8);

        -[NSMutableDictionary removeObjectForKey:](self->_tvKeyboardRequests, "removeObjectForKey:", v5);
      }
    }
  }

}

- (void)riServerRemoveAll
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016E9F4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerRemoveAll
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2DE0 <= 10 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 10)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerRemoveAll]", 10, "TV KBRemoveAll");
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_tvNotifCenter, "removeAllDeliveredNotifications");
  -[NSMutableDictionary removeAllObjects](self->_tvKeyboardRequests, "removeAllObjects");
}

- (void)riServerUpdate:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016EB24;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_riServerUpdate:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  UNUserNotificationCenter *tvNotifCenter;
  _QWORD v24[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager riServerContentForDevice:backgroundAction:](self, "riServerContentForDevice:backgroundAction:", v7, 0));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_tvNotifCenter && v10 && v11 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tvKeyboardRequests, "objectForKeyedSubscript:", v11));

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prompt"));
      if (v14)
      {
        objc_msgSend(v9, "setBody:", v14);
      }
      else
      {
        v15 = SFLocalizedStringForKey(CFSTR("REMOTE_BULLETIN_MESSAGE_OPEN"), v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v9, "setBody:", v16);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      if (v18)
      {
        objc_msgSend(v9, "setSubtitle:", v18);
      }
      else
      {
        v19 = SFLocalizedStringForKey(CFSTR("REMOTE_BULLETIN_SUBTITLE"), v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        objc_msgSend(v9, "setSubtitle:", v20);

      }
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prompt"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerUpdate:info:]", 30, "KBUpdate (legacy) %@, Prompt: '%@', Title: '%@'\n", v11, v21, v22);

      }
      tvNotifCenter = self->_tvNotifCenter;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10016EDC8;
      v24[3] = &unk_1007147C8;
      v24[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](tvNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v24);
    }
    else if (dword_1007B2DE0 <= 60
           && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerUpdate:info:]", 60, "### KBUpdate: request %@ not found\n", v10);
    }
  }

}

- (void)riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016EF74;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  UNUserNotificationCenter *tvNotifCenter;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[5];
  NSErrorUserInfoKey v34;
  const __CFString *v35;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager riServerContentForDevice:backgroundAction:](self, "riServerContentForDevice:backgroundAction:", v7, 0));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = 0;
  v13 = 4294960591;
  if (v10 && v11)
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tvKeyboardRequests, "objectForKeyedSubscript:", v11));

      if (v12)
      {
        v14 = SFRTIDataPayloadForData(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v12)
        {
          v15 = off_1007B2EA0();
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class payloadWithData:version:](v15, "payloadWithData:version:", v16, objc_msgSend(v12, "version")));

          if (v17)
          {
            if (dword_1007B2DE0 <= 30
              && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
            {
              LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerUpdate:rtiData:]", 30, "Updating TV text from RTI data\n");
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "documentTraits"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "prompt"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "documentTraits"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));

            if (v19)
            {
              objc_msgSend(v9, "setBody:", v19);
              if (v21)
              {
LABEL_13:
                objc_msgSend(v9, "setSubtitle:", v21);
                goto LABEL_16;
              }
            }
            else
            {
              v24 = SFLocalizedStringForKey(CFSTR("REMOTE_BULLETIN_MESSAGE_OPEN"), v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              objc_msgSend(v9, "setBody:", v25);

              if (v21)
                goto LABEL_13;
            }
            v26 = SFLocalizedStringForKey(CFSTR("REMOTE_BULLETIN_SUBTITLE"), v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            objc_msgSend(v9, "setSubtitle:", v27);

LABEL_16:
            if (dword_1007B2DE0 <= 30
              && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
            {
              LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerUpdate:rtiData:]", 30, "TV KBUpdate (RTI) %@, Prompt: '%@', Title: '%@'\n", v11, v19, v21);
            }
            tvNotifCenter = self->_tvNotifCenter;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_10016F3C8;
            v33[3] = &unk_1007147C8;
            v33[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](tvNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v33);
LABEL_21:

            goto LABEL_22;
          }
          v13 = 4294960563;
        }
        else
        {
          v13 = 4294960554;
        }
      }
      else
      {
        v13 = 4294960569;
      }
    }
    else
    {
      v12 = 0;
      v13 = 4294960559;
    }
  }
  if (dword_1007B2DE0 <= 60 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
  {
    v29 = (int)v13;
    v34 = NSLocalizedDescriptionKey;
    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v13, 0, 0));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v17 = (void *)v31;
    v32 = CFSTR("?");
    if (v31)
      v32 = (const __CFString *)v31;
    v35 = v32;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v29, v19));
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _riServerUpdate:rtiData:]", 60, "### Error handling RTI data: %@\n", v21);
    goto LABEL_21;
  }
LABEL_22:

}

- (NSSet)activeTVAutoFillPrompts
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  return (NSSet *)v5;
}

- (void)tvAutoFillPostIfNeeded:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016F5A0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_tvAutoFillPostIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10016F64C;
    v6[3] = &unk_100714860;
    v6[4] = v5;
    v6[5] = self;
    -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 1, v6);
  }

}

- (void)tvAutoFillRemove:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016F8E0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_tvAutoFillRemove:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UNUserNotificationCenter *tvNotifCenter;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_autoFillRequests, "objectForKeyedSubscript:", v5));

      if (v6)
      {
        if (dword_1007B2DE0 <= 30
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvAutoFillRemove:]", 30, "AFRemove %@\n", v5);
        }
        tvNotifCenter = self->_tvNotifCenter;
        v9 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](tvNotifCenter, "removeDeliveredNotificationsWithIdentifiers:", v8);

        -[NSMutableDictionary removeObjectForKey:](self->_autoFillRequests, "removeObjectForKey:", v5);
      }
    }
  }

}

- (void)tvAutoFillRemoveAll
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016FA88;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_tvAutoFillRemoveAll
{
  if (self->_tvNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_1007B2DE0 <= 10
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 10)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _tvAutoFillRemoveAll]", 10, "AFRemoveAll");
    }
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_tvNotifCenter, "removeAllDeliveredNotifications");
    -[NSMutableDictionary removeAllObjects](self->_autoFillRequests, "removeAllObjects");
  }
}

- (id)watchKeyboardContentForDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v29[2];
  _QWORD v30[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (v4 && v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

    v12 = objc_msgSend(v3, "deviceActionType");
    v13 = CFSTR("WATCH_KEYBOARD_MESSAGE");
    if (v12 == 19)
    {
      v13 = CFSTR("WATCH_KEYBOARD_MESSAGE_AUTOFILL");
      v14 = CFSTR("WATCH_KEYBOARD_SUBTITLE_AUTOFILL");
    }
    else
    {
      v14 = CFSTR("WATCH_KEYBOARD_SUBTITLE");
    }
    v8 = v13;
    v10 = v14;
    v7 = objc_alloc_init(off_1007B2E90());
    v16 = SFLocalizedStringForKey(v8, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v7, "setBody:", v17);

    objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("continuityRemoteCategory"));
    objc_msgSend(v7, "setShouldHideTime:", 1);
    objc_msgSend(v7, "setShouldHideDate:", 1);
    objc_msgSend(v7, "setShouldSuppressDefaultAction:", 1);
    objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
    v18 = -[objc_class soundWithAlertType:](off_1007B2E98(), "soundWithAlertType:", 23);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v7, "setSound:", v19);

    v21 = SFLocalizedStringForKey(v10, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v7, "setSubtitle:", v22);

    v29[0] = CFSTR("deviceIdentifier");
    v29[1] = CFSTR("sessionID");
    v30[0] = v6;
    v30[1] = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    objc_msgSend(v7, "setUserInfo:", v23);

    if (SFDeviceClassCodeGet(v24, v25) == 1)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForApplicationIdentifier:](UNNotificationIcon, "iconForApplicationIdentifier:", CFSTR("com.apple.Bridge")));
      objc_msgSend(v7, "setIcon:", v26);

    }
  }
  v27 = v7;

  return v27;
}

- (void)watchKeyboardPostIfNeeded:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016FE10;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_watchKeyboardPostIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[SDNotificationManager watchKeyboardContentForDevice:](self, "watchKeyboardContentForDevice:", v4));
    v8 = (void *)v7;
    if (v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10016FEE0;
      v9[3] = &unk_100715138;
      v9[4] = v6;
      v9[5] = self;
      v9[6] = v7;
      -[SDNotificationManager _watchEnsureStarted:completion:](self, "_watchEnsureStarted:completion:", 1, v9);
    }

  }
}

- (void)watchKeyboardRemove:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016FFE4;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_watchKeyboardRemove:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UNUserNotificationCenter *watchNotifCenter;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_watchKeyboardRequests, "objectForKeyedSubscript:", v5));

      if (v6)
      {
        if (dword_1007B2DE0 <= 30
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardRemove:]", 30, "Watch KBRemove %@\n", v5);
        }
        watchNotifCenter = self->_watchNotifCenter;
        v9 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](watchNotifCenter, "removeDeliveredNotificationsWithIdentifiers:", v8);

        -[NSMutableDictionary removeObjectForKey:](self->_watchKeyboardRequests, "removeObjectForKey:", v5);
      }
    }
  }

}

- (void)watchKeyboardRemoveAll
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017018C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardRemoveAll
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B2DE0 <= 10 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 10)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardRemoveAll]", 10, "Watch KBRemoveAll");
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_watchNotifCenter, "removeAllDeliveredNotifications");
  -[NSMutableDictionary removeAllObjects](self->_watchKeyboardRequests, "removeAllObjects");
}

- (void)watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001702BC;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  UNUserNotificationCenter *watchNotifCenter;
  _QWORD v24[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager riServerContentForDevice:backgroundAction:](self, "riServerContentForDevice:backgroundAction:", v7, 0));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchNotifCenter && v10 && v11 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_watchKeyboardRequests, "objectForKeyedSubscript:", v11));

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prompt"));
      if (v14)
      {
        objc_msgSend(v9, "setBody:", v14);
      }
      else
      {
        v15 = SFLocalizedStringForKey(CFSTR("WATCH_KEYBOARD_MESSAGE_OPEN"), v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v9, "setBody:", v16);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      if (v18)
      {
        objc_msgSend(v9, "setSubtitle:", v18);
      }
      else
      {
        v19 = SFLocalizedStringForKey(CFSTR("WATCH_KEYBOARD_SUBTITLE"), v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        objc_msgSend(v9, "setSubtitle:", v20);

      }
      if (dword_1007B2DE0 <= 30
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prompt"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardUpdate:info:]", 30, "Watch KBUpdate (legacy) %@, Prompt: '%@', Title: '%@'\n", v11, v21, v22);

      }
      watchNotifCenter = self->_watchNotifCenter;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100170560;
      v24[3] = &unk_1007147C8;
      v24[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](watchNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v24);
    }
    else if (dword_1007B2DE0 <= 60
           && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardUpdate:info:]", 60, "### KBUpdate: request %@ not found\n", v10);
    }
  }

}

- (void)watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017070C;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  UNUserNotificationCenter *watchNotifCenter;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[5];
  NSErrorUserInfoKey v34;
  const __CFString *v35;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager watchKeyboardContentForDevice:](self, "watchKeyboardContentForDevice:", v7));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = 0;
  v13 = 4294960591;
  if (v10 && v11)
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_watchKeyboardRequests, "objectForKeyedSubscript:", v11));

      if (v12)
      {
        v14 = SFRTIDataPayloadForData(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v12)
        {
          v15 = off_1007B2EA0();
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class payloadWithData:version:](v15, "payloadWithData:version:", v16, objc_msgSend(v12, "version")));

          if (v17)
          {
            if (dword_1007B2DE0 <= 30
              && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
            {
              LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]", 30, "Updating watch text from RTI data\n");
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "documentTraits"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "prompt"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "documentTraits"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));

            if (v19)
            {
              objc_msgSend(v9, "setBody:", v19);
              if (v21)
              {
LABEL_13:
                objc_msgSend(v9, "setSubtitle:", v21);
                goto LABEL_16;
              }
            }
            else
            {
              v24 = SFLocalizedStringForKey(CFSTR("WATCH_KEYBOARD_MESSAGE_OPEN"), v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              objc_msgSend(v9, "setBody:", v25);

              if (v21)
                goto LABEL_13;
            }
            v26 = SFLocalizedStringForKey(CFSTR("WATCH_KEYBOARD_SUBTITLE"), v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            objc_msgSend(v9, "setSubtitle:", v27);

LABEL_16:
            if (dword_1007B2DE0 <= 30
              && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
            {
              LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]", 30, "Watch KBUpdate (RTI) %@, Prompt: '%@', Title: '%@'\n", v11, v19, v21);
            }
            watchNotifCenter = self->_watchNotifCenter;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_100170B5C;
            v33[3] = &unk_1007147C8;
            v33[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](watchNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v33);
LABEL_21:

            goto LABEL_22;
          }
          v13 = 4294960563;
        }
        else
        {
          v13 = 4294960554;
        }
      }
      else
      {
        v13 = 4294960569;
      }
    }
    else
    {
      v12 = 0;
      v13 = 4294960559;
    }
  }
  if (dword_1007B2DE0 <= 60 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
  {
    v29 = (int)v13;
    v34 = NSLocalizedDescriptionKey;
    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v13, 0, 0));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v17 = (void *)v31;
    v32 = CFSTR("?");
    if (v31)
      v32 = (const __CFString *)v31;
    v35 = v32;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v29, v19));
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]", 60, "### Error handling RTI data: %@\n", v21);
    goto LABEL_21;
  }
LABEL_22:

}

- (void)_watchHandleResponse:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  id v6;

  v6 = a3;
  v5 = (void (**)(_QWORD))a4;
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _watchHandleResponse:completion:]", 30, "Handle Watch response: %@\n", v6);
  if (v5)
    v5[2](v5);

}

- (id)homePodHandoffContentForDevice:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "notificationType");
  if (v8 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "body"));
    v15 = v13;
    if (v13)
    {
      v16 = v13;
    }
    else
    {
      v22 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_MESSAGE_MEDIA_GENERIC"), v14);
      v16 = (id)objc_claimAutoreleasedReturnValue(v22);
    }
    v18 = v16;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    if (!v20)
    {
      v21 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFER");
      goto LABEL_17;
    }
LABEL_15:
    v23 = v20;
    v20 = v23;
LABEL_18:
    v25 = v23;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "header"));
    v28 = v26;
    if (v26)
    {
      v29 = v26;
    }
    else
    {
      v30 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_HEADER_DEFAULT"), v27);
      v29 = (id)objc_claimAutoreleasedReturnValue(v30);
    }
    v31 = v29;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUIDString"));

    v34 = objc_alloc_init(off_1007B2E90());
    objc_msgSend(v34, "setBody:", v18);
    objc_msgSend(v34, "setCategoryIdentifier:", CFSTR("HomePodHandoffCategory"));
    if (objc_msgSend(v7, "homePodType") == (id)2)
    {
      objc_msgSend(v34, "setCategoryIdentifier:", CFSTR("60909dfe8f8c461e619cf5ffef54b503"));
      v35 = CFSTR("homepodmini.fill");
    }
    else
    {
      v35 = CFSTR("homepod.fill");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", v35));
    objc_msgSend(v34, "setIcon:", v36);

    objc_msgSend(v34, "setTitle:", v31);
    objc_msgSend(v34, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v34, "setShouldHideTime:", 1);
    objc_msgSend(v34, "setShouldHideDate:", 1);
    objc_msgSend(v34, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v34, "setSound:", 0);
    objc_msgSend(v34, "setSubtitle:", v25);
    v44[0] = CFSTR("deviceIdentifier");
    v44[1] = CFSTR("sessionID");
    v45[0] = v6;
    v45[1] = v33;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
    objc_msgSend(v34, "setUserInfo:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentURL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager attachmentFromURL:](self, "attachmentFromURL:", v38));

    if (v39)
    {
      v43 = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
      objc_msgSend(v34, "setAttachments:", v40);

    }
    else if (dword_1007B2DE0 <= 90
           && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager homePodHandoffContentForDevice:info:]", 90, "### No attachment???");
    }
    v41 = v34;

    goto LABEL_33;
  }
  if (v8 == 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "body"));
    v11 = v9;
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      v17 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_MESSAGE_CALL_GENERIC"), v10);
      v12 = (id)objc_claimAutoreleasedReturnValue(v17);
    }
    v18 = v12;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    if (!v20)
    {
      v21 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TALK_HOMEPOD");
LABEL_17:
      v24 = SFLocalizedStringForKey(v21, v19);
      v23 = (id)objc_claimAutoreleasedReturnValue(v24);
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (dword_1007B2DE0 <= 90 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager homePodHandoffContentForDevice:info:]", 90, "### Cannot create HomePod content for unknown variant: %ld\n", objc_msgSend(v7, "notificationType"));
  v41 = 0;
LABEL_33:

  return v41;
}

- (void)homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001711C0;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  SDNotificationManager *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager homePodHandoffContentForDevice:info:](self, "homePodHandoffContentForDevice:info:", v6, v7));
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001712A0;
    v9[3] = &unk_100714990;
    v10 = v7;
    v11 = v6;
    v12 = self;
    v13 = v8;
    -[SDNotificationManager _homePodEnsureStarted:completion:](self, "_homePodEnsureStarted:completion:", 1, v9);

  }
}

- (void)homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001713EC;
  block[3] = &unk_100715D08;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  UNUserNotificationCenter *homePodNotifCenter;
  void *v10;
  UNUserNotificationCenter *v11;
  void *v12;
  UNUserNotificationCenter *homePodMiniNotificationCenter;
  void *v14;
  UNUserNotificationCenter *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homePodRequests, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    if (dword_1007B2DE0 <= 30
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    {
      if ((unint64_t)(a4 - 1) > 3)
        v8 = CFSTR("?");
      else
        v8 = off_100719238[a4 - 1];
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandoffRemove:reason:]", 30, "HHRemove %@, %@\n", v6, v8);
    }
    homePodNotifCenter = self->_homePodNotifCenter;
    v21 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](homePodNotifCenter, "removeDeliveredNotificationsWithIdentifiers:", v10);

    v11 = self->_homePodNotifCenter;
    v20 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](v11, "removePendingNotificationRequestsWithIdentifiers:", v12);

    homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
    v19 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](homePodMiniNotificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v14);

    v15 = self->_homePodMiniNotificationCenter;
    v18 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](v15, "removePendingNotificationRequestsWithIdentifiers:", v16);

    -[NSMutableDictionary removeObjectForKey:](self->_homePodRequests, "removeObjectForKey:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](SDProxHandoffAgent, "sharedAgent"));
    objc_msgSend(v17, "notificationDidDismiss:reason:", v6, a4);

  }
}

- (void)homePodHandoffRemoveAll
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100171654;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffRemoveAll
{
  if (self->_homePodNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_1007B2DE0 <= 10
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 10)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandoffRemoveAll]", 10, "HHRemoveAll");
    }
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_homePodNotifCenter, "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_homePodMiniNotificationCenter, "removeAllDeliveredNotifications");
    -[NSMutableDictionary removeAllObjects](self->_homePodRequests, "removeAllObjects");
  }
}

- (void)homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001717A0;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *homePodRequests;
  void *v9;
  void *v10;
  UNUserNotificationCenter *v11;
  UNUserNotificationCenter *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SDNotificationManager *v16;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homePodRequests = self->_homePodRequests;
  if (homePodRequests)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homePodRequests, "objectForKeyedSubscript:", v6));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager homePodHandoffContentForDevice:info:](self, "homePodHandoffContentForDevice:info:", v6, v7));
      if (v10)
      {
        v11 = self->_homePodNotifCenter;
        if (objc_msgSend(v7, "homePodType") == (id)2)
        {
          v12 = self->_homePodMiniNotificationCenter;

          v11 = v12;
        }
        if (dword_1007B2DE0 <= 30
          && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
        {
          LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]", 30, "HHUpdate %@, %@\n", v6, v10);
        }
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1001719E4;
        v13[3] = &unk_1007147F0;
        v14 = v6;
        v15 = v7;
        v16 = self;
        -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](v11, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v14, v10, v13);

      }
      else if (dword_1007B2DE0 <= 90
             && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]", 90, "### Failed to created content from info: %@\n", v7);
      }

    }
    else if (dword_1007B2DE0 <= 90
           && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]", 90, "### Cannot update unrecognized ID: %@\n", v6);
    }
  }

}

- (void)_homePodHandleResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  unsigned int v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  unsigned int v33;
  void *v34;
  SDNotificationManager *v35;
  _QWORD v36[4];
  id v37;

  v6 = a3;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100171FEC;
  v36[3] = &unk_100717180;
  v7 = a4;
  v37 = v7;
  v8 = objc_retainBlock(v36);
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandleResponse:completion:]", 30, "Handle HomePod response: %@\n", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

  if (v11)
  {
    v35 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
    if (!v12)
    {
      if (dword_1007B2DE0 <= 90
        && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
      {
        LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandleResponse:completion:]", 90, "### No action identifier for notification response? %@", v6);
      }
      goto LABEL_49;
    }
    v13 = off_1007B2E80();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v12;
    v16 = v14;
    v17 = v16;
    if (v15 == v16)
    {
      v18 = 1;
    }
    else if (v16)
    {
      v18 = objc_msgSend(v15, "isEqual:", v16);
    }
    else
    {
      v18 = 0;
    }

    v19 = off_1007B2E88();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = v15;
    v22 = v20;
    v23 = v22;
    if (v21 == v22)
    {
      v24 = 1;
    }
    else
    {
      if (!v22)
      {

        if ((v18 & 1) != 0)
        {
LABEL_26:
          LOBYTE(v25) = 1;
          goto LABEL_36;
        }
        v24 = 0;
LABEL_30:
        v26 = (__CFString *)v21;
        v27 = v26;
        if (v26 == CFSTR("TRANSFER"))
          v25 = 1;
        else
          v25 = -[__CFString isEqual:](v26, "isEqual:", CFSTR("TRANSFER"));

        if ((v24 & 1) != 0)
        {
          if (v25)
          {
LABEL_42:
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](SDProxHandoffAgent, "sharedAgent"));
            objc_msgSend(v34, "userDidTapNotification:", v11);

LABEL_49:
            goto LABEL_50;
          }
LABEL_44:
          -[SDNotificationManager homePodHandoffRemove:reason:](v35, "homePodHandoffRemove:reason:", v11, 2);
          goto LABEL_49;
        }
LABEL_36:
        v28 = off_1007B2EA8();
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = v21;
        v31 = v29;
        v32 = v31;
        if (v30 == v31)
        {
          v33 = 1;
        }
        else if (v31)
        {
          v33 = objc_msgSend(v30, "isEqual:", v31);
        }
        else
        {
          v33 = 0;
        }

        if ((v25 & 1) != 0)
          goto LABEL_42;
        if (!v33)
        {
          if (dword_1007B2DE0 <= 60
            && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
          {
            LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandleResponse:completion:]", 60, "Unrecognized action: %@\n", v30);
          }
          goto LABEL_49;
        }
        goto LABEL_44;
      }
      v24 = objc_msgSend(v21, "isEqual:", v22);
    }

    if ((v18 & 1) != 0)
    {
      if ((v24 & 1) != 0)
        goto LABEL_42;
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if (dword_1007B2DE0 <= 90 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 90)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager _homePodHandleResponse:completion:]", 90, "### No identifier for notification response? %@", v6);
LABEL_50:

  ((void (*)(_QWORD *))v8[2])(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  UNUserNotificationCenter *homePodNotifCenter;
  UNUserNotificationCenter *v12;
  UNUserNotificationCenter *v13;
  UNUserNotificationCenter *v14;
  unsigned __int8 v15;
  UNUserNotificationCenter *homePodMiniNotificationCenter;
  UNUserNotificationCenter *v17;
  UNUserNotificationCenter *v18;
  UNUserNotificationCenter *v19;
  unsigned __int8 v20;
  NSObject *v21;
  UNUserNotificationCenter *tvNotifCenter;
  UNUserNotificationCenter *v23;
  UNUserNotificationCenter *v24;
  UNUserNotificationCenter *v25;
  unsigned int v26;
  NSObject *v27;
  UNUserNotificationCenter *watchNotifCenter;
  UNUserNotificationCenter *v29;
  UNUserNotificationCenter *v30;
  UNUserNotificationCenter *v31;
  unsigned int v32;
  NSObject *v33;
  NSString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  os_activity_scope_state_s state;
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  homePodNotifCenter = self->_homePodNotifCenter;
  v12 = (UNUserNotificationCenter *)v8;
  v13 = homePodNotifCenter;
  if (v13 == v12)
    goto LABEL_10;
  v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    v15 = -[UNUserNotificationCenter isEqual:](v12, "isEqual:", v13);

    if ((v15 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
  v17 = v12;
  v18 = homePodMiniNotificationCenter;
  if (v18 == v17)
  {
LABEL_10:

    goto LABEL_11;
  }
  v19 = v18;
  if ((v12 == 0) == (v18 != 0))
  {

    goto LABEL_14;
  }
  v20 = -[UNUserNotificationCenter isEqual:](v17, "isEqual:", v18);

  if ((v20 & 1) != 0)
  {
LABEL_11:
    v21 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/homepod", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v21, &state);
    -[SDNotificationManager _homePodHandleResponse:completion:](self, "_homePodHandleResponse:completion:", v9, v10);
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }
LABEL_14:
  tvNotifCenter = self->_tvNotifCenter;
  v23 = v17;
  v24 = tvNotifCenter;
  if (v24 == v23)
  {

    goto LABEL_19;
  }
  v25 = v24;
  if ((v12 == 0) == (v24 != 0))
  {

    goto LABEL_21;
  }
  v26 = -[UNUserNotificationCenter isEqual:](v23, "isEqual:", v24);

  if (v26)
  {
LABEL_19:
    v27 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/tv", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v27, &state);
    -[SDNotificationManager _tvHandleResponse:completion:](self, "_tvHandleResponse:completion:", v9, v10);
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }
LABEL_21:
  watchNotifCenter = self->_watchNotifCenter;
  v29 = v23;
  v30 = watchNotifCenter;
  if (v30 == v29)
  {

    goto LABEL_26;
  }
  v31 = v30;
  if ((v12 == 0) != (v30 != 0))
  {
    v32 = -[UNUserNotificationCenter isEqual:](v29, "isEqual:", v30);

    if (!v32)
      goto LABEL_28;
LABEL_26:
    v33 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/watch", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v33, &state);
    -[SDNotificationManager _watchHandleResponse:completion:](self, "_watchHandleResponse:completion:", v9, v10);
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }

LABEL_28:
  if (dword_1007B2DE0 <= 60)
  {
    if (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60))
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", 60, "### Unrecognized notification center: %@ for response: %@\n", v29, v9);
    if (dword_1007B2DE0 <= 60
      && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 60)))
    {
      v41 = NSLocalizedDescriptionKey;
      v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v36 = (void *)v35;
      v37 = CFSTR("?");
      if (v35)
        v37 = (const __CFString *)v35;
      v42 = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6705, v38));
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", 60, "### Error handling notification response: %@\n", v39);

    }
  }
  if (v10)
    v10[2](v10);
LABEL_12:

}

- (void)testPost:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_1007B2DE0 <= 30)
  {
    if (dword_1007B2DE0 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B2DE0, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testPost:]", 30, "Test post\n");
      v4 = v6;
    }
  }
  if (!self->_activated)
  {
    -[SDNotificationManager _activate](self, "_activate");
    v4 = v6;
  }
  if (objc_msgSend(v4, "isEqual:", CFSTR("-af")))
  {
    -[SDNotificationManager testAutofillPost](self, "testAutofillPost");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-afr")))
  {
    -[SDNotificationManager testAutoFillRemove](self, "testAutoFillRemove");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-ho")))
  {
    -[SDNotificationManager testHandoffPost](self, "testHandoffPost");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-kb")))
  {
    -[SDNotificationManager testKeyboardPost](self, "testKeyboardPost");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-kba")))
  {
    -[SDNotificationManager testKeyboardPostAutoFill](self, "testKeyboardPostAutoFill");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-kbr")))
  {
    -[SDNotificationManager testKeyboardRemove](self, "testKeyboardRemove");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-kbu")))
  {
    -[SDNotificationManager testKeyboardUpdate](self, "testKeyboardUpdate");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-wkb")))
  {
    -[SDNotificationManager testWatchKeyboard](self, "testWatchKeyboard");
  }
  else if (objc_msgSend(v6, "isEqual:", CFSTR("-waf")))
  {
    -[SDNotificationManager testWatchKeyboardAutoFill](self, "testWatchKeyboardAutoFill");
  }
  else
  {
    -[SDNotificationManager testPostBasic](self, "testPostBasic");
  }

}

- (void)testPostBasic
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(off_1007B2E90());
  objc_msgSend(v5, "setBody:", CFSTR("This is a test user notification"));
  objc_msgSend(v5, "setCategoryIdentifier:", CFSTR("continuityRemoteCategory"));
  objc_msgSend(v5, "setSubtitle:", CFSTR("Example Subtitle"));
  objc_msgSend(v5, "setTitle:", CFSTR("Notification Title"));
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testPostBasic]", 30, "Test: Posting basic notification\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  -[SDNotificationManager _addRequestWithID:content:type:](self, "_addRequestWithID:content:type:", v4, v5, 5);

}

- (void)testAutofillPost
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testAutofillPost]", 30, "Test: Posting AF notification\n");
  -[SDNotificationManager tvAutoFillPostIfNeeded:](self, "tvAutoFillPostIfNeeded:", v4);

}

- (void)testAutoFillRemove
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testAutoFillRemove]", 30, "Test: Removing AF notification\n");
  -[SDNotificationManager tvAutoFillRemove:](self, "tvAutoFillRemove:", v4);

}

- (void)testHandoffPost
{
  uint64_t v3;
  unsigned int v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = SFDeviceClassCodeGet(self, a2) - 1;
  if (v4 > 2)
    v5 = CFSTR("HOMEPOD_HANDOFF_MESSAGE_CALL_PEER");
  else
    v5 = off_100719258[(char)v4];
  v6 = SFLocalizedStringForKey(v5, v3);
  v14 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("John Appleseed")));
  v8 = objc_alloc_init((Class)SFNotificationInfo);
  objc_msgSend(v8, "setNotificationType:", 3);
  objc_msgSend(v8, "setBody:", v7);
  v9 = SFHomePodDisplayNameForDeviceName(CFSTR("Kitchen"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setHeader:", v10);

  v12 = SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TALK_HOMEPOD"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v8, "setTitle:", v13);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testHandoffPost]", 30, "Test: Posting Handoff notification\n");
  -[SDNotificationManager homePodHandoffPostIfNeeded:info:](self, "homePodHandoffPostIfNeeded:info:", CFSTR("00000000-0000-0000-0000-000000000000"), v8);

}

- (void)testKeyboardPost
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testKeyboardPost]", 30, "Test: Posting TVKB notification\n");
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self, "riServerPostIfNeeded:backgroundAction:", v4, 0);

}

- (void)testKeyboardPostAutoFill
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  objc_msgSend(v4, "setDeviceActionType:", 19);
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testKeyboardPostAutoFill]", 30, "Test: Posting KB notification with AutoFill\n");
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:](self, "riServerPostIfNeeded:backgroundAction:", v4, 0);

}

- (void)testKeyboardRemove
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testKeyboardRemove]", 30, "Test: Removing KB notification\n");
  -[SDNotificationManager riServerRemove:](self, "riServerRemove:", v4);

}

- (void)testKeyboardUpdate
{
  id v3;
  id v4;
  id v5;

  v5 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v5, "setIdentifier:", v3);

  v4 = objc_alloc_init((Class)SFRemoteTextSessionInfo);
  objc_msgSend(v4, "setPrompt:", CFSTR("Updated prompt"));
  objc_msgSend(v4, "setTitle:", CFSTR("Updated Title"));
  -[SDNotificationManager riServerUpdate:info:](self, "riServerUpdate:info:", v5, v4);

}

- (void)testWatchKeyboard
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testWatchKeyboard]", 30, "Test: Posting WatchKB notification\n");
  -[SDNotificationManager watchKeyboardPostIfNeeded:](self, "watchKeyboardPostIfNeeded:", v4);

}

- (void)testWatchKeyboardAutoFill
{
  id v3;
  id v4;

  v4 = objc_alloc_init((Class)SFDevice);
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v4, "setIdentifier:", v3);

  objc_msgSend(v4, "setDeviceActionType:", 19);
  if (dword_1007B2DE0 <= 30 && (dword_1007B2DE0 != -1 || _LogCategory_Initialize(&dword_1007B2DE0, 30)))
    LogPrintF(&dword_1007B2DE0, "-[SDNotificationManager testWatchKeyboardAutoFill]", 30, "Test: Posting KB notification with AutoFill\n");
  -[SDNotificationManager watchKeyboardPostIfNeeded:](self, "watchKeyboardPostIfNeeded:", v4);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_watchNotifCenter, 0);
  objc_storeStrong((id *)&self->_watchKeyboardRequests, 0);
  objc_storeStrong((id *)&self->_tvNotifCenter, 0);
  objc_storeStrong((id *)&self->_tvKeyboardRequests, 0);
  objc_storeStrong((id *)&self->_homePodRequests, 0);
  objc_storeStrong((id *)&self->_homePodMiniNotificationCenter, 0);
  objc_storeStrong((id *)&self->_homePodNotifCenter, 0);
  objc_storeStrong((id *)&self->_autoFillRequests, 0);
}

@end
