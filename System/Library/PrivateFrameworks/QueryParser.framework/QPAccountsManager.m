@implementation QPAccountsManager

+ (id)sharedAccountsManager
{
  if (sharedAccountsManager_onceToken != -1)
    dispatch_once(&sharedAccountsManager_onceToken, &__block_literal_global_18);
  return (id)sharedAccountsManager__instance;
}

uint64_t __42__QPAccountsManager_sharedAccountsManager__block_invoke()
{
  QPAccountsManager *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[15];

  v14[14] = *MEMORY[0x24BDAC8D0];
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_66);
  v0 = objc_alloc_init(QPAccountsManager);
  v1 = (void *)sharedAccountsManager__instance;
  sharedAccountsManager__instance = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBAD00]);
  objc_msgSend((id)sharedAccountsManager__instance, "setContactsConfiguration:", v2);

  v3 = *MEMORY[0x24BDB4090];
  v14[0] = *MEMORY[0x24BDB4088];
  v14[1] = v3;
  v4 = *MEMORY[0x24BDB40F8];
  v14[2] = *MEMORY[0x24BDB4030];
  v14[3] = v4;
  v5 = *MEMORY[0x24BDB40F0];
  v14[4] = *MEMORY[0x24BDB4118];
  v14[5] = v5;
  v6 = *MEMORY[0x24BDB3FD8];
  v14[6] = *MEMORY[0x24BDB3FD0];
  v14[7] = v6;
  v7 = *MEMORY[0x24BDB4068];
  v14[8] = *MEMORY[0x24BDB4160];
  v14[9] = v7;
  v8 = *MEMORY[0x24BDB3FB8];
  v14[10] = *MEMORY[0x24BDB4078];
  v14[11] = v8;
  v9 = *MEMORY[0x24BDB4108];
  v14[12] = *MEMORY[0x24BDB3FC0];
  v14[13] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedAccountsManager__instance, "setAccountTypes:", v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", sharedAccountsManager__instance, sel_update_, *MEMORY[0x24BDBA3D0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", sharedAccountsManager__instance, sel_update_, *MEMORY[0x24BDB41E0], 0);

  return objc_msgSend((id)sharedAccountsManager__instance, "update:", 0);
}

- (id)nameToEmailAddresses
{
  void *v3;
  void *v4;
  NSArray *accountTypes;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  QPAccountsManager *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id obj;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  _BYTE v130[128];
  _QWORD v131[4];
  uint8_t buf[4];
  uint64_t v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v3;
  if (sPrivateAccountsEntitlement)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = self;
    accountTypes = self->_accountTypes;
    v129 = 0;
    objc_msgSend(v4, "accountsWithAccountTypeIdentifiers:error:", accountTypes, &v129);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v129;

    v94 = v7;
    if (!v7)
    {
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      obj = v6;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v126;
        v98 = *MEMORY[0x24BDB4160];
        v97 = *MEMORY[0x24BDB4078];
        v96 = *MEMORY[0x24BDB4068];
        v95 = *MEMORY[0x24BDB4088];
        v91 = *MEMORY[0x24BDB3FD8];
        v92 = *MEMORY[0x24BDB4090];
        v99 = *(_QWORD *)v126;
        v100 = v6;
        do
        {
          v11 = 0;
          v101 = v9;
          do
          {
            if (*(_QWORD *)v126 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v11);
            if (objc_msgSend(v12, "isActive"))
            {
              objc_msgSend(v12, "accountProperties");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", CFSTR("EmailAddresses"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "count"))
                objc_msgSend(v14, "addObjectsFromArray:", v15);
              v108 = v15;
              if (!objc_msgSend(v14, "count"))
              {
                v16 = v13;
                objc_msgSend(v13, "objectForKey:", CFSTR("IdentityEmailAddress"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "length"))
                {
                  objc_msgSend(v17, "lowercaseString");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v18);

                }
                objc_msgSend(v12, "accountType");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (v19)
                {
                  v105 = v11;
                  objc_msgSend(v19, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v21, "length")
                    && ((objc_msgSend(v21, "isEqualToString:", v98) & 1) != 0
                     || (objc_msgSend(v21, "isEqualToString:", v97) & 1) != 0
                     || (objc_msgSend(v21, "isEqualToString:", v96) & 1) != 0
                     || (objc_msgSend(v21, "isEqualToString:", v95) & 1) != 0
                     || (objc_msgSend(v21, "isEqualToString:", v92) & 1) != 0
                     || objc_msgSend(v21, "isEqualToString:", v91)))
                  {
                    objc_msgSend(v12, "username");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v22, "length"))
                    {
                      objc_msgSend(v22, "lowercaseString");
                      v23 = v6;
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v24);

                      v6 = v23;
                    }

                  }
                  v9 = v101;
                  v11 = v105;
                }

                v13 = v16;
                v15 = v108;
              }
              if (objc_msgSend(v14, "count"))
              {
                objc_msgSend(v13, "objectForKey:", CFSTR("FullUserName"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v104 = v13;
                if (!objc_msgSend(v25, "length"))
                {
                  objc_msgSend(v13, "objectForKey:", CFSTR("ACPropertyFullName"));
                  v26 = objc_claimAutoreleasedReturnValue();

                  v25 = (void *)v26;
                }
                v106 = v11;
                v27 = objc_msgSend(v25, "length");
                if (!v27)
                {
                  objc_msgSend(v14, "firstObject");
                  v28 = objc_claimAutoreleasedReturnValue();

                  v25 = (void *)v28;
                }
                v123 = 0u;
                v124 = 0u;
                v121 = 0u;
                v122 = 0u;
                v103 = v14;
                v111 = v14;
                v29 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v122;
                  do
                  {
                    for (i = 0; i != v30; ++i)
                    {
                      if (*(_QWORD *)v122 != v31)
                        objc_enumerationMutation(v111);
                      v33 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
                      if (objc_msgSend(v33, "length"))
                      {
                        objc_msgSend(v113, "objectForKey:", v33);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v114, "objectForKey:", v33);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = v35;
                        if (v35 && objc_msgSend(v35, "length"))
                        {
                          if (v34)
                          {
                            v3 = v115;
                            if (objc_msgSend(v34, "BOOLValue") & 1 | (v27 == 0))
                              goto LABEL_49;
                          }
                          else
                          {
                            v3 = v115;
                            if (!v27)
                            {
LABEL_49:

                              continue;
                            }
                          }
                          objc_msgSend(v3, "objectForKeyedSubscript:", v36);
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "removeObject:", v33);

                          objc_msgSend(v3, "objectForKeyedSubscript:", v36);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          v39 = objc_msgSend(v38, "count");

                          if (!v39)
                            objc_msgSend(v115, "removeObjectForKey:", v36);
                        }
                        objc_msgSend(v115, "objectForKey:", v25);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v40)
                        {
                          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v115, "setObject:forKey:", v41, v25);

                        }
                        objc_msgSend(v115, "objectForKeyedSubscript:", v25);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "addObject:", v33);

                        v3 = v115;
                        objc_msgSend(v114, "setObject:forKey:", v25, v33);
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27 != 0);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v113, "setObject:forKey:", v43, v33);

                        goto LABEL_49;
                      }
                    }
                    v30 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
                  }
                  while (v30);
                }

                v10 = v99;
                v6 = v100;
                v9 = v101;
                v13 = v104;
                v11 = v106;
                v14 = v103;
                v15 = v108;
              }

            }
            ++v11;
          }
          while (v11 != v9);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
        }
        while (v9);
      }

      if (accountsLogger_token != -1)
        dispatch_once(&accountsLogger_token, &__block_literal_global_67);
      v44 = (void *)accountsLogger_log;
      if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
      {
        v45 = v44;
        v46 = objc_msgSend(v3, "count");
        *(_DWORD *)buf = 134217984;
        v133 = v46;
        _os_log_impl(&dword_218E10000, v45, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: found %lu distinct Accounts names", buf, 0xCu);

      }
    }

    self = v93;
    v47 = v94;
  }
  else
  {
    if (accountsLogger_token != -1)
      dispatch_once(&accountsLogger_token, &__block_literal_global_67);
    v48 = accountsLogger_log;
    if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218E10000, v48, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: not entitled to access Accounts", buf, 2u);
    }
    v47 = 0;
  }
  if (sPrivateContactsEntitlement)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACF8]), "initWithConfiguration:", self->_contactsConfiguration);
    v50 = *MEMORY[0x24BDBA310];
    v131[0] = *MEMORY[0x24BDBA2C8];
    v131[1] = v50;
    v51 = *MEMORY[0x24BDBA288];
    v131[2] = *MEMORY[0x24BDBA2C0];
    v131[3] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v47;
    objc_msgSend(v49, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v52, &v120);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v120;

    if (v54)
    {

      v47 = v54;
      goto LABEL_108;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "givenName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "length");

    if (v58)
    {
      objc_msgSend(v53, "givenName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v59);

    }
    objc_msgSend(v53, "middleName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "length");

    if (v61)
    {
      objc_msgSend(v53, "middleName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v62);

    }
    objc_msgSend(v53, "familyName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "length");

    if (v64)
    {
      objc_msgSend(v53, "familyName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v65);

    }
    v110 = v49;
    v107 = v56;
    if (objc_msgSend(v56, "count"))
    {
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR(" "));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = 0;
    }
    v3 = v115;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v109 = v53;
    objc_msgSend(v53, "emailAddresses");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v117;
      do
      {
        v71 = 0;
        v112 = (id)v69;
        do
        {
          if (*(_QWORD *)v117 != v70)
            objc_enumerationMutation(v67);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * v71), "value");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v72, "length"))
          {
            objc_msgSend(v114, "objectForKey:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v66;
            if (objc_msgSend(v74, "length"))
            {
              if (v73 && objc_msgSend(v73, "length"))
              {
                v75 = v66;
                v76 = v70;
                v77 = v67;
                objc_msgSend(v3, "objectForKeyedSubscript:", v73);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "removeObject:", v72);

                objc_msgSend(v3, "objectForKeyedSubscript:", v73);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = v3;
                v81 = objc_msgSend(v79, "count");

                if (!v81)
                  objc_msgSend(v80, "removeObjectForKey:", v73);
                v3 = v80;
                v67 = v77;
                v70 = v76;
                v66 = v75;
                v69 = (uint64_t)v112;
              }
LABEL_97:
              objc_msgSend(v3, "objectForKey:", v74);
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v83)
              {
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKey:", v84, v74);

              }
              objc_msgSend(v3, "objectForKeyedSubscript:", v74);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v72);

              v3 = v115;
              objc_msgSend(v114, "setObject:forKey:", v74, v72);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v66 != 0);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "setObject:forKey:", v86, v72);

            }
            else if (!v73 || !objc_msgSend(v73, "length"))
            {
              v82 = v72;

              v74 = v82;
              goto LABEL_97;
            }

          }
          ++v71;
        }
        while (v69 != v71);
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
      }
      while (v69);
    }

    v47 = 0;
  }
  else
  {
    if (accountsLogger_token != -1)
      dispatch_once(&accountsLogger_token, &__block_literal_global_67);
    v55 = accountsLogger_log;
    if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218E10000, v55, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: not entitled to access Contacts", buf, 2u);
    }
  }
  if (accountsLogger_token != -1)
    dispatch_once(&accountsLogger_token, &__block_literal_global_67);
  v87 = (void *)accountsLogger_log;
  if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
  {
    v88 = v87;
    v89 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v133 = v89;
    _os_log_impl(&dword_218E10000, v88, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: found %lu distinct names in total", buf, 0xCu);

  }
LABEL_108:

  return v3;
}

- (void)update:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *p_contentsArray;
  NSArray *contentsArray;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[4];
  void *v31;
  _QWORD v32[2];
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (accountsLogger_token != -1)
    dispatch_once(&accountsLogger_token, &__block_literal_global_67);
  v5 = (void *)accountsLogger_log;
  if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_218E10000, v6, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: start update AccountsManager based on %@ notification", (uint8_t *)&buf, 0xCu);

  }
  -[QPAccountsManager nameToEmailAddresses](self, "nameToEmailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  contentsArray = self->_contentsArray;
  p_contentsArray = (id *)&self->_contentsArray;
  *p_contentsArray = 0;

  if (objc_msgSend(v8, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__16;
    v36 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__16;
    v28 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__16;
    v22 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __28__QPAccountsManager_update___block_invoke;
    v17[3] = &unk_24DA27550;
    v17[4] = &v24;
    v17[5] = &v18;
    v17[6] = &buf;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend((id)v25[5], "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    objc_msgSend((id)v19[5], "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

    objc_storeStrong(p_contentsArray, *(id *)(*((_QWORD *)&buf + 1) + 40));
    if (accountsLogger_token != -1)
      dispatch_once(&accountsLogger_token, &__block_literal_global_67);
    v15 = (id)accountsLogger_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138412290;
      v31 = v16;
      _os_log_impl(&dword_218E10000, v15, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: end update AccountsManager based on %@ notification", v30, 0xCu);

    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&buf, 8);

  }
}

void __28__QPAccountsManager_update___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithCapacity:", 5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v8);
  objc_msgSend(v14, "addObject:", v8);
  createStringFromSet(v6, CFSTR("%@"), CFSTR("\"%@\"), CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v9);
  objc_msgSend(v14, "addObject:", v9);
  createStringFromSet(v6, CFSTR("(%@)"), CFSTR("** == \"%@\"cdw"), CFSTR(" || "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(** == \"%@\"cdw)"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ || %@)"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v12);
  objc_msgSend(v6, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v14);

}

- (CNContactStoreConfiguration)contactsConfiguration
{
  return self->_contactsConfiguration;
}

- (void)setContactsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactsConfiguration, a3);
}

- (NSArray)accountTypes
{
  return self->_accountTypes;
}

- (void)setAccountTypes:(id)a3
{
  objc_storeStrong((id *)&self->_accountTypes, a3);
}

- (NSArray)contentsArray
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsArray, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_contactsConfiguration, 0);
}

@end
