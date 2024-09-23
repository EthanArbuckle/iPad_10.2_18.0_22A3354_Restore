@implementation IMUbiquityStatusMonitor

- (IMUbiquityStatusMonitor)init
{
  return -[IMUbiquityStatusMonitor initWithContainerIdentifier:](self, "initWithContainerIdentifier:", CFSTR("iCloud.com.apple.iBooks"));
}

- (IMUbiquityStatusMonitor)initWithContainerIdentifier:(id)a3
{
  id v5;
  IMUbiquityStatusMonitor *v6;
  IMUbiquityStatusMonitor *v7;
  uint64_t v8;
  NSHashTable *observers;
  dispatch_queue_t v10;
  OS_dispatch_queue *containerQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *notifyQueue;
  void *v16;
  void *v17;
  NSObject *v18;
  IMUbiquityStatusMonitor *v19;
  void *v20;
  _QWORD block[4];
  IMUbiquityStatusMonitor *v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMUbiquityStatusMonitor;
  v6 = -[IMUbiquityStatusMonitor init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v10 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.containerQueue", 0);
    containerQueue = v7->_containerQueue;
    v7->_containerQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.dispatchQueue", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.notifyQueue", 0);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("nonNilUbiquityIdentityToken")));
    v7->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = v17 != 0;

    v7->_archivedCloudDriveOptedIn = +[BCSyncUserDefaults archivedICloudDriveSyncOptedInBeforeInitialTCCSync](BCSyncUserDefaults, "archivedICloudDriveSyncOptedInBeforeInitialTCCSync");
    v18 = v7->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_48A8C;
    block[3] = &unk_28B960;
    v19 = v7;
    v23 = v19;
    dispatch_async(v18, block);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v19, "p_ubiquityIdentityDidChange:", NSUbiquityIdentityDidChangeNotification, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMUbiquityStatusMonitor;
  -[IMUbiquityStatusMonitor dealloc](&v4, "dealloc");
}

- (BCICloudIdentityToken)ubiquityIdentityToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_48BD4;
  v11 = sub_48BE4;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_48BEC;
  v6[3] = &unk_28B700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BCICloudIdentityToken *)v4;
}

- (BOOL)dq_isICloudDriveEnabled
{
  unsigned int v2;
  _BOOL4 v3;
  const __CFString *v4;
  id v5;
  NSObject *v6;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;

  v2 = +[BCSyncUserDefaults isICloudDriveSyncOptedIn](BCSyncUserDefaults, "isICloudDriveSyncOptedIn");
  if (v2)
  {
    v3 = +[BCSyncUserDefaults isGlobalICloudDriveSyncOptedIn](BCSyncUserDefaults, "isGlobalICloudDriveSyncOptedIn");
    if (v3)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
  }
  else
  {
    v3 = 0;
    v4 = CFSTR("NO");
  }
  v5 = BCUbiquityEnabledLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("YES");
    if (v2)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    if (!v3)
      v8 = CFSTR("NO");
    v13 = v4;
    v14 = 2112;
    v15 = v8;
    _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "BCUbiquityStatusMonitor: dq_isICloudDriveEnabled: isICloudDriveSyncOptedIn = %@, globalICloudDrive = %@, isICloudDriveEnabled = %@", (uint8_t *)&v10, 0x20u);
  }

  return v3;
}

- (BOOL)isICloudDriveEnabled
{
  IMUbiquityStatusMonitor *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_48E04;
  v5[3] = &unk_28B700;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9[5];
  id v10;

  v7 = a3;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_48EF8;
    v9[3] = (uint64_t)&unk_28B808;
    v9[4] = (uint64_t)self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 124, (uint64_t)"-[IMUbiquityStatusMonitor addObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }

}

- (void)removeObserver:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9[5];
  id v10;

  v7 = a3;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_4905C;
    v9[3] = (uint64_t)&unk_28B808;
    v9[4] = (uint64_t)self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 137, (uint64_t)"-[IMUbiquityStatusMonitor removeObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }

}

- (void)registerCoordinatingObserver:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9[5];
  id v10;

  v7 = a3;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_491A0;
    v9[3] = (uint64_t)&unk_28B808;
    v9[4] = (uint64_t)self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 152, (uint64_t)"-[IMUbiquityStatusMonitor registerCoordinatingObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }

}

- (void)restartObserving
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4926C;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dq_archiveCurrentUbiquityIdentityToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor currentUbiquityIdentityToken](self, "currentUbiquityIdentityToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ubiquityIdentityToken"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor currentUbiquityIdentityToken](self, "currentUbiquityIdentityToken"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor currentUbiquityIdentityToken](self, "currentUbiquityIdentityToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "token"));
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("nonNilUbiquityIdentityToken"));

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "synchronize");

}

- (void)p_ubiquityIdentityDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor dispatchQueue](self, "dispatchQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_496E0;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_notifyObserversForChangesWithCurrentToken:(id)a3 lastToken:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v17 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor observers](self, "observers"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "ubiquityStatusChangedToAvailableWithNewIdentity:oldIdentity:") & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor notifyQueue](self, "notifyQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_49AD4;
          block[3] = &unk_28C5F0;
          v23 = v17;
          v24 = v6;
          v25 = v12;
          dispatch_async(v13, block);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor coordinatingObserver](self, "coordinatingObserver"));
  v15 = (void *)v14;
  if (v14
    && (objc_opt_respondsToSelector(v14, "ubiquityStatusChangedToAvailableWithNewIdentity:oldIdentity:") & 1) != 0)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor notifyQueue](self, "notifyQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_49B90;
    v18[3] = &unk_28C5F0;
    v19 = v17;
    v20 = v6;
    v21 = v15;
    dispatch_async(v16, v18);

  }
}

- (void)_notifyObserversForUnchangedWithCurrentToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor observers](self, "observers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "ubiquityStatusUnchangedWithIdentity:") & 1) != 0)
        {
          v11 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor notifyQueue](self, "notifyQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_49E68;
          block[3] = &unk_28B808;
          v19 = v4;
          v20 = v10;
          dispatch_async(v11, block);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v12 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor coordinatingObserver](self, "coordinatingObserver"));
  v13 = (void *)v12;
  if (v12 && (objc_opt_respondsToSelector(v12, "ubiquityStatusUnchangedWithIdentity:") & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor notifyQueue](self, "notifyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_49F14;
    v15[3] = &unk_28B808;
    v16 = v4;
    v17 = v13;
    dispatch_async(v14, v15);

  }
}

- (void)dq_refreshUbiquityAvailabilityStatus
{
  BCICloudIdentityToken *v3;
  BCICloudIdentityToken *currentUbiquityIdentityToken;
  BCICloudIdentityToken *v5;
  void *v6;
  void *v7;
  BCICloudIdentityToken *v8;
  BCICloudIdentityToken *lastArchivedUbiquityIdentityToken;
  id v10;
  NSObject *v11;
  BCICloudIdentityToken *v12;
  NSObject *v13;
  NSObject *v14;
  void (*v15)(uint64_t);
  void ***v16;
  void *v17;
  BCICloudIdentityToken *v18;
  BCICloudIdentityToken *v19;
  void **v20;
  void **v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  BCICloudIdentityToken *v25;
  __int16 v26;
  BCICloudIdentityToken *v27;

  +[BCSyncUserDefaults syncDefaultsWithTCC](BCSyncUserDefaults, "syncDefaultsWithTCC");
  v3 = (BCICloudIdentityToken *)objc_claimAutoreleasedReturnValue(+[BCICloudIdentityToken tokenForCurrentIdentityIfICloudDriveEnabled](BCICloudIdentityToken, "tokenForCurrentIdentityIfICloudDriveEnabled"));
  currentUbiquityIdentityToken = self->_currentUbiquityIdentityToken;
  self->_currentUbiquityIdentityToken = v3;

  v5 = [BCICloudIdentityToken alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("ubiquityIdentityToken")));
  v8 = -[BCICloudIdentityToken initFromArchive:](v5, "initFromArchive:", v7);
  lastArchivedUbiquityIdentityToken = self->_lastArchivedUbiquityIdentityToken;
  self->_lastArchivedUbiquityIdentityToken = v8;

  v10 = BCUbiquityEnabledLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor containerIdentifier](self, "containerIdentifier"));
    v18 = self->_currentUbiquityIdentityToken;
    v19 = self->_lastArchivedUbiquityIdentityToken;
    *(_DWORD *)buf = 138412802;
    v23 = v17;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "BCUbiquityStatusMonitor: dq_refreshUbiquityAvailabilityStatus container:%@ current::%@ oldToken:%@", buf, 0x20u);

  }
  v12 = self->_currentUbiquityIdentityToken;
  v13 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor containerQueue](self, "containerQueue"));
  v14 = v13;
  if (v12)
  {
    v21 = _NSConcreteStackBlock;
    v15 = sub_4A184;
    v16 = &v21;
  }
  else
  {
    v20 = _NSConcreteStackBlock;
    v15 = sub_4A7A8;
    v16 = &v20;
  }
  v16[1] = (void **)3221225472;
  v16[2] = (void **)v15;
  v16[3] = (void **)&unk_28B960;
  v16[4] = (void **)&self->super.isa;
  dispatch_async(v13, v16);

}

- (NSURL)containerURL
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_48BD4;
  v11 = sub_48BE4;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor containerQueue](self, "containerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4A910;
  v6[3] = &unk_28B700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (NSURL)documentsURL
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_48BD4;
  v11 = sub_48BE4;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor containerQueue](self, "containerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4AA04;
  v6[3] = &unk_28B700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[IMUbiquityStatusMonitor isICloudDriveEnabled](self, "isICloudDriveEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor containerURL](self, "containerURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor documentsURL](self, "documentsURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) iCloudDrive=%@ containerURL='%@' documentsURL='%@'"), v5, self, v6, v7, v8));

  return v9;
}

- (id)makeOSStateHandler
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc((Class)BUOSStateHandler);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4ABA4;
  v5[3] = &unk_28D628;
  objc_copyWeak(&v6, &location);
  v3 = objc_msgSend(v2, "initWithTitle:block:", CFSTR("BCUbiquityStatusMonitor"), v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_stateForLog
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v8;
  const __CFString *v9;

  v8 = CFSTR("ubiquityIdentityToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor ubiquityIdentityToken](self, "ubiquityIdentityToken"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "token"));
  v4 = (void *)v3;
  v5 = &stru_296430;
  if (v3)
    v5 = (const __CFString *)v3;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  return v6;
}

- (void)setContainerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDocumentsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BCICloudIdentityToken)lastArchivedUbiquityIdentityToken
{
  return self->_lastArchivedUbiquityIdentityToken;
}

- (void)setLastArchivedUbiquityIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BCICloudIdentityToken)lastArchivedNonNilUbiquityIdentityToken
{
  return self->_lastArchivedNonNilUbiquityIdentityToken;
}

- (void)setLastArchivedNonNilUbiquityIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BCICloudIdentityToken)currentUbiquityIdentityToken
{
  return self->_currentUbiquityIdentityToken;
}

- (void)setCurrentUbiquityIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)archivedCloudDriveOptedIn
{
  return self->_archivedCloudDriveOptedIn;
}

- (void)setArchivedCloudDriveOptedIn:(BOOL)a3
{
  self->_archivedCloudDriveOptedIn = a3;
}

- (BOOL)lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch
{
  return self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch;
}

- (void)setLastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3
{
  self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_containerQueue, a3);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (IMUbiquityStatusChangeObserving)coordinatingObserver
{
  return (IMUbiquityStatusChangeObserving *)objc_loadWeakRetained((id *)&self->_coordinatingObserver);
}

- (void)setCoordinatingObserver:(id)a3
{
  objc_storeWeak((id *)&self->_coordinatingObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinatingObserver);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedNonNilUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end
