@implementation BRCSharingCopyShareURLOperation

- (BRCSharingCopyShareURLOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BRCSharingCopyShareURLOperation *v14;
  objc_super v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/copy-shareURL"), "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)BRCSharingCopyShareURLOperation;
  v14 = -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:](&v16, sel_initWithName_zone_share_sessionContext_, v13, v9, v10, v8);

  return v14;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/copy-shareURL", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_completedWithURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CKShare *v11;
  CKShare *share;
  int v13;
  id v14;
  __int16 v15;
  CKShare *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    share = self->super._share;
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = share;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished copying URL %@ for share %@ error %@%@", (uint8_t *)&v13, 0x2Au);
  }

  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("url"));
  v11 = self->super._share;
  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("share"));
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", v8, v7);

}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__BRCSharingCopyShareURLOperation_main__block_invoke;
  v2[3] = &unk_24FE40568;
  v2[4] = self;
  -[BRCSharingModifyShareOperation _performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:](self, "_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:", 1, v2);
}

void __39__BRCSharingCopyShareURLOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "completedWithResult:error:", 0, a3);
    return;
  }
  objc_msgSend(v4[65], "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logicalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(id **)(a1 + 32);
  if (!v8)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      __39__BRCSharingCopyShareURLOperation_main__block_invoke_cold_1();

    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BE17430];
    v31 = CFSTR("unreachable: Couldn't get a share URL");
    goto LABEL_25;
  }
  objc_msgSend(v9[66], "brc_updateWithLogicalName:isFolder:", v8, objc_msgSend(v6, "isDirectory"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "brc_updateWithLogicalName:isFolder:", v8, objc_msgSend(v6, "isDirectory"));
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
    *(_DWORD *)buf = 138412546;
    v39 = v34;
    v40 = 2112;
    v41 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Share: %@%@", buf, 0x16u);
  }

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
    *(_DWORD *)buf = 138412546;
    v39 = v35;
    v40 = 2112;
    v41 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Prepared record: %@%@", buf, 0x16u);
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "isKnownToServer") & 1) == 0)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 528);
    objc_msgSend(*(id *)(v14 + 520), "metadataSyncContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ckContainerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CKAssignToContainerWithID:", v17);

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "isKnownToServer") & 1) == 0)
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 544);
    objc_msgSend(*(id *)(v18 + 520), "metadataSyncContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ckContainerID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CKAssignToContainerWithID:", v21);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "brc_safeToGetURL")
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "URL"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "brc_safeToGetURL"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v23 = *(_QWORD **)(a1 + 32);
        v24 = (void *)v23[68];
        goto LABEL_18;
      }
    }
    v9 = *(id **)(a1 + 32);
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
      *(_DWORD *)buf = 138412546;
      v39 = v36;
      v40 = 2112;
      v41 = v32;
      _os_log_fault_impl(&dword_230455000, v33, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't get a share URL for %@%@", buf, 0x16u);
    }

    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BE17430];
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
    v31 = CFSTR("unreachable: Couldn't get a share URL for %@");
LABEL_25:
    objc_msgSend(v29, "br_errorWithDomain:code:description:", v30, 15, v31, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completedWithResult:error:", 0, v26);
    goto LABEL_26;
  }
  v23 = *(_QWORD **)(a1 + 32);
  v24 = (void *)v23[66];
LABEL_18:
  objc_msgSend(v24, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_completedWithURL:error:", v26, 0);
LABEL_26:

}

void __39__BRCSharingCopyShareURLOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't get a share URL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
