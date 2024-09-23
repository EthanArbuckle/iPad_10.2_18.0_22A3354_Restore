@implementation MCSingleSignOnPayloadHandler

- (id)userInputFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "kerberosInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "principalName"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v7 = MCLocalizedFormat(CFSTR("PRINCIPAL_NAME_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "realm"));
    v10 = MCLocalizedFormat(CFSTR("KERBEROS_PRINCIPAL_NAME_P_REALM"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "humanReadableName", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("KPrincipalName"), v8, v11, 0, v12, 0, 0, 1, 0));
    objc_msgSend(v4, "addObject:", v13);

  }
  return v4;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", a3, CFSTR("KPrincipalName"), 0));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "rangeOfString:", CFSTR("@")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = MCSSOErrorDomain;
    v12 = MCErrorArray(CFSTR("SSO_PRINCIPAL_NAME_INVALID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v11, 34003, v13, MCErrorTypeNeedsRetry, 0));

    v7 = v8 != 0;
    if (a4 && v8)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = !v7;

  return v9;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  dispatch_semaphore_t v37;
  dispatch_queue_global_t v38;
  NSObject *v39;
  id v40;
  id v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *i;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  dispatch_semaphore_t v61;
  dispatch_queue_global_t global_queue;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  dispatch_semaphore_t v66;
  dispatch_queue_global_t v67;
  NSObject *v68;
  NSObject *v69;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  dispatch_semaphore_t dsema;
  void *v77;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  dispatch_semaphore_t v87;
  _QWORD v88[4];
  id v89;
  id v90;
  dispatch_semaphore_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  NSObject *v100;
  uint64_t *v101;
  _QWORD block[4];
  id v103;
  id v104;
  id v105;
  id v106;
  dispatch_semaphore_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint8_t v115[128];
  uint8_t buf[4];
  void *v117;

  v79 = a3;
  v8 = a4;
  v80 = a5;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = sub_100094C08;
  v113 = sub_100094C18;
  v114 = 0;
  v82 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  LODWORD(a5) = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)a5)
  {
    v11 = kMDMPersonaKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMDMPersonaKey));
    v13 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    else
      v81 = 0;

  }
  else
  {
    v81 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kerberosInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "principalName"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v17, CFSTR("KPrincipalName"), v18));

  if (!v15)
  {
LABEL_44:
    v57 = (void *)v110[5];
    if (v57)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountGUID"));

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountGUID"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountWithIdentifier:", v59));

        if (v60)
        {
          v61 = dispatch_semaphore_create(0);
          global_queue = dispatch_get_global_queue(0, 0);
          v63 = objc_claimAutoreleasedReturnValue(global_queue);
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472;
          v88[2] = sub_100094F50;
          v88[3] = &unk_1000E41F0;
          v89 = v16;
          v90 = v60;
          v91 = v61;
          v64 = v61;
          dispatch_async(v63, v88);

          dispatch_semaphore_wait(v64, 0xFFFFFFFFFFFFFFFFLL);
        }

      }
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountTypeGUID"));

      if (a5)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountTypeGUID"));
        a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountTypeWithAccountTypeIdentifier:", v65));

        if (a5)
        {
          v66 = dispatch_semaphore_create(0);
          v67 = dispatch_get_global_queue(0, 0);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          v84[0] = _NSConcreteStackBlock;
          v84[1] = 3221225472;
          v84[2] = sub_1000950BC;
          v84[3] = &unk_1000E41F0;
          v85 = v16;
          v86 = a5;
          v87 = v66;
          v69 = v66;
          dispatch_async(v68, v84);

          dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
        }

        LOBYTE(a5) = 0;
      }
    }
    else
    {
      LOBYTE(a5) = 1;
    }
    goto LABEL_56;
  }
  if (!objc_msgSend(v83, "length"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "humanReadableName"));
    v26 = MCErrorArray(CFSTR("SSO_MISSING_PRINCIPAL_NAME_P_SSO"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v27 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSSOErrorDomain, 34002, v25, MCErrorTypeFatal, v23, 0));
    v28 = (void *)v110[5];
    v110[5] = v27;

    goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "certificateUUID"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "certificateUUID"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "persistentIDForCertificateUUID:", v21));

    if (!v77)
    {
      v22 = MCErrorArray(CFSTR("SSO_BAD_CERTIFICATE_REF"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSSOErrorDomain, 34004, v23, MCErrorTypeFatal, 0));
      v25 = (void *)v110[5];
      v110[5] = v24;
LABEL_13:

      goto LABEL_44;
    }
  }
  else
  {
    v77 = 0;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "realm"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@@%@"), v83, v29));

  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v117 = v75;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Creating Kerberos SSO account for %{public}@", buf, 0xCu);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.account.kerberos.sso.%@"), v31));

  v33 = objc_alloc((Class)ACAccountType);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "humanReadableName"));
  v35 = objc_msgSend(v33, "initWithIdentifier:description:", v32, v34);

  v36 = ACCredentialTypeKerberos;
  objc_msgSend(v35, "setCredentialType:", ACCredentialTypeKerberos);
  v37 = dispatch_semaphore_create(0);
  v38 = dispatch_get_global_queue(0, 0);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094C20;
  block[3] = &unk_1000E4678;
  v71 = v16;
  v103 = v71;
  v40 = v35;
  v104 = v40;
  v41 = v15;
  v105 = v41;
  v74 = v32;
  v106 = v74;
  v108 = &v109;
  dsema = v37;
  v107 = dsema;
  dispatch_async(v39, block);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v110[5])
  {
    v42 = 2;
  }
  else
  {
    v43 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v40);
    objc_msgSend(v43, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "friendlyName"));
    objc_msgSend(v43, "setManagingSourceName:", v44);

    v73 = objc_msgSend(objc_alloc((Class)ACAccountCredential), "initWithPassword:", 0);
    objc_msgSend(v73, "setCredentialType:", v36);
    objc_msgSend(v43, "setAuthenticationType:", kAccountAuthenticationTypeKerberos);
    objc_msgSend(v43, "setCredential:", v73);
    objc_msgSend(v43, "setUsername:", v75);
    if (v77)
      objc_msgSend(v43, "setAccountProperty:forKey:", v77, CFSTR("kGSSICCertificate"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "URLPrefixMatches"));

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "URLPrefixMatches"));
      objc_msgSend(v43, "setAccountProperty:forKey:", v46, CFSTR("domains"));

    }
    else
    {
      objc_msgSend(v43, "setAccountProperty:forKey:", &off_1000ED2D8, CFSTR("domains"));
    }
    if ((_DWORD)a5)
    {
      objc_msgSend(v43, "setAccountProperty:forKey:", &__kCFBooleanTrue, CFSTR("MCAccountIsManaged"));
      if (objc_msgSend(v81, "length"))
        objc_msgSend(v43, "setAccountProperty:forKey:", v81, ACAccountPropertyPersonaIdentifier);
    }
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_100094D40;
    v96[3] = &unk_1000E46A0;
    v47 = v71;
    v97 = v47;
    a5 = v43;
    v98 = a5;
    v48 = v41;
    v99 = v48;
    v101 = &v109;
    v100 = dsema;
    v49 = objc_retainBlock(v96);
    if (objc_msgSend(v81, "length"))
      v50 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v81, v49);
    else
      ((void (*)(_QWORD *))v49[2])(v49);
    if (v110[5])
    {
      v42 = 2;
    }
    else
    {
      objc_msgSend(v47, "clearAllPermissionsGrantedForAccountType:", v40);
      v72 = a5;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "appIdentifierMatches"));
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v52; i = (char *)i + 1)
          {
            if (*(_QWORD *)v93 != v53)
              objc_enumerationMutation(v51);
            objc_msgSend(v47, "setPermissionGranted:forBundleID:onAccountType:", 1, *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i), v40);
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
        }
        while (v52);
      }

      a5 = v72;
      v55 = _MCLogObjects[0];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "humanReadableName"));
        *(_DWORD *)buf = 138543362;
        v117 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Installed Kerberos account for %{public}@", buf, 0xCu);

      }
      v42 = 0;
    }

  }
  if ((v42 | 2) == 2)
    goto LABEL_44;
LABEL_56:

  _Block_object_dispose(&v109, 8);
  return a5 & 1;
}

- (void)remove
{
  void *v3;
  void *v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  dispatch_semaphore_t v29;
  dispatch_queue_global_t global_queue;
  NSObject *v31;
  NSObject *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  dispatch_semaphore_t v40;
  dispatch_queue_global_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  dispatch_semaphore_t v49;
  _QWORD block[4];
  id v51;
  id v52;
  id v53;
  dispatch_semaphore_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kerberosInfo"));
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v12 = v4;
    v13 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
    *(_DWORD *)buf = 138543874;
    v56 = v7;
    v57 = 2114;
    v58 = v10;
    v59 = 2114;
    v60 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove SSO payload with UUID %{public}@ in profile %{public}@ (%{public}@)", buf, 0x20u);

    v3 = v13;
    v4 = v12;

  }
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "principalName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "realm"));
    *(_DWORD *)buf = 138543618;
    v56 = v18;
    v57 = 2114;
    v58 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Remove SSO payload: principal name = %{public}@, realm = %{public}@", buf, 0x16u);

  }
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountGUID"));
    *(_DWORD *)buf = 138543362;
    v56 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: looking for account with accountGUID = %{public}@", buf, 0xCu);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountGUID"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountGUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountWithIdentifier:", v25));

    v27 = _MCLogObjects[0];
    v28 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: found account to remove", buf, 2u);
      }
      v29 = dispatch_semaphore_create(0);
      global_queue = dispatch_get_global_queue(0, 0);
      v31 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000957CC;
      block[3] = &unk_1000E4130;
      v51 = v24;
      v52 = v26;
      v53 = v3;
      v54 = v29;
      v32 = v29;
      dispatch_async(v31, block);

    }
    else if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: no account found to remove", buf, 2u);
    }
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountTypeGUID"));
      *(_DWORD *)buf = 138543362;
      v56 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: looking for account type with accountTypeGUID = %{public}@", buf, 0xCu);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountTypeGUID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountTypeWithAccountTypeIdentifier:", v36));

    v38 = _MCLogObjects[0];
    v39 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: found account type to remove", buf, 2u);
      }
      v40 = dispatch_semaphore_create(0);
      v41 = dispatch_get_global_queue(0, 0);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10009598C;
      v45[3] = &unk_1000E4130;
      v46 = v24;
      v47 = v37;
      v48 = v3;
      v49 = v40;
      v43 = v40;
      dispatch_async(v42, v45);

    }
    else if (v39)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Remove SSO payload: no account type found to remove", buf, 2u);
    }

  }
}

@end
