@implementation REMotionRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature motionFeature](REFeature, "motionFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REMotionRelevanceProviderManager)initWithQueue:(id)a3
{
  REMotionRelevanceProviderManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REMotionRelevanceProviderManager;
  result = -[RERelevanceProviderManager initWithQueue:](&v4, sel_initWithQueue_, a3);
  if (result)
    result->_type = 0;
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
  return +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", (self->_type & objc_msgSend(a3, "motionTypes")) != 0);
}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](REDeviceMotionPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](REDeviceMotionPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_prepareForUpdate
{
  id v3;

  +[RESingleton sharedInstance](REDeviceMotionPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_type = objc_msgSend(v3, "motionType");

}

- (void)predictorDidUpdate:(id)a3
{
  id v4;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

}

- (unint64_t)motionType
{
  return self->_type;
}

@end
