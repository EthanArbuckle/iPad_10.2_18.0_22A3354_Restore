@implementation MCNewCardDAVAccountPayloadHandler

- (id)userInputFields
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MCNewCardDAVAccountPayloadHandler;
  v3 = -[MCNewPayloadHandler userInputFields](&v28, "userInputFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountDescription"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostname"));
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  if (!v11)
  {
    v12 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = MCLocalizedFormat(CFSTR("CARDDAV_USERNAME_PROMPT_DESCRIPTION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = MCLocalizedString(CFSTR("CARDDAV_USERNAME_PLACEHOLDER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kCardDAVUsernameKey"), v13, v15, 0, 0, 0, v17, 0, 0));
    objc_msgSend(v5, "addObject:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "password"));

  if (!v19)
  {
    v20 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = MCLocalizedFormat(CFSTR("CARDDAV_PASSWORD_PROMPT_DESCRIPTION"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = MCLocalizedString(CFSTR("CARDDAV_PASSWORD_PLACEHOLDER"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kCardDAVPasswordKey"), v21, v23, 0, 0, 0, v25, 0, 3));
    objc_msgSend(v5, "addObject:", v26);

  }
  return v5;
}

- (void)setUserInputResponses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  MCNewCardDAVAccountPayloadHandler *v27;
  id v28;
  uint64_t v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v4 = a3;
  v27 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v32;
    v11 = kMCIDUUIDKey;
    v12 = CFSTR("kCardDAVUsernameKey");
    v29 = kMCIDResponseKey;
    *(_QWORD *)&v8 = 138543618;
    v26 = v8;
    do
    {
      v13 = 0;
      v28 = v9;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11, v26));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v29));
        if (objc_msgSend(v15, "isEqualToString:", v12))
        {
          objc_msgSend(v5, "setUsername:", v16);
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("kCardDAVPasswordKey")))
        {
          objc_msgSend(v5, "setPassword:", v16);
        }
        else
        {
          v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            v19 = (void *)objc_opt_class(v27);
            *(_DWORD *)buf = v26;
            v36 = v19;
            v37 = 2114;
            v38 = v15;
            v20 = v12;
            v21 = v11;
            v22 = v10;
            v23 = v5;
            v24 = v6;
            v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

            v6 = v24;
            v5 = v23;
            v10 = v22;
            v11 = v21;
            v12 = v20;
            v9 = v28;

          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v9);
  }

  v30.receiver = v27;
  v30.super_class = (Class)MCNewCardDAVAccountPayloadHandler;
  -[MCNewPayloadHandler setUserInputResponses:](&v30, "setUserInputResponses:", v6);

}

- (id)unhashedAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hostname"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("carddav|%@"), v3));
  else
    v4 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "username"));
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("|%@"), v5));

    v4 = (void *)v7;
  }

  return v4;
}

- (id)_accountFromPayloadWithUserInputResponses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *j;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  os_log_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  MCNewCardDAVAccountPayloadHandler *v81;
  id obj;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];

  v4 = a3;
  v81 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierCardDAV));

  v9 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v8);
  objc_msgSend(v9, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendlyName"));
  objc_msgSend(v9, "setManagingSourceName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v12 = objc_msgSend(v11, "userMode");

  if (v12 == 1)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler MCACAccountIdentifier](v81, "MCACAccountIdentifier"));
    v14 = v13;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      objc_msgSend(v9, "setAccountProperty:forKey:", v15, CFSTR("MCAccountIdentifer"));

      v13 = objc_msgSend(v9, "setIdentifier:", v14);
    }
    v16 = sharedDAAccountStore(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accountWithIdentifier:", v18));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
      objc_msgSend(v9, "performSelector:withObject:", "_setObjectID:", v20);

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportedDataclasses"));
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v9, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v23);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v9));
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "setEnabled:forDADataclass:", 1, 2);
    objc_msgSend(v27, "setEnabled:forDADataclass:", 1, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountDescription"));
    v75 = v21;
    if (v28)
    {
      objc_msgSend(v27, "setAccountDescription:", v28);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostname"));
      objc_msgSend(v27, "setAccountDescription:", v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostname"));
    objc_msgSend(v27, "setHost:", v30);

    objc_msgSend(v27, "setUseSSL:", objc_msgSend(v5, "useSSL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "backingAccountInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v81, "payload"));
    v80 = v27;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUID"));
    objc_msgSend(v31, "setMcPayloadUUID:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "backingAccountInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v81, "payload"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "profile"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUID"));
    objc_msgSend(v34, "setMcProfileUUID:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "backingAccountInfo"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "communicationServiceRules"));
    objc_msgSend(v38, "setCommunicationServiceRules:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v81, "payload"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "profile"));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));

    v76 = v9;
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "backingAccountInfo"));
      objc_msgSend(v43, "setMcConfigurationProfileIdentifier:", v42);

    }
    else
    {
      v44 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on CardDAV account.", buf, 2u);
      }
    }
    v74 = (void *)v42;
    v77 = v8;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
    v78 = v5;
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v79 = v4;
    obj = v4;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    if (v47)
    {
      v48 = v47;
      v83 = *(_QWORD *)v85;
      v49 = kMCIDUUIDKey;
      v50 = kMCIDResponseKey;
      v51 = (void *)v46;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(_QWORD *)v85 != v83)
            objc_enumerationMutation(obj);
          v53 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", v49));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", v50));
          if (objc_msgSend(v54, "isEqualToString:", CFSTR("kCardDAVUsernameKey")))
          {
            v56 = v55;

            v45 = v56;
          }
          else if (objc_msgSend(v54, "isEqualToString:", CFSTR("kCardDAVPasswordKey")))
          {
            v57 = v55;

            v51 = v57;
          }
          else
          {
            v58 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v59 = v58;
              v60 = (void *)objc_opt_class(v81);
              *(_DWORD *)buf = 138543618;
              v93 = v60;
              v94 = 2114;
              v95 = v54;
              v61 = v45;
              v62 = v51;
              v63 = v60;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

              v51 = v62;
              v45 = v61;

            }
          }

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      }
      while (v48);
    }
    else
    {
      v51 = (void *)v46;
    }
    v64 = v51;

    v65 = v80;
    objc_msgSend(v80, "setUsername:", v45);
    v5 = v78;
    if (objc_msgSend(v78, "port"))
      objc_msgSend(v80, "setPort:", (int)objc_msgSend(v78, "port"));
    v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "principalURL"));
    v4 = v79;
    v9 = v76;
    v8 = v77;
    v21 = v75;
    if (v66)
    {
      v67 = (void *)v66;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "principalURL"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v68));

      v65 = v80;
      if (v69)
        objc_msgSend(v80, "setPrincipalURL:", v69);
    }
    else
    {
      v69 = 0;
    }
    v70 = &__kCFBooleanTrue;
    if (!v64)
      v70 = &__kCFBooleanFalse;
    v71 = v70;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "backingAccountInfo"));
    objc_msgSend(v72, "setAccountProperty:forKey:", v71, ACAccountPropertyShouldNeverUseSyncableCredential);

    v27 = v80;
    objc_msgSend(v80, "setPassword:", v64);

  }
  return v27;
}

- (id)_errorFromValidationError:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (v4 == (id)102)
  {
    v13 = MCDAErrorDomain;
    v14 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v13, 18002, v7, v9, v11, v3, MCErrorTypeRetryable);
LABEL_11:
    v25 = (void *)objc_claimAutoreleasedReturnValue(v17);

    goto LABEL_12;
  }
  if (v4 == (id)101)
  {
    v18 = MCDAErrorDomain;
    v19 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v20 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v21 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v18, 18001, v7, v9, v11, v3, MCErrorTypeSkippable);
    goto LABEL_11;
  }
  if (v4 == (id)100)
  {
    v5 = MCDAErrorDomain;
    v6 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = &MCErrorTypeSkippable;
LABEL_10:
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v5, 18000, v7, v9, v11, v3, *v12);
    goto LABEL_11;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
  v23 = objc_msgSend(v22, "length");

  v5 = MCDAErrorDomain;
  v24 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (!v23)
  {
    v26 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v27 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v12 = &MCErrorTypeFatal;
    goto LABEL_10;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v5, 18000, v7, v3, MCErrorTypeFatal, 0));
LABEL_12:

  return v25;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCVerboseDescription"));
    v15 = 138543874;
    v16 = v8;
    v17 = 1024;
    v18 = v6;
    v19 = 2114;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "account %{public}@ is valid %d with error %{public}@", (uint8_t *)&v15, 0x1Cu);

  }
  if (!v9 && !v6)
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DAAccountValidationDomain, 102, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCardDAVAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));

  if (v13)
  {
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewCardDAVAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));
    ((void (**)(_QWORD, id))v14)[2](v14, v9);

    -[MCNewCardDAVAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", 0);
  }

}

- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t global_queue;
  void *v9;
  id v10;

  v6 = a3;
  v7 = sharedDAAccountStore(-[MCNewCardDAVAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(v7);
  global_queue = dataaccess_get_global_queue();
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  objc_msgSend(v6, "checkValidityOnAccountStore:withConsumer:inQueue:", v10, self, v9);

}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10006902C;
  v31 = sub_10006903C;
  v32 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCardDAVAccountPayloadHandler _accountFromPayloadWithUserInputResponses:](self, "_accountFromPayloadWithUserInputResponses:", v6));
  if (v7)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100069044;
    v24[3] = &unk_1000E35C0;
    v26 = &v27;
    v8 = dispatch_semaphore_create(0);
    v25 = v8;
    -[MCNewCardDAVAccountPayloadHandler _preflightWithAccount:completionHandler:](self, "_preflightWithAccount:completionHandler:", v7, v24);
    v9 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v8, v9);
    v10 = v25;
  }
  else
  {
    v11 = MCErrorArray(CFSTR("CARDDAV_ACCT_CREATION_FAILED"));
    v8 = objc_claimAutoreleasedReturnValue(v11);
    v12 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCardDAVErrorDomain, 20000, v8, MCErrorTypeFatal, 0));
    v10 = v28[5];
    v28[5] = v12;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "MCErrorType"));
  v14 = MCErrorTypeSkippable;
  v15 = objc_msgSend(v13, "isEqualToString:", MCErrorTypeSkippable);

  if (v15)
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Swallowing skippable error %{public}@", buf, 0xCu);

    }
    v18 = (void *)v28[5];
    v28[5] = 0;

  }
  v19 = (void *)v28[5];
  if (!v19)
    goto LABEL_12;
  if (a4)
  {
    *a4 = objc_retainAutorelease(v19);
    v19 = (void *)v28[5];
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "MCErrorType"));
  v21 = objc_msgSend(v20, "isEqualToString:", v14);

  if (!v21)
    v22 = 0;
  else
LABEL_12:
    v22 = 1;

  _Block_object_dispose(&v27, 8);
  return v22;
}

- (id)_reallyInstallInstaller:(id)a3 isInstalledByMDM:(BOOL)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  dispatch_semaphore_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostname"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCardDAVAccountPayloadHandler _accountFromPayloadWithUserInputResponses:](self, "_accountFromPayloadWithUserInputResponses:", 0));
    v16 = v15;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = sub_10006902C;
    v65 = sub_10006903C;
    v66 = 0;
    if (v15)
    {
      if (v8)
      {
        objc_msgSend(v15, "setAccountBoolProperty:forKey:", 1, CFSTR("MCAccountIsManaged"));
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v16, "setAccountProperty:forKey:", v11, ACAccountPropertyPersonaIdentifier);
        if (v12)
          objc_msgSend(v16, "setAccountProperty:forKey:", v12, ACAccountPropertyRemoteManagingAccountIdentifier);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
      -[MCACAccountPayloadHandler markIfUpdatingOverInstalledAccount:](self, "markIfUpdatingOverInstalledAccount:", v17);

      v55 = 0;
      v56 = &v55;
      v57 = 0x3032000000;
      v58 = sub_10006902C;
      v59 = sub_10006903C;
      v60 = dispatch_semaphore_create(0);
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 1;
      v18 = objc_msgSend(v10, "setAsideAccountIdentifiersForPayloadClass:", objc_opt_class(self));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = objc_msgSend(v19, "count");
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedAccountProperties DAAccountIdentifiersToIgnoreForUniquenessCheck](DASharedAccountProperties, "DAAccountIdentifiersToIgnoreForUniquenessCheck"));
        objc_msgSend(v21, "setAccountProperty:forKey:", v19, v22);

      }
      v23 = sharedDAAccountStore(v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1000695A8;
      v50[3] = &unk_1000E3E68;
      v50[4] = &v51;
      v50[5] = &v55;
      objc_msgSend(v24, "canSaveAccount:withCompletionHandler:", v25, v50);

      dispatch_semaphore_wait((dispatch_semaphore_t)v56[5], 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v52 + 24))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
        objc_msgSend(v26, "setAuthenticated:", 1);

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1000695C4;
        v46[3] = &unk_1000E2F38;
        v48 = &v55;
        v47 = v16;
        v49 = &v61;
        v27 = objc_retainBlock(v46);
        if (objc_msgSend(v11, "length"))
          v28 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v11, v27);
        else
          ((void (*)(_QWORD *))v27[2])(v27);

        v38 = v47;
      }
      else
      {
        v37 = MCErrorArray(CFSTR("CARDDAV_ACCT_NOT_UNIQUE"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCardDAVErrorDomain, 20002, v38, MCErrorTypeFatal, 0));
        v40 = objc_msgSend(v39, "MCCopyAsPrimaryError");
        v41 = (void *)v62[5];
        v62[5] = (uint64_t)v40;

      }
      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v55, 8);

    }
    else
    {
      v33 = MCErrorArray(CFSTR("CARDDAV_ACCT_CREATION_FAILED"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCardDAVErrorDomain, 20000, v34, MCErrorTypeFatal, 0));
      v36 = (void *)v62[5];
      v62[5] = v35;

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    objc_msgSend(v44, "setAcAccountIdentifier:", v43);

    v32 = (id)v62[5];
    _Block_object_dispose(&v61, 8);

  }
  else
  {
    v29 = MCCardDAVErrorDomain;
    v30 = MCErrorArray(CFSTR("CARDDAV_ACCT_NO_HOST_NAME"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 20001, v31, MCErrorTypeFatal, 0));

  }
  return v32;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((_DWORD)v12)
  {
    v13 = kMDMPersonaKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMDMPersonaKey));
    v15 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v13));
    else
      v16 = 0;

    v18 = kMCInstallProfileOptionManagingProfileIdentifier;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
    v20 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
    {
      v17 = 0;
      goto LABEL_11;
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v18));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v21));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      v19 = (void *)v21;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
LABEL_12:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCardDAVAccountPayloadHandler _reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:](self, "_reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:", v9, v12, v16, v17));
  v25 = v24;
  if (a6 && v24)
    *a6 = objc_retainAutorelease(v24);

  return v25 == 0;
}

- (id)accountTypeIdentifiers
{
  uint64_t v3;

  v3 = ACAccountTypeIdentifierCardDAV;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
  v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCNewCardDAVAccountPayloadHandler;
  -[MCNewPayloadHandler setAsideWithInstaller:](&v10, "setAsideWithInstaller:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingAccountInfo"));
    -[MCACAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingAccountInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    objc_msgSend(v4, "addSetAsideAccountIdentifier:forPayloadClass:", v9, objc_opt_class(self));

  }
}

- (void)unsetAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  dispatch_semaphore_t v18;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  if (objc_msgSend(v15, "userMode") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountPropertyForKey:", CFSTR("MCAccountIdentifer")));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backingAccountInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountPropertyForKey:", CFSTR("MCAccountIdentifer")));

      if (v6 && (!v8 || (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
        objc_msgSend(v9, "markAllPropertiesDirty");
        v10 = dispatch_semaphore_create(0);
        v11 = sharedDAAccountStore(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100069C64;
        v16[3] = &unk_1000E3E90;
        v17 = v9;
        v18 = v10;
        v13 = v10;
        v14 = v9;
        objc_msgSend(v12, "saveVerifiedAccount:withCompletionHandler:", v14, v16);

        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      }
      -[MCACAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", 0);

    }
  }
  else
  {

  }
}

- (void)remove
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (!v4)
  {
    if (-[MCACAccountPayloadHandler updatedOverInstalledAccount](self, "updatedOverInstalledAccount"))
    {
      v8 = 0;
      goto LABEL_11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backingAccountInfo"));

    if (!v8)
      goto LABEL_11;
LABEL_10:
    +[MCFeatureOverrides accountRemovalTimeoutWithDefaultValue:](MCFeatureOverrides, "accountRemovalTimeoutWithDefaultValue:", 600.0);
    -[MCACAccountPayloadHandler _synchronouslyDeleteAccountAndAssociatedData:timeout:completion:](self, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:", v8, 0);
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v6 = objc_msgSend(v5, "userMode");

  if (v6 == 1)
    v7 = objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedSetAsideACAccount](self, "_installedSetAsideACAccount"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
  v8 = (void *)v7;
  -[MCACAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", 0);
  if (v8)
    goto LABEL_10;
LABEL_11:

}

- (id)accountValidationCompletionHandler
{
  return self->_accountValidationCompletionHandler;
}

- (void)setAccountValidationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountValidationCompletionHandler, 0);
}

@end
