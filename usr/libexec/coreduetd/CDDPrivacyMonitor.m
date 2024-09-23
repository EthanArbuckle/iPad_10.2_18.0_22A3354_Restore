@implementation CDDPrivacyMonitor

- (void)saveCurrentPrivacySetting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Privacy: Writing the current App refresh privacy setting to on-disk plist", v7, 2u);
  }

  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CDDBackgroundAppRefresh"));
  objc_msgSend(v4, "synchronize");
  v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100023688(v6);

}

- (void)shadowRemotePrivacySetting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 updateAllowed;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    updateAllowed = self->updateAllowed;
    v9[0] = 67109376;
    v9[1] = updateAllowed;
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Privacy: Changing current App refresh privacy setting from %d to %d.", (uint8_t *)v9, 0xEu);
  }

  if (!self->updateAllowed && v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDDPrivacyMonitor cdd](self, "cdd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v7, "setDatabaseAge:", v8);

  }
  self->updateAllowed = v3;
  -[CDDPrivacyMonitor saveCurrentPrivacySetting:](self, "saveCurrentPrivacySetting:", v3);
  if (!v3)
    -[CDDPrivacyMonitor deletePrivacySensitiveDBEntries](self, "deletePrivacySensitiveDBEntries");
}

- (BOOL)loadCurrentPrivacySetting
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  int v10;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CDDBackgroundAppRefresh"))),
        v4,
        v4))
  {
    v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("CDDBackgroundAppRefresh"));
    v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      v10 = v5;
      v7 = "Privacy: Loaded App refresh privacy setting to %d.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    LOBYTE(v5) = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      v10 = 1;
      v7 = "Privacy: Error: Cannot load App refresh Privacy Setting. Defaulting to %d.";
      goto LABEL_7;
    }
  }

  return v5;
}

- (CDDPrivacyMonitor)initWithCDDinstance:(id)a3
{
  id v4;
  CDDPrivacyMonitor *v5;
  CDDPrivacyMonitor *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *privacyDispatchQ;
  __CFNotificationCenter *DarwinNotifyCenter;
  CDDPrivacyMonitor *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDDPrivacyMonitor;
  v5 = -[CDDPrivacyMonitor init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    -[CDDPrivacyMonitor setCdd:](v5, "setCdd:", v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.coreduetdPrivacyDispatchQueue", v8);
    privacyDispatchQ = v6->privacyDispatchQ;
    v6->privacyDispatchQ = (OS_dispatch_queue *)v9;

    if (!v6->privacyDispatchQ)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v6->updateAllowed = -[CDDPrivacyMonitor isManagedConfigurationSettingOn](v6, "isManagedConfigurationSettingOn");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_100022164, CFSTR("kKeepAppsUpToDateEnabledChangedNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    if (!v6->updateAllowed)
      -[CDDPrivacyMonitor deletePrivacySensitiveDBEntries](v6, "deletePrivacySensitiveDBEntries");
  }
  v12 = v6;
LABEL_7:

  return v12;
}

- (void)privacyCloak
{
  NSObject *privacyDispatchQ;
  _QWORD block[5];

  privacyDispatchQ = self->privacyDispatchQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022220;
  block[3] = &unk_100038A70;
  block[4] = self;
  dispatch_sync(privacyDispatchQ, block);
}

- (BOOL)isManagedConfigurationSettingOn
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isAutomaticAppUpdatesAllowed");

  return v3;
}

- (CDD)cdd
{
  return self->cdd;
}

- (void)setCdd:(id)a3
{
  objc_storeStrong((id *)&self->cdd, a3);
}

- (BOOL)updateAllowed
{
  return self->updateAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->privacyDispatchQ, 0);
  objc_storeStrong((id *)&self->cdd, 0);
}

@end
