@implementation REWorkoutRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature workoutStateFeature](REFeature, "workoutStateFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REWorkoutRelevanceProviderManager)initWithQueue:(id)a3
{
  REWorkoutRelevanceProviderManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REWorkoutRelevanceProviderManager;
  result = -[RERelevanceProviderManager initWithQueue:](&v4, sel_initWithQueue_, a3);
  if (result)
    result->_state = 0;
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
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v5 = objc_msgSend(a3, "state") == self->_state;
  -[NSDate dateByAddingTimeInterval:](self->_lastWorkoutDate, "dateByAddingTimeInterval:", *(double *)&kLastWorkoutWorkoutSuggestionDelay);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceNow");
    if (v8 > 0.0)
      v5 = 0;
    else
      v5 = v5;
  }
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](REActiveWorkoutPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](REActiveWorkoutPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_prepareForUpdate
{
  void *v3;
  NSDate *v4;
  NSDate *lastWorkoutDate;
  id v6;

  +[RESingleton sharedInstance](REActiveWorkoutPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_state = objc_msgSend(v3, "isActiveWorkout");

  +[RESingleton sharedInstance](REActiveWorkoutPredictor, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastWorkoutDate");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastWorkoutDate = self->_lastWorkoutDate;
  self->_lastWorkoutDate = v4;

}

- (void)predictorDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

  +[RESingleton sharedInstance](REActiveWorkoutPredictor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastWorkoutDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateByAddingTimeInterval:", *(double *)&kLastWorkoutWorkoutSuggestionDelay);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceNow");
    v7 = v10;
    if (v8 > 0.0)
    {
      +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForAllProvidersAtDate:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v9);

      v7 = v10;
    }
  }

}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWorkoutDate, 0);
}

@end
