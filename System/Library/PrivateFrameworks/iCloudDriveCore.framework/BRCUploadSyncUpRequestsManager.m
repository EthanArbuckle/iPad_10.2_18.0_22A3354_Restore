@implementation BRCUploadSyncUpRequestsManager

+ (id)_fetchManagersDictionary
{
  if (_fetchManagersDictionary_onceToken != -1)
    dispatch_once(&_fetchManagersDictionary_onceToken, &__block_literal_global_59);
  return (id)_fetchManagersDictionary_managersByPersona;
}

void __58__BRCUploadSyncUpRequestsManager__fetchManagersDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_fetchManagersDictionary_managersByPersona;
  _fetchManagersDictionary_managersByPersona = v0;

}

- (id)_initWithPersonaIdentifier:(id)a3
{
  id v5;
  BRCUploadSyncUpRequestsManager *v6;
  BRCUploadSyncUpRequestsManager *v7;
  uint64_t v8;
  NSMutableDictionary *requestsByItemGlobalID;
  uint64_t v10;
  NSMutableDictionary *zoneIDToItemIDs;
  NSNumber *latestSourceIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCUploadSyncUpRequestsManager;
  v6 = -[BRCUploadSyncUpRequestsManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaIdentifer, a3);
    v8 = objc_opt_new();
    requestsByItemGlobalID = v7->_requestsByItemGlobalID;
    v7->_requestsByItemGlobalID = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    zoneIDToItemIDs = v7->_zoneIDToItemIDs;
    v7->_zoneIDToItemIDs = (NSMutableDictionary *)v10;

    latestSourceIdentifier = v7->_latestSourceIdentifier;
    v7->_latestSourceIdentifier = (NSNumber *)&unk_24FEB3650;

  }
  return v7;
}

+ (id)defaultManagerWithPersonaIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_fetchManagersDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[BRCUploadSyncUpRequestsManager _initWithPersonaIdentifier:]([BRCUploadSyncUpRequestsManager alloc], "_initWithPersonaIdentifier:", v3);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)registerRequestForIdentifier:(id)a3 requestType:(signed __int16)a4 requestSource:(id)a5 progress:(id)a6 finishBlock:(id)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  BRCUploadSyncUpRequestsManager *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSMutableDictionary *zoneIDToItemIDs;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSObject *v28;
  const char *v30;
  BRCRequestData *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v12 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v31 = -[BRCRequestData initWithProgress:requestType:finishBlock:]([BRCRequestData alloc], "initWithProgress:requestType:finishBlock:", v16, v12, v17);
  v18 = self;
  objc_sync_enter(v18);
  if ((objc_msgSend(v15, "br_isEqualToNumber:", v18->_latestSourceIdentifier) & 1) == 0)
    -[BRCUploadSyncUpRequestsManager _invalidateRequestsTableWithNewSource:](v18, "_invalidateRequestsTableWithNewSource:", v15);
  -[NSMutableDictionary objectForKey:](v18->_requestsByItemGlobalID, "objectForKey:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1006, CFSTR("Request is already registered for %@"), v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCUploadSyncUpRequestsManager registerRequestForIdentifier:requestType:requestSource:progress:finishBlock:error:]";
        v34 = 2080;
        if (!a8)
          v30 = "(ignored by caller)";
        v35 = v30;
        v36 = 2112;
        v37 = v20;
        v38 = 2112;
        v39 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a8)
    {
      v20 = objc_retainAutorelease(v20);
      *a8 = v20;
    }
    v23 = v20;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](v18->_requestsByItemGlobalID, "setObject:forKey:", v31, v14);
    zoneIDToItemIDs = v18->_zoneIDToItemIDs;
    objc_msgSend(v14, "zoneRowID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](zoneIDToItemIDs, "objectForKey:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v23 = (void *)objc_opt_new();
      v26 = v18->_zoneIDToItemIDs;
      objc_msgSend(v14, "zoneRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v23, v27);

    }
    objc_msgSend(v23, "addObject:", v14);
    brc_bread_crumbs();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v33 = (const char *)v31;
      v34 = 2112;
      v35 = (const char *)v14;
      v36 = 2112;
      v37 = v20;
      _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Registered request %@ for identifier %@%@", buf, 0x20u);
    }

  }
  objc_sync_exit(v18);

  return v19 == 0;
}

- (void)_callFinishBlockOnDataRequest:(id)a3 finishError:(id)a4
{
  id v5;
  void (**v6)(id, id);

  if (a3)
  {
    v5 = a4;
    objc_msgSend(a3, "finishBlock");
    v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (BOOL)finishRequestForIdentifer:(id)a3 finishError:(id)a4 error:(id *)a5
{
  id v8;
  char *v9;
  BRCUploadSyncUpRequestsManager *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *zoneIDToItemIDs;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  const char *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (char *)a4;
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKey:](v10->_requestsByItemGlobalID, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[NSMutableDictionary removeObjectForKey:](v10->_requestsByItemGlobalID, "removeObjectForKey:", v8);
  zoneIDToItemIDs = v10->_zoneIDToItemIDs;
  objc_msgSend(v8, "zoneRowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](zoneIDToItemIDs, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "removeObject:", v8);
    if (!objc_msgSend(v15, "count"))
    {
      v16 = v10->_zoneIDToItemIDs;
      objc_msgSend(v8, "zoneRowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

    }
  }

  objc_sync_exit(v10);
  if (v12)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v26 = (const char *)v8;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v18;
      _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Calling finish block for %@ with %@%@", buf, 0x20u);
    }

    -[BRCUploadSyncUpRequestsManager _callFinishBlockOnDataRequest:finishError:](v10, "_callFinishBlockOnDataRequest:finishError:", v12, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1007, CFSTR("there is no request for %@"), v8);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v26 = "-[BRCUploadSyncUpRequestsManager finishRequestForIdentifer:finishError:error:]";
        v27 = 2080;
        if (!a5)
          v24 = "(ignored by caller)";
        v28 = v24;
        v29 = 2112;
        v30 = v20;
        v31 = 2112;
        v32 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v20);

  }
  return v12 != 0;
}

- (BOOL)cancelRequestForIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a3;
  objc_msgSend(v6, "brc_errorOperationCancelled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[BRCUploadSyncUpRequestsManager finishRequestForIdentifer:finishError:error:](self, "finishRequestForIdentifer:finishError:error:", v7, v8, a4);

  return (char)a4;
}

- (void)finishRequestForItemsInZoneRowID:(id)a3 finishError:(id)a4
{
  id v6;
  id v7;
  BRCUploadSyncUpRequestsManager *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCUploadSyncUpRequestsManager finishRequestForItemsInZoneRowID:finishError:].cold.1();

  -[NSMutableDictionary objectForKey:](v8->_zoneIDToItemIDs, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          -[NSMutableDictionary objectForKey:](v8->_requestsByItemGlobalID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCUploadSyncUpRequestsManager _callFinishBlockOnDataRequest:finishError:](v8, "_callFinishBlockOnDataRequest:finishError:", v17, v7);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    -[NSMutableDictionary removeObjectsForKeys:](v8->_requestsByItemGlobalID, "removeObjectsForKeys:", v13);
  }

  objc_sync_exit(v8);
}

- (id)getProgressForIdentifier:(id)a3
{
  id v4;
  BRCUploadSyncUpRequestsManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_requestsByItemGlobalID, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)_invalidateRequestsTableWithNewSource:(id)a3
{
  NSNumber *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *requestsByItemGlobalID;
  NSMutableDictionary *v7;
  NSMutableDictionary *zoneIDToItemIDs;
  NSNumber *latestSourceIdentifier;

  v4 = (NSNumber *)a3;
  v5 = (NSMutableDictionary *)objc_opt_new();
  requestsByItemGlobalID = self->_requestsByItemGlobalID;
  self->_requestsByItemGlobalID = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  zoneIDToItemIDs = self->_zoneIDToItemIDs;
  self->_zoneIDToItemIDs = v7;

  latestSourceIdentifier = self->_latestSourceIdentifier;
  self->_latestSourceIdentifier = v4;

}

- (void)invalidateRequestsOfClient:(id)a3
{
  id v4;
  BRCUploadSyncUpRequestsManager *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "br_isEqualToNumber:", v5->_latestSourceIdentifier))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCUploadSyncUpRequestsManager invalidateRequestsOfClient:].cold.1();

    -[BRCUploadSyncUpRequestsManager _invalidateRequestsTableWithNewSource:](v5, "_invalidateRequestsTableWithNewSource:", 0);
  }
  objc_sync_exit(v5);

}

- (void)dumpToContext:(id)a3
{
  id v4;
  BRCUploadSyncUpRequestsManager *v5;
  NSMutableDictionary *requestsByItemGlobalID;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("fpfs modifications tracked requests"));
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("tracked requests of client (%lu) : (%lu):"), -[NSNumber unsignedLongValue](v5->_latestSourceIdentifier, "unsignedLongValue"), -[NSMutableDictionary count](v5->_requestsByItemGlobalID, "count"));
  if (-[NSMutableDictionary count](v5->_requestsByItemGlobalID, "count"))
  {
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("{"));
    objc_msgSend(v4, "pushIndentation");
  }
  requestsByItemGlobalID = v5->_requestsByItemGlobalID;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__BRCUploadSyncUpRequestsManager_dumpToContext___block_invoke;
  v8[3] = &unk_24FE49208;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestsByItemGlobalID, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (-[NSMutableDictionary count](v5->_requestsByItemGlobalID, "count"))
  {
    objc_msgSend(v7, "popIndentation");
    objc_msgSend(v7, "writeLineWithFormat:", CFSTR("}"));
  }
  objc_msgSend(v7, "writeEmptyLine");

  objc_sync_exit(v5);
}

uint64_t __48__BRCUploadSyncUpRequestsManager_dumpToContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("itemGlobalID = %@, requestData = %@"), a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDToItemIDs, 0);
  objc_storeStrong((id *)&self->_requestsByItemGlobalID, 0);
  objc_storeStrong((id *)&self->_latestSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifer, 0);
}

- (void)finishRequestForItemsInZoneRowID:finishError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Finishing all requests under zone %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)invalidateRequestsOfClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Invalidating state of client = %@%@");
  OUTLINED_FUNCTION_0();
}

@end
