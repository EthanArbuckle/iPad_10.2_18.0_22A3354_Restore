@implementation MCNewCalDAVAccountPayloadHandler

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
  v28.super_class = (Class)MCNewCalDAVAccountPayloadHandler;
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
    v14 = MCLocalizedFormat(CFSTR("CALDAV_USERNAME_PROMPT_DESCRIPTION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = MCLocalizedString(CFSTR("OPTIONAL_PROMPT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kCalDAVUsernameKey"), v13, v15, 0, 0, 0, v17, 0, &_mh_execute_header));
    objc_msgSend(v5, "addObject:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "password"));

  if (!v19)
  {
    v20 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = MCLocalizedFormat(CFSTR("CALDAV_PASSWORD_PROMPT_DESCRIPTION"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = MCLocalizedString(CFSTR("OPTIONAL_PROMPT"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kCalDAVPasswordKey"), v21, v23, 0, 0, 0, v25, 0, 0x100000003));
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
  MCNewCalDAVAccountPayloadHandler *v27;
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
    v12 = CFSTR("kCalDAVUsernameKey");
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
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("kCalDAVPasswordKey")))
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
  v30.super_class = (Class)MCNewCalDAVAccountPayloadHandler;
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
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("caldav|%@"), v3));
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
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *j;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  os_log_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  _BOOL4 v83;
  void *v84;
  MCNewCalDAVAccountPayloadHandler *v85;
  id obj;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = sharedDAAccountStore(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierCalDAV));

  v9 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v8);
  objc_msgSend(v9, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendlyName"));
  objc_msgSend(v9, "setManagingSourceName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v12 = objc_msgSend(v11, "userMode");

  if (v12 == 1)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler MCACAccountIdentifier](self, "MCACAccountIdentifier"));
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

    v83 = v19 != 0;
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
      objc_msgSend(v9, "performSelector:withObject:", "_setObjectID:", v20);

    }
  }
  else
  {
    v83 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportedDataclasses"));
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v9, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    }
    while (v23);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v9));
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "setEnabled:forDADataclass:", 1, 4);
    objc_msgSend(v27, "setEnabled:forDADataclass:", 1, 16);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountDescription"));
    v78 = v21;
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
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v33 = v27;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUID"));
    objc_msgSend(v31, "setMcPayloadUUID:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "backingAccountInfo"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "profile"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "UUID"));
    objc_msgSend(v35, "setMcProfileUUID:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "profile"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));

    v85 = self;
    v79 = v9;
    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "backingAccountInfo"));
      objc_msgSend(v42, "setMcConfigurationProfileIdentifier:", v41);

    }
    else
    {
      v43 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on CalDAV account.", buf, 2u);
      }
    }
    v84 = v33;
    v80 = v8;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username", v41));
    v81 = v5;
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v82 = v4;
    obj = v4;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
    if (v46)
    {
      v47 = v46;
      v87 = *(_QWORD *)v89;
      v48 = kMCIDUUIDKey;
      v49 = kMCIDResponseKey;
      v50 = (void *)v45;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(_QWORD *)v89 != v87)
            objc_enumerationMutation(obj);
          v52 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)j);
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", v48));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", v49));
          if (objc_msgSend(v53, "isEqualToString:", CFSTR("kCalDAVUsernameKey")))
          {
            v55 = v54;

            v44 = v55;
          }
          else if (objc_msgSend(v53, "isEqualToString:", CFSTR("kCalDAVPasswordKey")))
          {
            v56 = v54;

            v50 = v56;
          }
          else
          {
            v57 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v58 = v57;
              v59 = (void *)objc_opt_class(v85);
              *(_DWORD *)buf = 138543618;
              v97 = v59;
              v98 = 2114;
              v99 = v53;
              v60 = v44;
              v61 = v50;
              v62 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

              v50 = v61;
              v44 = v60;

            }
          }

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      }
      while (v47);
    }
    else
    {
      v50 = (void *)v45;
    }

    v63 = v84;
    objc_msgSend(v84, "setUsername:", v44);
    v5 = v81;
    if (objc_msgSend(v81, "port"))
      objc_msgSend(v84, "setPort:", (int)objc_msgSend(v81, "port"));
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "principalURL"));
    self = v85;
    v21 = v78;
    if (v64)
    {
      v65 = (void *)v64;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "principalURL"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v66));

      v63 = v84;
      if (v67)
        objc_msgSend(v84, "setPrincipalURL:", v67);
    }
    else
    {
      v67 = 0;
    }
    v68 = &__kCFBooleanTrue;
    if (!v50)
      v68 = &__kCFBooleanFalse;
    v69 = v68;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "backingAccountInfo"));
    objc_msgSend(v70, "setAccountProperty:forKey:", v69, ACAccountPropertyShouldNeverUseSyncableCredential);

    v27 = v84;
    objc_msgSend(v84, "setPassword:", v50);

    if (v83)
      objc_msgSend(v84, "setShouldDoInitialAutodiscovery:", 1);

    v4 = v82;
    v9 = v79;
    v8 = v80;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "backingAccountInfo"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "identifier"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v74 = v27;
  v75 = v73;
  objc_msgSend(v73, "setAcAccountIdentifier:", v72);

  return v74;
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCalDAVAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));

  if (v13)
  {
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewCalDAVAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));
    ((void (**)(_QWORD, id))v14)[2](v14, v9);

    -[MCNewCalDAVAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", 0);
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
  v7 = sharedDAAccountStore(-[MCNewCalDAVAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", a4));
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
  v30 = sub_100062738;
  v31 = sub_100062748;
  v32 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCalDAVAccountPayloadHandler _accountFromPayloadWithUserInputResponses:](self, "_accountFromPayloadWithUserInputResponses:", v6));
  if (v7)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100062750;
    v24[3] = &unk_1000E35C0;
    v26 = &v27;
    v8 = dispatch_semaphore_create(0);
    v25 = v8;
    -[MCNewCalDAVAccountPayloadHandler _preflightWithAccount:completionHandler:](self, "_preflightWithAccount:completionHandler:", v7, v24);
    v9 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v8, v9);
    v10 = v25;
  }
  else
  {
    v11 = MCErrorArray(CFSTR("CALDAV_ACCT_CREATION_FAILED"));
    v8 = objc_claimAutoreleasedReturnValue(v11);
    v12 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCalDAVErrorDomain, 17000, v8, MCErrorTypeFatal, 0));
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
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD v47[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  dispatch_semaphore_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostname"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCalDAVAccountPayloadHandler _accountFromPayloadWithUserInputResponses:](self, "_accountFromPayloadWithUserInputResponses:", 0));
    v16 = v15;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = sub_100062738;
    v62 = sub_100062748;
    v63 = 0;
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

      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = sub_100062738;
      v56 = sub_100062748;
      v57 = dispatch_semaphore_create(0);
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 1;
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
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100062C74;
      v47[3] = &unk_1000E3E68;
      v47[4] = &v48;
      v47[5] = &v52;
      objc_msgSend(v24, "canSaveAccount:withCompletionHandler:", v25, v47);

      dispatch_semaphore_wait((dispatch_semaphore_t)v53[5], 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v49 + 24))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backingAccountInfo"));
        objc_msgSend(v26, "setAuthenticated:", 1);

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100062C90;
        v43[3] = &unk_1000E2F38;
        v45 = &v52;
        v44 = v16;
        v46 = &v58;
        v27 = objc_retainBlock(v43);
        if (objc_msgSend(v11, "length"))
          v28 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v11, v27);
        else
          ((void (*)(_QWORD *))v27[2])(v27);

        v38 = v44;
      }
      else
      {
        v37 = MCErrorArray(CFSTR("CALDAV_ACCT_NOT_UNIQUE"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCalDAVErrorDomain, 17002, v38, MCErrorTypeFatal, 0));
        v40 = objc_msgSend(v39, "MCCopyAsPrimaryError");
        v41 = (void *)v59[5];
        v59[5] = (uint64_t)v40;

      }
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);

    }
    else
    {
      v33 = MCErrorArray(CFSTR("CALDAV_ACCT_CREATION_FAILED"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCCalDAVErrorDomain, 17000, v34, MCErrorTypeFatal, 0));
      v36 = (void *)v59[5];
      v59[5] = v35;

    }
    v32 = (id)v59[5];
    _Block_object_dispose(&v58, 8);

  }
  else
  {
    v29 = MCCalDAVErrorDomain;
    v30 = MCErrorArray(CFSTR("CALDAV_ACCT_NO_HOST_NAME"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 17001, v31, MCErrorTypeFatal, 0));

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
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewCalDAVAccountPayloadHandler _reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:](self, "_reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:", v9, v12, v16, v17));
  v25 = v24;
  if (a6 && v24)
    *a6 = objc_retainAutorelease(v24);

  return v25 == 0;
}

- (id)accountTypeIdentifiers
{
  uint64_t v3;

  v3 = ACAccountTypeIdentifierCalDAV;
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
  v10.super_class = (Class)MCNewCalDAVAccountPayloadHandler;
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
        v16[2] = sub_100063330;
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
