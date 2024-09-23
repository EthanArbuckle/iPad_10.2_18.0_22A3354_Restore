@implementation POUserGroupManager

- (POUserGroupManager)initWithFilePath:(id)a3
{
  id v5;
  POUserGroupManager *v6;
  POUserGroupManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POUserGroupManager;
  v6 = -[POUserGroupManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_filePath, a3);

  return v7;
}

- (id)getAllUsersWithError:(id *)a3
{
  NSObject *v5;
  POUserGroupManager *v6;
  void *v7;
  void *v8;

  PO_LOG_POUserGroupManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POUserGroupManager getAllUsersWithError:].cold.1((uint64_t)self, v5);

  v6 = self;
  objc_sync_enter(v6);
  -[POUserGroupManager loadUsers_lockedWithError:](v6, "loadUsers_lockedWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_sync_exit(v6);
  return v8;
}

- (id)findUser:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  POUserGroupManager *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_POUserGroupManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POUserGroupManager findUser:withError:].cold.1();

  v8 = self;
  objc_sync_enter(v8);
  -[POUserGroupManager loadUsers_lockedWithError:](v8, "loadUsers_lockedWithError:", a4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "loginUserName", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v6))
        {

LABEL_15:
          v17 = v13;
          goto LABEL_16;
        }
        objc_msgSend(v13, "uniqueIdpIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
          goto LABEL_15;
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_16:

  objc_sync_exit(v8);
  return v17;
}

- (id)createOrUpdateUser:(id)a3 withError:(id *)a4
{
  uint64_t v4;
  NSObject *v6;
  POUserGroupManager *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  POMutableUser *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  POMutableUser *v38;
  id v39;
  id v40;
  id v41;
  POUserGroupManager *v43;
  uint64_t v45;
  uint64_t v46;
  id obj;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  PO_LOG_POUserGroupManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POUserGroupManager createOrUpdateUser:withError:].cold.2(v50, (uint64_t)self, v6);

  v7 = self;
  objc_sync_enter(v7);
  v43 = v7;
  -[POUserGroupManager loadUsers_lockedWithError:](v7, "loadUsers_lockedWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v13)
  {
    v46 = *(_QWORD *)v54;
LABEL_8:
    v45 = v13;
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v46)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v14);
      objc_msgSend(v15, "loginUserName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "loginUserName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v49, "isEqualToString:", v48) & 1) != 0)
        break;
      objc_msgSend(v15, "generatedUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "generatedUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v17) & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v15, "uniqueIdpIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "uniqueIdpIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v8) & 1) != 0)
      {

LABEL_22:
        break;
      }
      objc_msgSend(v15, "altSecurityIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v15, "altSecurityIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "altSecurityIdentity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v20, "isEqualToString:", v21);

        if ((v4 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
      if (v45 == ++v14)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v13)
          goto LABEL_8;
        goto LABEL_20;
      }
    }

LABEL_24:
    v22 = v15;

    if (!v22)
      goto LABEL_26;
    v23 = (POMutableUser *)objc_msgSend(v22, "mutableCopy");
    v24 = 0;
  }
  else
  {
LABEL_20:

LABEL_26:
    v23 = objc_alloc_init(POMutableUser);
    v22 = 0;
    v24 = 1;
  }
  objc_msgSend(v50, "loginUserName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableUser setLoginUserName:](v23, "setLoginUserName:", v25);

  -[POUser generatedUUID](v23, "generatedUUID");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
  {
    v28 = 0;
    v29 = (void *)v26;
  }
  else
  {
    objc_msgSend(v50, "generatedUUID");
    v30 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v30;
    if (v30)
    {
      v28 = 0;
      v29 = (void *)v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v28 = 1;
    }
  }
  -[POMutableUser setGeneratedUUID:](v23, "setGeneratedUUID:", v29);
  if (v28)
  {

  }
  if (!v27)

  objc_msgSend(v50, "uniqueIdpIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableUser setUniqueIdpIdentifier:](v23, "setUniqueIdpIdentifier:", v31);

  objc_msgSend(v50, "altSecurityIdentity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableUser setAltSecurityIdentity:](v23, "setAltSecurityIdentity:", v32);

  objc_msgSend(v50, "uid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
  {
    -[POUserGroupManager _nextAvailableUserId:](v43, "_nextAvailableUserId:", obj);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[POMutableUser setUid:](v23, "setUid:", v34);
  if (!v33)

  if ((v24 & 1) == 0)
    objc_msgSend(obj, "removeObject:", v22);
  v35 = -[POUser copy](v23, "copy");
  objc_msgSend(obj, "addObject:", v35);

  if (-[POUserGroupManager saveUsers_locked:withError:](v43, "saveUsers_locked:withError:", obj, a4))
  {
    PO_LOG_POUserGroupManager();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      -[POUser generatedUUID](v23, "generatedUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[POUserGroupManager createOrUpdateUser:withError:].cold.1(v37, buf, v36);
    }

    v38 = v23;
  }
  else
  {
    if (a4)
    {
      v39 = *a4;
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke;
      v51[3] = &unk_24EC025A0;
      v40 = v39;
      v52 = v40;
      __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke((uint64_t)v51);
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v41;

    }
    v38 = 0;
  }

  objc_sync_exit(v43);
  return v38;
}

id __51__POUserGroupManager_createOrUpdateUser_withError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to create new create or update user."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserGroupManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (id)_nextAvailableUserId:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = 9999;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "uid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "uid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          if (v12 > v7)
            v7 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 9999;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v7 + 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)removeUserWithName:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  POUserGroupManager *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PO_LOG_POUserGroupManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POUserGroupManager removeUserWithName:withError:].cold.1();

  v7 = self;
  objc_sync_enter(v7);
  -[POUserGroupManager loadUsers_lockedWithError:](v7, "loadUsers_lockedWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "loginUserName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v5);

        if (v19)
        {
          objc_msgSend(v12, "removeObject:", v17);
          goto LABEL_16;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_16:

  -[POUserGroupManager saveUsers_locked:withError:](v7, "saveUsers_locked:withError:", v12, a4);
  objc_sync_exit(v7);

  return 1;
}

- (id)loadUsers_lockedWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  POUser *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  -[POUserGroupManager filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.users.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    v9 = v8;
    if (v7)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v7;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v12)
      {
        v13 = v12;
        v20 = v5;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = -[_POJWTBodyBase initWithDictionary:]([POUser alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        }
        while (v13);
        v5 = v20;
      }
    }
    else
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke;
      v25[3] = &unk_24EC025A0;
      v26 = v8;
      __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke((uint64_t)v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a3)
        *a3 = objc_retainAutorelease(v17);

      v10 = 0;
      v11 = v26;
    }

  }
  else
  {
    PO_LOG_POUserGroupManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POUserGroupManager loadUsers_lockedWithError:].cold.1(v9);
    v10 = 0;
  }

  return v10;
}

id __48__POUserGroupManager_loadUsers_lockedWithError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to load users"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserGroupManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (BOOL)saveUsers_locked:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  BOOL v21;
  id *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    *a4 = 0;
  -[POUserGroupManager filePath](self, "filePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.users.txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "allData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  v30 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 3, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  v18 = v17;
  if (!v16)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __49__POUserGroupManager_saveUsers_locked_withError___block_invoke;
    v28[3] = &unk_24EC025A0;
    v22 = &v29;
    v20 = v17;
    v29 = v20;
    __49__POUserGroupManager_saveUsers_locked_withError___block_invoke((uint64_t)v28);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
    {
LABEL_15:

      v21 = 0;
      goto LABEL_16;
    }
LABEL_14:
    v23 = objc_retainAutorelease(v23);
    *a4 = v23;
    goto LABEL_15;
  }
  v27 = v17;
  v19 = objc_msgSend(v16, "writeToURL:options:error:", v8, 268435457, &v27);
  v20 = v27;

  if ((v19 & 1) == 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_17;
    v25[3] = &unk_24EC025A0;
    v22 = &v26;
    v20 = v20;
    v26 = v20;
    __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_17((uint64_t)v25);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  v21 = 1;
LABEL_16:

  return v21;
}

id __49__POUserGroupManager_saveUsers_locked_withError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to serialize users"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserGroupManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __49__POUserGroupManager_saveUsers_locked_withError___block_invoke_17(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to write users to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserGroupManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)getAllUsersWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POUserGroupManager getAllUsersWithError:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)findUser:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22307D000, v0, v1, "%s name=%{public}@ on %@", v2);
}

- (void)createOrUpdateUser:(os_log_t)log withError:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "New user created: %{public}@", buf, 0xCu);

}

- (void)createOrUpdateUser:(NSObject *)a3 withError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdpIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "-[POUserGroupManager createOrUpdateUser:withError:]";
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2112;
  v15 = a2;
  _os_log_debug_impl(&dword_22307D000, a3, OS_LOG_TYPE_DEBUG, "%s user=%{public}@, uniqueIdentifier=%{public}@, on %@", (uint8_t *)&v8, 0x2Au);

}

- (void)removeUserWithName:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22307D000, v0, v1, "%s name=%{public}@ on %@", v2);
}

- (void)loadUsers_lockedWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "User data not found", v1, 2u);
}

@end
