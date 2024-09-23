@implementation DMDActivationCurfewObserver

- (DMDActivationCurfewObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 curfewPredicate:(id)a5
{
  id v8;
  DMDActivationCurfewObserver *v9;
  NSMutableArray *v10;
  NSMutableArray *expiredNotificationTimes;
  NSMutableArray *v12;
  NSMutableArray *scheduledAlarmIdentifiers;
  DMDActivationCurfewObserver *v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationCurfewObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v16, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, v8);
  if (v9)
  {
    v10 = objc_opt_new(NSMutableArray);
    expiredNotificationTimes = v9->_expiredNotificationTimes;
    v9->_expiredNotificationTimes = v10;

    v12 = objc_opt_new(NSMutableArray);
    scheduledAlarmIdentifiers = v9->_scheduledAlarmIdentifiers;
    v9->_scheduledAlarmIdentifiers = v12;

    if (!-[DMDActivationCurfewObserver _extractComponentsFromPredicate:](v9, "_extractComponentsFromPredicate:", v8))
    {
      v14 = 0;
      goto LABEL_6;
    }
    -[DMDActivationCurfewObserver _registerPredicateObserver](v9, "_registerPredicateObserver");
  }
  v14 = v9;
LABEL_6:

  return v14;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  NSDate *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  NSDate *v45;
  _BYTE v46[128];

  v4 = objc_opt_new(NSDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:](self, "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:", v4, -[DMDActivationCurfewObserver startDay](self, "startDay"), -[DMDActivationCurfewObserver startHour](self, "startHour"), -[DMDActivationCurfewObserver startMinute](self, "startMinute"), -[DMDActivationCurfewObserver startSecond](self, "startSecond"), v6));
  v27 = (void *)v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:](self, "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:", v4, -[DMDActivationCurfewObserver endDay](self, "endDay"), -[DMDActivationCurfewObserver endHour](self, "endHour"), -[DMDActivationCurfewObserver endMinute](self, "endMinute"), -[DMDActivationCurfewObserver endSecond](self, "endSecond"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  objc_msgSend(v8, "removeAllObjects");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "doubleValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -v15));
        if (objc_msgSend(v16, "compare:", v4) == (id)-1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
          objc_msgSend(v17, "addObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
    }
    while (v11);
  }

  v18 = DMFConfigurationEngineLog(-[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", objc_msgSend(v26, "compare:", v7) == (id)-1));
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v22 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
    *(_DWORD *)buf = 138544898;
    v33 = v20;
    v34 = 2114;
    v35 = v21;
    v36 = 1024;
    v37 = v22;
    v38 = 2114;
    v39 = v23;
    v40 = 2114;
    v41 = v7;
    v42 = 2114;
    v43 = v26;
    v44 = 2114;
    v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, expired notification times: %{public}@, next start date: %{public}@, next end date: %{public}@, now: %{public}@", buf, 0x44u);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));

  return v24;
}

- (void)invalidate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        xpc_set_event(objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String"), objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7)), "UTF8String"), 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)DMDActivationCurfewObserver;
  -[DMDActivationPredicateObserver invalidate](&v8, "invalidate");
}

- (id)metadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  void *v11;

  v9.receiver = self;
  v9.super_class = (Class)DMDActivationCurfewObserver;
  v3 = -[DMDActivationPredicateObserver metadata](&v9, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));

  if (objc_msgSend(v6, "count"))
  {
    v10 = DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey;
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, DMFDeclarationStatePredicatePayloadStatusKey);

  }
  return v4;
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  NSSet *v10;
  NSISO8601DateFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  BOOL v24;
  id v25;
  BOOL v26;
  BOOL v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  int64_t v63;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadCalendarIdentifier"));
  -[DMDActivationCurfewObserver setCalendarIdentifier:](self, "setCalendarIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v6));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadNotificationTimes"));
  if (v8)
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  else
    v9 = objc_opt_new(NSSet);
  v10 = v9;
  -[DMDActivationCurfewObserver setNotificationTimes:](self, "setNotificationTimes:", v9);

  v11 = objc_opt_new(NSISO8601DateFormatter);
  -[NSISO8601DateFormatter setFormatOptions:](v11, "setFormatOptions:", 544);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  -[NSISO8601DateFormatter setTimeZone:](v11, "setTimeZone:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadStartTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v11, "dateFromString:", v13));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 224, v14));
    -[DMDActivationCurfewObserver setStartHour:](self, "setStartHour:", objc_msgSend(v15, "hour"));
    -[DMDActivationCurfewObserver setStartMinute:](self, "setStartMinute:", objc_msgSend(v15, "minute"));
    -[DMDActivationCurfewObserver setStartSecond:](self, "setStartSecond:", objc_msgSend(v15, "second"));
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadEndTime"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v11, "dateFromString:", v16));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 224, v17));

    -[DMDActivationCurfewObserver setEndHour:](self, "setEndHour:", objc_msgSend(v18, "hour"));
    -[DMDActivationCurfewObserver setEndMinute:](self, "setEndMinute:", objc_msgSend(v18, "minute"));
    -[DMDActivationCurfewObserver setEndSecond:](self, "setEndSecond:", objc_msgSend(v18, "second"));
    v15 = v18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadStartDay"));
  -[DMDActivationCurfewObserver setStartDay:](self, "setStartDay:", objc_msgSend(v19, "integerValue"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadEndDay"));
  -[DMDActivationCurfewObserver setEndDay:](self, "setEndDay:", objc_msgSend(v20, "integerValue"));

  v39 = v7;
  v21 = objc_msgSend(v7, "maximumRangeOfUnit:", 512);
  v23 = (unint64_t)v21 + v22 - 1;
  v24 = (id)-[DMDActivationCurfewObserver startDay](self, "startDay") < v21
     && -[DMDActivationCurfewObserver startDay](self, "startDay") > v23;
  v25 = -[DMDActivationCurfewObserver endDay](self, "endDay");
  if (v25 >= v21)
  {
    v26 = 0;
  }
  else
  {
    v25 = -[DMDActivationCurfewObserver endDay](self, "endDay");
    v26 = (unint64_t)v25 > v23;
  }
  if (v14)
    v27 = v17 == 0;
  else
    v27 = 1;
  v28 = v27 || v24;
  if ((v28 & 1) != 0 || v26 || (v25 = objc_msgSend(v14, "compare:", v17)) == 0)
  {
    v34 = DMFConfigurationEngineLog(v25);
    v30 = objc_claimAutoreleasedReturnValue(v34);
    v32 = (void *)v8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100071460(self, v4, v30);
    v31 = 0;
  }
  else
  {
    v29 = DMFConfigurationEngineLog(v25);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = 1;
    v32 = (void *)v8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes"));
      *(_DWORD *)buf = 138546178;
      v41 = v38;
      v42 = 2114;
      v43 = v37;
      v44 = 2114;
      v45 = v33;
      v46 = 2114;
      v47 = v36;
      v48 = 2048;
      v49 = -[DMDActivationCurfewObserver startDay](self, "startDay");
      v50 = 2048;
      v51 = -[DMDActivationCurfewObserver startHour](self, "startHour");
      v52 = 2048;
      v53 = -[DMDActivationCurfewObserver startMinute](self, "startMinute");
      v54 = 2048;
      v55 = -[DMDActivationCurfewObserver startSecond](self, "startSecond");
      v56 = 2048;
      v57 = -[DMDActivationCurfewObserver endDay](self, "endDay");
      v58 = 2048;
      v59 = -[DMDActivationCurfewObserver endHour](self, "endHour");
      v60 = 2048;
      v61 = -[DMDActivationCurfewObserver endMinute](self, "endMinute");
      v62 = 2048;
      v63 = -[DMDActivationCurfewObserver endSecond](self, "endSecond");
      v31 = 1;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, notifications times: %{public}@, start day: %ld, start hour: %ld, start minute: %ld, start second: %ld, end day: %ld, end hour: %ld, end minute: %ld, end second: %ld", buf, 0x7Au);

    }
  }

  return v31;
}

- (void)_registerPredicateObserver
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  xpc_object_t v20;
  id v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int64_t v38;
  _BYTE v39[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _datesForNextCurfewBoundary](self, "_datesForNextCurfewBoundary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
  objc_msgSend(v4, "removeAllObjects");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
  if (v5)
  {
    v6 = v5;
    v24 = *(_QWORD *)v26;
    v7 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@-%ld"), CFSTR("com.apple.dmd.alarm"), v10, (char *)i + v7));

        objc_msgSend(v9, "timeIntervalSince1970");
        v13 = (uint64_t)(v12 * 1000000000.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver scheduledAlarmIdentifiers](self, "scheduledAlarmIdentifiers"));
        objc_msgSend(v14, "addObject:", v11);

        v16 = DMFConfigurationEngineLog(v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
          *(_DWORD *)buf = 138544386;
          v30 = v18;
          v31 = 2114;
          v32 = v19;
          v33 = 2114;
          v34 = v11;
          v35 = 2114;
          v36 = v9;
          v37 = 2048;
          v38 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public}@ to fire at date: %{public}@, epoch time in nano seconds: %lld", buf, 0x34u);

        }
        v20 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v20, (const char *)objc_msgSend(CFSTR("ShouldWake"), "UTF8String"), 0);
        xpc_dictionary_set_date(v20, (const char *)objc_msgSend(CFSTR("Date"), "UTF8String"), v13);
        v21 = objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String");
        v22 = objc_retainAutorelease(v11);
        xpc_set_event(v21, objc_msgSend(v22, "UTF8String"), v20);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      v7 += (uint64_t)i;
    }
    while (v6);
  }

}

- (id)_datesForNextCurfewBoundary
{
  NSDate *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v3 = objc_opt_new(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver calendarIdentifier](self, "calendarIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:](self, "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:", v3, -[DMDActivationCurfewObserver startDay](self, "startDay"), -[DMDActivationCurfewObserver startHour](self, "startHour"), -[DMDActivationCurfewObserver startMinute](self, "startMinute"), -[DMDActivationCurfewObserver startSecond](self, "startSecond"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver _nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:](self, "_nextDateAfter:matchingWeekday:hour:minute:second:inCalendar:", v3, -[DMDActivationCurfewObserver endDay](self, "endDay"), -[DMDActivationCurfewObserver endHour](self, "endHour"), -[DMDActivationCurfewObserver endMinute](self, "endMinute"), -[DMDActivationCurfewObserver endSecond](self, "endSecond"), v5));
  v8 = objc_opt_new(NSMutableArray);
  v9 = objc_msgSend(v6, "compare:", v7);
  if (v9 == (id)1)
  {
    -[NSMutableArray addObject:](v8, "addObject:", v7);
LABEL_14:
    v17 = -[NSMutableArray copy](v8, "copy");
    goto LABEL_18;
  }
  if (v9 == (id)-1)
  {
    -[NSMutableArray addObject:](v8, "addObject:", v6);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationCurfewObserver notificationTimes](self, "notificationTimes", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14), "doubleValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -v15));
          if (-[NSDate compare:](v3, "compare:", v16) == NSOrderedAscending)
            -[NSMutableArray addObject:](v8, "addObject:", v16);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v12);
    }

    goto LABEL_14;
  }
  v18 = DMFConfigurationEngineLog(v9);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    *(_DWORD *)buf = 138544130;
    v28 = v21;
    v29 = 2114;
    v30 = v22;
    v31 = 2114;
    v32 = v6;
    v33 = 2114;
    v34 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to calculate the next curfew boundary date for next start date: %{public}@, next end date: %{public}@", buf, 0x2Au);

  }
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)_nextDateAfter:(id)a3 matchingWeekday:(int64_t)a4 hour:(int64_t)a5 minute:(int64_t)a6 second:(int64_t)a7 inCalendar:(id)a8
{
  id v13;
  id v14;
  NSDateComponents *v15;
  void *v16;

  v13 = a8;
  v14 = a3;
  v15 = objc_opt_new(NSDateComponents);
  -[NSDateComponents setWeekday:](v15, "setWeekday:", a4);
  -[NSDateComponents setHour:](v15, "setHour:", a5);
  -[NSDateComponents setMinute:](v15, "setMinute:", a6);
  -[NSDateComponents setSecond:](v15, "setSecond:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextDateAfterDate:matchingComponents:options:", v14, v15, 1024));

  return v16;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)notificationTimes
{
  return self->_notificationTimes;
}

- (void)setNotificationTimes:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTimes, a3);
}

- (NSMutableArray)expiredNotificationTimes
{
  return self->_expiredNotificationTimes;
}

- (void)setExpiredNotificationTimes:(id)a3
{
  objc_storeStrong((id *)&self->_expiredNotificationTimes, a3);
}

- (NSMutableArray)scheduledAlarmIdentifiers
{
  return self->_scheduledAlarmIdentifiers;
}

- (void)setScheduledAlarmIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledAlarmIdentifiers, a3);
}

- (int64_t)startDay
{
  return self->_startDay;
}

- (void)setStartDay:(int64_t)a3
{
  self->_startDay = a3;
}

- (int64_t)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(int64_t)a3
{
  self->_startHour = a3;
}

- (int64_t)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(int64_t)a3
{
  self->_startMinute = a3;
}

- (int64_t)startSecond
{
  return self->_startSecond;
}

- (void)setStartSecond:(int64_t)a3
{
  self->_startSecond = a3;
}

- (int64_t)endDay
{
  return self->_endDay;
}

- (void)setEndDay:(int64_t)a3
{
  self->_endDay = a3;
}

- (int64_t)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(int64_t)a3
{
  self->_endHour = a3;
}

- (int64_t)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(int64_t)a3
{
  self->_endMinute = a3;
}

- (int64_t)endSecond
{
  return self->_endSecond;
}

- (void)setEndSecond:(int64_t)a3
{
  self->_endSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledAlarmIdentifiers, 0);
  objc_storeStrong((id *)&self->_expiredNotificationTimes, 0);
  objc_storeStrong((id *)&self->_notificationTimes, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end
