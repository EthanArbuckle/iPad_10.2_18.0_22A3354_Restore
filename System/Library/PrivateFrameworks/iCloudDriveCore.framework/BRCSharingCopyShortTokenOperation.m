@implementation BRCSharingCopyShortTokenOperation

- (BRCSharingCopyShortTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCSharingCopyShortTokenOperation *v18;
  objc_super v20;

  v6 = (objc_class *)MEMORY[0x24BDB91E8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initShareIDWithShareableItem:", v8);
  objc_msgSend(v8, "baseRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9230]), "initWithRootRecord:shareID:", v10, v9);
  objc_msgSend(v8, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logicalName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "brc_updateWithLogicalName:isFolder:", v13, 0);

  objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation setGroup:](self, "setGroup:", v14);

  objc_msgSend(v9, "recordName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/copy-shortToken"), "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)BRCSharingCopyShortTokenOperation;
  v18 = -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:](&v20, sel_initWithName_zone_share_sessionContext_, v16, v17, v11, v7);

  return v18;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/copy-shortToken", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__BRCSharingCopyShortTokenOperation_main__block_invoke;
  v2[3] = &unk_24FE40568;
  v2[4] = self;
  -[BRCSharingModifyShareOperation _performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:](self, "_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:", 1, v2);
}

void __41__BRCSharingCopyShortTokenOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v5 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "completedWithResult:error:", 0, v4);
  }
  else
  {
    objc_msgSend(v5[66], "shortToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v4 = 0;
    }
    else
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __41__BRCSharingCopyShortTokenOperation_main__block_invoke_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No short token found on record"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v6, v4);

  }
}

void __41__BRCSharingCopyShortTokenOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No short token found on record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
