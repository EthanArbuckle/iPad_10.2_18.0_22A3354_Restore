@implementation NSPServiceStatusManager

- (PrivacyProxyServiceStatus)serviceStatus
{
  return (PrivacyProxyServiceStatus *)objc_getProperty(self, a2, 8, 1);
}

- (id)diagnostics
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  const char *v11;
  id Property;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v27;
  void *v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "diagnostics"));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ServiceStatus"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = v4;
  v30 = objc_alloc_init((Class)NSMutableArray);
  if (self)
    Property = objc_getProperty(self, v11, 64, 1);
  else
    Property = 0;
  obj = Property;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v16);
        if (v17)
        {
          v18 = objc_alloc_init((Class)NSMutableDictionary);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v17 + 8), "networkStatusString", v27));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStatus"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v17 + 8), "networkTypeString"));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("PrivacyProxyNetworkStatusTimeNetworkInterfaceType"));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(v17 + 16), 1, 2));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("PrivacyProxyNetworkStatusTimeNetworkStartTime"));

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(v17 + 24), 1, 2));
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("PrivacyProxyNetworkStatusTimeNetworkEndTime"));

          if (v18)
            objc_msgSend(v30, "addObject:", v18);
        }
        else
        {
          v18 = 0;
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v14 = v23;
    }
    while (v23);
  }

  if (objc_msgSend(v30, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("NetworkStatus"));
  if (objc_msgSend(v3, "count", v27))
    v24 = v3;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  SEL v6;
  id Property;
  void *v8;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    sub_1000418A4(v3, v4, CFSTR("Service Status"), 0, 14);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    sub_1000418A4(v3, v5, CFSTR("Service Status Timeline"), 0, 14);

    Property = objc_getProperty(self, v6, 64, 1);
    sub_1000418A4(v3, Property, CFSTR("Network Status Timeline"), 0, 14);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
    sub_1000418A4(v3, v8, CFSTR("App Statuses"), 0, 14);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPServiceStatusManager *v4;
  NSPServiceStatusManager *v5;
  unint64_t generation;
  void *v7;
  SEL v8;
  void *v9;
  SEL v10;
  SEL v11;
  const char *v12;
  id Property;
  void *v14;
  SEL v15;
  void *v17;
  SEL v18;
  void *v19;
  SEL v20;

  v4 = -[NSPServiceStatusManager init](+[NSPServiceStatusManager allocWithZone:](NSPServiceStatusManager, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    generation = self->_generation;
    v4->_diskVersion = self->_diskVersion;
    v4->_generation = generation;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    objc_setProperty_atomic(v5, v8, v7, 8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    objc_setProperty_atomic(v5, v10, v9, 16);

    Property = objc_getProperty(self, v11, 64, 1);
  }
  else
  {
    v4->_diskVersion = 0;
    v4->_generation = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "serviceStatus"));
    objc_setProperty_atomic(v5, v18, v17, 8);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "serviceStatusTimeline"));
    objc_setProperty_atomic(v5, v20, v19, 16);

    Property = 0;
  }
  objc_setProperty_atomic(v5, v12, Property, 64);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  objc_setProperty_atomic(v5, v15, v14, 24);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPServiceStatusManager)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSPServiceStatusManager *v7;
  id v8;
  uint64_t v9;
  PrivacyProxyServiceStatus *serviceStatus;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSMutableArray *serviceStatusTimeline;
  id v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *networkStatusTimeline;
  id v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *appStatuses;
  NSPServiceStatusManager *v23;
  uint64_t v25;
  uint8_t v26[16];
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NSPServiceStatusManager;
  v7 = -[NSPServiceStatusManager init](&v27, "init");
  if (v7)
  {
    v7->_diskVersion = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiskVersion"));
    v7->_generation = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Generation"));
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PrivacyProxyServiceStatus), CFSTR("ServiceStatus"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    serviceStatus = v7->_serviceStatus;
    v7->_serviceStatus = (PrivacyProxyServiceStatus *)v9;

    v11 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(PrivacyProxyServiceStatusTime), CFSTR("ServiceStatusTimeline"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v12));
      serviceStatusTimeline = v7->_serviceStatusTimeline;
      v7->_serviceStatusTimeline = (NSMutableArray *)v13;

    }
    v15 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(PrivacyProxyNetworkStatusTime), CFSTR("NetworkStatusTimeline"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v16));
      networkStatusTimeline = v7->_networkStatusTimeline;
      v7->_networkStatusTimeline = (NSMutableArray *)v17;

    }
    v19 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(PrivacyProxyAppStatus), CFSTR("AppStatuses"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v20));
      appStatuses = v7->_appStatuses;
      v7->_appStatuses = (NSMutableArray *)v21;

    }
    v23 = v7;

  }
  else
  {
    v25 = nplog_obj(0, v5, v6);
    v12 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v26, 2u);
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  SEL v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeInteger:forKey:", 2, CFSTR("DiskVersion"));
  if (self)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", self->_generation, CFSTR("Generation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("ServiceStatus"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("ServiceStatusTimeline"));

    Property = objc_getProperty(self, v6, 64, 1);
  }
  else
  {
    objc_msgSend(v11, "encodeInt64:forKey:", 0, CFSTR("Generation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "serviceStatus"));
    objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("ServiceStatus"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "serviceStatusTimeline"));
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("ServiceStatusTimeline"));

    Property = 0;
  }
  objc_msgSend(v11, "encodeObject:forKey:", Property, CFSTR("NetworkStatusTimeline"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("AppStatuses"));

}

- (NSPServiceStatusManager)initWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSPServiceStatusManager *v11;
  PrivacyProxyServiceStatus *v12;
  PrivacyProxyServiceStatus *serviceStatus;
  NSMutableArray *v14;
  NSMutableArray *serviceStatusTimeline;
  NSMutableArray *v16;
  NSMutableArray *networkStatusTimeline;
  NSMutableArray *v18;
  NSMutableArray *appStatuses;
  NSPServiceStatusManager *v20;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  objc_super v25;

  v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)NSPServiceStatusManager;
  v11 = -[NSPServiceStatusManager init](&v25, "init");
  if (v11)
  {
    v12 = (PrivacyProxyServiceStatus *)objc_alloc_init((Class)PrivacyProxyServiceStatus);
    serviceStatus = v11->_serviceStatus;
    v11->_serviceStatus = v12;

    -[PrivacyProxyServiceStatus setServiceStatus:](v11->_serviceStatus, "setServiceStatus:", 0);
    -[PrivacyProxyServiceStatus setNetworkStatuses:](v11->_serviceStatus, "setNetworkStatuses:", 0);
    -[PrivacyProxyServiceStatus setDetails:](v11->_serviceStatus, "setDetails:", 0);
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    serviceStatusTimeline = v11->_serviceStatusTimeline;
    v11->_serviceStatusTimeline = v14;

    sub_100097828(v11, 0);
    v11->_userTier = a3;
    v11->_effectiveTier = a4;
    objc_storeWeak((id *)&v11->_delegate, v8);
    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    networkStatusTimeline = v11->_networkStatusTimeline;
    v11->_networkStatusTimeline = v16;

    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    appStatuses = v11->_appStatuses;
    v11->_appStatuses = v18;

    v11->_generation = 1;
    v20 = v11;
  }
  else
  {
    v22 = nplog_obj(0, v9, v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "[super init] failed", v24, 2u);
    }

  }
  return v11;
}

- (id)initFromPreferencesWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  NSPServiceStatusManager *v9;
  CFPropertyListRef v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  NSPServiceStatusManager *v22;
  uint64_t v23;
  NSPServiceStatusManager *v24;
  uint64_t v25;
  uint64_t v26;
  NSPServiceStatusManager *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int64_t diskVersion;
  id v34;
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  uint64_t v38;

  v8 = a5;
  v9 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:](self, "initWithUserTier:effectiveUserTier:delegate:", a3, a4, v8);
  if (v9)
  {
    v10 = CFPreferencesCopyAppValue(CFSTR("NSPServiceStatusManagerInfo"), kCFPreferencesCurrentApplication);
    if (v10)
    {
      v13 = v10;
      v34 = 0;
      v14 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, &v34);
      v15 = v34;
      v18 = v15;
      if (v14)
        v19 = v15 == 0;
      else
        v19 = 0;
      if (!v19)
      {
        v20 = nplog_obj(v15, v16, v17);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (int64_t)v18;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP status manager info: %@", buf, 0xCu);
        }

        CFRelease(v13);
        v22 = v9;
LABEL_22:
        v27 = v22;
LABEL_23:

        goto LABEL_24;
      }
      CFRelease(v13);
      v24 = -[NSPServiceStatusManager initWithCoder:](v9, "initWithCoder:", v14);
      if (!v24)
      {
        v28 = nplog_obj(0, v25, v26);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to decode NSP status manager info", buf, 2u);
        }

        v27 = 0;
        goto LABEL_23;
      }
      v9 = v24;
      if (v24->_diskVersion != 2)
      {
        v30 = nplog_obj(v24, v25, v26);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          diskVersion = v9->_diskVersion;
          *(_DWORD *)buf = 134218240;
          v36 = diskVersion;
          v37 = 2048;
          v38 = 2;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Saved disk version of status manager info (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }

        v22 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:](v9, "initWithUserTier:effectiveUserTier:delegate:", a3, a4, v8);
        goto LABEL_22;
      }
    }
    else
    {
      v23 = nplog_obj(0, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "no saved status manager info", buf, 2u);
      }
    }

  }
  v27 = v9;
LABEL_24:

  return v27;
}

+ (void)removeFromPreferences
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  _CFPreferencesSetFileProtectionClass(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0, 3);
  CFPreferencesSetAppValue(CFSTR("NSPServiceStatusManagerInfo"), 0, kCFPreferencesCurrentApplication);
  v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  v3 = v2;
  v6 = nplog_obj(v2, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed status manager info from preference file", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove status manager info from preference file", buf, 2u);
  }

}

- (void)publishDailyServiceStatus
{
  NSPServiceStatusStats *v3;
  unint64_t effectiveTier;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_alloc_init(NSPServiceStatusStats);
  if (self)
  {
    effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3)
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_effectiveTier));
    else
      v5 = *(&off_1000F6BD8 + (int)effectiveTier);
  }
  else
  {
    v5 = CFSTR("UNKNOWN");
  }
  -[NSPServiceStatusStats setTierType:](v3, "setTierType:", v5);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceStatusEndTime"));
        if (!v12)
          goto LABEL_14;
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceStatusEndTime"));
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;

        if (v17 <= 86400.0)
        {
LABEL_14:
          switch((unint64_t)objc_msgSend(v11, "serviceStatus"))
          {
            case 0uLL:
              -[NSPServiceStatusStats setServiceStatusDisabledCount:](v3, "setServiceStatusDisabledCount:", (char *)-[NSPServiceStatusStats serviceStatusDisabledCount](v3, "serviceStatusDisabledCount") + 1);
              break;
            case 1uLL:
              -[NSPServiceStatusStats setServiceStatusActiveCount:](v3, "setServiceStatusActiveCount:", (char *)-[NSPServiceStatusStats serviceStatusActiveCount](v3, "serviceStatusActiveCount") + 1);
              break;
            case 2uLL:
              -[NSPServiceStatusStats setServiceStatusOutageCount:](v3, "setServiceStatusOutageCount:", (char *)-[NSPServiceStatusStats serviceStatusOutageCount](v3, "serviceStatusOutageCount") + 1);
              break;
            case 3uLL:
              -[NSPServiceStatusStats setServiceStatusFraudAlertCount:](v3, "setServiceStatusFraudAlertCount:", (char *)-[NSPServiceStatusStats serviceStatusFraudAlertCount](v3, "serviceStatusFraudAlertCount") + 1);
              break;
            case 4uLL:
              -[NSPServiceStatusStats setServiceStatusUnsupportedRegionCount:](v3, "setServiceStatusUnsupportedRegionCount:", (char *)-[NSPServiceStatusStats serviceStatusUnsupportedRegionCount](v3, "serviceStatusUnsupportedRegionCount")+ 1);
              break;
            case 5uLL:
              -[NSPServiceStatusStats setServiceStatusSystemIncompatibleCount:](v3, "setServiceStatusSystemIncompatibleCount:", (char *)-[NSPServiceStatusStats serviceStatusSystemIncompatibleCount](v3, "serviceStatusSystemIncompatibleCount")+ 1);
              break;
            case 6uLL:
              -[NSPServiceStatusStats setServiceStatusSubscriberUnsupportedRegionCount:](v3, "setServiceStatusSubscriberUnsupportedRegionCount:", (char *)-[NSPServiceStatusStats serviceStatusSubscriberUnsupportedRegionCount](v3, "serviceStatusSubscriberUnsupportedRegionCount")+ 1);
              break;
            case 7uLL:
              -[NSPServiceStatusStats setServiceStatusNetworkOutageCount:](v3, "setServiceStatusNetworkOutageCount:", (char *)-[NSPServiceStatusStats serviceStatusNetworkOutageCount](v3, "serviceStatusNetworkOutageCount")+ 1);
              break;
            default:
              break;
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v18;
    }
    while (v18);
  }

  -[NSPProxyAnalytics sendAnalytics](v3, "sendAnalytics");
}

- (void)publishDailyNetworkStatus
{
  NSPNetworkStatusStats *v3;
  NSPNetworkStatusStats *v4;
  unint64_t effectiveTier;
  void *v6;
  SEL v7;
  id Property;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = objc_alloc_init(NSPNetworkStatusStats);
  v4 = v3;
  if (self)
  {
    effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_effectiveTier));
    else
      v6 = *(&off_1000F6BD8 + (int)effectiveTier);
    -[NSPNetworkStatusStats setTierType:](v4, "setTierType:", v6);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    Property = objc_getProperty(self, v7, 64, 1);
  }
  else
  {
    -[NSPNetworkStatusStats setTierType:](v3, "setTierType:", CFSTR("UNKNOWN"));

    Property = 0;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
  }
  v9 = Property;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v13);
        if (v14)
        {
          v15 = *(id *)(v14 + 24);
          if (v15)
          {
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(v14 + 24));
            v19 = v18;

            if (v19 > 86400.0)
              goto LABEL_54;
          }
          v20 = *(void **)(v14 + 8);
        }
        else
        {
          v20 = 0;
        }
        v21 = objc_msgSend(v20, "networkStatus");
        if (v21 == (id)2)
        {
          if (v14)
            v24 = *(void **)(v14 + 8);
          else
            v24 = 0;
          if (objc_msgSend(v24, "networkType") == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusBlockedCount:](v4, "setWifiStatusBlockedCount:", (char *)-[NSPNetworkStatusStats wifiStatusBlockedCount](v4, "wifiStatusBlockedCount") + 1);
          }
          else
          {
            if (v14)
              v27 = *(void **)(v14 + 8);
            else
              v27 = 0;
            if (objc_msgSend(v27, "networkType") == 2)
            {
              -[NSPNetworkStatusStats setCellStatusBlockedCount:](v4, "setCellStatusBlockedCount:", (char *)-[NSPNetworkStatusStats cellStatusBlockedCount](v4, "cellStatusBlockedCount") + 1);
            }
            else
            {
              if (v14)
                v30 = *(void **)(v14 + 8);
              else
                v30 = 0;
              if (objc_msgSend(v30, "networkType") == 3)
                -[NSPNetworkStatusStats setWiredStatusBlockedCount:](v4, "setWiredStatusBlockedCount:", (char *)-[NSPNetworkStatusStats wiredStatusBlockedCount](v4, "wiredStatusBlockedCount") + 1);
            }
          }
        }
        else if (v21 == (id)1)
        {
          if (v14)
            v23 = *(void **)(v14 + 8);
          else
            v23 = 0;
          if (objc_msgSend(v23, "networkType") == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusActiveCount:](v4, "setWifiStatusActiveCount:", (char *)-[NSPNetworkStatusStats wifiStatusActiveCount](v4, "wifiStatusActiveCount") + 1);
          }
          else
          {
            if (v14)
              v25 = *(void **)(v14 + 8);
            else
              v25 = 0;
            if (objc_msgSend(v25, "networkType") == 2)
            {
              -[NSPNetworkStatusStats setCellStatusActiveCount:](v4, "setCellStatusActiveCount:", (char *)-[NSPNetworkStatusStats cellStatusActiveCount](v4, "cellStatusActiveCount") + 1);
            }
            else
            {
              if (v14)
                v28 = *(void **)(v14 + 8);
              else
                v28 = 0;
              if (objc_msgSend(v28, "networkType") == 3)
                -[NSPNetworkStatusStats setWiredStatusActiveCount:](v4, "setWiredStatusActiveCount:", (char *)-[NSPNetworkStatusStats wiredStatusActiveCount](v4, "wiredStatusActiveCount") + 1);
            }
          }
        }
        else if (!v21)
        {
          if (v14)
            v22 = *(void **)(v14 + 8);
          else
            v22 = 0;
          if (objc_msgSend(v22, "networkType") == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusDisabledCount:](v4, "setWifiStatusDisabledCount:", (char *)-[NSPNetworkStatusStats wifiStatusDisabledCount](v4, "wifiStatusDisabledCount") + 1);
          }
          else
          {
            if (v14)
              v26 = *(void **)(v14 + 8);
            else
              v26 = 0;
            if (objc_msgSend(v26, "networkType") == 2)
            {
              -[NSPNetworkStatusStats setCellStatusDisabledCount:](v4, "setCellStatusDisabledCount:", (char *)-[NSPNetworkStatusStats cellStatusDisabledCount](v4, "cellStatusDisabledCount") + 1);
            }
            else
            {
              if (v14)
                v29 = *(void **)(v14 + 8);
              else
                v29 = 0;
              if (objc_msgSend(v29, "networkType") == 3)
                -[NSPNetworkStatusStats setWiredStatusDisabledCount:](v4, "setWiredStatusDisabledCount:", (char *)-[NSPNetworkStatusStats wiredStatusDisabledCount](v4, "wiredStatusDisabledCount") + 1);
            }
          }
        }
LABEL_54:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v31 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v11 = v31;
    }
    while (v31);
  }

  -[NSPProxyAnalytics sendAnalytics](v4, "sendAnalytics");
}

- (void)handleEffectiveUserTierChange:(unint64_t)a3
{
  if (self)
  {
    if (self->_effectiveTier != a3)
      self->_effectiveTier = a3;
  }
}

- (void)reportServiceActiveShouldReport:(BOOL)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSPOutageDurationStats *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;

  if (self && self->_effectiveTier == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    v6 = objc_msgSend(v5, "serviceStatus");

    if (!v6)
    {
      v11 = nplog_obj(v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", objc_msgSend(v14, "serviceStatus")));
        v28 = 138412546;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting service status %@, previous service status %@", (uint8_t *)&v28, 0x16u);

      }
      if (!a3)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        objc_msgSend(v16, "setServiceStatus:", 1);

        sub_100097828(self, (id)1);
        ++self->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
        return;
      }
      goto LABEL_13;
    }
    if (self->_lastOutageType)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      if (objc_msgSend(v10, "serviceStatus") == (id)2)
      {

LABEL_12:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serviceStatusStartTime"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_msgSend(v22, "timeIntervalSinceDate:", v21);
        v24 = v23;

        v25 = objc_alloc_init(NSPOutageDurationStats);
        -[NSPOutageDurationStats setOutageType:](v25, "setOutageType:", self->_lastOutageType);
        -[NSPOutageDurationStats setOutageDurationSec:](v25, "setOutageDurationSec:", (unint64_t)v24);
        -[NSPProxyAnalytics sendAnalytics](v25, "sendAnalytics");

        goto LABEL_13;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      v18 = objc_msgSend(v17, "serviceStatus");

      if (v18 == (id)7)
        goto LABEL_12;
    }
LABEL_13:
    v26 = (void *)sub_10003CD0C(CFSTR("RECOVERED_TITLE"), CFSTR("RECOVERED_TITLE"));
    v27 = (void *)sub_10003CD0C(CFSTR("RECOVERED_SAFARI"), CFSTR("RECOVERED_SAFARI"));
    sub_100098654(self, (id)1, v26, v27, 0);

  }
}

- (void)reportServiceDisabledShouldReport:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  if (self && self->_effectiveTier == 2 || a3)
  {
    if (a3)
    {
      v16 = (id)sub_10003CD0C(CFSTR("UNAVAILABLE_TITLE"), CFSTR("UNAVAILABLE_TITLE"));
      v4 = (void *)sub_10003CD0C(CFSTR("UNAVAILABLE"), CFSTR("UNAVAILABLE"));
      sub_100098654(self, 0, v16, v4, 0);

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      v6 = objc_msgSend(v5, "serviceStatus");

      if (v6)
      {
        v10 = nplog_obj(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", 0));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", objc_msgSend(v13, "serviceStatus")));
          *(_DWORD *)buf = 138412546;
          v18 = v12;
          v19 = 2112;
          v20 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting service status %@, previous service status %@", buf, 0x16u);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        objc_msgSend(v15, "setServiceStatus:", 0);

        sub_100097828(self, 0);
        if (self)
        {
          ++self->_generation;
          +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
        }
      }
    }
  }
}

- (void)reportServiceOutageWithType:(unint64_t)a3 outageReasonStats:(id)a4
{
  id v6;
  unint64_t effectiveTier;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  NSPServiceStatusManager *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a4;
  if (self && self->_effectiveTier == 2)
  {
    if (a3 == 2)
      effectiveTier = 7;
    else
      effectiveTier = self->_effectiveTier;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    v9 = objc_msgSend(v8, "serviceStatus");

    if (v9 != (id)effectiveTier)
    {
      self->_lastOutageType = a3;
      objc_msgSend(v6, "sendAnalytics");
    }
    if (a3 == 2)
    {
      v10 = (void *)sub_10003CD0C(CFSTR("CAPTIVE_WARNING_NO_NETWORK"), CFSTR("CAPTIVE_WARNING_NO_NETWORK"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "networkStatuses"));

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v17, "networkType") == 1)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "networkName"));

              if (v18)
              {
                v24 = (void *)sub_10003CD0C(CFSTR("CAPTIVE_WARNING"), CFSTR("CAPTIVE_WARNING"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "networkName"));
                v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v25));

                v10 = (void *)v26;
                goto LABEL_21;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_21:

      v19 = (void *)sub_10003CD0C(CFSTR("CAPTIVE_WARNING_TITLE"), CFSTR("CAPTIVE_WARNING_TITLE"));
      v20 = self;
      v21 = 7;
      v22 = v19;
      v23 = v10;
    }
    else
    {
      v10 = (void *)sub_10003CD0C(CFSTR("OUTAGE_WARNING_TITLE"), CFSTR("OUTAGE_WARNING_TITLE"));
      v19 = (void *)sub_10003CD0C(CFSTR("OUTAGE_WARNING"), CFSTR("OUTAGE_WARNING"));
      v20 = self;
      v21 = 2;
      v22 = v10;
      v23 = v19;
    }
    sub_100098654(v20, (id)v21, v22, v23, 0);

  }
}

- (BOOL)isServiceActive
{
  void *v2;
  BOOL v3;

  if (!self || self->_effectiveTier != 2)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  v3 = objc_msgSend(v2, "serviceStatus") == (id)1;

  return v3;
}

- (BOOL)isServiceOutage
{
  void *v2;
  BOOL v3;

  if (!self || self->_effectiveTier != 2)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  v3 = objc_msgSend(v2, "serviceStatus") == (id)2;

  return v3;
}

- (BOOL)isNetworkOutage
{
  void *v2;
  BOOL v3;

  if (!self || self->_effectiveTier != 2)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  v3 = objc_msgSend(v2, "serviceStatus") == (id)7;

  return v3;
}

- (void)reportFraudAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self)
  {
    if (self->_effectiveTier == 2)
    {
      v6 = (id)sub_10003CD0C(CFSTR("FRAUD_WARNING_TITLE"), CFSTR("FRAUD_WARNING_TITLE"));
      v3 = (void *)sub_10003CEA4(CFSTR("FRAUD_WARNING"));
      v4 = (void *)sub_10003CEA4(CFSTR("FRAUD_WARNING"));
      v5 = (void *)sub_10003CD0C(v3, v4);
      sub_100098654(self, (id)3, v6, v5, 0);

    }
  }
}

- (void)reportUnsupportedRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      v10 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)sub_10003CD0C(CFSTR("REGION_WARNING_TITLE"), CFSTR("REGION_WARNING_TITLE"));
    v8 = (void *)sub_10003CD0C(CFSTR("REGION_WARNING"), CFSTR("REGION_WARNING"));
    sub_100098654(self, (id)4, v7, v8, v6);

  }
}

- (void)reportSubscriberUnsupportedRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      v10 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)sub_10003CD0C(CFSTR("REGION_WARNING_TITLE"), CFSTR("REGION_WARNING_TITLE"));
    v8 = (void *)sub_10003CD0C(CFSTR("REGION_WARNING"), CFSTR("REGION_WARNING"));
    sub_100098654(self, (id)6, v7, v8, v6);

  }
}

- (void)clearNetworkStatusForType:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkStatuses"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "networkType") == a3)
          v10 = 1;
        else
          objc_msgSend(v5, "addObject:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    objc_msgSend(v14, "setNetworkStatuses:", v5);

    if (self != 0 && (v10 & 1) != 0)
    {
      ++self->_generation;
      +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
    }
  }
  else
  {

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    objc_msgSend(v15, "setNetworkStatuses:", v5);

  }
}

- (void)reportActiveOnWiFiName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Wi-Fi network %@ is active", (uint8_t *)&v9, 0xCu);
  }

  sub_100099544(self, (id)1, 1, v4);
}

- (void)reportDisabledOnWiFiName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wi-Fi network %@ is disabled", (uint8_t *)&v9, 0xCu);
  }

  sub_100099544(self, 0, 1, v4);
}

- (void)reportBlockedOnWiFiName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id Property;
  void *v11;
  void *v12;
  NSPUserNotification *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wi-Fi network %@ is blocked", buf, 0xCu);
  }

  if (sub_100099544(self, (id)2, 1, v4))
  {
    if (self)
      Property = objc_getProperty(self, v9, 56, 1);
    else
      Property = 0;
    sub_1000A5848((uint64_t)Property);
    v11 = (void *)sub_10003CD0C(CFSTR("WARNING_TITLE"), CFSTR("WARNING_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v4));

    v13 = [NSPUserNotification alloc];
    v14 = (void *)sub_10003CD0C(CFSTR("WIFI_WARNING"), CFSTR("WIFI_WARNING"));
    v15 = (void *)sub_10003CD0C(CFSTR("USE_WITHOUT_PROXY"), CFSTR("USE_WITHOUT_PROXY"));
    v16 = (void *)sub_10003CD0C(CFSTR("USE_OTHER_NETWORK"), CFSTR("USE_OTHER_NETWORK"));
    v17 = sub_100054A70(self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10009A174;
    v21[3] = &unk_1000F6238;
    v21[4] = self;
    v22 = v4;
    v20 = sub_1000A5328(v13, v12, v14, v15, v16, 0, 0, v18, v21);
    if (self)
      objc_setProperty_atomic(self, v19, v20, 56);

  }
}

- (void)reportActiveOnCellularName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Cellular network %@ is active", (uint8_t *)&v9, 0xCu);
  }

  sub_100099544(self, (id)1, 2, v4);
}

- (void)reportDisabledOnCellularName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cellular network %@ is disabled", (uint8_t *)&v9, 0xCu);
  }

  sub_100099544(self, 0, 2, v4);
}

- (void)reportBlockedOnCellularName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id Property;
  NSPUserNotification *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const char *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cellular network %@ is blocked", buf, 0xCu);
  }

  if (sub_100099544(self, (id)2, 2, v4))
  {
    if (self)
      Property = objc_getProperty(self, v9, 56, 1);
    else
      Property = 0;
    sub_1000A5848((uint64_t)Property);
    v11 = [NSPUserNotification alloc];
    v12 = (void *)sub_10003CD0C(CFSTR("CELLULAR_WARNING_TITLE"), CFSTR("CELLULAR_WARNING_TITLE"));
    v13 = (void *)sub_10003CD0C(CFSTR("CELLULAR_WARNING"), CFSTR("CELLULAR_WARNING"));
    v14 = (void *)sub_10003CD0C(CFSTR("USE_WITHOUT_PROXY"), CFSTR("USE_WITHOUT_PROXY"));
    v15 = (void *)sub_10003CD0C(CFSTR("CELLULAR_SETTINGS"), CFSTR("CELLULAR_SETTINGS"));
    v16 = sub_100054A70(self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10009A65C;
    v20[3] = &unk_1000F6238;
    v20[4] = self;
    v21 = v4;
    v19 = sub_1000A5328(v11, v12, v13, v14, v15, 0, 0, v17, v20);
    if (self)
      objc_setProperty_atomic(self, v18, v19, 56);

  }
}

- (void)reportActiveOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v12 = nplog_obj(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is active", (uint8_t *)&v14, 0x16u);
  }

  sub_100099544(self, (id)1, v5, v8);
}

- (void)reportDisabledOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v12 = nplog_obj(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is disabled", (uint8_t *)&v14, 0x16u);
  }

  sub_100099544(self, 0, v5, v8);
}

- (void)reportBlockedOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  id Property;
  void *v16;
  void *v17;
  NSPUserNotification *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  const char *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v12 = nplog_obj(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    v32 = 2112;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is blocked", buf, 0x16u);
  }

  if (sub_100099544(self, (id)2, v5, v8))
  {
    if (self)
      Property = objc_getProperty(self, v14, 56, 1);
    else
      Property = 0;
    sub_1000A5848((uint64_t)Property);
    v16 = (void *)sub_10003CD0C(CFSTR("WARNING_TITLE"), CFSTR("WARNING_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v9));

    v18 = [NSPUserNotification alloc];
    v19 = (void *)sub_10003CD0C(CFSTR("WIFI_WARNING"), CFSTR("WIFI_WARNING"));
    v20 = (void *)sub_10003CD0C(CFSTR("USE_WITHOUT_PROXY"), CFSTR("USE_WITHOUT_PROXY"));
    v21 = (void *)sub_10003CD0C(CFSTR("USE_OTHER_NETWORK"), CFSTR("USE_OTHER_NETWORK"));
    v22 = sub_100054A70(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10009AC00;
    v26[3] = &unk_1000F6B78;
    v26[4] = self;
    v27 = v8;
    v28 = v9;
    v29 = v5;
    v25 = sub_1000A5328(v18, v17, v19, v20, v21, 0, 0, v23, v26);
    if (self)
      objc_setProperty_atomic(self, v24, v25, 56);

  }
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  NSPServiceStatusManager *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];

  v6 = a3;
  v26 = a4;
  v27 = objc_alloc_init((Class)NSMutableArray);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v8)
  {

    if (!v6)
      goto LABEL_20;
    goto LABEL_18;
  }
  v9 = v8;
  v25 = self;
  v10 = *(_QWORD *)v29;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
      if (objc_msgSend(v14, "isEqualToString:", v6))
      {

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
        v16 = objc_msgSend(v15, "isEqualToString:", v26);

        if (!v16)
          goto LABEL_11;
      }
      if (objc_msgSend(v13, "appStatus") != (id)2)
        continue;
      v11 = 0;
LABEL_11:
      objc_msgSend(v27, "addObject:", v13);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  }
  while (v9);

  self = v25;
  if ((v11 & 1) != 0)
  {
    if (!v6)
      goto LABEL_20;
LABEL_18:
    if (v26
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace")), v18 = objc_msgSend(v17, "applicationIsInstalled:", v6), v17, (v18 & 1) != 0))
    {
LABEL_20:
      v22 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v23 = objc_msgSend(objc_alloc((Class)PrivacyProxyAppStatus), "initWithStatus:bundleID:path:activeDate:", 1, v6, v26, v22);
      objc_msgSend(v27, "addObject:", v23);
      sub_10009AC58(self, v27, v22);
      if (self)
      {
        ++self->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
      }

    }
    else
    {
      v24 = nplog_obj(v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v6;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Bundle ID %@ not known to launch services, ignoring", buf, 0xCu);
      }
    }

  }
}

- (BOOL)changePausedState:(BOOL)a3 forApp:(id)a4 path:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _UNKNOWN **v13;
  id v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  unsigned int v26;
  BOOL v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSPServiceStatusManager *v33;
  char v34;
  id v35;
  id v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v6 = a3;
  v8 = a4;
  v35 = a5;
  if (v6)
    v9 = 2;
  else
    v9 = 1;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v13 = &AnalyticsSendEventLazy_ptr;
  if (!v12)
  {

    goto LABEL_22;
  }
  v14 = v12;
  v33 = self;
  v34 = 0;
  v15 = *(_QWORD *)v39;
  v16 = 1;
  do
  {
    v17 = 0;
    v36 = v14;
    do
    {
      if (*(_QWORD *)v39 != v15)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleIdentifier"));
      if (objc_msgSend(v19, "isEqualToString:", v8))
      {

      }
      else
      {
        v37 = v16;
        v20 = v15;
        v21 = v11;
        v22 = v9;
        v23 = v10;
        v24 = v8;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
        v26 = objc_msgSend(v25, "isEqualToString:", v35);

        v8 = v24;
        v10 = v23;
        v9 = v22;
        v11 = v21;
        v15 = v20;
        v14 = v36;

        if (!v26)
        {
          v16 = v37;
          goto LABEL_16;
        }
      }
      if (objc_msgSend(v18, "appStatus") == (id)v9)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v18, "setAppStatus:", v9);
        v16 = 0;
        v34 = 1;
      }
LABEL_16:
      objc_msgSend(v10, "addObject:", v18);
      v17 = (char *)v17 + 1;
    }
    while (v14 != v17);
    v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v14);

  self = v33;
  v13 = &AnalyticsSendEventLazy_ptr;
  if ((v16 & 1) != 0)
  {
LABEL_22:
    v28 = objc_alloc((Class)PrivacyProxyAppStatus);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[99], "now"));
    v30 = objc_msgSend(v28, "initWithStatus:bundleID:path:activeDate:", v9, v8, v35, v29);

    objc_msgSend(v10, "addObject:", v30);
    goto LABEL_23;
  }
  if ((v34 & 1) == 0)
  {
    v27 = 0;
    goto LABEL_26;
  }
LABEL_23:
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[99], "now"));
  sub_10009AC58(self, v10, v31);

  if (self)
  {
    ++self->_generation;
    +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
  }
  v27 = 1;
LABEL_26:

  return v27;
}

- (void)clearAllPausedApps
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "appStatus") == (id)2)
          objc_msgSend(v9, "setAppStatus:", 1);
        objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  sub_10009AC58(self, v3, v10);

  if (self)
  {
    ++self->_generation;
    +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"));
  }

}

- (BOOL)hasPausedApps
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "appStatus") == (id)2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)pausedBundleIDs
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "appStatus") == (id)2)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

          if (v9)
          {
            if (!v5)
              v5 = objc_alloc_init((Class)NSMutableArray);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
            objc_msgSend(v5, "addObject:", v10);

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pausedProcessPaths
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "appStatus") == (id)2)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

          if (v9)
          {
            if (!v5)
              v5 = objc_alloc_init((Class)NSMutableArray);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
            objc_msgSend(v5, "addObject:", v10);

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableArray)serviceStatusTimeline
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)appStatuses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStatusTimeline, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appStatuses, 0);
  objc_storeStrong((id *)&self->_serviceStatusTimeline, 0);
  objc_storeStrong((id *)&self->_serviceStatus, 0);
}

@end
