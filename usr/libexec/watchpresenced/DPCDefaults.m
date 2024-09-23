@implementation DPCDefaults

+ (id)sharedInstance
{
  if (qword_100012EA8 != -1)
    dispatch_once(&qword_100012EA8, &stru_10000C488);
  return (id)qword_100012EB0;
}

- (DPCDefaults)init
{
  DPCDefaults *v2;
  NSUserDefaults *v3;
  NSUserDefaults *defaults;
  uint64_t v5;
  NSDictionary *defaultValues;
  objc_super v8;
  _QWORD v9[14];
  _QWORD v10[14];

  v8.receiver = self;
  v8.super_class = (Class)DPCDefaults;
  v2 = -[DPCDefaults init](&v8, "init");
  if (v2)
  {
    v3 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.devicepresence"));
    defaults = v2->_defaults;
    v2->_defaults = v3;

    v9[0] = CFSTR("DPCDefaultsThresholdD1");
    v9[1] = CFSTR("DPCDefaultsThresholdD2");
    v10[0] = &off_10000CD98;
    v10[1] = &off_10000CDB0;
    v9[2] = CFSTR("DPCDefaultsThresholdDMAX");
    v9[3] = CFSTR("DPCDefaultsThresholdDMIN");
    v10[2] = &off_10000CDC8;
    v10[3] = &off_10000CD68;
    v9[4] = CFSTR("DPCDefaultsThresholdDDiscovery");
    v9[5] = CFSTR("DPCDefaultsHoldOffSec");
    v10[4] = &off_10000CD80;
    v10[5] = &off_10000CE58;
    v9[6] = CFSTR("DPCDefaultsAPWakeToSuppressionBreakEvenDuration");
    v9[7] = CFSTR("DPCDefaultsPowerWinGainTimes");
    v10[6] = &off_10000CE68;
    v10[7] = &off_10000CDE0;
    v9[8] = CFSTR("DPCDefaultsSessionBasedAdaptiveRSSIEnabled");
    v9[9] = CFSTR("DPCDefaultsBTCRSSIWindowSizeD1");
    v10[8] = &off_10000CE28;
    v10[9] = &off_10000CDF8;
    v9[10] = CFSTR("DPCDefaultsBTCRSSIWindowSizeD2");
    v9[11] = CFSTR("DPCDefaultsD2FixedStepSize");
    v10[10] = &off_10000CDF8;
    v10[11] = &off_10000CE10;
    v9[12] = CFSTR("DPCDefaultsSessionBasedAdaptiveRSSITwoWaysEnabled");
    v9[13] = CFSTR("DPCDefaultsSessionBasedAdaptiveRSSICapValue");
    v10[12] = &off_10000CD68;
    v10[13] = &off_10000CE40;
    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 14));
    defaultValues = v2->_defaultValues;
    v2->_defaultValues = (NSDictionary *)v5;

    -[NSUserDefaults registerDefaults:](v2->_defaults, "registerDefaults:", v2->_defaultValues);
  }
  return v2;
}

- (id)NSNumberForDefault:(id)a3
{
  NSUserDefaults *defaults;
  id v5;
  void *v6;
  NSInteger v7;
  void *v8;

  defaults = self->_defaults;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](defaults, "objectForKey:", v5));

  if (v6)
  {
    v7 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_defaultValues, "objectForKey:", v5));

  }
  return v8;
}

+ (BOOL)isRSSIModeEnabled
{
  return _os_feature_enabled_impl("DevicePresence", "RSSIMode");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
