@implementation _DASConditionScore

+ (void)setActivityShouldBypassPredictions:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = objc_msgSend(v9, "schedulingPriority");
  if ((unint64_t)v3 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v9))
  {
    v4 = 1;
    v5 = v9;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "launchReason"));
    v7 = objc_msgSend(v6, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification);

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fastPass"));

      v5 = v9;
      v4 = v8 != 0;
    }
  }
  objc_msgSend(v5, "setBypassesPredictions:", v4);

}

+ (void)computeOptimalScoreAndDateForActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  void *i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  double v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  double v45;
  double v46;
  void *j;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  double v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  _BYTE v83[128];

  v3 = a3;
  v4 = (void *)os_transaction_create("com.apple.dasd.scoreForActivity");
  if (qword_1001ABA40 != -1)
    dispatch_once(&qword_1001ABA40, &stru_10015E988);
  v5 = objc_autoreleasePoolPush();
  if (objc_msgSend(v3, "bypassesPredictions"))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000E38DC((uint64_t)v3, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startAfter"));
    objc_msgSend(v3, "setPredictedOptimalStartDate:", v7);

    objc_msgSend(v3, "setPredictedOptimalScore:", 0.01);
    goto LABEL_60;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startAfter"));
  v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSObject timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v9);
  if (v10 > 75600.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startAfter"));
    objc_msgSend(v3, "setPredictedOptimalStartDate:", v11);

    objc_msgSend(v3, "setPredictedOptimalScore:", 0.01);
    v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ start beyond the 21 hour interval", buf, 0xCu);
    }
    goto LABEL_59;
  }
  v64 = v8;
  v61 = v4;
  v62 = v9;
  v60 = v5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v12 = v13;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v71;
    v19 = 0.0;
    v20 = 0.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v18)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v22, "appliesToActivity:", v3))
        {
          if (objc_msgSend(v22, "conformsToProtocol:", &OBJC_PROTOCOL____DASActivityPolicyPredicting))
          {
            objc_msgSend(v15, "addObject:", v22);
          }
          else
          {
            objc_msgSend(v22, "weightForActivity:", v3);
            v24 = v23;
            if ((objc_opt_respondsToSelector(v22, "baselineScoreForActivity:") & 1) != 0)
            {
              objc_msgSend(v22, "baselineScoreForActivity:", v3);
              v20 = v20 + v24 * v25;
            }
            else
            {
              v20 = v20 + v24;
            }
            v19 = v19 + v24;
          }
        }
      }
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
  }

  v9 = v62;
  -[NSObject timeIntervalSinceDate:](v64, "timeIntervalSinceDate:", v62);
  if (v26 <= 0.0)
    v27 = v62;
  else
    v27 = v64;
  v8 = v27;

  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(v3, "setPredictedOptimalStartDate:", v8);
    v33 = v20 / v19;
    if (v19 < 0.001)
      v33 = 0.01;
    objc_msgSend(v3, "setPredictedOptimalScore:", v33);
    v34 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "predictedOptimalScore");
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA48, "stringFromDate:", v8));
      *(_DWORD *)buf = 138412802;
      v75 = v3;
      v76 = 2048;
      v77 = v36;
      v78 = 2112;
      v79 = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "WARNING NO POLICIES APPLY TO Activity %@: Optimal Score %.4f at %@", buf, 0x20u);

    }
    goto LABEL_58;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startBefore"));
  objc_msgSend(v28, "timeIntervalSinceDate:", v8);
  v30 = v29;

  v31 = fmax(fmin(v30, 86400.0), 0.0);
  v32 = 900.0;
  if (v31 <= 900.0)
  {
    v32 = 300.0;
  }
  else if (v31 > 14400.0)
  {
    if (objc_msgSend(v3, "requestsApplicationLaunch"))
      v32 = 900.0;
    else
      v32 = 1800.0;
  }
  v38 = v8;
  v39 = 0.01;
  v63 = v38;
  v59 = v31;
  while (1)
  {
    v40 = objc_autoreleasePoolPush();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v41 = v15;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    if (!v42)
    {

      goto LABEL_54;
    }
    v43 = v42;
    v65 = v40;
    v44 = *(_QWORD *)v67;
    v45 = 0.0;
    v46 = 0.0;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(v41);
        v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
        v49 = objc_autoreleasePoolPush();
        objc_msgSend(v48, "weightForActivity:", v3);
        v51 = v50;
        objc_msgSend(v48, "predictedScoreForActivity:atDate:", v3, v38);
        v45 = v45 + v51 * v52;
        v46 = v46 + v51;
        objc_autoreleasePoolPop(v49);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v43);

    if (v46 == 0.0)
    {
      v40 = v65;
      goto LABEL_54;
    }
    v53 = (v20 + v45) / (v19 + v46);
    v40 = v65;
    if (v39 < v53)
      break;
LABEL_54:
    v8 = objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v38, "dateByAddingTimeInterval:", v32));

    v31 = v31 - v32;
    objc_autoreleasePoolPop(v40);
    v38 = v8;
    if (v31 < 0.0)
      goto LABEL_55;
  }
  v8 = v38;

  if (v53 <= 0.9)
  {
    v39 = v53;
    v63 = v8;
    goto LABEL_54;
  }
  objc_autoreleasePoolPop(v65);
  v39 = v53;
  v63 = v8;
LABEL_55:
  objc_msgSend(v3, "setPredictedOptimalScore:", v39);
  objc_msgSend(v3, "setPredictedOptimalStartDate:", v63);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startAfter"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v54, v59));

  v56 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA48, "stringFromDate:", v63));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA48, "stringFromDate:", v55));
    *(_DWORD *)buf = 138413058;
    v75 = v3;
    v76 = 2048;
    v77 = v39;
    v78 = 2112;
    v79 = v57;
    v80 = 2112;
    v81 = v58;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@: Optimal Score %.4f at %@ (Valid Until: %@)", buf, 0x2Au);

  }
  v9 = v62;
  v34 = v63;
LABEL_58:

  v5 = v60;
  v4 = v61;
LABEL_59:

LABEL_60:
  objc_autoreleasePoolPop(v5);

}

+ (void)initialize
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  _QWORD v21[5];
  _QWORD v22[2];
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
  v22[0] = v3;
  v23[0] = CFSTR("maintenanceBlocked");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
  v22[1] = v4;
  v23[1] = CFSTR("utilityBlocked");
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  v6 = (void *)qword_1001ABA20;
  qword_1001ABA20 = v5;

  v7 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)qword_1001ABA28;
  qword_1001ABA28 = (uint64_t)v7;

  v9 = objc_opt_new(NSMutableSet);
  v10 = (void *)qword_1001ABA28;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  v12 = objc_opt_new(NSMutableSet);
  v13 = (void *)qword_1001ABA28;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  v15 = dispatch_queue_create("com.apple.das.conditionscore.metricsqueue", 0);
  v16 = (void *)qword_1001ABA30;
  qword_1001ABA30 = (uint64_t)v15;

  v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1001ABA30);
  v18 = (void *)qword_1001ABA38;
  qword_1001ABA38 = (uint64_t)v17;

  dispatch_set_qos_class_fallback(qword_1001ABA38, 17);
  v19 = qword_1001ABA38;
  v20 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(v19, v20, 0xD18C2E2800uLL, 0x3B9ACA00uLL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006D558;
  v21[3] = &unk_10015D3A8;
  v21[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001ABA38, v21);
  dispatch_activate((dispatch_object_t)qword_1001ABA38);
}

+ (void)reportBlockingAnalyticsAndReset
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id obj;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
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

  dispatch_assert_queue_V2((dispatch_queue_t)qword_1001ABA30);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getBucketForDate:withBucketDuration:", v3, 10800));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstanceForNamespace:](_DASTrialManager, "sharedInstanceForNamespace:", CFSTR("COREOS_DAS")));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)qword_1001ABA28;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
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
        v7 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA20, "objectForKeyedSubscript:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA28, "objectForKeyedSubscript:", v7));
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v10 = v18;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_10006D844;
              v21[3] = &unk_10015E968;
              v22 = v4;
              v23 = v15;
              v24 = v8;
              v25 = v9;
              v26 = v5;
              AnalyticsSendEventLazy(CFSTR("com.apple.dasd.policyBlockMetrics"), v21);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v12);
        }

        objc_msgSend(v9, "removeAllObjects");
        v6 = v20 + 1;
      }
      while ((id)(v20 + 1) != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v19);
  }

}

+ (id)getBucketForDate:(id)a3 withBucketDuration:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 28, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));
  objc_msgSend(v5, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(v10 / (double)a4)));
  return v11;
}

+ (id)getPriorityToBlockingPolicies
{
  return (id)qword_1001ABA28;
}

+ (id)getMetricsTimer
{
  return (id)qword_1001ABA38;
}

+ (BOOL)isPremiumClient:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v3)
    || (objc_msgSend(v3, "requiresSignificantUserInactivity") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      v5 = objc_msgSend(v8, "containsString:", CFSTR("apple.backupd."));

    }
  }

  return v5;
}

+ (double)scoreForActivity:(id)a3 withState:(id)a4 response:(int64_t *)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *j;
  id v52;
  id v53;
  float v54;
  double v55;
  void *v56;
  void *v57;
  void *v59;
  void *context;
  void *v62;
  void *v63;
  id v64;
  id obj;
  uint64_t v66;
  int64_t v67;
  id v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD block[4];
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  double v92;
  _BYTE v93[128];
  _BYTE v94[128];

  v6 = a3;
  v64 = a4;
  v59 = (void *)os_transaction_create("com.apple.dasd.scoreForActivity");
  context = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v8 = v6;
  objc_sync_enter(v8);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "policyResponseMetadata"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:"));

  objc_msgSend(v9, "setPolicyResponseMetadata:", 0);
  objc_msgSend(v9, "setLastDenialValue:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "policyResponseMetadata"));
  objc_msgSend(v11, "removeAllObjects");

  objc_sync_exit(v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v7;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
  if (v68)
  {
    v66 = *(_QWORD *)v78;
    v67 = 0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v68; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v66)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        v16 = objc_autoreleasePoolPush();
        v17 = objc_msgSend(v15, "appliesToActivity:", v9, v59);
        objc_msgSend(v15, "weightForActivity:", v9);
        v19 = v18;
        if ((v17 & 1) != 0)
        {
          v20 = objc_autoreleasePoolPush();
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "responseForActivity:withState:", v9, v64));
          objc_autoreleasePoolPop(v20);
          if (objc_msgSend(v21, "policyDecision") == (id)33 || objc_msgSend(v21, "policyDecision") == (id)100)
          {
            v22 = qword_1001ABA30;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10006E41C;
            block[3] = &unk_10015D558;
            v75 = v9;
            v76 = v15;
            dispatch_async(v22, block);

          }
          v23 = objc_msgSend(v21, "policyDecision");
          v24 = v67;
          if (v67 <= (uint64_t)v23)
            v24 = (int64_t)v23;
          v67 = v24;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyName"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[_DASConditionScore getResponseStringForPolicy:response:appliesToActivity:weightForActivity:](_DASConditionScore, "getResponseStringForPolicy:response:appliesToActivity:weightForActivity:", v25, v21, 1, v19));

          if (objc_msgSend(v21, "policyDecision"))
          {
            v27 = v69;
          }
          else
          {
            objc_msgSend(v21, "score");
            v13 = v13 + v19 * v28;
            v12 = v12 + v19;
            v27 = v63;
          }
          objc_msgSend(v27, "addObject:", v26);
          objc_msgSend(v21, "score");
          if (v29 <= 0.0)
          {
            v30 = v9;
            objc_sync_enter(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyName"));
            objc_msgSend(v30, "setLastDenialValue:", (unint64_t)objc_msgSend(v30, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v31));

            objc_sync_exit(v30);
          }
          v32 = v9;
          objc_sync_enter(v32);
          v33 = objc_alloc((Class)_DASInternalPolicyEvaluationMetadata);
          objc_msgSend(v21, "score");
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rationale"));
          v37 = objc_msgSend(v33, "initWithScore:reason:decision:", objc_msgSend(v36, "responseOptions"), objc_msgSend(v21, "policyDecision"), v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "policyResponseMetadata"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyName"));
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

          objc_sync_exit(v32);
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyName"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[_DASConditionScore getResponseStringForPolicy:response:appliesToActivity:weightForActivity:](_DASConditionScore, "getResponseStringForPolicy:response:appliesToActivity:weightForActivity:", v21, 0, 0, v19));
          objc_msgSend(v69, "addObject:", v26);
        }

        objc_autoreleasePoolPop(v16);
      }
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
    }
    while (v68);
  }
  else
  {
    v67 = 0;
    v12 = 0.0;
    v13 = 0.0;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "setLastScored:", v40);

  if (a5)
    *a5 = v67;
  v41 = 0.0;
  if (v67 != 100 && v67 != 33)
  {
    if (v67 || v12 == 0.0)
      v41 = 1.0;
    else
      v41 = v13 / v12;
  }
  v42 = v9;
  objc_sync_enter(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "policyResponseMetadata"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v62, CFSTR("scoreWhenRun"));

  objc_sync_exit(v42);
  if (v67)
  {
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "componentsJoinedByString:", &stru_1001617C8)));
    v45 = objc_msgSend(v44, "UTF8String");

    v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse abbreviatedDecision:](_DASPolicyResponse, "abbreviatedDecision:", v67));
      *(_DWORD *)buf = 138543874;
      v82 = v42;
      v83 = 2082;
      v84 = v45;
      v85 = 2114;
      v86 = *(double *)&v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], Decision: %{public}@}", buf, 0x20u);

    }
    goto LABEL_48;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v48 = v63;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(_QWORD *)v71 != v50)
          objc_enumerationMutation(v48);
        objc_msgSend(v69, "addObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j), v59);
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
    }
    while (v49);
  }

  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "componentsJoinedByString:", &stru_1001617C8)));
  v53 = objc_msgSend(v52, "UTF8String");

  if (v12 == 0.0)
  {
    v55 = 0.0;
  }
  else
  {
    v54 = v13 / v12;
    v55 = v54;
    if (v54 != 0.0)
    {
      v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse abbreviatedDecision:](_DASPolicyResponse, "abbreviatedDecision:", 0));
        *(_DWORD *)buf = 138544130;
        v82 = v42;
        v83 = 2082;
        v84 = v53;
        v85 = 2114;
        v86 = *(double *)&v56;
        v87 = 2048;
        v88 = v55;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], Decision: %{public}@ Score: %f}", buf, 0x2Au);

      }
      goto LABEL_48;
    }
  }
  v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring"), v59));
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse abbreviatedDecision:](_DASPolicyResponse, "abbreviatedDecision:", 0));
    *(_DWORD *)buf = 138544642;
    v82 = v42;
    v83 = 2082;
    v84 = v53;
    v85 = 2048;
    v86 = v13;
    v87 = 2048;
    v88 = v12;
    v89 = 2114;
    v90 = v57;
    v91 = 2048;
    v92 = v55;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], sumScores:%lf denominator:%f Decision: %{public}@ Score: %f}", buf, 0x3Eu);

  }
LABEL_48:

  objc_msgSend(v42, "setLastComputedScore:", v41);
  objc_autoreleasePoolPop(context);

  return v41;
}

+ (double)thresholdScoreForActivity:(id)a3
{
  id v3;
  double v4;
  int64_t v5;
  id v6;
  double v7;

  v3 = a3;
  if ((objc_msgSend(v3, "bypassesPredictions") & 1) != 0)
  {
    v4 = 0.01;
  }
  else
  {
    v5 = +[_DASConditionScore getTimeSlotForActivity:](_DASConditionScore, "getTimeSlotForActivity:", v3);
    v6 = objc_msgSend(v3, "schedulingPriority");
    objc_msgSend(v3, "predictedOptimalScore");
    +[_DASConditionScore getScoreForTimeSlot:activityPriority:activityScore:](_DASConditionScore, "getScoreForTimeSlot:activityPriority:activityScore:", v5, v6);
    v4 = v7;
  }

  return v4;
}

+ (int64_t)getTimeSlotForActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "predictedOptimalStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startBefore"));

  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "timeIntervalSinceDate:", v4);
  v10 = v9;

  if (v7 >= 0.01)
    v11 = (uint64_t)(v10 / (v7 / 10.0) + 1.0);
  else
    v11 = 10;
  v12 = v11 & ~(v11 >> 63);
  if (v12 >= 0xA)
    v13 = 10;
  else
    v13 = v12;

  return v13;
}

+ (double)getScoreForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4 activityScore:(double)a5
{
  double v6;

  +[_DASConditionScore relaxationFactorForTimeSlot:activityPriority:](_DASConditionScore, "relaxationFactorForTimeSlot:activityPriority:", a3, a4);
  return v6 * a5;
}

+ (double)relaxationFactorForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  +[_DASConditionScore preOptimalRelaxationFactor:](_DASConditionScore, "preOptimalRelaxationFactor:", a4);
  v7 = v6;
  if (a3)
  {
    if (_DASSchedulingPriorityUserInitiated <= a4)
    {
      v8 = 100.0;
      v9 = 1.0;
    }
    else if (_DASSchedulingPriorityUtility == a4)
    {
      v8 = 110.0;
      v9 = 1.35;
    }
    else if (_DASSchedulingPriorityDefault == a4)
    {
      v8 = 105.0;
      v9 = 1.2;
    }
    else if (_DASSchedulingPriorityBackground == a4)
    {
      v9 = 1.5;
      v8 = 120.0;
    }
    else
    {
      v9 = 1.0;
      if (_DASSchedulingPriorityMaintenance == a4)
        v9 = 1.7;
      v8 = 100.0;
      if (_DASSchedulingPriorityMaintenance == a4)
        v8 = 130.0;
    }
    return v7 * (1.0 - pow((double)(10 * a3) / v8, v9));
  }
  return v7;
}

+ (double)preOptimalRelaxationFactor:(unint64_t)a3
{
  double result;

  result = 0.75;
  if (_DASSchedulingPriorityUserInitiated > a3)
  {
    if (_DASSchedulingPriorityUtility == a3)
    {
      return 0.925;
    }
    else if (_DASSchedulingPriorityDefault == a3)
    {
      return 0.9;
    }
    else if (_DASSchedulingPriorityBackground == a3)
    {
      return 0.95;
    }
    else
    {
      result = 0.975;
      if (_DASSchedulingPriorityMaintenance != a3)
        return 0.75;
    }
  }
  return result;
}

+ (id)lastDenialResponses:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "lastDenialValue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (unint64_t)objc_msgSend(v3, "lastDenialValue");
    for (i = 0; i != 64; ++i)
    {
      if ((v5 & 1) != 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager policyForBitIndex:](_DASPolicyManager, "policyForBitIndex:", i));
        if (v7)
          objc_msgSend(v4, "addObject:", v7);

      }
      v5 >>= 1;
    }
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

+ (id)getResponseStringForPolicy:(id)a3 response:(id)a4 appliesToActivity:(BOOL)a5 weightForActivity:(double)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  NSMutableString *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "policyDecision") || (objc_msgSend(v11, "score"), v12 < 0.9)))
  {
    v13 = objc_opt_new(NSMutableString);
    -[NSMutableString appendFormat:](v13, "appendFormat:", CFSTR("\t{name: %@, "), v9);
    if (a5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      -[NSMutableString appendFormat:](v13, "appendFormat:", CFSTR("policyWeight: %2.3lf, response: %@}\n"), *(_QWORD *)&a6, v14);

    }
    else
    {
      -[NSMutableString appendString:](v13, "appendString:", CFSTR("response: N/A}\n"));
    }
  }
  else
  {
    v13 = (NSMutableString *)&stru_1001617C8;
  }

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
