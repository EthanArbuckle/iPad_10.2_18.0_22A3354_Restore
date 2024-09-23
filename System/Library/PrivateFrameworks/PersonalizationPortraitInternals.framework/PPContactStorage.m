@implementation PPContactStorage

void __51__PPContactStorage_cachedSignificantContactHandles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PPContactStorage_cachedSignificantContactHandles__block_invoke_3;
  v5[3] = &unk_1E7E1F120;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, &__block_literal_global_102, v5, 0);

}

- (id)cachedSignificantContactHandles
{
  void *v3;
  PPSQLDatabase *db;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  __CFString *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__PPContactStorage_cachedSignificantContactHandles__block_invoke;
  v11 = &unk_1E7E1BB58;
  v12 = CFSTR("SELECT handle FROM significant_contacts");
  v13 = v3;
  v5 = v3;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  PPSQLDatabase *db;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = v6;
  v9 = v8;
  if (self)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4224;
    v21 = __Block_byref_object_dispose__4225;
    v22 = 0;
    db = self->_db;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke;
    v15[3] = &unk_1E7E1EF00;
    v16 = v8;
    p_buf = &buf;
    -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v15);
    v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v7, "setStartingToken:", v11);
  objc_msgSend(v7, "setIncludeGroupChanges:", 0);
  objc_msgSend(v7, "setShouldUnifyResults:", 1);
  pp_contacts_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "getting change history from contacts: %@", (uint8_t *)&buf, 0xCu);
  }

  -[CNContactStore enumeratorForChangeHistoryFetchRequest:error:](self->_contactsStore, "enumeratorForChangeHistoryFetchRequest:error:", v7, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PPSQLDatabase *db;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "currentHistoryToken");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v7;
  if (self)
  {
    db = self->_db;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke;
    v11[3] = &unk_1E7E1DCA8;
    v12 = v7;
    v13 = v10;
    -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 3, v11);

  }
}

void __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke_2;
  v4[3] = &unk_1E7E189A0;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO cn_history_tokens (client_identifier, token) VALUES (:clientIdentifier, :token)"), v4, 0, 0);

}

void __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":clientIdentifier", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":token", *(_QWORD *)(a1 + 40));

}

void __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_2;
  v6[3] = &unk_1E7E1F040;
  v7 = *(id *)(a1 + 32);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_3;
  v5[3] = &unk_1E7E1BB80;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT token FROM cn_history_tokens WHERE client_identifier = :clientIdentifier"), v6, v5, 0);

}

uint64_t __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":clientIdentifier", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumnName:table:", "token", "cn_history_tokens");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

- (BOOL)iterAllNameRecordsFromAllSourcesWithError:(id *)a3 block:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  dispatch_block_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  PPContactDiskCacheManager *contactCacheManager;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  _QWORD block[5];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD aBlock[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  unsigned __int8 *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t v68[128];
  __int128 buf;
  void (*v70)(uint64_t, void *);
  void *v71;
  PPContactStorage *v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v54 = 0;
  v55 = (unsigned __int8 *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__5271;
  v52 = __Block_byref_object_dispose__5272;
  v53 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke;
  aBlock[3] = &unk_1E7E171B8;
  aBlock[4] = &v54;
  aBlock[5] = &v48;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5271;
  v45 = __Block_byref_object_dispose__5272;
  v46 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_2;
  block[3] = &unk_1E7E171E0;
  v40 = &v41;
  block[4] = self;
  v8 = _Block_copy(aBlock);
  v39 = v8;
  v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  if (iterAllNameRecordsFromAllSourcesWithError_block___pasOnceToken3 != -1)
    dispatch_once(&iterAllNameRecordsFromAllSourcesWithError_block___pasOnceToken3, &__block_literal_global_5273);
  dispatch_async((dispatch_queue_t)iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult, v9);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_4;
  v31[3] = &unk_1E7E17228;
  v33 = &v34;
  v10 = v6;
  v32 = v10;
  v11 = v31;
  v12 = v11;
  if (self)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__5271;
    v66 = __Block_byref_object_dispose__5272;
    v67 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    contactCacheManager = self->_contactCacheManager;
    *(_QWORD *)&buf = v7;
    *((_QWORD *)&buf + 1) = 3221225472;
    v70 = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke;
    v71 = &unk_1E7E172A0;
    v72 = self;
    v74 = &v62;
    v75 = &v58;
    v73 = v11;
    -[PPContactDiskCacheManager accessCacheWithBlock:](contactCacheManager, "accessCacheWithBlock:", &buf);
    LOBYTE(self) = *((_BYTE *)v59 + 24) != 0;
    if (*((_BYTE *)v59 + 24))
      v14 = 0;
    else
      v14 = objc_retainAutorelease((id)v63[5]);

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);

  }
  else
  {
    v14 = 0;
  }

  v15 = v14;
  pp_contacts_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *((_DWORD *)v35 + 6);
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v17;
    _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "CN name record count: %u", (uint8_t *)&buf, 8u);
  }

  if ((self & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v49[5];
    v49[5] = v18;

    atomic_store(1u, v55 + 24);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForBlock:", v9);
    pp_contacts_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend((id)v42[5], "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "FiA name record count: %tu", (uint8_t *)&buf, 0xCu);
    }

    LOBYTE(buf) = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = (id)v42[5];
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v68, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v28;
LABEL_15:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v22);
        (*((void (**)(id, _QWORD, __int128 *))v10 + 2))(v10, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v25), &buf);
        if ((_BYTE)buf)
          break;
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v68, 16);
          if (v23)
            goto LABEL_15;
          break;
        }
      }
    }

  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v15);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return (char)self;
}

- (id)contactNameRecordsWithHistoryResult:(id)a3 truncated:(BOOL *)a4 error:(id *)a5
{
  id v7;
  PPContactNameRecordChangeHistoryAccumulator *v8;
  CNContactStore *contactsStore;
  void *v10;
  CNContactStore *v11;
  id v12;
  PPContactStorage *v13;
  uint64_t v14;
  NSMutableArray *records;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = [PPContactNameRecordChangeHistoryAccumulator alloc];
  contactsStore = self->_contactsStore;
  -[PPContactStorage _nameRecordKeysToFetch](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = contactsStore;
  v12 = v10;
  if (v8)
  {
    v30.receiver = v8;
    v30.super_class = (Class)PPContactNameRecordChangeHistoryAccumulator;
    v13 = -[PPContactStorage init](&v30, sel_init);
    v8 = (PPContactNameRecordChangeHistoryAccumulator *)v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_contactsStore, contactsStore);
      objc_storeStrong((id *)&v8->_keysToFetch, v10);
      v14 = objc_opt_new();
      records = v8->_records;
      v8->_records = (NSMutableArray *)v14;

      v8->_truncated = 0;
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "value", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v21, "acceptEventVisitor:", v8);
        if (v8 && v8->_truncated)
        {
          objc_autoreleasePoolPop(v22);

          goto LABEL_16;
        }
        objc_autoreleasePoolPop(v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v18)
        continue;
      break;
    }
  }

  if (v8)
  {
LABEL_16:
    if (v8->_truncated)
    {
      if (a4)
        *a4 = 1;
      v24 = (NSMutableArray *)objc_opt_new();
    }
    else
    {
      v24 = v8->_records;
    }
    v23 = v24;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_nameRecordKeysToFetch
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[13];

  v8[12] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *MEMORY[0x1E0C967D8];
    v8[0] = *MEMORY[0x1E0C966D0];
    v8[1] = v1;
    v2 = *MEMORY[0x1E0C967E0];
    v8[2] = *MEMORY[0x1E0C96780];
    v8[3] = v2;
    v3 = *MEMORY[0x1E0C967D0];
    v8[4] = *MEMORY[0x1E0C966C0];
    v8[5] = v3;
    v4 = *MEMORY[0x1E0C96758];
    v8[6] = *MEMORY[0x1E0C967B8];
    v8[7] = v4;
    v5 = *MEMORY[0x1E0C96840];
    v8[8] = *MEMORY[0x1E0C967A0];
    v8[9] = v5;
    v6 = *MEMORY[0x1E0C967A8];
    v8[10] = *MEMORY[0x1E0C967F0];
    v8[11] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 12);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

BOOL __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  double v3;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if ((v1 & 1) == 0)
    return 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceNow");
  return v3 > -20.0;
}

void __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    v4 = (void *)objc_opt_new();
    (*(void (**)(void))(*(_QWORD *)(v2 + 56) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__PPContactStorage_NameRecords___namesRecordsForAllFoundInAppsContactsWithKeepGoingBlock___block_invoke;
    v11[3] = &unk_1E7E172F0;
    v13 = v3;
    v6 = v4;
    v12 = v6;
    objc_msgSend(v5, "enumerateAllContactsWithSnippets:limitTo:usingBlock:", 0, 10000, v11);

    v7 = v12;
    v8 = v6;

  }
  else
  {
    v8 = 0;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_4(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  NSObject *v61;
  id v62;
  __int128 v63;
  id obj;
  _QWORD v65[4];
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;
  uint64_t v71;
  id v72;
  _BYTE buf[24];
  void *v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isEmpty");
  v5 = MEMORY[0x1E0C809B0];
  v6 = qword_1C3AE4FB0 + 80;
  if ((v4 & 1) != 0)
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "contact disk cache was empty", buf, 2u);
    }
LABEL_42:

    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = 0;

    v46 = *(void **)(a1 + 32);
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v47 + 40);
    objc_msgSend(v46, "contactsChangeHistoryForClient:error:", CFSTR("name_records_cache"), &obj);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v47 + 40), obj);
    if (!v48)
    {
      pp_contacts_log_handle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = CFSTR("name_records_cache");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v57;
        _os_log_error_impl(&dword_1C392E000, v49, OS_LOG_TYPE_ERROR, "failed to load change history for client: %@ error: %@", buf, 0x16u);
      }

    }
    v50 = *(_QWORD *)(a1 + 32);
    v51 = *(void **)(v50 + 32);
    v60[0] = v5;
    v60[1] = v6[100];
    v60[2] = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_93;
    v60[3] = &unk_1E7E17278;
    v63 = *(_OWORD *)(a1 + 48);
    v60[4] = v50;
    v7 = v48;
    v61 = v7;
    v62 = *(id *)(a1 + 40);
    objc_msgSend(v51, "mutateCacheWithBlock:", v60);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (v48)
        objc_msgSend(*(id *)(a1 + 32), "clearChangeHistoryForClient:historyResult:", CFSTR("name_records_cache"), v7);
    }
    else
    {
      pp_contacts_log_handle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v58;
        _os_log_error_impl(&dword_1C392E000, v52, OS_LOG_TYPE_ERROR, "failed to load CN name records from contacts framework: %@", buf, 0xCu);
      }

    }
    goto LABEL_53;
  }
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v7)
  {
    v70 = 0;
    -[NSObject contactsChangeHistoryForClient:error:](v7, "contactsChangeHistoryForClient:error:", CFSTR("name_records_cache"), &v70);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v70;
    v14 = v13;
    if (!v12)
    {
      pp_contacts_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = CFSTR("name_records_cache");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: failed to load change history for client: %@ error: %@", buf, 0x16u);
      }

      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D70D10];
      if (v14)
      {
        v72 = (id)*MEMORY[0x1E0CB3388];
        *(_QWORD *)buf = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v72, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 17, v20);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)

      v7 = 0;
      goto LABEL_22;
    }

    v69 = 0;
    v72 = 0;
    -[NSObject contactNameRecordsWithHistoryResult:truncated:error:](v7, "contactNameRecordsWithHistoryResult:truncated:error:", v12, &v69, &v72);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v72;
    if (v69)
    {
      pp_contacts_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPContactStorage+NameRecords: Contacts change history truncated", buf, 2u);
      }

      -[NSObject clearChangeHistoryForClient:historyResult:](v7, "clearChangeHistoryForClient:historyResult:", CFSTR("name_records_cache"), v12);
    }
    else
    {
      if (v15)
      {
        -[NSObject clearChangeHistoryForClient:historyResult:](v7, "clearChangeHistoryForClient:historyResult:", CFSTR("name_records_cache"), v12);
        v7 = v15;
        goto LABEL_17;
      }
      pp_contacts_log_handle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_error_impl(&dword_1C392E000, v53, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: contactNameRecordChangeResultWithChanges failed with error: %@", buf, 0xCu);
      }

      v54 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0D70D10];
      if (v14)
      {
        v71 = *MEMORY[0x1E0CB3388];
        *(_QWORD *)buf = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v71, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = 0;
      }
      objc_msgSend(v54, "errorWithDomain:code:userInfo:", v55, 18, v56);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)

    }
    v7 = 0;
LABEL_17:

LABEL_22:
    v21 = &qword_1C3AE4FB0[10];

    goto LABEL_23;
  }
  v21 = qword_1C3AE4FB0 + 80;
LABEL_23:
  objc_storeStrong(v9, v10);
  if (v7)
  {
    v22 = 1;
  }
  else
  {
    pp_contacts_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v59 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl(&dword_1C392E000, v23, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: _disksCacheHistoryRecordsWithError failed: %@", buf, 0xCu);
    }

    v22 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v22;
  if (-[NSObject count](v7, "count"))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = 0;

    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v65[0] = v5;
    v65[1] = v21[100];
    v65[2] = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_91;
    v65[3] = &unk_1E7E17250;
    v67 = *(_QWORD *)(a1 + 56);
    v27 = v7;
    v28 = *(_QWORD *)(a1 + 48);
    v66 = v27;
    v68 = v28;
    objc_msgSend(v26, "mutateCacheWithBlock:", v65);

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = 0;

    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v31 + 40);
    v32 = (id *)(v31 + 40);
    v33 = v34;
    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(id *)(a1 + 40);
    v37 = v36;
    if (v35)
    {
      v70 = 0;
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = v21[100];
      *(_QWORD *)&buf[16] = __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke;
      v74 = &unk_1E7E17340;
      v75 = v36;
      LOBYTE(v35) = objc_msgSend(v3, "iterNameRecordCacheWithError:block:", &v70, buf);
      v38 = v70;
      v39 = v38;
      if ((v35 & 1) == 0)
        v33 = objc_retainAutorelease(v38);

    }
    objc_storeStrong(v32, v33);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v35;
    v40 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    pp_contacts_log_handle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    v6 = &qword_1C3AE4FB0[10];
    if (!v40)
    {
      if (v42)
      {
        v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "failed to load CN name records from disk cache: %@", buf, 0xCu);
      }

      goto LABEL_42;
    }
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "loaded CN name records from disk cache", buf, 2u);
    }

  }
LABEL_53:

}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_91(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  id obj;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(a2, "updateNameRecordCacheWithHistoryRecords:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    pp_contacts_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: updateNameRecordCacheWithHistoryRecords failed: %@", buf, 0xCu);
    }

  }
}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_93(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  _BYTE *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE *v32;
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t *v36;
  char v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint8_t buf[16];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;
  v5 = a2;

  v6 = (void *)a1[6];
  v7 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v25 = v5;
  obj = v9;
  v10 = (_BYTE *)a1[4];
  if (a1[5])
    v11 = v5;
  else
    v11 = 0;
  v12 = v11;
  v27 = v6;
  if (v10)
  {
    -[PPContactStorage _nameRecordKeysToFetch](v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v28, v25, obj);
    objc_msgSend(v13, "setPredicate:", 0);
    objc_msgSend(v13, "setUnifyResults:", 1);
    PPNewCNContactStore();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    v15 = (void *)objc_opt_new();
    objc_msgSend(v12, "deleteNameRecordCache");
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__5271;
    v43 = __Block_byref_object_dispose__5272;
    v44 = 0;
    v38 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __125__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsFromSouceAndReplaceDiskCacheWithError_diskCache_block___block_invoke;
    v29[3] = &unk_1E7E172C8;
    v34 = &v47;
    v35 = v45;
    v33 = v27;
    v16 = v12;
    v30 = v16;
    v17 = v15;
    v37 = 100;
    v31 = v17;
    v32 = v10;
    v36 = &v39;
    v18 = objc_msgSend(v14, "enumerateContactsWithFetchRequest:error:usingBlock:", v13, &v38, v29);
    v19 = v38;
    v20 = (void *)v40[5];
    if (v20)
      objc_msgSend(v20, "raise");
    if ((v18 & 1) != 0)
    {
      if (v16)
        -[PPContactStorage _addToCache:records:]((uint64_t)v10, v16, v17);
      v21 = *((unsigned __int8 *)v48 + 24);
      if (v21 != v10[80])
      {
        v10[80] = v21;
        objc_msgSend(v10, "setChineseBirthdayFoundKVData");
      }
    }
    else
    {
      pp_contacts_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, "Error: failed to enumerate all CN contacts: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (v19)
      {
        v51 = *MEMORY[0x1E0CB3388];
        *(_QWORD *)buf = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v51, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 19, v24);
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (v19)

    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v47, 8);

  }
  else
  {
    v18 = 0;
  }

  objc_storeStrong(v8, obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v18;
}

void __125__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsFromSouceAndReplaceDiskCacheWithError_diskCache_block___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  PPInternalContactNameRecord *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PPInternalContactNameRecord *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  if (!v6)
    goto LABEL_28;
  objc_msgSend(v6, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "givenName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {

      goto LABEL_32;
    }
  }
  objc_msgSend(v7, "middleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v7, "middleName"), v4 = (void *)objc_claimAutoreleasedReturnValue(), !objc_msgSend(v4, "length")))
  {
    objc_msgSend(v7, "familyName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "familyName");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "length"))
      {
        v12 = v2;
        v10 = 0;
LABEL_23:

LABEL_24:
        if (!v9)
          goto LABEL_26;
        goto LABEL_25;
      }
    }
    objc_msgSend(v7, "phoneticGivenName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "phoneticGivenName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v14 = (void *)v13;
        v15 = v4;
        v16 = v5;
        v12 = v2;
        v10 = 0;
LABEL_21:

LABEL_22:
        v4 = v15;
        if (!v11)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    objc_msgSend(v7, "phoneticMiddleName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v13;
    if (v17
      && (objc_msgSend(v7, "phoneticMiddleName"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v42, "length")))
    {
      v15 = v4;
      v16 = v5;
      v12 = v2;
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "phoneticFamilyName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend(v7, "phoneticFamilyName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v4;
        v16 = v5;
        v12 = v2;
        v10 = objc_msgSend(v36, "length") == 0;

        if (!v17)
          goto LABEL_20;
      }
      else
      {
        v15 = v4;
        v16 = v5;
        v12 = v2;
        v10 = 1;
        if (!v17)
        {
LABEL_20:
          v14 = v40;
          if (!v40)
            goto LABEL_22;
          goto LABEL_21;
        }
      }
    }

    goto LABEL_20;
  }
  v10 = 0;
LABEL_25:

LABEL_26:
  if (!v8)
  {

    if (v10)
      goto LABEL_28;
LABEL_32:
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(v7, "nonGregorianBirthday");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "calendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "calendarIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C996A0]);

      if (v22)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    v23 = [PPInternalContactNameRecord alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "UUIDString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "givenName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneticGivenName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "middleName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneticMiddleName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "familyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneticFamilyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "organizationName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jobTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nickname");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PPRelatedNamesForContact(v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PPStreetNamesForContact(v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PPCityNamesForContact(v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v23, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v41, 1, v39, 1, v37, v35, 0.0, v34, v33, v24, v25, v26, v27, v28, v29, v30,
            v31);

    if (v32)
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      if (*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v32);
        if (objc_msgSend(*(id *)(a1 + 40), "count") >= (unint64_t)*(unsigned __int8 *)(a1 + 88))
        {
          -[PPContactStorage _addToCache:records:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
        }
      }
    }

    goto LABEL_42;
  }

  if (!v10)
    goto LABEL_32;
LABEL_28:
  pp_contacts_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v7;
    _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "skipping empty named CN contact: %@", buf, 0xCu);
  }

LABEL_42:
}

- (void)_addToCache:(void *)a3 records:
{
  id v5;
  id v6;
  NSObject *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = a2;
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_INFO, "PPContactStorage: _addToCache: flushing cache batch of size: %tu", buf, 0xCu);
    }

    v12 = 0;
    v8 = objc_msgSend(v6, "addNameRecords:error:", v5, &v12);

    v9 = v12;
    if ((v8 & 1) == 0)
    {
      pp_contacts_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134218242;
        v14 = v11;
        v15 = 2112;
        v16 = v9;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPContactStorage: _writeToCacheWithRecords: failed to add %tu name records to cache: %@", buf, 0x16u);
      }

    }
  }

}

void __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke_2;
  v5[3] = &unk_1E7E17318;
  v6 = *(id *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

uint64_t __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  _BYTE *v7;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a4)
  {
    v7 = *(_BYTE **)(a1 + 40);
    if (v7)
      *v7 = *a4;
  }
  return result;
}

void __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "iterAllNameRecordsFromAllSourcesWithError-FiA");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult;
  iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __90__PPContactStorage_NameRecords___namesRecordsForAllFoundInAppsContactsWithKeepGoingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  PPInternalContactNameRecord *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PPInternalContactNameRecord *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_25;
  v5 = (void *)v4;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "middleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

      goto LABEL_5;
    }
    objc_msgSend(v3, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      goto LABEL_6;
LABEL_25:
    v40 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_26;
  }
LABEL_5:

LABEL_6:
  v44 = a1;
  v47 = (void *)objc_opt_new();
  v45 = v3;
  v46 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v3, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v50)
    goto LABEL_21;
  v49 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v50; ++i)
    {
      if (*(_QWORD *)v53 != v49)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v10, "components");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "city");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v10, "components");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "city");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", &stru_1E7E221D0);

        if ((v19 & 1) != 0)
          goto LABEL_15;
        objc_msgSend(v10, "components");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "city");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v20);

      }
LABEL_15:
      objc_msgSend(v10, "components");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "street");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(v10, "components");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "street");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", &stru_1E7E221D0);

        if ((v26 & 1) != 0)
          goto LABEL_19;
        objc_msgSend(v10, "components");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "street");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v27);

      }
LABEL_19:
      objc_autoreleasePoolPop(v11);
    }
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  }
  while (v50);
LABEL_21:

  v28 = [PPInternalContactNameRecord alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v45, "recordId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%lld"), objc_msgSend(v31, "internalEntityId"));
  objc_msgSend(v45, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "middleName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v28, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v29, 2, v32, 1, v34, 0, 0.0, v36, 0, v38, 0, 0, 0, 0, MEMORY[0x1E0C9AA70], v47,
          v46);

  if (v39)
    objc_msgSend(*(id *)(v44 + 32), "addObject:", v39);
  v40 = (*(uint64_t (**)(void))(*(_QWORD *)(v44 + 40) + 16))();

  v3 = v45;
LABEL_26:

  return v40;
}

- (id)meCard
{
  PPMeCardCacheManager *meCardCacheManager;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8250;
  v10 = __Block_byref_object_dispose__8251;
  v11 = 0;
  meCardCacheManager = self->_meCardCacheManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PPContactStorage_Contacts__meCard__block_invoke;
  v5[3] = &unk_1E7E186E0;
  v5[4] = &v6;
  -[PPMeCardCacheManager accessCacheWithBlock:](meCardCacheManager, "accessCacheWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)asyncFillResultsFromContactsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *concurrentContactQueryThrottleSem;
  NSObject *v14;
  NSObject *concurrentContactQueryQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  concurrentContactQueryThrottleSem = self->_concurrentContactQueryThrottleSem;
  v14 = a5;
  dispatch_semaphore_wait(concurrentContactQueryThrottleSem, 0xFFFFFFFFFFFFFFFFLL);
  concurrentContactQueryQueue = self->_concurrentContactQueryQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke;
  v19[3] = &unk_1E7E1FFF8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_group_async(v14, concurrentContactQueryQueue, v19);

}

- (id)contactsContactsWithQuery:(id)a3 explanationSet:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(void *, void *);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD aBlock[4];
  id v62;
  __int128 *p_buf;
  uint8_t v64[128];
  __int128 buf;
  uint64_t v66;
  char v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = a4;
  pp_contacts_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPLocalContactStore contactsContactsWithQuery: %@", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)objc_opt_new();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x2020000000;
  v67 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPContactStorage_Contacts__contactsContactsWithQuery_explanationSet_error___block_invoke;
  aBlock[3] = &unk_1E7E1E278;
  p_buf = &buf;
  v55 = v9;
  v62 = v55;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v7, "isEqual:", v11);

  if (v12)
  {
    -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:]((uint64_t)self, 0, v56);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v13);
  }
  else
  {
    objc_msgSend(v7, "matchingIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") == 0;

    if (!v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "matchingIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v7, "matchingIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v58 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(MEMORY[0x1E0D70B00], "sourceFromSourceIdentifier:", v23, v55, v56) != 2)
            {
              objc_msgSend(MEMORY[0x1E0D70B00], "contactsContactIdentifierWithIdentifier:error:", v23, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                objc_msgSend(v18, "addObject:", v24);

            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
        }
        while (v20);
      }

      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:]((uint64_t)self, v25, v56);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v26);

    }
    objc_msgSend(v7, "matchingName", v55);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length") == 0;

    if (!v28)
    {
      if (self)
      {
        v29 = v56;
        v30 = v7;
        objc_msgSend(v30, "matchingName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPContactStorage nameFilterWithQuery:](self, "nameFilterWithQuery:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v31, v29, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = 0;
      }
      v10[2](v10, v33);

    }
    objc_msgSend(v7, "matchingEmail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length") == 0;

    if (!v35)
    {
      if (self)
      {
        v36 = v56;
        v37 = v7;
        objc_msgSend(v37, "matchingEmail");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPContactStorage emailFilterWithQuery:](self, "emailFilterWithQuery:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v38, v36, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v40 = 0;
      }
      v10[2](v10, v40);

    }
    objc_msgSend(v7, "matchingPhone");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length") == 0;

    if (!v42)
    {
      if (self)
      {
        v43 = v56;
        v44 = v7;
        objc_msgSend(v44, "matchingPhone");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPContactStorage phoneFilterWithQuery:](self, "phoneFilterWithQuery:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v45, v43, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v47 = 0;
      }
      v10[2](v10, v47);

    }
    objc_msgSend(v7, "matchingPostalAddress");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "length") == 0;

    if (!v49)
    {
      if (self)
      {
        v50 = v56;
        v51 = v7;
        objc_msgSend(v51, "matchingPostalAddress");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPContactStorage postalAddressFilterWithQuery:](self, "postalAddressFilterWithQuery:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v52, v50, v53);
        self = (PPContactStorage *)objc_claimAutoreleasedReturnValue();

      }
      v10[2](v10, self);

    }
    objc_msgSend(v55, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&buf, 8);
  return v13;
}

void __77__PPContactStorage_Contacts__contactsContactsWithQuery_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v3;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
      objc_msgSend(v5, "intersectSet:", v6);

      v4 = v7;
    }
    else
    {
      objc_msgSend(v5, "addObjectsFromArray:", v3);
      v4 = v7;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (id)_contactsContactsWithPredicate:(uint64_t)a1 explanationSet:(void *)a2 error:(void *)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  id v26;
  uint8_t v27[4];
  uint64_t v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPLocalContactStore contactsContactsWithPredicate: %@", (uint8_t *)&buf, 0xCu);
    }

    v8 = (void *)objc_opt_new();
    v9 = objc_alloc(MEMORY[0x1E0C97210]);
    PPKeysToFetchPeople();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithKeysToFetch:", v10);

    objc_msgSend(v11, "setPredicate:", v5);
    objc_msgSend(v11, "setUnifyResults:", 1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__8250;
    v32 = __Block_byref_object_dispose__8251;
    v33 = 0;
    v12 = *(void **)(a1 + 8);
    v26 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__PPContactStorage_Contacts___contactsContactsWithPredicate_explanationSet_error___block_invoke;
    v23[3] = &unk_1E7E18708;
    v13 = v8;
    v24 = v13;
    p_buf = &buf;
    v14 = objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v26, v23);
    v15 = v26;
    v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v16)
      objc_msgSend(v16, "raise");
    if ((v14 & 1) != 0)
    {
      pp_private_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v27 = 138412290;
        v28 = (uint64_t)v13;
        _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "Matches from enumerateContactsWithFetchRequest: %@", v27, 0xCu);
      }

      pp_contacts_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_msgSend(v13, "count");
        *(_DWORD *)v27 = 134217984;
        v28 = v22;
        _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "Contacts returned %tu matches", v27, 0xCu);
      }

      v19 = v13;
    }
    else
    {
      pp_contacts_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v27 = 138412290;
        v28 = (uint64_t)v15;
        _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "failed CNContacts name lookup: %@", v27, 0xCu);
      }

      objc_msgSend(v6, "push:", 12);
      +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("CN_CS"), objc_msgSend(v15, "code"));
      v19 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_contactsFullTextSearchWithQuery:(uint64_t)a1 explanationSet:(uint64_t)a2 error:(void *)a3 filter:(void *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C97200];
  v9 = a3;
  objc_msgSend(v8, "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", a2, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:](a1, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3880];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__PPContactStorage_Contacts___contactsFullTextSearchWithQuery_explanationSet_error_filter___block_invoke;
  v17[3] = &unk_1E7E19360;
  v13 = v7;
  v18 = v13;
  objc_msgSend(v12, "predicateWithBlock:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __91__PPContactStorage_Contacts___contactsFullTextSearchWithQuery_explanationSet_error_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__PPContactStorage_Contacts___contactsContactsWithPredicate_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B00]), "initWithContactsContact:", v5);
  objc_msgSend(v3, "addObject:", v4);

}

void __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_contacts_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactStorage.asyncFillResultsFromContactsWithQuery", ", buf, 2u);
  }

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v19 = 0;
  objc_msgSend(v6, "contactsContactsWithQuery:explanationSet:error:", v7, v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = (void *)a1[7];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke_1;
  v16[3] = &unk_1E7E19308;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "runWithLockAcquired:", v16);
  pp_contacts_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v15, OS_SIGNPOST_INTERVAL_END, v3, "PPContactStorage.asyncFillResultsFromContactsWithQuery", ", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 16));
}

void __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "joined"))
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = 134217984;
      v9 = v5;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: _contactsContactsWithQuery ignoring %tu contacts returned after timeout and join", (uint8_t *)&v8, 0xCu);
    }

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setCnContacts:");
  }
  else
  {
    pp_contacts_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPLocalContactStore: _contactsContactsWithQuery error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "setLatestError:", *(_QWORD *)(a1 + 40));
  }

}

void __36__PPContactStorage_Contacts__meCard__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "loadMeCardCache");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    PPContactMeCardFromSource();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      objc_msgSend(v9, "writeMeCardCache:");
  }

}

- (void)asyncFillResultsFromFoundInAppsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *concurrentContactQueryThrottleSem;
  NSObject *v14;
  NSObject *concurrentContactQueryQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  concurrentContactQueryThrottleSem = self->_concurrentContactQueryThrottleSem;
  v14 = a5;
  dispatch_semaphore_wait(concurrentContactQueryThrottleSem, 0xFFFFFFFFFFFFFFFFLL);
  concurrentContactQueryQueue = self->_concurrentContactQueryQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke;
  v19[3] = &unk_1E7E1FFF8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_group_async(v14, concurrentContactQueryQueue, v19);

}

void __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  dispatch_semaphore_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  _BOOL4 v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  os_signpost_id_t spid;
  id v67;
  id v69;
  id v70;
  _QWORD *v71;
  void (**v72)(void *, id);
  id v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD aBlock[4];
  id v85;
  _QWORD *v86;
  _QWORD v87[3];
  char v88;
  id v89;
  id *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  id v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint8_t buf[4];
  id v102;
  _BYTE v103[12];
  __int128 v104;
  void *v105;
  void *v106;
  id *p_isa;
  id *v108;
  id *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  pp_contacts_signpost_handle();
  v1 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v1);

  pp_contacts_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v3, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPContactStorage.asyncFillResultsFromFoundInAppsWithQuery", ", buf, 2u);
  }

  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v69 = *(id *)(a1 + 40);
  v73 = v5;
  v71 = v4;
  if (v4)
  {
    pp_contacts_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v102 = v69;
      _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsWithQuery: %@", buf, 0xCu);
    }

    v7 = (void *)objc_opt_new();
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v88 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__PPContactStorage_FoundInApps___foundInAppsContactsWithQuery_explanationSet_error___block_invoke;
    aBlock[3] = &unk_1E7E1E278;
    v86 = v87;
    v67 = v7;
    v85 = v67;
    v72 = (void (**)(void *, id))_Block_copy(aBlock);
    objc_msgSend(v69, "matchingIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (v9)
    {
      v70 = 0;
      v12 = 0;
    }
    else
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v69, "matchingIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, buf, 16);
      if (v11)
      {
        v70 = 0;
        v12 = 0;
        v75 = *(_QWORD *)v81;
        obj = v10;
        do
        {
          v76 = v11;
          for (i = 0; i != v76; ++i)
          {
            if (*(_QWORD *)v81 != v75)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            if (objc_msgSend(MEMORY[0x1E0D70B00], "sourceFromSourceIdentifier:", v14) != 1)
            {
              v15 = v14;
              v16 = v73;
              v17 = (void *)objc_opt_new();
              pp_contacts_log_handle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(v104) = 138412290;
                *(_QWORD *)((char *)&v104 + 4) = v15;
                _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsQueryWithIdentifier: %@", (uint8_t *)&v104, 0xCu);
              }

              v19 = objc_msgSend(MEMORY[0x1E0D70B00], "foundInAppsRecordIdentifierNumberWithIdentifier:error:", v15, 0);
              if (v19 < 0)
              {
                v27 = v17;
                v26 = v12;
              }
              else
              {
                v95 = 0;
                v96 = &v95;
                v97 = 0x2050000000;
                v20 = (id)getSGRecordIdClass_softClass;
                v98 = (uint64_t (*)(uint64_t, uint64_t))getSGRecordIdClass_softClass;
                if (!getSGRecordIdClass_softClass)
                {
                  *(_QWORD *)&v104 = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&v104 + 1) = 3221225472;
                  v105 = __getSGRecordIdClass_block_invoke;
                  v106 = &unk_1E7E1F798;
                  p_isa = &v95;
                  __getSGRecordIdClass_block_invoke((uint64_t)&v104);
                  v20 = v96[3];
                }
                v21 = objc_retainAutorelease(v20);
                _Block_object_dispose(&v95, 8);
                objc_msgSend(v21, "recordIdWithNumericValue:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = 0;
                v96 = &v95;
                v97 = 0x3032000000;
                v98 = __Block_byref_object_copy__10439;
                v99 = __Block_byref_object_dispose__10440;
                v100 = 0;
                v89 = 0;
                v90 = &v89;
                v91 = 0x3032000000;
                v92 = __Block_byref_object_copy__10439;
                v93 = __Block_byref_object_dispose__10440;
                v94 = 0;
                v23 = dispatch_semaphore_create(0);
                v24 = (void *)v71[6];
                *(_QWORD *)&v104 = MEMORY[0x1E0C809B0];
                *((_QWORD *)&v104 + 1) = 3221225472;
                v105 = __94__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithIdentifier_explanationSet_error___block_invoke;
                v106 = &unk_1E7E19388;
                v108 = &v89;
                v109 = &v95;
                v25 = v23;
                p_isa = (id *)&v25->isa;
                objc_msgSend(v24, "contactFromRecordID:withCompletion:", v22, &v104);
                objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v25);
                if (v90[5])
                {
                  objc_msgSend(v16, "push:", 11);
                  +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("SG"), objc_msgSend(v90[5], "code"));
                  v26 = objc_retainAutorelease(v90[5]);
                  v27 = 0;
                }
                else
                {
                  pp_private_log_handle();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    v33 = v96[5];
                    *(_DWORD *)v103 = 138412290;
                    *(_QWORD *)&v103[4] = v33;
                    _os_log_debug_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEBUG, "Matches from contactFromRecordID: %@", v103, 0xCu);
                  }

                  pp_contacts_log_handle();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    v34 = v96[5] != 0;
                    *(_DWORD *)v103 = 67109120;
                    *(_DWORD *)&v103[4] = v34;
                    _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "Suggestions contactFromRecordID returned %d match", v103, 8u);
                  }

                  if (v96[5])
                  {
                    v30 = objc_alloc(MEMORY[0x1E0D70B00]);
                    v31 = (void *)objc_msgSend(v30, "initWithFoundInAppsContact:", v96[5]);
                    objc_msgSend(v17, "addObject:", v31);

                  }
                  v27 = v17;
                  v26 = v12;
                }

                _Block_object_dispose(&v89, 8);
                _Block_object_dispose(&v95, 8);

              }
              v32 = v26;

              v72[2](v72, v27);
              if (v32)
                v70 = objc_retainAutorelease(v32);

              v12 = v32;
            }
          }
          v10 = obj;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, buf, 16);
        }
        while (v11);
      }
      else
      {
        v70 = 0;
        v12 = 0;
      }

    }
    objc_msgSend(v69, "matchingName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length") == 0;

    if (v36)
    {
      v40 = v12;
    }
    else
    {
      objc_msgSend(v69, "matchingName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v104 = v12;
      objc_msgSend(v71, "nameFilterWithQuery:", v69);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v37, v73, &v104, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (id)v104;

      v72[2](v72, v39);
      if (v40)
        v70 = objc_retainAutorelease(v40);

    }
    objc_msgSend(v69, "matchingEmail");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length") == 0;

    if (v42)
    {
      v46 = v40;
    }
    else
    {
      objc_msgSend(v69, "matchingEmail");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v40;
      objc_msgSend(v71, "emailFilterWithQuery:", v69);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v43, v73, &v95, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v95;

      v72[2](v72, v45);
      if (v46)
        v70 = objc_retainAutorelease(v46);

    }
    objc_msgSend(v69, "matchingPhone");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "length") == 0;

    if (v48)
    {
      v52 = v46;
    }
    else
    {
      objc_msgSend(v69, "matchingPhone");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v46;
      objc_msgSend(v71, "phoneFilterWithQuery:", v69);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v49, v73, &v89, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v89;

      v72[2](v72, v51);
      if (v52)
        v70 = objc_retainAutorelease(v52);

    }
    objc_msgSend(v69, "matchingPostalAddress");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "length") == 0;

    if (v54)
    {
      v58 = v52;
    }
    else
    {
      objc_msgSend(v69, "matchingPostalAddress");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v103 = v52;
      objc_msgSend(v71, "postalAddressFilterWithQuery:", v69);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v55, v73, v103, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *(id *)v103;

      v72[2](v72, v57);
      if (v58)
        v70 = objc_retainAutorelease(v58);

    }
    objc_msgSend(v67, "allObjects");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v87, 8);
  }
  else
  {
    v70 = 0;
    v59 = 0;
  }

  v60 = v70;
  v61 = *(void **)(a1 + 56);
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke_1;
  v77[3] = &unk_1E7E19308;
  v78 = v59;
  v79 = v60;
  v62 = v60;
  v63 = v59;
  objc_msgSend(v61, "runWithLockAcquired:", v77);
  pp_contacts_signpost_handle();
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v65, OS_SIGNPOST_INTERVAL_END, spid, "PPContactStorage.asyncFillResultsFromFoundInAppsWithQuery", ", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "joined"))
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = 134217984;
      v9 = v5;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: _foundInAppsContactsWithQuery ignoring %tu contacts returned after timeout and join", (uint8_t *)&v8, 0xCu);
    }

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setFiaContacts:");
  }
  else
  {
    pp_contacts_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPLocalContactStore: _foundInAppsContactsWithQuery error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "setLatestError:", *(_QWORD *)(a1 + 40));
  }

}

void __84__PPContactStorage_FoundInApps___foundInAppsContactsWithQuery_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v3;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
      objc_msgSend(v5, "intersectSet:", v6);

      v4 = v7;
    }
    else
    {
      objc_msgSend(v5, "addObjectsFromArray:", v3);
      v4 = v7;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (id)_foundInAppsContactsQueryWithTerm:(void *)a3 explanationSet:(_QWORD *)a4 error:(void *)a5 filter:
{
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  __int128 *p_buf;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t v50[128];
  uint8_t v51[4];
  uint64_t v52;
  __int128 buf;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v33 = a3;
  v32 = a5;
  v10 = (void *)objc_opt_new();
  pp_contacts_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsQueryWithTerm: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__10439;
  v56 = __Block_byref_object_dispose__10440;
  v57 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__10439;
  v48 = __Block_byref_object_dispose__10440;
  v49 = 0;
  v12 = dispatch_semaphore_create(0);
  v13 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke;
  v40[3] = &unk_1E7E19330;
  v42 = &v44;
  p_buf = &buf;
  v14 = v12;
  v41 = v14;
  objc_msgSend(v13, "suggestContactMatchesWithFullTextSearch:limitTo:withCompletion:", v9, 16, v40);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v14);
  if (v45[5])
  {
    objc_msgSend(v33, "push:", 11);
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("SG"), objc_msgSend((id)v45[5], "code"));
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v45[5]);
  }
  else
  {
    pp_private_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v51 = 138412290;
      v52 = v30;
      _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "Matches from suggestContactMatchesWithFullTextSearch: %@", v51, 0xCu);
    }

    pp_contacts_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
      *(_DWORD *)v51 = 134217984;
      v52 = v31;
      _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "Suggestions returned %tu matches", v51, 0xCu);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "contact");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = objc_alloc(MEMORY[0x1E0D70B00]);
            objc_msgSend(v22, "contact");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v24, "initWithFoundInAppsContact:", v25);
            objc_msgSend(v10, "addObject:", v26);

          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v19);
    }

    v27 = (void *)MEMORY[0x1E0CB3880];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke_11;
    v34[3] = &unk_1E7E19360;
    v35 = v32;
    objc_msgSend(v27, "predicateWithBlock:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&buf, 8);
  return v15;
}

void __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Error from Suggestions suggestContactMatchesWithFullTextSearch: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithIdentifier_explanationSet_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Error from Suggestions contactFromRecordID: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (PPContactStorage)initWithDatabase:(id)a3 foundInAppsHarvestStoreGetter:(id)a4
{
  id v7;
  id v8;
  PPContactStorage *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *concurrentContactQueryThrottleSem;
  NSObject *v12;
  qos_class_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *concurrentContactQueryQueue;
  uint64_t v17;
  CNContactStore *contactsStore;
  uint64_t v19;
  SGSuggestionsServiceContactsProtocol *foundInAppsService;
  const void *v21;
  void *v22;
  id foundInAppsHarvestStoreGetter;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *path;
  id v28;
  void *v29;
  NSString *v30;
  int v31;
  id v32;
  PPContactDiskCacheManager *v33;
  PPContactDiskCacheManager *contactCacheManager;
  PPMeCardCacheManager *v35;
  NSObject *p_super;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id v44;
  objc_super v45;
  _BYTE location[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PPContactStorage;
  v9 = -[PPContactStorage init](&v45, sel_init);
  if (v9)
  {
    v10 = dispatch_semaphore_create(2);
    concurrentContactQueryThrottleSem = v9->_concurrentContactQueryThrottleSem;
    v9->_concurrentContactQueryThrottleSem = (OS_dispatch_semaphore *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v12, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("PPLocalContactStore.contactsWithQuery", v14);
    concurrentContactQueryQueue = v9->_concurrentContactQueryQueue;
    v9->_concurrentContactQueryQueue = (OS_dispatch_queue *)v15;

    PPSharedCNContactStore();
    v17 = objc_claimAutoreleasedReturnValue();
    contactsStore = v9->_contactsStore;
    v9->_contactsStore = (CNContactStore *)v17;

    PPSharedSuggestionsContactService();
    v19 = objc_claimAutoreleasedReturnValue();
    foundInAppsService = v9->_foundInAppsService;
    v9->_foundInAppsService = (SGSuggestionsServiceContactsProtocol *)v19;

    if (v8)
      v21 = v8;
    else
      v21 = &__block_literal_global_15887;
    v22 = _Block_copy(v21);
    foundInAppsHarvestStoreGetter = v9->_foundInAppsHarvestStoreGetter;
    v9->_foundInAppsHarvestStoreGetter = v22;

    v24 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "parentDirectory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("Contacts"));
    v26 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v24);
    path = v9->_path;
    v9->_path = (NSString *)v26;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v28);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9->_path;
    v44 = 0;
    v31 = objc_msgSend(v29, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v44);
    v32 = v44;

    if (v31)
    {
      v33 = -[PPContactDiskCacheManager initWithPath:]([PPContactDiskCacheManager alloc], "initWithPath:", v9->_path);
      contactCacheManager = v9->_contactCacheManager;
      v9->_contactCacheManager = v33;

      v35 = -[PPMeCardCacheManager initWithPath:]([PPMeCardCacheManager alloc], "initWithPath:", v9->_path);
      p_super = &v9->_meCardCacheManager->super;
      v9->_meCardCacheManager = v35;
    }
    else
    {
      pp_default_log_handle();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v32;
        _os_log_fault_impl(&dword_1C392E000, p_super, OS_LOG_TYPE_FAULT, "PPContactStorage: failed to create Contacts subdirectory: %@", location, 0xCu);
      }
    }

    objc_sync_exit(v28);
    objc_storeStrong((id *)&v9->_db, a3);
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, v9);
    v37 = (void *)MEMORY[0x1E0D70BF0];
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_40;
    v42 = &unk_1E7E1FCC0;
    objc_copyWeak(&v43, (id *)location);
    objc_msgSend(v37, "addMeCardObserverForLifetimeOfObject:block:", v9, &v39);
    -[PPContactStorage loadChineseBirthdayFoundKVData](v9, "loadChineseBirthdayFoundKVData", v39, v40, v41, v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)location);

  }
  return v9;
}

- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  dispatch_group_t v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  pp_contacts_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412802;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "contactsWithQuery: %@ e:%@ t:%@", (uint8_t *)&v19, 0x20u);
  }

  v13 = objc_alloc(MEMORY[0x1E0D815F0]);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(v13, "initWithGuardedData:", v14);

  v16 = dispatch_group_create();
  -[PPContactStorage asyncFillResultsFromFoundInAppsWithQuery:explanationSet:group:results:](self, "asyncFillResultsFromFoundInAppsWithQuery:explanationSet:group:results:", v9, v10, v16, v15);
  -[PPContactStorage asyncFillResultsFromContactsWithQuery:explanationSet:group:results:](self, "asyncFillResultsFromContactsWithQuery:explanationSet:group:results:", v9, v10, v16, v15);
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    -[PPContactStorage _waitForGroup:results:timeoutSeconds:explanationSet:](self, "_waitForGroup:results:timeoutSeconds:explanationSet:", v16, v15, v10);
  }
  else
  {
    -[PPContactStorage _waitForGroup:results:](self, "_waitForGroup:results:", v16, v15);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_joinResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PPContactStorage__joinResults___block_invoke;
  v7[3] = &unk_1E7E1BA90;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "runWithLockAcquired:", v7);

  return v5;
}

- (id)_waitForGroup:(id)a3 results:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0D81598];
  v7 = a4;
  objc_msgSend(v6, "waitForGroup:", a3);
  -[PPContactStorage _joinResults:](self, "_joinResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_waitForGroup:(id)a3 results:(id)a4 timeoutSeconds:(double)a5 explanationSet:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PPContactStorage *v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15872;
  v31 = __Block_byref_object_dispose__15873;
  v32 = 0;
  v13 = (void *)MEMORY[0x1E0D81598];
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke;
  v24[3] = &unk_1E7E1BAB8;
  v26 = &v27;
  v24[4] = self;
  v25 = v11;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke_2;
  v19[3] = &unk_1E7E1BAE0;
  v15 = v12;
  v23 = &v27;
  v20 = v15;
  v21 = self;
  v16 = v25;
  v22 = v16;
  objc_msgSend(v13, "waitForGroup:timeoutSeconds:onGroupComplete:onTimeout:", v10, v24, v19, a5);
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)emailFilterWithQuery:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPContactStorage_emailFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E7E1BB08;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (id)nameFilterWithQuery:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPContactStorage_nameFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E7E1BB08;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (id)phoneFilterWithQuery:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPContactStorage_phoneFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E7E1BB08;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (id)postalAddressFilterWithQuery:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0D70BF8];
  objc_msgSend(a3, "matchingPostalAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizeAddressString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PPContactStorage_postalAddressFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E7E1BB08;
  v10 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

- (id)contactHandlesForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PPSQLDatabase *db;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  __CFString *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "topicIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  db = self->_db;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke;
  v19[3] = &unk_1E7E1BB30;
  v20 = CFSTR("SELECT value, count(*) AS num_handles FROM cn_handles h JOIN cn_handles_sources hs ON h.id = hs.cn_handle_id WHERE hs.source_id IN (SELECT DISTINCT source_id FROM tp_records r WHERE r.topic_id IN _pas_nsarray(?)) GROUP BY value ORDER BY num_handles DESC");
  v21 = v6;
  v14 = v5;
  v22 = v14;
  v15 = v6;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v19);
  v16 = v22;
  v17 = v14;

  return v17;
}

- (id)contactHandlesForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PPSQLDatabase *db;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke;
  v13[3] = &unk_1E7E1BB58;
  v8 = v4;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v13);
  v10 = v15;
  v11 = v9;

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (id)sourcesForContactHandle:(id)a3
{
  id v4;
  void *v5;
  PPSQLDatabase *db;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  __CFString *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke;
  v12[3] = &unk_1E7E1BB30;
  v13 = CFSTR("SELECT hs.source_id FROM cn_handles_sources hs LEFT JOIN cn_handles h ON h.id = hs.cn_handle_id WHERE h.value = :contactHandle");
  v14 = v4;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (int64_t)insertIfNeededAndFetchIdentifierWithHandle:(id)a3 txnWitness:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  int64_t v15;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = a4;
  +[PPContactStorage normalizeHandle:](PPContactStorage, "normalizeHandle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke;
  v25[3] = &unk_1E7E1F040;
  v12 = v9;
  v26 = v12;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO cn_handles (value) VALUES (:value)"), v25, 0, 0);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(v8, "db");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_2;
  v19[3] = &unk_1E7E1F040;
  v14 = v12;
  v20 = v14;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_3;
  v18[3] = &unk_1E7E1BB80;
  v18[4] = &v21;
  objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM cn_handles WHERE value = :value"), v19, v18, 0);

  v15 = v22[3];
  if (v15 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContactStorage.m"), 340, CFSTR("Failed to find handle in cn_handles"));

    v15 = v22[3];
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)storeHandleSourceMapWithHandles:(id)a3 sourceId:(int64_t)a4 txnWitness:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  id obj;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = -[PPContactStorage insertIfNeededAndFetchIdentifierWithHandle:txnWitness:](self, "insertIfNeededAndFetchIdentifierWithHandle:txnWitness:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), v9);
        objc_msgSend(v9, "db");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __72__PPContactStorage_storeHandleSourceMapWithHandles_sourceId_txnWitness___block_invoke;
        v17[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
        v17[4] = v14;
        v17[5] = a4;
        objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO cn_handles_sources (cn_handle_id, source_id) VALUES (:handleId, :sourceId)"), v17, 0, 0);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (unint64_t)pruneOrphanedHandlesWithTxnWitness:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInTable:", CFSTR("cn_handles"));

  objc_msgSend(v3, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("DELETE FROM cn_handles WHERE id NOT IN (SELECT DISTINCT cn_handle_id FROM cn_handles_sources)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepAndRunNonDataQueries:onError:", v7, 0);

  objc_msgSend(v3, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "numberOfRowsInTable:", CFSTR("cn_handles"));
  return v5 - v9;
}

- (id)contactHandleSourceCountsWithMinimumSourceCount:(unint64_t)a3
{
  void *v5;
  PPSQLDatabase *db;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke;
  v13[3] = &unk_1E7E1BBC8;
  v14 = CFSTR("SELECT ch.value, COUNT(ch.id) as count FROM cn_handles ch LEFT JOIN cn_handles_sources chs ON ch.id = chs.cn_handle_id GROUP BY ch.id HAVING COUNT(ch.id) >= :minSourceCount");
  v16 = a3;
  v7 = v5;
  v15 = v7;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v13);
  pp_contacts_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "contactHandleSourceCounts: returning %tu tuples", buf, 0xCu);
  }

  v10 = v15;
  v11 = v7;

  return v11;
}

- (void)setCachedSignificantContactHandles:(id)a3
{
  id v4;
  PPSQLDatabase *db;
  id v6;
  _QWORD v7[4];
  __CFString *v8;
  id v9;
  __CFString *v10;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke;
  v7[3] = &unk_1E7E1DB90;
  v7[1] = 3221225472;
  v8 = CFSTR("DELETE FROM significant_contacts WHERE handle NOT IN _pas_nsset(:significantHandles)");
  v9 = v4;
  v10 = CFSTR("INSERT OR IGNORE INTO significant_contacts (handle) SELECT value FROM _pas_nsset(:significantHandles)");
  v6 = v4;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 3, v7);

}

- (BOOL)chineseBirthdayFound
{
  return self->_chineseBirthdayFound;
}

- (void)setChineseBirthdayFound:(BOOL)a3
{
  self->_chineseBirthdayFound = a3;
}

- (void)loadChineseBirthdayFoundKVData
{
  PPSQLDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PPContactStorage_loadChineseBirthdayFoundKVData__block_invoke;
  v3[3] = &unk_1E7E1BC90;
  v3[4] = self;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 3, v3);
}

- (void)setChineseBirthdayFoundKVData
{
  PPSQLDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PPContactStorage_setChineseBirthdayFoundKVData__block_invoke;
  v3[3] = &unk_1E7E1EEB0;
  v3[4] = self;
  -[PPSQLDatabase writeTransactionWithClient:block:](db, "writeTransactionWithClient:block:", 3, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_foundInAppsHarvestStoreGetter, 0);
  objc_storeStrong((id *)&self->_foundInAppsService, 0);
  objc_storeStrong((id *)&self->_meCardCacheManager, 0);
  objc_storeStrong((id *)&self->_contactCacheManager, 0);
  objc_storeStrong((id *)&self->_concurrentContactQueryQueue, 0);
  objc_storeStrong((id *)&self->_concurrentContactQueryThrottleSem, 0);
  objc_storeStrong((id *)&self->_contactsStore, 0);
}

void __49__PPContactStorage_setChineseBirthdayFoundKVData__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithBytes:length:", *(_QWORD *)(a1 + 32) + 80, 1);
  +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v5, CFSTR("kPPContactStorageChineseBirthdayFoundKey"), v4);

}

void __50__PPContactStorage_loadChineseBirthdayFoundKVData__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", CFSTR("kPPContactStorageChineseBirthdayFoundKey"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getBytes:length:", *(_QWORD *)(a1 + 32) + 80, 1);
    pp_private_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPContactStorage initialization: chineseBirthdayFound: %d", (uint8_t *)v7, 8u);
    }

  }
}

void __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_2;
  v11[3] = &unk_1E7E1F040;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v6, v11, &__block_literal_global_110, 0);

  objc_msgSend(v3, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_4;
  v9[3] = &unk_1E7E1F040;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v9, &__block_literal_global_111, 0);

}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":significantHandles", *(_QWORD *)(a1 + 32));
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":significantHandles", *(_QWORD *)(a1 + 32));
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_5()
{
  return *MEMORY[0x1E0D81788];
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_3()
{
  return *MEMORY[0x1E0D81780];
}

uint64_t __51__PPContactStorage_cachedSignificantContactHandles__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  unsigned __int8 *v5;
  uint8_t v7[16];

  objc_msgSend(a2, "getNSStringForColumnName:table:", "handle", "significant_contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPContactStorage: received a null handle from a nonnull column.", v7, 2u);
    }

  }
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v5;
}

void __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_3;
  v5[3] = &unk_1E7E1F120;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, v7, v5, 0);

}

uint64_t __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":minSourceCount", *(_QWORD *)(a1 + 32));
}

uint64_t __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "value", "cn_handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v7;
}

void __72__PPContactStorage_storeHandleSourceMapWithHandles_sourceId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":handleId", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":sourceId", *(_QWORD *)(a1 + 40));

}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":value", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":value", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnName:table:", "id", "cn_handles");
  return *MEMORY[0x1E0D81788];
}

void __44__PPContactStorage_sourcesForContactHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke_2;
  v8[3] = &unk_1E7E1F040;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke_3;
  v6[3] = &unk_1E7E1F120;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v5, v8, v6, 0);

}

void __44__PPContactStorage_sourcesForContactHandle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[PPContactStorage normalizeHandle:](PPContactStorage, "normalizeHandle:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":contactHandle", v4);

}

uint64_t __44__PPContactStorage_sourcesForContactHandle___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getInt64AsNSNumberForColumnName:table:", "source_id", "cn_handles_sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

void __44__PPContactStorage_contactHandlesForSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke_2;
  v7[3] = &unk_1E7E1F040;
  v8 = *(id *)(a1 + 32);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke_3;
  v5[3] = &unk_1E7E1F120;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT h.value FROM sources src LEFT JOIN cn_handles_sources hs ON hs.source_id = src.id LEFT JOIN cn_handles h ON h.id = hs.cn_handle_id WHERE src.sha256 = :sha256 "), v7, v5, 0);

}

void __44__PPContactStorage_contactHandlesForSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sha256");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSData:", ":sha256", v4);

}

uint64_t __44__PPContactStorage_contactHandlesForSource___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "value", "cn_handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

void __44__PPContactStorage_contactHandlesForTopics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke_2;
  v8[3] = &unk_1E7E1F040;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke_3;
  v6[3] = &unk_1E7E1F120;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v5, v8, v6, 0);

}

uint64_t __44__PPContactStorage_contactHandlesForTopics___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSArray:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __44__PPContactStorage_contactHandlesForTopics___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __49__PPContactStorage_postalAddressFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "postalAddresses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v8, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "singleLineNormalizedAddressString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (_PASInsensitiveStringContainsString() & 1) != 0)
        {

          objc_autoreleasePoolPop(v9);
          v12 = 1;
          goto LABEL_12;
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

uint64_t __41__PPContactStorage_phoneFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "matchingPhone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PPRemovePhoneExtensionAndNonDigits(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "phoneNumbers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "value");
        v10 = objc_claimAutoreleasedReturnValue();
        PPRemovePhoneExtensionAndNonDigits((void *)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v10) = objc_msgSend(v11, "containsString:", v5);
        if ((v10 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

uint64_t __40__PPContactStorage_nameFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "localizedFullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _PASInsensitiveStringContainsString();

  return v5;
}

uint64_t __41__PPContactStorage_emailFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "emailAddresses", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v9, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "matchingEmail");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = _PASInsensitiveStringContainsString();

        objc_autoreleasePoolPop(v10);
        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

void __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_joinResults:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  pp_contacts_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: timed out waiting on SG and/or CN queries", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "push:", 49);
  objc_msgSend(*(id *)(a1 + 40), "_joinResults:", *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __33__PPContactStorage__joinResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cnContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    pp_contacts_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "cnContacts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134217984;
      v21 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: found %tu contacts from Contacts", (uint8_t *)&v20, 0xCu);

    }
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "cnContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v3, "fiaContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    pp_contacts_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "fiaContacts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v20 = 134217984;
      v21 = v14;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: found %tu contacts from Found in Apps", (uint8_t *)&v20, 0xCu);

    }
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v3, "fiaContacts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

  }
  objc_msgSend(v3, "setJoined:", 1);
  objc_msgSend(v3, "cnContacts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v3, "fiaContacts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPQuickTypeMetrics contactMatchesWithContactsCount:foundInAppsCount:](PPQuickTypeMetrics, "contactMatchesWithContactsCount:foundInAppsCount:", v18, objc_msgSend(v19, "count"));

}

void __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_40(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[5], "accessCacheWithBlock:", &__block_literal_global_42);
    WeakRetained = v2;
  }

}

uint64_t __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteMeCardCache");
}

uint64_t __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke()
{
  return 0;
}

+ (id)normalizeHandle:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  __int16 v13;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPContactStorage.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

    v13 = 0;
    v5 = 0;
  }
  PPStringNormalizationTypeCheck(v5, &v13, (_BYTE *)&v13 + 1);
  if ((_BYTE)v13)
  {
    PPNormalizeEmailAddress(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (HIBYTE(v13))
  {
    PPNormalizePhoneNumber(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  if (objc_msgSend(v7, "length"))
    v9 = v8;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

@end
