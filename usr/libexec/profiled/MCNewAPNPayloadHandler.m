@implementation MCNewAPNPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  NSObject *v6;
  uint8_t v8[16];

  v6 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MCNewAPNPayloadHandler ignoring install because APN payloads are no longer supported", v8, 2u);
  }
  return 1;
}

- (void)_remove
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apnDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](MCAPNPayload, "apnDomainName"));
  +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:](MCManagedPreferencesManager, "removeManagedPreferences:fromDomain:", v3, v4);

}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCNewAPNPayloadHandler _remove](self, "_remove");
}

- (void)unsetAside
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MCNewAPNPayloadHandler ignoring unset aside because APN payloads are no longer supported", v3, 2u);
  }
}

- (void)_sendNotifications
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MCNewAPNPayloadHandler notifying Core Telephony of APN changes", (uint8_t *)&v8, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](MCAPNPayload, "apnDomainName"));
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:](MCManagedPreferencesManager, "sendManagedPreferencesChangedNotificationForDomains:", v4);

  v5 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resetAPNSettings"));
  if (v6)
  {
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MCNewAPNPayloadHandler reset APN settings error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  -[MCNewAPNPayloadHandler _sendNotifications](self, "_sendNotifications", a3, a4);
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  -[MCNewAPNPayloadHandler _sendNotifications](self, "_sendNotifications", a3, a4);
}

@end
