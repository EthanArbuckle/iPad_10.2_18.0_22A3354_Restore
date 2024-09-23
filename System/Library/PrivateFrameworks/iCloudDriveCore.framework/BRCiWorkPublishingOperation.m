@implementation BRCiWorkPublishingOperation

- (BRCiWorkPublishingOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4 forPublish:(BOOL)a5 readonly:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BRCiWorkPublishingOperation *v14;
  uint64_t v15;
  BRCItemID *itemID;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *recordIDs;
  uint64_t v21;
  BRCServerZone *serverZone;
  void *v23;
  char v24;
  void *v26;
  NSObject *v27;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "serverZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataSyncContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)BRCiWorkPublishingOperation;
  v14 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v28, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/iWork-publishing"), v13, v11);

  if (v14)
  {
    objc_msgSend(v10, "itemID");
    v15 = objc_claimAutoreleasedReturnValue();
    itemID = v14->_itemID;
    v14->_itemID = (BRCItemID *)v15;

    objc_msgSend(v10, "structureRecordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    objc_msgSend(v10, "documentRecordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v19 = objc_claimAutoreleasedReturnValue();
    recordIDs = v14->_recordIDs;
    v14->_recordIDs = (NSArray *)v19;

    v14->_forPublish = a5;
    v14->_readonly = a6;
    objc_msgSend(v10, "serverZone");
    v21 = objc_claimAutoreleasedReturnValue();
    serverZone = v14->_serverZone;
    v14->_serverZone = (BRCServerZone *)v21;

    -[_BRCOperation setNonDiscretionary:](v14, "setNonDiscretionary:", 1);
    objc_msgSend(v10, "st");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "iWorkShareable");

    if ((v24 & 1) == 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BRCiWorkPublishingOperation initWithDocumentItem:sessionContext:forPublish:readonly:].cold.1();

    }
  }

  return v14;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/iWork-publishing", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)_updateItemAfterShareCompleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemByItemID:", self->_itemID);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setSharingOptions:", objc_msgSend(v7, "sharingOptions") & 0xFFFFFFFFFFFFFFFCLL | -[NSNumber unsignedCharValue](self->_sharingInfo, "unsignedCharValue"));
    objc_msgSend(v7, "saveToDB");
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    -[BRCItemID itemIDString](self->_itemID, "itemIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brc_errorItemNotFound:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v6);

  }
}

- (void)main
{
  _BOOL4 forPublish;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  forPublish = self->_forPublish;
  v4 = self->_recordIDs;
  if (forPublish)
    v5 = 0;
  else
    v5 = v4;
  if (forPublish)
    v6 = v4;
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9168]), "initWithRecordIDsToWebShare:recordIDsToUnshare:", v6, v5);
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__BRCiWorkPublishingOperation_main__block_invoke;
  v11[3] = &unk_24FE43290;
  v11[4] = self;
  objc_msgSend(v7, "setWebShareRecordsCompletionBlock:", v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_2;
  v10[3] = &unk_24FE48130;
  v10[4] = self;
  objc_msgSend(v7, "setRecordSharedBlock:", v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_10;
  v9[3] = &unk_24FE47418;
  v9[4] = self;
  objc_msgSend(v7, "setRecordUnsharedBlock:", v9);
  if (self->_forPublish && !self->_readonly)
    objc_msgSend(v7, "setRecordIDsToShareReadWrite:", self->_recordIDs);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v7);

}

void __35__BRCiWorkPublishingOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 520) && !*(_QWORD *)(v10 + 528))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __35__BRCiWorkPublishingOperation_main__block_invoke_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No sharing info and no error"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_2;
      v10 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v10 + 248), "session");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_5;
    block[3] = &unk_24FE3FA18;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v12, block);

    goto LABEL_6;
  }
LABEL_2:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
LABEL_6:

}

uint64_t __35__BRCiWorkPublishingOperation_main__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateItemAfterShareCompleted");
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a5;
  v10 = v9;
  if (!a4 || v9)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      v19 = 138412802;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v15;
      _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] Failed sharing %@ - %@%@", (uint8_t *)&v19, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_2();

    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 520))
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_1();

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", BRMakeiWorkSharingOptions());
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 528);
    *(_QWORD *)(v14 + 528) = v13;
  }

}

void __35__BRCiWorkPublishingOperation_main__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v15 = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] Failed unsharing %@ - %@%@", (uint8_t *)&v15, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __35__BRCiWorkPublishingOperation_main__block_invoke_10_cold_2();

    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 520))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __35__BRCiWorkPublishingOperation_main__block_invoke_10_cold_1();

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", BRMakeiWorkSharingOptions());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v12 + 528);
    *(_QWORD *)(v12 + 528) = v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_sharingInfo, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

- (void)initWithDocumentItem:sessionContext:forPublish:readonly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: item.st.iWorkShareable%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No sharing info and no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_forPublish%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ was shared%@");
  OUTLINED_FUNCTION_0();
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !self->_forPublish%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_10_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ was unshared%@");
  OUTLINED_FUNCTION_0();
}

@end
