@implementation FMDFMIPAccount

- (void)applyPropertiesFromACAccount:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  id v48;

  v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fmipAccountInfoWithTokens:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccount username](self, "username"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_1003052F0));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_1003052F0));
    -[FMDAccount setUsername:](self, "setUsername:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount dsid](self, "dsid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_1003052F8));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_1003052F8));
    -[FMDFMIPAccount setDsid:](self, "setDsid:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount adsid](self, "adsid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305300));
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305300));
    -[FMDFMIPAccount setAdsid:](self, "setAdsid:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount fmipAuthToken](self, "fmipAuthToken"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305308));
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305308));
    -[FMDFMIPAccount setFmipAuthToken:](self, "setFmipAuthToken:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount iCloudAuthToken](self, "iCloudAuthToken"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305310));
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305310));
    -[FMDFMIPAccount setICloudAuthToken:](self, "setICloudAuthToken:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount appleAccountIdentifier](self, "appleAccountIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305318));
  v26 = objc_msgSend(v24, "isEqualToString:", v25);

  if ((v26 & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305318));
    -[FMDFMIPAccount setAppleAccountIdentifier:](self, "setAppleAccountIdentifier:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccount serverHost](self, "serverHost"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305320));
  v30 = objc_msgSend(v28, "isEqualToString:", v29);

  if ((v30 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305320));
    -[FMDAccount setServerHost:](self, "setServerHost:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccount serverProtocolScheme](self, "serverProtocolScheme"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305328));
  v34 = objc_msgSend(v32, "isEqualToString:", v33);

  if ((v34 & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305328));
    -[FMDAccount setServerProtocolScheme:](self, "setServerProtocolScheme:", v35);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccount apsEnvironment](self, "apsEnvironment"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305330));
  v38 = objc_msgSend(v36, "isEqualToString:", v37);

  if ((v38 & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305330));
    -[FMDAccount setApsEnvironment:](self, "setApsEnvironment:", v39);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount extAccessoryConfigURL](self, "extAccessoryConfigURL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305338));
  v42 = objc_msgSend(v40, "isEqualToString:", v41);

  if ((v42 & 1) == 0)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305338));
    -[FMDFMIPAccount setExtAccessoryConfigURL:](self, "setExtAccessoryConfigURL:", v43);

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount accessoryPairingURL](self, "accessoryPairingURL"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305340));
  v46 = objc_msgSend(v44, "isEqualToString:", v45);

  if ((v46 & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", off_100305340));
    -[FMDFMIPAccount setAccessoryPairingURL:](self, "setAccessoryPairingURL:", v47);

  }
}

- (BOOL)isActive
{
  return (id)-[FMDAccount unregisterState](self, "unregisterState") != (id)2
      && (id)-[FMDAccount unregisterState](self, "unregisterState") != (id)3;
}

- (id)authToken
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount fmipAuthToken](self, "fmipAuthToken"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDFMIPAccount iCloudAuthToken](self, "iCloudAuthToken"));
  v6 = v5;

  return v6;
}

- (void)copyInfoFromAccount:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDFMIPAccount;
  -[FMDAccount copyInfoFromAccount:](&v12, "copyInfoFromAccount:", v4);
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dsid"));
    -[FMDFMIPAccount setDsid:](self, "setDsid:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleAccountIdentifier"));
    -[FMDFMIPAccount setAppleAccountIdentifier:](self, "setAppleAccountIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iCloudAuthToken"));
    -[FMDFMIPAccount setICloudAuthToken:](self, "setICloudAuthToken:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fmipAuthToken"));
    -[FMDFMIPAccount setFmipAuthToken:](self, "setFmipAuthToken:", v10);

    if (objc_msgSend(v6, "fmipEnableContext"))
      -[FMDFMIPAccount setFmipEnableContext:](self, "setFmipEnableContext:", objc_msgSend(v6, "fmipEnableContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastLoggedInDsid"));
    -[FMDFMIPAccount setLastLoggedInDsid:](self, "setLastLoggedInDsid:", v11);

    -[FMDFMIPAccount setLowBatteryLocateEnabled:](self, "setLowBatteryLocateEnabled:", objc_msgSend(v6, "lowBatteryLocateEnabled"));
  }

}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)adsid
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)appleAccountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppleAccountIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)iCloudAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setICloudAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)fmipAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFmipAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)extAccessoryConfigURL
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExtAccessoryConfigURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)accessoryPairingURL
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAccessoryPairingURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)lastLoggedInDsid
{
  return self->_lastLoggedInDsid;
}

- (void)setLastLoggedInDsid:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoggedInDsid, a3);
}

- (NSDate)lastIdentityTime
{
  return self->_lastIdentityTime;
}

- (void)setLastIdentityTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastIdentityTime, a3);
}

- (unint64_t)fmipEnableContext
{
  return self->_fmipEnableContext;
}

- (void)setFmipEnableContext:(unint64_t)a3
{
  self->_fmipEnableContext = a3;
}

- (unint64_t)fmipDisableContext
{
  return self->_fmipDisableContext;
}

- (void)setFmipDisableContext:(unint64_t)a3
{
  self->_fmipDisableContext = a3;
}

- (BOOL)lowBatteryLocateEnabled
{
  return self->_lowBatteryLocateEnabled;
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3
{
  self->_lowBatteryLocateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastIdentityTime, 0);
  objc_storeStrong((id *)&self->_lastLoggedInDsid, 0);
  objc_storeStrong((id *)&self->_accessoryPairingURL, 0);
  objc_storeStrong((id *)&self->_extAccessoryConfigURL, 0);
  objc_storeStrong((id *)&self->_fmipAuthToken, 0);
  objc_storeStrong((id *)&self->_iCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_appleAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_adsid, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
