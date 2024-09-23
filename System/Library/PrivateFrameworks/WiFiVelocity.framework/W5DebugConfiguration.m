@implementation W5DebugConfiguration

- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8
{
  id v14;
  W5DebugConfiguration *v15;
  uint64_t v16;
  W5DiagnosticsMode *diagnosticsMode;
  NSObject *v19;
  objc_super v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)W5DebugConfiguration;
  v15 = -[W5DebugConfiguration init](&v20, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    diagnosticsMode = v15->_diagnosticsMode;
    v15->_diagnosticsMode = (W5DiagnosticsMode *)v16;

    v15->_wifi = a4;
    v15->_megaWiFiProfile = a5;
    v15->_noLoggingWiFiProfile = a6;
    v15->_eapol = a7;
    v15->_bluetooth = a8;
    v15->_stbc = 0;
  }
  else
  {
    W5GetOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolSta"
            "te:bluetoothState:]";
      v23 = 2080;
      v24 = "W5DebugConfiguration.m";
      v25 = 1024;
      v26 = 31;
      _os_log_send_and_compose_impl();
    }

  }
  return v15;
}

- (id)initDiagnosticsMode:(id)a3 wifiState:(int64_t)a4 megaWiFiProfileState:(int64_t)a5 noLoggingWiFiProfileState:(int64_t)a6 eapolState:(int64_t)a7 bluetoothState:(int64_t)a8 stbcState:(int64_t)a9
{
  id v15;
  W5DebugConfiguration *v16;
  uint64_t v17;
  W5DiagnosticsMode *diagnosticsMode;
  NSObject *v20;
  objc_super v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)W5DebugConfiguration;
  v16 = -[W5DebugConfiguration init](&v21, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    diagnosticsMode = v16->_diagnosticsMode;
    v16->_diagnosticsMode = (W5DiagnosticsMode *)v17;

    v16->_wifi = a4;
    v16->_megaWiFiProfile = a5;
    v16->_noLoggingWiFiProfile = a6;
    v16->_eapol = a7;
    v16->_bluetooth = a8;
    v16->_stbc = a9;
  }
  else
  {
    W5GetOSLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315650;
      v23 = "-[W5DebugConfiguration initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolSta"
            "te:bluetoothState:stbcState:]";
      v24 = 2080;
      v25 = "W5DebugConfiguration.m";
      v26 = 1024;
      v27 = 55;
      _os_log_send_and_compose_impl();
    }

  }
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  W5DescriptionForLogState(self->_wifi);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("WiFi: %@\n"), v4);

  W5DescriptionForLogState(self->_megaWiFiProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Mega WiFi Profile: %@\n"), v5);

  W5DescriptionForLogState(self->_noLoggingWiFiProfile);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("No Logging WiFi Profile: %@\n"), v6);

  W5DescriptionForLogState(self->_eapol);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("EAPOL: %@\n"), v7);

  W5DescriptionForLogState(self->_bluetooth);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Bluetooth: %@\n"), v8);

  W5DescriptionForDiagnosticsState(-[W5DiagnosticsMode state](self->_diagnosticsMode, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("STBC: %@\n"), v9);

  W5DescriptionForDiagnosticsState(-[W5DiagnosticsMode state](self->_diagnosticsMode, "state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Diagnostics Mode: %@\n"), v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (BOOL)isEqualToDebugConfiguration:(id)a3
{
  id v4;
  int64_t wifi;
  int64_t megaWiFiProfile;
  int64_t noLoggingWiFiProfile;
  int64_t eapol;
  int64_t bluetooth;
  int64_t stbc;
  BOOL v11;

  v4 = a3;
  wifi = self->_wifi;
  if (wifi == objc_msgSend(v4, "wifi")
    && (megaWiFiProfile = self->_megaWiFiProfile, megaWiFiProfile == objc_msgSend(v4, "megaWiFiProfile"))
    && (noLoggingWiFiProfile = self->_noLoggingWiFiProfile,
        noLoggingWiFiProfile == objc_msgSend(v4, "noLoggingWiFiProfile"))
    && (eapol = self->_eapol, eapol == objc_msgSend(v4, "eapol"))
    && (bluetooth = self->_bluetooth, bluetooth == objc_msgSend(v4, "bluetooth")))
  {
    stbc = self->_stbc;
    v11 = stbc == objc_msgSend(v4, "stbc");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  W5DebugConfiguration *v4;
  W5DebugConfiguration *v5;
  BOOL v6;

  v4 = (W5DebugConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[W5DebugConfiguration isEqualToDebugConfiguration:](self, "isEqualToDebugConfiguration:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_wifi);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_megaWiFiProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_noLoggingWiFiProfile);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_eapol);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_bluetooth);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_stbc);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v10 ^ v14 ^ -[W5DiagnosticsMode hash](self->_diagnosticsMode, "hash");

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DebugConfiguration *v4;

  v4 = -[W5DebugConfiguration init](+[W5DebugConfiguration allocWithZone:](W5DebugConfiguration, "allocWithZone:", a3), "init");
  -[W5DebugConfiguration setWifi:](v4, "setWifi:", self->_wifi);
  -[W5DebugConfiguration setMegaWiFiProfile:](v4, "setMegaWiFiProfile:", self->_megaWiFiProfile);
  -[W5DebugConfiguration setNoLoggingWiFiProfile:](v4, "setNoLoggingWiFiProfile:", self->_noLoggingWiFiProfile);
  -[W5DebugConfiguration setEapol:](v4, "setEapol:", self->_eapol);
  -[W5DebugConfiguration setBluetooth:](v4, "setBluetooth:", self->_bluetooth);
  -[W5DebugConfiguration setDiagnosticsMode:](v4, "setDiagnosticsMode:", self->_diagnosticsMode);
  -[W5DebugConfiguration setStbc:](v4, "setStbc:", self->_stbc);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t wifi;
  id v5;

  wifi = self->_wifi;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", wifi, CFSTR("_wifi"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_megaWiFiProfile, CFSTR("_megaWiFiProfile"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_noLoggingWiFiProfile, CFSTR("_noLoggingWiFiProfile"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eapol, CFSTR("_eapol"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bluetooth, CFSTR("_bluetooth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stbc, CFSTR("_stbc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticsMode, CFSTR("_diagnosticsMode"));

}

- (W5DebugConfiguration)initWithCoder:(id)a3
{
  id v4;
  W5DebugConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  W5DiagnosticsMode *diagnosticsMode;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)W5DebugConfiguration;
  v5 = -[W5DebugConfiguration init](&v16, sel_init);
  if (v5)
  {
    v5->_wifi = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_wifi"));
    v5->_megaWiFiProfile = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_megaWiFiProfile"));
    v5->_noLoggingWiFiProfile = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_noLoggingWiFiProfile"));
    v5->_eapol = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eapol"));
    v5->_bluetooth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_bluetooth"));
    v5->_stbc = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stbc"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_diagnosticsMode"));
    v13 = objc_claimAutoreleasedReturnValue();
    diagnosticsMode = v5->_diagnosticsMode;
    v5->_diagnosticsMode = (W5DiagnosticsMode *)v13;

  }
  return v5;
}

- (int64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(int64_t)a3
{
  self->_wifi = a3;
}

- (int64_t)megaWiFiProfile
{
  return self->_megaWiFiProfile;
}

- (void)setMegaWiFiProfile:(int64_t)a3
{
  self->_megaWiFiProfile = a3;
}

- (int64_t)noLoggingWiFiProfile
{
  return self->_noLoggingWiFiProfile;
}

- (void)setNoLoggingWiFiProfile:(int64_t)a3
{
  self->_noLoggingWiFiProfile = a3;
}

- (int64_t)eapol
{
  return self->_eapol;
}

- (void)setEapol:(int64_t)a3
{
  self->_eapol = a3;
}

- (int64_t)bluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(int64_t)a3
{
  self->_bluetooth = a3;
}

- (int64_t)stbc
{
  return self->_stbc;
}

- (void)setStbc:(int64_t)a3
{
  self->_stbc = a3;
}

- (W5DiagnosticsMode)diagnosticsMode
{
  return self->_diagnosticsMode;
}

- (void)setDiagnosticsMode:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsMode, 0);
}

@end
