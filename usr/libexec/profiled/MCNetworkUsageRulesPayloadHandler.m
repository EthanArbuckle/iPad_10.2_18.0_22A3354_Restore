@implementation MCNetworkUsageRulesPayloadHandler

+ (id)internalErrorWithCode:(int)a3
{
  return objc_msgSend(a1, "internalErrorWithCode:underlyingError:", *(_QWORD *)&a3, 0);
}

+ (id)internalErrorWithCode:(int)a3 underlyingError:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = MCNetworkUsageRulesErrorDomain;
  v5 = a3;
  v6 = a4;
  v7 = MCErrorArray(CFSTR("ERROR_NETWORK_USAGE_INTERNAL_ERROR"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, v5, v8, v6, MCErrorTypeFatal, 0));

  return v9;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id v21;
  id *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationRules"));

  if (!v9
    || (v29 = 0,
        v10 = -[MCNetworkUsageRulesPayloadHandler _installApplicationRulesFromPayload:outError:](self, "_installApplicationRulesFromPayload:outError:", v8, &v29), v9 = v29, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SIMRules"));

    if (v11)
    {
      v23 = a6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:](MCProfileHandler, "payloadsOfClass:installedBeforePayload:", objc_opt_class(MCNetworkUsageRulesPayload), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "SIMRules"));

            if (v20)
              objc_msgSend(v12, "addObject:", v19);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v16);
      }

      objc_msgSend(v12, "addObject:", v8);
      v24 = v9;
      objc_msgSend((id)objc_opt_class(self), "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:", v12, qword_1000FD828, &v24);
      v21 = v24;

      v9 = v21;
      a6 = v23;
    }
  }
  if (a6 && v9)
    *a6 = objc_retainAutorelease(v9);

  return v9 == 0;
}

- (void)setAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationRules"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](MCNetworkUsageRulesPayload, "typeStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = MCNEProfileIngestionHandlerClassForPayload(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (objc_msgSend(v8, "lockConfigurations"))
    {
      objc_msgSend(v8, "loadConfigurationsForceReloadFromDisk");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
      v10 = objc_msgSend(v8, "setAsideConfigurationName:unsetAside:", v9, 0);

      objc_msgSend(v8, "unlockConfigurations");
    }
    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
      }
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SIMRules"));

  if (v12)
  {
    v13 = (void *)qword_1000FD828;
    if (!qword_1000FD828)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v15 = (void *)qword_1000FD828;
      qword_1000FD828 = v14;

      v13 = (void *)qword_1000FD828;
    }
    objc_msgSend(v13, "addObject:", v3);
    v21 = 0;
    v16 = objc_msgSend((id)objc_opt_class(self), "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:", 0, qword_1000FD828, &v21);
    v17 = v21;
    if ((v16 & 1) == 0)
    {
      v18 = _MCLogObjects[0];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
        v20 = v19;
        if (!v19)
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
        *(_DWORD *)buf = 138543618;
        v23 = v20;
        v24 = 2114;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@", buf, 0x16u);
        if (!v19)

      }
    }

  }
}

- (void)unsetAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationRules"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](MCNetworkUsageRulesPayload, "typeStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = MCNEProfileIngestionHandlerClassForPayload(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (objc_msgSend(v8, "lockConfigurations"))
    {
      objc_msgSend(v8, "loadConfigurationsForceReloadFromDisk");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
      v10 = objc_msgSend(v8, "setAsideConfigurationName:unsetAside:", v9, 1);

      objc_msgSend(v8, "unlockConfigurations");
    }
    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
      }
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SIMRules"));

  if (v12)
  {
    objc_msgSend((id)qword_1000FD828, "removeObject:", v3);
    v18 = 0;
    v13 = objc_msgSend((id)objc_opt_class(self), "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:", 0, qword_1000FD828, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
        v17 = v16;
        if (!v16)
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2114;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration including payload %{public}@: %{public}@", buf, 0x16u);
        if (!v16)

      }
    }

  }
}

- (void)remove
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationRules"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](MCNetworkUsageRulesPayload, "typeStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = MCNEProfileIngestionHandlerClassForPayload(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (objc_msgSend(v8, "lockConfigurations"))
    {
      objc_msgSend(v8, "loadConfigurationsForceReloadFromDisk");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
        objc_msgSend(v8, "removeConfigurationWithIdentifier:", v10);

      }
      else
      {
        v12 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NetworkUsageRules remove failed: empty configuration id", buf, 2u);
        }
      }
      objc_msgSend(v8, "updateDefaultAfterDeletingConfiguration");
      objc_msgSend(v8, "unlockConfigurations");
    }
    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
      }
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SIMRules"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v15 = objc_msgSend(v14, "isSetAside");

    if (v15)
    {
      objc_msgSend((id)qword_1000FD828, "removeObject:", v3);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:](MCProfileHandler, "payloadsOfClass:removedBeforePayload:", objc_opt_class(MCNetworkUsageRulesPayload), v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "SIMRules"));

            if (v24)
              objc_msgSend(v16, "addObject:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v20);
      }

      objc_msgSend(v16, "addObject:", v3);
      v30 = 0;
      v25 = objc_msgSend((id)objc_opt_class(self), "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:", 0, v16, &v30);
      v26 = v30;
      if ((v25 & 1) == 0)
      {
        v27 = _MCLogObjects[0];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
          v29 = v28;
          if (!v28)
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
          *(_DWORD *)buf = 138543618;
          v36 = v29;
          v37 = 2114;
          v38 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@", buf, 0x16u);
          if (!v28)

        }
      }

    }
  }

}

- (BOOL)_installApplicationRulesFromPayload:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  id v31;
  uint8_t buf[8];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](MCNetworkUsageRulesPayload, "typeStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = MCNEProfileIngestionHandlerClassForPayload(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ((objc_msgSend(v10, "lockConfigurations") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    if (!v11)
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    objc_msgSend(v10, "loadConfigurationsForceReloadFromDisk");
    v35[0] = CFSTR("ApplicationRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationRules"));
    v35[1] = CFSTR("PayloadDisplayName");
    v36[0] = v12;
    v36[1] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](MCNetworkUsageRulesPayload, "typeStrings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    objc_msgSend(v10, "createConfigurationFromPayload:payloadType:", v14, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ingestedConfiguration"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organization"));
      objc_msgSend(v17, "setPayloadInfoCommon:payloadOrganization:", v18, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profile"));

      v33[0] = kMCPayloadUUIDKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUID"));
      v34[0] = v22;
      v33[1] = kMCPayloadIdentifierKey;
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
      v34[1] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));

      objc_msgSend(v17, "setProfileInfo:", v24);
      objc_msgSend(v10, "updateDefaultAfterAddingConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getConfigurationIdentifier"));
      objc_msgSend(v6, "setPersistentResourceID:", v25);

      v31 = 0;
      LOBYTE(v23) = objc_msgSend(v10, "saveIngestedConfiguration:", &v31);
      v26 = v31;
      if ((v23 & 1) == 0)
      {
        v27 = objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:underlyingError:](MCNetworkUsageRulesPayloadHandler, "internalErrorWithCode:underlyingError:", 41002, v26));

        v26 = (id)v27;
      }

    }
    else
    {
      v26 = (id)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:](MCNetworkUsageRulesPayloadHandler, "internalErrorWithCode:", 41001));
    }
    objc_msgSend(v10, "unlockConfigurations");
    v29 = v26 == 0;
    if (a4 && v26)
      *a4 = objc_retainAutorelease(v26);

  }
  else
  {
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
    }
    v29 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:](MCNetworkUsageRulesPayloadHandler, "internalErrorWithCode:", 41000));
  }

  return v29;
}

+ (BOOL)_rebuildWiFiAssistConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v11 = objc_msgSend(v10, "allInstalledPayloadsOfClass:", objc_opt_class(MCNetworkUsageRulesPayload));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "SIMRules"));

        if (v18)
          objc_msgSend(v9, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v26 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_WiFiAssistConfigurationForPayloads:includingPayloads:excludingPayloads:error:", v9, v7, v8, &v26));
  v20 = v26;
  if (v20)
  {
    v21 = v20;
    v22 = 0;
  }
  else
  {
    v25 = 0;
    v22 = objc_msgSend(a1, "_writeWiFiAssistConfiguration:withError:", v19, &v25);
    v21 = v25;
  }
  if (a5 && v21)
    *a5 = objc_retainAutorelease(v21);

  return v22;
}

+ (id)_WiFiAssistConfigurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v55;
  void *v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  id v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_100025A4C;
    v90[3] = &unk_1000E3878;
    v91 = v9;
    v92 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexesOfObjectsPassingTest:", v90));
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);

  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  v67 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v13 = v8;
  v55 = v10;
  v56 = v13;
  v69 = v12;
  v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
  if (!v52)
    goto LABEL_39;
  v14 = *(_QWORD *)v87;
  v60 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
  v59 = MCNetworkUsageRulesErrorDomain;
  v58 = MCErrorTypeFatal;
  v51 = *(_QWORD *)v87;
LABEL_8:
  v15 = 0;
  v16 = v67;
  while (1)
  {
    if (*(_QWORD *)v87 != v14)
      objc_enumerationMutation(v13);
    v53 = v15;
    v17 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v15);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "SIMRules"));
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
    if (v63)
      break;
LABEL_37:

    v15 = v53 + 1;
    v13 = v56;
    v14 = v51;
    if ((id)(v53 + 1) == v52)
    {
      v52 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      if (!v52)
      {
LABEL_39:

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v62 = v13;
        v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
        if (v66)
        {
          v64 = *(_QWORD *)v75;
          v34 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
          v35 = kMCNetworkUsageRulesPayloadSIMRulesWiFiAssistPolicyKey;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v75 != v64)
                objc_enumerationMutation(v62);
              v68 = v36;
              v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v36);
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "SIMRules"));
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v71;
                do
                {
                  for (i = 0; i != v40; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v71 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v34));
                    objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, CFSTR("ICCIDs"));

                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v35));
                    objc_msgSend(v44, "setObject:forKeyedSubscript:", v46, CFSTR("Wi-Fi Assist Policy"));

                    objc_msgSend(v33, "addObject:", v44);
                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
                }
                while (v40);
              }

              v36 = v68 + 1;
            }
            while ((id)(v68 + 1) != v66);
            v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
          }
          while (v66);
        }

        v93[0] = CFSTR("Version");
        v93[1] = CFSTR("Profiles");
        v94[0] = &off_1000ED0E8;
        v94[1] = v33;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 2));

        v32 = 0;
        v16 = v67;
        v48 = v55;
        v49 = v56;
        goto LABEL_58;
      }
      goto LABEL_8;
    }
  }
  v61 = *(id *)v83;
LABEL_13:
  v18 = 0;
  while (1)
  {
    if (*(id *)v83 != v61)
      objc_enumerationMutation(obj);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v18), "objectForKeyedSubscript:", v60));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v101, 16);
    if (v21)
      break;
LABEL_33:

LABEL_35:
    if ((id)++v18 == v63)
    {
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
      if (!v63)
        goto LABEL_37;
      goto LABEL_13;
    }
  }
  v22 = v21;
  v23 = *(_QWORD *)v79;
LABEL_18:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v79 != v23)
      objc_enumerationMutation(v20);
    v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uppercaseString"));
    if ((objc_msgSend(v12, "containsObject:", v26) & 1) != 0)
      break;
    objc_msgSend(v12, "addObject:", v26);
LABEL_31:

    if (v22 == (id)++v24)
    {
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v101, 16);
      if (v22)
        goto LABEL_18;
      goto LABEL_33;
    }
  }
  if ((objc_msgSend(v16, "containsObject:", v17) & 1) == 0)
  {
    v27 = _MCLogObjects[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "displayName"));
      v29 = v28;
      if (!v28)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
        v29 = v65;
      }
      *(_DWORD *)buf = 138543618;
      v98 = v29;
      v99 = 2114;
      v100 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting ICCIDs while rebuilding configuration for Network Usage Rules payload %{public}@: %{public}@", buf, 0x16u);
      if (!v28)

      v16 = v67;
    }

    v12 = v69;
    goto LABEL_31;
  }
  v30 = MCErrorArray(CFSTR("ERROR_NETWORK_USAGE_ICCID_CONFLICT_P_ICCID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v16 = v67;
  v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v59, 41003, v31, 0, v58, v25, 0));

  v12 = v69;
  if (!v32)
    goto LABEL_35;

  v49 = v56;
  if (a6)
  {
    v32 = objc_retainAutorelease(v32);
    v47 = 0;
    *a6 = v32;
  }
  else
  {
    v47 = 0;
  }
  v48 = v55;
LABEL_58:

  return v47;
}

+ (BOOL)_writeWiFiAssistConfiguration:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;

  v5 = a3;
  v6 = MCSystemGroupContainerPathWithGroupIdentifier(CFSTR("systemgroup.com.apple.WiFiAssist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("/%@"), CFSTR("Library/Preferences")));
  v33 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, &v33);

  if (v11)
    v12 = v33 == 0;
  else
    v12 = 0;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v32 = 0;
    v15 = objc_msgSend(v14, "removeItemAtPath:error:", v9, &v32);
    v13 = v32;

    if (v15)
    {

      v13 = 0;
LABEL_11:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v31 = v13;
      objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v31);
      v17 = v31;

      v13 = v17;
      goto LABEL_12;
    }
  }
  else
  {
    v13 = 0;
  }
  if ((v11 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  if (!v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/%@"), CFSTR("com.apple.WiFiAssist.configuration.plist")));
    v30 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v30));
    v20 = v30;
    v13 = v20;
    if (v19)
    {
      v29 = v20;
      objc_msgSend(v19, "writeToFile:options:error:", v18, 1, &v29);
      v21 = v29;

      v13 = v21;
    }

  }
LABEL_17:
  if (v8)
    v22 = v13 == 0;
  else
    v22 = 0;
  v23 = v22;
  if (a4 && !v23)
  {
    v24 = MCNetworkUsageRulesErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR_NETWORK_USAGE_CANNOT_WRITE_WIFI_ASSIST_CONFIGURATION"), "MCAppendGreenteaSuffix"));
    v26 = MCErrorArray(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v24, 41004, v27, v13, MCErrorTypeFatal, 0));

  }
  return v23;
}

@end
