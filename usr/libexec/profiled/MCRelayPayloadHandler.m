@implementation MCRelayPayloadHandler

- (MCRelayPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6;
  MCRelayPayloadHandler *v7;
  uint64_t v8;
  MCProfile *profile;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCRelayPayloadHandler;
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

  v3 = MCRelayErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("ERROR_RELAY_INTERNAL_ERROR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 61000, v6, v4, MCErrorTypeFatal, 0));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *j;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *k;
  uint64_t v81;
  void *v82;
  void *v84;
  void *v85;
  id *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id obj;
  id v95;
  void *v96;
  MCRelayPayloadHandler *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  uint8_t buf[16];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];

  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
  v93 = objc_alloc_init((Class)NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relayUUID"));
  if (v12)
  {

    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  v14 = objc_msgSend(v13, "isUserEnrollment");

  if (!v14)
  {
LABEL_6:
    v18 = MCNEProfileIngestionHandlerClassForPayload(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!v19)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCRelayPayloadHandler.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("neProfileIngestionHandler"));

    }
    if ((objc_msgSend(v19, "lockConfigurations") & 1) == 0)
    {
      if (a6)
      {
        v53 = objc_msgSend((id)objc_opt_class(self), "internalError");
        v54 = (id)objc_claimAutoreleasedReturnValue(v53);
        v55 = a6;
        LOBYTE(a6) = 0;
        *v55 = v54;
      }
      goto LABEL_78;
    }
    objc_msgSend(v19, "loadConfigurationsForceReloadFromDisk");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configurationDictionary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v20));

    if (!v21)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCRelayPayloadHandler.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payloadBase"));

      v21 = 0;
    }
    objc_msgSend(v19, "createConfigurationFromPayload:payloadType:", v21, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ingestedConfiguration"));
    v23 = v22;
    if (!v22)
    {
      if (a6)
      {
        v56 = objc_msgSend((id)objc_opt_class(self), "internalError");
        *a6 = (id)objc_claimAutoreleasedReturnValue(v56);
      }
      objc_msgSend(v19, "unlockConfigurations");
      LOBYTE(a6) = 0;
      goto LABEL_77;
    }
    v90 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getPendingCertificateInfo:", v21));
    v91 = v23;
    v96 = v24;
    v97 = self;
    if (v24)
    {
      v25 = v24;
      v86 = a6;
      v87 = v9;
      v88 = v19;
      v89 = v11;
      v92 = v10;
      v95 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v24, "count"));
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allKeys"));
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v109 != v28)
              objc_enumerationMutation(obj);
            v30 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v30));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadUUID")));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AccessGroup")));
            if (v33)
            {
              v34 = -[MCRelayPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:](self, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:", v32, v33);
              if (!v34)
                goto LABEL_24;
              v35 = v34;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "UUID"));
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](v97, "_retainDependencyBetweenPersistentID:andUUID:", v35, v36);

              self = v97;
              objc_msgSend(v93, "addObject:", v35);
LABEL_23:
              objc_msgSend(v95, "setObject:forKey:", v35, v30);

              goto LABEL_24;
            }
            if (v32)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "persistentIDForCertificateUUID:", v32));

              self = v97;
              if (v35)
                goto LABEL_23;
            }
LABEL_24:

            v25 = v96;
          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
        }
        while (v27);
      }

      v38 = objc_msgSend(v25, "count");
      v23 = v91;
      if (v38 != objc_msgSend(v95, "count") || (objc_msgSend(v91, "setCertificates:", v95) & 1) == 0)
      {
        v9 = v87;
        v19 = v88;
        v10 = v92;
        v11 = v89;
        if (v86)
        {
          v57 = MCRelayErrorDomain;
          v58 = MCErrorArray(CFSTR("ERROR_RELAY_INVALID_CERTIFICATE"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          *v86 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v57, 61001, v59, MCErrorTypeFatal, 0));

        }
        objc_msgSend(v88, "unlockConfigurations");
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v52 = v93;
        v60 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v61; j = (char *)j + 1)
            {
              if (*(_QWORD *)v105 != v62)
                objc_enumerationMutation(v52);
              v64 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)j);
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "UUID"));
              -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v64, v65);

            }
            v61 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
          }
          while (v61);
          LOBYTE(a6) = 0;
LABEL_73:
          v19 = v88;
          v11 = v89;
          goto LABEL_74;
        }
LABEL_62:
        LOBYTE(a6) = 0;
LABEL_74:
        v21 = v90;
        goto LABEL_75;
      }

      v9 = v87;
      v19 = v88;
      v10 = v92;
      v11 = v89;
      a6 = v86;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "organization"));
    objc_msgSend(v23, "setPayloadInfoCommon:payloadOrganization:", v39, v40);

    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relayUUID"));
    if (!v41
      || (v42 = (void *)v41,
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relayUUID")),
          v44 = objc_msgSend(v23, "setPerAppUUID:andSafariDomains:", v43, 0),
          v43,
          v42,
          (v44 & 1) != 0))
    {
      if ((objc_msgSend(v23, "setRestrictDomains:", objc_msgSend(v10, "restrictDomains")) & 1) == 0)
      {
        v66 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Could not set relay domain restrictions", buf, 2u);
        }
        v67 = MCRelayErrorDomain;
        v95 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "displayName"));
        v68 = MCErrorArray(CFSTR("ERROR_RELAY_COULD_NOT_INSTALL_RESTRICTIONS_DOMAIN"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v67, 61002, v69, MCErrorTypeFatal, v52, 0));
        LOBYTE(a6) = v70 != 0;

        goto LABEL_74;
      }
      v45 = objc_alloc_init((Class)NSMutableDictionary);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

      if (v46)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v47, kMCPayloadUUIDKey);

      }
      v95 = v45;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v49, kMCPayloadIdentifierKey);

      }
      v50 = a6;
      if (v9)
        objc_msgSend(v95, "addEntriesFromDictionary:", v9);
      objc_msgSend(v23, "setProfileInfo:", v95);
      objc_msgSend(v19, "updateDefaultAfterAddingConfiguration");
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getConfigurationIdentifier"));
      objc_msgSend(v10, "setPersistentResourceID:", v51);

      v102 = 0;
      LOBYTE(a6) = objc_msgSend(v19, "saveIngestedConfiguration:", &v102);
      v52 = v102;
      v21 = v90;
      if ((a6 & 1) != 0)
      {
        objc_msgSend(v19, "unlockConfigurations");
LABEL_75:

        v23 = v91;
LABEL_76:

LABEL_77:
LABEL_78:

        goto LABEL_79;
      }
      v89 = v11;
      if (v50)
      {
        v75 = objc_msgSend((id)objc_opt_class(self), "internalErrorWithUnderlyingError:", v52);
        *v50 = (id)objc_claimAutoreleasedReturnValue(v75);
      }
      v88 = v19;
      objc_msgSend(v19, "unlockConfigurations");
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v76 = v93;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v78; k = (char *)k + 1)
          {
            if (*(_QWORD *)v99 != v79)
              objc_enumerationMutation(v76);
            v81 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)k);
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](v97, "_releaseDependencyBetweenPersistentID:andUUID:", v81, v82);

          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
        }
        while (v78);
      }

      goto LABEL_73;
    }
    v71 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Could not configure relay UUID", buf, 2u);
    }
    if (!a6)
    {
      v21 = v90;
      goto LABEL_76;
    }
    v72 = MCRelayErrorDomain;
    v95 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "displayName"));
    v73 = MCErrorArray(CFSTR("ERROR_RELAY_COULD_NOT_INSTALL"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v72, 61002, v74, MCErrorTypeFatal, v52, 0));

    goto LABEL_62;
  }
  if (a6)
  {
    v15 = MCRelayErrorDomain;
    v16 = MCErrorArray(CFSTR("ERROR_RELAY_NO_UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 61003, v17, MCErrorTypeFatal, 0));

    LOBYTE(a6) = 0;
  }
LABEL_79:

  return (char)a6;
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
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Relay remove failed: empty configuration id", buf, 2u);
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
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Relay: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
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
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Relay identity, storing with accessibility %@", buf, 0xCu);
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
