@implementation BCJSConfiguration

+ (id)getInstance
{
  return +[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance");
}

+ (BCJSConfiguration)sharedInstance
{
  if (qword_30DB58 != -1)
    dispatch_once(&qword_30DB58, &stru_28F0B0);
  return (BCJSConfiguration *)(id)qword_30DB50;
}

- (id)_init
{
  BCJSConfiguration *v2;
  BCJSConfiguration *v3;
  NSDictionary *overrides;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BCJSConfiguration;
  v2 = -[BCJSConfiguration init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    overrides = v2->_overrides;
    v2->_overrides = 0;

    v3->_accessLock._os_unfair_lock_opaque = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3->_overrideAlgorithm = objc_msgSend(v5, "BOOLForKey:", CFSTR("BCOverrideRecentBookAlgorithm"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3->_overridePercentage = objc_msgSend(v6, "BOOLForKey:", CFSTR("BCOverrideMarkFinishedPercentage"));

    if (v3->_overrideAlgorithm)
    {
      v7 = BCJSConfigurationLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using overridden values for recent book algorithm.", v12, 2u);
      }

    }
    if (v3->_overridePercentage)
    {
      v9 = BCJSConfigurationLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Using overridden values for mark finished percentage.", v12, 2u);
      }

    }
  }
  return v3;
}

- (void)updateConfiguration:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  BCJSConfiguration *v12;
  id v13;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = BCJSConfigurationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Updating configuration with %{public}@.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x3032000000;
  v17 = sub_795E8;
  v18 = sub_795F8;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v10 = sub_79600;
  v11 = &unk_28C430;
  v12 = self;
  v7 = v4;
  v13 = v7;
  p_buf = &buf;
  v8 = v9;
  os_unfair_lock_lock(&self->_accessLock);
  v10((uint64_t)v8);
  os_unfair_lock_unlock(&self->_accessLock);

  -[BCJSConfiguration _notifyObservers:](self, "_notifyObservers:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = BCJSConfigurationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1B4FE8();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCJSConfiguration observers](self, "observers"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[BCJSConfiguration setObservers:](self, "setObservers:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCJSConfiguration observers](self, "observers"));
  objc_msgSend(v9, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  v5 = BCJSConfigurationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1B5048();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCJSConfiguration observers](self, "observers"));
  objc_msgSend(v7, "removeObject:", v4);

}

- (void)_notifyObservers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = BCJSConfigurationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1B50A8(v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCJSConfiguration observers](self, "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "javascriptConfiguration:updatedKeys:", self, v4);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSNumber)markFinishedPercentageOverride
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  double v7;
  id v8;
  NSObject *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", CFSTR("BCMarkFinishedPercentage")));

  v5 = -[BCJSConfiguration overridePercentage](self, "overridePercentage");
  v6 = 0;
  if (v5 && v4)
  {
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v4, "doubleValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 / 100.0));
      v8 = BCJSConfigurationLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_1B50E8();

    }
    else
    {
      v6 = 0;
    }
  }

  return (NSNumber *)v6;
}

- (NSDate)oldestDateToAvoidPurgeOfBooks
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  BCJSConfiguration *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_795E8;
  v27 = sub_795F8;
  v28 = 0;
  p_accessLock = &self->_accessLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_79CA0;
  v20 = &unk_28B700;
  v21 = self;
  v22 = &v23;
  v4 = v18;
  os_unfair_lock_lock(p_accessLock);
  v19((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCInvalidationWindowOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v24[5];
    v24[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5148();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v14 = (void *)v24[5];
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v15 * 60.0 * -60.0));

    v13 = (void *)v16;
  }

  _Block_object_dispose(&v23, 8);
  return (NSDate *)v13;
}

- (NSDate)oldestDateToAvoidPurgeOfSamples
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  BCJSConfiguration *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_795E8;
  v27 = sub_795F8;
  v28 = 0;
  p_accessLock = &self->_accessLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_79F20;
  v20 = &unk_28B700;
  v21 = self;
  v22 = &v23;
  v4 = v18;
  os_unfair_lock_lock(p_accessLock);
  v19((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCInvalidationWindowForSamplesOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v24[5];
    v24[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5148();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v14 = (void *)v24[5];
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v15 * 60.0 * -60.0));

    v13 = (void *)v16;
  }

  _Block_object_dispose(&v23, 8);
  return (NSDate *)v13;
}

- (NSNumber)launchesRequiredToPurge
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  void *v4;
  id v5;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  BCJSConfiguration *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_795E8;
  v16 = sub_795F8;
  v17 = 0;
  p_accessLock = &self->_accessLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v8 = sub_7A0B4;
  v9 = &unk_28B700;
  v10 = self;
  v11 = &v12;
  v3 = v7;
  os_unfair_lock_lock(p_accessLock);
  v8((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  v4 = (void *)v13[5];
  if (!v4)
  {
    v13[5] = (uint64_t)&off_2A9548;

    v4 = (void *)v13[5];
  }
  v5 = v4;
  _Block_object_dispose(&v12, 8);

  return (NSNumber *)v5;
}

- (NSDate)oldestDateToKeepFinished
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  BCJSConfiguration *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_795E8;
  v27 = sub_795F8;
  v28 = 0;
  p_accessLock = &self->_accessLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_7A334;
  v20 = &unk_28B700;
  v21 = self;
  v22 = &v23;
  v4 = v18;
  os_unfair_lock_lock(p_accessLock);
  v19((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCFinishedWindowOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v24[5];
    v24[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B51A8();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v14 = (void *)v24[5];
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v15 * 60.0 * -60.0));

    v13 = (void *)v16;
  }

  _Block_object_dispose(&v23, 8);
  return (NSDate *)v13;
}

- (NSDate)oldestDateForUpgrade
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  BCJSConfiguration *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_795E8;
  v27 = sub_795F8;
  v28 = 0;
  p_accessLock = &self->_accessLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_7A5B4;
  v20 = &unk_28B700;
  v21 = self;
  v22 = &v23;
  v4 = v18;
  os_unfair_lock_lock(p_accessLock);
  v19((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCUpgradeWindowOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v24[5];
    v24[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5208();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v14 = (void *)v24[5];
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v15 * 60.0 * -60.0));

    v13 = (void *)v16;
  }

  _Block_object_dispose(&v23, 8);
  return (NSDate *)v13;
}

- (NSNumber)timeThresholdForPromotion
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  BCJSConfiguration *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_795E8;
  v26 = sub_795F8;
  v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_7A808;
  v19 = &unk_28B700;
  v20 = self;
  v21 = &v22;
  v4 = v17;
  os_unfair_lock_lock(p_accessLock);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCTimeThresholdPromotionOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v23[5];
    v23[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5268();

  }
  v13 = (void *)v23[5];
  if (v13)
    v14 = v13;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 30.0));
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return (NSNumber *)v15;
}

- (NSNumber)timeThresholdForSamplePromotion
{
  return (NSNumber *)&off_2B3010;
}

- (NSNumber)validCollectionPeriod
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  _QWORD v16[2];
  void (*v17)(uint64_t);
  void *v18;
  BCJSConfiguration *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_795E8;
  v25 = sub_795F8;
  v26 = 0;
  p_accessLock = &self->_accessLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_7AA58;
  v18 = &unk_28B700;
  v19 = self;
  v20 = &v21;
  v4 = v16;
  os_unfair_lock_lock(p_accessLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCValidCollectionPeriodOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v22[5];
    v22[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B52C8();

  }
  v13 = (_UNKNOWN **)v22[5];
  if (!v13)
    v13 = &off_2B3020;
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return (NSNumber *)v14;
}

- (NSNumber)timeThresholdForOpenEvent
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  _QWORD v16[2];
  void (*v17)(uint64_t);
  void *v18;
  BCJSConfiguration *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_795E8;
  v25 = sub_795F8;
  v26 = 0;
  p_accessLock = &self->_accessLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_7AC9C;
  v18 = &unk_28B700;
  v19 = self;
  v20 = &v21;
  v4 = v16;
  os_unfair_lock_lock(p_accessLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCTimeThresholdForOpenEvent")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (void *)v22[5];
    v22[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5328();

  }
  v13 = (_UNKNOWN **)v22[5];
  if (!v13)
    v13 = &off_2B3030;
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return (NSNumber *)v14;
}

- (NSNumber)numberOfBooksAllowedInRecentsList
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  _QWORD v16[2];
  void (*v17)(uint64_t);
  void *v18;
  BCJSConfiguration *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_795E8;
  v25 = sub_795F8;
  v26 = 0;
  p_accessLock = &self->_accessLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_7AEE4;
  v18 = &unk_28B700;
  v19 = self;
  v20 = &v21;
  v4 = v16;
  os_unfair_lock_lock(p_accessLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCNumberOfBooksAllowedInRecentsList")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue")));
    v10 = (void *)v22[5];
    v22[5] = v9;

    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5388();

  }
  v13 = (_UNKNOWN **)v22[5];
  if (!v13)
    v13 = &off_2A9560;
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return (NSNumber *)v14;
}

- (NSDate)dateRequiredForActiveBook
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCJSConfiguration dateSinceLastActiveOverride](self, "dateSinceLastActiveOverride"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -2592000.0));
  v5 = v4;

  return (NSDate *)v5;
}

- (NSDate)dateSinceLastActiveOverride
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  BCJSConfiguration *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_795E8;
  v27 = sub_795F8;
  v28 = 0;
  p_accessLock = &self->_accessLock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_7B1BC;
  v20 = &unk_28B700;
  v21 = self;
  v22 = &v23;
  v4 = v18;
  os_unfair_lock_lock(p_accessLock);
  v19((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("BCWindowForActiveBookOverride")));

  v7 = -[BCJSConfiguration overrideAlgorithm](self, "overrideAlgorithm");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "doubleValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v9));
    v11 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B5448();
  }
  else
  {
    v13 = (void *)v24[5];
    if (!v13)
    {
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v13, "doubleValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v14));
    v15 = BCJSConfigurationLog();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1B53E8();
  }

LABEL_13:
  v16 = v10;

  _Block_object_dispose(&v23, 8);
  return (NSDate *)v16;
}

- (double)openBookDefaultBehaviorOverride
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  BCJSConfiguration *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_795E8;
  v20 = sub_795F8;
  v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v12 = sub_7B390;
  v13 = &unk_28B700;
  v14 = self;
  v15 = &v16;
  v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = v17[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("BCOpenBookDefaultBehaviorOverride")));
  -[BCJSConfiguration expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:](self, "expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:", v5, v7, 1, CFSTR("default behavior"));
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)openBookOpenBehaviorOverride
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  BCJSConfiguration *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_795E8;
  v20 = sub_795F8;
  v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v12 = sub_7B564;
  v13 = &unk_28B700;
  v14 = self;
  v15 = &v16;
  v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = v17[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("BCOpenBookOpenBehaviorOverride")));
  -[BCJSConfiguration expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:](self, "expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:", v5, v7, 7, CFSTR("open book behavior"));
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)openBookClosedSpreadBehaviorOverride
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  BCJSConfiguration *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_795E8;
  v20 = sub_795F8;
  v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v12 = sub_7B738;
  v13 = &unk_28B700;
  v14 = self;
  v15 = &v16;
  v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = v17[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("BCOpenBookClosedSpreadBehaviorOverride")));
  -[BCJSConfiguration expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:](self, "expectedResultForJSOverride:andDefaultsOverride:defaultValue:forBehavior:", v5, v7, 90, CFSTR("closed spread open book behavior"));
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)expectedResultForJSOverride:(id)a3 andDefaultsOverride:(id)a4 defaultValue:(int64_t)a5 forBehavior:(id)a6
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  double v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v10 && objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
    v14 = BCJSConfigurationLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1B5508();
  }
  else
  {
    if (!v9)
    {
      v13 = (double)a5;
      goto LABEL_10;
    }
    objc_msgSend(v9, "doubleValue");
    v13 = v16;
    v17 = BCJSConfigurationLog();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1B54A8();
  }

LABEL_10:
  return v13;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)overrideAlgorithm
{
  return self->_overrideAlgorithm;
}

- (BOOL)overridePercentage
{
  return self->_overridePercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
