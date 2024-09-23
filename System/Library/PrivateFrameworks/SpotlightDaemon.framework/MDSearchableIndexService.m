@implementation MDSearchableIndexService

- (id)_checkItems:(id)a3 identifiers:(id)a4 protectionClass:(id)a5 bundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uid_t v37;
  NSObject *v38;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_isInternal)
    goto LABEL_2;
  -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    logForCSLogCategoryIndex();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.1(self, v36);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  -[MDSearchableIndexService _checkBundleIDHelper:](self, "_checkBundleIDHelper:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    logForCSLogCategoryIndex();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.6();

    v32 = v30;
LABEL_43:
    v23 = v32;

    goto LABEL_44;
  }
  v37 = geteuid();
  if (v37 != -[MDSearchableIndexService clientUID](self, "clientUID"))
  {
    logForCSLogCategoryIndex();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.5(self, v38);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
LABEL_2:
  v41 = v12;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v15)
    goto LABEL_11;
  v16 = v15;
  v17 = *(_QWORD *)v47;
  v40 = v10;
  while (2)
  {
    v18 = v13;
    v19 = v11;
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v47 != v17)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if ((objc_msgSend(v21, "_isFullyFormed", v40) & 1) == 0)
      {
        logForCSLogCategoryIndex();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.4();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      objc_msgSend(v21, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService _checkBundleIDHelper:](self, "_checkBundleIDHelper:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        logForCSLogCategoryIndex();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.3();

LABEL_31:
        v12 = v41;

        v11 = v19;
        v13 = v18;
        v10 = v40;
        goto LABEL_44;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    v11 = v19;
    v13 = v18;
    v10 = v40;
    if (v16)
      continue;
    break;
  }
LABEL_11:

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = v11;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v43;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          logForCSLogCategoryIndex();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_35;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v26)
        continue;
      break;
    }
  }

  v23 = 0;
LABEL_35:
  v12 = v41;
LABEL_44:

  return v23;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setSearchInternal:(BOOL)a3
{
  self->_searchInternal = a3;
}

- (void)setQuotaDisabled:(BOOL)a3
{
  self->_quotaDisabled = a3;
}

- (void)setProtectionClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIsPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void)setIsExtension:(BOOL)a3
{
  self->_isExtension = a3;
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (void)setEntitledAttributes:(int)a3
{
  self->_entitledAttributes = a3;
}

- (void)setClientUID:(unsigned int)a3
{
  self->_clientUID = a3;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAllowPhotosLibraryDeletion:(BOOL)a3
{
  self->_allowPhotosLibraryDeletion = a3;
}

- (void)setAllowMail:(BOOL)a3
{
  self->_allowMail = a3;
}

- (unsigned)clientUID
{
  return self->_clientUID;
}

- (id)_checkBundleIDHelper:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  if (!v4
    || (-[MDSearchableIndexService clientBundleID](self, "clientBundleID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v6 & 1) != 0)
    || self->_isInternal)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)setClientPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deleteAllInteractions:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v29;
  BOOL v30;
  MDSearchableIndexService *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v31 = self;
    v30 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v33 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v32 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v47 = *(_OWORD *)v12;
    v48 = v13;
    v49 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService deleteAllInteractions:]";
    si_tracing_log_span_begin();
    v29 = v11;
    v16 = *(_OWORD *)(v12 + 16);
    v44 = *(_OWORD *)v12;
    v45 = v16;
    v46 = *(_QWORD *)(v12 + 32);
    v17 = *(_QWORD *)v12;
    v18 = si_tracing_calc_next_spanid();
    v19 = *(_QWORD *)(v12 + 8);
    v20 = *(_DWORD *)(v12 + 24);
    if (v33)
    {
      v21 = objc_retainAutorelease(v33);
      if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionComplete"))
      {
        v24 = "Class A index";
      }
      else
      {
        v22 = objc_retainAutorelease(v21);
        if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v24 = "Class B index";
        }
        else
        {
          v23 = objc_retainAutorelease(v22);
          if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v24 = "Class C index";
          }
          else
          {
            v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v24 = "Nil index";
    }
    *(_QWORD *)v12 = v17;
    *(_QWORD *)(v12 + 8) = v18;
    *(_QWORD *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    v25 = *(_OWORD *)(v12 + 16);
    v41 = *(_OWORD *)v12;
    v42 = v25;
    v43 = *(_QWORD *)(v12 + 32);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __50__MDSearchableIndexService_deleteAllInteractions___block_invoke;
    v34[3] = &unk_24D0EE0D8;
    v37 = v41;
    v38 = v25;
    v39 = v43;
    v35 = v7;
    v40 = uint64;
    v36 = v5;
    -[MDSearchableIndexService deleteAllInteractionsWithBundleID:protectionClass:options:completionHandler:](v31, "deleteAllInteractionsWithBundleID:protectionClass:options:completionHandler:", v32, v33, v29, v34);

    si_tracing_log_span_end();
    v26 = v45;
    *(_OWORD *)v12 = v44;
    *(_OWORD *)(v12 + 16) = v26;
    *(_QWORD *)(v12 + 32) = v46;
    si_tracing_log_span_end();
    v27 = v48;
    *(_OWORD *)v12 = v47;
    *(_OWORD *)(v12 + 16) = v27;
    *(_QWORD *)(v12 + 32) = v49;

    v9 = v30;
  }

  return v9;
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  MDIndexer *indexer;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, void *);
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x2199C2D78]();
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = a5;
    _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllInteractionsWithBundleID, protectionClass:%@, options:0x%lx", buf, 0x20u);
  }

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_19:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "checkBundleIdentifier:", v10);

      if (v17)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_24D0EDE38;
        v23 = v10;
        v24 = v11;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v22);

      }
    }
    if (objc_msgSend(v10, "length")
      && -[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a5)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke_2;
      v20[3] = &unk_24D0EB898;
      v21 = v12;
      -[MDIndexer deleteAllInteractionsWithBundleID:fromClient:completionHandler:](indexer, "deleteAllInteractionsWithBundleID:fromClient:completionHandler:", v10, v19, v20);

      v12 = v21;
      goto LABEL_19;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_19;
    }
  }

  objc_autoreleasePoolPop(v13);
}

uint64_t __85__MDSearchableIndexService_donateRelevantActions_bundleID_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender donateRelevantActions:bundleID:client:](SpotlightSender, "donateRelevantActions:bundleID:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllInteractionsWithBundleID:protectionClass:client:](SpotlightSender, "deleteAllInteractionsWithBundleID:protectionClass:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (id)_checkNonEmptyBundle:(id)a3 protectionClass:(id)a4
{
  void *v5;
  NSObject *v6;

  if (a3)
  {
    -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, a4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _checkNonEmptyBundle:protectionClass:].cold.1(self, v6);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t __122__MDSearchableIndexService_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __45__MDSearchableIndexService_fetchClientState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t spanid;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  size_t v15;
  const char *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v17 = a2;
  v5 = a3;
  v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v18 = *(_OWORD *)v6;
  v19 = *(_OWORD *)(v6 + 16);
  v20 = *(_QWORD *)(v6 + 32);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v9 = *(_QWORD *)v6;
  spanid = si_tracing_calc_next_spanid();
  v11 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)v6 = v9;
  *(_QWORD *)(v6 + 8) = spanid;
  *(_QWORD *)(v6 + 16) = v11;
  *(_BYTE *)(v6 + 28) = 102;
  *(_QWORD *)(v6 + 32) = "completion handler for fetchClientState";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  if (!v5)
  {
    v12 = *(void **)(a1 + 32);
    v13 = objc_retainAutorelease(v17);
    v14 = objc_msgSend(v13, "bytes");
    v15 = objc_msgSend(v13, "length");
    if (v14)
      v16 = (const char *)v14;
    else
      v16 = "";
    xpc_dictionary_set_data(v12, "client-state-key", v16, v15);
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v6 = v18;
  *(_OWORD *)(v6 + 16) = v19;
  *(_QWORD *)(v6 + 32) = v20;

}

- (BOOL)fetchClientState:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v29;
  BOOL v30;
  void *v31;
  MDSearchableIndexService *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v32 = self;
    v30 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v34 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v33 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v31 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "client-state-name", v4);
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v48 = *(_OWORD *)v12;
    v49 = v13;
    v50 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService fetchClientState:]";
    si_tracing_log_span_begin();
    v29 = v11;
    v16 = *(_OWORD *)(v12 + 16);
    v45 = *(_OWORD *)v12;
    v46 = v16;
    v47 = *(_QWORD *)(v12 + 32);
    v17 = *(_QWORD *)v12;
    v18 = si_tracing_calc_next_spanid();
    v19 = *(_QWORD *)(v12 + 8);
    v20 = *(_DWORD *)(v12 + 24);
    if (v34)
    {
      v21 = objc_retainAutorelease(v34);
      if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionComplete"))
      {
        v24 = "Class A index";
      }
      else
      {
        v22 = objc_retainAutorelease(v21);
        if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v24 = "Class B index";
        }
        else
        {
          v23 = objc_retainAutorelease(v22);
          if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v24 = "Class C index";
          }
          else
          {
            v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v24 = "Nil index";
    }
    *(_QWORD *)v12 = v17;
    *(_QWORD *)(v12 + 8) = v18;
    *(_QWORD *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    v25 = *(_OWORD *)(v12 + 16);
    v42 = *(_OWORD *)v12;
    v43 = v25;
    v44 = *(_QWORD *)(v12 + 32);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __45__MDSearchableIndexService_fetchClientState___block_invoke;
    v35[3] = &unk_24D0EE168;
    v38 = v42;
    v39 = v25;
    v40 = v44;
    v36 = v7;
    v41 = uint64;
    v37 = v5;
    -[MDSearchableIndexService fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:](v32, "fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:", v34, v33, v31, v29, v35);

    si_tracing_log_span_end();
    v26 = v46;
    *(_OWORD *)v12 = v45;
    *(_OWORD *)(v12 + 16) = v26;
    *(_QWORD *)(v12 + 32) = v47;
    si_tracing_log_span_end();
    v27 = v49;
    *(_OWORD *)v12 = v48;
    *(_OWORD *)(v12 + 16) = v27;
    *(_QWORD *)(v12 + 32) = v50;

    v9 = v30;
  }

  return v9;
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  NSObject *v17;
  void *v18;
  MDIndexer *indexer;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, void *);
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, void *))a7;
  v16 = (void *)MEMORY[0x2199C2D78]();
  if (v13)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryIndex();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[MDSearchableIndexService protectionClass](self, "protectionClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v20;
    v31 = 2048;
    v32 = a6;
    _os_log_debug_impl(&dword_213CF1000, v17, OS_LOG_TYPE_DEBUG, "(%@) fetchLastClientStateWithProtectionClass, clientStateName:%@, protectionClass:%@/%@, options:0x%lx", buf, 0x34u);

  }
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, 0, v18);
LABEL_15:

    }
  }
  else
  {
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a6)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __122__MDSearchableIndexService_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke;
      v21[3] = &unk_24D0EDE88;
      v22 = v15;
      -[MDIndexer fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:](indexer, "fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:", v12, v13, v14, a6, v21);
      v15 = v22;
      goto LABEL_15;
    }
    if (v15)
    {
      v15[2](v15, 0, 0);
      goto LABEL_15;
    }
  }

  objc_autoreleasePoolPop(v16);
}

- (BOOL)_jobForIndex:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 4) != 0;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  BOOL v13;
  MDSearchableIndexService *v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v6);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.usernotificationsd")) & 1) == 0)
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.usernotificationsd")) & 1) == 0)
    {

      goto LABEL_11;
    }
    v9 = -[MDSearchableIndexService allowNotifications](self, "allowNotifications");

    if (v9)
      goto LABEL_11;
LABEL_6:
    logForCSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:].cold.2(self, v10);

    goto LABEL_9;
  }
  if (!-[MDSearchableIndexService allowNotifications](self, "allowNotifications"))
    goto LABEL_6;
LABEL_11:
  if (!strcmp(a3, "delete-bundle"))
  {
    v13 = -[MDSearchableIndexService deleteBundle:](self, "deleteBundle:", v6);
LABEL_63:
    v11 = v13;
    goto LABEL_64;
  }
  if (!strcmp(a3, "delete-from-date"))
  {
    v13 = -[MDSearchableIndexService deleteSinceDate:](self, "deleteSinceDate:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "check-in"))
  {
    v13 = -[MDSearchableIndexService checkIn:](self, "checkIn:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "process-index-data"))
  {
    v13 = -[MDSearchableIndexService processIndexData:](self, "processIndexData:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "will-modify"))
  {
    v13 = -[MDSearchableIndexService willModify:](self, "willModify:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete-domains"))
  {
    v13 = -[MDSearchableIndexService deleteDomains:](self, "deleteDomains:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "issue"))
  {
    v13 = -[MDSearchableIndexService issueCommand:](self, "issueCommand:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "fetch-client-state"))
  {
    v13 = -[MDSearchableIndexService fetchClientState:](self, "fetchClientState:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "change-state"))
  {
    v13 = -[MDSearchableIndexService changeState:](self, "changeState:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "data-migration"))
  {
    v13 = -[MDSearchableIndexService dataMigration:](self, "dataMigration:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete-journal-transfer"))
  {
    v13 = -[MDSearchableIndexService transferDeleteJournals:](self, "transferDeleteJournals:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "fetch_attributes"))
  {
    v13 = -[MDSearchableIndexService fetchAttributes:](self, "fetchAttributes:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete_all_activities"))
  {
    v13 = -[MDSearchableIndexService deleteAllUserActivities:](self, "deleteAllUserActivities:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete_activities"))
  {
    v13 = -[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:](self, "deleteUserActivitiesWithPersistentIdentifiers:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete-actions-before-time"))
  {
    v13 = -[MDSearchableIndexService deleteActionsBeforeTime:](self, "deleteActionsBeforeTime:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete-actions-with-identifiers"))
  {
    v13 = -[MDSearchableIndexService deleteActionsWithIdentifiers:](self, "deleteActionsWithIdentifiers:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "activities"))
  {
    v13 = -[MDSearchableIndexService processActivities:](self, "processActivities:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "add_interaction"))
  {
    v13 = -[MDSearchableIndexService addInteraction:](self, "addInteraction:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete_interactions"))
  {
    v14 = self;
    v15 = v6;
    v16 = 0;
LABEL_62:
    v13 = -[MDSearchableIndexService _deleteInteractions:forGroup:](v14, "_deleteInteractions:forGroup:", v15, v16);
    goto LABEL_63;
  }
  if (!strcmp(a3, "delete_group_interactions"))
  {
    v14 = self;
    v15 = v6;
    v16 = 1;
    goto LABEL_62;
  }
  if (!strcmp(a3, "delete_all_interactions"))
  {
    v13 = -[MDSearchableIndexService deleteAllInteractions:](self, "deleteAllInteractions:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "donate_relevant_actions"))
  {
    v13 = -[MDSearchableIndexService donateRelevantActions:](self, "donateRelevantActions:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "photoslibrary-deleted"))
  {
    v13 = -[MDSearchableIndexService photosLibraryDeleted:](self, "photosLibraryDeleted:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "prepare-indexing-locked"))
  {
    v13 = -[MDSearchableIndexService prepareIndexingLocked:](self, "prepareIndexingLocked:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "finish-indexing-locked"))
  {
    v13 = -[MDSearchableIndexService finishIndexingLocked:](self, "finishIndexingLocked:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "cache-command-issue"))
  {
    v13 = -[MDSearchableIndexService issueCacheCommand:](self, "issueCacheCommand:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "update-corrections"))
  {
    v13 = -[MDSearchableIndexService updateCorrections:](self, "updateCorrections:", v6);
    goto LABEL_63;
  }
  if (!strcmp(a3, "open-journal"))
  {
    v13 = -[MDSearchableIndexService openJournalFile:](self, "openJournalFile:", v6);
    goto LABEL_63;
  }
  logForCSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[MDSearchableIndexService handleCommand:info:].cold.1();

LABEL_9:
  v11 = 0;
LABEL_64:

  return v11;
}

- (BOOL)checkIn:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  uint64_t uint64;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t spanid;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  __int128 v23;
  MDSearchableIndexService *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  MDSearchableIndexService *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
  {
    v32 = self;
    v33 = reply;
    v8 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v10 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v11 = *(_OWORD *)(v10 + 16);
    v48 = *(_OWORD *)v10;
    v49 = v11;
    v50 = *(_QWORD *)(v10 + 32);
    v12 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = spanid;
    *(_QWORD *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = "-[MDSearchableIndexService checkIn:]";
    si_tracing_log_span_begin();
    v14 = *(_OWORD *)(v10 + 16);
    v45 = *(_OWORD *)v10;
    v46 = v14;
    v47 = *(_QWORD *)(v10 + 32);
    v15 = *(_QWORD *)v10;
    v16 = si_tracing_calc_next_spanid();
    v17 = *(_QWORD *)(v10 + 8);
    v18 = *(_DWORD *)(v10 + 24);
    if (v8)
    {
      v19 = objc_retainAutorelease(v8);
      if (!strcmp((const char *)objc_msgSend(v19, "UTF8String"), "NSFileProtectionComplete"))
      {
        v22 = "Class A index";
      }
      else
      {
        v20 = objc_retainAutorelease(v19);
        if (!strcmp((const char *)objc_msgSend(v20, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v22 = "Class B index";
        }
        else
        {
          v21 = objc_retainAutorelease(v20);
          if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v22 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v22 = "Class C index";
          }
          else
          {
            v22 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v22 = "Nil index";
    }
    *(_QWORD *)v10 = v15;
    *(_QWORD *)(v10 + 8) = v16;
    *(_QWORD *)(v10 + 16) = v17;
    *(_DWORD *)(v10 + 24) = v18;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = v22;
    si_tracing_log_span_begin();
    v23 = *(_OWORD *)(v10 + 16);
    v42 = *(_OWORD *)v10;
    v43 = v23;
    v44 = *(_QWORD *)(v10 + 32);
    v7 = v33;
    if (v33)
    {
      v34[1] = 3221225472;
      v38 = v42;
      v39 = v43;
      v34[0] = MEMORY[0x24BDAC760];
      v34[2] = __36__MDSearchableIndexService_checkIn___block_invoke;
      v34[3] = &unk_24D0EE088;
      v40 = v44;
      v35 = v33;
      v41 = uint64;
      v36 = v8;
      v37 = v5;
      v24 = v32;
      v25 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199C2F34](v34);

    }
    else
    {
      v25 = 0;
      v24 = v32;
    }
    if (v24->_isExtension)
    {
      logForCSLogCategoryIndex();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[MDSearchableIndexService processDescription](v24, "processDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_DEFAULT, "*warn* indexDelegate not supported with Extensions process:%@", buf, 0xCu);

      }
      if (v25)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v28);

      }
    }
    else
    {
      -[MDSearchableIndexService checkInWithProtectionClass:completionHandler:](v24, "checkInWithProtectionClass:completionHandler:", v8, v25);
    }

    si_tracing_log_span_end();
    v29 = v46;
    *(_OWORD *)v10 = v45;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v47;
    si_tracing_log_span_end();
    v30 = v49;
    *(_OWORD *)v10 = v48;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v50;

  }
  return v5 != 0;
}

- (void)checkInWithProtectionClass:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MDIndexer *indexer;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)MEMORY[0x2199C2D78]();
  if (!v6)
  {
    -[MDSearchableIndexService protectionClass](self, "protectionClass");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[MDSearchableIndexService processDescription](self, "processDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEBUG, "(%@) checkInWithProtectionClass, protectionClass:%@, process:%@", (uint8_t *)&v15, 0x20u);

  }
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v7)
LABEL_16:
      v7[2](v7, 0, v11);
  }
  else if (v9)
  {
    indexer = self->_indexer;
    if (v7 && !indexer)
    {
      v7[2](v7, 0, 0);
      indexer = self->_indexer;
    }
    -[MDIndexer clientDidCheckin:protectionClass:service:completionHandler:](indexer, "clientDidCheckin:protectionClass:service:completionHandler:", v9, v6, self, v7);
    v11 = 0;
  }
  else
  {
    logForCSLogCategoryIndex();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService checkInWithProtectionClass:completionHandler:].cold.1(self, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_16;
  }

  objc_autoreleasePoolPop(v8);
}

- (BOOL)deleteDomains:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t spanid;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  id v25;
  id v26;
  const char *v27;
  __int128 v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  void *v34;
  BOOL v35;
  void *v36;
  uint64_t v37;
  MDSearchableIndexService *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v38 = self;
    v35 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v41 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v39 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v37 = xpc_dictionary_get_uint64(v4, "opt");
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDC23D0]);
    v36 = v11;
    objc_msgSend(v11, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:", v13);

    v34 = v14;
    objc_msgSend(v14, "decode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v16 = *(_OWORD *)(v15 + 16);
    v56 = *(_OWORD *)v15;
    v57 = v16;
    v58 = *(_QWORD *)(v15 + 32);
    v17 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v15 = v17;
    *(_QWORD *)(v15 + 8) = spanid;
    *(_QWORD *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = "-[MDSearchableIndexService deleteDomains:]";
    si_tracing_log_span_begin();
    v19 = *(_OWORD *)(v15 + 16);
    v53 = *(_OWORD *)v15;
    v54 = v19;
    v55 = *(_QWORD *)(v15 + 32);
    v20 = *(_QWORD *)v15;
    v21 = si_tracing_calc_next_spanid();
    v22 = *(_QWORD *)(v15 + 8);
    v23 = *(_DWORD *)(v15 + 24);
    if (v41)
    {
      v24 = objc_retainAutorelease(v41);
      if (!strcmp((const char *)objc_msgSend(v24, "UTF8String"), "NSFileProtectionComplete"))
      {
        v27 = "Class A index";
      }
      else
      {
        v25 = objc_retainAutorelease(v24);
        if (!strcmp((const char *)objc_msgSend(v25, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v27 = "Class B index";
        }
        else
        {
          v26 = objc_retainAutorelease(v25);
          if (!strcmp((const char *)objc_msgSend(v26, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v27 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v27 = "Class C index";
          }
          else
          {
            v27 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v27 = "Nil index";
    }
    *(_QWORD *)v15 = v20;
    *(_QWORD *)(v15 + 8) = v21;
    *(_QWORD *)(v15 + 16) = v22;
    *(_DWORD *)(v15 + 24) = v23;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = v27;
    si_tracing_log_span_begin();
    v28 = *(_OWORD *)(v15 + 16);
    v50 = *(_OWORD *)v15;
    v51 = v28;
    v52 = *(_QWORD *)(v15 + 32);
    -[MDSearchableIndexService clientBundleID](v38, "clientBundleID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = 3221225472;
    v46 = v50;
    v42[0] = MEMORY[0x24BDAC760];
    v42[2] = __42__MDSearchableIndexService_deleteDomains___block_invoke;
    v42[3] = &unk_24D0EE100;
    v47 = v51;
    v48 = v52;
    v30 = v36;
    v43 = v30;
    v44 = v7;
    v49 = uint64;
    v45 = v5;
    -[MDSearchableIndexService deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:](v38, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:", v40, v41, v39, v29, v37, v42);

    si_tracing_log_span_end();
    v31 = v54;
    *(_OWORD *)v15 = v53;
    *(_OWORD *)(v15 + 16) = v31;
    *(_QWORD *)(v15 + 32) = v55;
    si_tracing_log_span_end();
    v32 = v57;
    *(_OWORD *)v15 = v56;
    *(_OWORD *)(v15 + 16) = v32;
    *(_QWORD *)(v15 + 32) = v58;

    v9 = v35;
  }

  return v9;
}

- (BOOL)processIndexData:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t spanid;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  id v31;
  id v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  char v39;
  void *v40;
  int PlistObjectType;
  unsigned int Count;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  __int128 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  void *v63;
  id v64;
  uint64_t uint64;
  void *v66;
  void *v67;
  xpc_connection_t connection;
  uint64_t value;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _xpc_connection_s *v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  id v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    value = xpc_dictionary_get_uint64(v4, "id");
    v9 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v73 = v11;

    -[MDSearchableIndexService clientPersonaID](self, "clientPersonaID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[MDSearchableIndexService protectionClass](self, "protectionClass");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v71 = v14;

    uint64 = xpc_dictionary_get_uint64(v4, "opt");
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "items", "items-size", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v4);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "client-state-key", "client-state-size", v4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "expected-client-state-key", "expected-client-state-size", v4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "n", v4);
    v72 = v15;
    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDC23D0]);
      objc_msgSend(v15, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (id)objc_msgSend(v16, "initWithData:", v17);

    }
    else
    {
      v77 = 0;
    }
    connection = v5;
    if (v76)
    {
      v18 = objc_alloc(MEMORY[0x24BDC23D0]);
      objc_msgSend(v76, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithData:", v19);

    }
    else
    {
      v20 = 0;
    }
    v75 = (void *)v20;
    v21 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v22 = *(_OWORD *)(v21 + 16);
    v96 = *(_OWORD *)v21;
    v97 = v22;
    v98 = *(_QWORD *)(v21 + 32);
    v23 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v21 = v23;
    *(_QWORD *)(v21 + 8) = spanid;
    *(_QWORD *)(v21 + 16) = 0;
    *(_DWORD *)(v21 + 24) = value;
    *(_BYTE *)(v21 + 28) = 102;
    *(_QWORD *)(v21 + 32) = "-[MDSearchableIndexService processIndexData:]";
    si_tracing_log_span_begin();
    v25 = *(_OWORD *)(v21 + 16);
    v93 = *(_OWORD *)v21;
    v94 = v25;
    v95 = *(_QWORD *)(v21 + 32);
    v26 = *(_QWORD *)v21;
    v27 = si_tracing_calc_next_spanid();
    v28 = *(_QWORD *)(v21 + 8);
    v29 = *(_DWORD *)(v21 + 24);
    if (v71)
    {
      v30 = objc_retainAutorelease(v71);
      if (!strcmp((const char *)objc_msgSend(v30, "UTF8String"), "NSFileProtectionComplete"))
      {
        v33 = "Class A index";
      }
      else
      {
        v31 = objc_retainAutorelease(v30);
        if (!strcmp((const char *)objc_msgSend(v31, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v33 = "Class B index";
        }
        else
        {
          v32 = objc_retainAutorelease(v31);
          if (!strcmp((const char *)objc_msgSend(v32, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v33 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v33 = "Class C index";
          }
          else
          {
            v33 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v33 = "Nil index";
    }
    *(_QWORD *)v21 = v26;
    *(_QWORD *)(v21 + 8) = v27;
    *(_QWORD *)(v21 + 16) = v28;
    *(_DWORD *)(v21 + 24) = v29;
    *(_BYTE *)(v21 + 28) = 102;
    *(_QWORD *)(v21 + 32) = v33;
    si_tracing_log_span_begin();
    objc_msgSend(v74, "data");
    v34 = v75;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    v8 = -[MDSearchableIndexService _canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:](self, "_canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:", v73, v77, v75, v35, v70, &v92);
    v64 = v92;

    if (v8)
    {
      v36 = v77;
      if (v77
        && (objc_msgSend(v77, "obj"), v37 = _MDPlistGetPlistObjectType() == 240, v36 = v77, v37)
        && (objc_msgSend(v77, "obj"), LODWORD(v38) = _MDPlistArrayGetCount(), v36 = v77, (_DWORD)v38))
      {
        objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "textdata", "text-data-size", v4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        v38 = v38;
      }
      else
      {

        v38 = 0;
        v72 = 0;
        v77 = 0;
        v63 = 0;
        v39 = 1;
      }
      v40 = v75;
      if (v75
        && (objc_msgSend(v75, "obj"), PlistObjectType = _MDPlistGetPlistObjectType(), v40 = v75, PlistObjectType == 240)
        && (objc_msgSend(v75, "obj"), Count = _MDPlistArrayGetCount(), v40 = v75, Count))
      {
        v43 = Count;
      }
      else
      {

        v43 = 0;
        v75 = 0;
        v76 = 0;
      }
      if (v43 | v38)
      {
        if ((uint64 & 0x24F) != 4 && !self->_isPrivate)
        {
          +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "checkBundleIdentifier:", v73);

          if (v45)
          {
            if ((v39 & 1) != 0)
            {
              v46 = 0;
              v47 = 0;
              v48 = v77;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "htmldata", "html-data-size", v4);
              v48 = v77;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                v50 = objc_alloc(MEMORY[0x24BDC23D0]);
                objc_msgSend(v49, "data");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)objc_msgSend(v50, "initWithData:", v51);

                objc_msgSend(v47, "setBackingStore:", v49);
              }
              else
              {
                v47 = 0;
              }
              if (v63)
              {
                v52 = objc_alloc(MEMORY[0x24BDC23D0]);
                objc_msgSend(v63, "data");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (void *)objc_msgSend(v52, "initWithData:", v53);

                objc_msgSend(v46, "setBackingStore:", v63);
              }
              else
              {
                v46 = 0;
              }

            }
            objc_msgSend(v48, "setBackingStore:", v72);
            objc_msgSend(v75, "setBackingStore:", v76);
            -[MDSearchableIndexService _dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:](self, "_dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:", v73, v71, uint64, v48, v46, v47, v75);

          }
        }
      }
      if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", uint64))
      {
        v54 = *(_OWORD *)(v21 + 16);
        v89 = *(_OWORD *)v21;
        v90 = v54;
        v91 = *(_QWORD *)(v21 + 32);
        objc_msgSend(v72, "data");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "data");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "data");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "data");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "data");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __45__MDSearchableIndexService_processIndexData___block_invoke;
        v78[3] = &unk_24D0EE0B0;
        v85 = v89;
        v86 = v90;
        v87 = v91;
        v79 = v72;
        v80 = v63;
        v81 = v76;
        v82 = v74;
        v83 = v7;
        v88 = value;
        v84 = connection;
        -[MDSearchableIndexService _processIndexDataForBundle:protectionClass:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:completionHandler:](self, "_processIndexDataForBundle:protectionClass:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:completionHandler:", v73, v71, v66, uint64, v55, v56, v57, v58, v70, v59, v78);

      }
      else
      {
        csindex_xpc_dictionary_encode_status_with_error();
        xpc_dictionary_set_uint64(v7, "id", value);
        xpc_connection_send_message(connection, v7);
      }

      v34 = v75;
    }

    si_tracing_log_span_end();
    v60 = v94;
    *(_OWORD *)v21 = v93;
    *(_OWORD *)(v21 + 16) = v60;
    *(_QWORD *)(v21 + 32) = v95;
    si_tracing_log_span_end();
    v61 = v97;
    *(_OWORD *)v21 = v96;
    *(_OWORD *)(v21 + 16) = v61;
    *(_QWORD *)(v21 + 32) = v98;

    v5 = connection;
  }

  return v8;
}

- (BOOL)issueCommand:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  uint64_t uint64;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t spanid;
  __int128 v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  MDSearchableIndexService *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _QWORD v34[3];
  char v35;
  uint64_t __buf;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  if (v5)
  {
    v21 = self;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v8 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "request", v4);
    v9 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v10 = *(_OWORD *)(v9 + 16);
    v47 = *(_OWORD *)v9;
    v48 = v10;
    v49 = *(_QWORD *)(v9 + 32);
    v11 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v9 = v11;
    *(_QWORD *)(v9 + 8) = spanid;
    *(_QWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 24) = uint64;
    *(_BYTE *)(v9 + 28) = 102;
    *(_QWORD *)(v9 + 32) = "-[MDSearchableIndexService issueCommand:]";
    si_tracing_log_span_begin();
    v13 = *(_OWORD *)(v9 + 16);
    v44 = *(_OWORD *)v9;
    v45 = v13;
    v46 = *(_QWORD *)(v9 + 32);
    v14 = v8 != 0;
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("diagnosemd")) & 1) != 0
        || objc_msgSend(v8, "isEqualToString:", CFSTR("diagnosemd_q")))
      {
        v15 = objc_msgSend(v8, "isEqualToString:", CFSTR("diagnosemd_q"), v21);
        v16 = xpc_dictionary_dup_fd(v4, "fd");
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __41__MDSearchableIndexService_issueCommand___block_invoke;
        v37[3] = &unk_24D0EE168;
        v40 = v44;
        v41 = v45;
        v42 = v46;
        v38 = reply;
        v43 = uint64;
        v39 = v5;
        objc_msgSend(v22, "_issueDiagnose:logQuery:completionHandler:", v16, v15, v37);

      }
      else
      {
        v17 = xpc_dictionary_dup_fd(v4, "fd");
        __buf = 0;
        if ((v17 & 0x80000000) != 0)
        {
          v18 = 0;
        }
        else
        {
          arc4random_buf(&__buf, 8uLL);
          change_fdguard_np();
          v18 = __buf;
        }
        v34[2] = 0x2020000000;
        v23[1] = 3221225472;
        v29 = v44;
        v34[0] = 0;
        v34[1] = v34;
        v35 = 0;
        v23[0] = MEMORY[0x24BDAC760];
        v23[2] = __41__MDSearchableIndexService_issueCommand___block_invoke_2;
        v23[3] = &unk_24D0EE190;
        v33 = v17;
        v27 = v34;
        v28 = v18;
        v30 = v45;
        v31 = v46;
        v24 = reply;
        v32 = uint64;
        v25 = v5;
        v26 = v8;
        -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:](v21, "_issueCommand:outFileDescriptor:searchContext:completionHandler:", v26, v17, 0, v23);

        _Block_object_dispose(v34, 8);
      }
    }
    si_tracing_log_span_end();
    v19 = v48;
    *(_OWORD *)v9 = v47;
    *(_OWORD *)(v9 + 16) = v19;
    *(_QWORD *)(v9 + 32) = v49;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)donateRelevantActions:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  uint64_t uint64;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  void *v17;
  __int128 v18;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v10 = xpc_dictionary_get_uint64(v4, "opt");
    v11 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v30 = *(_OWORD *)v12;
    v31 = v13;
    v32 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService donateRelevantActions:]";
    si_tracing_log_span_begin();
    v16 = *(_OWORD *)(v12 + 16);
    v27 = *(_OWORD *)v12;
    v28 = v16;
    v29 = *(_QWORD *)(v12 + 32);
    xpc_dictionary_get_value(v4, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17 != 0;
    if (v17)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __50__MDSearchableIndexService_donateRelevantActions___block_invoke;
      v20[3] = &unk_24D0EE0D8;
      v23 = v27;
      v24 = v28;
      v25 = v29;
      v21 = v7;
      v26 = uint64;
      v22 = v5;
      -[MDSearchableIndexService donateRelevantActions:bundleID:options:completionHandler:](self, "donateRelevantActions:bundleID:options:completionHandler:", v17, v11, v10, v20);

    }
    si_tracing_log_span_end();
    v18 = v31;
    *(_OWORD *)v12 = v30;
    *(_OWORD *)(v12 + 16) = v18;
    *(_QWORD *)(v12 + 32) = v32;

  }
  return v8;
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x2199C2D78]();
  if (!v11)
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService donateRelevantActions:bundleID:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, 0, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v12)
      v12[2](v12, v15);
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "checkBundleIdentifier:", v11);

      if (v17)
      {
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __85__MDSearchableIndexService_donateRelevantActions_bundleID_options_completionHandler___block_invoke;
        v18[3] = &unk_24D0EDE38;
        v19 = v10;
        v20 = v11;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v18);

      }
    }
    if (v12)
      v12[2](v12, 0);
  }

  objc_autoreleasePoolPop(v13);
}

void __50__MDSearchableIndexService_donateRelevantActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for donateRelevantActions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)deleteAllUserActivities:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t spanid;
  __int128 v17;
  void *v18;
  __int128 v19;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v12 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v13 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v14 = *(_OWORD *)(v13 + 16);
    v31 = *(_OWORD *)v13;
    v32 = v14;
    v33 = *(_QWORD *)(v13 + 32);
    v15 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v13 = v15;
    *(_QWORD *)(v13 + 8) = spanid;
    *(_QWORD *)(v13 + 16) = 0;
    *(_DWORD *)(v13 + 24) = uint64;
    *(_BYTE *)(v13 + 28) = 102;
    *(_QWORD *)(v13 + 32) = "-[MDSearchableIndexService deleteAllUserActivities:]";
    si_tracing_log_span_begin();
    v17 = *(_OWORD *)(v13 + 16);
    v28 = *(_OWORD *)v13;
    v29 = v17;
    v30 = *(_QWORD *)(v13 + 32);
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __52__MDSearchableIndexService_deleteAllUserActivities___block_invoke;
    v21[3] = &unk_24D0EE0D8;
    v24 = v28;
    v25 = v29;
    v26 = v30;
    v22 = v7;
    v27 = uint64;
    v23 = v5;
    -[MDSearchableIndexService deleteAllUserActivities:fromClient:options:completionHandler:](self, "deleteAllUserActivities:fromClient:options:completionHandler:", v12, v18, v11, v21);

    si_tracing_log_span_end();
    v19 = v32;
    *(_OWORD *)v13 = v31;
    *(_OWORD *)(v13 + 16) = v19;
    *(_QWORD *)(v13 + 32) = v33;

  }
  return v9;
}

- (NSString)clientPersonaID
{
  return self->_clientPersonaID;
}

- (void)_processIndexDataForBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 completionHandler:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v29;
  id v30;

  v30 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v29 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a6) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v27) = 1;
    v26 = v29;
    -[MDIndexer indexFromBundle:protectionClass:personaID:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:canCreateNewIndex:completionHandler:](self->_indexer, "indexFromBundle:protectionClass:personaID:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:canCreateNewIndex:completionHandler:", v30, v18, v19, a6, v20, v29, 0, v21, v22, v23, v24, v27, v25);
LABEL_6:

    goto LABEL_7;
  }
  v26 = v29;
  if (v25)
  {
    (*((void (**)(id, _QWORD))v25 + 2))(v25, 0);
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)_canProcessIndexDataForBundle:(id)a3 itemsDecoder:(id)a4 deletesDecoder:(id)a5 clientState:(id)a6 clientStateName:(id)a7 outError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  uint64_t Count;
  BOOL v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, 0, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_9;
  if (v17 && !v18)
  {
    logForCSLogCategoryIndex();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService _canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1002, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v21 = v19 == 0;
    goto LABEL_10;
  }
  if (v17)
  {
    v19 = 0;
    v21 = 1;
  }
  else
  {
    if (v15 && (objc_msgSend(v15, "obj"), _MDPlistGetPlistObjectType() == 240))
    {
      objc_msgSend(v15, "obj");
      Count = _MDPlistArrayGetCount();
    }
    else
    {
      Count = 0;
    }
    if (v16 && (objc_msgSend(v16, "obj"), _MDPlistGetPlistObjectType() == 240))
    {
      objc_msgSend(v16, "obj");
      v24 = _MDPlistArrayGetCount() != 0;
    }
    else
    {
      v24 = 0;
    }
    v19 = 0;
    if (Count)
      v21 = 1;
    else
      v21 = v24;
  }
LABEL_10:
  if (a8)
    *a8 = objc_retainAutorelease(v19);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_clientPersonaID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
}

uint64_t __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __42__MDSearchableIndexService_deleteDomains___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)v3;
  v12 = *(_OWORD *)(v3 + 16);
  v13 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteDomains";
  si_tracing_log_span_begin();
  v9 = (id)objc_opt_self();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(_QWORD *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 32) = v13;

}

void __45__MDSearchableIndexService_processIndexData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v14 = *(_OWORD *)v3;
  v15 = *(_OWORD *)(v3 + 16);
  v16 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for processIndexData";
  si_tracing_log_span_begin();
  v9 = (id)objc_opt_self();
  v10 = (id)objc_opt_self();
  v11 = (id)objc_opt_self();
  v12 = (id)objc_opt_self();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 64), "id", *(_QWORD *)(a1 + 120));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), *(xpc_object_t *)(a1 + 64));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v14;
  *(_OWORD *)(v3 + 16) = v15;
  *(_QWORD *)(v3 + 32) = v16;

}

void __52__MDSearchableIndexService_deleteAllUserActivities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteAllUserActivities";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

void __50__MDSearchableIndexService_deleteAllInteractions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteAllInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  int64_t v23;
  void *v24;
  int v25;
  int64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *))a8;
  v19 = (void *)MEMORY[0x2199C2D78]();
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v35 = v16;
    v36 = 2112;
    v37 = v15;
    v38 = 2112;
    v39 = v17;
    v40 = 2048;
    v41 = a7;
    _os_log_debug_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEBUG, "(%@) addInteraction:%@, protectionClass:%@, options:0x%lx", buf, 0x2Au);
  }

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v17, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (v18)
      v18[2](v18, v21);
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v28 = v19;
      v22 = v15;
      v23 = a7;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "checkBundleIdentifier:", v16);

      v26 = v23;
      v15 = v22;
      v19 = v28;
      if (v25)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __110__MDSearchableIndexService_addInteraction_intentClassName_bundleID_protectionClass_options_completionHandler___block_invoke;
        v29[3] = &unk_24D0EE060;
        v30 = v14;
        v31 = v15;
        v32 = v16;
        v33 = v17;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", v26, v29);

      }
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
        -[MDIndexer addInteraction:bundleID:protectionClass:](self->_indexer, "addInteraction:bundleID:protectionClass:", v27, v16, v17);

    }
    if (v18)
      v18[2](v18, 0);
  }

  objc_autoreleasePoolPop(v19);
}

void __43__MDSearchableIndexService_addInteraction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for addInteraction";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

void __41__MDSearchableIndexService_issueCommand___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __41__MDSearchableIndexService_issueCommand___block_invoke_2_cold_1(a1, v8, v9);

  }
  else
  {
    *(_BYTE *)(v7 + 24) = 1;
    if ((*(_DWORD *)(a1 + 120) & 0x80000000) == 0)
      guarded_close_np();
    v10 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v21 = *(_OWORD *)v10;
    v22 = *(_OWORD *)(v10 + 16);
    v23 = *(_QWORD *)(v10 + 32);
    v11 = *(_QWORD *)(a1 + 104);
    v12 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)v10 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(v10 + 16) = v12;
    *(_QWORD *)(v10 + 32) = v11;
    v18 = *(_OWORD *)(a1 + 72);
    v19 = *(_OWORD *)(a1 + 88);
    v20 = *(_QWORD *)(a1 + 104);
    v13 = *(_QWORD *)v10;
    spanid = si_tracing_calc_next_spanid();
    v15 = *(_QWORD *)(v10 + 8);
    *(_QWORD *)v10 = v13;
    *(_QWORD *)(v10 + 8) = spanid;
    *(_QWORD *)(v10 + 16) = v15;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = "completion handler for issueCommand";
    si_tracing_log_span_begin();
    if (*(_QWORD *)(a1 + 32))
    {
      csindex_xpc_dictionary_encode_status_with_error();
      if (v5)
      {
        v16 = *(void **)(a1 + 32);
        v17 = objc_retainAutorelease(v5);
        xpc_dictionary_set_data(v16, "data", (const void *)objc_msgSend(v17, "bytes", v18, v19, v20), objc_msgSend(v17, "length"));
      }
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 112));
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
    }
    si_tracing_log_span_end();
    *(_OWORD *)v10 = v21;
    *(_OWORD *)(v10 + 16) = v22;
    *(_QWORD *)(v10 + 32) = v23;
  }

}

uint64_t __110__MDSearchableIndexService_addInteraction_intentClassName_bundleID_protectionClass_options_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[SpotlightSender addInteraction:intentClassName:bundleID:protectionClass:client:](SpotlightSender, "addInteraction:intentClassName:bundleID:protectionClass:client:", a1[4], a1[5], a1[6], a1[7], a2);
}

- (BOOL)addInteraction:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  uint64_t uint64;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v30;
  MDSearchableIndexService *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    v31 = self;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v35 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v30 = xpc_dictionary_get_uint64(v4, "opt");
    v33 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", v4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v10, "copy");

    v11 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v12 = *(_OWORD *)(v11 + 16);
    v49 = *(_OWORD *)v11;
    v50 = v12;
    v51 = *(_QWORD *)(v11 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = spanid;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = "-[MDSearchableIndexService addInteraction:]";
    si_tracing_log_span_begin();
    v15 = *(_OWORD *)(v11 + 16);
    v46 = *(_OWORD *)v11;
    v47 = v15;
    v48 = *(_QWORD *)(v11 + 32);
    v16 = *(_QWORD *)v11;
    v17 = si_tracing_calc_next_spanid();
    v18 = *(_QWORD *)(v11 + 8);
    v19 = *(_DWORD *)(v11 + 24);
    if (v35)
    {
      v20 = objc_retainAutorelease(v35);
      if (!strcmp((const char *)objc_msgSend(v20, "UTF8String"), "NSFileProtectionComplete"))
      {
        v23 = "Class A index";
      }
      else
      {
        v21 = objc_retainAutorelease(v20);
        if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v23 = "Class B index";
        }
        else
        {
          v22 = objc_retainAutorelease(v21);
          if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v23 = "Class C index";
          }
          else
          {
            v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v23 = "Nil index";
    }
    *(_QWORD *)v11 = v16;
    *(_QWORD *)(v11 + 8) = v17;
    *(_QWORD *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    v24 = *(_OWORD *)(v11 + 16);
    v43 = *(_OWORD *)v11;
    v44 = v24;
    v45 = *(_QWORD *)(v11 + 32);
    v25 = objc_msgSend(v34, "length");
    v8 = v25 != 0;
    if (v25)
    {
      v26 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "icn", v4);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __43__MDSearchableIndexService_addInteraction___block_invoke;
      v36[3] = &unk_24D0EE0D8;
      v39 = v43;
      v40 = v44;
      v41 = v45;
      v37 = v7;
      v42 = uint64;
      v38 = v5;
      -[MDSearchableIndexService addInteraction:intentClassName:bundleID:protectionClass:options:completionHandler:](v31, "addInteraction:intentClassName:bundleID:protectionClass:options:completionHandler:", v34, v26, v33, v35, v30, v36);

    }
    si_tracing_log_span_end();
    v27 = v47;
    *(_OWORD *)v11 = v46;
    *(_OWORD *)(v11 + 16) = v27;
    *(_QWORD *)(v11 + 32) = v48;
    si_tracing_log_span_end();
    v28 = v50;
    *(_OWORD *)v11 = v49;
    *(_OWORD *)(v11 + 16) = v28;
    *(_QWORD *)(v11 + 32) = v51;

  }
  return v8;
}

- (void)_dispatchToReceiversWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 deletes:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  id v23;
  id v24;
  const __CFString *v25;
  const __CFString *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = MEMORY[0x24BDAC760];
  if (v19)
  {
    logForCSLogCategoryDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v15;
      if (+[SpotlightSender jobForTest:](SpotlightSender, "jobForTest:", a5))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v23 = v18;
      v24 = v17;
      if (+[SpotlightSender jobForDuet:](SpotlightSender, "jobForDuet:", a5))
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      if (+[SpotlightSender jobForSuggestions:](SpotlightSender, "jobForSuggestions:", a5))
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v20 = MEMORY[0x24BDAC760];
      v39 = v14;
      v40 = 2048;
      v41 = a5;
      v42 = 2112;
      v43 = v22;
      v15 = v28;
      v44 = 2112;
      v45 = v25;
      v17 = v24;
      v18 = v23;
      v46 = 2112;
      v47 = v26;
      _os_log_impl(&dword_213CF1000, v21, OS_LOG_TYPE_DEFAULT, "_dispatchToReceivers, deleteSearchableItemsWithEncodedIdentifiers, bundleID:%@, options:0x%lx, test/duet/suggestions:%@/%@/%@", buf, 0x34u);
    }

    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke;
    v35[3] = &unk_24D0EDE38;
    v36 = v19;
    v37 = v14;
    +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v35);

  }
  if (v16)
  {
    logForCSLogCategoryDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[MDSearchableIndexService _dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:].cold.1();

    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke_48;
    v29[3] = &unk_24D0EDE60;
    v30 = v18;
    v31 = v17;
    v32 = v16;
    v33 = v14;
    v34 = v15;
    +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v29);

  }
}

- (NSString)processDescription
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  __CFString *v4;

  -[MDSearchableIndexService clientConnection](self, "clientConnection");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC24C8], "processNameForPID:", xpc_connection_get_pid(v2));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24D0EF078;
  }

  return (NSString *)v4;
}

- (void)_makeActivityQueueIfNecessary
{
  MDSearchableIndexService *v2;
  void *v3;
  id v4;
  uint64_t v5;
  CSIndexingQueue *activityQueue;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activityQueue && (objc_msgSend(MEMORY[0x24BDC24D0], "disabledUserActivities") & 1) == 0)
  {
    location = 0;
    objc_initWeak(&location, v2);
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __57__MDSearchableIndexService__makeActivityQueueIfNecessary__block_invoke;
    v10 = &unk_24D0EDE10;
    objc_copyWeak(&v11, &location);
    v3 = (void *)objc_msgSend(&v7, "copy");
    v4 = objc_alloc(MEMORY[0x24BDC2408]);
    v5 = objc_msgSend(v4, "initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:", 1, 0, v3, 1.0, 0.25, v7, v8, v9, v10);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (CSIndexingQueue *)v5;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

void __57__MDSearchableIndexService__makeActivityQueueIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Flushing UA queue, count:%lu", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchActivities:", v3);

  objc_autoreleasePoolPop(v4);
}

- (CSIndexingQueue)activityQueue
{
  MDSearchableIndexService *v2;
  CSIndexingQueue *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityQueue;
  objc_sync_exit(v2);

  return v3;
}

uint64_t __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsWithEncodedIdentifiers:bundleID:client:](SpotlightSender, "deleteSearchableItemsWithEncodedIdentifiers:bundleID:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke_48(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;

  if ((a2 | 2) == 2 && ((v4 = (void *)a1[4]) != 0 || (v4 = (void *)a1[5]) != 0))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  +[SpotlightSender addOrUpdateSearchableItems:itemsContent:bundleID:protectionClass:client:](SpotlightSender, "addOrUpdateSearchableItems:itemsContent:bundleID:protectionClass:client:", a1[6], v5, a1[7], a1[8], a2);

}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  NSObject *v17;
  void *v18;
  MDIndexer *indexer;
  _QWORD v20[4];
  void (**v21)(id, void *);
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v16 = (void *)MEMORY[0x2199C2D78]();
  if (v14)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryIndex();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v14;
    v24 = 2048;
    v25 = objc_msgSend(v12, "count");
    v26 = 2112;
    v27 = v12;
    v28 = 2048;
    v29 = a6;
    _os_log_debug_impl(&dword_213CF1000, v17, OS_LOG_TYPE_DEBUG, "(%@) willModifySearchableItemsWithIdentifiers, identifiers/%ld:%@, options:0x%lx", buf, 0x2Au);
  }

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, v12, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, v18);
LABEL_15:

    }
  }
  else
  {
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a6)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __123__MDSearchableIndexService_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke;
      v20[3] = &unk_24D0EB898;
      v21 = v15;
      -[MDIndexer willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:](indexer, "willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:", v12, v13, v14, a6, v20);
      v15 = v21;
      goto LABEL_15;
    }
    if (v15)
    {
      v15[2](v15, 0);
      goto LABEL_15;
    }
  }

  objc_autoreleasePoolPop(v16);
}

uint64_t __123__MDSearchableIndexService_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  int64_t v24;
  void *v25;
  int v26;
  MDIndexer *indexer;
  void *v28;
  _QWORD v29[4];
  void (**v30)(id, void *);
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *))a8;
  v19 = (void *)MEMORY[0x2199C2D78]();
  if (v16)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryIndex();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v16;
    v36 = 2112;
    v37 = v15;
    v38 = 2048;
    v39 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEFAULT, "(%@) deleteSearchableItemsWithDomainIdentifiers, protectionClass:%@, domainIdentifier num:%ld", buf, 0x20u);
  }

  logForCSLogCategoryIndex();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, v14, v15, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (v18)
    {
      v18[2](v18, v22);
LABEL_20:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v28 = v19;
      v23 = v17;
      v24 = a7;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "checkBundleIdentifier:", v16);

      a7 = v24;
      v17 = v23;
      v19 = v28;
      if (v26)
      {
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke;
        v31[3] = &unk_24D0EDE38;
        v32 = v14;
        v33 = v16;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a7, v31);

      }
    }
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a7)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke_2;
      v29[3] = &unk_24D0EB898;
      v30 = v18;
      -[MDIndexer deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:](indexer, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:", v14, v15, v16, v17, a7, v29);
      v18 = v30;
      goto LABEL_20;
    }
    if (v18)
    {
      v18[2](v18, 0);
      goto LABEL_20;
    }
  }

  objc_autoreleasePoolPop(v19);
}

uint64_t __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsWithDomainIdentifiers:bundleID:client:](SpotlightSender, "deleteSearchableItemsWithDomainIdentifiers:bundleID:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a5;
  v8 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryIndex();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService updateCorrectionsWithFilePath:options:completionHandler:].cold.1();

  +[SPCorrectionHandler sharedHandler](SPCorrectionHandler, "sharedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithFilePath:", v6);

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  objc_autoreleasePoolPop(v8);

}

- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 reply:(id)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  MDIndexer *indexer;
  uint64_t v28;
  _QWORD v30[4];
  void (**v31)(id, uint64_t);
  void (**v32)(id, uint64_t);

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v22 = (void (**)(id, uint64_t))a11;
  v23 = (void *)MEMORY[0x2199C2D78]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v19;
  else
    v24 = 0;
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, v24, v17, v18);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v22[2](v22, v25);

  }
  else
  {
    indexer = self->_indexer;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __123__MDSearchableIndexService_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke;
    v30[3] = &unk_24D0EDEB0;
    v31 = (void (**)(id, uint64_t))v21;
    v32 = v22;
    LODWORD(v28) = a9;
    -[MDIndexer fetchAttributes:protectionClass:bundleID:identifiers:userCtx:flags:qos:completionHandler:](indexer, "fetchAttributes:protectionClass:bundleID:identifiers:userCtx:flags:qos:completionHandler:", v16, v17, v18, v19, v20, a8, v28, v30);

    v22 = v31;
  }

  objc_autoreleasePoolPop(v23);
}

void __123__MDSearchableIndexService_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistBytes:forKey:sizeKey:", *(_QWORD *)(a1 + 32), a2, "fetch-data-key", "fetch-data-size");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  MDIndexer *indexer;
  _QWORD v22[4];
  void (**v23)(id, void *);
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v16 = (void *)MEMORY[0x2199C2D78]();
  if (v14)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryIndex();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v14;
    v29 = 2112;
    v30 = v12;
    v31 = 2048;
    v32 = a6;
    _os_log_debug_impl(&dword_213CF1000, v17, OS_LOG_TYPE_DEBUG, "(%@) deleteSearchableItemsSinceDate, startDate:%@, options:0x%lx", buf, 0x20u);
  }

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, v18);
LABEL_18:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "checkBundleIdentifier:", v14);

      if (v20)
      {
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke;
        v24[3] = &unk_24D0EDE38;
        v25 = v12;
        v26 = v14;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a6, v24);

      }
    }
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a6)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
      v22[3] = &unk_24D0EB898;
      v23 = v15;
      -[MDIndexer deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:](indexer, "deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:", v12, v13, v14, a6, v22);
      v15 = v23;
      goto LABEL_18;
    }
    if (v15)
    {
      v15[2](v15, 0);
      goto LABEL_18;
    }
  }

  objc_autoreleasePoolPop(v16);
}

uint64_t __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsSinceDate:bundleID:client:](SpotlightSender, "deleteSearchableItemsSinceDate:bundleID:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!-[MDSearchableIndexService searchInternal](self, "searchInternal")
    && (!-[MDSearchableIndexService allowMail](self, "allowMail")
     || (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0))
  {
    logForCSLogCategoryIndex();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v15);

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer provideDataForBundle:identifier:type:completionHandler:](self->_indexer, "provideDataForBundle:identifier:type:completionHandler:", v10, v11, v12, v13);
LABEL_11:

    goto LABEL_12;
  }
  if (v13)
  {
    v13[2](v13, 0, 0);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!-[MDSearchableIndexService searchInternal](self, "searchInternal"))
  {
    logForCSLogCategoryIndex();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v15);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer provideFileURLForBundle:identifier:type:completionHandler:](self->_indexer, "provideFileURLForBundle:identifier:type:completionHandler:", v10, v11, v12, v13);
LABEL_9:

    goto LABEL_10;
  }
  if (v13)
  {
    v13[2](v13, 0, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  _BOOL4 v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("provide:")))
  {
    if (-[MDSearchableIndexService searchInternal](self, "searchInternal"))
    {
      if (-[MDSearchableIndexService allowNotifications](self, "allowNotifications"))
        goto LABEL_29;
      v13 = 1;
    }
    else
    {
      if (-[MDSearchableIndexService allowMail](self, "allowMail"))
      {
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        if ((unint64_t)objc_msgSend(v14, "count") >= 4)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobilemail"));

          if ((v16 & 1) != 0)
            v13 = 1;
        }

      }
      else
      {
        v13 = 0;
      }
      if (-[MDSearchableIndexService allowNotifications](self, "allowNotifications"))
        goto LABEL_28;
    }
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") <= 5)
    {
      if ((unint64_t)objc_msgSend(v17, "count") < 4)
      {
        v19 = 0;
        goto LABEL_23;
      }
      v18 = 3;
    }
    else
    {
      v18 = 4;
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.usernotificationsd")))
    {
      logForCSLogCategoryDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:].cold.2(self, v20);

      goto LABEL_33;
    }

LABEL_28:
    if (v13)
      goto LABEL_29;
LABEL_33:
    logForCSLogCategoryIndex();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v22);

    goto LABEL_36;
  }
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("setUISearchEnabled:")) & 1) == 0
    && !self->_isInternal
    && !self->_isPrivate)
  {
    goto LABEL_33;
  }
LABEL_29:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:](self->_indexer, "_issueCommand:outFileDescriptor:searchContext:completionHandler:", v10, v8, v11, v12);
LABEL_36:

    goto LABEL_37;
  }
  if (v12)
  {
    v12[2](v12, 0, 0);
    goto LABEL_36;
  }
LABEL_37:

}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  void (**v10)(void);

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v10 = (void (**)(void))a5;
  if (self->_isInternal || self->_isPrivate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MDIndexer _issueDiagnose:logQuery:completionHandler:](self->_indexer, "_issueDiagnose:logQuery:completionHandler:", v6, v5, v10);
    }
    else
    {
      if (!v10)
        return;
      v10[2]();
    }

  }
  else
  {
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1003, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(void), _QWORD, void *))v10[2])(v10, 0, v9);

  }
}

- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:](self->_indexer, "prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:", v13, v10, v11, a5);
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v12);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer finishIndexingWhileLocked:protectionClass:completionHandler:](self->_indexer, "finishIndexingWhileLocked:protectionClass:completionHandler:", v11, v8, v9);
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v10);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  MDIndexer *indexer;
  void *v23;
  MDIndexer *v24;
  _QWORD v25[4];
  void (**v26)(id, void *);
  _QWORD v27[4];
  void (**v28)(id, void *);
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v9 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a7;
  v15 = (void *)MEMORY[0x2199C2D78]();
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryIndex();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v17 = "YES";
    else
      v17 = "NO";
    *(_DWORD *)buf = 138413314;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2080;
    v36 = v17;
    v37 = 2048;
    v38 = a6;
    v39 = 2048;
    v40 = qos_class_self();
    _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllSearchableItemsWithBundleID, protectionClass:%@, shouldGC:%s, options:0x%lx, qos:0x%lx", buf, 0x34u);
  }

  -[MDSearchableIndexService _checkNonEmptyBundle:protectionClass:](self, "_checkNonEmptyBundle:protectionClass:", v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v14)
    {
      v14[2](v14, v18);
LABEL_23:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "checkBundleIdentifier:", v12);

      if (v20)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke;
        v29[3] = &unk_24D0EDED8;
        v30 = v12;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a6, v29);

      }
    }
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a6))
    {
      v21 = objc_opt_respondsToSelector();
      indexer = self->_indexer;
      if ((v21 & 1) != 0)
      {
        -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_2;
        v27[3] = &unk_24D0EB898;
        v28 = v14;
        -[MDIndexer deleteAllSearchableItemsWithBundleID:fromClient:protectionClass:shouldGC:completionHandler:](indexer, "deleteAllSearchableItemsWithBundleID:fromClient:protectionClass:shouldGC:completionHandler:", v12, v23, v13, v9, v27);

        v14 = v28;
        goto LABEL_23;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v24 = self->_indexer;
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_3;
        v25[3] = &unk_24D0EB898;
        v26 = v14;
        -[MDIndexer deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:](v24, "deleteAllSearchableItemsWithProtectionClass:forBundleID:options:completionHandler:", v13, v12, a6, v25);
        v14 = v26;
        goto LABEL_23;
      }
    }
    if (v14)
    {
      v14[2](v14, 0);
      goto LABEL_23;
    }
  }

  objc_autoreleasePoolPop(v15);
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllSearchableItemsWithBundleID:client:](SpotlightSender, "deleteAllSearchableItemsWithBundleID:client:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
  -[MDSearchableIndexService _deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:](self, "_deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:", a3, a4, 1, 0, a6);
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  -[MDSearchableIndexService _deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:](self, "_deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:", a4, a3, 1, a5, a6);
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  int v25;
  uint64_t v26;
  const __CFString *v27;
  int64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  int64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)MEMORY[0x2199C2D78]();
  if (v16)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, v14, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v29 = v18;
    logForCSLogCategoryIndex();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v28 = a4;
      v21 = CFSTR("YES");
      if (+[SpotlightSender jobForTest:](SpotlightSender, "jobForTest:", a8))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v27 = v22;
      if (+[SpotlightSender jobForDuet:](SpotlightSender, "jobForDuet:", a8))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      if (!+[SpotlightSender jobForSuggestions:](SpotlightSender, "jobForSuggestions:", a8, v23))
        v21 = CFSTR("NO");
      *(_DWORD *)buf = 138414338;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      v39 = 2048;
      v40 = v28;
      v41 = 2048;
      v42 = a8;
      v43 = 2112;
      v44 = v27;
      v45 = 2112;
      v46 = v26;
      v47 = 2112;
      v48 = v21;
      a4 = v28;
      v49 = 2048;
      v50 = objc_msgSend(v14, "count");
      v51 = 2112;
      v52 = v14;
      _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEFAULT, "(%@) changeStateOfSearchableItemsWithUIDs (delete or purge), uti:%@, state:%ld, options:0x%lx, test/duet/suggestions/:%@/%@/%@, identifiers/%ld:%@", buf, 0x5Cu);
    }

    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "checkBundleIdentifier:", v16);

      if (v25)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __120__MDSearchableIndexService_changeStateOfSearchableItemsWithUIDs_toState_protectionClass_forBundleID_forUTIType_options___block_invoke;
        v30[3] = &unk_24D0EDF00;
        v34 = a4;
        v31 = v14;
        v32 = v16;
        v33 = v17;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a8, v30);

      }
    }
    v18 = v29;
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a8)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MDIndexer changeStateOfSearchableItemsWithUIDs:toState:protectionClass:forBundleID:forUTIType:options:](self->_indexer, "changeStateOfSearchableItemsWithUIDs:toState:protectionClass:forBundleID:forUTIType:options:", v14, a4, v15, v16, v17, a8);
    }
  }

  objc_autoreleasePoolPop(v18);
}

_QWORD *__120__MDSearchableIndexService_changeStateOfSearchableItemsWithUIDs_toState_protectionClass_forBundleID_forUTIType_options___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  v2 = result[7];
  if (v2 == 1)
    return (_QWORD *)+[SpotlightSender purgeSearchableItemsWithIdentifiers:bundleID:client:](SpotlightSender, "purgeSearchableItemsWithIdentifiers:bundleID:client:", result[4], result[5], a2);
  if (v2 == 2)
    return (_QWORD *)+[SpotlightSender deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:](SpotlightSender, "deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:", result[4], result[5], result[6], a2);
  return result;
}

- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x2199C2D78]();
  if (!v10)
  {
    -[MDSearchableIndexService protectionClass](self, "protectionClass");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  logForCSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v18;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_debug_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEBUG, "(%@) userPerformedAction, action:%@, item:%@, protectionClass:%@", buf, 0x2Au);

  }
  if (v8 && v9)
  {
    v20 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", v13, 0, v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC24B0]), "initWithAction:item:", v8, v9);
      objc_msgSend(v15, "setProtectionClass:", v10);
      -[MDSearchableIndexService _makeActivityQueueIfNecessary](self, "_makeActivityQueueIfNecessary");
      -[MDSearchableIndexService activityQueue](self, "activityQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queueItems:", v17);

    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[MDSearchableIndexService userPerformedAction:withItem:protectionClass:].cold.1();
  }

  objc_autoreleasePoolPop(v11);
}

- (void)_dispatchActivities:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  MDSearchableIndexService *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "protectionClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke;
  v18[3] = &unk_24D0EDF50;
  v19 = v6;
  v20 = self;
  v16 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v18);

}

void __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (v7 == 1)
      v9 = "y";
    else
      v9 = "ies";
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v37 = v7;
    v38 = 2080;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v5;
    _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "Sending %lu activit%s to the receivers, bundleID:%@, protectionClass:%@", buf, 0x2Au);
  }

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 19))
  {
    +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "checkBundleIdentifier:", *(_QWORD *)(a1 + 32));

    if (v12)
    {
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke_97;
      v31[3] = &unk_24D0EDF28;
      v32 = v6;
      v33 = *(id *)(a1 + 32);
      v34 = v5;
      +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", 0, v31);

    }
  }
  logForCSLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v7 == 1)
      v14 = "y";
    else
      v14 = "ies";
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v37 = v7;
    v38 = 2080;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v5;
    _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "Sending %lu activit%s to the index, bundleID:%@, protectionClass:%@", buf, 0x2Au);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v28;
    *(_QWORD *)&v18 = 138412546;
    v26 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v22, "action", v26, (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "searchableItem");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "noIndex") & 1) == 0 && (objc_msgSend(v23, "eligibility") & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "userPerformedAction:withItem:protectionClass:forBundleID:personaID:", v23, v24, v5, *(_QWORD *)(a1 + 32), 0);
        }
        else
        {
          logForCSLogCategoryDefault();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            v37 = (uint64_t)v23;
            v38 = 2112;
            v39 = v24;
            _os_log_debug_impl(&dword_213CF1000, v25, OS_LOG_TYPE_DEBUG, "Ignoring action:%@, item:%@", buf, 0x16u);
          }

        }
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

}

uint64_t __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke_97(_QWORD *a1, uint64_t a2)
{
  return +[SpotlightSender addUserActions:bundleID:protectionClass:client:](SpotlightSender, "addUserActions:bundleID:protectionClass:client:", a1[4], a1[5], a1[6], a2);
}

- (void)_dispatchActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MDSearchableIndexService *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  MDSearchableIndexService *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isInternal)
  {
    v28 = self;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v35;
LABEL_4:
      v11 = 0;
      v12 = v9;
      while (1)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v11), "item");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundleID");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "length"))
        {
          if (!objc_msgSend(v5, "isEqualToString:", v9))
            break;
        }
        ++v11;
        v12 = v9;
        if (v8 == v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_16;
        }
      }

      if (objc_msgSend(v6, "count") == 1)
      {
        v14 = v28;
        v15 = v6;
        v16 = v9;
        goto LABEL_17;
      }
      v27 = v4;
      v17 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v6;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v23, "item");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "bundleID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v25, "length"))
            {
              v9 = v25;
            }
            else
            {
              v9 = v5;

            }
            objc_msgSend(v17, "objectForKeyedSubscript:", v9);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, v9);
            }
            objc_msgSend(v26, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v20);
      }

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __48__MDSearchableIndexService__dispatchActivities___block_invoke;
      v29[3] = &unk_24D0EDF78;
      v29[4] = v28;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v29);

      v4 = v27;
    }
    else
    {
      v9 = 0;
LABEL_16:

      v14 = v28;
      v15 = v6;
      v16 = v5;
LABEL_17:
      -[MDSearchableIndexService _dispatchActivities:bundleID:](v14, "_dispatchActivities:bundleID:", v15, v16);
    }

  }
  else
  {
    -[MDSearchableIndexService _dispatchActivities:bundleID:](self, "_dispatchActivities:bundleID:", v4, v5);
  }

}

uint64_t __48__MDSearchableIndexService__dispatchActivities___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchActivities:bundleID:", a3, a2);
}

- (void)flushUserActivities
{
  id v2;

  -[MDSearchableIndexService activityQueue](self, "activityQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD handler[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x2199C2D78]();
  -[MDSearchableIndexService clientConnection](self, "clientConnection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  -[MDSearchableIndexService clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 && v13)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "perform-job");
    objc_msgSend(v8, "xpc_dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v15, "j", v16);

    if (v9)
      xpc_dictionary_set_string(v15, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __83__MDSearchableIndexService_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
    handler[3] = &unk_24D0EDFA0;
    v18 = v10;
    xpc_connection_send_message_with_reply(v12, v15, v14, handler);

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
LABEL_8:

  }
  objc_autoreleasePoolPop(v11);

}

void __83__MDSearchableIndexService_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (MEMORY[0x2199C3444]() == MEMORY[0x24BDACFA0])
  {
    csindex_xpc_dictionary_decode_status_with_error();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  MDIndexer *indexer;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, void *);
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x2199C2D78]();
  if (!v10)
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService deleteAllUserActivities:fromClient:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkNonEmptyBundle:protectionClass:](self, "_checkNonEmptyBundle:protectionClass:", v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_16:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "checkBundleIdentifier:", v10);

      if (v17)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke;
        v22[3] = &unk_24D0EDED8;
        v23 = v10;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v22);

      }
    }
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a5)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke_2;
      v20[3] = &unk_24D0EB898;
      v21 = v12;
      -[MDIndexer deleteAllUserActivities:fromClient:completionHandler:](indexer, "deleteAllUserActivities:fromClient:completionHandler:", v10, v19, v20);

      v12 = v21;
      goto LABEL_16;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_16;
    }
  }

  objc_autoreleasePoolPop(v13);
}

uint64_t __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllUserActivities:client:](SpotlightSender, "deleteAllUserActivities:client:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, void *);

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x2199C2D78]();
  if (!v11)
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkNonEmptyBundle:protectionClass:](self, "_checkNonEmptyBundle:protectionClass:", v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_15:

    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "checkBundleIdentifier:", v11);

      if (v17)
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __109__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers_bundleID_options_completionHandler___block_invoke;
        v19[3] = &unk_24D0EDFC8;
        v20 = v10;
        v21 = v11;
        v22 = v12;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a5, v19);

      }
    }
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a5))
    {
      objc_msgSend(v10, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService _processIndexDataForBundle:protectionClass:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:completionHandler:](self, "_processIndexDataForBundle:protectionClass:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:completionHandler:", v11, 0, 0, a5, 0, 0, 0, 0, 0, v18, v12);

      goto LABEL_15;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_15;
    }
  }

  objc_autoreleasePoolPop(v13);
}

void __109__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers_bundleID_options_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = (id)MEMORY[0x2199C2F34](a1[6]);
  +[SpotlightSender deleteUserActivitiesWithPersistentIdentifiers:bundleID:client:retainedData:](SpotlightSender, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:client:retainedData:", v3, v4, a2, v5);

}

- (void)deleteActionsBeforeTime:(double)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  MDIndexer *indexer;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v16 = (unint64_t)a3;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "deleteActionsBeforeTime:%lu options:0x%lx", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a4)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __78__MDSearchableIndexService_deleteActionsBeforeTime_options_completionHandler___block_invoke;
      v13[3] = &unk_24D0EB898;
      v14 = v8;
      -[MDIndexer deleteActionsBeforeTime:completionHandler:](indexer, "deleteActionsBeforeTime:completionHandler:", v13, a3);
      v8 = v14;
LABEL_11:

      goto LABEL_12;
    }
    if (v8)
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
      goto LABEL_11;
    }
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    goto LABEL_11;
  }
LABEL_12:
  objc_autoreleasePoolPop(v9);
}

uint64_t __78__MDSearchableIndexService_deleteActionsBeforeTime_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteActionsWithIdentifiers:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  MDIndexer *indexer;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v17 = objc_msgSend(v8, "count");
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_INFO, "deleteActionsWithIdentifiers:%lu options:0x%lx", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    if (-[MDSearchableIndexService _jobForIndex:](self, "_jobForIndex:", a4)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __83__MDSearchableIndexService_deleteActionsWithIdentifiers_options_completionHandler___block_invoke;
      v14[3] = &unk_24D0EB898;
      v15 = v9;
      -[MDIndexer deleteActionsWithIdentifiers:completionHandler:](indexer, "deleteActionsWithIdentifiers:completionHandler:", v8, v14);
      v9 = v15;
LABEL_11:

      goto LABEL_12;
    }
    if (v9)
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
      goto LABEL_11;
    }
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v13);

    goto LABEL_11;
  }
LABEL_12:
  objc_autoreleasePoolPop(v10);

}

uint64_t __83__MDSearchableIndexService_deleteActionsWithIdentifiers_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_forceAppWithBundleID:(id)a3 toPerformJob:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_debug_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEBUG, "(%@) _forceAppWithBundleID, bundleID:%@, job:%@", (uint8_t *)&v12, 0x20u);

  }
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexRequestsPerformJob:forBundle:completionHandler:", v7, v6, 0);

  }
}

- (void)performDataMigrationWithTimeout:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(9, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = v6;
  v9 = v5;
  tracing_dispatch_async();

}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_4(a1);

  objc_msgSend(*(id *)(a1 + 40), "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allExtensionsWithBlock:", &__block_literal_global_115);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.corespotlight.dataMigration.start"), *(_QWORD *)(a1 + 40), 0);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 3);
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v12 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2;
    v30[3] = &unk_24D0EE010;
    v13 = v9;
    v31 = v13;
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_121;
    v28[3] = &unk_24D0EA758;
    v14 = v11;
    v29 = v14;
    v27 = (void *)v7;
    objc_msgSend(v6, "indexRequestsPerformJob:extensions:perExtensionCompletionHandler:completionHandler:", v10, v7, v30, v28);
    logForCSLogCategoryIndex();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_3();

    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "lastUpdateTime");
    v17 = v16;
    logForCSLogCategoryIndex();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_2();

    v19 = v17;
    do
    {
      v20 = v19;
      sleep(2u);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "lastUpdateTime");
      v19 = v21;
    }
    while (v20 != v21);
    logForCSLogCategoryIndex();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_1(v22, v19, v17);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    v32 = CFSTR("bundleIDs");
    v33[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("com.apple.corespotlight.dataMigration.finish"), v24, v25);

    v26 = *(_QWORD *)(a1 + 48);
    if (v26)
      (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, 0);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dontRunDuringMigration") ^ 1;
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2_cold_1();

  if (!v6)
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_sync_exit(v8);

  }
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_121(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)transferDeleteJournalsForProtectionClass:(const char *)a3 toDirectory:(int)a4 withCompletionHandler:(id)a5
{
  uint64_t v5;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MDIndexer *indexer;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, void *);
  stat v23;

  v5 = *(_QWORD *)&a4;
  v9 = (void (**)(id, void *))a5;
  memset(&v23, 0, sizeof(v23));
  if (fstat(v5, &v23))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD1128];
    v12 = *__error();
    v13 = v10;
    v14 = v11;
LABEL_15:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v20);

    goto LABEL_16;
  }
  if ((v23.st_mode & 0xF000) != 0x4000)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1128];
    v12 = 20;
    goto LABEL_15;
  }
  v15 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryIndex();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService transferDeleteJournalsForProtectionClass:toDirectory:withCompletionHandler:].cold.1(a2);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3);
  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v9)
      v9[2](v9, v18);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    indexer = self->_indexer;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __103__MDSearchableIndexService_transferDeleteJournalsForProtectionClass_toDirectory_withCompletionHandler___block_invoke;
    v21[3] = &unk_24D0EB898;
    v22 = v9;
    -[MDIndexer transferDeleteJournalsForProtectionClass:toDirectory:completionHandler:](indexer, "transferDeleteJournalsForProtectionClass:toDirectory:completionHandler:", v17, v5, v21);

    v9 = 0;
  }

  objc_autoreleasePoolPop(v15);
  if (!v18 && v9)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1128];
    v12 = 45;
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __103__MDSearchableIndexService_transferDeleteJournalsForProtectionClass_toDirectory_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v16 = (void *)MEMORY[0x2199C2D78]();
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v30 = 2048;
    v31 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_213CF1000, v17, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithIdentifiers, protectionClass:%@, identifiers num:%lu", buf, 0x20u);
  }

  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v14, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v15)
      v15[2](v15, v19);
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "checkBundleIdentifier:", v13);

      if (v21)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __113__MDSearchableIndexService_deleteInteractionsWithIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_24D0EDF28;
        v23 = v12;
        v24 = v13;
        v25 = v14;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a6, v22);

      }
    }
    if (v15)
      v15[2](v15, 0);
  }

  objc_autoreleasePoolPop(v16);
}

uint64_t __113__MDSearchableIndexService_deleteInteractionsWithIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[SpotlightSender deleteInteractionsWithIdentifiers:bundleID:protectionClass:client:](SpotlightSender, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:client:", a1[4], a1[5], a1[6], a2);
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v16 = (void *)MEMORY[0x2199C2D78]();
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    -[MDSearchableIndexService clientBundleID](self, "clientBundleID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_3;
  }
  -[MDSearchableIndexService protectionClass](self, "protectionClass");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v30 = 2048;
    v31 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_213CF1000, v17, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithGroupIdentifiers, protectionClass:%@, identifiers num:%lu", buf, 0x20u);
  }

  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[MDSearchableIndexService deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:].cold.1();

  -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, "_checkItems:identifiers:protectionClass:bundleID:", 0, 0, v14, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v15)
      v15[2](v15, v19);
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance](CSRecieverState, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "checkBundleIdentifier:", v13);

      if (v21)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __118__MDSearchableIndexService_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_24D0EDF28;
        v23 = v12;
        v24 = v13;
        v25 = v14;
        +[SpotlightSender dispatchWithOptions:block:](SpotlightSender, "dispatchWithOptions:block:", a6, v22);

      }
    }
    if (v15)
      v15[2](v15, 0);
  }

  objc_autoreleasePoolPop(v16);
}

uint64_t __118__MDSearchableIndexService_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[SpotlightSender deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:client:](SpotlightSender, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:client:", a1[4], a1[5], a1[6], a2);
}

void __36__MDSearchableIndexService_checkIn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t spanid;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13 = a2;
  v5 = a3;
  v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v14 = *(_OWORD *)v6;
  v15 = *(_OWORD *)(v6 + 16);
  v16 = *(_QWORD *)(v6 + 32);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v9 = *(_QWORD *)v6;
  spanid = si_tracing_calc_next_spanid();
  v11 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)v6 = v9;
  *(_QWORD *)(v6 + 8) = spanid;
  *(_QWORD *)(v6 + 16) = v11;
  *(_BYTE *)(v6 + 28) = 102;
  *(_QWORD *)(v6 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 96));
  v12 = *(void **)(a1 + 40);
  if (v12)
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "pc", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v6 = v14;
  *(_OWORD *)(v6 + 16) = v15;
  *(_QWORD *)(v6 + 32) = v16;

}

- (BOOL)prepareIndexingLocked:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  double v9;
  uint64_t uint64;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  MDSearchableIndexService *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
  {
    v29 = self;
    v31 = reply;
    v8 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v30 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v9 = xpc_dictionary_get_double(v4, "time");
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v11 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v12 = *(_OWORD *)(v11 + 16);
    v45 = *(_OWORD *)v11;
    v46 = v12;
    v47 = *(_QWORD *)(v11 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = spanid;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = "-[MDSearchableIndexService prepareIndexingLocked:]";
    si_tracing_log_span_begin();
    v15 = *(_OWORD *)(v11 + 16);
    v42 = *(_OWORD *)v11;
    v43 = v15;
    v44 = *(_QWORD *)(v11 + 32);
    v16 = *(_QWORD *)v11;
    v17 = si_tracing_calc_next_spanid();
    v18 = *(_QWORD *)(v11 + 8);
    v19 = *(_DWORD *)(v11 + 24);
    if (v8)
    {
      v20 = objc_retainAutorelease(v8);
      if (!strcmp((const char *)objc_msgSend(v20, "UTF8String"), "NSFileProtectionComplete"))
      {
        v23 = "Class A index";
      }
      else
      {
        v21 = objc_retainAutorelease(v20);
        if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v23 = "Class B index";
        }
        else
        {
          v22 = objc_retainAutorelease(v21);
          if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v23 = "Class C index";
          }
          else
          {
            v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v23 = "Nil index";
    }
    *(_QWORD *)v11 = v16;
    *(_QWORD *)(v11 + 8) = v17;
    *(_QWORD *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    v24 = *(_OWORD *)(v11 + 16);
    v39 = *(_OWORD *)v11;
    v40 = v24;
    v41 = *(_QWORD *)(v11 + 32);
    v7 = v31;
    if (v31)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __50__MDSearchableIndexService_prepareIndexingLocked___block_invoke;
      v32[3] = &unk_24D0EE0D8;
      v35 = v39;
      v36 = v40;
      v37 = v41;
      v33 = v31;
      v38 = uint64;
      v34 = v5;
      v25 = (void *)MEMORY[0x2199C2F34](v32);

    }
    else
    {
      v25 = 0;
    }
    -[MDSearchableIndexService prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:](v29, "prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:", v30, v8, v25, v9);

    si_tracing_log_span_end();
    v26 = v43;
    *(_OWORD *)v11 = v42;
    *(_OWORD *)(v11 + 16) = v26;
    *(_QWORD *)(v11 + 32) = v44;
    si_tracing_log_span_end();
    v27 = v46;
    *(_OWORD *)v11 = v45;
    *(_OWORD *)(v11 + 16) = v27;
    *(_QWORD *)(v11 + 32) = v47;

  }
  return v5 != 0;
}

void __50__MDSearchableIndexService_prepareIndexingLocked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)finishIndexingLocked:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  uint64_t uint64;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t spanid;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  MDSearchableIndexService *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
  {
    v28 = self;
    v30 = reply;
    v8 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v29 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v10 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v11 = *(_OWORD *)(v10 + 16);
    v44 = *(_OWORD *)v10;
    v45 = v11;
    v46 = *(_QWORD *)(v10 + 32);
    v12 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = spanid;
    *(_QWORD *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = "-[MDSearchableIndexService finishIndexingLocked:]";
    si_tracing_log_span_begin();
    v14 = *(_OWORD *)(v10 + 16);
    v41 = *(_OWORD *)v10;
    v42 = v14;
    v43 = *(_QWORD *)(v10 + 32);
    v15 = *(_QWORD *)v10;
    v16 = si_tracing_calc_next_spanid();
    v17 = *(_QWORD *)(v10 + 8);
    v18 = *(_DWORD *)(v10 + 24);
    if (v8)
    {
      v19 = objc_retainAutorelease(v8);
      if (!strcmp((const char *)objc_msgSend(v19, "UTF8String"), "NSFileProtectionComplete"))
      {
        v22 = "Class A index";
      }
      else
      {
        v20 = objc_retainAutorelease(v19);
        if (!strcmp((const char *)objc_msgSend(v20, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v22 = "Class B index";
        }
        else
        {
          v21 = objc_retainAutorelease(v20);
          if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v22 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v22 = "Class C index";
          }
          else
          {
            v22 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v22 = "Nil index";
    }
    *(_QWORD *)v10 = v15;
    *(_QWORD *)(v10 + 8) = v16;
    *(_QWORD *)(v10 + 16) = v17;
    *(_DWORD *)(v10 + 24) = v18;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = v22;
    si_tracing_log_span_begin();
    v23 = *(_OWORD *)(v10 + 16);
    v38 = *(_OWORD *)v10;
    v39 = v23;
    v40 = *(_QWORD *)(v10 + 32);
    v7 = v30;
    if (v30)
    {
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __49__MDSearchableIndexService_finishIndexingLocked___block_invoke;
      v31[3] = &unk_24D0EE0D8;
      v34 = v38;
      v35 = v39;
      v36 = v40;
      v32 = v30;
      v37 = uint64;
      v33 = v5;
      v24 = (void *)MEMORY[0x2199C2F34](v31);

    }
    else
    {
      v24 = 0;
    }
    -[MDSearchableIndexService finishIndexingWhileLocked:protectionClass:completionHandler:](v28, "finishIndexingWhileLocked:protectionClass:completionHandler:", v29, v8, v24);

    si_tracing_log_span_end();
    v25 = v42;
    *(_OWORD *)v10 = v41;
    *(_OWORD *)(v10 + 16) = v25;
    *(_QWORD *)(v10 + 32) = v43;
    si_tracing_log_span_end();
    v26 = v45;
    *(_OWORD *)v10 = v44;
    *(_OWORD *)(v10 + 16) = v26;
    *(_QWORD *)(v10 + 32) = v46;

  }
  return v5 != 0;
}

void __49__MDSearchableIndexService_finishIndexingLocked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  -[MDSearchableIndexService indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", a3, a4, 0, 0, a6, a7, a8, a9);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;

  v10 = (void (**)(id, void *))a10;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[MDSearchableIndexService indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:].cold.1();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

  }
}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 userActivities:(BOOL)a13 completionHandler:(id)a14
{
  void (**v14)(id, void *);
  NSObject *v15;
  void *v16;

  v14 = (void (**)(id, void *))a14;
  logForCSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MDSearchableIndexService indexFromBundle:protectionClass:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:userActivities:completionHandler:].cold.1();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16);

  }
}

- (BOOL)willModify:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t spanid;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  id v25;
  id v26;
  const char *v27;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  void *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  void *v37;
  MDSearchableIndexService *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v38 = self;
    v34 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v40 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v39 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v36 = xpc_dictionary_get_uint64(v4, "opt");
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDC23D0]);
    v35 = v11;
    objc_msgSend(v11, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:", v13);

    v33 = v14;
    objc_msgSend(v14, "decode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v16 = *(_OWORD *)(v15 + 16);
    v55 = *(_OWORD *)v15;
    v56 = v16;
    v57 = *(_QWORD *)(v15 + 32);
    v17 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v15 = v17;
    *(_QWORD *)(v15 + 8) = spanid;
    *(_QWORD *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = "-[MDSearchableIndexService willModify:]";
    si_tracing_log_span_begin();
    v19 = *(_OWORD *)(v15 + 16);
    v52 = *(_OWORD *)v15;
    v53 = v19;
    v54 = *(_QWORD *)(v15 + 32);
    v20 = *(_QWORD *)v15;
    v21 = si_tracing_calc_next_spanid();
    v22 = *(_QWORD *)(v15 + 8);
    v23 = *(_DWORD *)(v15 + 24);
    if (v40)
    {
      v24 = objc_retainAutorelease(v40);
      if (!strcmp((const char *)objc_msgSend(v24, "UTF8String"), "NSFileProtectionComplete"))
      {
        v27 = "Class A index";
      }
      else
      {
        v25 = objc_retainAutorelease(v24);
        if (!strcmp((const char *)objc_msgSend(v25, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v27 = "Class B index";
        }
        else
        {
          v26 = objc_retainAutorelease(v25);
          if (!strcmp((const char *)objc_msgSend(v26, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v27 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v27 = "Class C index";
          }
          else
          {
            v27 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v27 = "Nil index";
    }
    *(_QWORD *)v15 = v20;
    *(_QWORD *)(v15 + 8) = v21;
    *(_QWORD *)(v15 + 16) = v22;
    *(_DWORD *)(v15 + 24) = v23;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = v27;
    si_tracing_log_span_begin();
    v28 = *(_OWORD *)(v15 + 16);
    v49 = *(_OWORD *)v15;
    v50 = v28;
    v51 = *(_QWORD *)(v15 + 32);
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __39__MDSearchableIndexService_willModify___block_invoke;
    v41[3] = &unk_24D0EE100;
    v45 = v49;
    v46 = v28;
    v47 = v51;
    v29 = v35;
    v42 = v29;
    v43 = v7;
    v48 = uint64;
    v44 = v5;
    -[MDSearchableIndexService willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:](v38, "willModifySearchableItemsWithIdentifiers:protectionClass:forBundleID:options:completionHandler:", v37, v40, v39, v36, v41);

    si_tracing_log_span_end();
    v30 = v53;
    *(_OWORD *)v15 = v52;
    *(_OWORD *)(v15 + 16) = v30;
    *(_QWORD *)(v15 + 32) = v54;
    si_tracing_log_span_end();
    v31 = v56;
    *(_OWORD *)v15 = v55;
    *(_OWORD *)(v15 + 16) = v31;
    *(_QWORD *)(v15 + 32) = v57;

    v9 = v34;
  }

  return v9;
}

void __39__MDSearchableIndexService_willModify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)v3;
  v12 = *(_OWORD *)(v3 + 16);
  v13 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for willModify";
  si_tracing_log_span_begin();
  v9 = (id)objc_opt_self();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(_QWORD *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 32) = v13;

}

- (BOOL)deleteBundle:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v29;
  BOOL v30;
  MDSearchableIndexService *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v31 = self;
    v30 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v33 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v32 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v47 = *(_OWORD *)v12;
    v48 = v13;
    v49 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService deleteBundle:]";
    si_tracing_log_span_begin();
    v29 = v11;
    v16 = *(_OWORD *)(v12 + 16);
    v44 = *(_OWORD *)v12;
    v45 = v16;
    v46 = *(_QWORD *)(v12 + 32);
    v17 = *(_QWORD *)v12;
    v18 = si_tracing_calc_next_spanid();
    v19 = *(_QWORD *)(v12 + 8);
    v20 = *(_DWORD *)(v12 + 24);
    if (v33)
    {
      v21 = objc_retainAutorelease(v33);
      if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionComplete"))
      {
        v24 = "Class A index";
      }
      else
      {
        v22 = objc_retainAutorelease(v21);
        if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v24 = "Class B index";
        }
        else
        {
          v23 = objc_retainAutorelease(v22);
          if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v24 = "Class C index";
          }
          else
          {
            v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v24 = "Nil index";
    }
    *(_QWORD *)v12 = v17;
    *(_QWORD *)(v12 + 8) = v18;
    *(_QWORD *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    v25 = *(_OWORD *)(v12 + 16);
    v41 = *(_OWORD *)v12;
    v42 = v25;
    v43 = *(_QWORD *)(v12 + 32);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __41__MDSearchableIndexService_deleteBundle___block_invoke;
    v34[3] = &unk_24D0EE0D8;
    v37 = v41;
    v38 = v25;
    v39 = v43;
    v35 = v7;
    v40 = uint64;
    v36 = v5;
    -[MDSearchableIndexService _deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:](v31, "_deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:options:completionHandler:", v32, v33, 1, v29, v34);

    si_tracing_log_span_end();
    v26 = v45;
    *(_OWORD *)v12 = v44;
    *(_OWORD *)(v12 + 16) = v26;
    *(_QWORD *)(v12 + 32) = v46;
    si_tracing_log_span_end();
    v27 = v48;
    *(_OWORD *)v12 = v47;
    *(_OWORD *)(v12 + 16) = v27;
    *(_QWORD *)(v12 + 32) = v49;

    v9 = v30;
  }

  return v9;
}

void __41__MDSearchableIndexService_deleteBundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteBundle";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)deleteSinceDate:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  double v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  __int128 v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  BOOL v30;
  uint64_t v31;
  MDSearchableIndexService *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v32 = self;
    v30 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v34 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v33 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v31 = xpc_dictionary_get_uint64(v4, "opt");
    v11 = xpc_dictionary_get_double(v4, "time");
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v48 = *(_OWORD *)v12;
    v49 = v13;
    v50 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService deleteSinceDate:]";
    si_tracing_log_span_begin();
    v16 = *(_OWORD *)(v12 + 16);
    v45 = *(_OWORD *)v12;
    v46 = v16;
    v47 = *(_QWORD *)(v12 + 32);
    v17 = *(_QWORD *)v12;
    v18 = si_tracing_calc_next_spanid();
    v19 = *(_QWORD *)(v12 + 8);
    v20 = *(_DWORD *)(v12 + 24);
    if (v34)
    {
      v21 = objc_retainAutorelease(v34);
      if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionComplete"))
      {
        v24 = "Class A index";
      }
      else
      {
        v22 = objc_retainAutorelease(v21);
        if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v24 = "Class B index";
        }
        else
        {
          v23 = objc_retainAutorelease(v22);
          if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v24 = "Class C index";
          }
          else
          {
            v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v24 = "Nil index";
    }
    *(_QWORD *)v12 = v17;
    *(_QWORD *)(v12 + 8) = v18;
    *(_QWORD *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    v25 = *(_OWORD *)(v12 + 16);
    v42 = *(_OWORD *)v12;
    v43 = v25;
    v44 = *(_QWORD *)(v12 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __44__MDSearchableIndexService_deleteSinceDate___block_invoke;
    v35[3] = &unk_24D0EE0D8;
    v38 = v42;
    v39 = v43;
    v40 = v44;
    v36 = v7;
    v41 = uint64;
    v37 = v5;
    -[MDSearchableIndexService deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:](v32, "deleteSearchableItemsSinceDate:protectionClass:forBundleID:options:completionHandler:", v26, v34, v33, v31, v35);

    si_tracing_log_span_end();
    v27 = v46;
    *(_OWORD *)v12 = v45;
    *(_OWORD *)(v12 + 16) = v27;
    *(_QWORD *)(v12 + 32) = v47;
    si_tracing_log_span_end();
    v28 = v49;
    *(_OWORD *)v12 = v48;
    *(_OWORD *)(v12 + 16) = v28;
    *(_QWORD *)(v12 + 32) = v50;

    v9 = v30;
  }

  return v9;
}

void __44__MDSearchableIndexService_deleteSinceDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteSinceDate";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (void)_runLibraryDeletedCommand:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = a3;
  v7 = (id)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.photos.service"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D478C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v5);

  objc_msgSend(v7, "resume");
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_179);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibraryDeletedAtURL:reply:", v4, &__block_literal_global_181);

}

void __54__MDSearchableIndexService__runLibraryDeletedCommand___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Photoslibrary delete connection error:%@", (uint8_t *)&v4, 0xCu);
  }

}

void __54__MDSearchableIndexService__runLibraryDeletedCommand___block_invoke_180(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "Photoslibrary delete service error:%@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "Photoslibrary delete";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (BOOL)photosLibraryDeleted:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t spanid;
  void *v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v11 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "path", v4);
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v17 = *(_OWORD *)v12;
    v18 = *(_OWORD *)(v12 + 16);
    v19 = *(_QWORD *)(v12 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v13;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService photosLibraryDeleted:]";
    si_tracing_log_span_begin();
    if (-[MDSearchableIndexService searchInternal](self, "searchInternal")
      && -[MDSearchableIndexService allowPhotosLibraryDeletion](self, "allowPhotosLibraryDeletion"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService _runLibraryDeletedCommand:](self, "_runLibraryDeletedCommand:", v15);

    }
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_dictionary_set_uint64(v7, "id", uint64);
    xpc_connection_send_message(v5, v7);
    si_tracing_log_span_end();
    *(_OWORD *)v12 = v17;
    *(_OWORD *)(v12 + 16) = v18;
    *(_QWORD *)(v12 + 32) = v19;

  }
  return v9;
}

- (BOOL)openJournalFile:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  uint64_t uint64;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    if (-[MDSearchableIndexService allowOpenJournalFile](self, "allowOpenJournalFile"))
    {
      uint64 = xpc_dictionary_get_uint64(v4, "id");
      v10 = objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "journal-name", v4);
      v11 = v10;
      if (v10 && -[NSObject length](v10, "length"))
      {
        v11 = objc_retainAutorelease(v11);
        v12 = open((const char *)-[NSObject UTF8String](v11, "UTF8String"), 0);
        if (v12 < 0)
        {
          logForCSLogCategoryIndex();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[MDSearchableIndexService openJournalFile:].cold.1((uint64_t)v11, v15);

        }
        else
        {
          v13 = v12;
          xpc_dictionary_set_fd(v7, "journal-fd", v12);
          close(v13);
        }
        xpc_dictionary_set_uint64(v7, "id", uint64);
        xpc_connection_send_message(v5, v7);
        v8 = 1;
        goto LABEL_11;
      }
    }
    else
    {
      logForCSLogCategoryIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, "*warn* Connection not entitled to open journal file", v16, 2u);
      }
    }
    v8 = 0;
LABEL_11:

  }
  return v8;
}

void __41__MDSearchableIndexService_issueCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t spanid;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v14 = a2;
  v5 = a3;
  v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v15 = *(_OWORD *)v6;
  v16 = *(_OWORD *)(v6 + 16);
  v17 = *(_QWORD *)(v6 + 32);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v9 = *(_QWORD *)v6;
  spanid = si_tracing_calc_next_spanid();
  v11 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)v6 = v9;
  *(_QWORD *)(v6 + 8) = spanid;
  *(_QWORD *)(v6 + 16) = v11;
  *(_BYTE *)(v6 + 28) = 102;
  *(_QWORD *)(v6 + 32) = "completion handler for issueDiagnose";
  si_tracing_log_span_begin();
  if (*(_QWORD *)(a1 + 32))
  {
    csindex_xpc_dictionary_encode_status_with_error();
    if (v14)
    {
      v12 = *(void **)(a1 + 32);
      v13 = objc_retainAutorelease(v14);
      xpc_dictionary_set_data(v12, "data", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
  si_tracing_log_span_end();
  *(_OWORD *)v6 = v15;
  *(_OWORD *)(v6 + 16) = v16;
  *(_QWORD *)(v6 + 32) = v17;

}

- (BOOL)fetchAttributes:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t uint64;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t spanid;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  __int128 v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v37;
  uint64_t v38;
  int int64;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  MDSearchableIndexService *v43;
  void *v44;
  NSObject *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    v9 = (void *)MEMORY[0x24BDC24C8];
    xpc_dictionary_get_value(v4, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "copyNSStringArrayFromXPCArray:", v10);

    if (v11)
    {
      v43 = self;
      v12 = 0;
LABEL_5:
      v44 = v11;
      uint64 = xpc_dictionary_get_uint64(v4, "id");
      v45 = objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
      v41 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
      v14 = (void *)MEMORY[0x24BDC24C8];
      xpc_dictionary_get_value(v4, "fa");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v14, "copyNSStringArrayFromXPCArray:", v15);

      v40 = xpc_dictionary_get_BOOL(v4, "fpa");
      int64 = xpc_dictionary_get_int64(v4, "qos");
      v16 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
      v17 = *(_OWORD *)(v16 + 16);
      v60 = *(_OWORD *)v16;
      v61 = v17;
      v62 = *(_QWORD *)(v16 + 32);
      v18 = si_tracing_calc_traceid();
      spanid = si_tracing_calc_next_spanid();
      *(_QWORD *)v16 = v18;
      *(_QWORD *)(v16 + 8) = spanid;
      *(_QWORD *)(v16 + 16) = 0;
      *(_DWORD *)(v16 + 24) = uint64;
      *(_BYTE *)(v16 + 28) = 102;
      *(_QWORD *)(v16 + 32) = "-[MDSearchableIndexService fetchAttributes:]";
      si_tracing_log_span_begin();
      v38 = uint64;
      v20 = *(_OWORD *)(v16 + 16);
      v57 = *(_OWORD *)v16;
      v58 = v20;
      v59 = *(_QWORD *)(v16 + 32);
      v21 = *(_QWORD *)v16;
      v22 = si_tracing_calc_next_spanid();
      v23 = *(_QWORD *)(v16 + 8);
      v24 = *(_DWORD *)(v16 + 24);
      if (v45)
      {
        v25 = objc_retainAutorelease(v45);
        if (!strcmp((const char *)-[NSObject UTF8String](v25, "UTF8String"), "NSFileProtectionComplete"))
        {
          v28 = "Class A index";
        }
        else
        {
          v26 = objc_retainAutorelease(v25);
          if (!strcmp((const char *)-[NSObject UTF8String](v26, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
          {
            v28 = "Class B index";
          }
          else
          {
            v27 = objc_retainAutorelease(v26);
            if (!strcmp((const char *)-[NSObject UTF8String](v27, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
            {
              v28 = "Class Cx index";
            }
            else if (!strcmp((const char *)-[NSObject UTF8String](objc_retainAutorelease(v27), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
            {
              v28 = "Class C index";
            }
            else
            {
              v28 = "Unknown index";
            }
          }
        }
      }
      else
      {
        v28 = "Nil index";
      }
      *(_QWORD *)v16 = v21;
      *(_QWORD *)(v16 + 8) = v22;
      *(_QWORD *)(v16 + 16) = v23;
      *(_DWORD *)(v16 + 24) = v24;
      *(_BYTE *)(v16 + 28) = 102;
      *(_QWORD *)(v16 + 32) = v28;
      si_tracing_log_span_begin();
      v31 = *(_OWORD *)(v16 + 16);
      v54 = *(_OWORD *)v16;
      v55 = v31;
      v56 = *(_QWORD *)(v16 + 32);
      if (v43->_entitledAttributes)
      {
        v11 = v44;
        v32 = (void *)v42;
        v33 = (void *)SIUserCtxCreateWithLanguages();
        if (v33)
          SIUserCtxSetEntitlements();
      }
      else
      {
        v33 = 0;
        v11 = v44;
        v32 = (void *)v42;
      }
      v46[1] = 3221225472;
      v50 = v54;
      v46[0] = MEMORY[0x24BDAC760];
      v46[2] = __44__MDSearchableIndexService_fetchAttributes___block_invoke;
      v46[3] = &unk_24D0EE100;
      v51 = v55;
      v52 = v56;
      v47 = v7;
      v53 = v38;
      v48 = v5;
      v12 = v12;
      v49 = v12;
      LODWORD(v37) = int64;
      v30 = v45;
      -[MDSearchableIndexService fetchAttributes:protectionClass:bundleID:identifiers:userCtx:flags:qos:reply:completionHandler:](v43, "fetchAttributes:protectionClass:bundleID:identifiers:userCtx:flags:qos:reply:completionHandler:", v32, v45, v41, v11, v33, v40, v37, v47, v46);

      si_tracing_log_span_end();
      v34 = v58;
      *(_OWORD *)v16 = v57;
      *(_OWORD *)(v16 + 16) = v34;
      *(_QWORD *)(v16 + 32) = v59;
      si_tracing_log_span_end();
      v35 = v61;
      *(_OWORD *)v16 = v60;
      *(_OWORD *)(v16 + 16) = v35;
      *(_QWORD *)(v16 + 32) = v62;

      v8 = 1;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;
    if (v29)
    {
      if (!self->_isInternal)
      {
        logForCSLogCategoryIndex();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:].cold.1();
        v11 = 0;
        v8 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v29, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v43 = self;
        goto LABEL_5;
      }
    }
    else
    {
      v11 = 0;
    }
    v8 = 0;
LABEL_31:

  }
  return v8;
}

void __44__MDSearchableIndexService_fetchAttributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)v3;
  v12 = *(_OWORD *)(v3 + 16);
  v13 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for fetchAttributes";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  v9 = (id)objc_opt_self();
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 32) = v13;

}

- (BOOL)changeState:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t spanid;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  MDSearchableIndexService *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v32 = self;
    v29 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v36 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v35 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v31 = xpc_dictionary_get_uint64(v4, "opt");
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDC23D0]);
    v28 = v11;
    objc_msgSend(v11, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:", v13);

    v27 = v14;
    objc_msgSend(v14, "decode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = xpc_dictionary_get_uint64(v4, "modify-state");
    v33 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "ct", v4);
    v15 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v40 = *(_OWORD *)v15;
    v41 = *(_OWORD *)(v15 + 16);
    v42 = *(_QWORD *)(v15 + 32);
    v16 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v15 = v16;
    *(_QWORD *)(v15 + 8) = spanid;
    *(_QWORD *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = "-[MDSearchableIndexService changeState:]";
    si_tracing_log_span_begin();
    v37 = *(_OWORD *)v15;
    v38 = *(_OWORD *)(v15 + 16);
    v39 = *(_QWORD *)(v15 + 32);
    v18 = *(_QWORD *)v15;
    v19 = si_tracing_calc_next_spanid();
    v20 = *(_QWORD *)(v15 + 8);
    v21 = *(_DWORD *)(v15 + 24);
    if (v36)
    {
      v22 = objc_retainAutorelease(v36);
      if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionComplete"))
      {
        v25 = "Class A index";
      }
      else
      {
        v23 = objc_retainAutorelease(v22);
        if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v25 = "Class B index";
        }
        else
        {
          v24 = objc_retainAutorelease(v23);
          if (!strcmp((const char *)objc_msgSend(v24, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v25 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v25 = "Class C index";
          }
          else
          {
            v25 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v25 = "Nil index";
    }
    *(_QWORD *)v15 = v18;
    *(_QWORD *)(v15 + 8) = v19;
    *(_QWORD *)(v15 + 16) = v20;
    *(_DWORD *)(v15 + 24) = v21;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = v25;
    si_tracing_log_span_begin();
    -[MDSearchableIndexService changeStateOfSearchableItemsWithUIDs:toState:protectionClass:forBundleID:forUTIType:options:](v32, "changeStateOfSearchableItemsWithUIDs:toState:protectionClass:forBundleID:forUTIType:options:", v34, v30, v36, v35, v33, v31);
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_dictionary_set_uint64(v7, "id", uint64);
    xpc_connection_send_message(v5, v7);
    si_tracing_log_span_end();
    *(_OWORD *)v15 = v37;
    *(_OWORD *)(v15 + 16) = v38;
    *(_QWORD *)(v15 + 32) = v39;
    si_tracing_log_span_end();
    *(_OWORD *)v15 = v40;
    *(_OWORD *)(v15 + 16) = v41;
    *(_QWORD *)(v15 + 32) = v42;

    v9 = v29;
  }

  return v9;
}

- (BOOL)dataMigration:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  __int128 v17;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", xpc_dictionary_get_double(v4, "timeout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v13 = *(_OWORD *)(v12 + 16);
    v29 = *(_OWORD *)v12;
    v30 = v13;
    v31 = *(_QWORD *)(v12 + 32);
    v14 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v14;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService dataMigration:]";
    si_tracing_log_span_begin();
    v16 = *(_OWORD *)(v12 + 16);
    v26 = *(_OWORD *)v12;
    v27 = v16;
    v28 = *(_QWORD *)(v12 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __42__MDSearchableIndexService_dataMigration___block_invoke;
    v19[3] = &unk_24D0EE0D8;
    v22 = v26;
    v23 = v16;
    v24 = v28;
    v20 = v7;
    v25 = uint64;
    v21 = v5;
    -[MDSearchableIndexService performDataMigrationWithTimeout:completionHandler:](self, "performDataMigrationWithTimeout:completionHandler:", v11, v19);

    si_tracing_log_span_end();
    v17 = v30;
    *(_OWORD *)v12 = v29;
    *(_OWORD *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 32) = v31;

  }
  return v9;
}

void __42__MDSearchableIndexService_dataMigration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for dataMigration";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)transferDeleteJournals:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  int v9;
  uint64_t uint64;
  const char *string;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t spanid;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v37 = xpc_dictionary_dup_fd(v4, "fd");
    v9 = *((_DWORD *)v35 + 6);
    v8 = v9 > 0;
    if (v9 >= 1)
    {
      uint64 = xpc_dictionary_get_uint64(v4, "id");
      string = xpc_dictionary_get_string(v4, "pc");
      v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
      v13 = *(_OWORD *)(v12 + 16);
      v31 = *(_OWORD *)v12;
      v32 = v13;
      v33 = *(_QWORD *)(v12 + 32);
      v14 = si_tracing_calc_traceid();
      spanid = si_tracing_calc_next_spanid();
      *(_QWORD *)v12 = v14;
      *(_QWORD *)(v12 + 8) = spanid;
      *(_QWORD *)(v12 + 16) = 0;
      *(_DWORD *)(v12 + 24) = uint64;
      *(_BYTE *)(v12 + 28) = 102;
      *(_QWORD *)(v12 + 32) = "-[MDSearchableIndexService transferDeleteJournals:]";
      si_tracing_log_span_begin();
      v16 = *(_OWORD *)(v12 + 16);
      v28 = *(_OWORD *)v12;
      v29 = v16;
      v30 = *(_QWORD *)(v12 + 32);
      v17 = *((unsigned int *)v35 + 6);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __51__MDSearchableIndexService_transferDeleteJournals___block_invoke;
      v20[3] = &unk_24D0EE1B8;
      v26 = v30;
      v24 = v28;
      v25 = v16;
      v21 = v7;
      v27 = uint64;
      v22 = v5;
      v23 = &v34;
      -[MDSearchableIndexService transferDeleteJournalsForProtectionClass:toDirectory:withCompletionHandler:](self, "transferDeleteJournalsForProtectionClass:toDirectory:withCompletionHandler:", string, v17, v20);

      si_tracing_log_span_end();
      v18 = v32;
      *(_OWORD *)v12 = v31;
      *(_OWORD *)(v12 + 16) = v18;
      *(_QWORD *)(v12 + 32) = v33;
    }
    _Block_object_dispose(&v34, 8);
  }

  return v8;
}

void __51__MDSearchableIndexService_transferDeleteJournals___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for transferDeleteJournals";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 96));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)deleteUserActivitiesWithPersistentIdentifiers:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  uint64_t uint64;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  __int128 v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  MDSearchableIndexService *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  v8 = 0;
  if (v5 && reply)
  {
    v22 = self;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v10 = xpc_dictionary_get_uint64(v4, "opt");
    v23 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v11 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v12 = *(_OWORD *)(v11 + 16);
    v35 = *(_OWORD *)v11;
    v36 = v12;
    v37 = *(_QWORD *)(v11 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = spanid;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = "-[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:]";
    si_tracing_log_span_begin();
    v15 = *(_OWORD *)(v11 + 16);
    v32 = *(_OWORD *)v11;
    v33 = v15;
    v34 = *(_QWORD *)(v11 + 32);
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ids", "ids-size", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16 != 0;
    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x24BDC23D0]);
      objc_msgSend(v16, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithData:", v18);

      v24[1] = 3221225472;
      v28 = v32;
      v24[0] = MEMORY[0x24BDAC760];
      v24[2] = __74__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers___block_invoke;
      v24[3] = &unk_24D0EE100;
      v29 = v33;
      v30 = v34;
      v25 = v16;
      v26 = v7;
      v31 = uint64;
      v27 = v5;
      -[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:](v22, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:", v19, v23, v10, v24);

    }
    si_tracing_log_span_end();
    v20 = v36;
    *(_OWORD *)v11 = v35;
    *(_OWORD *)(v11 + 16) = v20;
    *(_QWORD *)(v11 + 32) = v37;

  }
  return v8;
}

void __74__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)v3;
  v12 = *(_OWORD *)(v3 + 16);
  v13 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteUserActivitiesWithPersistentIdentifiers";
  si_tracing_log_span_begin();
  v9 = (id)objc_opt_self();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(_QWORD *)(a1 + 96));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 32) = v13;

}

- (BOOL)deleteActionsBeforeTime:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  double v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t spanid;
  __int128 v17;
  __int128 v18;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v12 = xpc_dictionary_get_double(v4, "time");
    v13 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v14 = *(_OWORD *)(v13 + 16);
    v30 = *(_OWORD *)v13;
    v31 = v14;
    v32 = *(_QWORD *)(v13 + 32);
    v15 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v13 = v15;
    *(_QWORD *)(v13 + 8) = spanid;
    *(_QWORD *)(v13 + 16) = 0;
    *(_DWORD *)(v13 + 24) = uint64;
    *(_BYTE *)(v13 + 28) = 102;
    *(_QWORD *)(v13 + 32) = "-[MDSearchableIndexService deleteActionsBeforeTime:]";
    si_tracing_log_span_begin();
    v17 = *(_OWORD *)(v13 + 16);
    v27 = *(_OWORD *)v13;
    v28 = v17;
    v29 = *(_QWORD *)(v13 + 32);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __52__MDSearchableIndexService_deleteActionsBeforeTime___block_invoke;
    v20[3] = &unk_24D0EE0D8;
    v23 = v27;
    v24 = v17;
    v25 = v29;
    v21 = v7;
    v26 = uint64;
    v22 = v5;
    -[MDSearchableIndexService deleteActionsBeforeTime:options:completionHandler:](self, "deleteActionsBeforeTime:options:completionHandler:", v11, v20, v12);

    si_tracing_log_span_end();
    v18 = v31;
    *(_OWORD *)v13 = v30;
    *(_OWORD *)(v13 + 16) = v18;
    *(_QWORD *)(v13 + 32) = v32;
  }

  return v9;
}

void __52__MDSearchableIndexService_deleteActionsBeforeTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteActionsBeforeTime";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)deleteActionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t spanid;
  __int128 v19;
  __int128 v20;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v11 = xpc_dictionary_get_uint64(v4, "opt");
    v12 = (void *)MEMORY[0x24BDC24C8];
    xpc_dictionary_get_value(v4, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "copyNSStringArrayFromXPCArray:", v13);

    v15 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v16 = *(_OWORD *)(v15 + 16);
    v32 = *(_OWORD *)v15;
    v33 = v16;
    v34 = *(_QWORD *)(v15 + 32);
    v17 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v15 = v17;
    *(_QWORD *)(v15 + 8) = spanid;
    *(_QWORD *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(_BYTE *)(v15 + 28) = 102;
    *(_QWORD *)(v15 + 32) = "-[MDSearchableIndexService deleteActionsWithIdentifiers:]";
    si_tracing_log_span_begin();
    v19 = *(_OWORD *)(v15 + 16);
    v29 = *(_OWORD *)v15;
    v30 = v19;
    v31 = *(_QWORD *)(v15 + 32);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __57__MDSearchableIndexService_deleteActionsWithIdentifiers___block_invoke;
    v22[3] = &unk_24D0EE0D8;
    v25 = v29;
    v26 = v19;
    v27 = v31;
    v23 = v7;
    v28 = uint64;
    v24 = v5;
    -[MDSearchableIndexService deleteActionsWithIdentifiers:options:completionHandler:](self, "deleteActionsWithIdentifiers:options:completionHandler:", v14, v11, v22);

    si_tracing_log_span_end();
    v20 = v33;
    *(_OWORD *)v15 = v32;
    *(_OWORD *)(v15 + 16) = v20;
    *(_QWORD *)(v15 + 32) = v34;

  }
  return v9;
}

void __57__MDSearchableIndexService_deleteActionsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteActionsWithIdentifiers";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)processActivities:(id)a3
{
  xpc_object_t reply;
  BOOL v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t spanid;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  xpc_object_t message;
  uint64_t v31;
  BOOL v32;
  _xpc_connection_s *connection;
  xpc_object_t original;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _BYTE v44[144];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  original = a3;
  xpc_dictionary_get_remote_connection(original);
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(original);
  if (connection)
    v4 = reply == 0;
  else
    v4 = 1;
  v5 = !v4;
  v32 = v5;
  if (!v4)
  {
    message = reply;
    v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v7 = *(_OWORD *)(v6 + 16);
    v41 = *(_OWORD *)v6;
    v42 = v7;
    v31 = v6;
    v43 = *(_QWORD *)(v6 + 32);
    v8 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v31 = v8;
    *(_QWORD *)(v31 + 8) = spanid;
    *(_QWORD *)(v31 + 16) = 0;
    *(_DWORD *)(v31 + 24) = -1;
    *(_BYTE *)(v31 + 28) = 102;
    *(_QWORD *)(v31 + 32) = "-[MDSearchableIndexService processActivities:]";
    si_tracing_log_span_begin();
    objc_msgSend(MEMORY[0x24BDC24C8], "dataWrapperForKey:sizeKey:fromXPCDictionary:", "data", "data-size", original);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v29, 0);
      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "decodeObjectOfClasses:forKey:", v15, *MEMORY[0x24BDD0E88]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v16 = v28;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v38;
          v35 = (void *)*MEMORY[0x24BDD0CD0];
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v38 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("action"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("item"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v23 = v35;
                  -[MDSearchableIndexService userPerformedAction:withItem:protectionClass:](self, "userPerformedAction:withItem:protectionClass:", v21, v22, v23);

                }
              }

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
          }
          while (v17);
        }

      }
    }
    if (xpc_dictionary_get_BOOL(original, "flush"))
      -[MDSearchableIndexService flushUserActivities](self, "flushUserActivities");
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_connection_send_message(connection, message);

    si_tracing_log_span_end();
    v24 = v42;
    reply = message;
    *(_OWORD *)v31 = v41;
    *(_OWORD *)(v31 + 16) = v24;
    *(_QWORD *)(v31 + 32) = v43;
  }

  return v32;
}

- (BOOL)_deleteInteractions:(id)a3 forGroup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  xpc_object_t reply;
  void *v9;
  BOOL v10;
  uint64_t uint64;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t spanid;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  __int128 v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v33;
  MDSearchableIndexService *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v4 = a4;
  v6 = a3;
  xpc_dictionary_get_remote_connection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v6);
  v9 = reply;
  v10 = 0;
  if (v7 && reply)
  {
    v35 = v4;
    v34 = self;
    uint64 = xpc_dictionary_get_uint64(v6, "id");
    v38 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v6);
    v33 = xpc_dictionary_get_uint64(v6, "opt");
    v37 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v6);
    v12 = (void *)MEMORY[0x24BDC24C8];
    xpc_dictionary_get_value(v6, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v12, "copyNSStringArrayFromXPCArray:", v13);

    v14 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v15 = *(_OWORD *)(v14 + 16);
    v55 = *(_OWORD *)v14;
    v56 = v15;
    v57 = *(_QWORD *)(v14 + 32);
    v16 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v14 = v16;
    *(_QWORD *)(v14 + 8) = spanid;
    *(_QWORD *)(v14 + 16) = 0;
    *(_DWORD *)(v14 + 24) = uint64;
    *(_BYTE *)(v14 + 28) = 102;
    *(_QWORD *)(v14 + 32) = "-[MDSearchableIndexService _deleteInteractions:forGroup:]";
    si_tracing_log_span_begin();
    v18 = *(_OWORD *)(v14 + 16);
    v52 = *(_OWORD *)v14;
    v53 = v18;
    v54 = *(_QWORD *)(v14 + 32);
    v19 = *(_QWORD *)v14;
    v20 = si_tracing_calc_next_spanid();
    v21 = *(_QWORD *)(v14 + 8);
    v22 = *(_DWORD *)(v14 + 24);
    if (v38)
    {
      v23 = objc_retainAutorelease(v38);
      if (!strcmp((const char *)objc_msgSend(v23, "UTF8String"), "NSFileProtectionComplete"))
      {
        v26 = "Class A index";
      }
      else
      {
        v24 = objc_retainAutorelease(v23);
        if (!strcmp((const char *)objc_msgSend(v24, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v26 = "Class B index";
        }
        else
        {
          v25 = objc_retainAutorelease(v24);
          if (!strcmp((const char *)objc_msgSend(v25, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v26 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v26 = "Class C index";
          }
          else
          {
            v26 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v26 = "Nil index";
    }
    *(_QWORD *)v14 = v19;
    *(_QWORD *)(v14 + 8) = v20;
    *(_QWORD *)(v14 + 16) = v21;
    *(_DWORD *)(v14 + 24) = v22;
    *(_BYTE *)(v14 + 28) = 102;
    *(_QWORD *)(v14 + 32) = v26;
    si_tracing_log_span_begin();
    v27 = *(_OWORD *)(v14 + 16);
    v49 = *(_OWORD *)v14;
    v50 = v27;
    v51 = *(_QWORD *)(v14 + 32);
    v28 = objc_msgSend(v36, "count");
    v10 = v28 != 0;
    if (v28)
    {
      if (v35)
      {
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke;
        v44[3] = &unk_24D0EE0D8;
        v45 = v49;
        v46 = v50;
        v47 = v51;
        v29 = v44;
        v44[4] = v9;
        v48 = uint64;
        v44[5] = v7;
        -[MDSearchableIndexService deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:options:completionHandler:](v34, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:options:completionHandler:", v36, v37, v38, v33, v44);
      }
      else
      {
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke_2;
        v39[3] = &unk_24D0EE0D8;
        v40 = v49;
        v41 = v50;
        v42 = v51;
        v29 = v39;
        v39[4] = v9;
        v43 = uint64;
        v39[5] = v7;
        -[MDSearchableIndexService deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:](v34, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:", v36, v37, v38, v33, v39);
      }

    }
    si_tracing_log_span_end();
    v30 = v53;
    *(_OWORD *)v14 = v52;
    *(_OWORD *)(v14 + 16) = v30;
    *(_QWORD *)(v14 + 32) = v54;
    si_tracing_log_span_end();
    v31 = v56;
    *(_OWORD *)v14 = v55;
    *(_OWORD *)(v14 + 16) = v31;
    *(_QWORD *)(v14 + 32) = v57;

  }
  return v10;
}

void __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

void __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completion handler for deleteInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (BOOL)updateCorrections:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t uint64;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  MDSearchableIndexService *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5)
    v8 = reply == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v32 = self;
    v29 = v9;
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v33 = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
    v28 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v4);
    v30 = xpc_dictionary_get_uint64(v4, "opt");
    v31 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "filepath", v4);
    v11 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v12 = *(_OWORD *)(v11 + 16);
    v47 = *(_OWORD *)v11;
    v48 = v12;
    v49 = *(_QWORD *)(v11 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = spanid;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = "-[MDSearchableIndexService updateCorrections:]";
    si_tracing_log_span_begin();
    v15 = *(_OWORD *)(v11 + 16);
    v44 = *(_OWORD *)v11;
    v45 = v15;
    v46 = *(_QWORD *)(v11 + 32);
    v16 = *(_QWORD *)v11;
    v17 = si_tracing_calc_next_spanid();
    v18 = *(_QWORD *)(v11 + 8);
    v19 = *(_DWORD *)(v11 + 24);
    if (v33)
    {
      v20 = objc_retainAutorelease(v33);
      if (!strcmp((const char *)objc_msgSend(v20, "UTF8String", v28), "NSFileProtectionComplete"))
      {
        v23 = "Class A index";
      }
      else
      {
        v21 = objc_retainAutorelease(v20);
        if (!strcmp((const char *)objc_msgSend(v21, "UTF8String"), "NSFileProtectionCompleteUnlessOpen"))
        {
          v23 = "Class B index";
        }
        else
        {
          v22 = objc_retainAutorelease(v21);
          if (!strcmp((const char *)objc_msgSend(v22, "UTF8String"), "NSFileProtectionCompleteWhenUserInactive"))
          {
            v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v23 = "Class C index";
          }
          else
          {
            v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v23 = "Nil index";
    }
    *(_QWORD *)v11 = v16;
    *(_QWORD *)(v11 + 8) = v17;
    *(_QWORD *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    v24 = *(_OWORD *)(v11 + 16);
    v41 = *(_OWORD *)v11;
    v42 = v24;
    v43 = *(_QWORD *)(v11 + 32);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __46__MDSearchableIndexService_updateCorrections___block_invoke;
    v34[3] = &unk_24D0EE168;
    v37 = v41;
    v38 = v24;
    v39 = v43;
    v35 = v7;
    v40 = uint64;
    v36 = v5;
    -[MDSearchableIndexService updateCorrectionsWithFilePath:options:completionHandler:](v32, "updateCorrectionsWithFilePath:options:completionHandler:", v31, v30, v34);

    si_tracing_log_span_end();
    v25 = v45;
    *(_OWORD *)v11 = v44;
    *(_OWORD *)(v11 + 16) = v25;
    *(_QWORD *)(v11 + 32) = v46;
    si_tracing_log_span_end();
    v26 = v48;
    *(_OWORD *)v11 = v47;
    *(_OWORD *)(v11 + 16) = v26;
    *(_QWORD *)(v11 + 32) = v49;

    v9 = v29;
  }

  return v9;
}

void __46__MDSearchableIndexService_updateCorrections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t spanid;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v12 = a2;
  v5 = a3;
  v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v13 = *(_OWORD *)v6;
  v14 = *(_OWORD *)(v6 + 16);
  v15 = *(_QWORD *)(v6 + 32);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v9 = *(_QWORD *)v6;
  spanid = si_tracing_calc_next_spanid();
  v11 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)v6 = v9;
  *(_QWORD *)(v6 + 8) = spanid;
  *(_QWORD *)(v6 + 16) = v11;
  *(_BYTE *)(v6 + 28) = 102;
  *(_QWORD *)(v6 + 32) = "completion handler for updateCorrections";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)v6 = v13;
  *(_OWORD *)(v6 + 16) = v14;
  *(_QWORD *)(v6 + 32) = v15;

}

- (BOOL)issueCacheCommand:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  uint64_t uint64;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t spanid;
  __int128 v13;
  BOOL v14;
  id v15;
  void *v16;
  __int128 v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  if (v5)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "id");
    v8 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "cache-request", v4);
    v9 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v10 = *(_OWORD *)(v9 + 16);
    v32 = *(_OWORD *)v9;
    v33 = v10;
    v34 = *(_QWORD *)(v9 + 32);
    v11 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v9 = v11;
    *(_QWORD *)(v9 + 8) = spanid;
    *(_QWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 24) = uint64;
    *(_BYTE *)(v9 + 28) = 102;
    *(_QWORD *)(v9 + 32) = "-[MDSearchableIndexService issueCacheCommand:]";
    si_tracing_log_span_begin();
    v13 = *(_OWORD *)(v9 + 16);
    v29 = *(_OWORD *)v9;
    v30 = v13;
    v31 = *(_QWORD *)(v9 + 32);
    v14 = v8 != 0;
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __46__MDSearchableIndexService_issueCacheCommand___block_invoke;
      v22 = &unk_24D0EE168;
      v25 = v29;
      v26 = v30;
      v27 = v31;
      v15 = reply;
      v23 = v15;
      v28 = uint64;
      v24 = v5;
      v16 = (void *)MEMORY[0x2199C2F34](&v19);
      -[MDIndexer _issueCacheCommand:xpc:searchContext:completionHandler:](self->_indexer, "_issueCacheCommand:xpc:searchContext:completionHandler:", v8, v15, 0, v16, v19, v20, v21, v22);

    }
    si_tracing_log_span_end();
    v17 = v33;
    *(_OWORD *)v9 = v32;
    *(_OWORD *)(v9 + 16) = v17;
    *(_QWORD *)(v9 + 32) = v34;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __46__MDSearchableIndexService_issueCacheCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t spanid;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v14 = a2;
  v5 = a3;
  v6 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v15 = *(_OWORD *)v6;
  v16 = *(_OWORD *)(v6 + 16);
  v17 = *(_QWORD *)(v6 + 32);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 32) = v7;
  v9 = *(_QWORD *)v6;
  spanid = si_tracing_calc_next_spanid();
  v11 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)v6 = v9;
  *(_QWORD *)(v6 + 8) = spanid;
  *(_QWORD *)(v6 + 16) = v11;
  *(_BYTE *)(v6 + 28) = 102;
  *(_QWORD *)(v6 + 32) = "completion handler for issueCacheCommand";
  si_tracing_log_span_begin();
  if (*(_QWORD *)(a1 + 32))
  {
    csindex_xpc_dictionary_encode_status_with_error();
    if (v14)
    {
      v12 = *(void **)(a1 + 32);
      v13 = objc_retainAutorelease(v14);
      xpc_dictionary_set_data(v12, "cache-data-key", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(_QWORD *)(a1 + 88));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
  si_tracing_log_span_end();
  *(_OWORD *)v6 = v15;
  *(_OWORD *)(v6 + 16) = v16;
  *(_QWORD *)(v6 + 32) = v17;

}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (OS_xpc_object)clientConnection
{
  return self->_clientConnection;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)searchInternal
{
  return self->_searchInternal;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)allowMail
{
  return self->_allowMail;
}

- (BOOL)allowPhotosLibraryDeletion
{
  return self->_allowPhotosLibraryDeletion;
}

- (BOOL)allowOpenJournalFile
{
  return self->_allowOpenJournalFile;
}

- (void)setAllowOpenJournalFile:(BOOL)a3
{
  self->_allowOpenJournalFile = a3;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (BOOL)allowNotifications
{
  return self->_allowNotifications;
}

- (void)setAllowNotifications:(BOOL)a3
{
  self->_allowNotifications = a3;
}

- (void)_checkNonEmptyBundle:(void *)a1 protectionClass:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "processDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "No bundle ID found for process:%@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_checkItems:(void *)a1 identifiers:(NSObject *)a2 protectionClass:bundleID:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "processDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = CFSTR("application-identifier");
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "No client bundle ID found for process:%@ - if this is an app, makes sure it has the \"%@\" entitlement", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_11();
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, v0, v1, "Identifier %@ isn't a string", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v1, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(&dword_213CF1000, v3, v4, "Searchable item:%@ has bundleID:%@ but should be %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, v0, v1, "Searchable item %@ does not have an unique identifier or content type", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_checkItems:(void *)a1 identifiers:(NSObject *)a2 protectionClass:bundleID:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "processDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Caller uid doesn't match daemon uid for process:%@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_13();
  objc_msgSend(v1, "processDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(&dword_213CF1000, v3, v4, "Invalid bundle ID for process:%@, bundleID:%@, clientBundleID:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)_canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, v0, v1, "Expected non-nil client state name for %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_13();
  +[SpotlightSender jobForTest:](SpotlightSender, "jobForTest:", v1);
  +[SpotlightSender jobForDuet:](SpotlightSender, "jobForDuet:", v0);
  +[SpotlightSender jobForSuggestions:](SpotlightSender, "jobForSuggestions:", v0);
  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x34u);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "domainIdentifier:%@, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

- (void)updateCorrectionsWithFilePath:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "updateCorrectionsWithProtectionClass, filePath:%@, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

- (void)provideDataForBundle:identifier:type:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Missing entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)_issueCommand:(void *)a1 outFileDescriptor:(NSObject *)a2 searchContext:completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "clientBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Attempt to access notifications by client %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)userPerformedAction:withItem:protectionClass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Ignoring action:%@, item:%@");
  OUTLINED_FUNCTION_1();
}

- (void)checkInWithProtectionClass:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "processDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "checkInWithProtectionClass failed, nil client bundleID for process:%@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)deleteAllUserActivities:fromClient:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "(%@) deleteAllActivties, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "(%@) deleteActivties, options:0x%lx");
  OUTLINED_FUNCTION_1();
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_1(os_log_t log, double a2, double a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = (uint64_t)(a2 - a3);
  _os_log_debug_impl(&dword_213CF1000, log, OS_LOG_TYPE_DEBUG, "Finished waiting for index to update, totalTime:%llds", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Waiting for index to update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Waiting for indexing extensions to finish migration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_4(uint64_t a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);

}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Extension \"%@\" completed migration, error:%@");
  OUTLINED_FUNCTION_1();
}

- (void)transferDeleteJournalsForProtectionClass:(const char *)a1 toDirectory:withCompletionHandler:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);

  OUTLINED_FUNCTION_11();
}

- (void)deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "options:0x%lx, identifiers:%@");
  OUTLINED_FUNCTION_1();
}

- (void)donateRelevantActions:bundleID:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "(%@) donateRelevantActions options:0x%lx");
  OUTLINED_FUNCTION_1();
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "indexSearchableItems: not supported by service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)indexFromBundle:protectionClass:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:userActivities:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "indexFromBundle: not supported by service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)openJournalFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = __error();
  v5 = strerror(*v4);
  v6 = *__error();
  v7 = 138412802;
  v8 = a1;
  v9 = 2080;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "Unable to open path: %@, error: %s(%d)", (uint8_t *)&v7, 0x1Cu);
  OUTLINED_FUNCTION_0_0();
}

void __41__MDSearchableIndexService_issueCommand___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, a3, "_issueCommand callback called twice! %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)processActivities:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a3, (uint64_t)a3, "Error: %@", (uint8_t *)a2);

}

- (void)handleCommand:info:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, v0, v1, "unknown command: %s", v2);
  OUTLINED_FUNCTION_1();
}

@end
