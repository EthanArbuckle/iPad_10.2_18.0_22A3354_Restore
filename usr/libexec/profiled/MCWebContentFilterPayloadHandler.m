@implementation MCWebContentFilterPayloadHandler

- (void)_installDependency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v8, "addDependent:ofParent:inDomain:", v4, v7, kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey);

}

- (void)_removeDependency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v8, "removeDependent:fromParent:inDomain:", v4, v7, kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey);

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

  v3 = MCWebContentFilterErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("ERROR_CONTENT_FILTER_INTERNAL_ERROR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 40000, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v6;
  void *v7;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *j;
  uint64_t v71;
  void *v72;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v84;
  id v85;
  id v86;
  id v87;
  id obj;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  MCWebContentFilterPayloadHandler *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  _QWORD v100[5];
  id v101;
  id v102;
  id v103;
  uint8_t *v104;
  uint8_t buf[8];
  uint8_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];

  v84 = a3;
  v86 = a4;
  v85 = a5;
  v94 = self;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v87 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "contentFilterUUID"));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
    v13 = objc_msgSend(v12, "isSupervised");

    if ((v13 & 1) == 0)
    {
      if (a6)
      {
        v31 = MCErrorArray(CFSTR("ERROR_CONTENT_FILTER_UNSUPERVISED"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40003, v32, MCErrorTypeFatal, 0));

      }
      goto LABEL_72;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "filterType"));
  v15 = objc_msgSend(v14, "isEqualToString:", kMCWebContentFilterTypePlugin);

  if (!v15)
  {
    -[MCWebContentFilterPayloadHandler _installDependency](self, "_installDependency");
LABEL_12:
    v29 = 1;
    goto LABEL_73;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](MCWebContentFilterPayload, "typeStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
  v18 = MCNEProfileIngestionHandlerClassForPayload(v17);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v19 = v82;
  if ((objc_msgSend(v82, "lockConfigurations") & 1) == 0)
  {
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
    }
    if (a6)
    {
      v19 = v82;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayloadHandler internalError](MCWebContentFilterPayloadHandler, "internalError"));
    }

    goto LABEL_72;
  }
  objc_msgSend(v82, "loadConfigurationsForceReloadFromDisk");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "pluginConfiguration"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](MCWebContentFilterPayload, "typeStrings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  objc_msgSend(v82, "createConfigurationFromPayload:payloadType:", v80, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "ingestedConfiguration"));
  v81 = v23;
  if (!v23)
  {
    v33 = (id)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayloadHandler internalError](MCWebContentFilterPayloadHandler, "internalError"));
    goto LABEL_61;
  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getPendingCertificateInfo:", v80));
  if (v91)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
    v25 = objc_msgSend(v24, "BOOLValue");

    if (v25)
    {
      v26 = kMDMPersonaKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", kMDMPersonaKey));
      v28 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", v26));
      else
        v92 = 0;

    }
    else
    {
      v92 = 0;
    }
    v89 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v91, "count"));
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "allKeys"));
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
    if (v34)
    {
      v90 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v112 != v90)
            objc_enumerationMutation(obj);
          v36 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)buf = 0;
          v106 = buf;
          v107 = 0x3032000000;
          v108 = sub_1000968D8;
          v109 = sub_1000968E8;
          v110 = 0;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", v36));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PayloadUUID")));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AccessGroup")));
          if (v39)
          {
            if (objc_msgSend(v92, "length"))
            {
              v100[0] = _NSConcreteStackBlock;
              v100[1] = 3221225472;
              v100[2] = sub_1000968F0;
              v100[3] = &unk_1000E44F0;
              v104 = buf;
              v100[4] = v94;
              v101 = v38;
              v102 = v39;
              v103 = v92;
              v40 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v103, v100);

            }
            else
            {
              v42 = -[MCWebContentFilterPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:](v94, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:", v38, v39, 0);
              v43 = (void *)*((_QWORD *)v106 + 5);
              *((_QWORD *)v106 + 5) = v42;

            }
            v44 = *((_QWORD *)v106 + 5);
            if (v44)
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "UUID"));
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](v94, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", v44, v45, 1, 0, v92);

              objc_msgSend(v87, "addObject:", *((_QWORD *)v106 + 5));
            }
          }
          else
          {
            if (v38)
            {
              v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v94, "profileHandler"));
              v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIDForCertificateUUID:", v38));
              v41 = v6;
            }
            else
            {
              v41 = 0;
            }
            objc_storeStrong((id *)v106 + 5, v41);
            if (v38)
            {

            }
          }
          v46 = *((_QWORD *)v106 + 5);
          if (v46)
            objc_msgSend(v89, "setObject:forKey:", v46, v36);

          _Block_object_dispose(buf, 8);
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
      }
      while (v34);
    }

    v47 = objc_msgSend(v91, "count");
    if (v47 != objc_msgSend(v89, "count") || !objc_msgSend(v81, "setCertificates:", v89))
    {
      v65 = MCErrorArray(CFSTR("ERROR_CONTENT_FILTER_INVALID_CERTIFICATE"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v33 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40001, v66, MCErrorTypeFatal, 0));

      goto LABEL_61;
    }

  }
  objc_msgSend(v81, "setPayloadInfoIdentity:", v80);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "UUID"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "organization"));
  objc_msgSend(v81, "setPayloadInfoCommon:payloadOrganization:", v48, v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "contentFilterUUID"));
  if (!v50
    || (v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "contentFilterUUID")),
        v52 = objc_msgSend(v81, "setPerAppUUID:andSafariDomains:", v51, 0),
        v51,
        v50,
        (v52 & 1) != 0))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v94, "profileHandler"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "profile"));

    if (v54)
    {
      v55 = objc_alloc_init((Class)NSMutableDictionary);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUID"));
      v57 = v56 == 0;

      if (!v57)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUID"));
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v58, kMCPayloadUUIDKey);

      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
      v60 = v59 == 0;

      if (!v60)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v61, kMCPayloadIdentifierKey);

      }
      if (v86)
        objc_msgSend(v55, "addEntriesFromDictionary:", v86);
      objc_msgSend(v81, "setProfileInfo:", v55);

    }
    objc_msgSend(v82, "updateDefaultAfterAddingConfiguration");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "getConfigurationIdentifier"));
    objc_msgSend(v93, "setPersistentResourceID:", v62);

    v99 = 0;
    v63 = objc_msgSend(v82, "saveIngestedConfiguration:", &v99);
    v33 = v99;
    if ((v63 & 1) == 0)
    {
      v64 = objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayloadHandler internalErrorWithUnderlyingError:](MCWebContentFilterPayloadHandler, "internalErrorWithUnderlyingError:", v33));

      v33 = (id)v64;
    }

LABEL_61:
    objc_msgSend(v82, "unlockConfigurations");

    if (v33)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v33);
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v67 = v87;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v68; j = (char *)j + 1)
          {
            if (*(_QWORD *)v96 != v69)
              objc_enumerationMutation(v67);
            v71 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j);
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "UUID"));
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](v94, "_releaseDependencyBetweenPersistentID:andUUID:", v71, v72);

          }
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
        }
        while (v68);
      }

LABEL_72:
      v29 = 0;
      goto LABEL_73;
    }
    goto LABEL_12;
  }
  v74 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Could not configure content filter UUID", buf, 2u);
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v94, "payload"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "displayName"));
  v77 = MCErrorArray(CFSTR("ERROR_CONTENT_FILTER_COULD_NOT_INSTALL"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40002, v78, MCErrorTypeFatal, v76, 0));
  v29 = v79 != 0;

LABEL_73:
  return v29;
}

- (void)setAside
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterType"));
  v5 = objc_msgSend(v4, "isEqualToString:", kMCWebContentFilterTypePlugin);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (objc_msgSend(v9, "lockConfigurations"))
    {
      objc_msgSend(v9, "loadConfigurationsForceReloadFromDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
      v11 = objc_msgSend(v9, "setAsideConfigurationName:unsetAside:", v10, 0);

      objc_msgSend(v9, "unlockConfigurations");
    }
    else
    {
      v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v13, 2u);
      }
    }

  }
  else
  {
    -[MCWebContentFilterPayloadHandler _removeDependency](self, "_removeDependency");
  }

}

- (void)unsetAside
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterType"));
  v5 = objc_msgSend(v4, "isEqualToString:", kMCWebContentFilterTypePlugin);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (objc_msgSend(v9, "lockConfigurations"))
    {
      objc_msgSend(v9, "loadConfigurationsForceReloadFromDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
      v11 = objc_msgSend(v9, "setAsideConfigurationName:unsetAside:", v10, 1);

      objc_msgSend(v9, "unlockConfigurations");
    }
    else
    {
      v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v13, 2u);
      }
    }

  }
  else
  {
    -[MCWebContentFilterPayloadHandler _installDependency](self, "_installDependency");
  }

}

- (void)remove
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterType"));
  v5 = objc_msgSend(v4, "isEqualToString:", kMCWebContentFilterTypePlugin);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (objc_msgSend(v9, "lockConfigurations"))
    {
      objc_msgSend(v9, "loadConfigurationsForceReloadFromDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getCertificatesForConfigurationWithIdentifier:", v11));

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID", (_QWORD)v28));
              -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v18, v19);

              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          }
          while (v15);
        }

        v20 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
          *(_DWORD *)buf = 138543362;
          v33 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Calling removeConfigurationWithIdentifier for id: %{public}@", buf, 0xCu);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID", (_QWORD)v28));
        objc_msgSend(v9, "removeConfigurationWithIdentifier:", v23);

      }
      else
      {
        v27 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "MCWebContentFilterPayloadHandler remove failed: empty configuration id", buf, 2u);
        }
      }
      objc_msgSend(v9, "updateDefaultAfterDeletingConfiguration");
      objc_msgSend(v9, "unlockConfigurations");
    }
    else
    {
      v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
      }
    }

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v25 = objc_msgSend(v24, "isSetAside");

    if ((v25 & 1) == 0)
      -[MCWebContentFilterPayloadHandler _removeDependency](self, "_removeDependency");
  }

}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadHandlerWithUUID:", v8));

  if (v12)
  {
    v28 = 0;
    v13 = objc_msgSend(v12, "copyIdentityImmediatelyWithInteractionClient:outError:", 0, &v28);
    v14 = v28;
    if (!v14 && v13)
      goto LABEL_7;
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v8;
      v31 = 2114;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "ContentFilter: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v13)
    {
LABEL_7:
      v26 = v14;
      v27 = v10;
      v16 = v9;
      v17 = objc_msgSend(v12, "accessibility");
      v18 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Web content filter identity, storing with accessibility %@", buf, 0xCu);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("NE:"), "stringByAppendingString:", v8));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profile"));
      v9 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v13, v19, v16, objc_msgSend(v21, "isInstalledForSystem"), v17));

      v10 = v27;
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:personaID:](self, "_touchDependencyBetweenPersistentID:andUUID:personaID:", v22, v24, v27);

      }
      CFRelease(v13);
      v14 = v26;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
