@implementation RMStoreProfilesAdapter

- (RMStoreProfilesAdapter)initWithScope:(int64_t)a3
{
  RMStoreProfilesAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMStoreProfilesAdapter;
  result = -[RMStoreProfilesAdapter init](&v5, sel_init);
  if (result)
    result->_isSystemScope = a3 == 1;
  return result;
}

- (id)allProfileIdentifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RMStoreProfilesAdapter isSystemScope](self, "isSystemScope"))
    v4 = 19;
  else
    v4 = 9;
  objc_msgSend(v3, "installedProfileIdentifiersWithFilterFlags:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter allProfileIdentifiers].cold.1();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)installedProfileIdentifierByDeclarationKey
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RMStoreProfilesAdapter isSystemScope](self, "isSystemScope"))
    v4 = 19;
  else
    v4 = 9;
  objc_msgSend(v3, "installedProfileIdentifiersWithFilterFlags:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x24952F49C](v8);
        -[RMStoreProfilesAdapter _profileForIdentifier:rmOnly:](self, "_profileForIdentifier:rmOnly:", v12, 1, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RMStoreProfilesAdapter _declarationKeyForProfile:](self, "_declarationKeyForProfile:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v15);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v8;
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter installedProfileIdentifierByDeclarationKey].cold.1();

  return v6;
}

- (id)profileNameForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[RMStoreProfilesAdapter _profileForIdentifier:rmOnly:](self, "_profileForIdentifier:rmOnly:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)installProfileData:(id)a3 store:(id)a4 declarationKey:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  unsigned __int8 v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  v23 = 0;
  v22 = 0;
  v14 = -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:](self, "_canInstallProfile:store:declarationKey:outAssumeOwnership:error:", v10, v11, v12, &v23, &v22);
  v15 = v22;
  if (v14)
  {
    -[RMStoreProfilesAdapter _installOptionsForStore:declarationKey:assumeOwnership:](self, "_installOptionsForStore:declarationKey:assumeOwnership:", v11, v12, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    -[RMStoreProfilesAdapter _installProfileData:options:error:](self, "_installProfileData:options:error:", v10, v16, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;

    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[RMStoreProfilesAdapter installProfileData:store:declarationKey:completionHandler:].cold.2();

      v13[2](v13, v17, 0);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[RMStoreProfilesAdapter installProfileData:store:declarationKey:completionHandler:].cold.1();

      ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v13)[2](v13, 0, v15);
    v18 = v15;
  }

}

- (void)uninstallProfileWithIdentifier:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  _BOOL4 v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v18 = 0;
  v10 = -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:](self, "_canUninstallProfileWithIdentifier:store:error:", v8, a4, &v18);
  v11 = v18;
  v12 = v11;
  if (v10)
  {
    v17 = v11;
    v13 = -[RMStoreProfilesAdapter _removeProfileWithIdentifier:error:](self, "_removeProfileWithIdentifier:error:", v8, &v17);
    v14 = v17;

    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[RMStoreProfilesAdapter uninstallProfileWithIdentifier:store:completionHandler:].cold.1();
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[RMStoreProfilesAdapter uninstallProfileWithIdentifier:store:completionHandler:].cold.2();
    }

  }
  else
  {
    v14 = v11;
  }
  v9[2](v9, v14);

}

- (id)_installProfileData:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "installProfileData:options:outError:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_removeProfileWithIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a3;
  objc_msgSend(v5, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RMStoreProfilesAdapter isSystemScope](self, "isSystemScope"))
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v7, "removeProfileWithIdentifier:installationType:", v6, v8);

  return 1;
}

- (id)_installOptionsForStore:(id)a3 declarationKey:(id)a4 assumeOwnership:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _QWORD v24[4];
  _QWORD v25[4];
  const __CFString *v26;
  _QWORD v27[2];

  v5 = a5;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = CFSTR("DeclarationKey");
  objc_msgSend(a4, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x24BE63DD0];
  v25[0] = CFSTR("com.apple.RemoteManagement.ProfilesController");
  v12 = *MEMORY[0x24BE63DC8];
  v24[0] = v11;
  v24[1] = v12;
  v13 = (void *)MEMORY[0x24BDD16E0];
  if (-[RMStoreProfilesAdapter isSystemScope](self, "isSystemScope"))
    v14 = 1;
  else
    v14 = 2;
  objc_msgSend(v13, "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE63E10];
  v25[1] = v15;
  v25[2] = MEMORY[0x24BDBD1C8];
  v24[2] = v16;
  v24[3] = CFSTR("RemoteManagement.UserInfo");
  v25[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (!objc_msgSend(v8, "type"))
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE63E18]);
  objc_msgSend(v8, "enrollmentURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scheme");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("mdm"));

  if (v21)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE63DF0]);
  if (v5)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE63DB0]);
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter _installOptionsForStore:declarationKey:assumeOwnership:].cold.1();

  return v18;
}

- (id)_personaIDForStore:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "dataSeparated"))
  {
    objc_msgSend(v3, "personaIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_canInstallProfile:(id)a3 store:(id)a4 declarationKey:(id)a5 outAssumeOwnership:(BOOL *)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  RMStoreProfilesAdapter *v42;
  BOOL *v43;
  id v44;
  id v45;
  id v46;
  id *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v57 = 0;
  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", a3, &v57);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v57;
  v16 = v15;
  if (v14)
  {
    v43 = a6;
    v47 = a7;
    v48 = v15;
    objc_msgSend(v14, "identifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:].cold.4();

    objc_msgSend(v14, "payloads");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v54;
      v44 = v13;
      v45 = v12;
      v46 = v17;
      v41 = *(_QWORD *)v54;
      v42 = self;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v23), "type", v41, v42);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          -[RMStoreProfilesAdapter _disallowedPayloadTypes](self, "_disallowedPayloadTypes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v50;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v50 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                if (objc_msgSend(v31, "isEqualToString:", v25))
                {
                  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:].cold.3();

                  v13 = v44;
                  v12 = v45;
                  if (v47)
                  {
                    objc_msgSend(MEMORY[0x24BE7EB08], "createProfilePayloadNotAllowedErrorWithPayloadType:", v31);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = v35;
                    if (v35)
                      *v47 = objc_retainAutorelease(v35);

                  }
                  v33 = 0;
                  v32 = v19;
                  v17 = v46;
                  goto LABEL_28;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
              if (v28)
                continue;
              break;
            }
          }

          ++v23;
          v17 = v46;
          v22 = v41;
          self = v42;
        }
        while (v23 != v21);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        v13 = v44;
        v12 = v45;
      }
      while (v21);
    }

    -[RMStoreProfilesAdapter _profileForIdentifier:rmOnly:](self, "_profileForIdentifier:rmOnly:", v17, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:](self, "_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:", v32, v14, v13, v12, v43, v47);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:].cold.2();

      v33 = 1;
    }
LABEL_28:

    v16 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[RMStoreProfilesAdapter _canInstallProfile:store:declarationKey:outAssumeOwnership:error:].cold.1();

    if (!a7)
    {
      v33 = 0;
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BE7EB08], "createProfileInvalidErrorWithUnderlyingError:", v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v39;
    if (v39)
    {
      v17 = objc_retainAutorelease(v39);
      v33 = 0;
      *a7 = v17;
    }
    else
    {
      v33 = 0;
    }
  }

LABEL_30:
  return v33;
}

- (BOOL)_canReplaceProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6 outAssumeOwnership:(BOOL *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  NSObject *v30;
  void *v31;
  void *v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  -[RMStoreProfilesAdapter _declarationKeyForProfile:](self, "_declarationKeyForProfile:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:].cold.4();

  if (v17)
  {
    objc_msgSend(v17, "subscriberIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscriberIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if ((v22 & 1) != 0)
    {
      objc_msgSend(v17, "storeIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storeIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v17, "declarationIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "declarationIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToString:", v27);

        if ((v28 & 1) != 0)
        {
          v29 = 1;
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:].cold.1();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:].cold.2();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[RMStoreProfilesAdapter _canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:].cold.3();
    }

  }
  else if (-[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:](self, "_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:", v13, v14, v15, v16))
  {
    v29 = 1;
    *a7 = 1;
    goto LABEL_21;
  }
  v29 = (char)a8;
  if (a8)
  {
    objc_msgSend(MEMORY[0x24BE7EB08], "createProfileCannotReplaceOtherProfile:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      *a8 = objc_retainAutorelease(v31);

    v29 = 0;
  }
LABEL_21:

  return v29;
}

- (BOOL)_canAssumeOwnershipOfProfile:(id)a3 newProfile:(id)a4 newDeclarationKey:(id)a5 store:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  BOOL v22;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.6();

  objc_msgSend(v13, "enrollmentURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "scheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("mdm"));

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.5(v21);
    goto LABEL_12;
  }
  if (-[RMStoreProfilesAdapter _isManagedByMDM:](self, "_isManagedByMDM:", v10))
  {
    objc_msgSend(v12, "subscriberIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.RemoteManagement.InteractiveLegacyProfilesExtension"));

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      goto LABEL_12;
    }
    objc_msgSend(v11, "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v21, "isEqualToString:", v24))
    {
      -[RMStoreProfilesAdapter _payloadStructure:](self, "_payloadStructure:", v11);
      v25 = objc_claimAutoreleasedReturnValue();
      -[RMStoreProfilesAdapter _payloadStructure:](self, "_payloadStructure:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToSet:](v25, "isEqualToSet:", v26))
      {
        objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.2();

        v22 = 1;
LABEL_23:

        goto LABEL_13;
      }

    }
    objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.3();
    v22 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
LABEL_11:
    -[RMStoreProfilesAdapter _canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:].cold.1();
LABEL_12:
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)_payloadStructure:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v11;
        objc_msgSend(v10, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v12;
        objc_msgSend(v10, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_canUninstallProfileWithIdentifier:(id)a3 store:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:].cold.4();

  -[RMStoreProfilesAdapter _profileForIdentifier:rmOnly:](self, "_profileForIdentifier:rmOnly:", v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[RMStoreProfilesAdapter _declarationKeyForProfile:](self, "_declarationKeyForProfile:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.RemoteManagement.PasscodeSettingsExtension")) & 1) != 0)
    {
      if (!v9
        || (objc_msgSend(v12, "storeIdentifier"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "identifier"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v13, "isEqualToString:", v14),
            v14,
            v13,
            (v15 & 1) != 0))
      {
        v16 = 1;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:].cold.3();
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BE7EB08], "createProfileCannotRemoveOtherProfile:", v8);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v20 = objc_retainAutorelease(v20);
        *a5 = v20;
      }

    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "profilesAdapter");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[RMStoreProfilesAdapter _canUninstallProfileWithIdentifier:store:error:].cold.1();

  if (a5)
  {
    objc_msgSend(MEMORY[0x24BE7EB08], "createProfileCannotFindRemoveProfile:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v18)
    {
      v12 = objc_retainAutorelease(v18);
      v16 = 0;
      *a5 = v12;
      goto LABEL_24;
    }
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

- (id)_profileForIdentifier:(id)a3 rmOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v7 = -[RMStoreProfilesAdapter isSystemScope](self, "isSystemScope");
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "installedSystemProfileWithIdentifier:", v6);
  else
    objc_msgSend(v8, "installedUserProfileWithIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (-[RMStoreProfilesAdapter _declarationKeyForProfile:](self, "_declarationKeyForProfile:", v10),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v11 = v10;
  }

  return v11;
}

- (BOOL)_isManagedByMDM:(id)a3
{
  return objc_msgSend(a3, "isManagedByMDM");
}

- (id)_declarationKeyForProfile:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "installOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreProfilesAdapter _declarationKeyForUserInfo:](self, "_declarationKeyForUserInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_declarationKeyForUserInfo:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RemoteManagement.UserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeclarationKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = +[RMStoreDeclarationKey newDeclarationKey:](RMStoreDeclarationKey, "newDeclarationKey:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_disallowedPayloadTypes
{
  if (_disallowedPayloadTypes_onceToken != -1)
    dispatch_once(&_disallowedPayloadTypes_onceToken, &__block_literal_global_23);
  return (id)_disallowedPayloadTypes_disallowedPayloadTypes;
}

void __49__RMStoreProfilesAdapter__disallowedPayloadTypes__block_invoke()
{
  void *v0;

  v0 = (void *)_disallowedPayloadTypes_disallowedPayloadTypes;
  _disallowedPayloadTypes_disallowedPayloadTypes = (uint64_t)&unk_251635DD0;

}

- (BOOL)isSystemScope
{
  return self->_isSystemScope;
}

- (void)setIsSystemScope:(BOOL)a3
{
  self->_isSystemScope = a3;
}

- (void)allProfileIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Found all profiles: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)installedProfileIdentifierByDeclarationKey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Found installed profiles: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)installProfileData:store:declarationKey:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Error installing profile: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)installProfileData:store:declarationKey:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Installed profile: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)uninstallProfileWithIdentifier:store:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Removed profile: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)uninstallProfileWithIdentifier:store:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Error removing profile: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_installOptionsForStore:declarationKey:assumeOwnership:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Install options: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Invalid profile data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "No existing profile when installing: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Profile payload type disallowed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canInstallProfile:store:declarationKey:outAssumeOwnership:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Checking if profile can be installed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile is not managed by the same configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile is not managed by the same store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile is not managed by the same subscriber: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canReplaceProfile:newProfile:newDeclarationKey:store:outAssumeOwnership:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Checking if existing profile can be replaced: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Cannot take control of a profile not managed by MDM: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Existing profile can be taken over: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Cannot take control of existing profile that does not match new profile: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canAssumeOwnershipOfProfile:(os_log_t)log newProfile:newDeclarationKey:store:.cold.5(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_245188000, log, OS_LOG_TYPE_ERROR, "Non-MDM stores cannot take control of profiles", v1, 2u);
}

- (void)_canAssumeOwnershipOfProfile:newProfile:newDeclarationKey:store:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Checking if existing profile can be taken over: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile cannot be found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile is not managed by the same store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Existing profile has no declaration key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_canUninstallProfileWithIdentifier:store:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_245188000, v0, v1, "Checking if profile can be removed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
