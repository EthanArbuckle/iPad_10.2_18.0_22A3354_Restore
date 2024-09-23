@implementation PLAssetsdMigrationClient

- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3
{
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: cleanupModelForDataMigrationForRestoreType:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5721);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cleanupModelForDataMigrationForRestoreType:reply:", a3, &__block_literal_global_3_5722);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)dataMigrationWillFinish
{
  _BOOL4 v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: dataMigrationWillFinish", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  PLRequestGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4_5713);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataMigrationWillFinishWithReply:", &__block_literal_global_6_5714);

  if ((_BYTE)v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if (v6)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

void __51__PLAssetsdMigrationClient_dataMigrationWillFinish__block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdMigrationClient dataMigrationWillFinish]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__PLAssetsdMigrationClient_cleanupModelForDataMigrationForRestoreType___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdMigrationClient cleanupModelForDataMigrationForRestoreType:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

@end
