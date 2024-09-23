@implementation MCGmailAccountPayloadHandler

- (MCGmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCGmailAccountPayloadHandler;
  return -[MCNewPayloadHandler initWithPayload:profileHandler:](&v5, "initWithPayload:profileHandler:", a3, a4);
}

- (id)unhashedAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "emailAddress"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("google|%@"), v3));
  else
    v4 = 0;

  return v4;
}

- (id)MCACAccountIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler unhashedAccountIdentifier](self, "unhashedAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "MCHashedIdentifier"));

  return v3;
}

- (id)accountDictionaryWithIsInstalledByMDM:(BOOL)a3 personaID:(id)a4 rmAccountIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddress"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountDescription"));
    v26 = v8;
    if (!objc_msgSend(v12, "length"))
    {
      v13 = v11;

      v12 = v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountName"));
    v15 = objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler unhashedAccountIdentifier](self, "unhashedAccountIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));
    v25 = (void *)v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), v15, v17));

    v27[0] = MFMailAccountDescription;
    v27[1] = MFMailAccountUsername;
    v28[0] = v12;
    v28[1] = v11;
    v28[2] = v18;
    v27[2] = MailAccountManagedTag;
    v27[3] = CFSTR("MCAccountIsManaged");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    v27[4] = MailAccountSSLEnabled;
    v28[3] = v19;
    v28[4] = &__kCFBooleanTrue;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 5));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v20));

    if (objc_msgSend(v14, "length"))
      objc_msgSend(v21, "setObject:forKey:", v14, MailAccountFullUserName);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "communicationServiceRules"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "communicationServiceRules"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, kMCCommunicationServiceRulesAccountProperty);

    }
    v8 = v26;
    if (objc_msgSend(v26, "length"))
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, ACAccountPropertyPersonaIdentifier);
    if (v9)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, ACAccountPropertyRemoteManagingAccountIdentifier);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_installWithAccountDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = +[GmailAccount newAccountWithDictionary:](GmailAccount, "newAccountWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentAccount"));
  objc_msgSend(v7, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "friendlyName"));
  objc_msgSend(v7, "setManagingSourceName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  LODWORD(v9) = objc_msgSend(v10, "userMode");

  if ((_DWORD)v9 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler MCACAccountIdentifier](self, "MCACAccountIdentifier"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      objc_msgSend(v7, "setAccountProperty:forKey:", v12, CFSTR("MCAccountIdentifer"));

      objc_msgSend(v7, "setIdentifier:", v11);
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
  objc_msgSend(v7, "setMcPayloadUUID:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "profile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
  objc_msgSend(v7, "setMcProfileUUID:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));

  if (v20)
  {
    objc_msgSend(v7, "setMcConfigurationProfileIdentifier:", v20);
  }
  else
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on Google account.", buf, 2u);
    }
  }
  objc_msgSend(v7, "setAccountProperty:forKey:", &__kCFBooleanFalse, ACAccountPropertyShouldNeverUseSyncableCredential);
  if (v6)
  {
    objc_msgSend(v6, "savePersistentAccount");
    v22 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", MFMailAccountUsername));
    v24 = MCGoogleErrorDomain;
    v25 = MCErrorArray(CFSTR("ERROR_GOOGLE_CANNOT_CREATE_ACCOUNT_P_EMAIL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 47000, v26, MCErrorTypeFatal, v23, 0));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentAccount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_msgSend(v29, "setAcAccountIdentifier:", v28);

  return v22;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;

  v41 = a3;
  v9 = a4;
  v42 = a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_100081160;
  v51 = sub_100081170;
  v52 = 0;
  v43 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!(_DWORD)v11)
  {
    v15 = 0;
    goto LABEL_5;
  }
  v12 = kMDMPersonaKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMDMPersonaKey));
  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v12));
  else
    v15 = 0;

  v17 = kMCInstallProfileOptionManagingProfileIdentifier;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
  v19 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v16 = 0;
    goto LABEL_11;
  }
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v17));

  if (!v20)
  {
LABEL_5:
    v16 = 0;
    goto LABEL_12;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v20));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  v18 = (void *)v20;
LABEL_11:

LABEL_12:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:](self, "accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:", v11, v15, v16));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", MailAccountManagedTag));
  if (v24)
  {
    if (objc_msgSend(v15, "length"))
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100081178;
      v44[3] = &unk_1000E3F28;
      v46 = &v47;
      v44[4] = self;
      v45 = v24;
      v26 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v15, v44);

    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler _installWithAccountDictionary:](self, "_installWithAccountDictionary:", v24));
      v34 = (void *)v48[5];
      v48[5] = v33;

    }
    if (!v48[5])
      objc_msgSend(v23, "setPersistentResourceID:", v25);
  }
  else
  {
    v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not create Google account description", buf, 2u);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "emailAddress"));
    v29 = MCErrorArray(CFSTR("ERROR_GOOGLE_CANNOT_CREATE_ACCOUNT_P_EMAIL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCGoogleErrorDomain, 47000, v30, MCErrorTypeFatal, v28, 0, v41));
    v32 = (void *)v48[5];
    v48[5] = v31;

  }
  v35 = v48[5];
  if (v35)
  {
    v36 = _MCLogObjects[0];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "friendlyName"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "MCVerboseDescription"));
      *(_DWORD *)buf = 138543618;
      v54 = v38;
      v55 = 2114;
      v56 = v39;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Could not install Google payload %{public}@. Error: %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v47, 8);
  return v35 == 0;
}

- (BOOL)isInstalled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentResourceID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierGmail));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsWithAccountType:", v5));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "accountPropertyForKey:", v10, (_QWORD)v16));
          v13 = v12;
          if (v12 && (objc_msgSend(v12, "isEqualToString:", v3) & 1) != 0)
          {

            v14 = 1;
            goto LABEL_14;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_remove
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentResourceID"));

  if (v3)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierGmail));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountsWithAccountType:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      v10 = MailAccountManagedTag;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", v10));
          v14 = v13;
          if (v13 && objc_msgSend(v13, "isEqualToString:", v3))
            objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v8);
    }
    v30 = v3;
    v28 = v6;

    v15 = dispatch_group_create();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v5;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    v17 = v31;
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v37;
      v20 = MailAccountManagedTag;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accountPropertyForKey:", v20));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("|")));
          if ((unint64_t)objc_msgSend(v24, "count") < 2)
          {
            v26 = 0;
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", 1));
            if (objc_msgSend(v25, "length"))
              v26 = v25;
            else
              v26 = 0;

            v17 = v31;
          }
          dispatch_group_enter(v15);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000816D4;
          v33[3] = &unk_1000E3E90;
          v34 = v26;
          v35 = v15;
          v27 = v26;
          objc_msgSend(v17, "removeAccount:withCompletionHandler:", v22, v33);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v18);
    }

    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v3 = v30;
  }

}

- (void)remove
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (v4)
    -[MCGmailAccountPayloadHandler setSetAsideAccountDictionary:](self, "setSetAsideAccountDictionary:", 0);
  else
    -[MCGmailAccountPayloadHandler _remove](self, "_remove");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_msgSend(v5, "setPersistentResourceID:", 0);

}

- (void)setAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierGmail));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsWithAccountType:", v6));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v19 = v6;
      v9 = *(_QWORD *)v21;
      v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", v10));
          v14 = v13;
          if (v13 && objc_msgSend(v13, "isEqualToString:", v4))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", CFSTR("MCAccountIsManaged")));
            v16 = objc_msgSend(v17, "BOOLValue");

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", ACAccountPropertyPersonaIdentifier));
            v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", ACAccountPropertyRemoteManagingAccountIdentifier));

            goto LABEL_13;
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
      v15 = 0;
      v16 = 0;
LABEL_13:
      v6 = v19;
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:](self, "accountDictionaryWithIsInstalledByMDM:personaID:rmAccountIdentifier:", v16, v15, v8));
    -[MCGmailAccountPayloadHandler setSetAsideAccountDictionary:](self, "setSetAsideAccountDictionary:", v18);

    -[MCGmailAccountPayloadHandler _remove](self, "_remove");
  }

}

- (void)unsetAside
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler setAsideAccountDictionary](self, "setAsideAccountDictionary"));

  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MCGmailAccountPayloadHandler setAsideAccountDictionary](self, "setAsideAccountDictionary"));
    v4 = -[MCGmailAccountPayloadHandler _installWithAccountDictionary:](self, "_installWithAccountDictionary:", v5);

  }
}

- (NSDictionary)setAsideAccountDictionary
{
  return self->_setAsideAccountDictionary;
}

- (void)setSetAsideAccountDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideAccountDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideAccountDictionary, 0);
}

@end
