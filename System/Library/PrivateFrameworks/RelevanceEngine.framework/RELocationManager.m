@implementation RELocationManager

+ (RELocationManager)simulatedLocationManager
{
  if (simulatedLocationManager_onceToken != -1)
    dispatch_once(&simulatedLocationManager_onceToken, &__block_literal_global_33);
  return (RELocationManager *)(id)simulatedLocationManager_SimulatedManager;
}

void __45__RELocationManager_simulatedLocationManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)simulatedLocationManager_SimulatedManager;
  simulatedLocationManager_SimulatedManager = v0;

}

+ (RELocationManager)locationManager
{
  return (RELocationManager *)(id)objc_opt_new();
}

+ (RELocationManager)locationManagerWithAuthorizationBundlePath:(id)a3
{
  id v3;
  _RECoreLocationLocationManager *v4;

  v3 = a3;
  v4 = -[_RECoreLocationLocationManager initWithEffectiveBundlePath:]([_RECoreLocationLocationManager alloc], "initWithEffectiveBundlePath:", v3);

  return (RELocationManager *)v4;
}

- (id)currentLocation
{
  return 0;
}

@end
