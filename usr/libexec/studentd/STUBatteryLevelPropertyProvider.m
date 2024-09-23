@implementation STUBatteryLevelPropertyProvider

- (STUBatteryLevelPropertyProvider)initWithLowBatteryPropertyProvider:(id)a3
{
  id v5;
  STUBatteryLevelPropertyProvider *v6;
  STUBatteryLevelPropertyProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUBatteryLevelPropertyProvider;
  v6 = -[STUBatteryLevelPropertyProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lowBatteryPropertyProvider, a3);

  return v7;
}

- (id)key
{
  return CRKDeviceBatteryLevelKey;
}

- (float)batteryLevel
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUBatteryLevelPropertyProvider value](self, "value"));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)value
{
  void *v2;
  float v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUBatteryLevelPropertyProvider lowBatteryPropertyProvider](self, "lowBatteryPropertyProvider"));
  if (objc_msgSend(v2, "isLowBattery"))
    v3 = 0.1;
  else
    v3 = 1.0;

  *(float *)&v4 = v3;
  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4);
}

+ (id)keyPathsForValuesAffectingValue
{
  void *v2;
  void *v3;
  const __CFString *v5;

  v5 = CFSTR("lowBatteryPropertyProvider.lowBattery");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (STULowBatteryPropertyProvider)lowBatteryPropertyProvider
{
  return self->_lowBatteryPropertyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowBatteryPropertyProvider, 0);
}

@end
