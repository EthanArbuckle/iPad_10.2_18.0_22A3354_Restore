@implementation MCVPNPayloadHandlerBase

- (MCVPNPayloadHandlerBase)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6;
  MCVPNPayloadHandlerBase *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NEProfileIngestionDelegate *v16;
  MCVPNPayloadHandlerBase *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MCVPNPayloadHandlerBase;
  v7 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v19, "initWithPayload:profileHandler:", v6, a4);
  if (!v7)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vpnType"));
  v9 = objc_msgSend(v8, "isEqualToString:", kMCVPNPayloadBaseVPNTypeAlwaysOn);

  if (v9)
  {
    v10 = MCNEProfileIngestionHandlerClassForPayload(CFSTR("com.apple.vpn.managed.alwayson"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    neProfileIngestionHandler = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v11;
  }
  else
  {
    neProfileIngestionHandler = (NEProfileIngestionDelegate *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v7, "payload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEProfileIngestionDelegate type](neProfileIngestionHandler, "type"));
    v14 = MCNEProfileIngestionHandlerClassForPayload(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v15;

  }
  if (!v7->_neProfileIngestionHandler)
    v17 = 0;
  else
LABEL_6:
    v17 = v7;

  return v17;
}

- (id)userInputFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nePayloadBase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getPreprocessedPayloadContents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthName")));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthNameRequired")));

    if (!v8)
      goto LABEL_5;
    v9 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v11 = MCLocalizedFormat(CFSTR("VPN_USERNAME_PROMPT_DESCRIPTION"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputUserName"), v7, v12, 0, 0, 0, 0, 0, &_mh_execute_header));
    objc_msgSend(v3, "addObject:", v13);

  }
LABEL_5:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthPassword")));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthPasswordRequired")));

    if (!v15)
      goto LABEL_12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthName")));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthName")));
      v18 = CFSTR("VPN_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
      v18 = CFSTR("VPN_PASSWORD_PROMPT_DESCRIPTION");
    }
    v19 = MCLocalizedFormat(v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v20 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputPassword"), v21, v14, 0, 0, 0, 0, 0, 0x100000003));
    objc_msgSend(v3, "addObject:", v22);

  }
LABEL_12:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsername")));
  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsernameRequired")));

    if (!v24)
      goto LABEL_16;
    v25 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v27 = MCLocalizedFormat(CFSTR("VPN_PROXY_USERNAME_PROMPT_DESCRIPTION"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputProxyUserName"), v23, v28, 0, 0, 0, 0, 0, &_mh_execute_header));
    objc_msgSend(v3, "addObject:", v29);

  }
LABEL_16:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword")));
  if (!v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword")));

    if (!v31)
      goto LABEL_23;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword")));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthName")));
      v34 = CFSTR("VPN_PROXY_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION");
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
      v34 = CFSTR("VPN_PROXY_PASSWORD_PROMPT_DESCRIPTION");
    }
    v35 = MCLocalizedFormat(v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v35);

    v36 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputProxyPassword"), v37, v30, 0, 0, 0, 0, 0, 0x100000003));
    objc_msgSend(v3, "addObject:", v38);

  }
LABEL_23:
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SharedSecret")));
  if (!v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SharedSecretRequired")));

    if (!v40)
      goto LABEL_27;
    v41 = MCLocalizedString(CFSTR("VPN_SHARED_SECRET_PROMPT_TITLE"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v43 = MCLocalizedFormat(CFSTR("VPN_SHARED_SECRET_PROMPT_DESCRIPTION"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputSharedSecret"), v39, v44, 0, 0, 0, 0, 0, 0x100000003));
    objc_msgSend(v3, "addObject:", v45);

  }
LABEL_27:
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PromptForVPNPIN")));
  if (v46)
  {
LABEL_30:

    goto LABEL_31;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PromptForVPNPINRequired")));

  if (v47)
  {
    v48 = MCLocalizedString(CFSTR("VPN_PIN_PROMPT_TITLE"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v50 = MCLocalizedFormat(CFSTR("VPN_PIN_PROMPT_DESCRIPTION"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kVPNUserInputPIN"), v46, v51, 0, 0, 0, 0, 0, 0x100000003));
    objc_msgSend(v3, "addObject:", v52);

    goto LABEL_30;
  }
LABEL_31:

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  MCVPNPayloadHandlerBase *v26;
  id v27;
  os_log_t log;
  NSObject *loga;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v5 = a3;
  v26 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v25 = v6;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nePayloadBase"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    v12 = kMCIDUUIDKey;
    v13 = kMCIDResponseKey;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v12, v24));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v13));
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputUserName")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("AuthName");
LABEL_18:
          objc_msgSend(v18, "setValue:forKey:", v19, v20);
          goto LABEL_19;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputPassword")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("AuthPassword");
          goto LABEL_18;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputProxyUserName")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("HTTPProxyUsername");
          goto LABEL_18;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputProxyPassword")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("HTTPProxyPassword");
          goto LABEL_18;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputSharedSecret")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("SharedSecret");
          goto LABEL_18;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("kVPNUserInputPIN")))
        {
          v18 = v7;
          v19 = v17;
          v20 = CFSTR("PromptForVPNPIN");
          goto LABEL_18;
        }
        log = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          loga = log;
          v21 = (void *)objc_opt_class(v26);
          *(_DWORD *)buf = 138543618;
          v35 = v21;
          v36 = 2114;
          v37 = v16;
          v27 = v21;
          _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

        }
LABEL_19:

        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v10 = v22;
    }
    while (v22);
  }

  objc_msgSend(v24, "setPostprocessedPayloadContents:", v7);
  return 1;
}

- (id)PPTPDeprecatedError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCVPNErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_VPN_PPTP_DEPRECATED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 15000, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)cannotInstallError
{
  return -[MCVPNPayloadHandlerBase cannotInstallErrorWithUnderlyingError:](self, "cannotInstallErrorWithUnderlyingError:", 0);
}

- (id)cannotInstallErrorWithUnderlyingError:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = MCVPNErrorDomain;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v8 = MCErrorArray(CFSTR("ERROR_VPN_COULD_NOT_INSTALL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 15000, v9, v5, MCErrorTypeFatal, v7, 0));

  return v10;
}

- (id)installService:(id)a3
{
  return 0;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  id v14;
  void *v15;
  unsigned int v16;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  uint64_t v60;
  void *v61;
  BOOL v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  NEProfileIngestionDelegate *v76;
  unsigned __int8 v77;
  uint64_t v78;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id obj;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  _QWORD v96[5];
  id v97;
  id v98;
  id v99;
  __int128 *p_buf;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[128];
  __int128 buf;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _BYTE v111[128];

  v80 = a3;
  v84 = a4;
  v81 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nePayloadBase"));
  v85 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledInteractively));
  LOBYTE(a4) = objc_msgSend(v10, "BOOLValue");

  if ((a4 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vpnType"));
    v12 = objc_msgSend(v11, "isEqualToString:", kMCVPNPayloadBaseVPNTypePPTP);

    if (v12)
    {
      v13 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "PPTP is deprecated starting from iOS 10 and valid configurations can not be created.", (uint8_t *)&buf, 2u);
      }
      v14 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase PPTPDeprecatedError](self, "PPTPDeprecatedError"));
      v83 = 0;
      goto LABEL_49;
    }
  }
  if ((-[NEProfileIngestionDelegate lockConfigurations](self->_neProfileIngestionHandler, "lockConfigurations") & 1) == 0)
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_16;
  }
  -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk](self->_neProfileIngestionHandler, "loadConfigurationsForceReloadFromDisk");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vpnType"));
  v16 = objc_msgSend(v15, "isEqualToString:", kMCVPNPayloadBaseVPNTypeAlwaysOn);

  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  if (v16)
  {
    if ((-[NEProfileIngestionDelegate createConfigurationFromPayload:payloadType:](self->_neProfileIngestionHandler, "createConfigurationFromPayload:payloadType:", v82, CFSTR("com.apple.vpn.managed.alwayson")) & 1) != 0)goto LABEL_9;
    goto LABEL_18;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "type"));
  v27 = -[NEProfileIngestionDelegate createConfigurationFromPayload:payloadType:](neProfileIngestionHandler, "createConfigurationFromPayload:payloadType:", v82, v26);

  if ((v27 & 1) == 0)
  {
LABEL_18:
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUID"));
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "NetworkExtension did not create configuration from payload UUID %{public}@", (uint8_t *)&buf, 0xCu);

    }
LABEL_16:
    v14 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase cannotInstallError](self, "cannotInstallError"));
    v83 = 0;
    goto LABEL_49;
  }
LABEL_9:
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[NEProfileIngestionDelegate ingestedConfiguration](self->_neProfileIngestionHandler, "ingestedConfiguration"));
  if (!v83)
  {
    v32 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUID"));
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "NetworkExtension decided to skip installation of payload UUID %{public}@", (uint8_t *)&buf, 0xCu);

    }
    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
    v14 = 0;
    v83 = 0;
    goto LABEL_60;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nePayloadBase"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "getPendingCertificateInfo:", v18));

  if (v89)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v21 = kMDMPersonaKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", kMDMPersonaKey));
      v23 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", v21));
      else
        v90 = 0;

    }
    else
    {
      v90 = 0;
    }
    v87 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v89, "count"));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "allKeys"));
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    if (v36)
    {
      v88 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v102 != v88)
            objc_enumerationMutation(obj);
          v38 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v107 = 0x3032000000;
          v108 = sub_10008EE0C;
          v109 = sub_10008EE1C;
          v110 = 0;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", v38));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("PayloadUUID")));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("AccessGroup")));
          if (v41)
          {
            if (objc_msgSend(v90, "length"))
            {
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472;
              v96[2] = sub_10008EE24;
              v96[3] = &unk_1000E44F0;
              p_buf = &buf;
              v96[4] = self;
              v97 = v40;
              v98 = v41;
              v99 = v90;
              v42 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v99, v96);

            }
            else
            {
              v46 = -[MCVPNPayloadHandlerBase _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:](self, "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:", v40, v41, 0);
              v47 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v46;

            }
            v48 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            if (v48)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", v48, v49, 1, 0, v90);

              objc_msgSend(v85, "addObject:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
            }
          }
          else
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "persistentIDForCertificateUUID:", v40));
            v45 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v44;

          }
          v50 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          if (v50)
            objc_msgSend(v87, "setObject:forKey:", v50, v38);

          _Block_object_dispose(&buf, 8);
        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
      }
      while (v36);
    }

    v51 = objc_msgSend(v89, "count");
    if (v51 != objc_msgSend(v87, "count") || !objc_msgSend(v83, "setCertificates:", v87))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "displayName"));
      v54 = MCErrorArray(CFSTR("ERROR_VPN_INVALID_CERTIFICATES"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCVPNErrorDomain, 15003, v55, MCErrorTypeFatal, v53, 0));

      goto LABEL_49;
    }

  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase installService:](self, "installService:", v83));
  if (!v14)
  {
    objc_msgSend(v83, "setPayloadInfoIdentity:", v82);
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "organization"));
    objc_msgSend(v83, "setPayloadInfoCommon:payloadOrganization:", v64, v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "profile"));

    if (v67)
    {
      v68 = objc_alloc_init((Class)NSMutableDictionary);
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "UUID"));
      v70 = v69 == 0;

      if (!v70)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "UUID"));
        objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, kMCPayloadUUIDKey);

      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "identifier"));
      v73 = v72 == 0;

      if (!v73)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "identifier"));
        objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, kMCPayloadIdentifierKey);

      }
      if (v84)
        objc_msgSend(v68, "addEntriesFromDictionary:", v84);
      objc_msgSend(v83, "setProfileInfo:", v68);

    }
    -[NEProfileIngestionDelegate updateDefaultAfterAddingConfiguration](self->_neProfileIngestionHandler, "updateDefaultAfterAddingConfiguration");
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "getConfigurationIdentifier"));
    objc_msgSend(v9, "setPersistentResourceID:", v75);

    v76 = self->_neProfileIngestionHandler;
    v95 = 0;
    v77 = -[NEProfileIngestionDelegate saveIngestedConfiguration:](v76, "saveIngestedConfiguration:", &v95);
    v14 = v95;
    if ((v77 & 1) == 0)
    {
      v78 = objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase cannotInstallErrorWithUnderlyingError:](self, "cannotInstallErrorWithUnderlyingError:", v14));

      v14 = (id)v78;
    }
LABEL_49:
    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
    if (v14)
      goto LABEL_50;
LABEL_60:
    v62 = 1;
    goto LABEL_61;
  }
  -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
LABEL_50:
  if (a6)
    *a6 = objc_retainAutorelease(v14);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v56 = v85;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(_QWORD *)v92 != v58)
          objc_enumerationMutation(v56);
        v60 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v60, v61);

      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    }
    while (v57);
  }

  v62 = 0;
LABEL_61:

  return v62;
}

- (BOOL)isInstalled
{
  void *v3;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v5;

  -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk](self->_neProfileIngestionHandler, "loadConfigurationsForceReloadFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  LOBYTE(neProfileIngestionHandler) = -[NEProfileIngestionDelegate isInstalled:](neProfileIngestionHandler, "isInstalled:", v5);

  return (char)neProfileIngestionHandler;
}

- (void)remove
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NEProfileIngestionDelegate *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentResourceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    *(_DWORD *)buf = 138543874;
    v31 = v6;
    v32 = 2114;
    v33 = v8;
    v34 = 2114;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Attempting to remove VPN payload (%{public}@, %{public}@): %{public}@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations](self->_neProfileIngestionHandler, "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk](self->_neProfileIngestionHandler, "loadConfigurationsForceReloadFromDisk");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentResourceID"));

    if (v11)
    {
      neProfileIngestionHandler = self->_neProfileIngestionHandler;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentResourceID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NEProfileIngestionDelegate getCertificatesForConfigurationWithIdentifier:](neProfileIngestionHandler, "getCertificatesForConfigurationWithIdentifier:", v13));

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID", (_QWORD)v25));
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v20, v21);

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

      v22 = self->_neProfileIngestionHandler;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentResourceID"));
      -[NEProfileIngestionDelegate removeConfigurationWithIdentifier:](v22, "removeConfigurationWithIdentifier:", v23);

    }
    -[NEProfileIngestionDelegate updateDefaultAfterDeletingConfiguration](self->_neProfileIngestionHandler, "updateDefaultAfterDeletingConfiguration", (_QWORD)v25);
    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }
  else
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
    }
  }

}

- (void)setAside
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentResourceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v15 = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Setting aside VPN payload (%{public}@, %{public}@): %{public}@", (uint8_t *)&v15, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations](self->_neProfileIngestionHandler, "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk](self->_neProfileIngestionHandler, "loadConfigurationsForceReloadFromDisk");
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentResourceID"));
    v13 = -[NEProfileIngestionDelegate setAsideConfigurationName:unsetAside:](neProfileIngestionHandler, "setAsideConfigurationName:unsetAside:", v12, 0);

    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }
  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)unsetAside
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NEProfileIngestionDelegate *neProfileIngestionHandler;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentResourceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v15 = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Unsetting aside VPN payload (%{public}@, %{public}@): %{public}@", (uint8_t *)&v15, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations](self->_neProfileIngestionHandler, "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk](self->_neProfileIngestionHandler, "loadConfigurationsForceReloadFromDisk");
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentResourceID"));
    v13 = -[NEProfileIngestionDelegate setAsideConfigurationName:unsetAside:](neProfileIngestionHandler, "setAsideConfigurationName:unsetAside:", v12, 1);

    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }
  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vpnType"));
  v7 = objc_msgSend(v6, "isEqualToString:", kMCVPNPayloadBaseVPNTypeAlwaysOn);

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase neProfileIngestionHandler](self, "neProfileIngestionHandler"));
    objc_msgSend(v8, "enableAlwaysOnVpn");

  }
}

+ (id)managedServiceIDs
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = MCNEProfileIngestionHandlerClassForPayload(CFSTR("PayloadTypeNone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "loadConfigurationsForceReloadFromDisk");
    v5 = objc_msgSend(v4, "copyManagedConfigurationIDs");
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  CFStringRef v29;
  __int16 v30;
  id v31;

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadHandlerWithUUID:", v8));

  if (v12)
  {
    v27 = 0;
    v13 = objc_msgSend(v12, "copyIdentityImmediatelyWithInteractionClient:outError:", 0, &v27);
    v14 = v27;
    if (!v14 && v13)
      goto LABEL_7;
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "VPN: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v13)
    {
LABEL_7:
      v25 = v14;
      v26 = v10;
      v16 = v9;
      v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Storing VPN identity, storing with accessibility %@", buf, 0xCu);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("NE:"), "stringByAppendingString:", v8));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "profile"));
      v9 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:", v13, v18, v16, objc_msgSend(v20, "isInstalledForSystem"), 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly));

      v10 = v26;
      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUID"));
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:personaID:](self, "_touchDependencyBetweenPersistentID:andUUID:personaID:", v21, v23, v26);

      }
      CFRelease(v13);
      v14 = v25;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (__SCPreferences)scPreferences
{
  return self->_scPreferences;
}

- (void)setScPreferences:(__SCPreferences *)a3
{
  self->_scPreferences = a3;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (NEProfileIngestionDelegate)neProfileIngestionHandler
{
  return self->_neProfileIngestionHandler;
}

- (void)setNeProfileIngestionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_neProfileIngestionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neProfileIngestionHandler, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
}

@end
