@implementation MSDAppPrivacyPermissionsHelper

+ (id)sharedInstance
{
  if (qword_1001751A8 != -1)
    dispatch_once(&qword_1001751A8, &stru_10013DD18);
  return (id)qword_1001751A0;
}

- (MSDAppPrivacyPermissionsHelper)init
{
  MSDAppPrivacyPermissionsHelper *v2;
  MSDAppPrivacyPermissionsHelper *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDAppPrivacyPermissionsHelper;
  v2 = -[MSDAppPrivacyPermissionsHelper init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getTccOwnedResources](v2, "getTccOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setTccOwnedResources:](v3, "setTccOwnedResources:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getCoreLocationOwnedResources](v3, "getCoreLocationOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setCoreLocationOwnedResources:](v3, "setCoreLocationOwnedResources:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkOwnedResources](v3, "getNetworkOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setNetworkOwnedResources:](v3, "setNetworkOwnedResources:", v6);

  }
  return v3;
}

- (void)grantPrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        v13 = sub_1000604F0();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          v33 = 2114;
          v34 = v12;
          v35 = 2114;
          v36 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s - Granting privacy permission for resource: %{public}@ to app: %{public}@", buf, 0x20u);
        }

        if (-[MSDAppPrivacyPermissionsHelper isTccOwnedResource:](self, "isTccOwnedResource:", v12))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          v16 = objc_msgSend(v15, "BOOLValue");

          if (-[MSDAppPrivacyPermissionsHelper grantTCCPermission:forResource:toBundleID:](self, "grantTCCPermission:forResource:toBundleID:", v16, v12, v7))
          {
            goto LABEL_21;
          }
          v17 = sub_1000604F0();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)buf = 136315906;
          v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          v33 = 2114;
          v34 = v12;
          v35 = 2114;
          v36 = v7;
          v37 = 1024;
          v38 = (int)v16;
          v19 = v18;
          v20 = "%s - Failed to grant TCC resource:  %{public}@ to bundle:  %{public}@ isGranted:  %{BOOL}d";
LABEL_12:
          v21 = 38;
LABEL_24:
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
          goto LABEL_20;
        }
        if (-[MSDAppPrivacyPermissionsHelper isCoreLocationOwnedResource:](self, "isCoreLocationOwnedResource:", v12))
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          -[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:](self, "grantCLPermission:toBundleID:", v18, v7);
        }
        else if (-[MSDAppPrivacyPermissionsHelper isNetworkOwnedResource:](self, "isNetworkOwnedResource:", v12))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          v23 = objc_msgSend(v22, "BOOLValue");

          if (-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:](self, "grantNetworkPermission:toBundleID:", v23, v7))
          {
            goto LABEL_21;
          }
          v24 = sub_1000604F0();
          v18 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            v33 = 2114;
            v34 = v12;
            v35 = 2114;
            v36 = v7;
            v37 = 1024;
            v38 = (int)v23;
            v19 = v18;
            v20 = "%s - Failed to grant network permission:  %{public}@ to bundle:  %{public}@ allow:  %{BOOL}d";
            goto LABEL_12;
          }
        }
        else
        {
          v25 = sub_1000604F0();
          v18 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            v33 = 2114;
            v34 = v12;
            v35 = 2114;
            v36 = v7;
            v19 = v18;
            v20 = "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@";
            v21 = 32;
            goto LABEL_24;
          }
        }
LABEL_20:

LABEL_21:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      v9 = v26;
    }
    while (v26);
  }

}

- (void)revokePrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (char *)a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(const char **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = sub_1000604F0();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v12;
          v23 = 2114;
          v24 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Revoking privacy permission for resource: %{public}@ to app: %{public}@", buf, 0x16u);
        }

        if (-[MSDAppPrivacyPermissionsHelper isTccOwnedResource:](self, "isTccOwnedResource:", v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeTCCPermissionForResource:toBundleID:](self, "revokeTCCPermissionForResource:toBundleID:", v12, v7);
        }
        else if (-[MSDAppPrivacyPermissionsHelper isCoreLocationOwnedResource:](self, "isCoreLocationOwnedResource:", v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeCLPermissionForBundleID:](self, "revokeCLPermissionForBundleID:", v7);
        }
        else if (-[MSDAppPrivacyPermissionsHelper isNetworkOwnedResource:](self, "isNetworkOwnedResource:", v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeNetworkPermissionForBundleID:](self, "revokeNetworkPermissionForBundleID:", v7);
        }
        else
        {
          v15 = sub_1000604F0();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v22 = "-[MSDAppPrivacyPermissionsHelper revokePrivacyPermissions:forAppBundleID:]";
            v23 = 2114;
            v24 = v12;
            v25 = 2114;
            v26 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@", buf, 0x20u);
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v9);
  }

}

- (id)getPrivacyPermissionsForAppBundleID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getTCCPermissionsForBundleID:](self, "getTCCPermissionsForBundleID:", v4));
  if (v6)
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getCLPermissionForBundleID:](self, "getCLPermissionForBundleID:", v4));
  if (v7)
    objc_msgSend(v5, "addEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkAccessPermissionForBundleID:](self, "getNetworkAccessPermissionForBundleID:", v4));
  if (v8)
    objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  return v5;
}

- (id)getTccOwnedResources
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("kTCCServiceAddressBook"), CFSTR("kTCCServiceCalendar"), CFSTR("kTCCServiceMediaLibrary"), CFSTR("kTCCServicePhotos"), CFSTR("kTCCServicePhotosAdd"), CFSTR("kTCCServiceReminders"), CFSTR("kTCCServiceBluetoothAlways"), CFSTR("kTCCServiceBluetoothPeripheral"), CFSTR("kTCCServiceMotion"), CFSTR("kTCCServiceLiverpool"), CFSTR("kTCCServiceUbiquity"), 0);
}

- (id)getCoreLocationOwnedResources
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("kCLServiceLocationService"), 0);
}

- (id)getNetworkOwnedResources
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("kNetworkServiceNetworkAccess"), 0);
}

- (BOOL)grantTCCPermission:(BOOL)a3 forResource:(id)a4 toBundleID:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "-[MSDAppPrivacyPermissionsHelper grantTCCPermission:forResource:toBundleID:]";
    v17 = 1024;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - isGranted:  %{BOOL}d - resources:  %{public}@ - bundleID:  %{public}@", (uint8_t *)&v15, 0x26u);
  }

  v11 = TCCAccessSetForBundleId(v7, v8, v6);
  if (!v11)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000BA068((uint64_t)v7, (uint64_t)v8, v14);

  }
  return v11 != 0;
}

- (void)grantCLPermission:(id)a3 toBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:]";
    v11 = 1024;
    v12 = objc_msgSend(v5, "BOOLValue");
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - status:  %{BOOL}d - bundleID:  %{public}@", (uint8_t *)&v9, 0x1Cu);
  }

  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:](CLLocationManager, "setAuthorizationStatusByType:forBundleIdentifier:", objc_msgSend(v5, "integerValue"), v6);
}

- (BOOL)grantNetworkPermission:(BOOL)a3 toBundleID:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  MSDAppPrivacyPermissionsHelper *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  id v51;

  v4 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:]";
    v48 = 1024;
    v49 = v4;
    v50 = 2114;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - allow:  %{BOOL}d - bundleID:  %{public}@", buf, 0x1Cu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration](self, "getNetworkPrivacyConfiguration"));
  v10 = v9;
  if (!v9)
  {
    v31 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000BA0E0(v21, v32, v33, v34, v35, v36, v37, v38);
    v11 = 0;
LABEL_14:

LABEL_15:
    v29 = 0;
    goto LABEL_17;
  }
  v39 = v4;
  v40 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathController"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathRules"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v13)
  {
LABEL_12:

    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000BA110(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_14;
  }
  v14 = v13;
  v15 = *(_QWORD *)v42;
LABEL_6:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v42 != v15)
      objc_enumerationMutation(v12);
    v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "matchSigningIdentifier"));
    v19 = objc_msgSend(v18, "isEqualToString:", v6);

    if (v19)
      break;
    if (v14 == (id)++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v14)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  objc_msgSend(v17, "setDenyMulticast:", !v39);
  v29 = 1;
  objc_msgSend(v17, "setMulticastPreferenceSet:", 1);

  if (!-[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:](v40, "saveNetworkPrivacyConfiguration:", v10))
    goto LABEL_15;
LABEL_17:

  return v29;
}

- (id)getTCCPermissionsForBundleID:(id)a3
{
  id v3;
  id v4;
  char *v5;
  id v6;
  NSObject *v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  _BYTE v31[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (char *)TCCAccessCopyInformationForBundleId(v3);
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TCC info list: %{public}@", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kTCCInfoService));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kTCCInfoGranted));
        objc_msgSend(v4, "setObject:forKey:", v15, v14);
        v16 = sub_1000604F0();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = objc_msgSend(v15, "BOOLValue");
          *(_DWORD *)buf = 136315650;
          v26 = "-[MSDAppPrivacyPermissionsHelper getTCCPermissionsForBundleID:]";
          v27 = 2114;
          v28 = v14;
          v29 = 1024;
          v30 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s - resource:  %{public}@ - isGranted:  %{BOOL}d", buf, 0x1Cu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  return v19;
}

- (id)getCLPermissionForBundleID:(id)a3
{
  signed int v3;
  id v4;
  void *v5;
  id v6;

  v3 = +[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:", a3);
  v4 = objc_alloc((Class)NSDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
  v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", v5, CFSTR("kCLServiceLocationService"), 0);

  return v6;
}

- (id)getNetworkAccessPermissionForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration](self, "getNetworkPrivacyConfiguration"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathController"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathRules"));
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchSigningIdentifier"));
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if (v15)
          {
            v17 = sub_1000604F0();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_msgSend(v13, "denyMulticast");
              *(_DWORD *)buf = 67109378;
              v37 = v19 ^ 1;
              v38 = 2114;
              v39 = v4;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found network access permission: %d for bundleID: %{public}@", buf, 0x12u);
            }

            v20 = objc_alloc((Class)NSDictionary);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "denyMulticast") ^ 1));
            v16 = objc_msgSend(v20, "initWithObjectsAndKeys:", v21, CFSTR("kNetworkServiceNetworkAccess"), 0);

            goto LABEL_14;
          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
  else
  {
    v24 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BA0E0(v8, v25, v26, v27, v28, v29, v30, v31);
    v7 = 0;
  }
  v16 = 0;
LABEL_14:

  v22 = v16;
  return v22;
}

- (void)revokeTCCPermissionForResource:(id)a3 toBundleID:(id)a4
{
  TCCAccessResetForBundleId(a3, a4);
}

- (void)revokeCLPermissionForBundleID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
    -[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:](self, "grantCLPermission:toBundleID:", v4, v5);

  }
}

- (void)revokeNetworkPermissionForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration](self, "getNetworkPrivacyConfiguration"));
  v6 = v5;
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathRules](v26, "pathRules"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matchSigningIdentifier"));
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            objc_msgSend(v12, "setDenyMulticast:", 1);
            objc_msgSend(v12, "setMulticastPreferenceSet:", 0);

            -[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:](self, "saveNetworkPrivacyConfiguration:", v6);
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v9)
          continue;
        break;
      }
    }

    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to find the appropriate privacy rule.", buf, 2u);
    }

LABEL_14:
    v17 = v26;
  }
  else
  {
    v18 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000BA0E0(v17, v19, v20, v21, v22, v23, v24, v25);
  }

}

- (id)getNetworkPrivacyConfiguration
{
  void *v2;
  dispatch_queue_global_t global_queue;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  dispatch_semaphore_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10001ACF0;
  v20 = sub_10001AD00;
  v21 = dispatch_semaphore_create(0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10001ACF0;
  v14 = sub_10001AD00;
  v15 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  global_queue = dispatch_get_global_queue(33, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AD08;
  v9[3] = &unk_10013DD40;
  v9[4] = &v10;
  v9[5] = &v16;
  objc_msgSend(v2, "loadConfigurationsWithCompletionQueue:handler:", v4, v9);

  v5 = v17[5];
  v6 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

- (BOOL)saveNetworkPrivacyConfiguration:(id)a3
{
  id v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  dispatch_semaphore_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001ACF0;
  v15 = sub_10001AD00;
  v16 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  global_queue = dispatch_get_global_queue(33, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B0B0;
  v10[3] = &unk_10013DA30;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v4, "saveConfiguration:withCompletionQueue:handler:", v3, v6, v10);

  v7 = v12[5];
  v8 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v7, v8);
  LOBYTE(v7) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return (char)v7;
}

- (BOOL)isTccOwnedResource:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper tccOwnedResources](self, "tccOwnedResources"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isCoreLocationOwnedResource:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper coreLocationOwnedResources](self, "coreLocationOwnedResources"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isNetworkOwnedResource:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper networkOwnedResources](self, "networkOwnedResources"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)tccOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTccOwnedResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)coreLocationOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoreLocationOwnedResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)networkOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNetworkOwnedResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOwnedResources, 0);
  objc_storeStrong((id *)&self->_coreLocationOwnedResources, 0);
  objc_storeStrong((id *)&self->_tccOwnedResources, 0);
}

- (void)grantPrivacyPermissionsForAllApps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("AppPrivacyPermissions")));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v12));
        -[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:](self, "grantPrivacyPermissions:forAppBundleID:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)revokePrivacyPermissionsForAllApps
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("AppPrivacyPermissions")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("AppPrivacyPermissions"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 136315650;
    v16 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12, v16, (_QWORD)v17));
        v14 = sub_1000604F0();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          v22 = "-[MSDAppPrivacyPermissionsHelper(manager) revokePrivacyPermissionsForAllApps]";
          v23 = 2114;
          v24 = v12;
          v25 = 2114;
          v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s - Revoking appId:  %{public}@ permissions:  %{public}@", buf, 0x20u);
        }

        -[MSDAppPrivacyPermissionsHelper revokePrivacyPermissions:forAppBundleID:](self, "revokePrivacyPermissions:forAppBundleID:", v13, v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v9);
  }

}

- (void)savePrivacyPermissionsForAllApps:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSystemAppDataList"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSystemAppPrivacyPermissions:", v10));
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v7);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAppList"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAppPrivacyPermissions:", v17));
        if (v18)
          objc_msgSend(v4, "setObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v14);
  }
  if (objc_msgSend(v4, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v19, "setObject:forKey:", v4, CFSTR("AppPrivacyPermissions"));

  }
  v20 = sub_1000604F0();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AppPrivacyPermissions:  %{public}@", buf, 0xCu);
  }

}

@end
