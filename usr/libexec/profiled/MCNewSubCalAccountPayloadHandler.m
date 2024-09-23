@implementation MCNewSubCalAccountPayloadHandler

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
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("subcal|%@"), v3));
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

- (id)_accountFromPayload
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t v51[16];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = ((uint64_t (*)(void))sharedDAAccountStore)();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierSubscribedCalendar));

  v7 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v6);
  objc_msgSend(v7, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "friendlyName"));
  objc_msgSend(v7, "setManagingSourceName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v10 = objc_msgSend(v9, "userMode");

  if (v10 == 1)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler MCACAccountIdentifier](self, "MCACAccountIdentifier"));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      objc_msgSend(v7, "setAccountProperty:forKey:", v13, CFSTR("MCAccountIdentifer"));

      v11 = objc_msgSend(v7, "setIdentifier:", v12);
    }
    v14 = sharedDAAccountStore(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountWithIdentifier:", v16));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectID"));
      objc_msgSend(v7, "performSelector:withObject:", "_setObjectID:", v18);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supportedDataclasses"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v7, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v21);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v7));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "setEnabled:forDADataclass:", 1, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "password"));
    v27 = &__kCFBooleanTrue;
    if (!v26)
      v27 = &__kCFBooleanFalse;
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAccountInfo"));
    objc_msgSend(v29, "setAccountProperty:forKey:", v28, ACAccountPropertyShouldNeverUseSyncableCredential);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountDescription"));
    if (v30)
    {
      objc_msgSend(v25, "setAccountDescription:", v30);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostname"));
      objc_msgSend(v25, "setAccountDescription:", v31);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostname"));
    objc_msgSend(v25, "setHost:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));
    objc_msgSend(v25, "setUsername:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "password"));
    objc_msgSend(v25, "setPassword:", v34);

    objc_msgSend(v25, "setUseSSL:", objc_msgSend(v3, "useSSL"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAccountInfo"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUID"));
    objc_msgSend(v35, "setMcPayloadUUID:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAccountInfo"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "profile"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "UUID"));
    objc_msgSend(v38, "setMcProfileUUID:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "profile"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifier"));

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAccountInfo"));
      objc_msgSend(v45, "setMcConfigurationProfileIdentifier:", v44);

    }
    else
    {
      v46 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on subscribed calendar.", v51, 2u);
      }
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backingAccountInfo"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    objc_msgSend(v49, "setAcAccountIdentifier:", v48);

  }
  return v25;
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
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSubCalAccountPayloadHandler _accountFromPayload](self, "_accountFromPayload"));
    v16 = v15;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = sub_100060940;
    v62 = sub_100060950;
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
      v55 = sub_100060940;
      v56 = sub_100060950;
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
      v47[2] = sub_100060958;
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
        v43[2] = sub_100060974;
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
        v37 = MCErrorArray(CFSTR("SUBCAL_ACCT_NOT_UNIQUE"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSubCalErrorDomain, 16002, v38, MCErrorTypeFatal, 0));
        v40 = objc_msgSend(v39, "MCCopyAsPrimaryError");
        v41 = (void *)v59[5];
        v59[5] = (uint64_t)v40;

      }
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);

    }
    else
    {
      v33 = MCErrorArray(CFSTR("SUBCAL_ACCT_CREATION_FAILED"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSubCalErrorDomain, 16000, v34, MCErrorTypeFatal, 0));
      v36 = (void *)v59[5];
      v59[5] = v35;

    }
    v32 = (id)v59[5];
    _Block_object_dispose(&v58, 8);

  }
  else
  {
    v29 = MCSubCalErrorDomain;
    v30 = MCErrorArray(CFSTR("SUBCAL_ACCT_NO_HOST_NAME"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 16001, v31, MCErrorTypeFatal, 0));

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
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSubCalAccountPayloadHandler _reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:](self, "_reallyInstallInstaller:isInstalledByMDM:personaID:rmAccountIdentifier:", v9, v12, v16, v17));
  v25 = v24;
  if (a6 && v24)
    *a6 = objc_retainAutorelease(v24);

  return v25 == 0;
}

- (id)accountTypeIdentifiers
{
  uint64_t v3;

  v3 = ACAccountTypeIdentifierSubscribedCalendar;
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
  v10.super_class = (Class)MCNewSubCalAccountPayloadHandler;
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
        v16[2] = sub_100061014;
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

@end
