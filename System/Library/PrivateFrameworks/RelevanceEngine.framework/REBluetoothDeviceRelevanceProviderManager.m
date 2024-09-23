@implementation REBluetoothDeviceRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature bluetoothDeviceFeature](REFeature, "bluetoothDeviceFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REBluetoothDeviceRelevanceProviderManager)initWithQueue:(id)a3
{
  REBluetoothDeviceRelevanceProviderManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REBluetoothDeviceRelevanceProviderManager;
  result = -[RERelevanceProviderManager initWithQueue:](&v4, sel_initWithQueue_, a3);
  if (result)
  {
    result->_connectedToSpeaker = 0;
    result->_connectedToCar = 0;
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
  _BOOL8 connectedToCar;
  void *v7;

  v5 = a3;
  if (objc_msgSend(v5, "connectedToSpeaker") && self->_connectedToSpeaker)
  {
    connectedToCar = 1;
  }
  else if (objc_msgSend(v5, "connectedToCar"))
  {
    connectedToCar = self->_connectedToCar;
  }
  else
  {
    connectedToCar = 0;
  }
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", connectedToCar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](REBluetoothPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](REBluetoothPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_prepareForUpdate
{
  void *v3;
  id v4;

  +[RESingleton sharedInstance](REBluetoothPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_connectedToCar = objc_msgSend(v3, "connectedToCar");

  +[RESingleton sharedInstance](REBluetoothPredictor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_connectedToSpeaker = objc_msgSend(v4, "connectedToSpeaker");

}

- (void)predictorDidUpdate:(id)a3
{
  id v4;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (BOOL)connectedToSpeaker
{
  return self->_connectedToSpeaker;
}

@end
