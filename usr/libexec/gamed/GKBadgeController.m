@implementation GKBadgeController

+ (id)sharedController
{
  if (qword_100317F50 != -1)
    dispatch_once(&qword_100317F50, &stru_1002C2270);
  return (id)qword_100317F48;
}

- (id)_badgeCountURL
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", GKGameCenterIdentifier));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("badgeCounts")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  return v6;
}

- (GKBadgeController)init
{
  GKBadgeController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *syncQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKBadgeController;
  v2 = -[GKBadgeController init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.badgecontroller.syncqueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    -[GKBadgeController synchronize](v2, "synchronize");
  }
  return v2;
}

- (id)_plistKeyForBadgeType:(unint64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3);
}

- (void)synchronize
{
  uint64_t v3;
  dispatch_time_t v4;
  NSObject *syncQueue;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[6];

  if (self->_dirty)
  {
    v3 = ++qword_100317F58;
    v4 = dispatch_time(0, 5000000000);
    syncQueue = self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DA040;
    block[3] = &unk_1002C1620;
    block[4] = self;
    block[5] = v3;
    dispatch_after(v4, syncQueue, block);
  }
  else
  {
    v6 = self->_syncQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DA20C;
    v7[3] = &unk_1002BBBD8;
    v7[4] = self;
    dispatch_async(v6, v7);
  }
}

- (BOOL)isBadgingEnabledForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  if (objc_msgSend(v4, "notificationBadgesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](NSBundle, "_gkBundleWithIdentifier:", v3));
    v6 = objc_msgSend(v5, "_gkIsBadgingEnabled");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)badgeApplicationWithBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  NSObject *syncQueue;
  id v13;
  _QWORD block[4];
  id v15;
  GKBadgeController *v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKBadgeController: badgeApplicationWithBundleID", buf, 2u);
  }
  if (-[GKBadgeController isBadgingEnabledForBundleID:](self, "isBadgingEnabledForBundleID:", v7))
  {
    -[GKBadgeController badgeBundleID:badgeCount:](self, "badgeBundleID:badgeCount:", v7, a4);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](NSBundle, "_gkBundleWithIdentifier:", v7));
    v11 = objc_msgSend(v10, "_gkIsBadgingEnabled");

    if (v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000DA618;
      v17[3] = &unk_1002C2298;
      v17[4] = self;
      v18 = v7;
      v19 = a4;
      -[GKBadgeController registerBadgePermissionForBundleID:completionHandler:](self, "registerBadgePermissionForBundleID:completionHandler:", v18, v17);

    }
  }
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA6C8;
  block[3] = &unk_1002BB658;
  v15 = v7;
  v16 = self;
  v13 = v7;
  dispatch_async(syncQueue, block);

}

- (void)badgeBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  __CFString *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t CString;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint8_t buf[1032];

  v6 = (__CFString *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v8 = objc_msgSend(v7, "notificationBadgesEnabled");

  if (v8)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v9);
    v11 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKBadgeController: badgeApplicationWithBundleID - Badging enabled", buf, 2u);
    }
    bzero(buf, 0x400uLL);
    if (-[GKBadgeController isBadgingEnabledForBundleID:](self, "isBadgingEnabledForBundleID:", v6))
    {
      CString = CFStringGetCString(v6, (char *)buf, 1024, 0x8000100u);
      if ((_DWORD)CString)
      {
        if (!os_log_GKGeneral)
          v13 = (id)GKOSLoggers(CString);
        v14 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
          v19 = 138412546;
          v20 = v6;
          v21 = 2112;
          v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Setting badge count for bundleID: %@ count: %@", (uint8_t *)&v19, 0x16u);

        }
        v17 = objc_msgSend(objc_alloc((Class)UISApplicationState), "initWithBundleIdentifier:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        objc_msgSend(v17, "setBadgeValue:", v18);

      }
    }
  }

}

- (id)_dictionaryForBadgeType:(unint64_t)a3
{
  dispatch_queue_t current_queue;
  NSObject *v6;
  NSObject *v7;
  NSObject *syncQueue;
  const char *label;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v7 = v6;
  syncQueue = self->_syncQueue;
  if (v6 != syncQueue)
  {
    label = dispatch_queue_get_label(v6);
    v10 = dispatch_queue_get_label(syncQueue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKBadgeController _dictionaryForBadgeType:]", label, v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), v12, "-[GKBadgeController _dictionaryForBadgeType:]", objc_msgSend(v14, "UTF8String"), 207));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  return self->_badgeDictionaries[a3];
}

- (unint64_t)_badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  NSObject *v9;
  NSObject *syncQueue;
  const char *label;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a3;
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  v9 = v8;
  syncQueue = self->_syncQueue;
  if (v8 != syncQueue)
  {
    label = dispatch_queue_get_label(v8);
    v12 = dispatch_queue_get_label(syncQueue);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKBadgeController _badgeCountForBundleID:badgeType:]", label, v12, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), v14, "-[GKBadgeController _badgeCountForBundleID:badgeType:]", objc_msgSend(v16, "UTF8String"), 213));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBadgeController _dictionaryForBadgeType:](self, "_dictionaryForBadgeType:", a4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  return (unint64_t)v20;
}

- (unint64_t)badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6;
  dispatch_queue_t current_queue;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *syncQueue;
  const char *label;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  unint64_t v18;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  current_queue = dispatch_get_current_queue();
  v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(current_queue);
  syncQueue = self->_syncQueue;

  if (v8 == syncQueue)
  {
    label = dispatch_queue_get_label((dispatch_queue_t)self->_syncQueue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKBadgeController badgeCountForBundleID:badgeType:]", label, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != _syncQueue)\n[%s (%s:%d)]"), v12, "-[GKBadgeController badgeCountForBundleID:badgeType:]", objc_msgSend(v14, "UTF8String"), 219));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (!v6)
    v6 = GKGameCenterIdentifier;
  v16 = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAE4C;
  block[3] = &unk_1002C22C0;
  block[4] = self;
  v21 = v6;
  v22 = &v24;
  v23 = a4;
  v17 = v6;
  dispatch_sync(v16, block);
  v18 = v25[3];

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (unint64_t)_totalBadgeCountForBundleID:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  NSObject *v7;
  NSObject *syncQueue;
  const char *label;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSMutableDictionary **badgeDictionaries;
  void *v19;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v7 = v6;
  syncQueue = self->_syncQueue;
  if (v6 != syncQueue)
  {
    label = dispatch_queue_get_label(v6);
    v10 = dispatch_queue_get_label(syncQueue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKBadgeController _totalBadgeCountForBundleID:]", label, v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), v12, "-[GKBadgeController _totalBadgeCountForBundleID:]", objc_msgSend(v14, "UTF8String"), 232));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  v16 = 0;
  v17 = 0;
  badgeDictionaries = self->_badgeDictionaries;
  do
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](badgeDictionaries[v16], "objectForKeyedSubscript:", v4));
    v17 += (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

    ++v16;
  }
  while (v16 != 4);

  return v17;
}

- (void)setBadgeCount:(unint64_t)a3 forBundleID:(id)a4 badgeType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *syncQueue;
  id v16;
  NSObject *v17;
  _BOOL8 v18;
  id v19;
  NSObject *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  GKBadgeController *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t buf[4];
  id v30;

  v8 = a4;
  v9 = v8;
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v8);
  v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKBadgeController: setBadgeCount", buf, 2u);
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared")),
        v13 = objc_msgSend(v12, "multiplayerAllowedPlayerType"),
        v12,
        !v13))
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v14);
    v17 = os_log_GKTrace;
    v18 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "setBadgeCount: Ignoring TB and sessions badge count, multiplayer is restricted", buf, 2u);
    }
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(v18);
    v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ignoring turn-based and sessions badge count update for %@ as multiplayer is restricted", buf, 0xCu);
    }
  }
  else
  {
    if (!v9)
      v9 = GKGameCenterIdentifier;
    syncQueue = self->_syncQueue;
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000DB24C;
    v24 = &unk_1002C22E8;
    v25 = self;
    v27 = a5;
    v9 = v9;
    v26 = v9;
    v28 = a3;
    dispatch_async(syncQueue, &v21);
    -[GKBadgeController synchronize](self, "synchronize", v21, v22, v23, v24, v25);

  }
}

- (void)badgeAllApplications
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB338;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

- (void)unbadgeAllApplications
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB57C;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(syncQueue, block);
  -[GKBadgeController synchronize](self, "synchronize");
}

- (void)registerBadgePermissionForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *syncQueue;
  _QWORD block[5];
  id v15;
  id v16;
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKBadgeController: registerBadgePermissionForBundleID:", buf, 2u);
  }
  if (v6 && (objc_msgSend(v6, "isEqualToString:", GKGameCenterIdentifier) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationProxyForBundleID:", v6));
    if (objc_msgSend(v12, "isInstalled") && (objc_msgSend(v12, "isRestricted") & 1) == 0)
    {
      syncQueue = self->_syncQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000DB880;
      block[3] = &unk_1002BB568;
      block[4] = self;
      v15 = v6;
      v16 = v8;
      dispatch_async(syncQueue, block);

    }
  }

}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_syncQueue, 0);
  v3 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
