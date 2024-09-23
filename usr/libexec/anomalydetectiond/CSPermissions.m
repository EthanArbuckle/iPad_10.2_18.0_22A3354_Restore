@implementation CSPermissions

+ (id)sharedInstance
{
  if (qword_1003894B0 != -1)
    dispatch_once(&qword_1003894B0, &stru_100365AB8);
  return (id)qword_1003894A8;
}

- (BOOL)isAuthorizedForIS
{
  void *v2;
  unsigned __int8 v3;

  if (!objc_opt_class(MCProfileConnection))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isSafetyDataSubmissionAllowed");

  return v3;
}

- (BOOL)firstOrThirdPartyEnabled
{
  unsigned __int8 v2;
  void *v3;
  NSObject *v4;
  unsigned int v5;
  void *v6;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;

  v2 = +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities getKappaThirdPartyDisplayNameForApp](SOSUtilities, "getKappaThirdPartyDisplayNameForApp"));

  if (qword_100387360 != -1)
    dispatch_once(&qword_100387360, &stru_100365AD8);
  v4 = (id)qword_100387368;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities getKappaThirdPartyDisplayNameForApp](SOSUtilities, "getKappaThirdPartyDisplayNameForApp"));
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 1024;
    v10 = v6 != 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "1P %d 3P %d", (uint8_t *)v8, 0xEu);

  }
  if (v3)
    v2 = 1;

  return v2;
}

- (BOOL)isAuthorizedToCollectData
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  int v12;
  unsigned int v13;

  if (objc_opt_class(SOSUtilities))
    v2 = +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
  else
    v2 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ForceCollectionAuthorized")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("ForceCollectionAuthorized"));

    if (qword_100387360 != -1)
      dispatch_once(&qword_100387360, &stru_100365AD8);
    v7 = qword_100387368;
    if (os_log_type_enabled((os_log_t)qword_100387368, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "forcing collect authorized %d", (uint8_t *)&v12, 8u);
    }
  }
  else
  {
    if (qword_100387360 != -1)
      dispatch_once(&qword_100387360, &stru_100365AD8);
    v8 = qword_100387368;
    if (os_log_type_enabled((os_log_t)qword_100387368, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67240192;
      v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "logging enabled %{public}d", (uint8_t *)&v12, 8u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
    v10 = objc_msgSend(v9, "isAuthorizedForIS");
    if (v2)
      LOBYTE(v6) = v10;
    else
      LOBYTE(v6) = 0;

  }
  return v6;
}

@end
