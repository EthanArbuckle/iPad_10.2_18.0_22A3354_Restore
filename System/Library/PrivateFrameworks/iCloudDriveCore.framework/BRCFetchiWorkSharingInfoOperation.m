@implementation BRCFetchiWorkSharingInfoOperation

- (BRCFetchiWorkSharingInfoOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BRCFetchiWorkSharingInfoOperation *v10;
  uint64_t v11;
  CKRecordID *recordID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataSyncContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)BRCFetchiWorkSharingInfoOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v14, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/iWork-publishing-fetch"), v9, v7);

  if (v10)
  {
    objc_msgSend(v6, "documentRecordID");
    v11 = objc_claimAutoreleasedReturnValue();
    recordID = v10->_recordID;
    v10->_recordID = (CKRecordID *)v11;

    -[_BRCOperation setNonDiscretionary:](v10, "setNonDiscretionary:", 1);
  }

  return v10;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/iWork-publishing-fetch", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDB90E8]);
  v11[0] = self->_recordID;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordIDs:", v4);

  v6 = *MEMORY[0x24BDB8FD0];
  v10[0] = *MEMORY[0x24BDB8FD8];
  v10[1] = v6;
  v7 = *MEMORY[0x24BDB8FE0];
  v10[2] = *MEMORY[0x24BDB8FC8];
  v10[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDesiredKeys:", v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke;
  v9[3] = &unk_24FE417B8;
  v9[4] = self;
  objc_msgSend(v5, "setFetchRecordsCompletionBlock:", v9);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);

}

void __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_2;
  if (objc_msgSend(v5, "count"))
    goto LABEL_4;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke_cold_1(v5, (uint64_t)v9, v10);

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No error and invalid number of records %lu"), objc_msgSend(v5, "count"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
  }
  else
  {
LABEL_4:
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allValues");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completedWithResult:error:", v8, 0);

  }
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

void __41__BRCFetchiWorkSharingInfoOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 134218242;
  v6 = objc_msgSend(a1, "count");
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_230455000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No error and invalid number of records %lu%@", (uint8_t *)&v5, 0x16u);
}

@end
