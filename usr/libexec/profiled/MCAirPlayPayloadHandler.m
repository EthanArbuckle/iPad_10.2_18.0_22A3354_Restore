@implementation MCAirPlayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  BOOL v26;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  MCAirPlayPayloadHandler *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v33 = self;
  -[MCAirPlayPayloadHandler _addDependency](self, "_addDependency");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationsWithPasswords"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v31 = kMCAppleKeychainGroup;
    v32 = kMCAirPlayPasswordServiceKey;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceName"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));

          if (v16)
          {
            v17 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceName"));
              *(_DWORD *)buf = 138543362;
              v40 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting AirPlay password for device name %{public}@", buf, 0xCu);

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v33, "profileHandler"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "profile"));
            v24 = objc_msgSend(v23, "isInstalledForSystem");
            v34 = 0;
            LOBYTE(v28) = v24;
            +[MCKeychain setString:forService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:group:useSystemKeychain:outError:", v20, v32, v21, 0, 0, v31, v28, &v34);
            v25 = v34;

            if (v25)
            {

              -[MCAirPlayPayloadHandler _removeDependency](v33, "_removeDependency");
              v26 = 0;
              if (a6)
                *a6 = objc_msgSend(v25, "MCCopyAsPrimaryError");
              goto LABEL_16;
            }
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v10)
        continue;
      break;
    }
  }

  v25 = 0;
  v26 = 1;
LABEL_16:

  return v26;
}

- (void)_addDependency
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allowListDestinations"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName", v31, v32));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
          v15 = v12;
          v16 = v13;
          v17 = v14;
          v18 = v7;
          v19 = v8;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
          v15 = v12;
          v16 = v13;
          v17 = v14;
          v19 = v31;
          v18 = v32;
        }
        objc_msgSend(v15, "addDependent:ofParent:inDomain:reciprocalDomain:", v16, v17, v18, v19);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationsWithPasswords"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceName"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
        objc_msgSend(v28, "addDependent:ofParent:inDomain:reciprocalDomain:", v29, v30, v24, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

}

- (void)_removeDependency
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allowListDestinations"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName", v31, v32));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
          v15 = v12;
          v16 = v13;
          v17 = v14;
          v18 = v7;
          v19 = v8;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
          v15 = v12;
          v16 = v13;
          v17 = v14;
          v19 = v31;
          v18 = v32;
        }
        objc_msgSend(v15, "removeDependent:fromParent:inDomain:reciprocalDomain:", v16, v17, v18, v19);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationsWithPasswords"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceName"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
        objc_msgSend(v28, "removeDependent:fromParent:inDomain:reciprocalDomain:", v29, v30, v24, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCAirPlayPayloadHandler _removeDependency](self, "_removeDependency");
}

+ (void)recomputeAirPlaySettings
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  id v27;
  unint64_t v28;
  void *v29;
  unsigned __int8 v30;
  int v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Recomputing AirPlay settings.", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v4 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentsInDomain:", kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dependentsOfParent:inDomain:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), v4));
        if (objc_msgSend(v11, "count"))
        {
          if (v8)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
            objc_msgSend((id)v8, "intersectSet:", v12);

          }
          else
          {
            v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v11));
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend((id)v8, "count"))
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      v15 = objc_msgSend((id)v8, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting AirPlay allowlist to %lu devices.", buf, 0xCu);

    }
  }
  else
  {

    v8 = 0;
  }
  v38 = v5;
  v16 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentsInDomain:", kMCDMPayloadUUIDToDeviceNameDependencyKey));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dependentsOfParent:inDomain:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j), v16));
        if (objc_msgSend(v23, "count"))
        {
          if (v20)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
            objc_msgSend((id)v20, "intersectSet:", v24);

          }
          else
          {
            v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v23));
          }
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }
  if (objc_msgSend((id)v20, "count"))
  {
    v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      v27 = objc_msgSend((id)v8, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Setting AirPlay whitelist to %lu devices.", buf, 0xCu);

    }
  }
  else
  {

    v20 = 0;
  }
  v28 = (unint64_t)CFPreferencesCopyAppValue(CFSTR("deviceFilter"), CFSTR("com.apple.airplay"));
  if (v28 | v8
    && (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "allObjects")),
        v30 = objc_msgSend((id)v28, "isEqualToArray:", v29),
        v29,
        (v30 & 1) == 0))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "allObjects"));
    CFPreferencesSetAppValue(CFSTR("deviceFilter"), v32, CFSTR("com.apple.airplay"));

    v31 = 1;
  }
  else
  {
    v31 = 0;
  }
  v33 = (unint64_t)CFPreferencesCopyAppValue(CFSTR("deviceNameFilter"), CFSTR("com.apple.airplay"));
  if (v33 | v20
    && (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "allObjects")),
        v35 = objc_msgSend((id)v33, "isEqualToArray:", v34),
        v34,
        (v35 & 1) == 0))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "allObjects"));
    CFPreferencesSetAppValue(CFSTR("deviceNameFilter"), v36, CFSTR("com.apple.airplay"));

  }
  else if (!v31)
  {
    goto LABEL_47;
  }
  v37 = CFPreferencesAppSynchronize(CFSTR("com.apple.airplay"));
  MCSendAirPlayPreferencesChangedNotification(v37);
LABEL_47:

}

@end
