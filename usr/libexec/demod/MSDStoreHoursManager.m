@implementation MSDStoreHoursManager

+ (id)sharedInstance
{
  if (qword_1001754A8 != -1)
    dispatch_once(&qword_1001754A8, &stru_10013F288);
  return (id)qword_1001754A0;
}

- (MSDStoreHoursManager)init
{
  MSDStoreHoursManager *v2;
  MSDStoreHoursManager *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  MSDStoreHoursManager *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSDStoreHoursManager;
  v2 = -[MSDStoreHoursManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDStoreHoursManager setStoreHourRecords:](v2, "setStoreHourRecords:", 0);
    -[MSDStoreHoursManager setExpirationTimer:](v3, "setExpirationTimer:", 0);
    -[MSDStoreHoursManager setStoreOpenTimer:](v3, "setStoreOpenTimer:", 0);
    -[MSDStoreHoursManager setStoreCloseTimer:](v3, "setStoreCloseTimer:", 0);
    -[MSDStoreHoursManager setUseDefaultStoreHours:](v3, "setUseDefaultStoreHours:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MSDStoreHoursManager populateStoreHourFromDefaultSettingsForDate:](v3, "populateStoreHourFromDefaultSettingsForDate:", v4);

    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      objc_initWeak(&location, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100078C74;
      v10[3] = &unk_10013F2B0;
      objc_copyWeak(&v11, &location);
      v7 = objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.MobileStoreDemo.StoreHours.FireExpiration"), 0, v6, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    v8 = v3;
  }

  return v3;
}

- (void)updateStoreHours:(id)a3 lastSettingsUpdatedDate:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t v41[16];

  v6 = a3;
  v8 = a4;
  if (!v8
    || (v9 = objc_opt_class(NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast")),
        v11 = objc_msgSend(v8, "isEqualToDate:", v10),
        v10,
        v11))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C488C();
    v14 = 0;
LABEL_7:

    -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", 0);
    -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 1);
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C4858(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_17;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endOfDay"));
  v14 = objc_msgSend(v24, "newDateByAddingOneWeek");

  objc_msgSend(v14, "timeIntervalSinceNow");
  if (v26 < 300.0)
  {
    v32 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C48EC(v14, v13);
    goto LABEL_7;
  }
  if (!v6
    || (v27 = objc_opt_class(NSArray, v25), (objc_opt_isKindOfClass(v6, v27) & 1) == 0)
    || !objc_msgSend(v6, "count"))
  {
    v31 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C497C();
    goto LABEL_7;
  }
  v28 = objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager parseRawStoreHours:](self, "parseRawStoreHours:", v6));
  if (!v28)
  {
    v33 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C49DC(v13, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_7;
  }
  v16 = v28;
  -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", v28);
  -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 0);
  -[MSDStoreHoursManager setupStoreHourSettingsExpirationTimer:](self, "setupStoreHourSettingsExpirationTimer:", v14);
  v29 = sub_1000604F0();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "New store hours successfully loaded!", v41, 2u);
  }

LABEL_17:
}

- (BOOL)evaluateStoreStatusAgainstCurrentTime
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  LOBYTE(self) = -[MSDStoreHoursManager evaluateStoreStatusAgainstPointInTime:](self, "evaluateStoreStatusAgainstPointInTime:", v3);

  return (char)self;
}

- (BOOL)evaluateStoreStatusAgainstPointInTime:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v36;
  void *v37;

  v4 = a3;
  v5 = -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toString"));
    v36 = 138543362;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Evaluating store status against time: %{public}@", (uint8_t *)&v36, 0xCu);

  }
  if (-[MSDStoreHoursManager useDefaultStoreHours](self, "useDefaultStoreHours"))
    -[MSDStoreHoursManager populateStoreHourFromDefaultSettingsForDate:](self, "populateStoreHourFromDefaultSettingsForDate:", v4);
  else
    -[MSDStoreHoursManager populateStoreHourFromHubSuppliedSettingsForDate:](self, "populateStoreHourFromHubSuppliedSettingsForDate:", v4);
  if (v5 != -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow"))
    goto LABEL_15;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  if (!objc_msgSend(v12, "isEqualToDate:", v6))
    goto LABEL_14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  if ((objc_msgSend(v13, "isEqualToDate:", v7) & 1) == 0)
  {

LABEL_14:
    goto LABEL_15;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
  v15 = objc_msgSend(v14, "isEqualToDate:", v8);

  if ((v15 & 1) != 0)
  {
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No change in store open-closed status.", (uint8_t *)&v36, 2u);
    }
    v18 = 0;
    goto LABEL_26;
  }
LABEL_15:
  v19 = sub_1000604F0();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v36) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "New store open-closed status:", (uint8_t *)&v36, 2u);
  }

  v21 = sub_1000604F0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow");
    v36 = 67109120;
    LODWORD(v37) = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "    Is store open now: %{BOOL}d", (uint8_t *)&v36, 8u);
  }

  v24 = sub_1000604F0();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "toString"));
    v36 = 138543362;
    v37 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "    Next store open date: %{public}@", (uint8_t *)&v36, 0xCu);

  }
  v28 = sub_1000604F0();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "toString"));
    v36 = 138543362;
    v37 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "    Next store close date: %{public}@", (uint8_t *)&v36, 0xCu);

  }
  v32 = sub_1000604F0();
  v17 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "toString"));
    v36 = 138543362;
    v37 = v34;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "    Next content revert date: %{public}@", (uint8_t *)&v36, 0xCu);

  }
  v18 = 1;
LABEL_26:

  return v18;
}

- (id)screenSaverShouldRunUntil
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  double v13;
  id v14;
  NSObject *v15;
  double v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v6 = 0;
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 60));

    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screenSaverIdleDelay"));

  if (!v6)
    goto LABEL_6;
  v8 = objc_opt_class(NSNumber, v7);
  v9 = v6;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    goto LABEL_6;
LABEL_7:
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138543362;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Screen saver idle delay: %{public}@ (seconds)", (uint8_t *)&v25, 0xCu);
  }

  if (-[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow"))
  {
    v12 = v4;
    objc_msgSend(v12, "timeIntervalSinceNow");
    if (v13 >= (double)(60 * (uint64_t)objc_msgSend(v9, "integerValue")))
      goto LABEL_21;
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Store will be closing soon!", (uint8_t *)&v25, 2u);
    }

    v16 = (double)(60 * (uint64_t)objc_msgSend(v9, "integerValue"));
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(60 * (uint64_t)objc_msgSend(v9, "integerValue"))));
    if (objc_msgSend(v12, "compare:", v3) == (id)1)
    {
      v17 = sub_1000604F0();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Store will be opening soon!", (uint8_t *)&v25, 2u);
      }

      v19 = v4;
      goto LABEL_20;
    }
    v16 = 300.0;
  }
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v16));
LABEL_20:
  v20 = v19;

  v12 = v20;
LABEL_21:
  v21 = sub_1000604F0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toString"));
    v25 = 138543362;
    v26 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Screen saver should run until: %{public}@", (uint8_t *)&v25, 0xCu);

  }
  return v12;
}

- (void)setupStoreOpenCloseTimers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
  -[MSDStoreHoursManager setupStoreOpenTimer:](self, "setupStoreOpenTimer:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
  -[MSDStoreHoursManager setupStoreCloseTimer:](self, "setupStoreCloseTimer:", v4);

}

- (id)parseRawStoreHours:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  MSDStoreHourRecord *v9;
  void *v10;
  MSDStoreHourRecord *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    obj = v5;
    v32 = *(_QWORD *)v34;
    while (2)
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v10);
        v13 = objc_opt_class(NSArray, v7);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0 || objc_msgSend(v12, "count") != (id)3)
        {
          v25 = sub_1000604F0();
          v16 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_1000C4AD0();
          goto LABEL_25;
        }
        v14 = v4;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
        v16 = objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](NSDate, "dateFromString:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](NSDate, "dateFromString:", v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 2));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFromString:](NSDate, "dateFromString:", v19));

        if (!v16 || !v18 || !v20)
        {
          v28 = sub_1000604F0();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            sub_1000C4A70();

          v4 = v14;
          goto LABEL_25;
        }
        if (!objc_msgSend(v18, "isLaterDateThan:", v16)
          || (objc_msgSend(v20, "isLaterDateThan:", v18) & 1) == 0)
        {
          v26 = sub_1000604F0();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          v4 = v14;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_1000C4A10();

LABEL_25:
          v5 = obj;

          v24 = 0;
          goto LABEL_26;
        }
        v9 = objc_alloc_init(MSDStoreHourRecord);

        -[MSDStoreHourRecord setClosedDate:](v9, "setClosedDate:", v16);
        -[MSDStoreHourRecord setRevertDate:](v9, "setRevertDate:", v18);
        -[MSDStoreHourRecord setOpenDate:](v9, "setOpenDate:", v20);
        v4 = v14;
        objc_msgSend(v14, "addObject:", v9);

        v10 = (char *)v10 + 1;
        v11 = v9;
      }
      while (v8 != v10);
      v5 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v8)
        continue;
      break;
    }

  }
  v11 = objc_alloc_init(MSDStoreHourRecord);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  -[MSDStoreHourRecord setClosedDate:](v11, "setClosedDate:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  -[MSDStoreHourRecord setRevertDate:](v11, "setRevertDate:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  -[MSDStoreHourRecord setOpenDate:](v11, "setOpenDate:", v23);

  objc_msgSend(v4, "addObject:", v11);
  v24 = v4;
LABEL_26:

  return v24;
}

- (void)populateStoreHourFromDefaultSettingsForDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_alloc_init((Class)NSDateComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startOfDayForDate:", v14));
  objc_msgSend(v5, "setHour:", 8);
  objc_msgSend(v5, "setMinute:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0));
  objc_msgSend(v5, "setHour:", 8);
  objc_msgSend(v5, "setMinute:", 30);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0));
  objc_msgSend(v5, "setHour:", 23);
  objc_msgSend(v5, "setMinute:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0));
  if (!objc_msgSend(v14, "isEarlierDateThan:", v7))
  {
    if (objc_msgSend(v14, "isEarlierDateThan:", v8))
    {
      -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0);
      -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v8);
    }
    else
    {
      if (!objc_msgSend(v14, "isEarlierDateThan:", v9))
      {
        -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0);
        v11 = objc_msgSend(v8, "newDateByAddingOneDay");
        -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v11);

        v12 = objc_msgSend(v9, "newDateByAddingOneDay");
        -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v12);

        goto LABEL_9;
      }
      -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 1);
      v10 = objc_msgSend(v8, "newDateByAddingOneDay");
      -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v10);

    }
    -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v9);
LABEL_9:
    v13 = objc_msgSend(v7, "newDateByAddingOneDay");
    -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v13);

    goto LABEL_10;
  }
  -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0);
  -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v8);
  -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v9);
  -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v7);
LABEL_10:

}

- (void)populateStoreHourFromHubSuppliedSettingsForDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v7 - 1));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "closedDate"));
      LODWORD(v8) = objc_msgSend(v26, "isLaterDateThan:", v10);

      if (!(_DWORD)v8)
      {
        -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "closedDate"));
        -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "revertDate"));
        -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openDate"));
        -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v18);
        goto LABEL_13;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openDate"));
      v12 = objc_msgSend(v26, "isEarlierDateThan:", v11);

      if (v12)
        break;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
      v14 = objc_msgSend(v13, "count");

      if (v7++ >= (unint64_t)v14)
        goto LABEL_14;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager storeHourRecords](self, "storeHourRecords"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v7));

    -[MSDStoreHoursManager setIsStoreOpenNow:](self, "setIsStoreOpenNow:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "closedDate"));
    -[MSDStoreHoursManager setNextStoreClosedDate:](self, "setNextStoreClosedDate:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openDate"));
    -[MSDStoreHoursManager setNextStoreOpenDate:](self, "setNextStoreOpenDate:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "revertDate"));
    v23 = objc_msgSend(v26, "isLaterDateThan:", v22);

    if (v23)
      v24 = v18;
    else
      v24 = v6;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "revertDate"));
    -[MSDStoreHoursManager setNextContentRevertDate:](self, "setNextContentRevertDate:", v25);

LABEL_13:
LABEL_14:

  }
}

- (void)setupStoreHourSettingsExpirationTimer:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079FC4;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeHourSettingsExpirationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store hour settings are now expired!", v7, 2u);
  }

  -[MSDStoreHoursManager setStoreHourRecords:](self, "setStoreHourRecords:", 0);
  -[MSDStoreHoursManager setUseDefaultStoreHours:](self, "setUseDefaultStoreHours:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.MobileStoreDemo.StoreHours.Expired"), 0, 0);

}

- (void)setupStoreOpenTimer:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A300;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeOpenHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store is open!", v7, 2u);
  }

  -[MSDStoreHoursManager evaluateStoreStatusAgainstCurrentTime](self, "evaluateStoreStatusAgainstCurrentTime");
  -[MSDStoreHoursManager setupStoreOpenCloseTimers](self, "setupStoreOpenCloseTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.MobileStoreDemo.StoreHours.StoreOpen"), 0, 0);

}

- (void)setupStoreCloseTimer:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A59C;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)storeCloseHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Store is closed!", v7, 2u);
  }

  -[MSDStoreHoursManager evaluateStoreStatusAgainstCurrentTime](self, "evaluateStoreStatusAgainstCurrentTime");
  -[MSDStoreHoursManager setupStoreOpenCloseTimers](self, "setupStoreOpenCloseTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.MobileStoreDemo.StoreHours.StoreClosed"), 0, 0);

}

- (BOOL)isStoreOpenNow
{
  return self->_isStoreOpenNow;
}

- (void)setIsStoreOpenNow:(BOOL)a3
{
  self->_isStoreOpenNow = a3;
}

- (NSDate)nextStoreOpenDate
{
  return self->_nextStoreOpenDate;
}

- (void)setNextStoreOpenDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextStoreOpenDate, a3);
}

- (NSDate)nextStoreClosedDate
{
  return self->_nextStoreClosedDate;
}

- (void)setNextStoreClosedDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextStoreClosedDate, a3);
}

- (NSDate)nextContentRevertDate
{
  return self->_nextContentRevertDate;
}

- (void)setNextContentRevertDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextContentRevertDate, a3);
}

- (NSArray)storeHourRecords
{
  return self->_storeHourRecords;
}

- (void)setStoreHourRecords:(id)a3
{
  objc_storeStrong((id *)&self->_storeHourRecords, a3);
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTimer, a3);
}

- (NSTimer)storeOpenTimer
{
  return self->_storeOpenTimer;
}

- (void)setStoreOpenTimer:(id)a3
{
  objc_storeStrong((id *)&self->_storeOpenTimer, a3);
}

- (NSTimer)storeCloseTimer
{
  return self->_storeCloseTimer;
}

- (void)setStoreCloseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_storeCloseTimer, a3);
}

- (BOOL)useDefaultStoreHours
{
  return self->_useDefaultStoreHours;
}

- (void)setUseDefaultStoreHours:(BOOL)a3
{
  self->_useDefaultStoreHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCloseTimer, 0);
  objc_storeStrong((id *)&self->_storeOpenTimer, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_storeHourRecords, 0);
  objc_storeStrong((id *)&self->_nextContentRevertDate, 0);
  objc_storeStrong((id *)&self->_nextStoreClosedDate, 0);
  objc_storeStrong((id *)&self->_nextStoreOpenDate, 0);
}

@end
