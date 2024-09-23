@implementation PLAssetsdSyncClient

- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3
{
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const char *Name;
  _QWORD v14[4];
  char v15;
  id v16;
  __int128 v17;
  __int128 v18;
  SEL v19;
  BOOL v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v21) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: finalizeOTARestoreRecreatingAlbums:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3254779904;
  v14[2] = __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke_1;
  v14[3] = &__block_descriptor_89_e8_32n18_8_8_t0w1_s8_t16w32_e40_v16__0___PLAssetsdSyncServiceProtocol__8l;
  v15 = v21;
  v16 = *((id *)&v21 + 1);
  v17 = v22;
  v18 = *(_OWORD *)sel;
  v19 = a2;
  v20 = a3;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_925, v14);

  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  id v25;
  __int128 v26;
  __int128 v27;
  SEL v28;
  BOOL v29;
  __int128 v30;
  __int128 v31;
  SEL sel[2];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: updateRestoredAssetWithUUID:paths:fixAddedDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3254779904;
  v21[2] = __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_6;
  v21[3] = &unk_1E3767400;
  v24 = v30;
  v25 = *((id *)&v30 + 1);
  v26 = v31;
  v27 = *(_OWORD *)sel;
  v28 = a2;
  v15 = v9;
  v22 = v15;
  v16 = v10;
  v23 = v16;
  v29 = a5;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_5, v21);

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

void __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v13 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "updateRestoredAssetWithUUID:paths:fixAddedDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 104));

}

void __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[PLAssetsdSyncClient updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v13 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "finalizeOTARestoreRecreatingAlbums:", *(unsigned __int8 *)(a1 + 88));

}

void __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[PLAssetsdSyncClient finalizeOTARestoreRecreatingAlbums:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
