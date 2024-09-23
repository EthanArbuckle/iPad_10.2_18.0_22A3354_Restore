@implementation CarInstrumentClusterChromeConfiguration

- (CarInstrumentClusterChromeConfiguration)initWithInstrumentClusterSceneSettings:(id)a3
{
  id v4;
  CarInstrumentClusterChromeConfiguration *v5;
  int BOOL;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  CarInstrumentClusterChromeConfiguration *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)CarInstrumentClusterChromeConfiguration;
    v5 = -[CarInstrumentClusterChromeConfiguration init](&v15, "init");
    if (v5)
    {
      if (!objc_msgSend(v4, "itemType")
        || objc_msgSend(v4, "itemType") == (id)3
        || (BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayHybridInstrumentClusterEverywhere, off_1014B51A8)) != 0)
      {
        LOBYTE(BOOL) = GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938);
      }
      v5->_isHybridInstrumentClusterConfiguration = BOOL;
      v7 = (char *)objc_msgSend(v4, "showsCompass");
      if ((unint64_t)(v7 - 1) >= 3)
        v8 = 0;
      else
        v8 = (unint64_t)v7;
      v5->_showsHeadingIndicator = v8;
      v9 = (char *)objc_msgSend(v4, "showsSpeedLimit");
      if ((unint64_t)(v9 - 1) >= 3)
        v10 = 0;
      else
        v10 = (unint64_t)v9;
      v5->_showsSpeedLimit = v10;
      v11 = (char *)objc_msgSend(v4, "showsETA");
      if ((unint64_t)(v11 - 1) >= 3)
        v12 = 0;
      else
        v12 = (unint64_t)v11;
      v5->_showsETA = v12;
      if (v5->_isHybridInstrumentClusterConfiguration)
      {
        _GEOConfigAddDelegateListenerForKey(MapsConfig_CarPlayHybridInstrumentClusterShowHeadingIndicatorOverride, off_1014B51B8, &_dispatch_main_q, v5);
        _GEOConfigAddDelegateListenerForKey(MapsConfig_CarPlayHybridInstrumentClusterShowSpeedLimitOverride, off_1014B51C8, &_dispatch_main_q, v5);

        _GEOConfigAddDelegateListenerForKey(MapsConfig_CarPlayHybridInstrumentClusterShowETATrayOverride, off_1014B51D8, &_dispatch_main_q, v5);
      }
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isHybridInstrumentClusterConfiguration)
    GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)CarInstrumentClusterChromeConfiguration;
  -[CarInstrumentClusterChromeConfiguration dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  CarInstrumentClusterChromeConfiguration *v4;
  uint64_t v5;
  CarInstrumentClusterChromeConfiguration *v6;
  BOOL v7;

  v4 = (CarInstrumentClusterChromeConfiguration *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class(CarInstrumentClusterChromeConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = self->_showsHeadingIndicator == v6->_showsHeadingIndicator
        && self->_showsSpeedLimit == v6->_showsSpeedLimit
        && self->_showsETA == v6->_showsETA;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  v7 = self->_showsHeadingIndicator - 1;
  if (v7 > 2)
    v8 = CFSTR("Unspecified");
  else
    v8 = *(&off_1011E2D90 + v7);
  v9 = self->_showsSpeedLimit - 1;
  if (v9 > 2)
    v10 = CFSTR("Unspecified");
  else
    v10 = *(&off_1011E2D90 + v9);
  v11 = self->_showsETA - 1;
  if (v11 > 2)
    v12 = CFSTR("Unspecified");
  else
    v12 = *(&off_1011E2D90 + v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, showsHeadingIndicator: %@, showsSpeedLimit: %@, showsETA: %@>"), v5, self, v8, v10, v12));

  return (NSString *)v13;
}

- (unint64_t)showsHeadingIndicator
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsHeadingIndicator, MapsConfig_CarPlayHybridInstrumentClusterShowHeadingIndicatorOverride, off_1014B51B8);
}

- (unint64_t)showsSpeedLimit
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsSpeedLimit, MapsConfig_CarPlayHybridInstrumentClusterShowSpeedLimitOverride, off_1014B51C8);
}

- (unint64_t)showsETA
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsETA, MapsConfig_CarPlayHybridInstrumentClusterShowETATrayOverride, off_1014B51D8);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", *(_QWORD *)&a3.var0, a3.var1));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CarInstrumentClusterChromeConfigurationDidUpdateNotification"), self);

}

- (unint64_t)_settingWithValue:(unint64_t)a3 hybridICOverrideKey:(id)a4
{
  void *var1;
  uint64_t v6;
  unint64_t UInteger;

  if (self->_isHybridInstrumentClusterConfiguration)
  {
    var1 = a4.var0.var1;
    v6 = *(_QWORD *)&a4.var0.var0;
    if (_GEOConfigHasValue(*(_QWORD *)&a4.var0.var0, a4.var0.var1))
    {
      UInteger = GEOConfigGetUInteger(v6, var1);
      if (UInteger - 1 >= 3)
        return 0;
      else
        return UInteger;
    }
  }
  return a3;
}

@end
