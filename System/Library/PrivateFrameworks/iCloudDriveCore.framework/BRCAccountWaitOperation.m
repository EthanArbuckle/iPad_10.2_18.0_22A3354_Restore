@implementation BRCAccountWaitOperation

- (BRCAccountWaitOperation)initWithCKContainer:(id)a3
{
  id v5;
  BRCAccountWaitOperation *v6;
  BRCAccountWaitOperation *v7;
  NSObject *v8;
  dispatch_source_t v9;
  OS_dispatch_source *source;
  OS_dispatch_source *v11;
  uint64_t v12;
  OS_dispatch_source *v13;
  _QWORD *v14;
  NSObject *v15;
  _QWORD *v16;
  void *v17;
  void (**v18)(_QWORD *);
  void *v19;
  dispatch_block_t v20;
  OS_dispatch_source *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[4];
  BRCAccountWaitOperation *v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRCAccountWaitOperation;
  v6 = -[_BRCOperation initWithName:](&v32, sel_initWithName_, CFSTR("account-waiter"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ckContainer, a3);
    -[_BRCOperation callbackQueue](v7, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v8);
    source = v7->_source;
    v7->_source = (OS_dispatch_source *)v9;

    -[_BRCOperation setNonDiscretionary:](v7, "setNonDiscretionary:", 1);
    objc_initWeak(&location, v7);
    v11 = v7->_source;
    v12 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke;
    v29[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v30, &location);
    v13 = v11;
    v14 = v29;
    v15 = v13;
    v16 = v14;
    v17 = v16;
    v18 = (void (**)(_QWORD *))MEMORY[0x24BE17840];
    v19 = v16;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
    dispatch_source_set_event_handler(v15, v20);

    v21 = v7->_source;
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_2;
    v27[3] = &unk_24FE3FA18;
    v28 = v7;
    v22 = v21;
    v23 = v27;
    v24 = v23;
    if (*v18)
    {
      (*v18)(v23);
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    dispatch_source_set_cancel_handler(v22, v24);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accountChangeHandler");

}

uint64_t __47__BRCAccountWaitOperation_initWithCKContainer___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 529) = 1;
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled");
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "account-waiter", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)descriptionForCKAccountStatus:(int64_t)a3 dumpContext:(id)a4
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  switch(a3)
  {
    case 0:
      v6 = CFSTR("unavailable");
      goto LABEL_8;
    case 1:
      +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("available"), 7, v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      v6 = CFSTR("restricted");
      goto LABEL_8;
    case 3:
      v6 = CFSTR("no account");
      goto LABEL_8;
    case 4:
      v6 = CFSTR("temporarily unavailable");
      goto LABEL_8;
    default:
      v6 = CFSTR("unhandled account status");
LABEL_8:
      +[BRCDumpContext stringFromErrorString:context:](BRCDumpContext, "stringFromErrorString:context:", v6, v5);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;

      return v8;
  }
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  id v4;
  BRCAccountWaitOperation *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[BRCAccountWaitOperation descriptionForCKAccountStatus:dumpContext:](v5, "descriptionForCKAccountStatus:dumpContext:", v5->_lastAccountStatus, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCAccountWaitOperation;
  -[_BRCOperation cancel](&v3, sel_cancel);
  dispatch_source_cancel((dispatch_source_t)self->_source);
  -[BRCAccountWaitOperation resumeIfNecessary](self, "resumeIfNecessary");
}

- (void)resumeIfNecessary
{
  BRCAccountWaitOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_resumed)
  {
    dispatch_resume((dispatch_object_t)obj->_source);
    obj->_resumed = 1;
  }
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[BRCAccountWaitOperation resumeIfNecessary](self, "resumeIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)BRCAccountWaitOperation;
  -[_BRCOperation dealloc](&v3, sel_dealloc);
}

- (void)_accountChangeHandler
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx handling account change%@");
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD *v17;
  uint64_t v18;
  const char *label;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _BYTE block[24];
  void *v28;
  NSObject *v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = *(_OWORD *)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v23;
    *(_WORD *)&block[12] = 2048;
    *(_QWORD *)&block[14] = a2;
    *(_WORD *)&block[22] = 2112;
    v28 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got status %ld%@", block, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18;
  v20[3] = &unk_24FE41A28;
  v20[4] = *(_QWORD *)(a1 + 32);
  v22 = a2;
  v10 = v5;
  v21 = v10;
  v11 = v8;
  v12 = v20;
  v13 = (void *)MEMORY[0x2348B9F14]();
  v25 = 0uLL;
  v26 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v25);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18 = v25;
    label = dispatch_queue_get_label(v11);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v18;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v28 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v31 = v25;
  v32 = v26;
  *(_QWORD *)block = v9;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_3;
  v28 = &unk_24FE3FB28;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  dispatch_async(v16, block);

  objc_autoreleasePoolPop(v13);
  __brc_leave_section((uint64_t *)&v23);

}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18(uint64_t a1)
{
  id v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "resumeIfNecessary");
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 529);
  objc_sync_exit(v2);

  if (!v3)
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_3();

        dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 504));
        v6 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        v9 = v6;
        v10 = v7;
        goto LABEL_12;
      case 1:
        goto LABEL_9;
      case 2:
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_5();
        goto LABEL_19;
      case 3:
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_4();
        goto LABEL_19;
      case 4:
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_6();
LABEL_19:

        break;
      default:
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_2();

LABEL_9:
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_1();

        dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 504));
        v15 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v15;
        v10 = v7;
        v8 = 0;
LABEL_12:
        objc_msgSend(v9, "completedWithResult:error:", v10, v8);
        break;
    }

  }
}

- (void)_accountDidChange
{
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
}

- (void)start
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountDidChange, *MEMORY[0x24BDB8E60], 0);

  v4.receiver = self;
  v4.super_class = (Class)BRCAccountWaitOperation;
  -[_BRCOperation start](&v4, sel_start);
}

- (void)main
{
  BRCAccountWaitOperation *v2;

  v2 = self;
  objc_sync_enter(v2);
  v2->_resumed = 1;
  objc_sync_exit(v2);

  dispatch_source_merge_data((dispatch_source_t)v2->_source, 1uLL);
  dispatch_resume((dispatch_object_t)v2->_source);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x24BDB8E60], 0);

  v10.receiver = self;
  v10.super_class = (Class)BRCAccountWaitOperation;
  -[_BRCOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v8, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainer, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Account is now available%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown account status%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Error when asking CloudKit about the account status: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] No account loaded yet, let's wait for the account notification from CloudKit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Account is restricted let's wait for a notification from CloudKit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __48__BRCAccountWaitOperation__accountChangeHandler__block_invoke_18_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Account is temporarily unavailable, let's wait for a notification from CloudKit%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
