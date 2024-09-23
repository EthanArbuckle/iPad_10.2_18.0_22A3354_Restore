@implementation AudioPreferences

- (AudioPreferences)initWithDefaults:(id)a3
{
  AudioPreferences *v3;
  AudioPreferences *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AudioPreferences;
  v3 = -[WatchSyncedPreferences initWithDefaults:](&v6, "initWithDefaults:", a3);
  v4 = v3;
  if (v3)
    -[AudioPreferences _commonInit](v3, "_commonInit");
  return v4;
}

- (AudioPreferences)initWithCopy:(id)a3
{
  id *v4;
  AudioPreferences *v5;
  AudioPreferences *v6;
  uint64_t v7;
  char isKindOfClass;
  id *v9;
  id v10;
  objc_super v12;

  v4 = (id *)a3;
  v12.receiver = self;
  v12.super_class = (Class)AudioPreferences;
  v5 = -[WatchSyncedPreferences initWithCopy:](&v12, "initWithCopy:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_opt_class(v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    if (v4 && (isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)&v6->_drivingModernPreference, v4[6]);
      v9 = v4;
      objc_storeStrong((id *)&v6->_walkingModernPreference, v9[7]);
      objc_storeStrong((id *)&v6->_cyclingModernPreference, v9[8]);
      v6->_drivingVoiceGuidance = (unint64_t)objc_msgSend(v9, "drivingVoiceGuidance");
      v6->_walkingVoiceGuidance = (unint64_t)objc_msgSend(v9, "walkingVoiceGuidance");
      v10 = objc_msgSend(v9, "cyclingVoiceGuidance");

      v6->_cyclingVoiceGuidance = (unint64_t)v10;
    }
    -[AudioPreferences _commonInit](v6, "_commonInit");
  }

  return v6;
}

- (void)_commonInit
{
  _GEOConfigAddDelegateListenerForKey(NavigationConfig_SpokenGuidanceLevel_Driving[0], NavigationConfig_SpokenGuidanceLevel_Driving[1], &_dispatch_main_q, self);
  _GEOConfigAddDelegateListenerForKey(NavigationConfig_SpokenGuidanceLevel_Walking[0], NavigationConfig_SpokenGuidanceLevel_Walking[1], &_dispatch_main_q, self);

  _GEOConfigAddDelegateListenerForKey(NavigationConfig_SpokenGuidanceLevel_Cycling[0], NavigationConfig_SpokenGuidanceLevel_Cycling[1], &_dispatch_main_q, self);
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)AudioPreferences;
  -[AudioPreferences dealloc](&v3, "dealloc");
}

- (unint64_t)drivingVoiceGuidance
{
  NSNumber *drivingModernPreference;

  drivingModernPreference = self->_drivingModernPreference;
  if (!drivingModernPreference)
  {
    -[AudioPreferences _migrateVolumeSettings](self, "_migrateVolumeSettings");
    drivingModernPreference = self->_drivingModernPreference;
  }
  return -[NSNumber unsignedIntegerValue](drivingModernPreference, "unsignedIntegerValue");
}

- (void)setDrivingVoiceGuidance:(unint64_t)a3
{
  NSNumber *v5;
  NSNumber *drivingModernPreference;

  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  drivingModernPreference = self->_drivingModernPreference;
  self->_drivingModernPreference = v5;

  if (self->_drivingVoiceGuidance != a3)
  {
    self->_drivingVoiceGuidance = a3;
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Driving[0], NavigationConfig_SpokenGuidanceLevel_Driving[1], a3);
  }
}

- (unint64_t)walkingVoiceGuidance
{
  NSNumber *walkingModernPreference;

  walkingModernPreference = self->_walkingModernPreference;
  if (!walkingModernPreference)
  {
    -[AudioPreferences _migrateVolumeSettings](self, "_migrateVolumeSettings");
    walkingModernPreference = self->_walkingModernPreference;
  }
  return -[NSNumber unsignedIntegerValue](walkingModernPreference, "unsignedIntegerValue");
}

- (void)setWalkingVoiceGuidance:(unint64_t)a3
{
  NSNumber *v5;
  NSNumber *walkingModernPreference;

  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v5;

  if (self->_walkingVoiceGuidance != a3)
  {
    self->_walkingVoiceGuidance = a3;
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Walking[0], NavigationConfig_SpokenGuidanceLevel_Walking[1], a3);
  }
}

- (unint64_t)cyclingVoiceGuidance
{
  NSNumber *cyclingModernPreference;

  cyclingModernPreference = self->_cyclingModernPreference;
  if (!cyclingModernPreference)
  {
    -[AudioPreferences _migrateVolumeSettings](self, "_migrateVolumeSettings");
    cyclingModernPreference = self->_cyclingModernPreference;
  }
  return -[NSNumber unsignedIntegerValue](cyclingModernPreference, "unsignedIntegerValue");
}

- (void)setCyclingVoiceGuidance:(unint64_t)a3
{
  NSNumber *v5;
  NSNumber *cyclingModernPreference;

  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v5;

  if (self->_cyclingVoiceGuidance != a3)
  {
    self->_cyclingVoiceGuidance = a3;
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Cycling[0], NavigationConfig_SpokenGuidanceLevel_Cycling[1], a3);
  }
}

- (void)_migrateVolumeSettings
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSNumber *drivingModernPreference;
  NSNumber *v8;
  void *v9;
  void *v10;
  NSNumber *walkingModernPreference;
  NSNumber *cyclingModernPreference;
  int v13;
  void *v14;

  v3 = -[AudioPreferences _migratedMutedValue](self, "_migratedMutedValue");
  v4 = sub_100431EAC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Migrating old volume setting to mute", (uint8_t *)&v13, 2u);
    }

    drivingModernPreference = self->_drivingModernPreference;
    v8 = (NSNumber *)&off_10126FB50;
  }
  else
  {
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("VoiceIsMute")));
      v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Migrating old volume setting to full, isMute: %@", (uint8_t *)&v13, 0xCu);

    }
    drivingModernPreference = self->_drivingModernPreference;
    v8 = (NSNumber *)&off_10126FB68;
  }
  self->_drivingModernPreference = v8;

  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v8;

  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v8;

  -[AudioPreferences synchronize](self, "synchronize");
}

- (BOOL)_migratedMutedValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("VoiceIsMute")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (unint64_t)guidanceLevelForTransportType:(int)a3
{
  if (a3 == 2)
    return -[AudioPreferences walkingVoiceGuidance](self, "walkingVoiceGuidance");
  if (a3 == 3)
    return -[AudioPreferences cyclingVoiceGuidance](self, "cyclingVoiceGuidance");
  return -[AudioPreferences drivingVoiceGuidance](self, "drivingVoiceGuidance");
}

- (void)setGuidanceLevel:(unint64_t)a3 forTransportType:(int)a4
{
  if (a4 == 2)
  {
    -[AudioPreferences setWalkingVoiceGuidance:](self, "setWalkingVoiceGuidance:", a3);
  }
  else if (a4 == 3)
  {
    -[AudioPreferences setCyclingVoiceGuidance:](self, "setCyclingVoiceGuidance:", a3);
  }
  else
  {
    -[AudioPreferences setDrivingVoiceGuidance:](self, "setDrivingVoiceGuidance:", a3);
  }
}

- (void)synchronize
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  objc_super v20;
  _BYTE v21[128];

  v20.receiver = self;
  v20.super_class = (Class)AudioPreferences;
  -[WatchSyncedPreferences synchronize](&v20, "synchronize");
  v3 = sub_100431EAC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Writing a copy of audio preferences to shared preferences", buf, 2u);
  }

  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("group.com.apple.Maps"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioPreferences _keys](self, "_keys", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (!v13
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
              v14,
              v13 == v14))
        {
          objc_msgSend(v5, "removeObjectForKey:", v11);
        }
        else
        {
          objc_msgSend(v5, "setObject:forKey:", v13, v11);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

}

- (void)loadValuesFromDefaults
{
  void *v3;
  NSNumber *v4;
  NSNumber *drivingModernPreference;
  void *v6;
  NSNumber *v7;
  NSNumber *walkingModernPreference;
  void *v9;
  NSNumber *v10;
  NSNumber *cyclingModernPreference;
  id v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  NSInteger v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  NSInteger v21;
  id v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  NSInteger v26;
  id v27;
  NSObject *v28;
  unint64_t v29;
  void *v30;
  id v31;
  unint64_t v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NavigationVoiceGuidanceLevelDriving")));
  drivingModernPreference = self->_drivingModernPreference;
  self->_drivingModernPreference = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("NavigationVoiceGuidanceLevelWalking")));
  walkingModernPreference = self->_walkingModernPreference;
  self->_walkingModernPreference = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("NavigationVoiceGuidanceLevelCycling")));
  cyclingModernPreference = self->_cyclingModernPreference;
  self->_cyclingModernPreference = v10;

  -[AudioPreferences synchronize](self, "synchronize");
  if (_GEOConfigHasValue(NavigationConfig_SpokenGuidanceLevel_Driving[0], NavigationConfig_SpokenGuidanceLevel_Driving[1]))
  {
    self->_drivingVoiceGuidance = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Driving[0], NavigationConfig_SpokenGuidanceLevel_Driving[1]);
  }
  else
  {
    self->_drivingVoiceGuidance = -[NSNumber integerValue](self->_drivingModernPreference, "integerValue");
    v12 = sub_100431EAC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_drivingVoiceGuidance + 1;
      if (v14 >= 4)
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_drivingVoiceGuidance));
      else
        v15 = *(&off_1011DB6E8 + v14);
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating _drivingVoiceGuidance from old default to: %@", buf, 0xCu);

    }
    v16 = -[NSNumber integerValue](self->_drivingModernPreference, "integerValue");
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Driving[0], NavigationConfig_SpokenGuidanceLevel_Driving[1], v16);
  }
  if (_GEOConfigHasValue(NavigationConfig_SpokenGuidanceLevel_Walking[0], NavigationConfig_SpokenGuidanceLevel_Walking[1]))
  {
    self->_walkingVoiceGuidance = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Walking[0], NavigationConfig_SpokenGuidanceLevel_Walking[1]);
  }
  else
  {
    self->_walkingVoiceGuidance = -[NSNumber integerValue](self->_walkingModernPreference, "integerValue");
    v17 = sub_100431EAC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_walkingVoiceGuidance + 1;
      if (v19 >= 4)
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_walkingVoiceGuidance));
      else
        v20 = *(&off_1011DB6E8 + v19);
      *(_DWORD *)buf = 138412290;
      v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating _walkingVoiceGuidance from old default to: %@", buf, 0xCu);

    }
    v21 = -[NSNumber integerValue](self->_walkingModernPreference, "integerValue");
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Walking[0], NavigationConfig_SpokenGuidanceLevel_Walking[1], v21);
  }
  if (_GEOConfigHasValue(NavigationConfig_SpokenGuidanceLevel_Cycling[0], NavigationConfig_SpokenGuidanceLevel_Cycling[1]))
  {
    self->_cyclingVoiceGuidance = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Cycling[0], NavigationConfig_SpokenGuidanceLevel_Cycling[1]);
  }
  else
  {
    self->_cyclingVoiceGuidance = -[NSNumber integerValue](self->_cyclingModernPreference, "integerValue");
    v22 = sub_100431EAC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_cyclingVoiceGuidance + 1;
      if (v24 >= 4)
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_cyclingVoiceGuidance));
      else
        v25 = *(&off_1011DB6E8 + v24);
      *(_DWORD *)buf = 138412290;
      v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updating _cyclingVoiceGuidance from old default to: %@", buf, 0xCu);

    }
    v26 = -[NSNumber integerValue](self->_cyclingModernPreference, "integerValue");
    GEOConfigSetInteger(NavigationConfig_SpokenGuidanceLevel_Cycling[0], NavigationConfig_SpokenGuidanceLevel_Cycling[1], v26);
  }
  v27 = sub_100431EAC();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_drivingVoiceGuidance + 1;
    if (v29 >= 4)
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_drivingVoiceGuidance));
    else
      v30 = *(&off_1011DB6E8 + v29);
    v31 = v30;
    v32 = self->_walkingVoiceGuidance + 1;
    if (v32 >= 4)
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_walkingVoiceGuidance));
    else
      v33 = *(&off_1011DB6E8 + v32);
    v34 = v33;
    v35 = self->_cyclingVoiceGuidance + 1;
    if (v35 >= 4)
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_cyclingVoiceGuidance));
    else
      v36 = *(&off_1011DB6E8 + v35);
    *(_DWORD *)buf = 138412802;
    v38 = v31;
    v39 = 2112;
    v40 = v34;
    v41 = 2112;
    v42 = v36;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Loaded values from defaults:\n\tDriving voice guidance: %@\n\tWalking voice guidance: %@\n\tCycling voice guidance: %@", buf, 0x20u);

  }
}

- (id)_keys
{
  return &off_101273F08;
}

- (id)_values
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[AudioPreferences drivingVoiceGuidance](self, "drivingVoiceGuidance")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[AudioPreferences walkingVoiceGuidance](self, "walkingVoiceGuidance", v3)));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[AudioPreferences cyclingVoiceGuidance](self, "cyclingVoiceGuidance")));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *v4;
  void *v6;
  void *v8;
  uint64_t Integer;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)NavigationConfig_SpokenGuidanceLevel_Driving[1];
  if (a3.var0 == LODWORD(NavigationConfig_SpokenGuidanceLevel_Driving[0]) && a3.var1 == v4)
  {
    Integer = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Driving[0], v4);
    -[AudioPreferences setDrivingVoiceGuidance:](self, "setDrivingVoiceGuidance:", Integer);
  }
  else
  {
    v6 = (void *)NavigationConfig_SpokenGuidanceLevel_Walking[1];
    if (a3.var0 == LODWORD(NavigationConfig_SpokenGuidanceLevel_Walking[0]) && a3.var1 == v6)
    {
      v11 = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Walking[0], v6);
      -[AudioPreferences setWalkingVoiceGuidance:](self, "setWalkingVoiceGuidance:", v11);
    }
    else
    {
      v8 = (void *)NavigationConfig_SpokenGuidanceLevel_Cycling[1];
      if (a3.var0 == LODWORD(NavigationConfig_SpokenGuidanceLevel_Cycling[0]) && a3.var1 == v8)
      {
        v12 = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceLevel_Cycling[0], v8);
        -[AudioPreferences setCyclingVoiceGuidance:](self, "setCyclingVoiceGuidance:", v12);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingModernPreference, 0);
  objc_storeStrong((id *)&self->_walkingModernPreference, 0);
  objc_storeStrong((id *)&self->_drivingModernPreference, 0);
}

@end
