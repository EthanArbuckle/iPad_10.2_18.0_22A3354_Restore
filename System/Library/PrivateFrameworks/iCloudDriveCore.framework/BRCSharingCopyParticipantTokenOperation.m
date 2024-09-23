@implementation BRCSharingCopyParticipantTokenOperation

- (BRCSharingCopyParticipantTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharingCopyParticipantTokenOperation *v13;
  void *v14;
  uint64_t v15;
  CKRecordID *shareID;
  uint64_t v17;
  CKRecordID *contentRecordID;
  void *v19;
  void *v21;
  NSObject *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugItemIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sharing/copyParticipantToken"), "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataSyncContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)BRCSharingCopyParticipantTokenOperation;
  v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v23, sel_initWithName_syncContext_sessionContext_, v10, v12, v7);

  if (v13)
  {
    objc_msgSend(v6, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_iWorkShareable = objc_msgSend(v14, "iWorkShareable");

    objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    shareID = v13->_shareID;
    v13->_shareID = (CKRecordID *)v15;

    if (!v13->_shareID)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCSharingCopyParticipantTokenOperation initWithItem:sessionContext:].cold.1();

    }
    objc_msgSend(v6, "documentRecordID");
    v17 = objc_claimAutoreleasedReturnValue();
    contentRecordID = v13->_contentRecordID;
    v13->_contentRecordID = (CKRecordID *)v17;

    if ((objc_msgSend(v6, "sharingOptions") & 4) == 0 && (objc_msgSend(v6, "sharingOptions") & 0x48) != 0)
      v13->_isChildOfShare = 1;
    -[_BRCOperation setNonDiscretionary:](v13, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v13, "setGroup:", v19);

  }
  return v13;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/copyParticipantToken", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_fetchBaseTokenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_iWorkShareable && !self->_isChildOfShare)
  {
    v6 = objc_alloc(MEMORY[0x24BDB90E8]);
    v13[0] = self->_contentRecordID;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithRecordIDs:", v7);

    v12 = *MEMORY[0x24BDB8FC8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDesiredKeys:", v9);

    objc_msgSend(v8, "setShouldFetchAssetContent:", 0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke;
    v10[3] = &unk_24FE45658;
    v10[4] = self;
    v11 = v5;
    objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v10);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FC8]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "baseToken");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!(v5 | v8))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No base token so the share token we would return would be invalid for iwork"));
      v5 = objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)v5, "brc_cloudKitErrorForRecordID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v8, v12);

}

- (void)_fetchParticipantKeyWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSString *baseToken;
  void *v9;
  CKRecordID *contentRecordID;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  CKRecordID *v17;
  CKRecordID *v18;
  CKRecordID *shareID;
  NSString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDB9100]);
  v21[0] = self->_shareID;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithShareIDs:", v6);

  baseToken = self->_baseToken;
  if (baseToken)
  {
    shareID = self->_shareID;
    v20 = baseToken;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &shareID, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBaseTokensByShareID:", v9);

  }
  if (self->_isChildOfShare)
  {
    contentRecordID = self->_contentRecordID;
    v17 = self->_shareID;
    v18 = contentRecordID;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChildRecordIDsByShareID:", v11);

  }
  v12 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke;
  v16[3] = &unk_24FE48180;
  v16[4] = self;
  objc_msgSend(v7, "setShareParticipantKeyFetchedBlock:", v16);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2;
  v14[3] = &unk_24FE41D48;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v7, "setShareParticipantKeyCompletionBlock:", v14);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v7);

}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  v9 = *(void **)(v8 + 544);
  *(_QWORD *)(v8 + 544) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 560);
  *(_QWORD *)(v10 + 560) = v7;

}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  if (v3)
  {
LABEL_2:
    v4 = v3;
    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 560) && !*(_QWORD *)(v5 + 544))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no error and no participantKey"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_2;
  }
  v4 = 0;
LABEL_6:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 560))
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 560);
  else
    v6 = v4;
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6);

}

- (void)_fetchParticipantDocumentTokenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("participantKey"), self->_participantKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91B8]), "initWithRecordType:predicate:", CFSTR("FetchParticipantDocumentToken"), v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91C8]), "initWithQuery:", v6);
  -[CKRecordID zoneID](self->_shareID, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setZoneID:", v8);

  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke;
  v14[3] = &unk_24FE481A8;
  v14[4] = self;
  objc_msgSend(v7, "setRecordMatchedBlock:", v14);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2;
  v11[3] = &unk_24FE46180;
  v12 = v4;
  v13 = v7;
  v11[4] = self;
  v10 = v4;
  objc_msgSend(v7, "setQueryCompletionBlock:", v11);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v7);

}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = *(void **)(v10 + 560);
    *(_QWORD *)(v10 + 560) = v11;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("participantDocumentToken"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v14 + 536);
    *(_QWORD *)(v14 + 536) = v13;
    goto LABEL_5;
  }
LABEL_6:

}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation _fetchParticipantDocumentTokenWithCompletion:]_block_invoke_2", 900, v15);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[6];
    v12 = CFSTR("success");
    if (v6)
      v12 = v6;
    *(_DWORD *)buf = 134218754;
    v17 = v15[0];
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling result of %@: %@%@", buf, 0x2Au);
  }

  if (!v6)
  {
    v9 = a1[4];
    if (*(_QWORD *)(v9 + 560) || *(_QWORD *)(v9 + 536))
    {
      v6 = 0;
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no error and no participantDocumentToken"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (*(_QWORD *)(a1[4] + 560))
    v10 = *(__CFString **)(a1[4] + 560);
  else
    v10 = v6;
  (*(void (**)(_QWORD, __CFString *))(a1[5] + 16))(a1[5], v10);
  __brc_leave_section(v15);

}

- (void)_completeWithResult:(id)a3 participantKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("participantKey"));
  if (v9)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("baseToken"));
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", v8, 0);

}

- (void)main
{
  id v3;
  _QWORD v4[5];

  if (self->_shareID)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke;
    v4[3] = &unk_24FE46BE0;
    v4[4] = self;
    -[BRCSharingCopyParticipantTokenOperation _fetchBaseTokenWithCompletion:](self, "_fetchBaseTokenWithCompletion:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("shareID"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v3);

  }
}

void __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a2;
  v7 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v7, "completedWithResult:error:", 0, a3);
  }
  else
  {
    objc_storeStrong(v7 + 69, a2);
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_2;
    v9[3] = &unk_24FE3F6A0;
    v9[4] = v8;
    objc_msgSend(v8, "_fetchParticipantKeyWithCompletion:", v9);
  }

}

uint64_t __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "completedWithResult:error:", 0, a2);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_3;
  v4[3] = &unk_24FE3F6A0;
  v4[4] = v2;
  return objc_msgSend(v2, "_fetchParticipantDocumentTokenWithCompletion:", v4);
}

void __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation main]_block_invoke_3", 947, &v10);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
      *(_DWORD *)buf = 134218754;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v4;
      _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Failed to get participantDocumentToken for item: %@ with error %@%@", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
    __brc_leave_section(&v10);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation main]_block_invoke", 951, &v10);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
      *(_DWORD *)buf = 134218498;
      v14 = v10;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Succeed to get participantDocumentToken. item: %@%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_completeWithResult:participantKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
    __brc_leave_section(&v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_participantKey, 0);
  objc_storeStrong((id *)&self->_participantDocumentToken, 0);
  objc_storeStrong((id *)&self->_contentRecordID, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

- (void)initWithItem:sessionContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Can't fetch shareID for item %@%@");
  OUTLINED_FUNCTION_0();
}

void __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No base token so the share token we would return would be invalid for iwork%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no error and no participantKey%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no error and no participantDocumentToken%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
