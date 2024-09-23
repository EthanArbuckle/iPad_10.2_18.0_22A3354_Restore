@implementation BRCSharingModifyShareOperation

- (BRCSharingModifyShareOperation)initWithName:(id)a3 zone:(id)a4 share:(id)a5 sessionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BRCSharingModifyShareOperation *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BRCItemID *itemID;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  NSObject *v26;
  objc_super v27;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v11, "metadataSyncContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)BRCSharingModifyShareOperation;
  v16 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v27, sel_initWithName_syncContext_sessionContext_, v14, v15, v13);

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v16, "setGroup:", v17);

    -[_BRCOperation setNonDiscretionary:](v16, "setNonDiscretionary:", 1);
    objc_storeStrong((id *)&v16->_serverZone, a4);
    objc_storeStrong((id *)&v16->_share, a5);
    objc_msgSend(v12, "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "brc_shareItemID");
    v19 = objc_claimAutoreleasedReturnValue();
    itemID = v16->_itemID;
    v16->_itemID = (BRCItemID *)v19;

    if (!v16->_itemID)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:].cold.1();

    }
    -[_BRCOperation callbackQueue](v16, "callbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clientTruthWorkloop");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v21, v23);

  }
  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "BRCSharingModifyShareOperation/? (subclass activity missing)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_updateDBAndSyncDownIfNeededWithShare:(id)a3 recordsToLearnCKInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BRCSharingModifyShareOperation *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__BRCSharingModifyShareOperation__updateDBAndSyncDownIfNeededWithShare_recordsToLearnCKInfo___block_invoke;
  v14[3] = &unk_24FE46C70;
  v15 = v8;
  v16 = v7;
  v17 = self;
  v18 = v6;
  v10 = v6;
  v11 = v7;
  v13 = v8;
  objc_msgSend(v9, "groupInBatch:", v14);

  objc_msgSend(v13, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flushToMakeEditsVisibleToIPCReaders");

}

void __93__BRCSharingModifyShareOperation__updateDBAndSyncDownIfNeededWithShare_recordsToLearnCKInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 536));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asShareableItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "sharingOptions");
    if ((v4 & 0x7C) != 0 && !*(_QWORD *)(a1 + 56))
      v4 &= 0xFFFFFFFFFFFFFF83;
    v5 = v4 | 4;
    if (!*(_QWORD *)(a1 + 56))
      v5 = v4;
    if ((v4 & 4) != 0)
      v6 = v4;
    else
      v6 = v5;
    if (((v6 >> 3) & 1) != objc_msgSend(*(id *)(a1 + 56), "publicPermission") < 2)
      v7 = v6;
    else
      v7 = v6 ^ 8;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "participants", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v12, "role") != 1 && objc_msgSend(v12, "permission") > 1)
          {
            LODWORD(v9) = 1;
            goto LABEL_27;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_27:

    if (((v7 & 0x40) == 0) != v9)
      v17 = v7;
    else
      v17 = v7 ^ 0x40;
    if ((objc_msgSend(*(id *)(a1 + 56), "publicPermission") != 2) == ((v17 >> 4) & 1))
      v17 ^= 0x10uLL;
    if (v17 != objc_msgSend(v3, "sharingOptions"))
    {
      if (*(_QWORD *)(a1 + 56)
        || (objc_msgSend(v3, "clientZone"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isPrivateZone"),
            v18,
            v19))
      {
        objc_msgSend(v3, "setSharingOptions:", v17);
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithLastUsedDate:", v20);

    objc_msgSend(v3, "markNeedsUploadOrSyncingUp");
    objc_msgSend(v3, "saveToDB");
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 536);
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find item %@ in zone %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 536));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21 || (*(_QWORD *)(a1 + 56) == 0) == (((unint64_t)objc_msgSend(v21, "sharingOptions") >> 2) & 1))
    objc_msgSend(*(id *)(a1 + 32), "scheduleSyncDownFirst");

}

- (void)_performAfterCopyingPublicSharingKeyWithRecordID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  BRCSharingModifyShareOperation *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDB90E8]);
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordIDs:", v9);

  objc_msgSend(v10, "setShouldFetchAssetContent:", 0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __94__BRCSharingModifyShareOperation__performAfterCopyingPublicSharingKeyWithRecordID_completion___block_invoke;
  v14[3] = &unk_24FE464A8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "setFetchRecordsCompletionBlock:", v14);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCallbackQueue:", v13);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v10);
}

void __94__BRCSharingModifyShareOperation__performAfterCopyingPublicSharingKeyWithRecordID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t)v12;
  v7 = v5;
  if (!v12)
  {
    objc_msgSend(v5, "encryptedPublicSharingKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      || (objc_msgSend(MEMORY[0x24BDD1540], "brc_errorPermissionError:", CFSTR("Couldn't get public sharing key")),
          (v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_storeStrong((id *)(a1[5] + 544), v7);
      objc_msgSend(v7, "encryptedPublicSharingKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[5] + 528), "setPublicSharingIdentity:", v9);

      objc_msgSend(v7, "displayedHostname");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[5] + 528), "setDisplayedHostname:", v10);

      objc_msgSend(v7, "routingKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[5] + 528), "setRoutingKey:", v11);

      v6 = 0;
    }
  }
  v13 = (id)v6;
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)_performAfterGettingPublicSharingKeyForRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:].cold.2();

  if (!v6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:].cold.1();

  }
  objc_msgSend(v6, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsPublicSharingKey:", 1);
  v11 = objc_alloc(MEMORY[0x24BDB9158]);
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRecordsToSave:recordIDsToDelete:", v12, 0);

  objc_msgSend(v13, "setAtomic:", 1);
  objc_msgSend(v13, "setSavePolicy:", 0);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke;
  v19[3] = &unk_24FE48018;
  v20 = v10;
  v21 = v7;
  v19[4] = self;
  v14 = v10;
  v15 = v7;
  objc_msgSend(v13, "setModifyRecordsCompletionBlock:", v19);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCallbackQueue:", v16);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v13);
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v6, "count");
  if (!v7 && !v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_3();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no records and no error"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "encryptedPublicSharingKey");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!(v12 | v7))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_2();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no error and no sharing key"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    if ((objc_msgSend((id)v7, "brc_containsCloudKitErrorCode:", 12) & 1) != 0
      || objc_msgSend((id)v7, "brc_containsCloudKitErrorCode:", 10))
    {
      objc_msgSend(*(id *)(a1 + 32), "_performAfterCopyingPublicSharingKeyWithRecordID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_1();

      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 32);
      objc_msgSend((id)v7, "brc_cloudKitErrorForRecordID:", *(_QWORD *)(a1 + 40));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v26);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_12;
    v31 = &unk_24FE47718;
    v32 = *(_QWORD *)(a1 + 32);
    v33 = v6;
    objc_msgSend(v16, "groupInBatch:", &v28);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 544), v8);
    objc_msgSend(v8, "encryptedPublicSharingKey", v28, v29, v30, v31, v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setPublicSharingIdentity:", v17);

    objc_msgSend(v8, "displayedHostname");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setDisplayedHostname:", v18);

    objc_msgSend(v8, "routingKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setRoutingKey:", v19);

    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
      *(_DWORD *)buf = 138412546;
      v35 = v27;
      v36 = 2112;
      v37 = v20;
      _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Got sharing identity for share - %@%@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_12(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientZone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", *(_QWORD *)(a1 + 40), 1);

}

- (BOOL)_shouldFetchSharingIdentity:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  -[CKShare publicSharingIdentity](self->_share, "publicSharingIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;
  if (v5)
    v7 = !v3;
  else
    v7 = 1;
  if (!v7)
  {
    -[CKShare routingKey](self->_share, "routingKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  return !v6;
}

- (void)_performAfterFetchingSharingIdentityOnDocumentItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, BRCSharingModifyShareOperation *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = (void (**)(id, BRCSharingModifyShareOperation *, _QWORD))a5;
  if (-[BRCSharingModifyShareOperation _shouldFetchSharingIdentity:](self, "_shouldFetchSharingIdentity:", v6))
  {
    if ((objc_msgSend(v12, "sharingOptions") & 4) != 0)
    {
      objc_msgSend(v12, "documentRecordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSharingModifyShareOperation _performAfterCopyingPublicSharingKeyWithRecordID:completion:](self, "_performAfterCopyingPublicSharingKeyWithRecordID:completion:", v9, v8);
    }
    else
    {
      objc_msgSend(v12, "baseRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ckInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serializeSystemFields:", v11);

      -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:](self, "_performAfterGettingPublicSharingKeyForRecord:completion:", v9, v8);
    }

  }
  else
  {
    v8[2](v8, self, 0);
  }

}

- (void)_performAfterFetchingSharingIdentityOnDirectoryItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, BRCSharingModifyShareOperation *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v17 = a3;
  v8 = (void (**)(id, BRCSharingModifyShareOperation *, _QWORD))a5;
  if (-[BRCSharingModifyShareOperation _shouldFetchSharingIdentity:](self, "_shouldFetchSharingIdentity:", v6))
  {
    if ((objc_msgSend(v17, "sharingOptions") & 4) != 0)
    {
      objc_msgSend(v17, "itemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "st");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "type");
      objc_msgSend(v17, "serverZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCSharingModifyShareOperation _performAfterCopyingPublicSharingKeyWithRecordID:completion:](self, "_performAfterCopyingPublicSharingKeyWithRecordID:completion:", v16, v8);
    }
    else
    {
      objc_msgSend(v17, "folderRootStructureRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "st");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ckInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serializeSystemFields:", v11);

      -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:](self, "_performAfterGettingPublicSharingKeyForRecord:completion:", v9, v8);
    }
  }
  else
  {
    v8[2](v8, self, 0);
  }

}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, BRCSharingModifyShareOperation *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, BRCSharingModifyShareOperation *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, BRCSharingModifyShareOperation *, _QWORD))a4;
  -[CKShare routingKey](self->_share, "routingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  objc_msgSend(v6, "routingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "routingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKShare setRoutingKey:](self->_share, "setRoutingKey:", v10);

LABEL_4:
    v7[2](v7, self, 0);
    goto LABEL_5;
  }
  -[CKShare publicSharingIdentity](self->_share, "publicSharingIdentity");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        -[CKShare baseToken](self->_share, "baseToken"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSharingModifyShareOperation _performAfterFetchingiWorkRoutingTokenIfNecessary:completion:].cold.2();

    -[CKShare publicSharingIdentity](self->_share, "publicSharingIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMutableEncryptedPublicSharingKeyData:", v16);

    -[CKShare baseToken](self->_share, "baseToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseToken:", v17);

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke;
    v21[3] = &unk_24FE48040;
    v21[4] = self;
    v22 = v7;
    -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:](self, "_performAfterGettingPublicSharingKeyForRecord:completion:", v6, v21);

  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCSharingModifyShareOperation _performAfterFetchingiWorkRoutingTokenIfNecessary:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no public sharing identity. avoiding breaking iwork shares"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, BRCSharingModifyShareOperation *, void *))v7)[2](v7, self, v20);

  }
LABEL_5:

}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "routingKey");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!(v4 | v5))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_2();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no routing key on share identity prepared record"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "publicSharingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "encryptedPublicSharingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToData:", v9);

  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_performAfterFetchingiWorkSharingIdentityOnItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, BRCSharingModifyShareOperation *, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  BRCSharingModifyShareOperation *v28;
  void (**v29)(id, BRCSharingModifyShareOperation *, _QWORD);
  BOOL v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, BRCSharingModifyShareOperation *, _QWORD))a5;
  -[CKShare baseToken](self->_share, "baseToken");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  -[CKShare publicSharingIdentity](self->_share, "publicSharingIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    if (a4)
    {
      -[CKShare routingKey](self->_share, "routingKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_7;
    }
    else
    {

    }
    v9[2](v9, self, 0);
    goto LABEL_12;
  }

LABEL_7:
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRCSharingModifyShareOperation _performAfterFetchingiWorkSharingIdentityOnItem:wantRoutingKey:completion:].cold.1();

  objc_msgSend(v8, "documentRecordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BDB90E8]);
  v32[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithRecordIDs:", v19);

  v21 = *MEMORY[0x24BDB8FE0];
  v31[0] = *MEMORY[0x24BDB8FC8];
  v31[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDesiredKeys:", v22);

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke;
  v25[3] = &unk_24FE48068;
  v26 = v17;
  v27 = v8;
  v28 = self;
  v30 = a4;
  v29 = v9;
  v23 = v17;
  objc_msgSend(v20, "setFetchRecordsCompletionBlock:", v25);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCallbackQueue:", v24);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v20);
LABEL_12:

}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutableEncryptedPublicSharingKeyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v6, "encryptedValues"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FE0]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_3();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: sharing identity isn't encrypted data"));
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = 0;
      v5 = (id)v12;
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_2();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: base token isn't a string"));
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v5 = (id)v15;
    }
  }
  if (v8)
    v16 = v7 == 0;
  else
    v16 = 1;
  if (v16 && !v5)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v7;
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = v17;
      _os_log_fault_impl(&dword_230455000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no base token %@ or sharing identity %@ and no error%@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no base token %@ or sharing identity %@ and no error"), v7, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemByRowID:", objc_msgSend(*(id *)(a1 + 40), "dbRowID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "asDocument");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "forceiWorkSharingInfoResend");
    objc_msgSend(v21, "saveToDB");

  }
  if (v5)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(v6, "encryptedValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDB8FE0];
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BDB8FE0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22 || (objc_msgSend(v8, "isEqualToData:", v22) & 1) == 0)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v8;
        v40 = 2112;
        v41 = v22;
        v42 = 2112;
        v43 = v28;
        _os_log_fault_impl(&dword_230455000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sharing identities don't match (%@ vs %@)! Trying to fix up the identities%@", buf, 0x20u);
      }

      if (v8)
      {
        objc_msgSend(v6, "encryptedValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v8, v27);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 528), "setBaseToken:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 528), "setPublicSharingIdentity:", v8);
    objc_msgSend(v6, "displayedHostname");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 528), "setDisplayedHostname:", v31);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 544), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 544), "setBaseToken:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 544), "mutableEncryptedPublicSharingKeyData");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (void *)v32;
    else
      v34 = v8;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 544), "setMutableEncryptedPublicSharingKeyData:", v34);

    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = *(void **)(*(_QWORD *)(a1 + 48) + 528);
      *(_DWORD *)buf = 138412546;
      v39 = v37;
      v40 = 2112;
      v41 = v35;
      _os_log_debug_impl(&dword_230455000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Got iWork sharing identify for share - %@%@", buf, 0x16u);
    }

    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 48), "_performAfterFetchingiWorkRoutingTokenIfNecessary:completion:", v6, *(_QWORD *)(a1 + 56));
      goto LABEL_39;
    }
  }

  v25 = *(_QWORD *)(a1 + 48);
  v24 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "brc_cloudKitErrorForRecordID:", *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v22);
LABEL_39:

}

- (void)_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke;
  block[3] = &unk_24FE48090;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iWorkShareable");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "asDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performAfterFetchingiWorkSharingIdentityOnItem:wantRoutingKey:completion:", v7, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isDocument"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "asDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_performAfterFetchingSharingIdentityOnDocumentItem:wantRoutingKey:completion:", v7, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isDirectory"))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "asDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_performAfterFetchingSharingIdentityOnDirectoryItem:wantRoutingKey:completion:", v7, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    goto LABEL_7;
  }
  v10 = *(_QWORD *)(a1 + 40);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: not a directory nor a document"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v13);

LABEL_8:
}

- (void)performAfterPreparingSharingIdentityIfNecessary:(id)a3
{
  -[BRCSharingModifyShareOperation _performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:](self, "_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:completion:", 0, a3);
}

- (void)main
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BRCSharingModifyShareOperation;
  -[_BRCOperation main](&v2, sel_main);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingIdentityPreparedRecord, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

- (void)initWithName:zone:share:sessionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _itemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performAfterGettingPublicSharingKeyForRecord:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: contentsRecord%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performAfterGettingPublicSharingKeyForRecord:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] requesting sharing identity on %@%@");
  OUTLINED_FUNCTION_0();
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Fetching sharing identity failed - %@%@");
  OUTLINED_FUNCTION_0();
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no error and no sharing key%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no records and no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no public sharing identity. avoiding breaking iwork shares%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Yanking the routing key from the server for %@%@");
  OUTLINED_FUNCTION_0();
}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [self->_share.publicSharingIdentity isEqualToData:self->_sharingIdentityPreparedRecord.encryptedPublicSharingKey]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no routing key on share identity prepared record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performAfterFetchingiWorkSharingIdentityOnItem:wantRoutingKey:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Requesting iwork sharing identity on %@%@");
  OUTLINED_FUNCTION_0();
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Fetching iWork sharing identity failed - %@%@");
  OUTLINED_FUNCTION_0();
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: base token isn't a string%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: sharing identity isn't encrypted data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: not a directory nor a document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
