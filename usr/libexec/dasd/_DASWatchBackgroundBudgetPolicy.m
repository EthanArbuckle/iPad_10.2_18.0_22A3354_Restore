@implementation _DASWatchBackgroundBudgetPolicy

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[5];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_snapshotBudgetKeyPath));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_launchBudgetKeyPath));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_queriesKeyPath));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_sessionInProgressKeyPath));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_ineligibleAppsKeyPath));
  v23[0] = CFSTR("identifier");
  v23[1] = CFSTR("predicate");
  v24[0] = CFSTR("com.apple.duetactivityscheduler.backgroundbudget.snapshot");
  v24[1] = v14;
  v23[2] = CFSTR("deviceSet");
  v23[3] = CFSTR("mustWake");
  v24[2] = &off_10016E948;
  v24[3] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
  v25[0] = v12;
  v21[0] = CFSTR("identifier");
  v21[1] = CFSTR("predicate");
  v22[0] = CFSTR("com.apple.duetactivityscheduler.backgroundbudget.launch");
  v22[1] = v13;
  v21[2] = CFSTR("deviceSet");
  v21[3] = CFSTR("mustWake");
  v22[2] = &off_10016E948;
  v22[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
  v25[1] = v3;
  v19[0] = CFSTR("identifier");
  v19[1] = CFSTR("predicate");
  v20[0] = CFSTR("/watch/launch/queries");
  v20[1] = v11;
  v19[2] = CFSTR("deviceSet");
  v19[3] = CFSTR("mustWake");
  v20[2] = &off_10016E948;
  v20[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v25[2] = v4;
  v17[0] = CFSTR("identifier");
  v17[1] = CFSTR("predicate");
  v18[0] = CFSTR("com.apple.duetactivityscheduler.session.inprogress");
  v18[1] = v9;
  v17[2] = CFSTR("deviceSet");
  v17[3] = CFSTR("mustWake");
  v18[2] = &off_10016E948;
  v18[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
  v25[3] = v5;
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("predicate");
  v16[0] = CFSTR("com.apple.dasd.watch.ineligibleApps");
  v16[1] = v10;
  v15[2] = CFSTR("deviceSet");
  v15[3] = CFSTR("mustWake");
  v16[2] = &off_10016E948;
  v16[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
  v25[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5));

  return v7;
}

- (_DASWatchBackgroundBudgetPolicy)init
{
  _DASWatchBackgroundBudgetPolicy *v2;
  _DASWatchBackgroundBudgetPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *snapshotBudgetKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *launchBudgetKeyPath;
  uint64_t v9;
  _CDContextualKeyPath *queriesKeyPath;
  uint64_t v11;
  _CDContextualKeyPath *sessionInProgressKeyPath;
  uint64_t v13;
  _CDContextualKeyPath *ineligibleAppsKeyPath;
  uint64_t v15;
  NSArray *triggers;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DASWatchBackgroundBudgetPolicy;
  v2 = -[_DASWatchBackgroundBudgetPolicy init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Watch Background Budget Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/watch/budget/snapshots")));
    snapshotBudgetKeyPath = v3->_snapshotBudgetKeyPath;
    v3->_snapshotBudgetKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/watch/budget/launches")));
    launchBudgetKeyPath = v3->_launchBudgetKeyPath;
    v3->_launchBudgetKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/watch/launch/queries")));
    queriesKeyPath = v3->_queriesKeyPath;
    v3->_queriesKeyPath = (_CDContextualKeyPath *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/session/inProgress")));
    sessionInProgressKeyPath = v3->_sessionInProgressKeyPath;
    v3->_sessionInProgressKeyPath = (_CDContextualKeyPath *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/watch/launch/ineligibleApps")));
    ineligibleAppsKeyPath = v3->_ineligibleAppsKeyPath;
    v3->_ineligibleAppsKeyPath = (_CDContextualKeyPath *)v13;

    v15 = objc_claimAutoreleasedReturnValue(-[_DASWatchBackgroundBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v15;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B944;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB9F0 != -1)
    dispatch_once(&qword_1001AB9F0, block);
  return (id)qword_1001AB9F8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.session.inprogress")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBacklightOnStatus](_CDContextQueries, "keyPathForBacklightOnStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _DASBudgetDictionaryKey));

  if (v5)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "requestsApplicationLaunch");

  return v6;
}

- (BOOL)sessionInProgress:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_sessionInProgressKeyPath));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)applicationForActivity:(id)a3 isDisallowedWithContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", self->_ineligibleAppsKeyPath));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications", 0));
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
        if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  unsigned int v9;
  void *v10;
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
  unsigned int v22;
  uint64_t v23;
  _CDContextualKeyPath *snapshotBudgetKeyPath;
  void *v25;
  int v26;
  uint64_t v27;
  void *v29;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Watch Background Budget Policy"));
  v9 = -[_DASWatchBackgroundBudgetPolicy applicationForActivity:isDisallowedWithContext:](self, "applicationForActivity:isDisallowedWithContext:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  v11 = v10;
  if (!v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", _DASBudgetDictionaryKey));

    if (objc_msgSend(v19, "isEqualToString:", CFSTR("/watch/launch/queries")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_queriesKeyPath));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v13));
      v22 = objc_msgSend(v21, "intValue");

      if (!v22)
      {
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("queriesBudgetValue"), 1.0, 0.0);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_launchBudgetKeyPath));

        v20 = (void *)v23;
      }
    }
    else
    {
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("/watch/budget/snapshots")))
      {
        snapshotBudgetKeyPath = self->_snapshotBudgetKeyPath;
      }
      else
      {
        if (!objc_msgSend(v19, "isEqualToString:", CFSTR("/watch/budget/launches")))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("budgetKey == nil")));
          -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, v8, (double)0x384uLL));
LABEL_15:

          goto LABEL_16;
        }
        snapshotBudgetKeyPath = self->_launchBudgetKeyPath;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", snapshotBudgetKeyPath));
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v13));
    v26 = objc_msgSend(v25, "intValue");

    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("budgetValue"), 1.0, (double)v26);
    if (v26 <= 0)
      v27 = 33;
    else
      v27 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v27, v8, (double)0x384uLL));

    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(",")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is disallowed"), v13));
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", v14, 0.0, 1.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
  objc_msgSend(v15, "cancelActivities:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 100, v8, (double)0x384uLL));
LABEL_16:

  return v17;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (_CDContextualKeyPath)snapshotBudgetKeyPath
{
  return self->_snapshotBudgetKeyPath;
}

- (void)setSnapshotBudgetKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBudgetKeyPath, a3);
}

- (_CDContextualKeyPath)launchBudgetKeyPath
{
  return self->_launchBudgetKeyPath;
}

- (void)setLaunchBudgetKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_launchBudgetKeyPath, a3);
}

- (_CDContextualKeyPath)queriesKeyPath
{
  return self->_queriesKeyPath;
}

- (void)setQueriesKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_queriesKeyPath, a3);
}

- (_CDContextualKeyPath)sessionInProgressKeyPath
{
  return self->_sessionInProgressKeyPath;
}

- (void)setSessionInProgressKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInProgressKeyPath, a3);
}

- (_CDContextualKeyPath)ineligibleAppsKeyPath
{
  return self->_ineligibleAppsKeyPath;
}

- (void)setIneligibleAppsKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_ineligibleAppsKeyPath, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_ineligibleAppsKeyPath, 0);
  objc_storeStrong((id *)&self->_sessionInProgressKeyPath, 0);
  objc_storeStrong((id *)&self->_queriesKeyPath, 0);
  objc_storeStrong((id *)&self->_launchBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_snapshotBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
