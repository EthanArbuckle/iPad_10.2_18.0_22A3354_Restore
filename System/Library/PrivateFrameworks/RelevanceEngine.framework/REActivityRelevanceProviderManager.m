@implementation REActivityRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature activitySummaryFeature](REFeature, "activitySummaryFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REActivityRelevanceProviderManager)initWithQueue:(id)a3
{
  REActivityRelevanceProviderManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REActivityRelevanceProviderManager;
  result = -[RERelevanceProviderManager initWithQueue:](&v4, sel_initWithQueue_, a3);
  if (result)
  {
    result->_activeEnergy = 0.0;
    result->_exerciseTime = 0.0;
    result->_standHour = 0.0;
  }
  return result;
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
  id v5;
  int v6;
  float exerciseTime;
  float standHour;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self->_activeEnergy < 1.0;
  exerciseTime = self->_exerciseTime;
  standHour = self->_standHour;
  if (v6 == objc_msgSend(v5, "closedActiveEngergy")
    || exerciseTime < 1.0 == objc_msgSend(v5, "closedExerciseTime"))
  {
    v9 = 0;
  }
  else
  {
    v9 = (standHour < 1.0) ^ objc_msgSend(v5, "closedStandHour");
  }
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](REActivitySummaryPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](REActivitySummaryPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_prepareForUpdate
{
  void *v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  id v8;

  +[RESingleton sharedInstance](REActivitySummaryPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeEnergyPercentComplete");
  self->_activeEnergy = v4;

  +[RESingleton sharedInstance](REActivitySummaryPredictor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exerciseTimePercentComplete");
  self->_exerciseTime = v6;

  +[RESingleton sharedInstance](REActivitySummaryPredictor, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "standHourPercentComplete");
  self->_standHour = v7;

}

- (void)predictorDidUpdate:(id)a3
{
  id v4;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

}

- (float)activeEnergy
{
  return self->_activeEnergy;
}

- (float)exerciseTime
{
  return self->_exerciseTime;
}

- (float)standHour
{
  return self->_standHour;
}

@end
