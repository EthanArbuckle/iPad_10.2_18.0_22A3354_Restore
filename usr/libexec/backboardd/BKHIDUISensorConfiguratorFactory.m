@implementation BKHIDUISensorConfiguratorFactory

+ (id)sensorConfiguratorForCurrentPlatform
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  BKHIDUIServiceConfiguringAggregator *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  BKHIDUIServiceConfiguringAggregator *v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v4 = objc_msgSend(v3, "deviceClass");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_digitizerServiceWrapper"));
    v6 = (BKHIDUIServiceConfiguringAggregator *)v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_proximityServiceWrapper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_digitizerServiceWrapper"));
    v6 = objc_alloc_init(BKHIDUIServiceConfiguringAggregator);
    v15[0] = v8;
    v15[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    -[BKHIDUIServiceConfiguringAggregator setServiceConfigurings:](v6, "setServiceConfigurings:", v9);

  }
  v10 = BKLogUISensor(v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UI sensor configuration: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  return v6;
}

+ (id)_proximityServiceWrapper
{
  void *v2;
  BKHIDUISensorServiceMatchingWrapper *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("DeviceUsagePage");
  v5[1] = CFSTR("DeviceUsage");
  v6[0] = &off_1000F7450;
  v6[1] = &off_1000F7468;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  v3 = -[BKHIDUISensorServiceMatchingWrapper initWithMatchingDictionary:instantiateWrapperUsingBlock:]([BKHIDUISensorServiceMatchingWrapper alloc], "initWithMatchingDictionary:instantiateWrapperUsingBlock:", v2, &stru_1000EB708);

  return v3;
}

+ (id)_digitizerServiceWrapper
{
  void *v2;
  BKHIDUISensorServiceMatchingWrapper *v3;
  _QWORD v5[3];
  _QWORD v6[3];

  v5[0] = CFSTR("DeviceUsagePage");
  v5[1] = CFSTR("Built-In");
  v6[0] = &off_1000F7480;
  v6[1] = &__kCFBooleanTrue;
  v5[2] = CFSTR("DisplayIntegrated");
  v6[2] = &__kCFBooleanTrue;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 3));
  v3 = -[BKHIDUISensorServiceMatchingWrapper initWithMatchingDictionary:instantiateWrapperUsingBlock:]([BKHIDUISensorServiceMatchingWrapper alloc], "initWithMatchingDictionary:instantiateWrapperUsingBlock:", v2, &stru_1000EB728);

  return v3;
}

@end
