@implementation NDSpringBoard

- (id)getBackgroundSettingsAppList
{
  void *v2;
  void *v3;
  void *v4;

  +[NSUserDefaults resetStandardUserDefaults](NSUserDefaults, "resetStandardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.mt")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("KeepAppsUpToDateAppList")));
  return v4;
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  NDSpringBoard *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010124;
  block[3] = &unk_1000B20B8;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (BOOL)application:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDSpringBoard assertionNameForSessionUUID:](self, "assertionNameForSessionUUID:", v10));
  v12 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "looking for background session %@ for bundle id %@", (uint8_t *)&v17, 0x16u);
  }
  if (v9)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

    os_unfair_lock_unlock(&self->_assertion_lock);
    if (v14)
      v15 = -[NDSpringBoard isValidAssertion:withName:](self, "isValidAssertion:withName:", v14, v11);
    else
      v15 = 0;

  }
  else
  {
    v15 = -[NDSpringBoard application:hasAssertionWithName:](self, "application:hasAssertionWithName:", v8, v11);
  }

  return v15;
}

- (BOOL)applicationIsForeground:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100061A00;
  v15 = sub_100061A10;
  v16 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FC98;
  block[3] = &unk_1000B20E0;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_sync(queue, block);
  LOBYTE(queue) = objc_msgSend((id)v12[5], "BOOLValue");

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

+ (id)sharedSpringBoard
{
  if (qword_1000C7138 != -1)
    dispatch_once(&qword_1000C7138, &stru_1000B1FD8);
  return (id)qword_1000C7140;
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000642C;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)monitoredBundleIDsUpdated
{
  RBSProcessMonitor *monitor;
  _QWORD v3[5];

  monitor = self->_monitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000062E0;
  v3[3] = &unk_1000B2028;
  v3[4] = self;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v3);
}

- (id)assertionNameForSessionUUID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.nsurlsessiond.handlesession %@"), a3));
}

- (BOOL)application:(id)a3 hasAssertionWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  os_unfair_lock_lock(&self->_assertion_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
  os_unfair_lock_unlock(&self->_assertion_lock);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100061AB0;
  v14[3] = &unk_1000B2108;
  v14[4] = self;
  v9 = v7;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
  v10 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v18 + 24))
      v11 = "found";
    else
      v11 = "could not find";
    *(_DWORD *)buf = 136315650;
    v22 = v11;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertion with name %@ for bundle id %@", buf, 0x20u);
  }
  v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)addObserver:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006CF8;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (NDSpringBoard)init
{
  NDSpringBoard *v2;
  NDSpringBoard *v3;
  NDSpringBoard *v4;
  uint64_t v5;
  RBSProcessMonitor *monitor;
  uint64_t v7;
  NSMutableDictionary *assertions;
  uint64_t v9;
  NSMutableDictionary *observers;
  uint64_t v11;
  NSMutableDictionary *appIsForeground;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  NSMutableDictionary *observedBackgroundSettings;
  uint64_t v17;
  NSMutableSet *monitoredBundleIDs;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  _QWORD v26[4];
  NDSpringBoard *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)NDSpringBoard;
  v2 = -[NDSpringBoard init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100062350;
    v26[3] = &unk_1000B2028;
    v4 = v2;
    v27 = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v26));
    monitor = v4->_monitor;
    v4->_monitor = (RBSProcessMonitor *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    assertions = v4->_assertions;
    v4->_assertions = (NSMutableDictionary *)v7;

    v4->_assertion_lock._os_unfair_lock_opaque = 0;
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    observers = v4->_observers;
    v4->_observers = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    appIsForeground = v4->_appIsForeground;
    v4->_appIsForeground = (NSMutableDictionary *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v4->_backgroundUpdatesAllowed = objc_msgSend(v13, "isAutomaticAppUpdatesAllowed");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_100062448, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    observedBackgroundSettings = v4->_observedBackgroundSettings;
    v4->_observedBackgroundSettings = (NSMutableDictionary *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    monitoredBundleIDs = v4->_monitoredBundleIDs;
    v4->_monitoredBundleIDs = (NSMutableSet *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.nsnetwork.SpringBoard-queue", v22);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v23;

  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NDSpringBoard;
  -[NDSpringBoard dealloc](&v4, "dealloc");
}

- (void)handleBackgroundSettingsChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061D30;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061C10;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061AF4;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)isValidAssertion:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  int v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "validating assertion %@", (uint8_t *)&v10, 0xCu);
    if (!v6)
      goto LABEL_6;
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "explanation"));
  if (!-[NSObject isEqualToString:](v7, "isEqualToString:", v6))
  {
    v8 = 0;
LABEL_7:

    goto LABEL_8;
  }
LABEL_6:
  v8 = objc_msgSend(v5, "isValid");
  if (v6)
    goto LABEL_7;
LABEL_8:

  return v8;
}

- (BOOL)applicationHasBackgroundTaskCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;

  v3 = a3;
  v4 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "looking for background task completion for bundle id %@", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v5, 0));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assertions"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "reason") == (id)4)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v9;
}

- (BOOL)applicationBackgroundUpdatesEnabled:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (self->_backgroundUpdatesAllowed)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_observedBackgroundSettings, "objectForKeyedSubscript:", v4));
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_onqueue_releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_assertion_lock;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  p_assertion_lock = &self->_assertion_lock;
  os_unfair_lock_lock(&self->_assertion_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v6));
    objc_msgSend(v11, "removeObjectForKey:", v7);

    os_unfair_lock_unlock(p_assertion_lock);
    v12 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalidating assertion for bundleID: %@. sessionID: %@", (uint8_t *)&v13, 0x16u);
    }
    objc_msgSend(v10, "invalidate");
  }
  else
  {
    os_unfair_lock_unlock(&self->_assertion_lock);
  }

}

- (void)releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061AA0;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (BOOL)takeAssertionForBundleID:(id)a3 sessionID:(id)a4 sessionUUID:(id)a5 pid:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  void *v41;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v32 = a5;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDSpringBoard assertionNameForSessionUUID:](self, "assertionNameForSessionUUID:"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.cfnetwork"), CFSTR("BackgroundDownload")));
  v13 = objc_alloc((Class)RBSAssertion);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", v6));
  v41 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  v16 = objc_msgSend(v13, "initWithExplanation:target:attributes:", v33, v14, v15);

  v34 = 0;
  v17 = objc_msgSend(v16, "acquireWithError:", &v34);
  v18 = v34;
  if ((v17 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    v20 = v19 == 0;

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertions, "setObject:forKeyedSubscript:", v21, v10);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v11));
    v24 = v23 == 0;

    if (!v24)
    {
      v25 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v10;
        v37 = 2112;
        v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "We already have an assertion for bundleID: %@, sessionID: %@", buf, 0x16u);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v11));
      objc_msgSend(v27, "invalidate");

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_assertions, "objectForKeyedSubscript:", v10));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, v11);

    os_unfair_lock_unlock(&self->_assertion_lock);
    v29 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "took assertion for %@, session %@, uuid %@", buf, 0x20u);
    }
  }
  else
  {
    v30 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v10;
      v37 = 2112;
      v38 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't create process assertion for %@ (%@)", buf, 0x16u);
    }
  }

  return v17;
}

- (BOOL)wakeUpApp:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NDSpringBoard *v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  intptr_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  unsigned __int8 v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  _BYTE *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  _BOOL4 v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];

  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v29 = a5;
  v10 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2112;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will request wake of app %@ for NDSession <%{public}@> with identifier %@", buf, 0x20u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v9, CFSTR("UIApplicationLaunchOptionsURLSessionKey"), v29));
  v51[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v51[1] = FBSOpenApplicationOptionKeyPayloadOptions;
  v52[0] = &__kCFBooleanTrue;
  v52[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
  v13 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = sub_100061A00;
  v49 = sub_100061A10;
  v50 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100061A00;
  v39 = sub_100061A10;
  v40 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v15 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v12));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100061A18;
  v31[3] = &unk_1000B2130;
  v33 = buf;
  v34 = &v35;
  v17 = v13;
  v32 = v17;
  objc_msgSend(v14, "openApplication:withOptions:completion:", v8, v16, v31);

  v18 = dispatch_time(0, 10000000000);
  v19 = dispatch_semaphore_wait(v17, v18);
  v20 = v36[5];
  if (v20 || (v23 = *(void **)(*(_QWORD *)&buf[8] + 40)) == 0)
  {
    v21 = qword_1000C7158;
    if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    *(_DWORD *)v41 = 138412802;
    v42 = v8;
    v43 = 2112;
    v44 = v20;
    v45 = 1024;
    v46 = v19 != 0;
    v26 = "Failed to open application %@, error: %@ timeout: %{BOOL}d";
    v27 = v21;
    v28 = 28;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, v41, v28);
    goto LABEL_5;
  }
  v24 = -[NDSpringBoard takeAssertionForBundleID:sessionID:sessionUUID:pid:](v15, "takeAssertionForBundleID:sessionID:sessionUUID:pid:", v8, v9, v30, objc_msgSend(v23, "pid"));
  v25 = qword_1000C7158;
  if ((v24 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    *(_DWORD *)v41 = 138412290;
    v42 = v8;
    v26 = "Failed to take process assertion for %@";
    v27 = v25;
    v28 = 12;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v41 = 138412290;
    v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully woke application %@ and took process assertion", v41, 0xCu);
  }
LABEL_5:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return 1;
}

- (BOOL)identifierIsForSpringBoardApplication:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  v5 = objc_msgSend(v4, "applicationIsInstalled:", v3);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_observedBackgroundSettings, 0);
  objc_storeStrong((id *)&self->_appIsForeground, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
