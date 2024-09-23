@implementation CSMartyTap2RadarConfiguration

- (CSMartyTap2RadarConfiguration)initWithAllowOnBattery:(BOOL)a3 checkIntervalInSeconds:(int64_t)a4 coolDownPeriodInSeconds:(int64_t)a5
{
  CSMartyTap2RadarConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSMartyTap2RadarConfiguration;
  result = -[CSMartyTap2RadarConfiguration init](&v9, "init");
  if (result)
  {
    result->_allowOnBattery = a3;
    result->_checkIntervalInSeconds = a4;
    result->_coolDownPeriodInSeconds = a5;
  }
  return result;
}

+ (id)tap2RadarDefaultConfiguration
{
  if (qword_100389338 != -1)
    dispatch_once(&qword_100389338, &stru_100347D60);
  return (id)qword_100389328;
}

+ (id)tap2RadarUserConfiguration
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;

  if (qword_100389340 != -1)
    dispatch_once(&qword_100389340, &stru_100347D80);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSMartyTap2RadarAllowOnBattery"));
  v4 = objc_msgSend(v2, "integerForKey:", CFSTR("CSMartyTap2RadarCheckIntervalInSeconds"));
  v5 = objc_msgSend(v2, "integerForKey:", CFSTR("CSMartyTap2RadarCoolDownPeriodInSeconds"));
  v6 = (_QWORD *)qword_100389330;
  *(_BYTE *)(qword_100389330 + 8) = v3;
  if (v4)
    v6[2] = v4;
  if (v5)
    v6[3] = v5;
  v7 = v6;

  return v7;
}

- (BOOL)allowOnBattery
{
  return self->_allowOnBattery;
}

- (int64_t)checkIntervalInSeconds
{
  return self->_checkIntervalInSeconds;
}

- (int64_t)coolDownPeriodInSeconds
{
  return self->_coolDownPeriodInSeconds;
}

@end
