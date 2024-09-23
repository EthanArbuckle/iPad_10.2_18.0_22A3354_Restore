@implementation SUCoreActivityOptions

- (SUCoreActivityOptions)init
{
  SUCoreActivityOptions *v2;
  SUCoreActivityOptions *v3;
  NSDate *runDate;
  NSNumber *batteryLevelGreaterThan;
  NSNumber *batteryLevelLessThan;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUCoreActivityOptions;
  v2 = -[SUCoreActivityOptions init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    runDate = v2->_runDate;
    v2->_runDate = 0;

    batteryLevelGreaterThan = v3->_batteryLevelGreaterThan;
    v3->_batteryLevelGreaterThan = 0;

    batteryLevelLessThan = v3->_batteryLevelLessThan;
    v3->_batteryLevelLessThan = 0;

    v3->_priority = 0;
    *(_OWORD *)&v3->_plugInState = 0u;
    *(_OWORD *)&v3->_waking = 0u;
  }
  return v3;
}

- (SUCoreActivityOptions)initWithCoder:(id)a3
{
  id v4;
  SUCoreActivityOptions *v5;
  uint64_t v6;
  NSDate *runDate;
  uint64_t v8;
  NSNumber *batteryLevelGreaterThan;
  uint64_t v10;
  NSNumber *batteryLevelLessThan;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCoreActivityOptions;
  v5 = -[SUCoreActivityOptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    runDate = v5->_runDate;
    v5->_runDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryLevelGreaterThan"));
    v8 = objc_claimAutoreleasedReturnValue();
    batteryLevelGreaterThan = v5->_batteryLevelGreaterThan;
    v5->_batteryLevelGreaterThan = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryLevelLessThan"));
    v10 = objc_claimAutoreleasedReturnValue();
    batteryLevelLessThan = v5->_batteryLevelLessThan;
    v5->_batteryLevelLessThan = (NSNumber *)v10;

    v5->_plugInState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pluginState"));
    v5->_screenOnState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("screenOnState"));
    v5->_networkState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("networkState"));
    v5->_wifiState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("wifiState"));
    v5->_waking = objc_msgSend(v4, "decodeIntForKey:", CFSTR("waking"));
    v5->_phoneCallState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("phoneCallState"));
    v5->_carplayState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("carplayState"));
    v5->_mediaPlayingState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("mediaPlayingState"));
    v5->_priority = objc_msgSend(v4, "decodeIntForKey:", CFSTR("priority"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *runDate;
  id v5;

  runDate = self->_runDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", runDate, CFSTR("runDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batteryLevelGreaterThan, CFSTR("batteryLevelGreaterThan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batteryLevelLessThan, CFSTR("batteryLevelLessThan"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_plugInState, CFSTR("pluginState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_screenOnState, CFSTR("screenOnState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_networkState, CFSTR("networkState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_wifiState, CFSTR("wifiState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_waking, CFSTR("waking"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_phoneCallState, CFSTR("phoneCallState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_carplayState, CFSTR("carplayState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_mediaPlayingState, CFSTR("mediaPlayingState"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_mediaPlayingState, CFSTR("priority"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SUCoreActivityOptions runDate](self, "runDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setRunDate:", v7);

  -[SUCoreActivityOptions batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setBatteryLevelGreaterThan:", v9);

  -[SUCoreActivityOptions batteryLevelLessThan](self, "batteryLevelLessThan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setBatteryLevelLessThan:", v11);

  objc_msgSend(v5, "setPlugInState:", -[SUCoreActivityOptions plugInState](self, "plugInState"));
  objc_msgSend(v5, "setScreenOnState:", -[SUCoreActivityOptions screenOnState](self, "screenOnState"));
  objc_msgSend(v5, "setNetworkState:", -[SUCoreActivityOptions networkState](self, "networkState"));
  objc_msgSend(v5, "setWifiState:", -[SUCoreActivityOptions wifiState](self, "wifiState"));
  objc_msgSend(v5, "setWaking:", -[SUCoreActivityOptions waking](self, "waking"));
  objc_msgSend(v5, "setPhoneCallState:", -[SUCoreActivityOptions phoneCallState](self, "phoneCallState"));
  objc_msgSend(v5, "setCarplayState:", -[SUCoreActivityOptions carplayState](self, "carplayState"));
  objc_msgSend(v5, "setMediaPlayingState:", -[SUCoreActivityOptions mediaPlayingState](self, "mediaPlayingState"));
  objc_msgSend(v5, "setPriority:", -[SUCoreActivityOptions priority](self, "priority"));
  return v5;
}

- (id)_stringForTriState:(int)a3
{
  if (a3 > 2)
    return CFSTR("UNKNOWN");
  else
    return off_1EA878780[a3];
}

- (id)_stringForPriority:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("Default(Utility)");
  if (a3 == 1)
    v3 = CFSTR("Maintenance");
  if (a3 == 2)
    return CFSTR("Utility");
  else
    return (id)v3;
}

- (id)description
{
  NSNumber *batteryLevelGreaterThan;
  NSNumber *batteryLevelLessThan;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSNumber *v16;
  void *v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0DA8920], "stringFromDate:", self->_runDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  batteryLevelGreaterThan = self->_batteryLevelGreaterThan;
  if (!batteryLevelGreaterThan)
    batteryLevelGreaterThan = (NSNumber *)CFSTR("NOT_SET");
  v16 = batteryLevelGreaterThan;
  if (self->_batteryLevelLessThan)
    batteryLevelLessThan = self->_batteryLevelLessThan;
  else
    batteryLevelLessThan = (NSNumber *)CFSTR("NOT_SET");
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_plugInState);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_screenOnState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_networkState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_wifiState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_waking);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_phoneCallState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_carplayState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_mediaPlayingState);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForPriority:](self, "_stringForPriority:", self->_priority);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("RunDate: %@ BatteryLevelGreaterThan: %@ BatteryLevelLessThan: %@ PluginState: %@ ScreenOnState: %@ NetworkState: %@ WifiState: %@ Waking: %@ PhoneCallState: %@ CarplayState: %@ MediaPlayingState: %@ Priority: %@"), v17, v16, batteryLevelLessThan, v15, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_runDate, a3);
}

- (NSNumber)batteryLevelGreaterThan
{
  return self->_batteryLevelGreaterThan;
}

- (void)setBatteryLevelGreaterThan:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelGreaterThan, a3);
}

- (NSNumber)batteryLevelLessThan
{
  return self->_batteryLevelLessThan;
}

- (void)setBatteryLevelLessThan:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelLessThan, a3);
}

- (int)plugInState
{
  return self->_plugInState;
}

- (void)setPlugInState:(int)a3
{
  self->_plugInState = a3;
}

- (int)screenOnState
{
  return self->_screenOnState;
}

- (void)setScreenOnState:(int)a3
{
  self->_screenOnState = a3;
}

- (int)networkState
{
  return self->_networkState;
}

- (void)setNetworkState:(int)a3
{
  self->_networkState = a3;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(int)a3
{
  self->_wifiState = a3;
}

- (int)waking
{
  return self->_waking;
}

- (void)setWaking:(int)a3
{
  self->_waking = a3;
}

- (int)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(int)a3
{
  self->_phoneCallState = a3;
}

- (int)carplayState
{
  return self->_carplayState;
}

- (void)setCarplayState:(int)a3
{
  self->_carplayState = a3;
}

- (int)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int)a3
{
  self->_mediaPlayingState = a3;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelLessThan, 0);
  objc_storeStrong((id *)&self->_batteryLevelGreaterThan, 0);
  objc_storeStrong((id *)&self->_runDate, 0);
}

@end
