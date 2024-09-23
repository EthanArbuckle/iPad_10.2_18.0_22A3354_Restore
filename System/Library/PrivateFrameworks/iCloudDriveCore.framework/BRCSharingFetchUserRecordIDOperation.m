@implementation BRCSharingFetchUserRecordIDOperation

- (BRCSharingFetchUserRecordIDOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  BRCSharingFetchUserRecordIDOperation *v4;
  BRCSharingFetchUserRecordIDOperation *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCSharingFetchUserRecordIDOperation;
  v4 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v8, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing.fetch-user-record-id"), a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_BRCOperation setNonDiscretionary:](v4, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v5, "setGroup:", v6);

  }
  return v5;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing.fetch-user-record-id", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BDB90E8], "fetchCurrentUserRecordOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDesiredKeys:", MEMORY[0x24BDBD1A8]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke;
  v4[3] = &unk_24FE417B8;
  v4[4] = self;
  objc_msgSend(v3, "setFetchRecordsCompletionBlock:", v4);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v3);

}

void __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (!v6 && !v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke_cold_1((uint64_t)v8, v9);

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no record and no error"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "completedWithResult:error:", v12, v6);

}

void __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no record and no error%@", (uint8_t *)&v2, 0xCu);
}

@end
