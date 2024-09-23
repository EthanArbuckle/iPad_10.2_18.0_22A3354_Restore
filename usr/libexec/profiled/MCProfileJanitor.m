@implementation MCProfileJanitor

- (void)removeExpiredProfiles
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  unsigned int v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Checking for configuration profiles to remove due to expired removal date.", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allInstalledProfileIdentifiers"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installedProfileWithIdentifier:", v10));
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "removalDate"));
          v15 = v14;
          if (v14)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "earlierDate:", v35));

            if (v16 == v15)
            {
              v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v47 = v10;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Profile “%{public}@” has expired and will be removed.", buf, 0xCu);
              }
              if (objc_msgSend(v13, "isInstalledForUser"))
                v18 = 2;
              else
                v18 = 1;
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
              objc_msgSend(v3, "setObject:forKey:", v19, v10);

            }
          }

        }
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
  {
    v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing %d configuration profiles.", buf, 8u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v3;
    v24 = v3;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
          v30 = objc_autoreleasePoolPush();
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v29));
          objc_msgSend(v23, "removeProfileWithIdentifier:installationType:source:", v29, (int)objc_msgSend(v31, "intValue"), CFSTR("Expired Profile Removal"));

          objc_autoreleasePoolPop(v30);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v26);
    }

    v3 = v34;
  }
  -[MCProfileJanitor _removeExpiredProvisioningProfiles](self, "_removeExpiredProvisioningProfiles");
  v32 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Finished checking for profiles to remove.", buf, 2u);
  }

}

- (void)_removeExpiredProvisioningProfiles
{
  NSObject *v2;
  void *v3;
  uint64_t DeviceUUID;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  os_log_t v13;
  NSObject *v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  unsigned int v36;

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Checking for provisioning profiles to remove due to expiry.", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  DeviceUUID = MCGestaltGetDeviceUUID();
  v5 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100082284;
  v30[3] = &unk_1000E4388;
  v7 = v3;
  v31 = v7;
  v8 = v6;
  v32 = v8;
  v9 = v5;
  v33 = v9;
  v10 = MISEnumerateInstalledProvisioningProfiles(0, v30);
  if (v10)
  {
    v11 = v10;
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot retrieve list of provisioning profiles with MIS error: %d", buf, 8u);
    }
  }
  else if (objc_msgSend(v8, "count"))
  {
    v25 = v9;
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109120;
      v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing %d provisioning profiles.", buf, 8u);

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = objc_autoreleasePoolPush();
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
          v24 = objc_msgSend(v23, "removeProvisioningProfileUUID:sender:", v21, CFSTR("MCProfileJanitor._removeExpiredProvisioningProfiles"));

          objc_autoreleasePoolPop(v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    v9 = v25;
  }

}

- (id)earliestExpiryDate
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];

  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = sub_100082714;
  v31 = sub_100082724;
  v32 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allInstalledProfileIdentifiers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v6);
        v8 = objc_autoreleasePoolPush();
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "installedProfileWithIdentifier:", v7));
        v10 = v9;
        if (v9)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "removalDate"));
          v12 = v11;
          v13 = v28;
          if (!v28[5])
            goto LABEL_11;
          if (v11)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:"));
            v15 = v14 == v12;

            if (v15)
            {
              v13 = v28;
LABEL_11:
              objc_storeStrong(v13 + 5, v12);
            }
          }

        }
        objc_autoreleasePoolPop(v8);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v4);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008272C;
  v22[3] = &unk_1000E43B0;
  v22[4] = &v27;
  v16 = MISEnumerateInstalledProvisioningProfiles(0, v22);
  if (v16)
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot retrieve list of provisioning profiles. Status: %d", buf, 8u);
    }
  }
  v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v19 = v28[5];
    *(_DWORD *)buf = 138543362;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Checking profiles for expiry. Earliest expiry date: %{public}@", buf, 0xCu);
  }
  v20 = v28[5];

  _Block_object_dispose(&v27, 8);
  return v20;
}

@end
