@implementation BRCSharingCopyShareOperation

- (BRCSharingCopyShareOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharingCopyShareOperation *v13;
  uint64_t v14;
  BRCClientZone *clientZone;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  CKRecordID *shareID;
  uint64_t v22;
  void *rootItemIDToLookup;
  id v24;
  void *v25;
  uint64_t v26;
  CKRecordID *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_super v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataSyncContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "serverZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:].cold.2(v6, (uint64_t)v34, v35);
    }
    else
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:].cold.1((uint64_t)v6, (uint64_t)v34, v35);
    }

  }
  objc_msgSend(v6, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugItemIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/copy-share"), "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36.receiver = self;
  v36.super_class = (Class)BRCSharingCopyShareOperation;
  v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v36, sel_initWithName_syncContext_sessionContext_, v12, v9, v7);

  if (v13)
  {
    -[_BRCOperation setNonDiscretionary:](v13, "setNonDiscretionary:", 1);
    objc_msgSend(v6, "clientZone");
    v14 = objc_claimAutoreleasedReturnValue();
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v14;

    if ((objc_msgSend(v6, "sharingOptions") & 0x48) != 0)
    {
      if ((objc_msgSend(v6, "sharingOptions") & 4) != 0)
        goto LABEL_12;
LABEL_8:
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v6;
        v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Fetching the root share object for shared to me child item %@%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v6);
      v20 = objc_claimAutoreleasedReturnValue();
      shareID = v13->_shareID;
      v13->_shareID = (CKRecordID *)v20;

      -[CKRecordID brc_shareItemID](v13->_shareID, "brc_shareItemID");
      v22 = objc_claimAutoreleasedReturnValue();
      rootItemIDToLookup = v13->_rootItemIDToLookup;
      v13->_rootItemIDToLookup = (BRCItemID *)v22;
      goto LABEL_22;
    }
    objc_msgSend(v6, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isSharedZone") & 1) != 0)
    {
      v17 = objc_msgSend(v6, "sharingOptions");

      if ((v17 & 4) == 0)
        goto LABEL_8;
    }
    else
    {

    }
LABEL_12:
    if ((objc_msgSend(v6, "isDirectory") & 1) != 0 || objc_msgSend(v6, "isDocument"))
    {
      v24 = objc_alloc(MEMORY[0x24BDB91E8]);
      objc_msgSend(v6, "asShareableItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "initShareIDWithShareableItem:", v25);
      v27 = v13->_shareID;
      v13->_shareID = (CKRecordID *)v26;

      if ((objc_msgSend(v6, "sharingOptions") & 4) != 0)
        goto LABEL_23;
      objc_msgSend(v6, "st");
      rootItemIDToLookup = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(rootItemIDToLookup, "iWorkShareable");

      if (!v28)
        goto LABEL_23;
      v29 = objc_msgSend(v6, "isDocument");
      if (v29)
      {
        objc_msgSend(v6, "asDocument");
        rootItemIDToLookup = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(rootItemIDToLookup, "documentRecordID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      objc_storeStrong((id *)&v13->_recordIDNeedingFetch, v30);
      if (!v29)
        goto LABEL_23;

    }
    else
    {
      rootItemIDToLookup = v13->_shareID;
      v13->_shareID = 0;
    }
LABEL_22:

LABEL_23:
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v13, "setGroup:", v31);

  }
  return v13;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/copy-share", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)fetchRootURLIfNecessaryAndFinishWithShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BRCSharingCopyShareOperation *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDocumentIsNotShared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    v9 = 0;
    v10 = v5;
LABEL_6:
    -[_BRCOperation completedWithResult:error:](v8, "completedWithResult:error:", v9, v10);
    goto LABEL_7;
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("share"));
  if (!self->_rootItemIDToLookup)
  {
    v8 = self;
    v9 = v5;
    v10 = 0;
    goto LABEL_6;
  }
  -[BRCClientZone db](self->_clientZone, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke;
  v11[3] = &unk_24FE3FA40;
  v11[4] = self;
  v12 = v5;
  dispatch_async(v7, v11);

LABEL_7:
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_8;
    v21[3] = &unk_24FE42708;
    v4 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v4;
    v5 = (void *)MEMORY[0x2348BA0DC](v21);
    objc_msgSend(v2, "fileObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v3;
    v17[1] = 3221225472;
    v17[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_15;
    v17[3] = &unk_24FE42730;
    v9 = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v19 = v9;
    v20 = v5;
    v10 = v5;
    v11 = v7;
    objc_msgSend(v8, "getUserVisibleURLForItemIdentifier:completionHandler:", v11, v17);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536);
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_230455000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find root itemID %@%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Can't find root itemID %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completedWithResult:error:", 0, v15);

  }
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", a2, CFSTR("rootURL"));
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v4 = a1 + 32;
    v3 = *(void **)(a1 + 32);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_8_cold_1(v4, (uint64_t)v5, v6);

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Can't find URL for root itemID %@"), *(_QWORD *)(*(_QWORD *)v4 + 536));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completedWithResult:error:", 0, v7);

  }
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD *v22;
  const char *label;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  NSObject *v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v31 = v9;
      _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }

    v8 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serialQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_16;
  v25[3] = &unk_24FE40478;
  v27 = *(id *)(a1 + 48);
  v15 = v8;
  v26 = v15;
  v16 = v13;
  v17 = v25;
  v18 = (void *)MEMORY[0x2348B9F14]();
  v28 = 0uLL;
  v29 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v28);
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v24 = v28;
    label = dispatch_queue_get_label(v16);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = label;
    *(_WORD *)&buf[22] = 2112;
    v31 = v19;
    _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
  }

  v34 = v28;
  v35 = v29;
  *(_QWORD *)buf = v14;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __dispatch_async_with_logs_block_invoke_5;
  v31 = &unk_24FE3FB28;
  v21 = v16;
  v32 = v21;
  v22 = v17;
  v33 = v22;
  dispatch_async(v21, buf);

  objc_autoreleasePoolPop(v18);
}

uint64_t __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  if (self->_shareID)
  {
    v3 = objc_alloc(MEMORY[0x24BDB90E8]);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_shareID, self->_recordIDNeedingFetch, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithRecordIDs:", v4);

    objc_msgSend(v5, "setShouldFetchAssetContent:", 0);
    v6 = *MEMORY[0x24BDB8FE0];
    v11[0] = *MEMORY[0x24BDB8FC8];
    v11[1] = v6;
    v7 = *MEMORY[0x24BDB8F58];
    v11[2] = *MEMORY[0x24BDB8F50];
    v11[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDesiredKeys:", v8);

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__BRCSharingCopyShareOperation_main__block_invoke;
    v10[3] = &unk_24FE417B8;
    v10[4] = self;
    objc_msgSend(v5, "setFetchRecordsCompletionBlock:", v10);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDocumentIsNotShared");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0);

  }
}

void __36__BRCSharingCopyShareOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "completedWithResult:error:", 0, a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6[65]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD **)(a1 + 32);
    if (v8[66])
    {
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FC8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encryptedValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FE0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "syncContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "brc_itemIDWithSession:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "setPublicSharingIdentity:", v12);
      }
      else
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412546;
          v22 = v16;
          v23 = 2112;
          v24 = v17;
          _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] No sharing identity on %@%@", (uint8_t *)&v21, 0x16u);
        }

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "setBaseToken:", v10);
      }
      else
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412546;
          v22 = v16;
          v23 = 2112;
          v24 = v19;
          _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No base token on %@%@", (uint8_t *)&v21, 0x16u);
        }

      }
      v8 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v8, "fetchRootURLIfNecessaryAndFinishWithShare:", v7);

  }
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (CKRecordID)recordIDNeedingFetch
{
  return self->_recordIDNeedingFetch;
}

- (void)setRecordIDNeedingFetch:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, a3);
}

- (BRCItemID)rootItemIDToLookup
{
  return self->_rootItemIDToLookup;
}

- (void)setRootItemIDToLookup:(id)a3
{
  objc_storeStrong((id *)&self->_rootItemIDToLookup, a3);
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (void)setClientZone:(id)a3
{
  objc_storeStrong((id *)&self->_clientZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_rootItemIDToLookup, 0);
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_1(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: Copying share for item %@ that does not have a server zone%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_fault_impl(&dword_230455000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item's %@ server zone %@ is missing sync context while coping share%@", (uint8_t *)&v7, 0x20u);

}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 536);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_1(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: Can't find URL for root itemID %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
