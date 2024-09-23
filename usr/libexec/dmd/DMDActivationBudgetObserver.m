@implementation DMDActivationBudgetObserver

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 budgetPredicate:(id)a5
{
  id v8;
  DMDActivationBudgetObserver *v9;
  USUsageMonitor *v10;
  USUsageMonitor *usageMonitor;
  NSMutableArray *v12;
  NSMutableArray *expiredNotificationTimes;
  DMDActivationBudgetObserver *v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationBudgetObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v16, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, v8);
  if (!v9)
    goto LABEL_4;
  v10 = objc_opt_new(USUsageMonitor);
  usageMonitor = v9->_usageMonitor;
  v9->_usageMonitor = v10;

  v12 = objc_opt_new(NSMutableArray);
  expiredNotificationTimes = v9->_expiredNotificationTimes;
  v9->_expiredNotificationTimes = v12;

  if (!-[DMDActivationBudgetObserver _extractComponentsFromBudgetPredicate:](v9, "_extractComponentsFromBudgetPredicate:", v8))goto LABEL_5;
  if (-[DMDActivationBudgetObserver _registerPredicateObserver](v9, "_registerPredicateObserver"))
LABEL_4:
    v14 = v9;
  else
LABEL_5:
    v14 = 0;

  return v14;
}

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 compositeBudgetPredicate:(id)a5
{
  id v8;
  DMDActivationBudgetObserver *v9;
  USUsageMonitor *v10;
  USUsageMonitor *usageMonitor;
  NSMutableArray *v12;
  NSMutableArray *expiredNotificationTimes;
  DMDActivationBudgetObserver *v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationBudgetObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v16, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, v8);
  if (!v9)
    goto LABEL_4;
  v10 = objc_opt_new(USUsageMonitor);
  usageMonitor = v9->_usageMonitor;
  v9->_usageMonitor = v10;

  v12 = objc_opt_new(NSMutableArray);
  expiredNotificationTimes = v9->_expiredNotificationTimes;
  v9->_expiredNotificationTimes = v12;

  if (!-[DMDActivationBudgetObserver _extractComponentsFromCompositeBudgetPredicate:](v9, "_extractComponentsFromCompositeBudgetPredicate:", v8))goto LABEL_5;
  if (-[DMDActivationBudgetObserver _registerPredicateObserver](v9, "_registerPredicateObserver"))
LABEL_4:
    v14 = v9;
  else
LABEL_5:
    v14 = 0;

  return v14;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  NSObject *v58;
  _BYTE v59[128];
  void *v60;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageBudget](self, "usageBudget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  -[DMDActivationBudgetObserver setRemainingTime:](self, "setRemainingTime:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageMonitor](self, "usageMonitor"));
  v60 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
  v48 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "checkStatusOfBudgets:error:", v9, &v48));
  v11 = v48;

  if (v10)
  {
    v43 = a3;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));
    v13 = v12;
    v14 = &__kCFBooleanFalse;
    if (v12)
    {
      v41 = v11;
      v42 = v10;
      -[NSObject doubleValue](v12, "doubleValue");
      if (v15 <= 0.0)
        v14 = &__kCFBooleanTrue;
      -[DMDActivationBudgetObserver setRemainingTime:](self, "setRemainingTime:", v13);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver notificationTimes](self, "notificationTimes"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v21, "doubleValue");
            v23 = v22;
            -[NSObject doubleValue](v13, "doubleValue");
            if (v23 >= v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
              objc_msgSend(v25, "addObject:", v21);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
        }
        while (v18);
      }

      v11 = v41;
      v10 = v42;
    }
    v26 = DMFConfigurationEngineLog(-[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", objc_msgSend(v14, "BOOLValue")));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
      *(_DWORD *)buf = 138544386;
      v50 = v28;
      v51 = 2114;
      v52 = v29;
      v53 = 2114;
      v54 = v6;
      v55 = 2114;
      v56 = v30;
      v57 = 2114;
      v58 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded checking status of Usage Tracking monitor with budget identifier %{public}@, expired notification times: %{public}@, remaining time: %{public}@ seconds", buf, 0x34u);

    }
    a3 = v43;
  }
  else
  {
    v31 = ((uint64_t (*)(void))DMFConfigurationEngineLog)();
    v13 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "debugDescription"));
      *(_DWORD *)buf = 138544130;
      v50 = v38;
      v51 = 2114;
      v52 = v39;
      v53 = 2114;
      v54 = v6;
      v55 = 2114;
      v56 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed checking status of Usage Tracking monitor with budget identifier: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    v14 = 0;
  }

  if (a3 && v11)
  {
    v32 = objc_retainAutorelease(v11);
    *a3 = v32;
  }
  v33 = DMFConfigurationEngineLog(v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    *(_DWORD *)buf = 138544130;
    v50 = v35;
    v51 = 2114;
    v52 = v36;
    v53 = 2114;
    v54 = v14;
    v55 = 2114;
    v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %{public}@ for Usage Tracking monitor with identifier: %{public}@", buf, 0x2Au);

  }
  return v14;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageBudget](self, "usageBudget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageMonitor](self, "usageMonitor"));
  v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B5EC;
  v9[3] = &unk_1000B9B40;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v5, "stopMonitoringBudgets:completionHandler:", v6, v9);

  v8.receiver = self;
  v8.super_class = (Class)DMDActivationBudgetObserver;
  -[DMDActivationPredicateObserver invalidate](&v8, "invalidate");

}

- (id)metadata
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver expiredNotificationTimes](self, "expiredNotificationTimes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  if (objc_msgSend(v5, "count"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey);
  v9.receiver = self;
  v9.super_class = (Class)DMDActivationBudgetObserver;
  v6 = -[DMDActivationPredicateObserver metadata](&v9, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSMutableDictionary count](v3, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, DMFDeclarationStatePredicatePayloadStatusKey);

  return v7;
}

- (BOOL)_extractComponentsFromBudgetPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  NSSet *v15;
  NSSet *v16;
  uint64_t v17;
  NSSet *v18;
  uint64_t v19;
  NSObject *p_super;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSet *v24;
  NSSet *v25;
  NSMutableDictionary *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  NSSet *v54;
  NSSet *v55;
  NSSet *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  NSObject *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  NSMutableDictionary *v74;
  _BYTE v75[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadCalendarIdentifier"));
  -[DMDActivationBudgetObserver setCalendarIdentifier:](self, "setCalendarIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver calendarIdentifier](self, "calendarIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadMonitor"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadIdentifiersVersion2"));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadIdentifiers"));
    v13 = v11;

    if (!-[NSObject count](v13, "count"))
    {
      v19 = DMFConfigurationEngineLog(0);
      p_super = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_1000711D0();
      v14 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v15 = objc_opt_new(NSSet);
    v16 = objc_opt_new(NSSet);
    v56 = objc_opt_new(NSSet);
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Apps")))
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
      v18 = v15;
      v15 = (NSSet *)v17;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Categories")))
    {
      v21 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
      v18 = v16;
      v16 = (NSSet *)v21;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("WebSites")))
      {
LABEL_19:
        v55 = v16;
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadNotificationTimes"));
        v50 = v8;
        v53 = v13;
        v54 = v15;
        v52 = (void *)v23;
        if (v23)
          v24 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
        else
          v24 = objc_opt_new(NSSet);
        v25 = v24;
        -[DMDActivationBudgetObserver setNotificationTimes:](self, "setNotificationTimes:", v24);

        v26 = objc_opt_new(NSMutableDictionary);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v51 = v4;
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadTimeBudget"));
        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v58;
          while (2)
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(_QWORD *)v58 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "payloadDays"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "payloadSeconds"));
              v35 = -[DMDActivationBudgetObserver _budgetDays:duration:calendar:schedule:](self, "_budgetDays:duration:calendar:schedule:", v33, v34, v7, v26);

              if ((v35 & 1) == 0)
              {
                v47 = DMFConfigurationEngineLog(v36);
                v48 = objc_claimAutoreleasedReturnValue(v47);
                p_super = &v54->super;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  sub_10007125C();

                v14 = 0;
                v8 = v50;
                v4 = v51;
                goto LABEL_37;
              }
            }
            v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
            if (v29)
              continue;
            break;
          }
        }

        v37 = objc_alloc((Class)USBudget);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
        v40 = objc_msgSend(v37, "initWithCategories:applications:webDomains:schedule:calendarIdentifier:identifier:", v55, v54, v56, v26, v38, v39);
        -[DMDActivationBudgetObserver setUsageBudget:](self, "setUsageBudget:", v40);

        v42 = DMFConfigurationEngineLog(v41);
        v27 = objc_claimAutoreleasedReturnValue(v42);
        v14 = 1;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver calendarIdentifier](self, "calendarIdentifier"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver notificationTimes](self, "notificationTimes"));
          *(_DWORD *)buf = 138544898;
          v62 = v43;
          v63 = 2114;
          v64 = v44;
          v65 = 2114;
          v66 = v45;
          v67 = 2114;
          v8 = v50;
          v68 = v50;
          v69 = 2114;
          v70 = v53;
          v71 = 2114;
          v72 = v46;
          v73 = 2114;
          v74 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, budget type: %{public}@, budgeted identifiers: %{public}@, notification times: %{public}@, budget schedule: %{public}@", buf, 0x48u);

        }
        else
        {
          v8 = v50;
        }
        v4 = v51;
        p_super = &v54->super;
LABEL_37:

        v13 = v53;
        goto LABEL_38;
      }
      v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
      v18 = v56;
      v56 = (NSSet *)v22;
    }

    goto LABEL_19;
  }
  v12 = DMFConfigurationEngineLog(0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100071144();
  v14 = 0;
LABEL_39:

  return v14;
}

- (BOOL)_extractComponentsFromCompositeBudgetPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  NSSet *v21;
  NSSet *v22;
  NSSet *v23;
  NSSet *v24;
  uint64_t v25;
  NSSet *v26;
  NSSet *v27;
  NSMutableDictionary *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSSet *v49;
  NSSet *v50;
  uint64_t v51;
  NSObject *v52;
  void *v54;
  NSSet *v55;
  NSObject *p_super;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  NSSet *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  NSObject *v74;
  __int16 v75;
  NSSet *v76;
  __int16 v77;
  NSSet *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  NSMutableDictionary *v82;
  _BYTE v83[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadCalendarIdentifier"));
  -[DMDActivationBudgetObserver setCalendarIdentifier:](self, "setCalendarIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver calendarIdentifier](self, "calendarIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver calendarForIdentifier:](self, "calendarForIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadMonitors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadApps"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadMonitors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "payloadCategoriesVersion2"));
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadMonitors"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "payloadCategories"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadMonitors"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "payloadWebSites"));

  if (v9 || v13 || v16)
  {
    if (v9)
      v21 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    else
      v21 = objc_opt_new(NSSet);
    v22 = v21;
    if (v13)
      v23 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    else
      v23 = objc_opt_new(NSSet);
    v55 = v23;
    if (v16)
      v24 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    else
      v24 = objc_opt_new(NSSet);
    v62 = v24;
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadNotificationTimes"));
    v60 = (void *)v25;
    v61 = v9;
    p_super = &v22->super;
    v57 = v16;
    if (v25)
      v26 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v25));
    else
      v26 = objc_opt_new(NSSet);
    v27 = v26;
    v58 = v13;
    -[DMDActivationBudgetObserver setNotificationTimes:](self, "setNotificationTimes:", v26);

    v28 = objc_opt_new(NSMutableDictionary);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v59 = v4;
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadTimeBudget"));
    v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "payloadDays"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "payloadSeconds"));
          v37 = -[DMDActivationBudgetObserver _budgetDays:duration:calendar:schedule:](self, "_budgetDays:duration:calendar:schedule:", v35, v36, v7, v28);

          if ((v37 & 1) == 0)
          {
            v51 = DMFConfigurationEngineLog(v38);
            v52 = objc_claimAutoreleasedReturnValue(v51);
            v19 = p_super;
            v49 = v62;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              sub_10007125C();

            v20 = 0;
            v13 = v58;
            v4 = v59;
            v16 = v57;
            v50 = v55;
            goto LABEL_36;
          }
        }
        v31 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
        if (v31)
          continue;
        break;
      }
    }

    v39 = objc_alloc((Class)USBudget);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarIdentifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v42 = objc_msgSend(v39, "initWithCategories:applications:webDomains:schedule:calendarIdentifier:identifier:", v55, p_super, v62, v28, v40, v41);
    -[DMDActivationBudgetObserver setUsageBudget:](self, "setUsageBudget:", v42);

    v44 = DMFConfigurationEngineLog(v43);
    v29 = objc_claimAutoreleasedReturnValue(v44);
    v20 = 1;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v45 = objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver calendarIdentifier](self, "calendarIdentifier"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver notificationTimes](self, "notificationTimes"));
      *(_DWORD *)buf = 138545154;
      v68 = v54;
      v69 = 2114;
      v70 = v45;
      v48 = (void *)v45;
      v71 = 2114;
      v72 = v46;
      v73 = 2114;
      v74 = p_super;
      v75 = 2114;
      v76 = v55;
      v77 = 2114;
      v49 = v62;
      v78 = v62;
      v79 = 2114;
      v80 = v47;
      v81 = 2114;
      v82 = v28;
      v20 = 1;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, budgeted application identifiers: %{public}@, budgeted category identifiers: %{public}@, budgeted website identifiers: %{public}@, notification times: %{public}@, budget schedule: %{public}@", buf, 0x52u);

      v50 = v55;
      v13 = v58;
      v4 = v59;
      v19 = p_super;
      v16 = v57;
    }
    else
    {
      v50 = v55;
      v13 = v58;
      v4 = v59;
      v19 = p_super;
      v16 = v57;
      v49 = v62;
    }
LABEL_36:

    v9 = v61;
  }
  else
  {
    v18 = DMFConfigurationEngineLog(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000711D0();
    v20 = 0;
  }

  return v20;
}

- (BOOL)_budgetDays:(id)a3 duration:(id)a4 calendar:(id)a5 schedule:(id)a6
{
  id v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  void *i;
  void *v26;
  char *v27;
  void *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (char *)objc_msgSend(a5, "maximumRangeOfUnit:", 512);
  v14 = v13;
  if (!objc_msgSend(v9, "count"))
  {
    v15 = objc_opt_new(NSMutableArray);
    if (v12 < &v12[v14])
    {
      v16 = v14;
      v17 = v12;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
        -[NSMutableArray addObject:](v15, "addObject:", v18);

        ++v17;
        --v16;
      }
      while (v16);
    }
    v19 = -[NSMutableArray copy](v15, "copy");

    v9 = v19;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v21)
  {
    v31 = 1;
    goto LABEL_25;
  }
  v22 = v21;
  v23 = *(_QWORD *)v37;
  v24 = (unint64_t)&v12[v14 - 1];
  while (2)
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v23)
        objc_enumerationMutation(v20);
      v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      v27 = (char *)objc_msgSend(v26, "unsignedIntegerValue");
      if (v27 < v12 || (unint64_t)v27 > v24)
      {
        v32 = DMFConfigurationEngineLog(v27);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_1000712E8();
        goto LABEL_24;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v26));

      if (v29)
      {
        v34 = DMFConfigurationEngineLog(v30);
        v33 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_10007139C();
LABEL_24:

        v31 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v26);
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v31 = 1;
    if (v22)
      continue;
    break;
  }
LABEL_25:

  return v31;
}

- (BOOL)_registerPredicateObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageBudget](self, "usageBudget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageMonitor](self, "usageMonitor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver usageBudget](self, "usageBudget"));
  v28 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationBudgetObserver notificationTimes](self, "notificationTimes"));
  v19 = 0;
  v9 = objc_msgSend(v5, "startMonitoringBudgets:darwinNotificationName:notificationTimes:error:", v7, CFSTR("com.apple.dmd.budget.didChange"), v8, &v19);
  v10 = v19;

  v12 = DMFConfigurationEngineLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((v9 & 1) == 0)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugDescription"));
    *(_DWORD *)buf = 138544130;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v4;
    v26 = 2114;
    v27 = v18;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed starting usage monitor with budget identifier: %{public}@, error: %{public}@", buf, 0x2Au);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded starting usage monitor with budget identifier: %{public}@", buf, 0x20u);
LABEL_4:

  }
LABEL_6:

  return v9;
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

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTime, a3);
}

- (NSMutableArray)expiredNotificationTimes
{
  return self->_expiredNotificationTimes;
}

- (void)setExpiredNotificationTimes:(id)a3
{
  objc_storeStrong((id *)&self->_expiredNotificationTimes, a3);
}

- (USBudget)usageBudget
{
  return self->_usageBudget;
}

- (void)setUsageBudget:(id)a3
{
  objc_storeStrong((id *)&self->_usageBudget, a3);
}

- (USUsageMonitor)usageMonitor
{
  return self->_usageMonitor;
}

- (void)setUsageMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_usageMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_usageBudget, 0);
  objc_storeStrong((id *)&self->_expiredNotificationTimes, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_notificationTimes, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end
