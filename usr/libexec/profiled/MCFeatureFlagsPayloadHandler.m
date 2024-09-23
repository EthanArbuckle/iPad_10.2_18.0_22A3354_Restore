@implementation MCFeatureFlagsPayloadHandler

+ (id)_fullyInstalledPayloads
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v3 = objc_msgSend(v2, "allInstalledPayloadsOfClass:", objc_opt_class(MCFeatureFlagsPayload));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

+ (BOOL)_reapplyPayloads:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char v30;
  id *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];

  v5 = a3;
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin applying changes to feature flag settings.", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FFConfiguration configurationForProfileManagement](FFConfiguration, "configurationForProfileManagement"));
  v8 = v7;
  if (v7)
  {
    v32 = a4;
    objc_msgSend(v7, "prepareToAddProfilePayloads");
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v37;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "featureFlagsConfiguration"));
          v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
            *(_DWORD *)buf = 138543618;
            v41 = v20;
            v42 = 2112;
            v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Adding feature flag settings from payload %{public}@: %@.", buf, 0x16u);

          }
          v35 = v15;
          v21 = objc_msgSend(v8, "addProfilePayload:error:", v17, &v35);
          v12 = v35;

          if ((v21 & 1) == 0)
          {
            v22 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v23 = v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
              *(_DWORD *)buf = 138543618;
              v41 = v24;
              v42 = 2114;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to apply feature flag configuration payload %{public}@ with error: %{public}@", buf, 0x16u);

            }
            v25 = 0;
            goto LABEL_25;
          }

          v14 = (char *)v14 + 1;
          v15 = v12;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }

    v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Committing changes to feature flag settings.", buf, 2u);
    }
    v34 = v12;
    v25 = objc_msgSend(v8, "commitProfilePayloadsAndReturnError:", &v34);
    v28 = v34;

    v12 = v28;
LABEL_25:
    a4 = v32;
    v5 = v33;
  }
  else
  {
    v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Unable to communicate with feature flag manager", buf, 2u);
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCFeatureFlagsErrorDomain, 58002, 0, 0, MCErrorTypeFatal));
    v25 = 0;
  }
  v29 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "End applying changes to feature flag settings.", buf, 2u);
  }
  if (a4)
    v30 = v25;
  else
    v30 = 1;
  if ((v30 & 1) == 0)
    *a4 = objc_retainAutorelease(v12);

  return v25;
}

+ (BOOL)_reapplyConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  id v15;
  unsigned __int8 v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_fullyInstalledPayloads"));
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(v10, "addObjectsFromArray:", v9);
  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008CF38;
    v18[3] = &unk_1000E44C8;
    v19 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v18));
    objc_msgSend(v10, "filterUsingPredicate:", v12);

  }
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Applying %lu feature flag payloads", buf, 0xCu);

  }
  v16 = objc_msgSend(a1, "_reapplyPayloads:error:", v10, a5);

  return v16;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:](MCProfileHandler, "payloadsOfClass:installedBeforePayload:", objc_opt_class(MCFeatureFlagsPayload), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addObject:", v8);
  v21 = 0;
  v12 = objc_msgSend((id)objc_opt_class(self), "_reapplyConfigurationIncludingPayloads:excludingPayloads:error:", v11, 0, &v21);
  v13 = v21;
  if ((v12 & 1) == 0)
  {
    v14 = MCInstallationErrorDomain;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friendlyName"));
    v17 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v14, 4001, v18, v13, MCErrorTypeFatal, v16, 0));

    if (a6)
      *a6 = objc_retainAutorelease(v19);

  }
  return v12;
}

- (void)remove
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v5 = objc_msgSend(v4, "isSetAside");

  if ((v5 & 1) == 0)
  {
    v6 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:](MCProfileHandler, "payloadsOfClass:removedBeforePayload:", objc_opt_class(MCFeatureFlagsPayload), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "addObject:", v3);
    v18 = 0;
    v9 = objc_msgSend((id)objc_opt_class(self), "_reapplyConfigurationIncludingPayloads:excludingPayloads:error:", 0, v8, &v18);
    v10 = v18;
    v11 = _MCLogObjects[0];
    if (v9)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        v14 = "Removed Feature Flags with payload ID %{public}@";
        v15 = v12;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);

      }
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v10;
      v14 = "Failed to remove Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
      goto LABEL_7;
    }

  }
}

- (void)setAside
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = +[MCProfileHandler payloadsOfClass:setAsideBeforePayload:](MCProfileHandler, "payloadsOfClass:setAsideBeforePayload:", objc_opt_class(MCFeatureFlagsPayload), v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend((id)v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v3);
  v11 = 0;
  LOBYTE(v5) = objc_msgSend((id)objc_opt_class(self), "_reapplyConfigurationIncludingPayloads:excludingPayloads:error:", 0, v6, &v11);
  v7 = v11;
  if ((v5 & 1) == 0)
  {
    v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set aside Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);

    }
  }

}

- (void)unsetAside
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = +[MCProfileHandler payloadsOfClass:unsetAsideBeforePayload:](MCProfileHandler, "payloadsOfClass:unsetAsideBeforePayload:", objc_opt_class(MCFeatureFlagsPayload), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v3);
  v7 = objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "profile"));
  v9 = objc_msgSend(v8, "payloadsOfKindOfClass:", objc_opt_class(MCFeatureFlagsPayload));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObjectsInArray:", v6);
  v16 = 0;
  LOBYTE(v7) = objc_msgSend((id)objc_opt_class(self), "_reapplyConfigurationIncludingPayloads:excludingPayloads:error:", 0, v11, &v16);
  v12 = v16;
  if ((v7 & 1) == 0)
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to restore Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);

    }
  }

}

@end
