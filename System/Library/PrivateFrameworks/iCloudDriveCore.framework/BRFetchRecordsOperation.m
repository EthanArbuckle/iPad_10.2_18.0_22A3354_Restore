@implementation BRFetchRecordsOperation

- (BRFetchRecordsOperation)init
{
  BRFetchRecordsOperation *v2;
  BRFetchRecordsOperation *v3;
  objc_super v5;
  _QWORD v6[4];
  BRFetchRecordsOperation *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRFetchRecordsOperation;
  v2 = -[BRFetchRecordsOperation init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __31__BRFetchRecordsOperation_init__block_invoke;
    v6[3] = &unk_24FE417B8;
    v7 = v2;
    v5.receiver = v7;
    v5.super_class = (Class)BRFetchRecordsOperation;
    -[BRFetchRecordsOperation setFetchRecordsCompletionBlock:](&v5, sel_setFetchRecordsCompletionBlock_, v6);

  }
  return v3;
}

void __31__BRFetchRecordsOperation_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "brc_ckPartialErrorsByItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = *(id *)(a1 + 32);
  v34.super_class = (Class)BRFetchRecordsOperation;
  objc_msgSendSuper2(&v34, sel_perRecordCompletionBlock);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v5, "count");
    v11 = objc_msgSend(v7, "count") + v10;
    objc_msgSend(*(id *)(a1 + 32), "recordIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 < v13)
    {
      v28 = v6;
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v14;
        _os_log_impl(&dword_230455000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Batch operatoin completed but some records were not handled by perRecordCompletionBlock%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17300], 149, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = a1;
      objc_msgSend(*(id *)(a1 + 32), "recordIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22);
            objc_msgSend(v5, "objectForKey:", v23, v28);
            v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            if (v24)
              goto LABEL_11;
            objc_msgSend(v7, "objectForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
            {
              v29.receiver = *(id *)(v17 + 32);
              v29.super_class = (Class)BRFetchRecordsOperation;
              objc_msgSendSuper2(&v29, sel_perRecordCompletionBlock);
              v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, uint64_t, void *))v24)[2](v24, 0, v23, v16);
LABEL_11:

            }
            ++v22;
          }
          while (v20 != v22);
          v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          v20 = v26;
        }
        while (v26);
      }

      v6 = v28;
      a1 = v17;
    }
  }
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 696);
  if (v27)
    (*(void (**)(uint64_t, id, id))(v27 + 16))(v27, v5, v6);

}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
  void *v4;
  id fetchRecordsCompletionBlock;

  v4 = (void *)MEMORY[0x2348BA0DC](a3, a2);
  fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
  self->_fetchRecordsCompletionBlock = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
}

@end
