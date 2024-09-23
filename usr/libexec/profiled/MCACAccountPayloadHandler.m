@implementation MCACAccountPayloadHandler

- (id)installedAccountWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler accountTypeIdentifiers](self, "accountTypeIdentifiers"));
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v22)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
      v7 = sharedDAAccountStore();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", v6));

      v10 = sharedDAAccountStore();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountsWithAccountType:", v9));

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
            v19 = objc_msgSend(v18, "isEqualToString:", v4);

            if (v19)
            {
              v14 = v17;
              goto LABEL_16;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_16:

      if (v14)
        break;
      if ((id)++v5 == v23)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v23)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v14 = 0;
  }

  return v14;
}

- (void)markIfUpdatingOverInstalledAccount:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v5 = objc_msgSend(v4, "userMode");

  v6 = v9;
  if (v5 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler installedAccountWithIdentifier:](self, "installedAccountWithIdentifier:", v7));

    if (v8)
      -[MCACAccountPayloadHandler setUpdatedOverInstalledAccount:](self, "setUpdatedOverInstalledAccount:", 1);

    v6 = v9;
  }

}

- (id)_destructiveDataclassActionsForRemovalOfAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  NSObject *v24;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;

  v3 = a3;
  v4 = sharedDAAccountStore();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataclassActionsForAccountDeletion:", v3));

  v7 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ACAccountStore returned the following actions for removal: %{public}@", buf, 0xCu);
  }
  if (v6)
  {
    v26 = v3;
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v29 = v8;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      v27 = *(_QWORD *)v35;
      v28 = v9;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v14));
          if (objc_msgSend(v15, "count") == (id)1)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
            objc_msgSend(v8, "setObject:forKey:", v16, v14);

          }
          else if ((unint64_t)objc_msgSend(v15, "count") < 2)
          {
            v24 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v41 = v14;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to get possible actions for dataclass %{public}@ during account removal.", buf, 0xCu);
            }
          }
          else
          {
            v17 = v6;
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v18 = v15;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v31;
              while (2)
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v31 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v23, "isDestructive"))
                  {
                    v8 = v29;
                    objc_msgSend(v29, "setObject:forKey:", v23, v14);

                    v6 = v17;
                    goto LABEL_24;
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                if (v20)
                  continue;
                break;
              }
            }

            v6 = v17;
            v8 = v29;
LABEL_24:
            v12 = v27;
            v9 = v28;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    v3 = v26;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)_synchronouslyDeleteAccountAndAssociatedData:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _destructiveDataclassActionsForRemovalOfAccount:](self, "_destructiveDataclassActionsForRemovalOfAccount:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting to remove account with identifier: %{public}@", buf, 0xCu);
  }
  v13 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(17, 0);
  v15 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F358;
  block[3] = &unk_1000E2E98;
  v16 = v8;
  v24 = v16;
  v17 = v10;
  v25 = v17;
  v18 = v11;
  v26 = v18;
  v19 = v9;
  v28 = v19;
  v20 = v13;
  v27 = v20;
  dispatch_async(v15, block);

  v21 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  if (dispatch_semaphore_wait(v20, v21))
  {
    v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Timed out waiting on removing account with identifier: %{public}@", buf, 0xCu);
    }
  }

}

- (id)_installedDAAccount
{
  void *v2;
  MCACAccountPayloadHandler *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
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
  id v26;
  void *v27;
  id obj;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  MCACAccountPayloadHandler *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = self;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler accountTypeIdentifiers](self, "accountTypeIdentifiers"));
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (!v31)
  {
LABEL_29:

    v26 = 0;
    v27 = 0;
    goto LABEL_31;
  }
  v30 = *(_QWORD *)v51;
  v34 = v3;
LABEL_3:
  v4 = 0;
  while (2)
  {
    if (*(_QWORD *)v51 != v30)
      objc_enumerationMutation(obj);
    v5 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v4);
    v6 = sharedDAAccountStore();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", v5));

    v9 = sharedDAAccountStore();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountsWithAccountType:", v8));

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v11;
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (!v37)
    {
      v26 = 0;
      goto LABEL_26;
    }
    v32 = v8;
    v33 = v4;
    v12 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v35);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcProfileUUID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v3, "payload"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "profile"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
        v43 = objc_msgSend(v15, "isEqualToString:");
        if (v43)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcPayloadUUID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v3, "payload"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUID"));
          if ((objc_msgSend(v2, "isEqualToString:") & 1) != 0)
          {
            v44 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
        v40 = v17;
        v41 = v16;
        v42 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcConfigurationProfileIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v3, "payload"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "profile"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
        v22 = v18;
        if (objc_msgSend(v18, "isEqualToString:", v21))
        {
          v36 = v2;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcAccountIdentifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v3, "payload"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
          v44 = objc_msgSend(v23, "isEqualToString:", v25);

          v3 = v34;
          v2 = v36;
        }
        else
        {
          v44 = 0;
        }

        v15 = v42;
        v17 = v40;
        v16 = v41;
        if (v43)
          goto LABEL_18;
LABEL_19:

        if (v44)
        {
          v26 = v14;
          goto LABEL_24;
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v37)
        continue;
      break;
    }
    v26 = 0;
LABEL_24:
    v8 = v32;
    v4 = v33;
LABEL_26:

    if (!v26)
    {
      if ((id)++v4 != v31)
        continue;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (!v31)
        goto LABEL_29;
      goto LABEL_3;
    }
    break;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v26));
LABEL_31:

  return v27;
}

- (id)accountTypeIdentifiers
{
  return 0;
}

- (id)unhashedAccountIdentifier
{
  return 0;
}

- (id)MCACAccountIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler unhashedAccountIdentifier](self, "unhashedAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "MCHashedIdentifier"));

  return v3;
}

- (id)installedACAccounts
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
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
  MCACAccountPayloadHandler *v26;
  void *v27;
  id v28;
  id obj;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler accountTypeIdentifiers](self, "accountTypeIdentifiers"));
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v53;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(obj);
        v34 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v4);
        v6 = sharedDAAccountStore();
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", v5));

        v9 = sharedDAAccountStore();
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v33 = (void *)v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountsWithAccountType:", v8));

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v37 = v11;
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v39)
        {
          v12 = *(_QWORD *)v49;
          v35 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(_QWORD *)v49 != v12)
                objc_enumerationMutation(v37);
              v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcProfileUUID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "profile"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
              v45 = objc_msgSend(v15, "isEqualToString:");
              if (v45
                && (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcPayloadUUID")),
                    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload")),
                    v40 = v18,
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID")),
                    (objc_msgSend(v18, "isEqualToString:") & 1) != 0))
              {
                v46 = 1;
              }
              else
              {
                v42 = v17;
                v43 = v16;
                v44 = v15;
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcConfigurationProfileIdentifier"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profile"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
                v23 = v19;
                if (objc_msgSend(v19, "isEqualToString:", v22))
                {
                  v38 = v2;
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mcAccountIdentifier"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
                  v26 = self;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
                  v46 = objc_msgSend(v24, "isEqualToString:", v27);

                  self = v26;
                  v12 = v35;

                  v2 = v38;
                }
                else
                {
                  v46 = 0;
                }

                v15 = v44;
                v17 = v42;
                v16 = v43;
                if (!v45)
                  goto LABEL_19;
              }

LABEL_19:
              if (v46)
                objc_msgSend(v36, "addObject:", v14);
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v39);
        }

        v4 = v34 + 1;
      }
      while ((id)(v34 + 1) != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v32);
  }

  v28 = objc_msgSend(v36, "copy");
  return v28;
}

- (id)_installedSetAsideACAccount
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  BOOL v25;
  void *v27;
  id obj;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  MCACAccountPayloadHandler *v34;
  unsigned int v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v35 = objc_msgSend(v3, "userMode");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mcAccountIdentifier"));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler accountTypeIdentifiers](self, "accountTypeIdentifiers"));
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v46;
    v34 = self;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v30)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v5);
      v7 = sharedDAAccountStore();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", v6));

      v10 = sharedDAAccountStore();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountsWithAccountType:", v9));

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v38 = v12;
      v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v13)
      {
        v32 = v9;
        v33 = v5;
        v14 = *(_QWORD *)v42;
        v36 = *(_QWORD *)v42;
        do
        {
          v15 = 0;
          v37 = v13;
          do
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(v38);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mcProfileUUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
            if (objc_msgSend(v17, "isEqualToString:", v20))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mcPayloadUUID"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUID"));
              v40 = v21;
              v24 = objc_msgSend(v21, "isEqualToString:", v23);
              if (v24)
                v25 = v35 == 1;
              else
                v25 = 0;
              if (v25 && v39 != 0)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mcAccountIdentifier"));
                v24 = objc_msgSend(v27, "isEqualToString:", v39);

                self = v34;
              }

              v14 = v36;
              v13 = v37;
              if (v24)
              {
                v13 = v16;
                goto LABEL_25;
              }
            }
            else
            {

            }
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v13);
LABEL_25:
        v9 = v32;
        v5 = v33;
      }

      if (v13)
        break;
      if ((id)++v5 == v31)
      {
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v31)
          goto LABEL_3;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    v13 = 0;
  }

  return v13;
}

- (ACAccount)setAsideAccount
{
  return self->_setAsideAccount;
}

- (void)setSetAsideAccount:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideAccount, a3);
}

- (BOOL)updatedOverInstalledAccount
{
  return self->_updatedOverInstalledAccount;
}

- (void)setUpdatedOverInstalledAccount:(BOOL)a3
{
  self->_updatedOverInstalledAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideAccount, 0);
}

@end
