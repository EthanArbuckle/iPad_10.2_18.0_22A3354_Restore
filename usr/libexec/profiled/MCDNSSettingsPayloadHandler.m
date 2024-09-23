@implementation MCDNSSettingsPayloadHandler

- (MCDNSSettingsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6;
  MCDNSSettingsPayloadHandler *v7;
  uint64_t v8;
  MCProfile *profile;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNSSettingsPayloadHandler;
  v7 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v11, "initWithPayload:profileHandler:", a3, v6);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
    profile = v7->_profile;
    v7->_profile = (MCProfile *)v8;

  }
  return v7;
}

+ (id)internalError
{
  return objc_msgSend(a1, "internalErrorWithUnderlyingError:", 0);
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = MCDNSSettingsErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("ERROR_DNS_SETTINGS_INTERNAL_ERROR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 57000, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *j;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *k;
  uint64_t v59;
  void *v60;
  void *v62;
  void *v63;
  id v64;
  id *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id obj;
  id v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];

  v9 = a4;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "type"));
  v71 = objc_alloc_init((Class)NSMutableArray);
  v11 = MCNEProfileIngestionHandlerClassForPayload(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCDNSSettingsPayloadHandler.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("neProfileIngestionHandler"));

  }
  if ((objc_msgSend(v12, "lockConfigurations") & 1) != 0)
  {
    objc_msgSend(v12, "loadConfigurationsForceReloadFromDisk");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "configurationDictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v13));

    if (!v14)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCDNSSettingsPayloadHandler.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payloadBase"));

    }
    objc_msgSend(v12, "createConfigurationFromPayload:payloadType:", v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ingestedConfiguration"));
    v16 = v15;
    if (!v15)
    {
      if (a6)
      {
        v43 = objc_msgSend((id)objc_opt_class(self), "internalError");
        *a6 = (id)objc_claimAutoreleasedReturnValue(v43);
      }
      objc_msgSend(v12, "unlockConfigurations");
      v40 = 0;
      goto LABEL_61;
    }
    v65 = a6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getPendingCertificateInfo:", v14));
    v74 = v17;
    if (v17)
    {
      v18 = v17;
      v69 = v12;
      v70 = v16;
      v66 = v10;
      v68 = v14;
      v64 = v9;
      v73 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v17, "count"));
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v86 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v23));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("PayloadUUID")));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AccessGroup")));
            if (v26)
            {
              v27 = -[MCDNSSettingsPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:](self, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:", v25, v26);
              if (!v27)
                goto LABEL_19;
              v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "UUID"));
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v28, v29);

              v18 = v74;
              objc_msgSend(v71, "addObject:", v28);
LABEL_18:
              objc_msgSend(v73, "setObject:forKey:", v28, v23);

              goto LABEL_19;
            }
            if (v25)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "persistentIDForCertificateUUID:", v25));

              v18 = v74;
              if (v28)
                goto LABEL_18;
            }
LABEL_19:

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
        }
        while (v20);
      }

      v31 = objc_msgSend(v18, "count");
      v16 = v70;
      if (v31 != objc_msgSend(v73, "count") || (objc_msgSend(v70, "setCertificates:", v73) & 1) == 0)
      {
        v10 = v66;
        v14 = v68;
        v12 = v69;
        if (v65)
        {
          v44 = MCDNSSettingsErrorDomain;
          v45 = MCErrorArray(CFSTR("ERROR_DNS_SETTINGS_INVALID_CERTIFICATE"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          *v65 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v44, 57001, v46, MCErrorTypeFatal, 0));

          v16 = v70;
        }
        objc_msgSend(v69, "unlockConfigurations");
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v41 = v71;
        v47 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        v9 = v64;
        if (!v47)
        {
          v40 = 0;
          goto LABEL_60;
        }
        v48 = v47;
        v49 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v48; j = (char *)j + 1)
          {
            if (*(_QWORD *)v82 != v49)
              objc_enumerationMutation(v41);
            v51 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j);
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "UUID"));
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v51, v52);

          }
          v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        }
        while (v48);
        v40 = 0;
        goto LABEL_58;
      }

      v9 = v64;
      v10 = v66;
      v14 = v68;
      v12 = v69;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "UUID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "organization"));
    objc_msgSend(v16, "setPayloadInfoCommon:payloadOrganization:", v32, v33);

    v34 = objc_alloc_init((Class)NSMutableDictionary);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, kMCPayloadUUIDKey);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, kMCPayloadIdentifierKey);

    }
    if (v9)
      objc_msgSend(v34, "addEntriesFromDictionary:", v9);
    v73 = v34;
    objc_msgSend(v16, "setProfileInfo:", v34);
    objc_msgSend(v12, "updateDefaultAfterAddingConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getConfigurationIdentifier"));
    objc_msgSend(v75, "setPersistentResourceID:", v39);

    v80 = 0;
    v40 = objc_msgSend(v12, "saveIngestedConfiguration:", &v80);
    v41 = v80;
    if ((v40 & 1) != 0)
    {
      objc_msgSend(v12, "unlockConfigurations");
LABEL_60:

LABEL_61:
      goto LABEL_62;
    }
    v70 = v16;
    v67 = v10;
    v68 = v14;
    if (v65)
    {
      v53 = objc_msgSend((id)objc_opt_class(self), "internalErrorWithUnderlyingError:", v41);
      *v65 = (id)objc_claimAutoreleasedReturnValue(v53);
    }
    v69 = v12;
    objc_msgSend(v12, "unlockConfigurations");
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v54 = v71;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v56; k = (char *)k + 1)
        {
          if (*(_QWORD *)v77 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)k);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "UUID"));
          -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v59, v60);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v56);
    }

    v10 = v67;
LABEL_58:
    v14 = v68;
    v12 = v69;
    v16 = v70;
    goto LABEL_60;
  }
  if (a6)
  {
    v42 = objc_msgSend((id)objc_opt_class(self), "internalError");
    v40 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v42);
  }
  else
  {
    v40 = 0;
  }
LABEL_62:

  return v40;
}

- (void)setAside
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = MCNEProfileIngestionHandlerClassForPayload(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "lockConfigurations"))
  {
    objc_msgSend(v6, "loadConfigurationsForceReloadFromDisk");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentResourceID"));
    v9 = objc_msgSend(v6, "setAsideConfigurationName:unsetAside:", v8, 0);

    objc_msgSend(v6, "unlockConfigurations");
  }
  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v11, 2u);
    }
  }

}

- (void)unsetAside
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = MCNEProfileIngestionHandlerClassForPayload(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "lockConfigurations"))
  {
    objc_msgSend(v6, "loadConfigurationsForceReloadFromDisk");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentResourceID"));
    v9 = objc_msgSend(v6, "setAsideConfigurationName:unsetAside:", v8, 0);

    objc_msgSend(v6, "unlockConfigurations");
  }
  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v11, 2u);
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
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v7 = MCNEProfileIngestionHandlerClassForPayload(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "lockConfigurations"))
  {
    objc_msgSend(v8, "loadConfigurationsForceReloadFromDisk");
    if (v4)
    {
      objc_msgSend(v8, "removeConfigurationWithIdentifier:", v4);
    }
    else
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NetworkUsageRules remove failed: empty configuration id", buf, 2u);
      }
    }
    objc_msgSend(v8, "updateDefaultAfterDeletingConfiguration");
    objc_msgSend(v8, "unlockConfigurations");
  }
  else
  {
    v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", v11, 2u);
    }
  }

}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadHandlerWithUUID:", v6));

  if (v9)
  {
    v23 = 0;
    v10 = objc_msgSend(v9, "copyIdentityImmediatelyWithInteractionClient:outError:", 0, &v23);
    v11 = v23;
    if (!v11 && v10)
      goto LABEL_7;
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      v26 = 2114;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "DNSSettings: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v10)
    {
LABEL_7:
      v13 = objc_msgSend(v9, "accessibility", v7);
      v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "DNS Settings identity, storing with accessibility %@", buf, 0xCu);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("NE:"), "stringByAppendingString:", v6));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "profile"));
      v7 = v22;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v15, v22, objc_msgSend(v17, "isInstalledForSystem"), v13));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v18, v20);

        v7 = v22;
      }
      CFRelease(v10);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
