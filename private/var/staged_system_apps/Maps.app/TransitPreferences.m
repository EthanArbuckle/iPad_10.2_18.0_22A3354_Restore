@implementation TransitPreferences

- (id)transitPreferencesByOverridingPropertiesWithUserInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v4 = a3;
  if (!v4)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[TransitPreferences(DirectionsUserInfo) transitPreferencesByOverridingPropertiesWithUserInfo:]";
      v21 = 2080;
      v22 = "RoutePlanningPreferences+DirectionsUserInfo.m";
      v23 = 1024;
      v24 = 23;
      v25 = 2080;
      v26 = "userInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  v5 = -[TransitPreferences mutableCopy](self, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsAvoidedTransitModesKey")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsAvoidedTransitModesKey")));
    objc_msgSend(v5, "setDisabledModes:", (unint64_t)objc_msgSend(v7, "integerValue") & 0xF);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsSortOptionKey")));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsSortOptionKey")));
    objc_msgSend(v5, "setSortOption:", objc_msgSend(v9, "integerValue"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsTransitSurchargeOptionKey")));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DirectionsTransitSurchargeOptionKey")));
    objc_msgSend(v5, "setSurchargeOption:", v11);

  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

- (id)transitOptions
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init((Class)GEOTransitOptions);
    objc_msgSend(v2, "setPrioritization:", objc_msgSend(v1, "sortOption"));
    v3 = objc_alloc_init((Class)GEOFareOptions);
    objc_msgSend(v3, "setPaymentType:", objc_msgSend(v1, "showICFares"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "surchargeOption"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "surchargeOption"));
      objc_msgSend(v3, "setPreferredSurchargeType:", objc_msgSend(v5, "integerValue"));

    }
    objc_msgSend(v2, "setFareOptions:", v3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = sub_100860570((uint64_t)objc_msgSend(v1, "disabledModes", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v2, "addAvoidedMode:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "integerValue"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    if (GEOConfigGetBOOL(NavigationConfig_DebugNavigationIncludeRealtimeUpdates[0], NavigationConfig_DebugNavigationIncludeRealtimeUpdates[1]))objc_msgSend(v2, "setRoutingBehavior:", 1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (TransitPreferences)initWithTransitOptions:(id)a3 defaults:(id)a4
{
  id v6;
  TransitPreferences *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;

  v6 = a3;
  v7 = -[WatchSyncedPreferences initWithDefaults:](self, "initWithDefaults:", a4);
  if (v7)
  {
    -[TransitPreferences setSortOption:](v7, "setSortOption:", objc_msgSend(v6, "prioritization"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fareOptions"));
    v9 = v8;
    if (v8)
    {
      -[TransitPreferences setShowICFares:](v7, "setShowICFares:", objc_msgSend(v8, "paymentType") == 1);
      if (objc_msgSend(v9, "hasPreferredSurchargeType"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "preferredSurchargeType")));
        -[TransitPreferences setSurchargeOption:](v7, "setSurchargeOption:", v10);

      }
    }
    if (objc_msgSend(v6, "avoidedModesCount"))
    {
      v11 = 0;
      v12 = 0;
      do
      {
        switch(objc_msgSend(v6, "avoidedModeAtIndex:", v11))
        {
          case 1u:
          case 3u:
            v12 |= 2uLL;
            break;
          case 2u:
            v12 |= 4uLL;
            break;
          case 4u:
            v12 |= 1uLL;
            break;
          case 5u:
            v12 |= 8uLL;
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v11 < (unint64_t)objc_msgSend(v6, "avoidedModesCount"));
    }
    else
    {
      v12 = 0;
    }
    -[TransitPreferences setDisabledModes:](v7, "setDisabledModes:", v12);

  }
  return v7;
}

- (TransitPreferences)initWithCopy:(id)a3
{
  id v4;
  TransitPreferences *v5;
  TransitPreferences *v6;
  uint64_t v7;
  char isKindOfClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitPreferences;
  v5 = -[WatchSyncedPreferences initWithCopy:](&v10, "initWithCopy:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_opt_class(v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v4, "_copyPropertiesTo:", v6);
    }
  }

  return v6;
}

- (BOOL)hasAnyNonStandardPreferences
{
  return -[TransitPreferences disabledModes](self, "disabledModes") != 0;
}

- (void)loadValuesFromDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[TransitPreferences setDisabledModes:](self, "setDisabledModes:", (unint64_t)objc_msgSend(v3, "integerForKey:", CFSTR("DefaultDisabledTransitModesKey")) & 0xF);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[TransitPreferences setSortOption:](self, "setSortOption:", objc_msgSend(v4, "integerForKey:", CFSTR("MapsTransitSortOption")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MapsTransitSurchargeOption")));
  -[TransitPreferences setSurchargeOption:](self, "setSurchargeOption:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("MapsTransitShowICFaresKey")));

  if (v9)
    v8 = (uint64_t)objc_msgSend(v9, "BOOLValue");
  else
    v8 = 1;
  -[TransitPreferences setShowICFares:](self, "setShowICFares:", v8);

}

- (id)_keys
{
  return &off_101274370;
}

- (id)_values
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[TransitPreferences disabledModes](self, "disabledModes")));
  v10[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[TransitPreferences sortOption](self, "sortOption")));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences surchargeOption](self, "surchargeOption"));
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TransitPreferences showICFares](self, "showICFares")));
  v10[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4));

  if (!v5)
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TransitMutablePreferences *v4;
  void *v5;
  TransitMutablePreferences *v6;

  v4 = +[TransitMutablePreferences allocWithZone:](TransitMutablePreferences, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v6 = -[WatchSyncedPreferences initWithDefaults:](v4, "initWithDefaults:", v5);

  -[TransitPreferences _copyPropertiesTo:](self, "_copyPropertiesTo:", v6);
  return v6;
}

- (void)_copyPropertiesTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDisabledModes:", -[TransitPreferences disabledModes](self, "disabledModes"));
  objc_msgSend(v5, "setSortOption:", -[TransitPreferences sortOption](self, "sortOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences surchargeOption](self, "surchargeOption"));
  objc_msgSend(v5, "setSurchargeOption:", v4);

  objc_msgSend(v5, "setShowICFares:", -[TransitPreferences showICFares](self, "showICFares"));
}

- (BOOL)isModeDisabled:(unint64_t)a3
{
  void *v5;

  v5 = (void *)objc_opt_class(self);
  return _objc_msgSend(v5, "isModeDisabled:inModes:", a3, -[TransitPreferences disabledModes](self, "disabledModes"));
}

+ (unint64_t)enabledModesFromDisabled:(unint64_t)a3
{
  return ~(_DWORD)a3 & 0xFLL;
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inModes:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (unint64_t)disabledModesByTogglingMode:(unint64_t)a3 inModes:(unint64_t)a4
{
  if ((a4 & a3) != 0)
    return a4 & ~a3;
  else
    return a4 | a3;
}

+ (BOOL)isModeDisabled:(unint64_t)a3 inUserDefaults:(id)a4
{
  return _objc_msgSend(a1, "isModeDisabled:inModes:", a3, (unint64_t)objc_msgSend(a4, "integerForKey:", CFSTR("DefaultDisabledTransitModesKey")) & 0xF);
}

+ (void)toggleMode:(unint64_t)a3 inUserDefaults:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = objc_msgSend(a1, "disabledModesByTogglingMode:inModes:", a3, (unint64_t)objc_msgSend(v6, "integerForKey:", CFSTR("DefaultDisabledTransitModesKey")) & 0xF);
  objc_msgSend(v6, "setInteger:forKey:", v7, CFSTR("DefaultDisabledTransitModesKey"));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
  objc_msgSend(v8, "setInteger:forKey:", v7, CFSTR("DefaultDisabledTransitModesKey"));

}

- (unint64_t)disabledModes
{
  return self->_disabledModes;
}

- (void)setDisabledModes:(unint64_t)a3
{
  self->_disabledModes = a3;
}

- (int)sortOption
{
  return self->_sortOption;
}

- (void)setSortOption:(int)a3
{
  self->_sortOption = a3;
}

- (NSNumber)surchargeOption
{
  return self->_surchargeOption;
}

- (void)setSurchargeOption:(id)a3
{
  objc_storeStrong((id *)&self->_surchargeOption, a3);
}

- (BOOL)showICFares
{
  return self->_showICFares;
}

- (void)setShowICFares:(BOOL)a3
{
  self->_showICFares = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surchargeOption, 0);
}

@end
