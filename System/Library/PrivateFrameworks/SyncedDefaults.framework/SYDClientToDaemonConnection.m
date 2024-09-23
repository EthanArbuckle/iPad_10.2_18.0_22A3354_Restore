@implementation SYDClientToDaemonConnection

- (id)objectForKey:(id)a3
{
  return -[SYDClientToDaemonConnection objectForKey:error:](self, "objectForKey:error:", a3, 0);
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD v34[6];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  os_activity_scope_state_s state;
  uint8_t v43[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[16];
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (-[SYDClientToDaemonConnection hasFullCachedDictionary](self, "hasFullCachedDictionary"))
  {
    SYDGetConnectionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SYDClientToDaemonConnection dictionaryRepresentationWithError:].cold.1(self, v6);

    -[SYDClientToDaemonConnection cachedObjects](self, "cachedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SYDClientToDaemonConnection copyDictionaryWithoutNullValues:](self, "copyDictionaryWithoutNullValues:", v7);

    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject unlock](v9, "unlock");
  }
  else
  {
    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

    v9 = _os_activity_create(&dword_20DA7A000, "kvs/dictionary-representation", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v9, &state);
    SYDGetAccessorSignpostsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    SYDGetAccessorSignpostsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "UTF8String");
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "GetDictionaryRepresentation", "StoreIdentifier=%{signpost.description:attribute}s", (uint8_t *)&buf, 0xCu);

    }
    SYDGetConnectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection dictionaryRepresentationWithError:].cold.3(v18, (uint64_t)v53, v17);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    v52 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v19 = MEMORY[0x24BDAC760];
    v41 = 0;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke;
    v35[3] = &unk_24C806BD8;
    v35[4] = &v36;
    -[SYDClientToDaemonConnection synchronousDaemonWithErrorHandler:](self, "synchronousDaemonWithErrorHandler:", v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke_2;
    v34[3] = &unk_24C806C00;
    v34[4] = &v36;
    v34[5] = &buf;
    objc_msgSend(v20, "dictionaryRepresentationForStoreWithConfiguration:reply:", v21, v34);

    v22 = v37[5];
    if (!v22)
    {
      SYDGetConnectionLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYDClientToDaemonConnection dictionaryRepresentationWithError:].cold.2(v24, (uint64_t)v47, v23);
      }

      -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lock");

      v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "mutableCopy");
      -[SYDClientToDaemonConnection setCachedObjects:](self, "setCachedObjects:", v26);

      -[SYDClientToDaemonConnection setHasFullCachedDictionary:](self, "setHasFullCachedDictionary:", 1);
      -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "unlock");

      v22 = v37[5];
    }
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v22);
    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = MEMORY[0x24BDBD1B8];

    }
    SYDGetConnectionLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v43 = 138412547;
      v44 = v29;
      v45 = 2113;
      v46 = v30;
      _os_log_impl(&dword_20DA7A000, v28, OS_LOG_TYPE_INFO, "Returning dictionary representation for store <%@>: %{private}@", v43, 0x16u);

    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v37[5]);
    SYDGetAccessorSignpostsLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)v43 = 0;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v32, OS_SIGNPOST_INTERVAL_END, v12, "GetDictionaryRepresentation", (const char *)&unk_20DA8B18D, v43, 2u);
    }

    v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&buf, 8);
    os_activity_scope_leave(&state);
  }

  return v8;
}

- (void)setCachedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_cachedObjects, a3);
}

- (BOOL)hasFullCachedDictionary
{
  return self->_hasFullCachedDictionary;
}

- (void)dictionaryRepresentationWithError:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_7(&dword_20DA7A000, a3, (uint64_t)a3, "Getting dictionary representation for store <(%@)>", (uint8_t *)a2);

  OUTLINED_FUNCTION_16();
}

- (void)dictionaryRepresentationWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_7(&dword_20DA7A000, a3, (uint64_t)a3, "Caching dictionary representation for store <(%@)>", (uint8_t *)a2);

  OUTLINED_FUNCTION_16();
}

void __54__SYDClientToDaemonConnection_clientProtocolInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DA3C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientProtocolInterface_interface;
  clientProtocolInterface_interface = v0;

}

void __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DB6C0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_setObject_forKey_inStoreWithConfiguration_reply_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v2);

  NSStringFromSelector(sel_objectForKey_inStoreWithConfiguration_reply_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C809110, v3);

  NSStringFromSelector(sel_removeObjectForKey_inStoreWithConfiguration_reply_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v4);

  NSStringFromSelector(sel_dictionaryRepresentationForStoreWithConfiguration_reply_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C809110, v5);

  NSStringFromSelector(sel_registerForChangeNotificationsForStoreWithConfiguration_reply_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v6);

  NSStringFromSelector(sel_changeDictionarySinceChangeToken_inStoreWithConfiguration_reply_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C809110, v7);

  NSStringFromSelector(sel_changeTokenForStoreWithConfiguration_reply_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C809110, v8);

  NSStringFromSelector(sel_saveChangeToken_forStoreWithConfiguration_reply_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v9);

  NSStringFromSelector(sel_synchronizeStoreWithConfiguration_completionHandler_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v10);

  NSStringFromSelector(sel_processAccountChangesWithCompletionHandler_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_24C8090F8, v11);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke_209;
  v14[3] = &unk_24C8070E8;
  v12 = v0;
  v15 = v12;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v14);

  v13 = (void *)daemonProtocolInterface_interface;
  daemonProtocolInterface_interface = (uint64_t)v12;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; storeConfiguration=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke(uint64_t a1)
{
  id *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "needsChangeDictionaryFromDaemon");
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v2, "storeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_20DA7A000, v5, OS_LOG_TYPE_INFO, "Synchronizing for store <(%@)>", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    objc_msgSend(*v2, "changeToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_120;
    v16[3] = &unk_24C806BD8;
    v16[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "synchronousDaemonWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "storeConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_2;
    v15[3] = &unk_24C806C00;
    v15[4] = *(_QWORD *)(a1 + 48);
    v15[5] = &buf;
    objc_msgSend(v10, "changeDictionarySinceChangeToken:inStoreWithConfiguration:reply:", v7, v11, v15);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      SYDGetConnectionLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_2();

      objc_msgSend(*v2, "setNeedsChangeDictionaryFromDaemon:", 0);
      objc_msgSend(*v2, "processChangeDictionary:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v13 = 1;
    }
    else
    {
      SYDGetConnectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_1();

      v13 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_3();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)setNeedsChangeDictionaryFromDaemon:(BOOL)a3
{
  self->_needsChangeDictionaryFromDaemon = a3;
}

- (BOOL)needsChangeDictionaryFromDaemon
{
  return self->_needsChangeDictionaryFromDaemon;
}

- (unsigned)synchronize
{
  return -[SYDClientToDaemonConnection synchronizeForced:](self, "synchronizeForced:", 0);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Received change dictionary from daemon for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)changeToken
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v3 = _os_activity_create(&dword_20DA7A000, "kvs/get-change-token", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SYDClientToDaemonConnection changeToken].cold.3();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v5 = MEMORY[0x24BDAC760];
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__SYDClientToDaemonConnection_changeToken__block_invoke;
  v12[3] = &unk_24C806BD8;
  v12[4] = &v13;
  -[SYDClientToDaemonConnection synchronousDaemonWithErrorHandler:](self, "synchronousDaemonWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __42__SYDClientToDaemonConnection_changeToken__block_invoke_2;
  v11[3] = &unk_24C806D88;
  v11[4] = &v13;
  v11[5] = &v20;
  objc_msgSend(v6, "changeTokenForStoreWithConfiguration:reply:", v7, v11);

  if (v14[5])
  {
    SYDGetConnectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SYDClientToDaemonConnection changeToken].cold.2();
  }
  else
  {
    SYDGetConnectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SYDClientToDaemonConnection changeToken].cold.1();
  }

  v9 = (id)v21[5];
  _Block_object_dispose(&v13, 8);

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v20, 8);

  return v9;
}

- (void)synchronizationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  SYDClientToDaemonConnection *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  SYDClientToDaemonConnection *v23;
  id v24;
  id v25[2];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  SYDClientToDaemonConnection *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20DA7A000, "kvs/cloud-sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  SYDGetSyncSignpostsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (char *)os_signpost_id_generate(v6);

  SYDGetSyncSignpostsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v28 = v11;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "Sync", "StoreIdentifier=%{signpost.description:attribute}s enableTelemetry=YES ", buf, 0xCu);

  }
  SYDGetConnectionLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = (uint64_t)v13;
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_20DA7A000, v12, OS_LOG_TYPE_INFO, "Synchronizing with cloud for store <(%@)> %@", buf, 0x16u);

  }
  v14 = self;
  objc_sync_enter(v14);
  -[SYDClientToDaemonConnection setSyncingWithCloudCounter:](v14, "setSyncingWithCloudCounter:", -[SYDClientToDaemonConnection syncingWithCloudCounter](v14, "syncingWithCloudCounter") + 1);
  objc_sync_exit(v14);

  objc_initWeak((id *)buf, v14);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke;
  v22 = &unk_24C806E50;
  objc_copyWeak(v25, (id *)buf);
  v23 = v14;
  v15 = v4;
  v24 = v15;
  v25[1] = v7;
  v16 = (void *)MEMORY[0x212BAE05C](&v19);
  -[SYDClientToDaemonConnection asyncDaemonWithErrorHandler:](v14, "asyncDaemonWithErrorHandler:", v16, v19, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDClientToDaemonConnection storeConfiguration](v14, "storeConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "synchronizeStoreWithConfiguration:completionHandler:", v18, v16);

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);

}

- (void)registerForSynchronizedDefaults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Registering for change notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  _QWORD block[6];
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "storeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_20DA7A000, v5, OS_LOG_TYPE_INFO, "Done synchronizing with cloud for store <(%@)>", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_sync_enter(v10);
    objc_msgSend(v10, "setSyncingWithCloudCounter:", objc_msgSend(v10, "syncingWithCloudCounter") - 1);
    objc_sync_exit(v10);

    objc_msgSend(v10, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_125;
    block[3] = &unk_24C806E28;
    v12 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v10;
    v20 = v12;
    v13 = v3;
    v14 = *(_QWORD *)(a1 + 56);
    v19 = v13;
    v21 = v14;
    dispatch_async(v11, block);

  }
  else
  {
    SYDGetSyncSignpostsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v16, OS_SIGNPOST_INTERVAL_END, v17, "Sync", (const char *)&unk_20DA8B18D, buf, 2u);
    }

  }
}

- (unint64_t)syncingWithCloudCounter
{
  return self->_syncingWithCloudCounter;
}

- (void)setSyncingWithCloudCounter:(unint64_t)a3
{
  self->_syncingWithCloudCounter = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "storeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  v9 = a2;
  OUTLINED_FUNCTION_23(&dword_20DA7A000, a3, v7, "Error synchronizing with cloud for store <(%@)>: %@", v8);

  OUTLINED_FUNCTION_19();
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Not getting change dictionary from the daemon because we don't need to", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)processChangeDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYDClientToDaemonConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v22 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1370]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1368]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "integerValue") == 3)
    -[SYDClientToDaemonConnection _clearCachedObjects](self, "_clearCachedObjects");
  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  -[SYDClientToDaemonConnection setHasFullCachedDictionary:](self, "setHasFullCachedDictionary:", 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        SYDGetConnectionLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 141558275;
          v31 = 1752392040;
          v32 = 2113;
          v33 = v14;
          _os_log_debug_impl(&dword_20DA7A000, v15, OS_LOG_TYPE_DEBUG, "Invalidating cached value for changed key <(%{private, mask.hash}@)>", buf, 0x16u);
        }

        -[SYDClientToDaemonConnection cachedObjects](self, "cachedObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v11);
  }

  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

  if (v21)
  {
    -[SYDClientToDaemonConnection callbackQueue](self, "callbackQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke;
    block[3] = &unk_24C806DD8;
    block[4] = self;
    v24 = v21;
    v25 = v9;
    dispatch_async(v18, block);

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ChangeToken"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    -[SYDClientToDaemonConnection setChangeToken:](self, "setChangeToken:", v19);

}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  __int128 v18;
  _QWORD v19[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = (id *)(a1 + 32);
    v2 = *(void **)(a1 + 32);
    v4 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_3;
    v19[3] = &unk_24C806BD8;
    v19[4] = *(_QWORD *)(a1 + 64);
    objc_msgSend(v2, "synchronousDaemonWithErrorHandler:", v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "storeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_4;
    v17[3] = &unk_24C806CE8;
    v18 = *(_OWORD *)(a1 + 64);
    objc_msgSend(v5, "objectForKey:inStoreWithConfiguration:reply:", v7, v8, v17);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      SYDGetConnectionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
          __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_2(a1 + 40, a1 + 32, v10);

        objc_msgSend(*(id *)(a1 + 32), "cacheLock");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lock");

        objc_msgSend(*(id *)(a1 + 32), "cachedObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));
      }
      else
      {
        if (v11)
          __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_1(a1 + 40, a1 + 32, v10);

        objc_msgSend(*v3, "cacheLock");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lock");

        objc_msgSend(*v3, "cachedObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, *v6);

      }
      objc_msgSend(*v3, "cacheLock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unlock");

    }
  }
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "cacheLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 32), "cachedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "cacheLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

    if ((_DWORD)v8)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

    }
  }
}

- (NSLock)cacheLock
{
  return self->_cacheLock;
}

- (NSMutableDictionary)cachedObjects
{
  return self->_cachedObjects;
}

- (id)asyncDaemonWithErrorHandler:(id)a3
{
  id v4;
  SYDClientToDaemonConnection *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SYDClientToDaemonConnection xpcConnection](v5, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke;
  v10[3] = &unk_24C806E78;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v5;
  SYDClientToDaemonConnection *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[SYDClientToDaemonConnection xpcConnection](v6, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SYDClientToDaemonConnection.m"), 1691, CFSTR("Expected non-nil XPC connection"));

  }
  objc_msgSend(v7, "_queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SYDClientToDaemonConnection.m"), 1692, CFSTR("Expected non-nil XPC connection queue"));

  }
  objc_msgSend(v7, "_queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v15[3] = &unk_24C806E78;
  v10 = v5;
  v16 = v10;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v11;
}

- (NSXPCConnection)xpcConnection
{
  SYDClientToDaemonConnection *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  SYDClientProtocolProxy *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id buf[2];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_xpcConnection)
  {
    SYDGetConnectionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20DA7A000, v3, OS_LOG_TYPE_INFO, "Creating new XPC connection", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    -[SYDClientToDaemonConnection machServiceName](v2, "machServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithMachServiceName:options:", v5, 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v6;

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_216);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__SYDClientToDaemonConnection_xpcConnection__block_invoke_217;
    v12[3] = &unk_24C807150;
    objc_copyWeak(&v13, buf);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v12);
    +[SYDClientToDaemonConnection clientProtocolInterface](SYDClientToDaemonConnection, "clientProtocolInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_xpcConnection, "setExportedInterface:", v8);

    v9 = -[SYDClientProtocolProxy initWithTarget:]([SYDClientProtocolProxy alloc], "initWithTarget:", v2);
    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v9);

    +[SYDClientToDaemonConnection daemonProtocolInterface](SYDClientToDaemonConnection, "daemonProtocolInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v2);

  return v2->_xpcConnection;
}

+ (id)daemonProtocolInterface
{
  if (daemonProtocolInterface_onceToken != -1)
    dispatch_once(&daemonProtocolInterface_onceToken, &__block_literal_global_162);
  return (id)daemonProtocolInterface_interface;
}

+ (id)clientProtocolInterface
{
  if (clientProtocolInterface_onceToken != -1)
    dispatch_once(&clientProtocolInterface_onceToken, &__block_literal_global_211);
  return (id)clientProtocolInterface_interface;
}

- (id)objectForKey:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  id v18;
  void (**v19)(void);
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  os_signpost_id_t v27;
  id *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v38;
  unint64_t v39;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  _QWORD block[5];
  id v46;
  void (**v47)(void);
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  id v71;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  id v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v40 = _os_activity_create(&dword_20DA7A000, "kvs/get-object", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v40, &state);
  SYDGetAccessorSignpostsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  SYDGetAccessorSignpostsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v39 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");
    v13 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    *(_DWORD *)buf = 136315394;
    v74 = v12;
    v75 = 2080;
    v76 = v13;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GetObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);

  }
  SYDGetConnectionLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    objc_claimAutoreleasedReturnValue();
    -[SYDClientToDaemonConnection objectForKey:error:].cold.1();
  }

  v71 = 0;
  v15 = -[SYDClientToDaemonConnection validateKey:error:](self, "validateKey:error:", v6, &v71);
  v16 = v71;
  if (v15)
  {
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy_;
    v69 = __Block_byref_object_dispose_;
    v70 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    v64 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v17 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke;
    v51[3] = &unk_24C806CC0;
    v51[4] = self;
    v53 = &v59;
    v18 = v6;
    v52 = v18;
    v54 = &v55;
    v19 = (void (**)(void))MEMORY[0x212BAE05C](v51);
    v19[2]();
    if (!*((_BYTE *)v56 + 24))
    {
      -[SYDClientToDaemonConnection queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2;
      block[3] = &unk_24C806D10;
      v47 = v19;
      v48 = &v55;
      block[4] = self;
      v49 = &v65;
      v46 = v18;
      v50 = &v59;
      dispatch_sync(v20, block);

    }
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v66[5]);
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDClientToDaemonConnection analyticsQueue](self, "analyticsQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v41[0] = v17;
    v41[1] = 3221225472;
    v41[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_101;
    v41[3] = &unk_24C806D60;
    v23 = v18;
    v42 = v23;
    v24 = v21;
    v43 = v24;
    v44 = &v55;
    dispatch_async(v22, v41);

    SYDGetConnectionLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v38 = v6;
      v26 = v16;
      v27 = v8;
      v28 = a4;
      v29 = *((unsigned __int8 *)v56 + 24);
      v30 = v60[5];
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      v33 = CFSTR(" (from cache)");
      *(_DWORD *)buf = 138413571;
      if (!v29)
        v33 = &stru_24C807BA8;
      v74 = (uint64_t)v33;
      v75 = 2160;
      v76 = 1752392040;
      v77 = 2113;
      v78 = v23;
      v79 = 2160;
      v80 = 1752392040;
      v81 = 2113;
      v82 = v30;
      v83 = 2112;
      v84 = v31;
      _os_log_impl(&dword_20DA7A000, v25, OS_LOG_TYPE_INFO, "Returning object%@ for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x3Eu);

      a4 = v28;
      v8 = v27;
      v16 = v26;
      v6 = v38;
    }

    if (a4)
      *a4 = objc_retainAutorelease((id)v66[5]);
    SYDGetAccessorSignpostsLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v35, OS_SIGNPOST_INTERVAL_END, v8, "GetObject", (const char *)&unk_20DA8B18D, buf, 2u);
    }

    v36 = (id)v60[5];
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);

    _Block_object_dispose(&v65, 8);
  }
  else
  {
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v16);
    v36 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  os_activity_scope_leave(&state);
  return v36;
}

- (NSString)storeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SYDStoreConfiguration)storeConfiguration
{
  return self->_storeConfiguration;
}

- (void)logFaultIfNecessaryForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SyncedDefaults"));

    if (v7)
    {
      v8 = objc_msgSend(v13, "code");
      if (v8 <= 5554)
      {
        if (v8 == 2222)
        {
          -[SYDClientToDaemonConnection ___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:](self, "___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:", v13);
          goto LABEL_18;
        }
        v5 = v13;
        if (v8 == 3333)
        {
          v12 = -[SYDClientToDaemonConnection didLogFaultForEntitlements](self, "didLogFaultForEntitlements");
          v5 = v13;
          if (!v12)
          {
            -[SYDClientToDaemonConnection setDidLogFaultForEntitlements:](self, "setDidLogFaultForEntitlements:", 1);
            -[SYDClientToDaemonConnection ___You_are_not_entitled_for_NSUbiquitousKeyValueStore](self, "___You_are_not_entitled_for_NSUbiquitousKeyValueStore");
            goto LABEL_18;
          }
        }
      }
      else
      {
        if (v8 == 5555)
        {
          -[SYDClientToDaemonConnection ___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore](self, "___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore");
          goto LABEL_18;
        }
        if (v8 == 6666)
        {
          -[SYDClientToDaemonConnection ___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore](self, "___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore");
          goto LABEL_18;
        }
        v5 = v13;
        if (v8 == 101010)
        {
          -[SYDClientToDaemonConnection ___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist](self, "___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist");
LABEL_18:
          v5 = v13;
        }
      }
    }
    else
    {
      objc_msgSend(v13, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0B88]);

      v5 = v13;
      if (v10)
      {
        v11 = objc_msgSend(v13, "code");
        v5 = v13;
        if (v11 == 4099)
        {
          -[SYDClientToDaemonConnection ___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again](self, "___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again");
          goto LABEL_18;
        }
      }
    }
  }

}

- (BOOL)validateKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid key parameter provided"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SyncedDefaults"), 2222, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)objectForKey:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Getting object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (unsigned)synchronizeForced:(unsigned __int8)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_20DA7A000, "kvs/synchronize", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[SYDClientToDaemonConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke;
  block[3] = &unk_24C806DB0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v5, block);

  -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v9[5]);
  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  os_activity_scope_leave(&state);

  return self;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setChangeToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20DA7A000, "kvs/save-change-token", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  SYDGetConnectionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SYDClientToDaemonConnection setChangeToken:].cold.3();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x24BDAC760];
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__SYDClientToDaemonConnection_setChangeToken___block_invoke;
  v12[3] = &unk_24C806BD8;
  v12[4] = &v13;
  -[SYDClientToDaemonConnection synchronousDaemonWithErrorHandler:](self, "synchronousDaemonWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __46__SYDClientToDaemonConnection_setChangeToken___block_invoke_2;
  v11[3] = &unk_24C806BD8;
  v11[4] = &v13;
  objc_msgSend(v8, "saveChangeToken:forStoreWithConfiguration:reply:", v4, v9, v11);

  if (v14[5])
  {
    SYDGetConnectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SYDClientToDaemonConnection setChangeToken:].cold.2();
  }
  else
  {
    SYDGetConnectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SYDClientToDaemonConnection setChangeToken:].cold.1();
  }

  _Block_object_dispose(&v13, 8);
  os_activity_scope_leave(&state);

}

- (void)setHasFullCachedDictionary:(BOOL)a3
{
  self->_hasFullCachedDictionary = a3;
}

- (void)setChangeToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Saving change token to daemon for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)changeToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error getting change token from daemon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)registerForApplicationLifecycleEvents
{
  NSObject *v3;
  void *v4;

  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SYDClientToDaemonConnection registerForApplicationLifecycleEvents].cold.1();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

- (void)setChangeToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Saved change token to daemon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (id)machServiceName
{
  return (id)objc_msgSend((id)objc_opt_class(), "machServiceNameUsingTestServer:", 0);
}

+ (id)machServiceNameUsingTestServer:(BOOL)a3
{
  return CFSTR("com.apple.kvsd");
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  objc_msgSend((id)OUTLINED_FUNCTION_17(a1, a2), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a3, v5, "Caching object for key <(%{private, mask.hash}@)> from daemon in store <(%@)>", v6);

  OUTLINED_FUNCTION_11();
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  objc_msgSend((id)OUTLINED_FUNCTION_17(a1, a2), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a3, v5, "Caching NSNull for key <(%{private, mask.hash}@)> from daemon in store <(%@)>", v6);

  OUTLINED_FUNCTION_11();
}

uint64_t __58__SYDClientToDaemonConnection_initWithStoreConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForSynchronizedDefaults");
}

void __46__SYDClientToDaemonConnection_setChangeToken___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)dictionaryRepresentation
{
  return -[SYDClientToDaemonConnection dictionaryRepresentationWithError:](self, "dictionaryRepresentationWithError:", 0);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __42__SYDClientToDaemonConnection_changeToken__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (!v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (SYDClientToDaemonConnection)initWithStoreIdentifier:(id)a3 type:(int64_t)a4
{
  SYDClientToDaemonConnection *v6;
  SYDStoreID *v7;
  SYDStoreConfiguration *v8;

  v6 = (SYDClientToDaemonConnection *)a3;
  if (v6
    || (objc_msgSend((id)objc_opt_class(), "defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:", 0),
        (v6 = (SYDClientToDaemonConnection *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (-[SYDClientToDaemonConnection length](v6, "length"))
    {
      v7 = -[SYDStoreID initWithIdentifier:type:]([SYDStoreID alloc], "initWithIdentifier:type:", v6, a4);
      v8 = -[SYDStoreConfiguration initWithStoreID:]([SYDStoreConfiguration alloc], "initWithStoreID:", v7);
      self = -[SYDClientToDaemonConnection initWithStoreConfiguration:](self, "initWithStoreConfiguration:", v8);

      v6 = self;
    }
    else
    {
      -[SYDClientToDaemonConnection ___Your_store_identifier_is_empty](self, "___Your_store_identifier_is_empty");

      v6 = 0;
    }
  }
  else
  {
    -[SYDClientToDaemonConnection ___We_looked_everywhere_but_we_cant_find_your_store_identifier](self, "___We_looked_everywhere_but_we_cant_find_your_store_identifier");
  }

  return v6;
}

- (SYDClientToDaemonConnection)initWithStoreConfiguration:(id)a3
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  SYDClientToDaemonConnection *v12;
  SYDClientToDaemonConnection *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *callbackQueue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *analyticsQueue;
  NSMutableDictionary *v24;
  NSMutableDictionary *cachedObjects;
  NSLock *v26;
  NSLock *cacheLock;
  NSObject *v28;
  void *v30;
  objc_class *v31;
  void *v32;
  _QWORD block[4];
  SYDClientToDaemonConnection *v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDClientToDaemonConnection.m"), 114, CFSTR("Must specify a store configuration when initializing %@"), v32);

  }
  SYDGetConnectionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v9;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v11;
    _os_log_impl(&dword_20DA7A000, v7, OS_LOG_TYPE_INFO, "Initializing %@ with configuration %@ store <(%@)>", buf, 0x20u);

  }
  v35.receiver = self;
  v35.super_class = (Class)SYDClientToDaemonConnection;
  v12 = -[SYDClientToDaemonConnection init](&v35, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeConfiguration, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.kvs.client", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.kvs.client.callback", v17);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)0xFFFF8000, -15);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.kvs.client.analytics", v21);
    analyticsQueue = v13->_analyticsQueue;
    v13->_analyticsQueue = (OS_dispatch_queue *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedObjects = v13->_cachedObjects;
    v13->_cachedObjects = v24;

    v26 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    cacheLock = v13->_cacheLock;
    v13->_cacheLock = v26;

    v13->_hasFullCachedDictionary = 0;
    v13->_syncingWithCloudCounter = 0;
    v13->_needsChangeDictionaryFromDaemon = 1;
    -[SYDClientToDaemonConnection registerForDaemonDidWakeNotifications](v13, "registerForDaemonDidWakeNotifications");
    -[SYDClientToDaemonConnection registerForApplicationLifecycleEvents](v13, "registerForApplicationLifecycleEvents");
    -[SYDClientToDaemonConnection performOpportunisticAppLaunchSyncIfNecessary](v13, "performOpportunisticAppLaunchSyncIfNecessary");
    -[SYDClientToDaemonConnection queue](v13, "queue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SYDClientToDaemonConnection_initWithStoreConfiguration___block_invoke;
    block[3] = &unk_24C806BB0;
    v34 = v13;
    dispatch_async(v28, block);

  }
  return v13;
}

- (void)registerForDaemonDidWakeNotifications
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SYDClientToDaemonConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__SYDClientToDaemonConnection_registerForDaemonDidWakeNotifications__block_invoke;
  v4[3] = &unk_24C806FD0;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.syncdefaultsd.daemon.wake", &self->_daemonWakeNotifyToken, v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)performOpportunisticAppLaunchSyncIfNecessary
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  -[SYDClientToDaemonConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke;
  block[3] = &unk_24C806BB0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

+ (id)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __SecTask *v8;
  __SecTask *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  SYDGetConnectionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.5();

  v8 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.developer.ubiquity-kvstore-identifier"), 0);
    CFRelease(v9);
    SYDGetConnectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.4();
LABEL_18:

      goto LABEL_20;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.3();
  }
  else
  {
    SYDGetConnectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.2();
  }

  if (!v4)
  {
    v10 = 0;
    goto LABEL_20;
  }
  objc_msgSend(a1, "disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    SYDGetConnectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.1();
    goto LABEL_18;
  }
LABEL_20:

  return v10;
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Checking entitlements for KVS store identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Found entitlement for KVS store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  SYDGetSyncSignpostsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Sync", (const char *)&unk_20DA8B18D, v6, 2u);
  }

}

- (void)applicationWillEnterForeground
{
  NSObject *v3;
  _QWORD block[5];

  -[SYDClientToDaemonConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke;
  block[3] = &unk_24C806BB0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_20DA7A000, v2, OS_LOG_TYPE_INFO, "Performing moved to foreground sync for store <(%@)>", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_151;
  v6[3] = &unk_24C806FF8;
  v6[4] = v4;
  return objc_msgSend(v4, "synchronizationWithCompletionHandler:", v6);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[SYDClientToDaemonConnection setObject:forKey:error:](self, "setObject:forKey:error:", a3, a4, 0);
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *DeepCopy;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_2;
  v21[3] = &unk_24C806BD8;
  v21[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "synchronousDaemonWithErrorHandler:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*v3, "storeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_3;
  v20[3] = &unk_24C806BD8;
  v20[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "setObject:forKey:inStoreWithConfiguration:reply:", v8, v7, v9, v20);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*v3, "_handleCacheErrorForKey:", *v6);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    SYDGetConnectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_2(a1 + 48, (uint64_t)v3, v11);

      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFPropertyListRef *)(a1 + 40), 0);
      objc_msgSend(*(id *)(a1 + 32), "cacheLock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lock");

      objc_msgSend(*(id *)(a1 + 32), "cachedObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", DeepCopy, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "cacheLock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unlock");

    }
    else
    {
      if (v12)
        __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_1(a1 + 48, (uint64_t)v3, v11);

      objc_msgSend(*v3, "cacheLock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lock");

      objc_msgSend(*v3, "cachedObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, *v6);

      objc_msgSend(*v3, "cacheLock");
      DeepCopy = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(DeepCopy, "unlock");
    }

  }
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  objc_msgSend((id)OUTLINED_FUNCTION_17(a1, a2), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a3, v5, "Caching object for key <(%{private, mask.hash}@)> after setting in store <(%@)>", v6);

  OUTLINED_FUNCTION_11();
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  id v20;
  unint64_t v21;
  void *v22;
  int64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  uint8_t v51[8];
  _QWORD v52[4];
  id v53;
  SYDClientToDaemonConnection *v54;
  _QWORD block[5];
  id v56;
  id v57;
  _BYTE *v58;
  id v59;
  os_activity_scope_state_s state;
  uint64_t v61;
  const __CFString *v62;
  _BYTE buf[24];
  uint64_t v64;
  _BYTE v65[20];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_20DA7A000, "kvs/set-object", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  SYDGetAccessorSignpostsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  SYDGetAccessorSignpostsLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    v16 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v16;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SetObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);

  }
  SYDGetConnectionLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141559043;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2160;
    v64 = 1752392040;
    *(_WORD *)v65 = 2113;
    *(_QWORD *)&v65[2] = v7;
    *(_WORD *)&v65[10] = 2112;
    *(_QWORD *)&v65[12] = v18;
    _os_log_impl(&dword_20DA7A000, v17, OS_LOG_TYPE_INFO, "Setting object for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x34u);

  }
  v59 = 0;
  v19 = -[SYDClientToDaemonConnection validateKey:error:](self, "validateKey:error:", v8, &v59);
  v20 = v59;
  if (v19)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v64 = (uint64_t)__Block_byref_object_copy_;
    *(_QWORD *)v65 = __Block_byref_object_dispose_;
    *(_QWORD *)&v65[8] = 0;
    v21 = objc_msgSend(v8, "length");
    if (v21 > -[SYDRemotePreferencesSource maximumKeyLength](self, "maximumKeyLength"))
    {
      v22 = (void *)MEMORY[0x24BDBCE88];
      v23 = -[SYDRemotePreferencesSource maximumKeyLength](self, "maximumKeyLength");
      objc_msgSend(v22, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("NSUbiquitousKeyValueStore key '%@' is longer than the maximum allowed UTF-16 code units of (%ld)"), v8, v23);
LABEL_49:
      v24 = 0;
LABEL_50:
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "storeID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "type") == 0;

    if (v27 && (unint64_t)objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4) >= 0xBE)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("NSUbiquitousKeyValueStore key '%@' is larger than the maximum allowed UTF-8 code units of (%ld)"), v8, 189);
      goto LABEL_49;
    }
    if (v7 && (objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v7, 200) & 1) == 0)
    {
      v44 = (void *)MEMORY[0x24BDD1540];
      v61 = *MEMORY[0x24BDD0FC8];
      v62 = CFSTR("Tried to set an object that is not a valid plist value.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("SyncedDefaults"), 2222, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v46;

      if (a5)
        *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      -[SYDClientToDaemonConnection ___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:](self, "___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:", v7);
      goto LABEL_49;
    }
    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lock");

    -[SYDClientToDaemonConnection cachedObjects](self, "cachedObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "unlock");

    if (v49)
      v31 = v7 != 0;
    else
      v31 = 0;
    if (v31)
    {
      if (objc_msgSend(v49, "isEqual:", v7))
      {
        SYDGetConnectionLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
          objc_claimAutoreleasedReturnValue();
          -[SYDClientToDaemonConnection setObject:forKey:error:].cold.3();
        }
LABEL_22:

        goto LABEL_30;
      }
    }
    else if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v49, "isEqual:", v33);

      if (v34)
      {
        SYDGetConnectionLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
          objc_claimAutoreleasedReturnValue();
          -[SYDClientToDaemonConnection setObject:forKey:error:].cold.4();
        }
        goto LABEL_22;
      }
    }
    -[SYDClientToDaemonConnection queue](self, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke;
    block[3] = &unk_24C806C48;
    block[4] = self;
    v58 = buf;
    v56 = v7;
    v57 = v8;
    dispatch_sync(v35, block);

LABEL_30:
    v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v36)
    {
      objc_msgSend(v36, "domain");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v37, "isEqualToString:", CFSTR("SyncedDefaults")))
      {
LABEL_36:

        goto LABEL_37;
      }
      v38 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == 6666;

      if (v38)
      {
        SYDGetConnectionLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[SYDClientToDaemonConnection setObject:forKey:error:].cold.2();

        -[SYDClientToDaemonConnection callbackQueue](self, "callbackQueue");
        v40 = objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_97;
        v52[3] = &unk_24C806C70;
        v53 = v8;
        v54 = self;
        dispatch_async(v40, v52);

        v37 = v53;
        goto LABEL_36;
      }
    }
LABEL_37:
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    SYDGetConnectionLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection setObject:forKey:error:].cold.1();
    }

    SYDGetAccessorSignpostsLog();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v43, OS_SIGNPOST_INTERVAL_END, v11, "SetObject", (const char *)&unk_20DA8B18D, v51, 2u);
    }

    v24 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
    goto LABEL_50;
  }
  -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v20);
  v24 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v20);
LABEL_51:

  os_activity_scope_leave(&state);
  return v24;
}

- (void)setObject:forKey:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Did set object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

- (SYDClientToDaemonConnection)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStoreIdentifier_type_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDClientToDaemonConnection.m"), 146, CFSTR("Please use -%@"), v5);

  return 0;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Deallocating daemon connection %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (int64_t)storeType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  return v4;
}

- (BOOL)isSyncingWithCloud
{
  return -[SYDClientToDaemonConnection syncingWithCloudCounter](self, "syncingWithCloudCounter") != 0;
}

+ (id)allStoreIdentifiersWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_20DA7A000, "kvs/all-store-identifiers", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v6 = (void *)objc_msgSend(a1, "newXPCConnection");
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke;
  v18[3] = &unk_24C806BD8;
  v18[4] = &v19;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_22;
  v11[3] = &unk_24C806C00;
  v11[4] = &v12;
  v11[5] = &v19;
  objc_msgSend(v8, "allStoreIdentifiersWithCompletionHandler:", v11);
  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (id)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__onceToken, &__block_literal_global_1);
  objc_msgSend((id)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __99__SYDClientToDaemonConnection_disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.sbd");
  v2[1] = CFSTR("com.apple.security.cloudkeychainproxy3");
  v3[0] = CFSTR("com.apple.sbd3");
  v3[1] = CFSTR("com.apple.security.cloudkeychainproxy3");
  v2[2] = CFSTR("accountsd");
  v2[3] = CFSTR("com.apple.finder");
  v3[2] = CFSTR("com.apple.accounts");
  v3[3] = CFSTR("com.apple.finder");
  v2[4] = CFSTR("com.apple.VoiceOverTouch");
  v2[5] = CFSTR("com.apple.TextInput.kbd");
  v3[4] = CFSTR("com.apple.VoiceOverTouch");
  v3[5] = CFSTR("com.apple.inputmethod.kbd");
  v2[6] = CFSTR("com.apple.nanoweatherprefsd");
  v2[7] = CFSTR("com.apple.springboard");
  v3[6] = CFSTR("com.apple.weather");
  v3[7] = CFSTR("com.apple.springboard");
  v2[8] = CFSTR("com.apple.backboardd");
  v2[9] = CFSTR("com.apple.datamigrator");
  v3[8] = CFSTR("com.apple.backboardd");
  v3[9] = CFSTR("com.apple.datamigrator");
  v2[10] = CFSTR("com.apple.CoreSuggestions");
  v2[11] = CFSTR("com.apple.cmfsyncagent");
  v3[10] = CFSTR("com.apple.CoreSuggestions");
  v3[11] = CFSTR("com.apple.cmfsyncagent");
  v2[12] = CFSTR("com.apple.accessibility.heard");
  v2[13] = CFSTR("wifid");
  v3[12] = CFSTR("com.apple.HearingAids");
  v3[13] = CFSTR("com.apple.wifid.known-networks");
  v2[14] = CFSTR("com.apple.wifi.manager");
  v2[15] = CFSTR("com.apple.wifid");
  v3[14] = CFSTR("com.apple.wifid.known-networks");
  v3[15] = CFSTR("com.apple.wifid.known-networks");
  v2[16] = CFSTR("com.apple.wifi.WiFiAgent");
  v2[17] = CFSTR("com.apple.coretelephony");
  v3[16] = CFSTR("com.apple.wifid.known-networks");
  v3[17] = CFSTR("com.apple.coretelephony");
  v2[18] = CFSTR("com.apple.mediaaccessibilityd");
  v2[19] = CFSTR("com.apple.tipsd");
  v3[18] = CFSTR("com.apple.mediaaccessibility");
  v3[19] = CFSTR("com.apple.tipsd");
  v2[20] = CFSTR("com.apple.touristd");
  v3[20] = CFSTR("com.apple.touristd");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier;
  disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier = v0;

}

- (void)_handleCacheErrorForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SYDClientToDaemonConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[SYDClientToDaemonConnection cachedObjects](self, "cachedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD1368];
  v9[0] = &unk_24C8090E0;
  v3 = *MEMORY[0x24BDD1370];
  v8[0] = v2;
  v8[1] = v3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SYDUbiquitousKeyValueStoreDidChangeExternallyNotification"), *(_QWORD *)(a1 + 40), v5);

}

- (void)removeObjectForKey:(id)a3
{
  -[SYDClientToDaemonConnection removeObjectForKey:error:](self, "removeObjectForKey:error:", a3, 0);
}

- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v32[16];
  _QWORD block[5];
  id v34;
  _BYTE *v35;
  id v36;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _os_activity_create(&dword_20DA7A000, "kvs/remove-object", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  SYDGetAccessorSignpostsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  SYDGetAccessorSignpostsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "UTF8String");
    v14 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v14;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RemoveObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);

  }
  SYDGetConnectionLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
    v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558531;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v39 = v16;
    _os_log_impl(&dword_20DA7A000, v15, OS_LOG_TYPE_INFO, "Removing object for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);

  }
  v36 = 0;
  v17 = -[SYDClientToDaemonConnection validateKey:error:](self, "validateKey:error:", v6, &v36);
  v18 = v36;
  if (v17)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v41 = 0;
    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lock");

    -[SYDClientToDaemonConnection cachedObjects](self, "cachedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unlock");

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "isEqual:", v23);

    if (v24)
    {
      SYDGetConnectionLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
        objc_claimAutoreleasedReturnValue();
        -[SYDClientToDaemonConnection removeObjectForKey:error:].cold.2();
      }

    }
    else
    {
      -[SYDClientToDaemonConnection queue](self, "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke;
      block[3] = &unk_24C806C98;
      block[4] = self;
      v35 = buf;
      v34 = v6;
      dispatch_sync(v27, block);

    }
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    SYDGetConnectionLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection removeObjectForKey:error:].cold.1();
    }

    SYDGetAccessorSignpostsLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_20DA7A000, v30, OS_SIGNPOST_INTERVAL_END, v9, "RemoveObject", (const char *)&unk_20DA8B18D, v32, 2u);
    }

    v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[SYDClientToDaemonConnection logFaultIfNecessaryForError:](self, "logFaultIfNecessaryForError:", v18);
    v26 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
  }

  os_activity_scope_leave(&state);
  return v26;
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (id *)(a1 + 4);
  v2 = (void *)a1[4];
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_2;
  v15[3] = &unk_24C806BD8;
  v15[4] = a1[6];
  objc_msgSend(v2, "synchronousDaemonWithErrorHandler:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1 + 5;
  v7 = a1[5];
  objc_msgSend(*v3, "storeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_3;
  v14[3] = &unk_24C806BD8;
  v14[4] = a1[6];
  objc_msgSend(v5, "removeObjectForKey:inStoreWithConfiguration:reply:", v7, v8, v14);

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*v3, "_handleCacheErrorForKey:", *v6);
  }
  else
  {
    SYDGetConnectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_cold_1((uint64_t)v6, (uint64_t)v3, v9);

    objc_msgSend(*v3, "cacheLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lock");

    objc_msgSend(*v3, "cachedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, *v6);

    objc_msgSend(*v3, "cacheLock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_101(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_104(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("keyHash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = CFSTR("storeIdentifier");
  v8[2] = CFSTR("objectExistedInCache");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(v4 + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)getObject:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  -[SYDClientToDaemonConnection objectForKey:error:](self, "objectForKey:error:", a4, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return v8 == 0;
}

- (void)_clearCachedObjects
{
  void *v3;
  id v4;
  id v5;

  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[SYDClientToDaemonConnection setHasFullCachedDictionary:](self, "setHasFullCachedDictionary:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SYDClientToDaemonConnection setCachedObjects:](self, "setCachedObjects:", v4);

  -[SYDClientToDaemonConnection cacheLock](self, "cacheLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

void __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)copyDictionaryWithoutNullValues:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeObjectsForKeys:", v5);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (__CFDictionary)copyDictionary
{
  return (__CFDictionary *)CFRetain(-[SYDClientToDaemonConnection dictionaryRepresentation](self, "dictionaryRepresentation"));
}

void __46__SYDClientToDaemonConnection_setChangeToken___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__SYDClientToDaemonConnection_changeToken__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_120(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke_cold_1(a1, v2);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SYDUbiquitousKeyValueStoreDidChangeExternallyNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)scheduleRemoteSynchronization
{
  -[SYDClientToDaemonConnection synchronizationWithCompletionHandler:](self, "synchronizationWithCompletionHandler:", 0);
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_125(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsChangeDictionaryFromDaemon:", 1);
  objc_msgSend(*(id *)(a1 + 40), "synchronize");
  objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C806E00;
  v7 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v8 = v4;
  dispatch_async(v2, block);

}

+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "synchronizeStoresWithIdentifiers:type:testConfiguration:completionHandler:", a3, a4, 0, a5);
}

+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];
  _QWORD v32[4];
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_20DA7A000, "kvs/cloud-sync-multiple", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  SYDGetSyncSignpostsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (char *)os_signpost_id_generate(v14);

  SYDGetSyncSignpostsLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v36 = v19;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "SyncMultiple", "Stores=%{signpost.description:attribute}s enableTelemetry=YES ", buf, 0xCu);

  }
  SYDGetConnectionLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    SYDStringForStoreType(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = (uint64_t)v21;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_20DA7A000, v20, OS_LOG_TYPE_INFO, "Synchronizing stores of type %@ with the cloud: %@", buf, 0x16u);

  }
  v22 = (void *)objc_msgSend(a1, "newXPCConnection");
  v23 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke;
  v32[3] = &unk_24C806E78;
  v24 = v12;
  v33 = v24;
  objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v22);
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_128;
  v28[3] = &unk_24C806E50;
  objc_copyWeak(v31, (id *)buf);
  v26 = v10;
  v29 = v26;
  v27 = v24;
  v30 = v27;
  v31[1] = v15;
  objc_msgSend(v25, "synchronizeStoresWithIdentifiers:type:testConfiguration:completionHandler:", v26, a4, v11, v28);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  SYDGetConnectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_128_cold_1();

    objc_msgSend(v3, "domain");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqual:](v6, "isEqual:", CFSTR("SyncedDefaults")))
    {
      v7 = objc_msgSend(v3, "code");

      if (v7 != 3333)
        goto LABEL_12;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_129;
      v17[3] = &unk_24C806BB0;
      v18 = *(id *)(a1 + 32);
      if (_block_invoke_onceToken != -1)
        dispatch_once(&_block_invoke_onceToken, v17);
      v6 = v18;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_20DA7A000, v6, OS_LOG_TYPE_INFO, "Done synchronizing with cloud for stores: %@", buf, 0xCu);
  }

LABEL_12:
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_130;
    block[3] = &unk_24C806EA0;
    v16 = v9;
    v15 = v3;
    dispatch_async(v10, block);

  }
  SYDGetSyncSignpostsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DA7A000, v12, OS_SIGNPOST_INTERVAL_END, v13, "SyncMultiple", (const char *)&unk_20DA8B18D, buf, 2u);
  }

  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);
  objc_msgSend(WeakRetained, "setInterruptionHandler:", 0);
  objc_msgSend(WeakRetained, "invalidate");

}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_129(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_24C806BB0;
  v2 = *(id *)(a1 + 32);
  if (_block_invoke_2_innerOnceToken != -1)
    dispatch_once(&_block_invoke_2_innerOnceToken, block);

}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2_cold_1(a1);

}

uint64_t __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20DA7A000, "kvs/is-cloud-sync-enabled", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = (void *)objc_msgSend(a1, "newXPCConnection");
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_131);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_132;
  v10[3] = &unk_24C806F08;
  v10[4] = &v11;
  objc_msgSend(v7, "isCloudSyncUserDefaultEnabledForStoreIdentifier:completionHandler:", v4, v10);
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  os_activity_scope_leave(&state);
  return v8;
}

void __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_cold_1();

}

uint64_t __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_132(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20DA7A000, "kvs/is-cloud-sync-enabled", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  if (v4)
  {
    SYDGetConnectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[SYDClientToDaemonConnection setCloudSyncUserDefaultEnabled:storeIdentifier:].cold.1();
  }
  else
  {
    SYDGetConnectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[SYDClientToDaemonConnection setCloudSyncUserDefaultEnabled:storeIdentifier:].cold.2();
  }

  v9 = (void *)objc_msgSend(a1, "newXPCConnection");
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_134);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCloudSyncUserDefaultEnabled:storeIdentifier:", v4, v6);

  os_activity_scope_leave(&v11);
}

void __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke_cold_1();

}

+ (id)machServiceName
{
  return (id)objc_msgSend(a1, "machServiceNameUsingTestServer:", 0);
}

+ (id)newXPCConnection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  objc_msgSend(a1, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", v4, 0);

  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_138);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_140);
  +[SYDClientToDaemonConnection daemonProtocolInterface](SYDClientToDaemonConnection, "daemonProtocolInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  return v5;
}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20DA7A000, v0, OS_LOG_TYPE_INFO, "XPC connection was interrupted", v1, 2u);
  }

}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_139()
{
  NSObject *v0;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_139_cold_1();

}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_cold_1();

}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_143(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_143_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_143_cold_1();
  }

}

void __68__SYDClientToDaemonConnection_registerForDaemonDidWakeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemonDidWake");

}

- (void)daemonDidWake
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Pinged from daemon. IT'S ALIVE!!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

uint64_t __44__SYDClientToDaemonConnection_daemonDidWake__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForSynchronizedDefaults");
}

void __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_151(uint64_t a1)
{
  NSObject *v2;

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_151_cold_1(a1, v2);

}

void __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;

  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("cfprefsd"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE80C78], "currentProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isApplication");

    if (v7)
    {
      if ((objc_msgSend((id)objc_opt_class(), "hasPerformedAppLaunchSyncForStoreIdentifier:", v2) & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "setHasPerformedAppLaunchSyncForStoreIdentifier:", v2);
        SYDGetConnectionLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke_cold_1();

        objc_msgSend(*(id *)(a1 + 32), "synchronizationWithCompletionHandler:", 0);
      }
    }
  }

}

+ (void)setHasPerformedAppLaunchSyncForStoreIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)sAppLaunchSyncStoreIdentifiers;
  if (!sAppLaunchSyncStoreIdentifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sAppLaunchSyncStoreIdentifiers;
    sAppLaunchSyncStoreIdentifiers = v6;

    v5 = (void *)sAppLaunchSyncStoreIdentifiers;
  }
  objc_msgSend(v5, "addObject:", v8);
  objc_sync_exit(v4);

}

+ (BOOL)hasPerformedAppLaunchSyncForStoreIdentifier:(id)a3
{
  id v4;
  id v5;
  char v6;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = objc_msgSend((id)sAppLaunchSyncStoreIdentifiers, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

+ (void)setShouldSyncOnFirstInitializationOverride:(id)a3
{
  objc_storeStrong((id *)&_shouldSyncOnFirstInitializationOverride, a3);
}

+ (id)shouldSyncOnFirstInitializationOverride
{
  return (id)_shouldSyncOnFirstInitializationOverride;
}

- (void)___You_are_not_entitled_for_NSUbiquitousKeyValueStore___
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke;
  block[3] = &unk_24C806BB0;
  block[4] = self;
  if (___You_are_not_entitled_for_NSUbiquitousKeyValueStore____onceToken != -1)
    dispatch_once(&___You_are_not_entitled_for_NSUbiquitousKeyValueStore____onceToken, block);
}

void __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke(uint64_t a1)
{
  NSObject *v2;

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1(a1);

}

- (void)___We_looked_everywhere_but_we_cant_find_your_store_identifier___
{
  if (___We_looked_everywhere_but_we_cant_find_your_store_identifier____onceToken != -1)
    dispatch_once(&___We_looked_everywhere_but_we_cant_find_your_store_identifier____onceToken, &__block_literal_global_156);
}

void __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke_cold_1(v0, v1, v2);

}

- (void)___Your_store_identifier_is_empty___
{
  if (___Your_store_identifier_is_empty____onceToken != -1)
    dispatch_once(&___Your_store_identifier_is_empty____onceToken, &__block_literal_global_157);
}

void __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke_cold_1(v0, v1, v2);

}

- (void)___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore___
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke;
  block[3] = &unk_24C806BB0;
  block[4] = self;
  if (___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore____onceToken != -1)
    dispatch_once(&___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore____onceToken, block);
}

void __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke(uint64_t a1)
{
  NSObject *v2;

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke_cold_1(a1);

}

- (void)___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist___
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke;
  block[3] = &unk_24C806BB0;
  block[4] = self;
  if (___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist____onceToken != -1)
    dispatch_once(&___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist____onceToken, block);
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke(uint64_t a1)
{
  int has_internal_content;
  NSObject *v3;
  _BOOL4 v4;

  has_internal_content = os_variant_has_internal_content();
  SYDGetConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_FAULT);
  if (has_internal_content)
  {
    if (v4)
      __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_1(a1);
  }
  else if (v4)
  {
    __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_2(a1);
  }

}

- (void)___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[SYDClientToDaemonConnection ___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:].cold.1();

}

- (void)___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again___
{
  if (___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again____onceToken != -1)
    dispatch_once(&___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again____onceToken, &__block_literal_global_159);
}

void __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke()
{
  NSObject *v0;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke_cold_1();

}

- (void)___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore___
{
  if (___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore____onceToken != -1)
    dispatch_once(&___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore____onceToken, &__block_literal_global_160);
}

void __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke()
{
  NSObject *v0;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1();

}

- (void)___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke;
  block[3] = &unk_24C806BB0;
  v7 = v3;
  v4 = ___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore_____onceToken[0];
  v5 = v3;
  if (v4 != -1)
    dispatch_once(___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore_____onceToken, block);

}

void __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke()
{
  NSObject *v0;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke_cold_1();

}

- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20DA7A000, "kvs/store-did-change", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    SYDGetConnectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[SYDClientToDaemonConnection storeIdentifier](self, "storeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_20DA7A000, v12, OS_LOG_TYPE_INFO, "Received storeDidChange for store <(%@)>", buf, 0xCu);

    }
    if (-[SYDClientToDaemonConnection isSyncingWithCloud](self, "isSyncingWithCloud"))
    {
      SYDGetConnectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SYDClientToDaemonConnection storeDidChangeWithStoreID:changeDictionary:].cold.1();

    }
    else
    {
      -[SYDClientToDaemonConnection queue](self, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __74__SYDClientToDaemonConnection_storeDidChangeWithStoreID_changeDictionary___block_invoke;
      v18[3] = &unk_24C806C70;
      v18[4] = self;
      v19 = v7;
      dispatch_async(v17, v18);

    }
  }
  else
  {
    SYDGetConnectionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[SYDClientToDaemonConnection storeConfiguration](self, "storeConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection storeDidChangeWithStoreID:changeDictionary:].cold.2(v16, (uint64_t)v6, (uint64_t)buf, v15);
    }

  }
  os_activity_scope_leave(&state);

}

uint64_t __74__SYDClientToDaemonConnection_storeDidChangeWithStoreID_changeDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processChangeDictionary:", *(_QWORD *)(a1 + 40));
}

- (unsigned)hasExternalChanges
{
  return 0;
}

- (id)copyExternalChangesWithChangeCount:(int64_t *)a3
{
  return 0;
}

+ (void)processAccountChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20DA7A000, "kvs/process-account-changes", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  SYDGetConnectionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SYDClientToDaemonConnection processAccountChangesWithCompletionHandler:].cold.1();

  v7 = (void *)objc_msgSend(a1, "newXPCConnection");
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke;
  v16[3] = &unk_24C806E78;
  v9 = v4;
  v17 = v9;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161;
  v12[3] = &unk_24C8070A0;
  objc_copyWeak(&v14, &location);
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "processAccountChangesWithCompletionHandler:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SYDGetConnectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161_cold_1();
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);
  objc_msgSend(WeakRetained, "setInterruptionHandler:", 0);
  objc_msgSend(WeakRetained, "invalidate");

}

void __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke_209(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  NSString *v6;
  SEL v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  SYDErrorUserInfoClasses();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSSelectorFromString(v6);

  v8 = objc_msgSend(v5, "integerValue");
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, v7, v8, 1);

}

void __44__SYDClientToDaemonConnection_xpcConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20DA7A000, v0, OS_LOG_TYPE_INFO, "XPC connection was interrupted", v1, 2u);
  }

}

void __44__SYDClientToDaemonConnection_xpcConnection__block_invoke_217(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint8_t v6[16];

  SYDGetConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20DA7A000, v2, OS_LOG_TYPE_INFO, "XPC connection was invalidated", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "setXpcConnection:", 0);
    objc_sync_exit(v5);

  }
}

void __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SYDGetConnectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setStoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_storeConfiguration, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setAnalyticsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsQueue, a3);
}

- (int)daemonWakeNotifyToken
{
  return self->_daemonWakeNotifyToken;
}

- (void)setDaemonWakeNotifyToken:(int)a3
{
  self->_daemonWakeNotifyToken = a3;
}

- (BOOL)didLogFaultForEntitlements
{
  return self->_didLogFaultForEntitlements;
}

- (void)setDidLogFaultForEntitlements:(BOOL)a3
{
  self->_didLogFaultForEntitlements = a3;
}

- (void)setCacheLock:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_cachedObjects, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_storeConfiguration, 0);
}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining synchronous remote object proxy to get all store identifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.1()
{
  uint64_t v0;
  __int16 v1;
  os_log_t v2;
  uint8_t v3[14];
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_25();
  v4 = v0;
  v5 = v1;
  v6 = CFSTR("com.apple.developer.ubiquity-kvstore-identifier");
  _os_log_error_impl(&dword_20DA7A000, v2, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF KVS: KVS store identifier (%@) for (%@) was inferred from a hardcoded list. Please specify a store identifier in your NSUbiquitousKeyValueStore initializer or in the %@ entitlement.", v3, 0x20u);
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_20(&dword_20DA7A000, v0, v1, "Unable to get a SecTaskRef to check for KVS store entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_20(&dword_20DA7A000, v0, v1, "Unable to find entitlement for KVS store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)setObject:forKey:error:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_23(&dword_20DA7A000, v1, (uint64_t)v1, "Quota error saving (%{private}@)): %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)setObject:forKey:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Not setting identical object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

- (void)setObject:forKey:error:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Not setting identical nil value for key <(%{private, mask.hash}@)> in store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  objc_msgSend((id)OUTLINED_FUNCTION_17(a1, a2), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a3, v5, "Caching NSNull key <(%{private, mask.hash}@)> after setting to nil in store <(%@)>", v6);

  OUTLINED_FUNCTION_11();
}

- (void)removeObjectForKey:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Did remove object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

- (void)removeObjectForKey:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_8(&dword_20DA7A000, v6, v4, "Not removing already-nil object for key <(%{private, mask.hash}@)> from store <(%@)>", v5);

  OUTLINED_FUNCTION_16();
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];

  objc_msgSend((id)OUTLINED_FUNCTION_17(a1, a2), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a3, v5, "Caching NSNull for key <(%{private, mask.hash}@)> after removing it for store <(%@)>", v6);

  OUTLINED_FUNCTION_11();
}

- (void)dictionaryRepresentationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cachedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412547;
  v8 = v4;
  v9 = 2113;
  v10 = v5;
  OUTLINED_FUNCTION_24(&dword_20DA7A000, a2, v6, "Returning cached dictionary representation for store <(%@)>: %{private}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_19();
}

- (void)setChangeToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error saving change token to daemon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Did not receive change dictionary from daemon for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD1368]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 48), "count");
  v8 = 138412802;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2048;
  v13 = v6;
  OUTLINED_FUNCTION_8(&dword_20DA7A000, a2, v7, "On queue posting change notification for %@ with reason=%@ and %ld changed key(s)", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11();
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining remote object proxy for syncing multiple stores: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_128_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error synchronizing multiple stores with cloud: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20DA7A000, v2, v3, "BUG IN CLIENT OF KVS: Tried to sync multiple stores, but not entitled for all of them: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

void __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining synchronous remote object proxy to check cloud sync enablement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)setCloudSyncUserDefaultEnabled:storeIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Setting cloud sync to enabled for store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)setCloudSyncUserDefaultEnabled:storeIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Setting cloud sync to disabled for store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining synchronous remote object proxy to set cloud sync enablement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_139_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "XPC connection was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error getting proxy to register: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_143_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Finished registering for change notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_143_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error registering for change notifications: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_151_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_20DA7A000, a2, v4, "Completed foreground move triggered sync for store <(%@)>", v5);

  OUTLINED_FUNCTION_14();
}

void __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_20DA7A000, v0, v1, "Performing opportunistic app launch sync for store <(%@)>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "storeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20DA7A000, v2, v3, "BUG IN CLIENT OF KVS: Tried to access NSUbiquitousKeyValueStore '%@' without the proper entitlements. If your process is not entitled to access this store, then any attempts to get data will return nil, and any attempts to set data will be ignored. Please add the proper entitlements to access this store, or stop trying to access it in an unentitled process.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

void __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("com.apple.developer.ubiquity-kvstore-identifier");
  OUTLINED_FUNCTION_10(&dword_20DA7A000, a1, a3, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore without a store identifier. Please specify your store identifier in the '%@' entitlement.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("com.apple.developer.ubiquity-kvstore-identifier");
  OUTLINED_FUNCTION_10(&dword_20DA7A000, a1, a3, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore with a zero-length store identifier. Please specify a real store identifier in the '%@' entitlement.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "storeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20DA7A000, v2, v3, "BUG IN CLIENT OF KVS: Tried to access encrypted store '%@' before first unlock. When this fault occurs, NSUbiquitousKeyValueStore is about to return a nil value for any key you just asked for, even if there’s data in the store for that key. Depending on what might be done with that return value, this could result in data loss.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "storeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20DA7A000, v2, v3, "BUG IN KVS: Tried to access store that is unknown to the system (%{public}@). Please file a bug with a sysdiagnose on NSUbiquitousKeyValueStore.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "storeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20DA7A000, v2, v3, "BUG IN KVS: Tried to access store that is unknown to the system (%{public}@). Please submit a bug report with a sysdiagnose.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_20DA7A000, v0, v1, "BUG IN CLIENT OF KVS: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

void __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
}

void __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_21(&dword_20DA7A000, v0, v1, "BUG IN CLIENT OF KVS: Exceeded the maximum amount of data in NSUbiquitousKeyValueStore. This new data will not be saved, which means that you are likely experiencing data loss.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_10(&dword_20DA7A000, v0, v1, "BUG IN CLIENT OF KVS: Tried to set an invalid object. Objects must be valid plist values. %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)storeDidChangeWithStoreID:changeDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Waiting to process change dictionary until the end of the cloud sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)storeDidChangeWithStoreID:(uint64_t)a3 changeDictionary:(NSObject *)a4 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_24(&dword_20DA7A000, a4, a3, "Received storeDidChange for store that is not our store: self.configuration=%@ configuration=%@", (uint8_t *)a3);

  OUTLINED_FUNCTION_16();
}

+ (void)processAccountChangesWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Telling daemon to process account changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining asynchronous remote object proxy to process account changes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_20DA7A000, v0, v1, "Finished telling daemon to process account changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_161_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Failed to tell daemon to process account changes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining synchronous remote object proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_20DA7A000, v0, v1, "Error obtaining asynchronous remote object proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
