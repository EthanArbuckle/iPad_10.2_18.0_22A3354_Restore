@implementation PLAssetsdLibraryClient

- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 error:(id *)a4
{
  return -[PLAssetsdLibraryClient openPhotoLibraryDatabaseWithPostOpenProgress:options:error:](self, "openPhotoLibraryDatabaseWithPostOpenProgress:options:error:", a3, 0, a4);
}

- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *Name;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  const char *v36;
  _QWORD v38[6];
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  SEL sel[2];
  uint8_t v43[4];
  uint64_t v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v41 = 0u;
  *(_OWORD *)sel = 0u;
  v40 = 0u;
  v10 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v40) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199DF7000, "PLXPC Client: openPhotoLibraryDatabaseWithPostOpenProgress:options:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v40 + 1);
    *((_QWORD *)&v40 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  PLRequestGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v14 = os_signpost_id_generate(v13);
  *(_QWORD *)&v41 = v14;
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke;
  v39[3] = &unk_1E376C420;
  v39[4] = &buf;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke_2;
  v38[3] = &unk_1E37684E0;
  v38[4] = self;
  v38[5] = &buf;
  objc_msgSend(v20, "openPhotoLibraryDatabaseWithOptions:reply:", v9, v38);

  v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a5 && v21)
  {
    *a5 = objc_retainAutorelease(v21);
    v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  if (a3 && !v21)
  {
    -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postOpenProgressWithReply:", &__block_literal_global_10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      *a3 = objc_retainAutorelease(v24);

    v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  PLGatekeeperXPCGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v21)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v27 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v43 = 138412290;
    v44 = v27;
    v28 = "openPhotoLibraryDatabase failed with error %@";
    v29 = v26;
    v30 = OS_LOG_TYPE_ERROR;
    v31 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)v43 = 0;
    v28 = "openPhotoLibraryDatabase succeeded";
    v29 = v26;
    v30 = OS_LOG_TYPE_DEFAULT;
    v31 = 2;
  }
  _os_log_impl(&dword_199DF7000, v29, v30, v28, v43, v31);
LABEL_20:

  v32 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v40)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  if ((_QWORD)v41)
  {
    PLRequestGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      v36 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v36;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v34, OS_SIGNPOST_INTERVAL_END, v35, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v32 == 0;
}

- (PLAssetsdLibraryClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5 sandboxExtensions:(id)a6
{
  id v11;
  PLAssetsdLibraryClient *v12;
  PLAssetsdLibraryClient *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLAssetsdLibraryClient;
  v12 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:](&v15, sel_initWithQueue_proxyCreating_proxyGetter_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_sandboxExtensions, a6);

  return v13;
}

void __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (!v12)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v5;
    v9 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_consumeSandboxExtensions:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 44003, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
LABEL_5:

  }
}

- (BOOL)_consumeSandboxExtensions:(id)a3
{
  unsigned __int8 v4;

  atomic_store(-[PLAssetsdClientSandboxExtensions consumeSandboxExtensions:](self->_sandboxExtensions, "consumeSandboxExtensions:", a3), (unsigned __int8 *)&self->_isOpen);
  v4 = atomic_load((unsigned __int8 *)&self->_isOpen);
  return v4 & 1;
}

- (BOOL)isOpened
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isOpen);
  return v2 & 1;
}

- (void)launchAssetsd
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
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: launchAssetsd", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

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
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_310);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "launchAssetsd");

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

- (int64_t)getCurrentModelVersion
{
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  __int128 buf;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v21) = v4;
  if (v4)
  {
    v5 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getCurrentModelVersion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  *(_QWORD *)&v22 = v8;
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x2020000000;
  v26 = -1;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke_2;
  v20[3] = &unk_1E376A6E0;
  v20[4] = &buf;
  objc_msgSend(v13, "getCurrentModelVersionWithReply:", v20);

  v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v14;
}

- (BOOL)isLibraryReadyForImportWithError:(id *)a3
{
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  SEL sel[2];
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  *(_OWORD *)sel = 0u;
  v27 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v27) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: isLibraryReadyForImportWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v28 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke_5;
  v22[3] = &unk_1E376BF00;
  v22[4] = &v23;
  v22[5] = &buf;
  objc_msgSend(v15, "isLibraryReadyForImportWithReply:", v22);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v16 = *((unsigned __int8 *)v24 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v23, 8);
  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16 != 0;
}

- (BOOL)validateOrRebuildPhotoLibraryDatabaseWithError:(id *)a3
{
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: validateOrRebuildPhotoLibraryDatabaseWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v26 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke;
  v24[3] = &unk_1E376C420;
  v24[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke_2;
  v23[3] = &unk_1E376C630;
  v23[4] = &buf;
  objc_msgSend(v16, "validateOrRebuildPhotoLibraryDatabaseWithReply:", v23);

  v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a3 && v17)
  {
    *a3 = objc_retainAutorelease(v17);
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v21 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v17 == 0;
}

- (BOOL)openApplicationOwnedFoldersWithError:(id *)a3
{
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *v29;
  _QWORD v31[6];
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  SEL sel[2];
  uint8_t v36[4];
  uint64_t v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  *(_OWORD *)sel = 0u;
  v33 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v33) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: openApplicationOwnedFoldersWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v33 + 1);
    *((_QWORD *)&v33 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v34 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke;
  v32[3] = &unk_1E376C420;
  v32[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke_2;
  v31[3] = &unk_1E37684E0;
  v31[4] = self;
  v31[5] = &buf;
  objc_msgSend(v16, "openApplicationOwnedFoldersWithReply:", v31);

  v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a3 && v17)
  {
    *a3 = objc_retainAutorelease(v17);
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  PLGatekeeperXPCGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v36 = 138412290;
    v37 = v20;
    v21 = "openApplicationOwnedFoldersWithError failed with error %@";
    v22 = v19;
    v23 = OS_LOG_TYPE_ERROR;
    v24 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)v36 = 0;
    v21 = "openApplicationOwnedFoldersWithError succeeded";
    v22 = v19;
    v23 = OS_LOG_TYPE_DEFAULT;
    v24 = 2;
  }
  _os_log_impl(&dword_199DF7000, v22, v23, v21, v36, v24);
LABEL_15:

  v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v33)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  if ((_QWORD)v34)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v29 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v25 == 0;
}

- (BOOL)openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:(id)a3 error:(id *)a4
{
  unsigned __int8 v4;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[8];
  id v11;

  v4 = atomic_load((unsigned __int8 *)&self->_isOpen);
  if ((v4 & 1) != 0)
  {
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEBUG, "openPhotoLibraryDatabase: Photo library is already open", v10, 2u);
    }
    v6 = 1;
  }
  else
  {
    v11 = 0;
    v6 = -[PLAssetsdLibraryClient openPhotoLibraryDatabaseWithPostOpenProgress:options:error:](self, "openPhotoLibraryDatabaseWithPostOpenProgress:options:error:", 0, a3, &v11);
    v7 = v11;
    v8 = v7;
    if (a4 && !v6)
    {
      v8 = objc_retainAutorelease(v7);
      v6 = 0;
      *a4 = v8;
    }
  }

  return v6;
}

- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: upgradePhotoLibraryDatabaseWithOptions:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v13 = v7;
  v25 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke_2;
  v22[3] = &unk_1E3768508;
  v22[4] = self;
  v15 = v13;
  v23 = v15;
  objc_msgSend(v14, "upgradePhotoLibraryDatabaseWithOptions:reply:", v6, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v16;
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resetFaceAnalysisWithResetLevel:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke;
  v21[3] = &unk_1E376C3A8;
  v12 = v6;
  v22 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke_2;
  v19[3] = &unk_1E376C3F8;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v13, "resetFaceAnalysisWithResetLevel:withReply:", a3, v19);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)resetPersonsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E376C3A8;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E376C3F8;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "resetPersonsWithReply:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)resetSocialGroupsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E376C3A8;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E376C3F8;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "resetSocialGroupsWithReply:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getPhotoLibraryStoreXPCListenerEndpoint
{
  _BOOL4 v4;
  os_activity_t v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v21) = v4;
  if (v4)
  {
    v5 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getPhotoLibraryStoreXPCListenerEndpoint", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v5;

    os_activity_scope_enter(*((os_activity_t *)&v21 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  *(_QWORD *)&v22 = v8;
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v31 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__PLAssetsdLibraryClient_getPhotoLibraryStoreXPCListenerEndpoint__block_invoke_2;
  v20[3] = &unk_1E3768530;
  v20[4] = &v24;
  objc_msgSend(v13, "getPhotoLibraryStoreXPCListenerEndpointWithReply:", v20);

  v14 = (id)v25[5];
  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v31 = v18;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (BOOL)synchronouslyImportFileSystemAssetsForce:(BOOL)a3 withError:(id *)a4
{
  _BOOL8 v5;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *v25;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  SEL sel[2];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v5 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyImportFileSystemAssetsForce:withError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v29 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__PLAssetsdLibraryClient_synchronouslyImportFileSystemAssetsForce_withError___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "importFileSystemAssetsWithReason:force:reply:", CFSTR("import file sytem assets handler (from client)"), v5, &__block_literal_global_20_285);

  v19 = *((_QWORD *)&buf + 1);
  if (a4)
  {
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v20)
    {
      *a4 = objc_retainAutorelease(v20);
      v19 = *((_QWORD *)&buf + 1);
    }
  }
  v21 = *(_QWORD *)(v19 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21 == 0;
}

- (id)importFileSystemAssetsForce:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v4 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: importFileSystemAssetsForce:withCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke;
  v23[3] = &unk_1E376C3A8;
  v12 = v6;
  v24 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E376C0E0;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "importFileSystemAssetsWithReason:force:reply:", CFSTR("import file system assets handler (async, from client))"), v4, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v15;
}

- (void)recoverFromCrashIfNeeded
{
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const char *Name;
  _QWORD v12[4];
  char v13;
  id v14;
  __int128 v15;
  __int128 v16;
  SEL v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v18) = v4;
  if (v4)
  {
    v5 = _os_activity_create(&dword_199DF7000, "PLXPC Client: recoverFromCrashIfNeeded", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __50__PLAssetsdLibraryClient_recoverFromCrashIfNeeded__block_invoke_2;
  v12[3] = &__block_descriptor_88_e8_32n18_8_8_t0w1_s8_t16w32_e43_v16__0___PLAssetsdLibraryServiceProtocol__8l;
  v13 = v18;
  v14 = *((id *)&v18 + 1);
  v15 = v19;
  v16 = *(_OWORD *)sel;
  v17 = a2;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_23, v12);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)synchronouslyRepairSingletonObjectsWithError:(id *)a3
{
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  SEL sel[2];
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  *(_OWORD *)sel = 0u;
  v27 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v27) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyRepairSingletonObjectsWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v28 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke;
  v26[3] = &unk_1E376C420;
  v26[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke_2;
  v25[3] = &unk_1E376C630;
  v25[4] = &buf;
  objc_msgSend(v16, "repairSingletonObjectsWithReply:", v25);

  v17 = *((_QWORD *)&buf + 1);
  if (a3)
  {
    v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v18)
    {
      *a3 = objc_retainAutorelease(v18);
      v17 = *((_QWORD *)&buf + 1);
    }
  }
  v19 = *(_QWORD *)(v17 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v19 == 0;
}

- (id)_assetURIStringsForPhotos:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("objectID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("URIRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("absoluteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  id v26;
  char v27;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL v31;
  BOOL v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v13 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
    LOBYTE(v36) = v13;
    if (v13)
    {
      v14 = _os_activity_create(&dword_199DF7000, "PLXPC Client: updateThumbnailsForPhotos:assignNewIndex:forceRefresh:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      v15 = (void *)*((_QWORD *)&v36 + 1);
      *((_QWORD *)&v36 + 1) = v14;

      os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v37 + 8));
    }
    -[PLAssetsdLibraryClient _assetURIStringsForPhotos:](self, "_assetURIStringsForPhotos:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke;
    v34[3] = &unk_1E376C3A8;
    v35 = v12;
    v24[0] = v18;
    v24[1] = 3254779904;
    v24[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_2;
    v24[3] = &unk_1E3767438;
    v27 = v36;
    v28 = *((id *)&v36 + 1);
    v29 = v37;
    v30 = v38;
    v31 = a2;
    v19 = v16;
    v25 = v19;
    v32 = a4;
    v33 = a5;
    v26 = v35;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:handler:", v34, v24);

    if ((_BYTE)v36)
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
    if ((_QWORD)v37)
    {
      PLRequestGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = v37;
      if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        Name = sel_getName(*((SEL *)&v38 + 1));
        *(_DWORD *)buf = 136446210;
        v40 = Name;
        _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
      }

    }
  }

}

- (BOOL)synchronouslyUpdateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *Name;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *v29;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v7 = a5;
  v8 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v32) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyUpdateThumbnailsForPhotos:assignNewIndex:forceRefresh:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  PLRequestGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v16 = os_signpost_id_generate(v15);
  *(_QWORD *)&v33 = v16;
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  -[PLAssetsdLibraryClient _assetURIStringsForPhotos:](self, "_assetURIStringsForPhotos:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __99__PLAssetsdLibraryClient_synchronouslyUpdateThumbnailsForPhotos_assignNewIndex_forceRefresh_error___block_invoke;
  v31[3] = &unk_1E376C420;
  v31[4] = &buf;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:", v20, v8, v7, &__block_literal_global_34);

  v23 = *((_QWORD *)&buf + 1);
  if (a6)
  {
    v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v24)
    {
      *a6 = objc_retainAutorelease(v24);
      v23 = *((_QWORD *)&buf + 1);
    }
  }
  v25 = *(_QWORD *)(v23 + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v29 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v25 == 0;
}

- (void)automaticallyDeleteEmptyAlbumWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id v24;
  __int128 v25;
  __int128 v26;
  SEL v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  SEL sel[2];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: automaticallyDeleteEmptyAlbumWithObjectID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke;
  v28[3] = &unk_1E376C3A8;
  v29 = v8;
  v20[0] = v13;
  v20[1] = 3254779904;
  v20[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_2;
  v20[3] = &unk_1E3767198;
  v23 = v30;
  v24 = *((id *)&v30 + 1);
  v25 = v31;
  v26 = *(_OWORD *)sel;
  v27 = a2;
  v14 = v7;
  v21 = v14;
  v15 = v29;
  v22 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:handler:", v28, v20);

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  __int128 v30;
  __int128 v31;
  SEL v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v35) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: publishRemoteChangeEvent:delayedSaveActionsDetail:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke;
  v33[3] = &unk_1E376C3A8;
  v34 = v11;
  v24[0] = v16;
  v24[1] = 3254779904;
  v24[2] = __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke_2;
  v24[3] = &unk_1E37675F8;
  v28 = v35;
  v29 = *((id *)&v35 + 1);
  v30 = v36;
  v31 = v37;
  v32 = a2;
  v17 = v9;
  v25 = v17;
  v18 = v10;
  v26 = v18;
  v19 = v34;
  v27 = v19;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:handler:", v33, v24);

  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(*((SEL *)&v37 + 1));
      *(_DWORD *)buf = 136446210;
      v39 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: transferAssetsWithUuids:fromLibraryURL:transferOptions:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __99__PLAssetsdLibraryClient_transferAssetsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke;
  v27[3] = &unk_1E376C3A8;
  v18 = v13;
  v28 = v18;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v11);
  objc_msgSend(v19, "transferAssetsWithUuids:fromLibraryURL:transferOptions:reply:", v10, v20, v12, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v21;
}

- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: transferPersonsWithUuids:fromLibraryURL:transferOptions:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __100__PLAssetsdLibraryClient_transferPersonsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke;
  v27[3] = &unk_1E376C3A8;
  v18 = v13;
  v28 = v18;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v11);
  objc_msgSend(v19, "transferPersonsWithUuids:fromLibraryURL:transferOptions:reply:", v10, v20, v12, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v21;
}

- (id)proxyLockFileWithDatabasePath:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  SEL sel[2];
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: proxyLockFileWithDatabasePath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke;
  v23[3] = &unk_1E376C420;
  v23[4] = &v24;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke_39;
  v22[3] = &unk_1E3768A58;
  v22[4] = &buf;
  objc_msgSend(v12, "proxyLockFileWithDatabasePath:reply:", v6, v22);

  v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v14 = (id)v25[5];
  v15 = v14;
  if (!v13 && a4)
    *a4 = objc_retainAutorelease(v14);

  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&buf, 8);
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
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16;
}

- (void)searchDonationProgressForTaskIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  SEL sel[2];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: searchDonationProgressForTaskIDs:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v12;
  v23 = 3221225472;
  v24 = __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke_2;
  v25 = &unk_1E3768578;
  v14 = v7;
  v26 = v14;
  objc_msgSend(v13, "searchDonationProgressForTaskIDs:reply:", v6, &v22);
  if (v14 && !v13)
  {
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46502, v22, v23, v24, v25);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v16;

      v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v14 + 2))(v14, 0, 0, 0, v15);
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
}

void __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[PLAssetsdLibraryClient proxyLockFileWithDatabasePath:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke_39(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __100__PLAssetsdLibraryClient_transferPersonsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__PLAssetsdLibraryClient_transferAssetsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 56))
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
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "publishRemoteChangeEvent:delayedSaveActionsDetail:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v16 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "URIRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_35;
  v12[3] = &unk_1E376C3F8;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "automaticallyDeleteEmptyAlbumWithObjectURI:reply:", v11, v12);

}

uint64_t __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__PLAssetsdLibraryClient_synchronouslyUpdateThumbnailsForPhotos_assignNewIndex_forceRefresh_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v18 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(unsigned __int8 *)(a1 + 104);
  v12 = *(unsigned __int8 *)(a1 + 105);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_32;
  v14[3] = &unk_1E376C0E0;
  v13 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:", v13, v11, v12, v14);

}

uint64_t __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }

}

void __50__PLAssetsdLibraryClient_recoverFromCrashIfNeeded__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "recoverFromCrashIfNeeded");

}

uint64_t __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __77__PLAssetsdLibraryClient_synchronouslyImportFileSystemAssetsForce_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__PLAssetsdLibraryClient_getPhotoLibraryStoreXPCListenerEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "Received XPC store endpoint %p", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_consumeSandboxExtensions:", v5) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 44003, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.photos.error")))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 != 43002)
      goto LABEL_13;
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v13 = objc_msgSend(v8, "code");

      if (v13 == 4097)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v20[0] = *MEMORY[0x1E0CB2938];
        v20[1] = v11;
        v21[0] = CFSTR("migration interrupted");
        v21[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46008, v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
      }
    }
    else
    {

    }
  }

LABEL_13:
  if (v7)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "proxyFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postOpenProgressWithReply:", &__block_literal_global_14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (!v12)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v5;
    v9 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_consumeSandboxExtensions:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 44003, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
LABEL_5:

  }
}

void __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }

}

void __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke_5(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke(uint64_t a1, void *a2)
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
    v4 = 136446466;
    v5 = "-[PLAssetsdLibraryClient isLibraryReadyForImportWithError:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke(uint64_t a1, void *a2)
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
    v4 = 136446466;
    v5 = "-[PLAssetsdLibraryClient getCurrentModelVersion]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __39__PLAssetsdLibraryClient_launchAssetsd__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

@end
