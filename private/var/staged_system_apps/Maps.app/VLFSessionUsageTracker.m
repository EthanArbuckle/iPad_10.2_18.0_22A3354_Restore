@implementation VLFSessionUsageTracker

+ (VLFSessionUsageTracker)sharedInstance
{
  if (qword_1014D3F68 != -1)
    dispatch_once(&qword_1014D3F68, &stru_1011E2840);
  return (VLFSessionUsageTracker *)(id)qword_1014D3F60;
}

- (VLFSessionUsageTracker)init
{
  VLFSessionUsageTracker *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VLFSessionUsageTracker;
  v2 = -[VLFSessionUsageTracker init](&v7, "init");
  if (v2)
  {
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionActiveUIEnabled, off_1014B37D8, &_dispatch_main_q, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("kVLFSessionUsageLocalizationSuccessKey"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("kVLFSessionUsageLocalizationSuccessKey"));

      -[VLFSessionUsageTracker setNumberOfTimesVLFLocalized:](v2, "setNumberOfTimesVLFLocalized:", (char *)-[VLFSessionUsageTracker numberOfTimesVLFLocalized](v2, "numberOfTimesVLFLocalized") + 1);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionUsageTracker;
  -[VLFSessionUsageTracker dealloc](&v3, "dealloc");
}

- (BOOL)hasUserEnteredVLF
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageVLFWasEnteredKey")));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasUserSeenVLFCallout
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("kVLFSessionUsageCalloutWasShownKey")) & 1) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = !-[VLFSessionUsageTracker isVLFCalloutEnabled](self, "isVLFCalloutEnabled");

  return v4;
}

- (BOOL)hasVLFEverLocalized
{
  return -[VLFSessionUsageTracker numberOfTimesVLFLocalized](self, "numberOfTimesVLFLocalized") > 0;
}

- (int64_t)numberOfTimesVLFLocalized
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("kVLFSessionUsageLocalizationSuccessCountKey"));

  return (int64_t)v3;
}

- (void)setNumberOfTimesVLFLocalized:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("kVLFSessionUsageLocalizationSuccessCountKey"));

}

- (unint64_t)numberOfCalloutTaps
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageCalloutTapsKey")));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unint64_t)numberOfCalloutDismissals
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageCalloutDismissalsKey")));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unint64_t)numberOfCalloutInteractions
{
  unint64_t v3;

  v3 = -[VLFSessionUsageTracker numberOfCalloutTaps](self, "numberOfCalloutTaps");
  return -[VLFSessionUsageTracker numberOfCalloutDismissals](self, "numberOfCalloutDismissals") + v3;
}

- (double)timeSinceLastVLFInteraction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  double v16;
  void *i;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageCalloutDismissalsKey")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("kVLFSessionUsageCalloutTapsKey")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("kVLFSessionUsageVLFWasEnteredKey")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v10;
  if (v4)
    objc_msgSend(v10, "addObject:", v4);
  if (v7)
    objc_msgSend(v11, "addObject:", v7);
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  if (objc_msgSend(v11, "count"))
  {
    v24 = v7;
    v25 = v4;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      v16 = 1.79769313e308;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v24, v25, (_QWORD)v26));
          objc_msgSend(v19, "timeIntervalSinceDate:", v18);
          if (v16 >= v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v21, "timeIntervalSinceDate:", v18);
            v16 = v22;

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 1.79769313e308;
    }

    v7 = v24;
    v4 = v25;
  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

- (void)registerUserEnteredVLF
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316418;
        v20 = "-[VLFSessionUsageTracker registerUserEnteredVLF]";
        v21 = 2080;
        v22 = "VLFSessionUsageTracker.m";
        v23 = 1024;
        v24 = 141;
        v25 = 2080;
        v26 = "dispatch_get_main_queue()";
        v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v19 = 138412290;
          v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

        }
      }
    }
  }
  v6 = sub_100B007FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering user entered VLF", (uint8_t *)&v19, 2u);
  }

  v8 = NSStringFromSelector("hasUserEnteredVLF");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("kVLFSessionUsageVLFWasEnteredKey"));

  v12 = NSStringFromSelector("hasUserEnteredVLF");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v13);

}

- (void)registerUserWasShownCallout
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316418;
        v19 = "-[VLFSessionUsageTracker registerUserWasShownCallout]";
        v20 = 2080;
        v21 = "VLFSessionUsageTracker.m";
        v22 = 1024;
        v23 = 152;
        v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

        }
      }
    }
  }
  v6 = sub_100B007FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering user was shown callout", (uint8_t *)&v18, 2u);
  }

  v8 = NSStringFromSelector("hasUserSeenVLFCallout");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "setBool:forKey:", 1, CFSTR("kVLFSessionUsageCalloutWasShownKey"));

  v11 = NSStringFromSelector("hasUserSeenVLFCallout");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v12);

}

- (void)registerUserDismissedCallout
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSArray *v9;
  id v10;
  void *v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = "-[VLFSessionUsageTracker registerUserDismissedCallout]";
        v25 = 2080;
        v26 = "VLFSessionUsageTracker.m";
        v27 = 1024;
        v28 = 163;
        v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v23,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v6 = sub_100B007FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering user dismissed callout", (uint8_t *)&v23, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("kVLFSessionUsageCalloutDismissalsKey")));

  if (!v9)
    v9 = objc_opt_new(NSArray);
  v10 = -[NSArray mutableCopy](v9, "mutableCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "addObject:", v11);

  if (objc_msgSend(v10, "count") == (id)11)
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
  v12 = objc_msgSend(v10, "copy");

  v13 = NSStringFromSelector("numberOfCalloutDismissals");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("kVLFSessionUsageCalloutDismissalsKey"));

  v16 = NSStringFromSelector("numberOfCalloutDismissals");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v17);

}

- (void)registerUserTappedCallout
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSArray *v9;
  id v10;
  void *v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = "-[VLFSessionUsageTracker registerUserTappedCallout]";
        v25 = 2080;
        v26 = "VLFSessionUsageTracker.m";
        v27 = 1024;
        v28 = 188;
        v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v23,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v6 = sub_100B007FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering user tapped callout", (uint8_t *)&v23, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("kVLFSessionUsageCalloutTapsKey")));

  if (!v9)
    v9 = objc_opt_new(NSArray);
  v10 = -[NSArray mutableCopy](v9, "mutableCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "addObject:", v11);

  if (objc_msgSend(v10, "count") == (id)11)
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
  v12 = objc_msgSend(v10, "copy");

  v13 = NSStringFromSelector("numberOfCalloutTaps");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("kVLFSessionUsageCalloutTapsKey"));

  v16 = NSStringFromSelector("numberOfCalloutTaps");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v17);

}

- (void)registerLocalizationSuccess
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = "-[VLFSessionUsageTracker registerLocalizationSuccess]";
        v19 = 2080;
        v20 = "VLFSessionUsageTracker.m";
        v21 = 1024;
        v22 = 213;
        v23 = 2080;
        v24 = "dispatch_get_main_queue()";
        v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  v6 = sub_100B007FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering localization success", (uint8_t *)&v17, 2u);
  }

  v8 = NSStringFromSelector("numberOfTimesVLFLocalized");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  -[VLFSessionUsageTracker setNumberOfTimesVLFLocalized:](self, "setNumberOfTimesVLFLocalized:", (char *)-[VLFSessionUsageTracker numberOfTimesVLFLocalized](self, "numberOfTimesVLFLocalized") + 1);
  v10 = NSStringFromSelector("numberOfTimesVLFLocalized");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v11);

}

- (id)allCalloutDismissalDates
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageCalloutDismissalsKey")));

  return v3;
}

- (id)allCalloutTapDates
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kVLFSessionUsageCalloutTapsKey")));

  return v3;
}

- (void)clearAll
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing all usage counts", v5, 2u);
  }

  -[VLFSessionUsageTracker clearUserEnteredVLFFlag](self, "clearUserEnteredVLFFlag");
  -[VLFSessionUsageTracker clearUserWasShownVLFCalloutFlag](self, "clearUserWasShownVLFCalloutFlag");
  -[VLFSessionUsageTracker clearSuccessfulVLFLocalizations](self, "clearSuccessfulVLFLocalizations");
  -[VLFSessionUsageTracker clearDismissals](self, "clearDismissals");
  -[VLFSessionUsageTracker clearTaps](self, "clearTaps");
}

- (void)clearUserEnteredVLFFlag
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing user entered VLF flag", v10, 2u);
  }

  v5 = NSStringFromSelector("hasUserEnteredVLF");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kVLFSessionUsageVLFWasEnteredKey"));

  v8 = NSStringFromSelector("hasUserEnteredVLF");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)clearUserWasShownVLFCalloutFlag
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing was shown VLF callout flag", v10, 2u);
  }

  v5 = NSStringFromSelector("hasUserSeenVLFCallout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kVLFSessionUsageCalloutWasShownKey"));

  v8 = NSStringFromSelector("hasUserSeenVLFCallout");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)clearSuccessfulVLFLocalizations
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing successful VLF localizations", v10, 2u);
  }

  v5 = NSStringFromSelector("numberOfTimesVLFLocalized");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kVLFSessionUsageLocalizationSuccessCountKey"));

  v8 = NSStringFromSelector("numberOfTimesVLFLocalized");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)clearDismissals
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing dismissals", v10, 2u);
  }

  v5 = NSStringFromSelector("numberOfCalloutDismissals");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kVLFSessionUsageCalloutDismissalsKey"));

  v8 = NSStringFromSelector("numberOfCalloutDismissals");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)clearTaps
{
  id v3;
  NSObject *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100B007FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing taps", v10, 2u);
  }

  v5 = NSStringFromSelector("numberOfCalloutTaps");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("kVLFSessionUsageCalloutTapsKey"));

  v8 = NSStringFromSelector("numberOfCalloutTaps");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (BOOL)isVLFCalloutEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionActiveUIEnabled, off_1014B37D8);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  NSString *v15;
  void *v16;
  unsigned __int8 v17;
  NSString *v18;
  void *v19;
  unsigned __int8 v20;
  objc_super v21;

  v4 = a3;
  v5 = NSStringFromSelector("numberOfCalloutDismissals");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (objc_msgSend(v4, "isEqualToString:", v6))
    goto LABEL_8;
  v7 = NSStringFromSelector("numberOfCalloutTaps");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(v4, "isEqualToString:", v8))
  {
LABEL_7:

LABEL_8:
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v9 = NSStringFromSelector("numberOfTimesVLFLocalized");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (objc_msgSend(v4, "isEqualToString:", v10))
  {
LABEL_6:

    goto LABEL_7;
  }
  v11 = NSStringFromSelector("hasUserSeenVLFCallout");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_msgSend(v4, "isEqualToString:", v12) & 1) != 0)
  {

    goto LABEL_6;
  }
  v15 = NSStringFromSelector("isVLFCalloutEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v4, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_9;
  v18 = NSStringFromSelector("hasVLFEverLocalized");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = objc_msgSend(v4, "isEqualToString:", v19);

  if ((v20 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___VLFSessionUsageTracker;
    v13 = objc_msgSendSuper2(&v21, "automaticallyNotifiesObserversForKey:", v4);
  }
LABEL_10:

  return v13;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  unsigned int v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  unsigned int v19;
  const char *v20;
  NSString *v21;
  void *v22;
  unsigned int v23;
  NSString *v24;
  id v26;
  objc_super v27;

  v4 = a3;
  v5 = NSStringFromSelector("numberOfCalloutInteractions");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (objc_msgSend(v4, "isEqualToString:", v6))
  {

LABEL_4:
    v10 = NSStringFromSelector("numberOfCalloutDismissals");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSStringFromSelector("numberOfCalloutTaps");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector("hasUserEnteredVLF");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v13, v15, 0));

    goto LABEL_10;
  }
  v7 = NSStringFromSelector("timeSinceLastVLFInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if (v9)
    goto LABEL_4;
  v17 = NSStringFromSelector("hasUserSeenVLFCallout");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_msgSend(v4, "isEqualToString:", v18);

  if (v19)
  {
    v20 = "isVLFCalloutEnabled";
  }
  else
  {
    v21 = NSStringFromSelector("hasVLFEverLocalized");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v4, "isEqualToString:", v22);

    if (!v23)
    {
      v27.receiver = a1;
      v27.super_class = (Class)&OBJC_METACLASS___VLFSessionUsageTracker;
      v26 = objc_msgSendSuper2(&v27, "keyPathsForValuesAffectingValueForKey:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
      goto LABEL_11;
    }
    v20 = "numberOfTimesVLFLocalized";
  }
  v24 = NSStringFromSelector(v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
LABEL_10:

LABEL_11:
  return v16;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  NSString *v10;
  void *v11;
  NSString *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  if (a3.var0 == (_DWORD)MapsConfig_VLFSessionActiveUIEnabled && a3.var1 == off_1014B37D8)
  {
    v10 = NSStringFromSelector("isVLFCalloutEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[VLFSessionUsageTracker willChangeValueForKey:](self, "willChangeValueForKey:", v11);

    v12 = NSStringFromSelector("isVLFCalloutEnabled");
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:");

  }
  else
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[VLFSessionUsageTracker valueChangedForGEOConfigKey:]";
      v16 = 2080;
      v17 = "VLFSessionUsageTracker.m";
      v18 = 1024;
      v19 = 334;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
}

@end
