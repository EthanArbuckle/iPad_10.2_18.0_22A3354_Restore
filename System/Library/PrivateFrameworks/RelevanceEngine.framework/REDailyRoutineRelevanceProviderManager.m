@implementation REDailyRoutineRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[REFeature isInDailyRoutineFeature](REFeature, "isInDailyRoutineFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (!v9)
  {
    v11 = objc_msgSend(v6, "type");
    if (v11)
    {
      if (v11 == 2)
      {
        v13 = 1;
        goto LABEL_10;
      }
      if (v11 != 1)
      {
        v14 = 0;
        goto LABEL_12;
      }
      v12 = 97;
    }
    else
    {
      v12 = 96;
    }
    v13 = *((unsigned __int8 *)&self->super.super.isa + v12);
LABEL_10:
    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v6, "type"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v14 = (void *)v10;
LABEL_12:

  return v14;
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  objc_msgSend(a4, "attributeForKey:", CFSTR("RETrainingContextDateKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
LABEL_6:
    -[REDailyRoutineRelevanceProviderManager _valueForProvider:feature:](self, "_valueForProvider:feature:", v10, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_6;
  +[REFeature isInDailyRoutineFeature](REFeature, "isInDailyRoutineFeature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if (!v13)
    goto LABEL_6;
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", -[REDailyRoutineRelevanceProviderManager _isInRoutine:forDate:](self, "_isInRoutine:forDate:", objc_msgSend(v10, "type"), v11));
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v15 = (void *)v14;

  return v15;
}

- (BOOL)_isInRoutine:(unint64_t)a3 forDate:(id)a4
{
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;

  v5 = a3 == 1;
  v6 = a4;
  if (a3)
    v7 = 2 * v5;
  else
    v7 = 1;
  +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRoutineInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsDate:", v6);

  if (v10)
  {
    v11 = objc_msgSend(v8, "currentRoutineType") == v7;
  }
  else
  {
    objc_msgSend(v8, "routineIntervalForPreviousRoutine:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsDate:", v6) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v8, "routineIntervalForNextRoutine:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v13, "containsDate:", v6);
      v12 = v13;
    }

  }
  return v11;
}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_prepareForUpdate
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentRoutineType");

  if (v4 == 1)
  {
    v5 = 0;
    self->_inMorningRoutine = 1;
  }
  else
  {
    self->_inMorningRoutine = REUpNextDemoAlwaysShowRoutines();
    v5 = v4 == 2 && !REUpNextDemoAlwaysShowRoutines();
  }
  self->_inEveningRoutine = v5;
}

- (void)_updateRoutines
{
  id v3;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v3);

}

- (BOOL)isInEveningRoutine
{
  return self->_inEveningRoutine;
}

- (BOOL)isInMorningRoutine
{
  return self->_inMorningRoutine;
}

@end
