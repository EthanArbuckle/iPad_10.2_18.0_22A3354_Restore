@implementation MCAirPlaySecurityPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  -[MCAirPlaySecurityPayloadHandler _setAirPlaySecurityConfiguration](self, "_setAirPlaySecurityConfiguration", a3, a4, a5, a6);
  return 1;
}

- (void)setAside
{
  -[MCAirPlaySecurityPayloadHandler _unsetAirPlaySecurityConfiguration](self, "_unsetAirPlaySecurityConfiguration");
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCAirPlaySecurityPayloadHandler _unsetAirPlaySecurityConfiguration](self, "_unsetAirPlaySecurityConfiguration");
}

- (void)_setAirPlaySecurityConfiguration
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
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v9, "setBoolValue:forSetting:sender:", 0, MCFeatureAirPlaySecuritySettingsUIAllowed, v14);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "securityType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "password"));
  -[MCAirPlaySecurityPayloadHandler _setAccessType:securityType:password:](self, "_setAccessType:securityType:password:", v11, v12, v13);

}

- (void)_unsetAirPlaySecurityConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v9, "removeBoolSetting:sender:", MCFeatureAirPlaySecuritySettingsUIAllowed, v10);

  -[MCAirPlaySecurityPayloadHandler _setAccessType:securityType:password:](self, "_setAccessType:securityType:password:", 0, 0, 0);
}

- (void)_setAccessType:(id)a3 securityType:(id)a4 password:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  v5 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AirPlay Security payload can only be installed on tvOS", v6, 2u);
  }
}

@end
