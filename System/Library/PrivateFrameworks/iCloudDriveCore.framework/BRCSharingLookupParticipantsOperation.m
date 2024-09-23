@implementation BRCSharingLookupParticipantsOperation

- (BRCSharingLookupParticipantsOperation)initWithUserIdentities:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BRCSharingLookupParticipantsOperation *v11;
  uint64_t v12;
  NSMutableArray *shareParticipants;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "syncContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSyncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)BRCSharingLookupParticipantsOperation;
  v11 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v16, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/lookup-participants"), v10, v8);

  if (v11)
  {
    -[_BRCOperation setNonDiscretionary:](v11, "setNonDiscretionary:", 1);
    objc_storeStrong((id *)&v11->_userIdentities, a3);
    v12 = objc_opt_new();
    shareParticipants = v11->_shareParticipants;
    v11->_shareParticipants = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v11, "setGroup:", v14);

  }
  return v11;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/lookup-participants", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9108]), "initWithUserIdentityLookupInfos:", self->_userIdentities);
  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__BRCSharingLookupParticipantsOperation_main__block_invoke;
  v6[3] = &unk_24FE48108;
  v6[4] = self;
  objc_msgSend(v3, "setShareParticipantFetchedBlock:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __45__BRCSharingLookupParticipantsOperation_main__block_invoke_2;
  v5[3] = &unk_24FE3F6A0;
  v5[4] = self;
  objc_msgSend(v3, "setFetchShareParticipantsCompletionBlock:", v5);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v3);

}

uint64_t __45__BRCSharingLookupParticipantsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "addObject:", a2);
}

void __45__BRCSharingLookupParticipantsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "count");
    if (v9 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "count"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
        v18 = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = (uint64_t)v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched share participants: %@%@", (uint8_t *)&v18, 0x16u);
      }

      v8 = *(_QWORD **)(a1 + 32);
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "count");
        v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "count");
        v18 = 134218498;
        v19 = v16;
        v20 = 2048;
        v21 = v17;
        v22 = 2112;
        v23 = v12;
        _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected number of share participants: expected %lu got %lu%@", (uint8_t *)&v18, 0x20u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 15, CFSTR("Unexpected number of share participants"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD **)(a1 + 32);
      if (v4)
      {
        v7 = 0;
        goto LABEL_14;
      }
    }
    v4 = 0;
    v7 = v8[66];
    goto LABEL_14;
  }
  v4 = v3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v18 = 138412802;
    v19 = v14;
    v20 = 2112;
    v21 = (uint64_t)v4;
    v22 = 2112;
    v23 = v5;
    _os_log_error_impl(&dword_230455000, v6, (os_log_type_t)0x90u, "[ERROR] failed share participant lookup for %@ - %@%@", (uint8_t *)&v18, 0x20u);
  }

  v7 = 0;
  v8 = *(_QWORD **)(a1 + 32);
LABEL_14:
  objc_msgSend(v8, "completedWithResult:error:", v7, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
}

@end
