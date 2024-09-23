@implementation REMAppleAccountUtilities

- (id)applicationDocumentsURLForAccountIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  REMAppleAccountUtilities *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  uint64_t v35;

  v4 = a3;
  if (+[RDPaths isDataSeparationEnabled](RDPaths, "isDataSeparationEnabled"))
  {
    v5 = (__CFString *)v4;
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = CFSTR("___REMAccountIdentifier_NIL___");
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_10001DC08;
    v28 = sub_10001DC18;
    v29 = 0;
    if (qword_100852660 != -1)
      dispatch_once(&qword_100852660, &stru_1007D7A80);
    v8 = (id)qword_100852658;
    objc_sync_enter(v8);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100852658, "objectForKeyedSubscript:", v7));
    v10 = (void *)v25[5];
    v25[5] = v9;

    if (v25[5])
    {
      v11 = 1;
    }
    else
    {
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_10001DC48;
      v19 = &unk_1007D7AA8;
      v23 = &v24;
      v20 = self;
      v21 = v6;
      v22 = v7;
      -[REMAppleAccountUtilities performBlockInPersonaContextForAccountIdentifier:block:](self, "performBlockInPersonaContextForAccountIdentifier:block:", v21, &v16);

      v11 = 0;
    }
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog utility](REMLog, "utility", v16, v17, v18, v19, v20));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v25[5];
      *(_DWORD *)buf = 67109634;
      v31 = v11;
      v32 = 2114;
      v33 = v6;
      v34 = 2114;
      v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "applicationDocumentsURLForAccountIdentifier: Look up result {cacheHit: %d, accountIdentifier: %{public}@, applicationDocumentsURL: %{public}@}", buf, 0x1Cu);
    }

    objc_sync_exit(v8);
    v12 = (id)v25[5];
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  }

  return v12;
}

- (id)reminderDataContainerURLForAccountIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMAppleAccountUtilities applicationDocumentsURLForAccountIdentifier:](self, "applicationDocumentsURLForAccountIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:", v3));

  return v4;
}

- (id)_applicationDocumentsURLForPersonaIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths URLForGroupContainerWithIdentifier:](REMPaths, "URLForGroupContainerWithIdentifier:", REMAppGroupBundleIdentifier));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog utility](REMLog, "utility"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100678E48((uint64_t)v5, (uint64_t)v6, v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMPaths legacy_applicationDocumentsURL](REMPaths, "legacy_applicationDocumentsURL"));
  }

  return v7;
}

- (id)unsafeUntilSystemReady_allICloudAccountsWithCloudKitEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMAppleAccountUtilities accountStore](self, "accountStore", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMAppleAccountUtilities accountStore](self, "accountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierCloudKit));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsWithAccountType:", v6));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "displayAccount"));
        objc_msgSend(v3, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)status
{
  void *v3;
  void *i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  REMAppleAccountUtilities *v47;
  uint64_t v48;
  id v49;
  unsigned int v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v47 = self;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[REMAppleAccountUtilities unsafeUntilSystemReady_allICloudACAccounts](self, "unsafeUntilSystemReady_allICloudACAccounts"));
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v54;
    v46 = REMACAccountPropertyDidChooseToMigrate;
    v45 = REMACAccountPropertyDidFinishMigration;
    v43 = ACAccountPropertyPersonaIdentifier;
    v44 = kAccountDataclassReminders;
    v42 = AAAccountClassBasic;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v48)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        if (v6)
        {
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v46));
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v45));
          v9 = objc_msgSend(v5, "rem_isManagedAppleID");
          v50 = objc_msgSend(v5, "isEnabledForDataclass:", v44);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDebugName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.description"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_accountClass"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.aa_accountClass"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.aa_personID"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_altDSID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.aa_altDSID"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);

          v52 = (void *)v7;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.didChooseToMigrate"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v19);

          v51 = (void *)v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v8));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.didFinishMigration"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v9));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.isManagedAppleID"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v50));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.isEnabledForDataclass"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, v25);

          v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountPropertyForKey:", v43));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[REMAppleAccountUtilities applicationDocumentsURLForAccountIdentifier:](v47, "applicationDocumentsURLForAccountIdentifier:", v27));

          if (v26)
            v29 = v26;
          else
            v29 = CFSTR("NIL");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.personaIdentifier"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "absoluteString"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.applicationDocumentsURL"), v6));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, v33);

          if ((objc_msgSend(v5, "aa_isAccountClass:", v42) & 1) == 0)
          {
            v34 = objc_msgSend(v5, "rem_eligibleForAutoCloudKitMigration");
            v35 = objc_msgSend(v5, "rem_isEligibleForCloudKitReminders");
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v34));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.eligibleForAutoCloudKitMigration"), v6));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, v37);

            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35));
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.isEligibleForCloudKitReminders"), v6));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, v39);

          }
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v49);
  }

  return v3;
}

- (void)_unsetMigrationFlagsWithACAccount:(id)a3 inStore:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog utility](REMLog, "utility"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10068390C(v7, v10);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, REMACAccountPropertyDidChooseToMigrate);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, REMACAccountPropertyDidFinishMigration);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007D70C;
  v13[3] = &unk_1007DA558;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v9, "saveAccount:withCompletionHandler:", v12, v13);

}

@end
