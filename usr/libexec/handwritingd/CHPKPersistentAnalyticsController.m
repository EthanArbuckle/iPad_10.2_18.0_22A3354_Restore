@implementation CHPKPersistentAnalyticsController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BA0;
  block[3] = &unk_1000247D8;
  block[4] = a1;
  if (qword_10002ADC8 != -1)
    dispatch_once(&qword_10002ADC8, block);
  return (id)qword_10002ADC0;
}

- (CHPKPersistentAnalyticsController)init
{
  CHPKPersistentAnalyticsController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  uint64_t v11;
  TIUserModelDataStore *dataStore;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHPKPersistentAnalyticsController;
  v2 = -[CHPKPersistentAnalyticsController init](&v14, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.handwritingd.analytics.scheduledEventsWorkerQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend((id)objc_opt_class(v2), "userModelDataStorePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[TIUserModelDataStore initializeDataStoreAtPath:](TIUserModelDataStore, "initializeDataStoreAtPath:", v10));
    dataStore = v2->_dataStore;
    v2->_dataStore = (TIUserModelDataStore *)v11;

  }
  return v2;
}

+ (id)userModelDataStorePath
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v2 = TI_USER_DIRECTORY(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Handwriting")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = 0;
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v12);
    v8 = v12;

    if (v8)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v9 = (id)qword_10002AE58;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to create directory for user store. %@", buf, 0xCu);
      }

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("TIUserData")));

  return v10;
}

+ (void)registerScheduledEventsActivity
{
  NSObject *v3;
  _QWORD handler[5];
  uint8_t buf[4];
  const __CFString *v6;

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v3 = (id)qword_10002AE58;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Preparing for %@ activity", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005F3C;
  handler[3] = &unk_100024868;
  handler[4] = a1;
  xpc_activity_register((const char *)objc_msgSend(CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity"), "UTF8String"), XPC_ACTIVITY_CHECK_IN, handler);
}

- (id)settingsDictionary
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  void *v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  _QWORD v31[4];
  void *v32;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v30[0] = CFSTR("PKLastSeenWhatsNewVersionKey");
  v30[1] = CFSTR("UIPencilOnlyDrawWithPencilKey");
  v31[0] = v2;
  v31[1] = v2;
  v30[2] = CFSTR("UIPencilPreferredTapAction");
  v30[3] = CFSTR("ApplePencilTextInputEnabled");
  v31[2] = v2;
  v31[3] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 4));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100006930;
  v28[3] = &unk_100024890;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v29 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHTextInputProtoSettings sharedSettings](CHTextInputProtoSettings, "sharedSettings"));
  v7 = (unint64_t)objc_msgSend(v6, "isScribbleActive");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:inDomain:", CFSTR("AppleLiveTextEnabled"), NSGlobalDomain));

  if (v9)
  {
    v10 = (unint64_t)objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    v27 = v3;
    v26 = v7;
    if (_os_feature_enabled_impl("TextRecognition", "extended_latin"))
      v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100025F88, "arrayByAddingObjectsFromArray:", &off_100025FA0));
    else
      v11 = &off_100025F88;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](NSLocale, "_deviceLanguage"));
    v32 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:](NSLocale, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v11, v13));

    v10 = objc_msgSend(v14, "count") != 0;
    v3 = v27;
    v7 = v26;
  }

  if (_os_feature_enabled_impl("TextRecognition", "extended_latin"))
    v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100025F88, "arrayByAddingObjectsFromArray:", &off_100025FA0));
  else
    v15 = &off_100025F88;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](NSLocale, "_deviceLanguage"));
  v32 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:](NSLocale, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v15, v17));

  v19 = objc_msgSend(v18, "count") != 0;
  v20 = (uint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("PKLastSeenWhatsNewVersionKey")) > 1;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("ApplePencilTextInputActive"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20));
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("PencilAttachedForCurrentWhatsNewVersion"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("LiveTextEnabledKey"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("LiveTextSupportedByPrimaryLanguageKey"));

  return v5;
}

- (id)durableCounterKeys
{
  return &__NSArray0__struct;
}

- (BOOL)cachedSettingsBoolForKey:(id)a3 userModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "cachedSettingsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "BOOLValue");

    return v9;
  }
  else
  {

    return 0;
  }
}

- (id)newContextForAnalyticsWithUserModel:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  CHPKAnalyticsMetricsContext *v8;
  uint64_t Language;
  void *v10;
  uint64_t Region;
  void *v12;
  CHPKAnalyticsMetricsContext *v13;
  _BOOL8 v14;

  v6 = a4;
  v7 = a3;
  v8 = [CHPKAnalyticsMetricsContext alloc];
  Language = TIInputModeGetLanguage(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(Language);
  Region = TIInputModeGetRegion(v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(Region);

  v13 = -[CHPKAnalyticsMetricsContext initWithInputLanguage:inputRegion:](v8, "initWithInputLanguage:inputRegion:", v10, v12);
  -[CHPKAnalyticsMetricsContext setFingerDrawingEnabled:](v13, "setFingerDrawingEnabled:", -[CHPKPersistentAnalyticsController cachedSettingsBoolForKey:userModel:](self, "cachedSettingsBoolForKey:userModel:", CFSTR("UIPencilOnlyDrawWithPencilKey"), v7));
  v14 = -[CHPKPersistentAnalyticsController cachedSettingsBoolForKey:userModel:](self, "cachedSettingsBoolForKey:userModel:", CFSTR("ApplePencilTextInputEnabled"), v7);

  -[CHPKAnalyticsMetricsContext setScribbleEnabled:](v13, "setScribbleEnabled:", v14);
  return v13;
}

- (void)dispatchScheduledEventsWithCompletionBlock:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006B98;
  v7[3] = &unk_1000248B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)dispatchSettingsEvents
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.pencilkit."), "stringByAppendingString:", CFSTR("scheduled.settings")));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006C60;
  v4[3] = &unk_1000248E0;
  v4[4] = self;
  AnalyticsSendEventLazy(v3, v4);

}

- (void)dispatchDailyUsageEvents
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  uint64_t v17;
  CHPKPersistentAnalyticsController *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[7];
  _QWORD v38[7];

  v37[0] = CHPKStrokesDrawnKey;
  v37[1] = CHPKSmartSelectionUsedKey;
  v38[0] = &off_100025DB0;
  v38[1] = &off_100025DB0;
  v37[2] = CHPKCopyAsTextUsedKey;
  v37[3] = CHPKSmartShapesUsedKey;
  v38[2] = &off_100025DB0;
  v38[3] = &off_100025DB0;
  v37[4] = CHPKInsertSpaceUsedKey;
  v37[5] = CHPKDataDetectorUsedKey;
  v38[4] = &off_100025DB0;
  v38[5] = &off_100025DB0;
  v37[6] = CHPKTextLineStraighteningUsedKey;
  v38[6] = &off_100025DB0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 7));
  v4 = objc_msgSend(v3, "mutableCopy");
  v18 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIUserModelDataStore getAllKnownInputModes](self->_dataStore, "getAllKnownInputModes"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v20 = v6;
        v8 = objc_msgSend(objc_alloc((Class)TIUserModel), "initWithInputMode:userModelDataStore:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v6), v18->_dataStore);
        objc_msgSend(v8, "setConfigurationDelegate:", v18);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contexts"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valuesFromContext:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13)));
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472;
              v23[2] = sub_100006FDC;
              v23[3] = &unk_100024908;
              v24 = v14;
              v25 = v8;
              v26 = v4;
              v15 = v14;
              objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v23);

              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v11);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.pencilkit."), "stringByAppendingString:", CFSTR("scheduled.dailyUsage")));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000070BC;
        v21[3] = &unk_1000248E0;
        v22 = v4;
        AnalyticsSendEventLazy(v7, v21);

        v6 = v20 + 1;
      }
      while ((id)(v20 + 1) != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v19);
  }

}

- (void)dispatchLifecycleEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[6];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  const __CFString *v32;
  const __CFString *v33;

  v32 = CFSTR("scribbledInSession");
  v33 = CFSTR("totalSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIUserModelDataStore getAllKnownInputModes](self->_dataStore, "getAllKnownInputModes"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obj);
        v18 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v5);
        v7 = objc_msgSend(objc_alloc((Class)TIUserModel), "initWithInputMode:userModelDataStore:", v6, self->_dataStore);
        objc_msgSend(v7, "setConfigurationDelegate:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contexts"));
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valuesFromContext:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12)));
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472;
              v19[2] = sub_100007350;
              v19[3] = &unk_100024930;
              v19[4] = self;
              v19[5] = v6;
              v20 = v13;
              v21 = v7;
              v14 = v13;
              objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v19);

              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

        v5 = v18 + 1;
      }
      while ((id)(v18 + 1) != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v17);
  }

}

- (void)dispatchLifecycleEventForFeature:(id)a3 denominatorKey:(id)a4 inputModeIdentifier:(id)a5 values:(id)a6 sinceDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[7];

  v11 = a5;
  v31[0] = kFeatureUsageStateInactive;
  v31[1] = kFeatureUsageStateActiveVeryLow;
  v31[2] = kFeatureUsageStateActiveLow;
  v31[3] = kFeatureUsageStateActiveMedium;
  v31[4] = kFeatureUsageStateActiveHigh;
  v31[5] = kFeatureUsageStateActiveVeryHigh;
  v31[6] = kFeatureUsageStateActiveUnusuallyHigh;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 7));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v14, kFeatureUsageQueryTimeFrame, v12));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v15, kFeatureUsageQueryTimeFrame, v12));
  v19 = kFeatureUsageStateInsufficientData;
  if (((unint64_t)objc_msgSend(v17, "integerValue") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v18, "doubleValue");
    v21 = v20;
    objc_msgSend(v17, "doubleValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21 / v22));
    v24 = objc_claimAutoreleasedReturnValue(+[TIAnalyticsUtil bucketNumber:bucketThresholds:bucketValues:](TIAnalyticsUtil, "bucketNumber:bucketThresholds:bucketValues:", v23, &off_100025F70, v16));

    v19 = (id)v24;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.pencilkit."), "stringByAppendingString:", CFSTR("scheduled.inputMode.scribbleUsage")));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000765C;
  v28[3] = &unk_100024958;
  v29 = v11;
  v30 = v19;
  v26 = v19;
  v27 = v11;
  AnalyticsSendEventLazy(v25, v28);

}

- (BOOL)inputModeIdentifierIsValid:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", a3));
  v4 = +[CHRecognitionSession isLocaleSupported:](CHRecognitionSession, "isLocaleSupported:", v3);

  return v4;
}

- (void)didBeginInputSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CHPKPersistentAnalyticsController sessionDelegate](self, "sessionDelegate"));
  objc_msgSend(v2, "sessionDidBegin");

}

- (void)didEndInputSessionWithInputMode:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKPersistentAnalyticsController sessionDelegate](self, "sessionDelegate"));
  objc_msgSend(v4, "sessionDidEnd");

  if (-[CHPKPersistentAnalyticsController inputModeIdentifierIsValid:](self, "inputModeIdentifierIsValid:", v7))
  {
    v5 = objc_msgSend(objc_alloc((Class)TIUserModel), "initWithInputMode:userModelDataStore:", v7, self->_dataStore);
    objc_msgSend(v5, "setConfigurationDelegate:", self);
    if (-[CHPKPersistentAnalyticsController cachedSettingsBoolForKey:userModel:](self, "cachedSettingsBoolForKey:userModel:", CFSTR("PencilAttachedForCurrentWhatsNewVersion"), v5))
    {
      v6 = -[CHPKPersistentAnalyticsController newContextForAnalyticsWithUserModel:language:](self, "newContextForAnalyticsWithUserModel:language:", v5, v7);
      objc_msgSend(v5, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, CFSTR("totalSessions"), 0, v6);

    }
  }

}

- (void)didEndInputSessionUsingScribbleWithInputMode:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKPersistentAnalyticsController sessionDelegate](self, "sessionDelegate"));
  objc_msgSend(v4, "sessionDidEnd");

  if (-[CHPKPersistentAnalyticsController inputModeIdentifierIsValid:](self, "inputModeIdentifierIsValid:", v7))
  {
    v5 = objc_msgSend(objc_alloc((Class)TIUserModel), "initWithInputMode:userModelDataStore:", v7, self->_dataStore);
    objc_msgSend(v5, "setConfigurationDelegate:", self);
    if (-[CHPKPersistentAnalyticsController cachedSettingsBoolForKey:userModel:](self, "cachedSettingsBoolForKey:userModel:", CFSTR("PencilAttachedForCurrentWhatsNewVersion"), v5))
    {
      v6 = -[CHPKPersistentAnalyticsController newContextForAnalyticsWithUserModel:language:](self, "newContextForAnalyticsWithUserModel:language:", v5, v7);
      objc_msgSend(v5, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, CFSTR("scribbledInSession"), 0, v6);
      objc_msgSend(v5, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, CFSTR("totalSessions"), 0, v6);

    }
  }

}

- (void)didEndPKCanvasSession:(id)a3 withInputMode:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)TIUserModel), "initWithInputMode:userModelDataStore:", v7, self->_dataStore);
  objc_msgSend(v8, "setConfigurationDelegate:", self);
  v18 = v7;
  v9 = -[CHPKPersistentAnalyticsController newContextForAnalyticsWithUserModel:language:](self, "newContextForAnalyticsWithUserModel:language:", v8, v7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v15));
        v17 = objc_msgSend(v16, "intValue");

        if (v17 >= 1)
          objc_msgSend(v8, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, v15, 0, v9);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)test_dispatchDailyEvent
{
  -[CHPKPersistentAnalyticsController dispatchScheduledEventsWithCompletionBlock:](self, "dispatchScheduledEventsWithCompletionBlock:", 0);
}

- (CHPKPersistentAnalyticsSessionDelegate)sessionDelegate
{
  return (CHPKPersistentAnalyticsSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
