@implementation BRCSharingCopyAccessTokenOperation

- (BRCSharingCopyAccessTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BRCSharingCopyAccessTokenOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataSyncContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)BRCSharingCopyAccessTokenOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v15, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/access-token"), v9, v7);

  if (v10)
  {
    objc_msgSend(v6, "documentRecordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSharingCopyAccessTokenOperation setRecordID:](v10, "setRecordID:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initShareIDWithShareableItem:", v6);
    -[BRCSharingCopyAccessTokenOperation setShareID:](v10, "setShareID:", v12);

    -[_BRCOperation setNonDiscretionary:](v10, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v10, "setGroup:", v13);

  }
  return v10;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/access-token", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDB90E8]);
  -[BRCSharingCopyAccessTokenOperation recordID](self, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRecordIDs:", v5);

  v7 = *MEMORY[0x24BDB8FC8];
  v10[0] = *MEMORY[0x24BDB8EF8];
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDesiredKeys:", v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__BRCSharingCopyAccessTokenOperation_main__block_invoke;
  v9[3] = &unk_24FE417B8;
  v9[4] = self;
  objc_msgSend(v6, "setFetchRecordsCompletionBlock:", v9);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v6);

}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "encryptedValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FC8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v5 && !v11 && v12 == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v5)
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_2();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: encrypted access token %@ is of unexpected type"), v11);
        goto LABEL_23;
      }
    }
  }
  if (!v5 && v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 0;
      goto LABEL_8;
    }
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: reference identifier %@ is of unexpected type"), v13);
LABEL_23:
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (v5)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_8:
  v15 = v11;
  if (v5)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v5);
    goto LABEL_29;
  }
LABEL_24:
  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v15)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("token"));
  if (v13)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, CFSTR("ref_id"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v21, 0);

LABEL_29:
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: reference identifier %@ is of unexpected type%@");
}

void __42__BRCSharingCopyAccessTokenOperation_main__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: encrypted access token %@ is of unexpected type%@");
}

@end
