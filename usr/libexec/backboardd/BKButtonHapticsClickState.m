@implementation BKButtonHapticsClickState

- (id)_initWithSettings:(id)a3
{
  id v4;
  BKButtonHapticsClickState *v5;
  BSMutableSettings *v6;
  BSMutableSettings *settings;
  BSMutableSettings *v8;
  BSMutableSettings *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKButtonHapticsClickState;
  v5 = -[BKButtonHapticsClickState init](&v11, "init");
  if (v5)
  {
    if (v4)
    {
      v6 = (BSMutableSettings *)objc_msgSend(v4, "mutableCopy");
      settings = v5->_settings;
      v5->_settings = v6;

    }
    else
    {
      v8 = (BSMutableSettings *)objc_alloc_init((Class)BSMutableSettings);
      v9 = v5->_settings;
      v5->_settings = v8;

      -[BKButtonHapticsClickState setClickState:](v5, "setClickState:", 17);
    }
  }

  return v5;
}

- (BKButtonHapticsClickState)init
{
  id v3;
  BKButtonHapticsClickState *v4;

  v3 = objc_alloc_init((Class)BSMutableSettings);
  v4 = -[BKButtonHapticsClickState _initWithSettings:](self, "_initWithSettings:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendInteger:withName:", -[BKButtonHapticsClickState clickState](self, "clickState"), CFSTR("clickState"));
  v5 = objc_msgSend(v3, "appendBool:withName:", -[BKButtonHapticsClickState isEnabled](self, "isEnabled"), CFSTR("isEnabled"));
  v6 = objc_msgSend(v3, "appendBool:withName:", -[BKButtonHapticsClickState shouldUseHaptic](self, "shouldUseHaptic"), CFSTR("shouldUseHaptic"));
  v7 = objc_msgSend(v3, "appendInteger:withName:", -[BKButtonHapticsClickState hapticClickCount](self, "hapticClickCount"), CFSTR("hapticClickCount"));
  v8 = NSStringFromBKSButtonHapticAssetType(-[BKButtonHapticsClickState assetType](self, "assetType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("assetType"));

  -[BKButtonHapticsClickState minimumTimeInterval](self, "minimumTimeInterval");
  v11 = objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("minimumTimeInterval"), 2);
  -[BKButtonHapticsClickState maximumTimeInterval](self, "maximumTimeInterval");
  v12 = objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("maximumTimeInterval"), 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "_initWithSettings:", self->_settings);
}

- (BOOL)_isUpClickStateType:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFF1) == 0;
}

- (BOOL)_shouldUseHapticForClickState:(unint64_t)a3
{
  return (a3 < 0x11) & (0x1803Fu >> a3);
}

- (BOOL)_shouldUseSplitGainForClickState:(unint64_t)a3
{
  return a3 != 16;
}

- (BOOL)_shouldUseDoublePressAssetForClickStateType:(unint64_t)a3
{
  return a3 - 2 < 4;
}

- (id)_baseConfigDictionary
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[BKButtonHapticsClickState maximumTimeInterval](self, "maximumTimeInterval");
  if (v4 > 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(v4 * 1000000.0)));
    objc_msgSend(v3, "setObject:forKey:", v5, BRConfigMaxTimeKey);

  }
  -[BKButtonHapticsClickState minimumTimeInterval](self, "minimumTimeInterval");
  if (v6 > 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(v6 * 1000000.0)));
    objc_msgSend(v3, "setObject:forKey:", v7, BRConfigMinTimeKey);

  }
  return v3;
}

- (void)_applyGainForHapticType:(int64_t)a3 toConfigDictionary:(id)a4 clickSpeed:(unint64_t)a5
{
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = -[BKButtonHapticsClickState clickState](self, "clickState");
  if (-[BKButtonHapticsClickState _shouldUseHapticForClickState:](self, "_shouldUseHapticForClickState:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HAButtonHapticsLoader sharedInstance](HAButtonHapticsLoader, "sharedInstance"));
    if (-[BKButtonHapticsClickState _shouldUseSplitGainForClickState:](self, "_shouldUseSplitGainForClickState:", v7))
    {
      if (-[BKButtonHapticsClickState _isUpClickStateType:](self, "_isUpClickStateType:", v7))
        objc_msgSend(v8, "defaultUpGainForType:", a3);
      else
        objc_msgSend(v8, "defaultDownGainForType:", a3);
    }
    else
    {
      objc_msgSend(v8, "hapticGainForType:", a3);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v10, "setObject:forKey:", v9, BRConfigGainKey);

  }
}

- (id)slowConfigDictionaryForHAButtonHapticType:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsClickState _baseConfigDictionary](self, "_baseConfigDictionary"));
  -[BKButtonHapticsClickState _applyGainForHapticType:toConfigDictionary:clickSpeed:](self, "_applyGainForHapticType:toConfigDictionary:clickSpeed:", a3, v5, 0);
  objc_msgSend(v5, "setObject:forKey:", &off_1000F72D0, BRConfigSpeedKey);
  return v5;
}

- (id)normalConfigDictionaryForHAButtonHapticType:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsClickState _baseConfigDictionary](self, "_baseConfigDictionary"));
  -[BKButtonHapticsClickState _applyGainForHapticType:toConfigDictionary:clickSpeed:](self, "_applyGainForHapticType:toConfigDictionary:clickSpeed:", a3, v5, 1);
  objc_msgSend(v5, "setObject:forKey:", &off_1000F72E8, BRConfigSpeedKey);
  return v5;
}

- (id)fastConfigDictionaryForHAButtonHapticType:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKButtonHapticsClickState _baseConfigDictionary](self, "_baseConfigDictionary"));
  -[BKButtonHapticsClickState _applyGainForHapticType:toConfigDictionary:clickSpeed:](self, "_applyGainForHapticType:toConfigDictionary:clickSpeed:", a3, v5, 2);
  objc_msgSend(v5, "setObject:forKey:", &off_1000F7300, BRConfigSpeedKey);
  return v5;
}

- (unint64_t)clickState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 1));
  v3 = objc_msgSend(v2, "integerValue");

  return (unint64_t)v3;
}

- (void)setClickState:(unint64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->_settings;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 1);

}

- (int64_t)assetType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 3));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (void)setAssetType:(int64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->_settings;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 3);

}

- (BOOL)shouldUseHaptic
{
  return -[BKButtonHapticsClickState _shouldUseHapticForClickState:](self, "_shouldUseHapticForClickState:", -[BKButtonHapticsClickState clickState](self, "clickState"));
}

- (int64_t)hapticClickCount
{
  if (-[BKButtonHapticsClickState _shouldUseDoublePressAssetForClickStateType:](self, "_shouldUseDoublePressAssetForClickStateType:", -[BKButtonHapticsClickState clickState](self, "clickState")))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (double)minimumTimeInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 5));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setMinimumTimeInterval:(double)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->_settings;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 5);

}

- (double)maximumTimeInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 4));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setMaximumTimeInterval:(double)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->_settings;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 4);

}

- (BOOL)isEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->_settings;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 2);

}

- (BSMutableSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (id)clickStateWithState:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setClickState:", a3);
  return v4;
}

+ (void)inspectChangesFromState:(id)a3 toState:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "settings"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSSettingsDiff diffFromSettings:toSettings:](BSSettingsDiff, "diffFromSettings:toSettings:", v9, v10));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000316B4;
  v13[3] = &unk_1000EA3B8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "inspectChangesWithBlock:", v13);

}

@end
