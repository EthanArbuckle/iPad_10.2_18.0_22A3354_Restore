@implementation MCDNSProxyPayloadHandler

- (MCDNSProxyPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6;
  MCDNSProxyPayloadHandler *v7;
  uint64_t v8;
  MCProfile *profile;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNSProxyPayloadHandler;
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

  v3 = MCDNSProxyErrorDomain;
  v4 = a3;
  v5 = MCErrorArray(CFSTR("ERROR_DNS_PROXY_INTERNAL_ERROR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 51000, v6, v4, MCErrorTypeFatal, 0));

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
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[16];

  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dnsProxyUUID"));
  if (v12)
  {

    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  v14 = objc_msgSend(v13, "isUserEnrollment");

  if (!v14)
  {
LABEL_7:
    v19 = MCNEProfileIngestionHandlerClassForPayload(v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!v20)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCDNSProxyPayloadHandler.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("neProfileIngestionHandler"));

    }
    if ((objc_msgSend(v20, "lockConfigurations") & 1) == 0)
    {
      if (a6)
      {
        v38 = objc_msgSend((id)objc_opt_class(self), "internalError");
        v18 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v38);
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_37;
    }
    v49 = v9;
    objc_msgSend(v20, "loadConfigurationsForceReloadFromDisk");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configurationDictionary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:](MCVPNPayloadBase, "NEVPNPayloadBaseDelegateWithConfigurationDict:", v21));

    if (!v22)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCDNSProxyPayloadHandler.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payloadBase"));

    }
    objc_msgSend(v20, "createConfigurationFromPayload:payloadType:", v22, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ingestedConfiguration"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "organization"));
      objc_msgSend(v23, "setPayloadInfoCommon:payloadOrganization:", v24, v25);

      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dnsProxyUUID"));
      if (!v26
        || (v27 = (void *)v26,
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dnsProxyUUID")),
            v29 = objc_msgSend(v23, "setPerAppUUID:andSafariDomains:", v28, 0),
            v28,
            v27,
            (v29 & 1) != 0))
      {
        v30 = objc_alloc_init((Class)NSMutableDictionary);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, kMCPayloadUUIDKey);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, kMCPayloadIdentifierKey);

        }
        if (v49)
          objc_msgSend(v30, "addEntriesFromDictionary:");
        objc_msgSend(v23, "setProfileInfo:", v30);
        objc_msgSend(v20, "updateDefaultAfterAddingConfiguration");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getConfigurationIdentifier"));
        objc_msgSend(v10, "setPersistentResourceID:", v35);

        v50 = 0;
        v18 = objc_msgSend(v20, "saveIngestedConfiguration:", &v50);
        v36 = v50;
        if (a6 && (v18 & 1) == 0)
        {
          v37 = objc_msgSend((id)objc_opt_class(self), "internalErrorWithUnderlyingError:", v36);
          *a6 = (id)objc_claimAutoreleasedReturnValue(v37);
        }
        objc_msgSend(v20, "unlockConfigurations");

        goto LABEL_36;
      }
      v40 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Could not configure DNS proxy UUID", buf, 2u);
      }
      if (a6)
      {
        v41 = MCDNSProxyErrorDomain;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "displayName"));
        v44 = MCErrorArray(CFSTR("ERROR_DNS_PROXY_COULD_NOT_INSTALL"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v41, 51001, v45, MCErrorTypeFatal, v43, 0));

      }
    }
    else
    {
      if (a6)
      {
        v39 = objc_msgSend((id)objc_opt_class(self), "internalError");
        *a6 = (id)objc_claimAutoreleasedReturnValue(v39);
      }
      objc_msgSend(v20, "unlockConfigurations");
    }
    v18 = 0;
LABEL_36:
    v9 = v49;

LABEL_37:
    goto LABEL_38;
  }
  if (a6)
  {
    v15 = MCDNSProxyErrorDomain;
    v16 = MCErrorArray(CFSTR("ERROR_DNS_PROXY_NO_UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 51002, v17, MCErrorTypeFatal, 0));

  }
  v18 = 0;
LABEL_38:

  return v18;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
