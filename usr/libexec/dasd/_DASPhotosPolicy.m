@implementation _DASPhotosPolicy

+ (BOOL)isPhotosForegroundWithContext:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy focalApplicationsWithContext:](_DASApplicationPolicy, "focalApplicationsWithContext:", a3));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.mobileslideshow"));

  return v4;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(self), "isiCPLActivity:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend((id)objc_opt_class(self), "isCMMActivity:", v4);

  return v5;
}

+ (BOOL)isActivity:(id)a3 consideredNonDiscretionary:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v5)
    && (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:](_DASPhotosPolicy, "isPhotosSyncOverriddenWithContext:", v6)|| +[_DASPhotosPolicy isPhotosForegroundWithContext:](_DASPhotosPolicy, "isPhotosForegroundWithContext:", v6))|| +[_DASPhotosPolicy isCMMActivity:](_DASPhotosPolicy, "isCMMActivity:", v5)&& +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:](_DASPhotosPolicy, "isPhotosMessagesAppForegroundWithContext:", v6);

  return v7;
}

+ (BOOL)isiCPLActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dasd.DataCollection.PoliciesBlockingCriteria"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    if ((objc_msgSend(v7, "containsString:", CFSTR("com.apple.cloudphotod.sync.discretionary")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      if ((objc_msgSend(v8, "containsString:", CFSTR("com.apple.KeyValueService.Production.Private.sync")) & 1) != 0|| !objc_msgSend(v3, "requiresNetwork")|| (objc_msgSend(v3, "requestsApplicationLaunch") & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
        if ((objc_msgSend(v10, "containsObject:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
          v6 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.mobileslideshow.PhotosMessagesApp"));

        }
      }

    }
  }

  return v6;
}

+ (BOOL)isCMMActivity:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "requiresNetwork")
    && (objc_msgSend(v3, "requestsApplicationLaunch") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
    v4 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.mobileslideshow.PhotosMessagesApp"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)keyPathForPhotosBudgetOverride
{
  return (id)qword_1001AB8E0;
}

+ (BOOL)isPhotosSyncOverriddenWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");
  return (v6 >> 14) & 1;
}

+ (id)photosFocalAppStateChangedPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries appUsageBundleID](_CDContextQueries, "appUsageBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v2, CFSTR("ANY SELF.%@.value.%K == %@"), v3, v4, CFSTR("com.apple.mobileslideshow")));

  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/photos/significantWork")));
  v3 = (void *)qword_1001AB8D8;
  qword_1001AB8D8 = v2;

  v4 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/photos/budgetOverride")));
  v5 = (void *)qword_1001AB8E0;
  qword_1001AB8E0 = v4;

  v6 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/photos/isBlocked")));
  v7 = (void *)qword_1001AB8E8;
  qword_1001AB8E8 = v6;

  v8 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/photos/isBlocked/start")));
  v9 = (void *)qword_1001AB8F0;
  qword_1001AB8F0 = v8;

  v10 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/app/photos/isUnBlocked")));
  v11 = (void *)qword_1001AB8F8;
  qword_1001AB8F8 = v10;

}

- (id)initializeTriggers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[3];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", qword_1001AB8D8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", qword_1001AB8E0));
  v3 = objc_msgSend((id)objc_opt_class(self), "photosFocalAppStateChangedPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v16[0] = CFSTR("identifier");
  v16[1] = CFSTR("predicate");
  v17[0] = CFSTR("com.apple.dueatctivityscheduler.photospolicy.photoswork");
  v17[1] = v11;
  v16[2] = CFSTR("deviceSet");
  v16[3] = CFSTR("mustWake");
  v17[2] = &off_10016E840;
  v17[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
  v18[0] = v5;
  v14[0] = CFSTR("identifier");
  v14[1] = CFSTR("predicate");
  v15[0] = CFSTR("com.apple.duetactivityscheduler.photospolicy.budgetOverride");
  v15[1] = v10;
  v14[2] = CFSTR("deviceSet");
  v14[3] = CFSTR("mustWake");
  v15[2] = &off_10016E840;
  v15[3] = &__kCFBooleanTrue;
  v14[4] = CFSTR("qualityOfService");
  v15[4] = &off_10016E858;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));
  v18[1] = v6;
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("predicate");
  v13[0] = CFSTR("com.apple.duetactivityscheduler.photospolicy.appchanged");
  v13[1] = v4;
  v12[2] = CFSTR("deviceSet");
  v12[3] = CFSTR("mustWake");
  v13[2] = &off_10016E840;
  v13[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));
  v18[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));

  return v8;
}

- (_DASPhotosPolicy)init
{
  _DASPhotosPolicy *v2;
  _DASPhotosPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASPhotosPolicy;
  v2 = -[_DASPhotosPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Photos Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASPhotosPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F2F8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB900 != -1)
    dispatch_once(&qword_1001AB900, block);
  return (id)qword_1001AB908;
}

+ (id)keyPathForSignificantWorkRemaining
{
  return (id)qword_1001AB8D8;
}

+ (id)keyPathForPhotosIsBlocked
{
  return (id)qword_1001AB8E8;
}

+ (id)keyPathForBlockedStartDate
{
  return (id)qword_1001AB8F0;
}

+ (id)keyPathForPhotosIsUnBlocked
{
  return (id)qword_1001AB8F8;
}

+ (BOOL)isPhotosSyncActivity:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v4 = objc_msgSend(v3, "containsString:", CFSTR("com.apple.cloudphotod.sync.discretionary"));

  return v4;
}

+ (BOOL)shouldOverrideForIntentSync:(unint64_t)a3 activity:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = objc_msgSend(v5, "uploadSize");
  if (v6 == (id)_DASActivityTransferSizeZero || (unint64_t)objc_msgSend(v5, "uploadSize") > 0x19000)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    if (a3 && (a3 & 0xFFFFFFFFFFFFFAFDLL) == 0)
    {
      v9 = v5;
      objc_sync_enter(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "policyResponseMetadata"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](_DASNetworkQualityPolicy, "policyInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policyName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));
      v14 = objc_msgSend(v13, "reason");

      objc_sync_exit(v9);
      v7 = (a3 & 0x100) == 0 || v14 == (id)4;
    }
  }

  return v7;
}

- (BOOL)haveSignificantWorkRemaining:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", qword_1001AB8D8));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldOverrideBudgets:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", qword_1001AB8E0));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldOverrideSignificantWork:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");
  return (v6 >> 2) & 1;
}

- (BOOL)shouldOverrideAll:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");
  return (v6 >> 14) & 1;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  char v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.photospolicy.appchanged")))
  {
    v8 = +[_DASPhotosPolicy isPhotosForegroundWithContext:](_DASPhotosPolicy, "isPhotosForegroundWithContext:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.dueatctivityscheduler.photospolicy.photoswork")))
  {
    v8 = -[_DASPhotosPolicy haveSignificantWorkRemaining:](self, "haveSignificantWorkRemaining:", v7);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.photospolicy.budgetOverride")))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = -[_DASPhotosPolicy shouldOverrideBudgets:](self, "shouldOverrideBudgets:", v7);
  }
  v9 = v8 ^ 1;
LABEL_8:

  return v9;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (BOOL)isPhotosMessagesAppForegroundWithContext:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", qword_1001AB8E0));
  v4 = ((unint64_t)objc_msgSend(v3, "unsignedIntegerValue") >> 3) & 1;

  return v4;
}

- (BOOL)isLowPowerModeOverriddenForPhotos:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");
  return (v6 >> 5) & 1;
}

- (BOOL)isDataBudgetAvailableForPhotos:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  if (+[_DASDataBudgetPolicy isBudgetAvailable:](_DASDataBudgetPolicy, "isBudgetAvailable:", v3))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v4 = v7 & 1;
  }

  return v4;
}

- (BOOL)isEnergyBudgetAvailableForPhotos:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  if (+[_DASEnergyBudgetPolicy isBudgetAvailable:](_DASEnergyBudgetPolicy, "isBudgetAvailable:", v3))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
    v7 = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");

    v4 = (v7 >> 1) & 1;
  }

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  unsigned int v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  unsigned int v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Photos Policy"));
  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6)
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](_DASLowPowerModePolicy, "policyInstance")),
        v10 = objc_msgSend(v9, "isLowPowerModePolicyEnforced:", v7),
        v9,
        v10))
  {
    v11 = -[_DASPhotosPolicy isLowPowerModeOverriddenForPhotos:](self, "isLowPowerModeOverriddenForPhotos:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isLowPowerModeOverriddenForPhotos == %@"), v12));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v13);

    if (!v11)
    {
      -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 1);
      goto LABEL_17;
    }
    v14 = 67;
  }
  else
  {
    v14 = 0;
  }
  v15 = -[_DASPhotosPolicy isDataBudgetAvailableForPhotos:](self, "isDataBudgetAvailableForPhotos:", v7);
  v16 = -[_DASPhotosPolicy isEnergyBudgetAvailableForPhotos:](self, "isEnergyBudgetAvailableForPhotos:", v7);
  if (+[_DASPhotosPolicy isCMMActivity:](_DASPhotosPolicy, "isCMMActivity:", v6))
  {
    v17 = +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:](_DASPhotosPolicy, "isPhotosMessagesAppForegroundWithContext:", v7);
    v32 = v14;
    v33 = v6;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isCMMActivity == 1 && isPhotosMessagesAppForeground == %@ && isDataBudgetAvailable == %@ && isEnergyBudgetAvailable == %@"), v19, v20, v21));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v22);

    v14 = v32;
    v23 = v18 && v15 && v16;
    v6 = v33;
    if (v23)
      goto LABEL_14;
  }
  v24 = -[_DASPhotosPolicy shouldOverrideSignificantWork:](self, "shouldOverrideSignificantWork:", v7);
  v25 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", v7);
  if (!-[_DASPhotosPolicy haveSignificantWorkRemaining:](self, "haveSignificantWorkRemaining:", v7) || (v25 & 1) != 0)
    goto LABEL_12;
  if (!v24)
  {
    -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("significantWorkRemaining == 1 && pluggedIn == 0")));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

LABEL_17:
    v14 = 33;
    goto LABEL_18;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("shouldOverrideSignificantWork == %@"), v26));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v27);

LABEL_12:
  if (-[_DASPhotosPolicy shouldOverrideAll:](self, "shouldOverrideAll:", v7))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("shouldOverrideAll == 1")));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v28);

LABEL_14:
    v14 = 67;
  }
LABEL_18:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v14, v8, (double)0x384uLL));

  return v30;
}

- (BOOL)intentSyncIsEngaged
{
  return self->_intentSyncIsEngaged;
}

- (void)setIntentSyncIsEngaged:(BOOL)a3
{
  self->_intentSyncIsEngaged = a3;
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

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (BOOL)photosIsForeground
{
  return self->_photosIsForeground;
}

- (void)setPhotosIsForeground:(BOOL)a3
{
  self->_photosIsForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
