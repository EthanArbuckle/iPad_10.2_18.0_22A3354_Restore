@implementation _DASPolicyDataCollection

+ (id)sharedInstance
{
  if (qword_1001AB468 != -1)
    dispatch_once(&qword_1001AB468, &stru_10015D780);
  return (id)qword_1001AB460;
}

- (_DASPolicyDataCollection)init
{
  _DASPolicyDataCollection *v2;
  NSUserDefaults *v3;
  NSUserDefaults *policyDataCollectionDefaults;
  uint64_t v5;
  NSDate *lastEval;
  NSMutableDictionary *v7;
  NSMutableDictionary *priorityToIntensiveBlockingPolicies;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *taskToBlockingPolicies;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  NSDate *v21;
  void *v22;
  NSObject *v23;
  dispatch_source_t v24;
  OS_dispatch_source *policyDataCollectionTimer;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)_DASPolicyDataCollection;
  v2 = -[_DASPolicyDataCollection init](&v27, "init");
  if (v2)
  {
    v3 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler.policydatacollection"));
    policyDataCollectionDefaults = v2->_policyDataCollectionDefaults;
    v2->_policyDataCollectionDefaults = v3;

    v5 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_policyDataCollectionDefaults, "objectForKey:", CFSTR("LastEvaluationDate")));
    lastEval = v2->_lastEval;
    v2->_lastEval = (NSDate *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    priorityToIntensiveBlockingPolicies = v2->_priorityToIntensiveBlockingPolicies;
    v2->_priorityToIntensiveBlockingPolicies = v7;

    v9 = v2->_priorityToIntensiveBlockingPolicies;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &off_10016E510, v10);

    v11 = v2->_priorityToIntensiveBlockingPolicies;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", &off_10016E510, v12);

    v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10016F440));
    v14 = (void *)qword_1001AB470;
    qword_1001AB470 = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    taskToBlockingPolicies = v2->_taskToBlockingPolicies;
    v2->_taskToBlockingPolicies = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = v17;
    if (!v2->_lastEval || (objc_msgSend(v17, "timeIntervalSinceDate:"), v19 > 1800.0))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v18, -900.0));
      v21 = v2->_lastEval;
      v2->_lastEval = (NSDate *)v20;

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "evaluationQueue"));
    v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
    policyDataCollectionTimer = v2->_policyDataCollectionTimer;
    v2->_policyDataCollectionTimer = (OS_dispatch_source *)v24;

  }
  return v2;
}

- (void)scheduleTelemetry
{
  NSObject *policyDataCollectionTimer;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD handler[5];

  policyDataCollectionTimer = self->_policyDataCollectionTimer;
  v4 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(policyDataCollectionTimer, v4, 0xD18C2E2800uLL, 0x3B9ACA00uLL);
  v5 = self->_policyDataCollectionTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000292D8;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_policyDataCollectionTimer);
}

- (void)evaluateAndReportBlockingReasonsForAllCriteria
{
  void *v2;
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id i;
  void *v9;
  NSMutableDictionary *v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  id obj;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  char *v60;
  char v61;
  NSMutableDictionary *v62;
  void *v63;
  char v64;
  NSMutableDictionary *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  char *v70;
  char *v71;
  NSMutableArray *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[6];
  _QWORD v79[7];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  id v85;
  uint64_t v86;
  _QWORD v87[5];
  id v88;
  void *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _QWORD v103[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
  v103[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
  v103[1] = v4;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 2));

  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_10016E510, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
  v62 = v5;
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_10016E510, v7);

  v54 = objc_opt_new(NSMutableArray);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v2;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  if (!v58)
  {
    v66 = 0;
    goto LABEL_36;
  }
  v66 = 0;
  v56 = *(_QWORD *)v96;
  do
  {
    for (i = 0; i != v58; i = v31 + 1)
    {
      if (*(_QWORD *)v96 != v56)
        objc_enumerationMutation(obj);
      v60 = (char *)i;
      v9 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
      v10 = objc_opt_new(NSMutableDictionary);
      v11 = (objc_class *)objc_opt_class(v9);
      v12 = NSStringFromClass(v11);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v65 = v10;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_DAS"), &stru_1001617C8));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v13 = v57;
      v70 = (char *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      if (!v70)
      {

LABEL_31:
        v32 = v59;
        v31 = v60;
        goto LABEL_32;
      }
      v61 = 0;
      v64 = 0;
      v67 = 0;
      v68 = *(_QWORD *)v92;
      v69 = v13;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v92 != v68)
            objc_enumerationMutation(v13);
          v15 = 0;
          v16 = 0;
          v71 = v14;
          v17 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v14);
          do
          {
            v18 = objc_autoreleasePoolPush();
            v19 = objc_msgSend(v17, "unsignedLongValue");
            v20 = _DASActivityDurationShort;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", CFSTR("com.apple.dasd.PolicyDataCollectionActivity"), v19, v20, v21, v22));

            -[_DASPolicyDataCollection setCriteriaForActivity:withCriteriaIndex:](self, "setCriteriaForActivity:withCriteriaIndex:", v23, v16);
            if (objc_msgSend(v9, "appliesToActivity:", v23))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "context"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "responseForActivity:withState:", v23, v25));

              if (objc_msgSend(v26, "policyDecision") == (id)33 || objc_msgSend(v26, "policyDecision") == (id)100)
              {
                if (!v16)
                {

                  objc_autoreleasePoolPop(v18);
                  v15 = 0x1FFFLL;
                  goto LABEL_22;
                }
                v15 |= (1 << v16);
              }

            }
            objc_autoreleasePoolPop(v18);
            ++v16;
          }
          while (v16 != 13);
          if (!v15)
            goto LABEL_25;
LABEL_22:
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v15));
          -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", v27, v17);

          v28 = v15 & 0x11B7;
          if ((v15 & 0x11B7) != 0)
          {
            v67 |= v28;
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", v17));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v29, "unsignedLongValue") | v28));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v30, v17);

            v66 |= v28;
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = sub_100029C8C;
            v87[3] = &unk_10015D7A8;
            v87[4] = self;
            v90 = v15 & 0x11B7;
            v88 = v63;
            v89 = v17;
            AnalyticsSendEventLazy(CFSTR("com.apple.dasd.metrics.PoliciesBlockingPriorityWithCriteria"), v87);

            v61 = 1;
          }
          v64 = 1;
LABEL_25:
          v13 = v69;
          v14 = v71 + 1;
        }
        while (v71 + 1 != v70);
        v70 = (char *)objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v70);

      if ((v64 & 1) == 0)
        goto LABEL_31;
      -[NSMutableArray addObject:](v54, "addObject:", v65);
      v32 = v59;
      v31 = v60;
      if ((v61 & 1) != 0)
      {
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_100029C9C;
        v84[3] = &unk_10015D7D0;
        v84[4] = self;
        v86 = v67;
        v85 = v63;
        AnalyticsSendEventLazy(CFSTR("com.apple.dasd.metrics.PoliciesBlockingCriteria"), v84);

      }
LABEL_32:

    }
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  }
  while (v58);
LABEL_36:

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v33 = v57;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(_QWORD *)v81 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", v38));
        v40 = objc_msgSend(v39, "unsignedLongValue");

        if (v40)
        {
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_100029CB0;
          v79[3] = &unk_10015D7D0;
          v79[5] = v38;
          v79[6] = v40;
          v79[4] = self;
          AnalyticsSendEventLazy(CFSTR("com.apple.dasd.metrics.BlockedPriorityWithCriteria"), v79);
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
    }
    while (v35);
  }

  if (v66)
  {
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100029CC4;
    v78[3] = &unk_10015D7F8;
    v78[4] = self;
    v78[5] = v66;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.metrics.BlockedCriteria"), v78);
  }
  v41 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    sub_1000E0410((uint64_t)v54, v41);

  PLLogRegisteredEvent(70, CFSTR("DASPoliciesBlockingCriteria"), +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v54, CFSTR("Evaluations")), 0);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = v54;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(_QWORD *)v75 != v44)
          objc_enumerationMutation(v72);
        v46 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)k);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v48));
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, CFSTR("Maintenance"));

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v50));
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, CFSTR("Utility"));

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("Policy")));
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v52, CFSTR("Policy"));

        v53 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
        objc_msgSend(v53, "sendDataToPPS:subsystem:category:", v47, CFSTR("BackgroundProcessing"), CFSTR("DASPoliciesBlockingCriteria"));

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
    }
    while (v43);
  }

  -[_DASPolicyDataCollection noteEvaluationTime](self, "noteEvaluationTime");
}

- (id)dictForCAWithBitmap:(unint64_t)a3 policyName:(id)a4 priority:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("PolicyName"));
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", objc_msgSend(v9, "unsignedIntValue")));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Priority"));

  }
  if (a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3 & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("NoCriteria"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 1) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("RequiresPlugin"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 2) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("RequiresNetwork"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 4) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("RequiresDeviceInactivity"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 5) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("RequiresSignificantUserInactivity"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 7) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("IsIntensive"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 8) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("RequiresFileProtectionComplete"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (a3 >> 12) & 1));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("RequiresWidgetBudget"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstanceForNamespace:](_DASTrialManager, "sharedInstanceForNamespace:", CFSTR("COREOS_DAS")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "experimentID"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "experimentID"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("trialExperimentId"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "treatmentID"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("trialTreatmentId"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v21, "deploymentID")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringValue"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("trialDeploymentId"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_DASPolicyDataCollection timeInMinutesSinceLastEvaluation](self, "timeInMinutesSinceLastEvaluation")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("DurationMinutes"));

  return v11;
}

- (void)setCriteriaForActivity:(id)a3 withCriteriaIndex:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  switch(a4)
  {
    case 1:
      objc_msgSend(v5, "setRequiresPlugin:", 1);
      goto LABEL_15;
    case 2:
      objc_msgSend(v5, "setRequiresNetwork:", 1);
      goto LABEL_15;
    case 3:
      objc_msgSend(v5, "setRequiresInexpensiveNetworking:", 1);
      goto LABEL_15;
    case 4:
      objc_msgSend(v5, "setRequiresDeviceInactivity:", 1);
      goto LABEL_15;
    case 5:
      objc_msgSend(v5, "setRequiresSignificantUserInactivity:", 1);
      goto LABEL_15;
    case 6:
      objc_msgSend(v5, "setTriggersRestart:", 1);
      goto LABEL_15;
    case 7:
      objc_msgSend(v5, "setCpuIntensive:", 1);
      objc_msgSend(v8, "setMemoryIntensive:", 1);
      objc_msgSend(v8, "setDiskIntensive:", 1);
      objc_msgSend(v8, "setAneIntensive:", 1);
      objc_msgSend(v8, "setGpuIntensive:", 1);
      goto LABEL_15;
    case 8:
      v6 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
      goto LABEL_11;
    case 9:
      v6 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
LABEL_11:
      v7 = (void *)v6;
      objc_msgSend(v8, "setFileProtection:", v6);

      goto LABEL_15;
    case 10:
      objc_msgSend(v5, "setBudgeted:", 1);
      goto LABEL_15;
    case 11:
      objc_msgSend(v5, "setDataBudgeted:", 1);
      goto LABEL_15;
    case 12:
      objc_msgSend(v5, "setRemoteDevice:", CFSTR("test"));
      objc_msgSend(v8, "setWidgetID:", CFSTR("widgetID"));
LABEL_15:
      v5 = v8;
      break;
    default:
      break;
  }

}

- (unint64_t)timeInMinutesSinceLastEvaluation
{
  void *v3;
  void *v4;
  double v5;
  NSDate *v6;
  NSDate *lastEval;
  double v8;
  unint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = v3;
  if (!self->_lastEval || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 1800.0))
  {
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v4, -900.0));
    lastEval = self->_lastEval;
    self->_lastEval = v6;

  }
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastEval);
  v9 = (unint64_t)((double)(unint64_t)v8 / 60.0);

  return v9;
}

- (void)noteEvaluationTime
{
  NSDate *v3;
  NSDate *lastEval;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastEval = self->_lastEval;
  self->_lastEval = v3;

  -[NSUserDefaults setObject:forKey:](self->_policyDataCollectionDefaults, "setObject:forKey:", self->_lastEval, CFSTR("LastEvaluationDate"));
}

- (BOOL)shouldReportBlockingReasonsForActivity:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isIntensive") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)qword_1001AB470;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      v4 = objc_msgSend(v6, "containsObject:", v7);

    }
  }

  return v4;
}

- (void)reportBlockingReason:(unint64_t)a3 forActivity:(id)a4
{
  NSMutableDictionary *priorityToIntensiveBlockingPolicies;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *taskToBlockingPolicies;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v27;

  v27 = a4;
  if (objc_msgSend(v27, "isIntensive"))
  {
    priorityToIntensiveBlockingPolicies = self->_priorityToIntensiveBlockingPolicies;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "schedulingPriority")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](priorityToIntensiveBlockingPolicies, "objectForKeyedSubscript:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v8, "unsignedLongLongValue") | a3));
    v10 = self->_priorityToIntensiveBlockingPolicies;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "schedulingPriority")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fastPass"));
  if (v12)
  {

    v13 = v27;
  }
  else
  {
    v14 = (void *)qword_1001AB470;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

    v13 = v27;
    if (!(_DWORD)v14)
      goto LABEL_9;
  }
  taskToBlockingPolicies = self->_taskToBlockingPolicies;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](taskToBlockingPolicies, "objectForKey:", v17));

  if (!v18)
  {
    v19 = self->_taskToBlockingPolicies;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &off_10016E510, v20);

  }
  v21 = self->_taskToBlockingPolicies;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v23, "unsignedLongLongValue") | a3));
  v25 = self->_taskToBlockingPolicies;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

  v13 = v27;
LABEL_9:

}

- (void)reportPolicyBlockingReasonsForIntensiveTasksToPPS
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _QWORD v30[2];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityMaintenance));
  v30[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", _DASSchedulingPriorityUtility));
  v30[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_priorityToIntensiveBlockingPolicies, "objectForKeyedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", objc_msgSend(v12, "unsignedIntValue")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  -[_DASPolicyDataCollection sendDataToPPS:subsystem:category:](self, "sendDataToPPS:subsystem:category:", v3, CFSTR("BackgroundProcessing"), CFSTR("IntensiveTasksBlockingPolicies"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_priorityToIntensiveBlockingPolicies, "setObject:forKeyedSubscript:", &off_10016E510, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (void)reportPolicyBlockingReasonsForSpecificTasksToPPS
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_taskToBlockingPolicies, "allKeys"));
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = v3;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
          v9 = objc_opt_new(NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, CFSTR("TaskName"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_taskToBlockingPolicies, "objectForKeyedSubscript:", v8));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, CFSTR("BlockingPolicies"));

          -[_DASPolicyDataCollection sendDataToPPS:subsystem:category:](self, "sendDataToPPS:subsystem:category:", v9, CFSTR("BackgroundProcessing"), CFSTR("TaskBlockingPolicies"));
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    -[NSMutableDictionary removeAllObjects](self->_taskToBlockingPolicies, "removeAllObjects");
    v3 = v11;
  }

}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v11 = objc_msgSend(v10, "sendDataToPPS:subsystem:category:", v9, v8, v7);

  return v11;
}

- (OS_dispatch_source)policyDataCollectionTimer
{
  return self->_policyDataCollectionTimer;
}

- (void)setPolicyDataCollectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_policyDataCollectionTimer, a3);
}

- (NSUserDefaults)policyDataCollectionDefaults
{
  return self->_policyDataCollectionDefaults;
}

- (void)setPolicyDataCollectionDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_policyDataCollectionDefaults, a3);
}

- (NSDate)lastEval
{
  return self->_lastEval;
}

- (void)setLastEval:(id)a3
{
  objc_storeStrong((id *)&self->_lastEval, a3);
}

- (NSMutableDictionary)priorityToIntensiveBlockingPolicies
{
  return self->_priorityToIntensiveBlockingPolicies;
}

- (void)setPriorityToIntensiveBlockingPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_priorityToIntensiveBlockingPolicies, a3);
}

- (NSMutableDictionary)taskToBlockingPolicies
{
  return self->_taskToBlockingPolicies;
}

- (void)setTaskToBlockingPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_taskToBlockingPolicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToBlockingPolicies, 0);
  objc_storeStrong((id *)&self->_priorityToIntensiveBlockingPolicies, 0);
  objc_storeStrong((id *)&self->_lastEval, 0);
  objc_storeStrong((id *)&self->_policyDataCollectionDefaults, 0);
  objc_storeStrong((id *)&self->_policyDataCollectionTimer, 0);
}

@end
