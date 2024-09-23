@implementation BRCSharingModifyAccessOperation

- (BRCSharingModifyAccessOperation)initWithItem:(id)a3 allowAccess:(BOOL)a4 sessionContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCSharingModifyAccessOperation *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugItemIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/modifyAccess"), "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "serverZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadataSyncContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)BRCSharingModifyAccessOperation;
  v16 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v19, sel_initWithName_syncContext_sessionContext_, v13, v15, v10);

  if (v16)
  {
    -[_BRCOperation setNonDiscretionary:](v16, "setNonDiscretionary:", 1);
    objc_storeStrong((id *)&v16->_document, a3);
    v16->_allowAccess = a4;
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v16, "setGroup:", v17);

  }
  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/modifyAccess", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL4 allowAccess;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  BRCSharingModifyAccessOperation *v20;
  id v21;
  _QWORD v22[5];
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[BRCLocalItem itemID](self->_document, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem serverZone](self->_document, "serverZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsRecordIDInZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDB9148]);
  allowAccess = self->_allowAccess;
  if (!self->_allowAccess)
  {
    v9 = 0;
LABEL_5:
    v23 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithRecordIDsToGrantAccess:recordIDsToRevokeAccess:", v9, v11);

    if (!allowAccess)
      goto LABEL_7;
    goto LABEL_6;
  }
  v24[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_allowAccess)
    goto LABEL_5;
  v10 = (void *)objc_msgSend(v7, "initWithRecordIDsToGrantAccess:recordIDsToRevokeAccess:", v9, 0);
LABEL_6:

LABEL_7:
  v12 = MEMORY[0x24BDAC760];
  if (self->_allowAccess)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __39__BRCSharingModifyAccessOperation_main__block_invoke;
    v22[3] = &unk_24FE48130;
    v22[4] = self;
    objc_msgSend(v10, "setRecordAccessGrantedBlock:", v22);
  }
  v16 = v12;
  v17 = 3221225472;
  v18 = __39__BRCSharingModifyAccessOperation_main__block_invoke_2;
  v19 = &unk_24FE48158;
  v20 = self;
  v21 = v6;
  v13 = v6;
  objc_msgSend(v10, "setRecordAccessCompletionBlock:", &v16);
  objc_msgSend(v10, "callbackQueue", v16, v17, v18, v19, v20);
  v14 = objc_claimAutoreleasedReturnValue();
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v14, v15);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v10);
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 536);
  *(_QWORD *)(v8 + 536) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 544);
  *(_QWORD *)(v10 + 544) = v7;

}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 && !v8 && !v9)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_2();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no dict and no error"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v10)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = CFSTR("revoking");
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 528))
        v22 = CFSTR("granting");
      v23 = 138413058;
      v24 = v22;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v13;
      _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] Failed %@ access to %@ - %@%@", (uint8_t *)&v23, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v10);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_1();

    v17 = (void *)objc_opt_new();
    v18 = *(_QWORD **)(a1 + 32);
    v19 = v18[67];
    if (v19)
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("accessToken"));
      v18 = *(_QWORD **)(a1 + 32);
    }
    v20 = v18[68];
    if (v20)
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("referenceIdentifier"));
      v18 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v18, "completedWithResult:error:", v17, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15_0();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ access to %@%@", v4, 0x20u);
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no dict and no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
