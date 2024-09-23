@implementation PLAssetsdLibraryInternalClient

- (void)getAssetCountsWithReply:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  char v18;
  id v19;
  __int128 v20;
  __int128 v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getAssetCountsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke;
  v23[3] = &unk_1E376C3A8;
  v24 = v5;
  v16[0] = v10;
  v16[1] = 3254779904;
  v16[2] = __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke_2;
  v16[3] = &unk_1E3767B48;
  v18 = v25;
  v19 = *((id *)&v25 + 1);
  v20 = v26;
  v21 = v27;
  v22 = a2;
  v11 = v24;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", v23, v16);

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getLibrarySizesFromDB:(BOOL)a3 completionHandler:(id)a4
{
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  void *v18;
  _QWORD v19[4];
  id v20;
  char v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getLibrarySizesFromDB:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke;
  v27[3] = &unk_1E376C3A8;
  v28 = v7;
  v19[0] = v12;
  v19[1] = 3254779904;
  v19[2] = __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke_2;
  v19[3] = &unk_1E3767BF0;
  v21 = v29;
  v22 = *((id *)&v29 + 1);
  v23 = v30;
  v24 = v31;
  v25 = a2;
  v26 = a3;
  v13 = v28;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:handler:", v27, v19);

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)synchronouslyGetLibrarySizesFromDB:(BOOL)a3 sizes:(id *)a4 error:(id *)a5
{
  _BOOL8 v7;
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
  int v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *v26;
  void *v28;
  _QWORD v29[7];
  BOOL v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v7 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v10 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v42) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyGetLibrarySizesFromDB:sizes:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v42 + 1);
    *((_QWORD *)&v42 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v43 + 8));
  }
  PLRequestGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v44 + 1) = a2;
  v14 = os_signpost_id_generate(v13);
  *(_QWORD *)&v43 = v14;
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(*((SEL *)&v44 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes"));

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3102;
  v48 = __Block_byref_object_dispose__3103;
  v49 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3102;
  v36 = __Block_byref_object_dispose__3103;
  v37 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke;
  v31[3] = &unk_1E376C420;
  v31[4] = &buf;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke_2;
  v29[3] = &unk_1E37696F8;
  v29[4] = &v32;
  v29[5] = &v38;
  v30 = v7;
  v29[6] = &buf;
  objc_msgSend(v20, "getLibrarySizesFromDB:reply:", v7, v29);

  if (*((_BYTE *)v39 + 24))
    *a4 = objc_retainAutorelease((id)v33[5]);
  if (a5)
  {
    v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v21)
      *a5 = objc_retainAutorelease(v21);
  }
  v22 = *((unsigned __int8 *)v39 + 24);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v38, 8);
  if ((_BYTE)v42)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v43 + 8));
  if ((_QWORD)v43)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v43;
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = sel_getName(*((SEL *)&v44 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v22 != 0;
}

- (BOOL)synchronouslyGetSizeOfResourcesToUploadByCPL:(int64_t *)a3 error:(id *)a4
{
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  SEL sel[2];
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  *(_OWORD *)sel = 0u;
  v37 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v37) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyGetSizeOfResourcesToUploadByCPL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v37 + 1);
    *((_QWORD *)&v37 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v38 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size"));

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3102;
  v43 = __Block_byref_object_dispose__3103;
  v44 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -1;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke_2;
  v27[3] = &unk_1E3769720;
  v27[4] = &v29;
  v27[5] = &v33;
  v27[6] = &buf;
  objc_msgSend(v18, "getSizeOfResourcesToUploadByCPLWithReply:", v27);

  v19 = *((unsigned __int8 *)v34 + 24);
  if (*((_BYTE *)v34 + 24))
    *a3 = v30[3];
  if (a4)
  {
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v20)
    {
      *a4 = objc_retainAutorelease(v20);
      v19 = *((unsigned __int8 *)v34 + 24);
    }
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v33, 8);
  if ((_BYTE)v37)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  if ((_QWORD)v38)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v19 != 0;
}

- (void)updateAssetLocationDataWithUUID:(id)a3 completionHandler:(id)a4
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
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  SEL v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v32) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: updateAssetLocationDataWithUUID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke;
  v30[3] = &unk_1E376C3A8;
  v31 = v8;
  v22[0] = v13;
  v22[1] = 3254779904;
  v22[2] = __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke_2;
  v22[3] = &unk_1E3767278;
  v25 = v32;
  v26 = *((id *)&v32 + 1);
  v27 = v33;
  v28 = v34;
  v29 = a2;
  v14 = v7;
  v23 = v14;
  v15 = v31;
  v24 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:handler:", v30, v22);

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v34 + 1));
      *(_DWORD *)buf = 136446210;
      v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)repairMemoriesWithUUIDs:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *v25;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
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
  v7 = a3;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: repairMemoriesWithUUIDs:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v31 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryUUIDs"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3102;
  v36 = __Block_byref_object_dispose__3103;
  v37 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke;
  v29[3] = &unk_1E376C420;
  v29[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke_2;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v18, "repairMemoriesWithUUIDs:reply:", v7, v28);

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

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21 == 0;
}

- (void)reloadMomentGenerationOptions
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
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: reloadMomentGenerationOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

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
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3188);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadMomentGenerationOptions");

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

- (void)markPersonAsNeedingKeyFace:(id)a3 completionHandler:(id)a4
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
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  SEL v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v32) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: markPersonAsNeedingKeyFace:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke;
  v30[3] = &unk_1E376C3A8;
  v31 = v8;
  v22[0] = v13;
  v22[1] = 3254779904;
  v22[2] = __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke_2;
  v22[3] = &unk_1E3767278;
  v25 = v32;
  v26 = *((id *)&v32 + 1);
  v27 = v33;
  v28 = v34;
  v29 = a2;
  v14 = v7;
  v23 = v14;
  v15 = v31;
  v24 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:handler:", v30, v22);

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v34 + 1));
      *(_DWORD *)buf = 136446210;
      v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)synchronouslyMarkPersonAsNeedingKeyFace:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v33) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: synchronouslyMarkPersonAsNeedingKeyFace:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v33 + 1);
    *((_QWORD *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v35 + 1) = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v34 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3102;
  v39 = __Block_byref_object_dispose__3103;
  v40 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke_2;
  v27[3] = &unk_1E376BF00;
  v27[4] = &v29;
  v27[5] = &buf;
  objc_msgSend(v18, "markPersonAsNeedingKeyFaceWithPersonUUID:reply:", v7, v27);

  if (a4)
  {
    v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v19)
      *a4 = objc_retainAutorelease(v19);
  }
  v20 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v29, 8);
  if ((_BYTE)v33)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  if ((_QWORD)v34)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20 != 0;
}

- (void)getSearchIndexProgress:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *Name;
  void *v15;
  _QWORD v16[4];
  id v17;
  char v18;
  id v19;
  __int128 v20;
  __int128 v21;
  SEL v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getSearchIndexProgress:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3254779904;
  v16[2] = __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke_26;
  v16[3] = &unk_1E3767B48;
  v18 = v23;
  v19 = *((id *)&v23 + 1);
  v20 = v24;
  v21 = *(_OWORD *)sel;
  v22 = a2;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_25, v16);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)waitForSearchIndexExistenceWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: waitForSearchIndexExistenceWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3102;
  v30 = __Block_byref_object_dispose__3103;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke;
  v19[3] = &unk_1E376C420;
  v19[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke_27;
  v18[3] = &unk_1E376BF00;
  v18[4] = &buf;
  v18[5] = &v20;
  objc_msgSend(v10, "waitForSearchIndexExistenceWithReply:", v18);

  if (a3)
  {
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12 != 0;
}

- (void)resumeSearchIndexingWithCompletionHandler:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  void *v16;
  _QWORD v17[4];
  id v18;
  char v19;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resumeSearchIndexingWithCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v25 = v5;
  v17[0] = v10;
  v17[1] = 3254779904;
  v17[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_28;
  v17[3] = &unk_1E3767B48;
  v19 = v26;
  v20 = *((id *)&v26 + 1);
  v21 = v27;
  v22 = v28;
  v23 = a2;
  v11 = v25;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", v24, v17);

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)pauseSearchIndexingWithCompletionHandler:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  void *v16;
  _QWORD v17[4];
  id v18;
  char v19;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: pauseSearchIndexingWithCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v25 = v5;
  v17[0] = v10;
  v17[1] = 3254779904;
  v17[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_30;
  v17[3] = &unk_1E3767B48;
  v19 = v26;
  v20 = *((id *)&v26 + 1);
  v21 = v27;
  v22 = v28;
  v23 = a2;
  v11 = v25;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", v24, v17);

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)applySearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  __int128 v35;
  __int128 v36;
  SEL v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  SEL sel[2];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v42 = 0u;
  *(_OWORD *)sel = 0u;
  v41 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v41) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: applySearchIndexGraphUpdates:supportingData:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v41 + 1);
    *((_QWORD *)&v41 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphUpdates"));

  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (char *)v40;
  if (!v15)
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v16;
      _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "Couldn't archive supportingData dictionary for search graph update with archiver error: %{public}@", buf, 0xCu);
    }

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke;
  v38[3] = &unk_1E376C3A8;
  v39 = v11;
  v29[0] = v19;
  v29[1] = 3254779904;
  v29[2] = __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke_2;
  v29[3] = &unk_1E37676D8;
  v33 = v41;
  v34 = *((id *)&v41 + 1);
  v35 = v42;
  v36 = *(_OWORD *)sel;
  v37 = a2;
  v20 = v9;
  v30 = v20;
  v21 = v15;
  v31 = v21;
  v22 = v39;
  v32 = v22;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:handler:", v38, v29);

  if ((_BYTE)v41)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  if ((_QWORD)v42)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v45 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)setKeywords:(id)a3 forAssetWithUUID:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *v23;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  __int128 buf;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setKeywords:forAssetWithUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  PLRequestGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v13 = os_signpost_id_generate(v12);
  *(_QWORD *)&v27 = v13;
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x2020000000;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36_3155);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke_37;
  v25[3] = &unk_1E376A578;
  v25[4] = &buf;
  objc_msgSend(v18, "setAssetKeywords:forAssetUUID:reply:", v7, v8, v25);

  v19 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v19 != 0;
}

- (BOOL)invalidateReverseLocationDataOnAllAssetsWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: invalidateReverseLocationDataOnAllAssetsWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3102;
  v30 = __Block_byref_object_dispose__3103;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke;
  v19[3] = &unk_1E376BED8;
  v19[4] = &buf;
  v19[5] = &v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke_39;
  v18[3] = &unk_1E376BF00;
  v18[4] = &buf;
  v18[5] = &v20;
  objc_msgSend(v10, "invalidateReverseLocationDataOnAllAssetsWithReply:", v18);

  if (a3)
  {
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v20, 8);
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12 != 0;
}

- (BOOL)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: registerBackgroundJobServiceIfNecessaryOnLibraryPath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryPath"));

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3102;
  v34 = __Block_byref_object_dispose__3103;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke;
  v23[3] = &unk_1E376C420;
  v23[4] = &buf;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke_42;
  v22[3] = &unk_1E376BF00;
  v22[4] = &v24;
  v22[5] = &buf;
  objc_msgSend(v13, "registerBackgroundJobServiceIfNecessaryOnLibraryPath:reply:", v7, v22);

  if (a4)
  {
    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v14)
      *a4 = objc_retainAutorelease(v14);
  }
  v15 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v24, 8);
  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v30 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v15 != 0;
}

- (unint64_t)getBackgroundJobServiceStateWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getBackgroundJobServiceStateWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3102;
  v30 = __Block_byref_object_dispose__3103;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke;
  v19[3] = &unk_1E376C420;
  v19[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke_43;
  v18[3] = &unk_1E376A6E0;
  v18[4] = &v20;
  objc_msgSend(v10, "getBackgroundJobServiceStateWithReply:", v18);

  if (a3)
  {
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = v21[3];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v20, 8);
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12;
}

- (id)getBackgroundJobServiceStatusCenterDumpWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getBackgroundJobServiceStatusCenterDumpWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3102;
  v32 = __Block_byref_object_dispose__3103;
  v33 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3102;
  v24 = __Block_byref_object_dispose__3103;
  v25 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke;
  v19[3] = &unk_1E376C420;
  v19[4] = &v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke_45;
  v18[3] = &unk_1E3769788;
  v18[4] = &buf;
  objc_msgSend(v10, "getBackgroundJobServiceStatusCenterDumpWithReply:", v18);

  if (a3)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12;
}

- (id)getBackgroundJobServiceBundlesInQueueDictionaryWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getBackgroundJobServiceBundlesInQueueDictionaryWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3102;
  v32 = __Block_byref_object_dispose__3103;
  v33 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3102;
  v24 = __Block_byref_object_dispose__3103;
  v25 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke;
  v19[3] = &unk_1E376C420;
  v19[4] = &v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke_47;
  v18[3] = &unk_1E3769788;
  v18[4] = &buf;
  objc_msgSend(v10, "getBackgroundJobServiceBundlesInQueueDictionaryWithReply:", v18);

  if (a3)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12;
}

- (BOOL)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3102;
  v24 = __Block_byref_object_dispose__3103;
  v25 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__PLAssetsdLibraryInternalClient_backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet___block_invoke;
  v17[3] = &unk_1E376C420;
  v17[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet");

  if (a3 && (v10 = *(void **)(*((_QWORD *)&buf + 1) + 40)) != 0)
  {
    v11 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = 1;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v11;
}

- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  char v18;
  id v19;
  __int128 v20;
  __int128 v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: deleteiTunesSyncedContentWithCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E376C3A8;
  v24 = v5;
  v16[0] = v10;
  v16[1] = 3254779904;
  v16[2] = __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke_48;
  v16[3] = &unk_1E3767B48;
  v18 = v25;
  v19 = *((id *)&v25 + 1);
  v20 = v26;
  v21 = v27;
  v22 = a2;
  v11 = v24;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", v23, v16);

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)invalidateBehavioralScoreOnAllAssetsWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: invalidateBehavioralScoreOnAllAssetsWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3102;
  v30 = __Block_byref_object_dispose__3103;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke;
  v19[3] = &unk_1E376BED8;
  v19[4] = &buf;
  v19[5] = &v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke_49;
  v18[3] = &unk_1E376BF00;
  v18[4] = &buf;
  v18[5] = &v20;
  objc_msgSend(v10, "invalidateBehavioralScoreOnAllAssetsWithReply:", v18);

  if (a3)
  {
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v20, 8);
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12 != 0;
}

- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  __int128 v35;
  __int128 v36;
  SEL v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v42) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v42 + 1);
    *((_QWORD *)&v42 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v43 + 8));
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuids"));

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationIdentifier"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke;
  v40[3] = &unk_1E376C3A8;
  v41 = v13;
  v29[0] = v18;
  v29[1] = 3254779904;
  v29[2] = __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2;
  v29[3] = &unk_1E3767940;
  v33 = v42;
  v34 = *((id *)&v42 + 1);
  v35 = v43;
  v36 = v44;
  v37 = a2;
  v19 = v11;
  v30 = v19;
  v20 = v12;
  v31 = v20;
  v21 = *(_OWORD *)&a5->var0[4];
  v38 = *(_OWORD *)a5->var0;
  v39 = v21;
  v22 = v41;
  v32 = v22;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:handler:", v40, v29);

  if ((_BYTE)v42)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v43 + 8));
  if ((_QWORD)v43)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v43;
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(*((SEL *)&v44 + 1));
      *(_DWORD *)buf = 136446210;
      v46 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
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
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  id v25;
  __int128 v26;
  __int128 v27;
  SEL v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v31) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resetLimitedLibraryAccessForApplication:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdLibraryInternalClient.m"), 430, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationIdentifier"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
  v29[3] = &unk_1E376C3A8;
  v30 = v8;
  v21[0] = v13;
  v21[1] = 3254779904;
  v21[2] = __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke_2;
  v21[3] = &unk_1E3767278;
  v24 = v31;
  v25 = *((id *)&v31 + 1);
  v26 = v32;
  v27 = v33;
  v28 = a2;
  v14 = v7;
  v22 = v14;
  v15 = v30;
  v23 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:handler:", v29, v21);

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  char v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL v25;
  CGFloat v26;
  CGFloat v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  height = a3.height;
  width = a3.width;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setWidgetTimelineGeneratedForDisplaySize:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke;
  v28[3] = &unk_1E376C3A8;
  v29 = v8;
  v19[0] = v13;
  v19[1] = 3254779904;
  v19[2] = __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke_2;
  v19[3] = &unk_1E37674A8;
  v21 = v30;
  v22 = *((id *)&v30 + 1);
  v23 = v31;
  v24 = v32;
  v25 = a2;
  v26 = width;
  v27 = height;
  v14 = v29;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:handler:", v28, v19);

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *Name;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v23) = v12;
  if (v12)
  {
    *((_QWORD *)&v23 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: forceRunBackgroundJobsOnLibraryPath:criteriaShortCode:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  PLRequestGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v27 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_56_3129);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "forceRunBackgroundJobsOnLibraryPath:criteriaShortCode:completionHandler:", v9, v10, v11);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if (v14)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v22 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = v22;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3
{
  id v5;
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
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: coreAnalyticsLibrarySummaryDataWithCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

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
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_57_3126);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coreAnalyticsLibrarySummaryDataWithCompletionHandler:", v5);

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

- (BOOL)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 error:(id *)a4
{
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *v25;
  _QWORD v27[6];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v33) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: processIdenticalDuplicatesWithProcessingType:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v33 + 1);
    *((_QWORD *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v35 + 1) = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v34 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3102;
  v39 = __Block_byref_object_dispose__3103;
  v40 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke_58;
  v27[3] = &unk_1E376BF00;
  v27[4] = &v29;
  v27[5] = &buf;
  objc_msgSend(v18, "processIdenticalDuplicatesWithProcessingType:reply:", a3, v27);

  LODWORD(v16) = *((unsigned __int8 *)v30 + 24);
  v19 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v20 = v19;
  if (!(_DWORD)v16 && a4)
    *a4 = objc_retainAutorelease(v19);

  v21 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v29, 8);
  if ((_BYTE)v33)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  if ((_QWORD)v34)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21 != 0;
}

- (BOOL)checkAssetsArePendingForDuplicateMergeProcessing:(id)a3
{
  id v5;
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
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: checkAssetsArePendingForDuplicateMergeProcessing:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v24 = v10;
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
  v27 = 0x2020000000;
  v28 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_59_3120);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke_60;
  v22[3] = &unk_1E376A578;
  v22[4] = &buf;
  objc_msgSend(v15, "assetsArePendingForDuplicateMergeProcessing:reply:", v5, v22);

  v16 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16 != 0;
}

- (void)mergeDuplicateAssetUuidSelection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v24) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: mergeDuplicateAssetUuidSelection:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke;
  v22[3] = &unk_1E376C3A8;
  v23 = v7;
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke_2;
  v19[3] = &unk_1E3769810;
  v13 = v6;
  v20 = v13;
  v14 = v23;
  v21 = v14;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:handler:", v22, v19);

  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)metricsForLibraryAtURL:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v34) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: metricsForLibraryAtURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v34 + 1);
    *((_QWORD *)&v34 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v36 + 1) = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v35 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v36 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3102;
  v40 = __Block_byref_object_dispose__3103;
  v41 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3102;
  v32 = __Block_byref_object_dispose__3103;
  v33 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke_2;
  v26[3] = &unk_1E376A510;
  v26[4] = &v28;
  v26[5] = &buf;
  objc_msgSend(v18, "metricsForLibraryAtURL:reply:", v7, v26);

  v19 = (void *)v29[5];
  if (!v19)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v19 = (void *)v29[5];
    }
    else
    {
      v19 = 0;
    }
  }
  v20 = v19;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v34)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  if ((_QWORD)v35)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(*((SEL *)&v36 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20;
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  __int128 v32;
  __int128 v33;
  SEL v34;
  unint64_t v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  SEL sel[2];
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v39 = 0u;
  *(_OWORD *)sel = 0u;
  v38 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v38) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: insertEmbeddings:modelType:assetUUID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v38 + 1);
    *((_QWORD *)&v38 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v39 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke;
  v36[3] = &unk_1E376C3A8;
  v37 = v13;
  v26[0] = v18;
  v26[1] = 3254779904;
  v26[2] = __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke_2;
  v26[3] = &unk_1E37662D0;
  v30 = v38;
  v31 = *((id *)&v38 + 1);
  v32 = v39;
  v33 = *(_OWORD *)sel;
  v34 = a2;
  v19 = v11;
  v27 = v19;
  v35 = a4;
  v20 = v12;
  v28 = v20;
  v21 = v37;
  v29 = v21;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:handler:", v36, v26);

  if ((_BYTE)v38)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v39 + 8));
  if ((_QWORD)v39)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v39;
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completionHandler:(id)a5
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
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: deleteEmbeddings:assetUUID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke;
  v33[3] = &unk_1E376C3A8;
  v34 = v11;
  v24[0] = v16;
  v24[1] = 3254779904;
  v24[2] = __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke_2;
  v24[3] = &unk_1E37676D8;
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

- (id)featureProcessingSnapshotWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: featureProcessingSnapshotWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3102;
  v31 = __Block_byref_object_dispose__3103;
  v32 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3102;
  v23 = __Block_byref_object_dispose__3103;
  v24 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke;
  v18[3] = &unk_1E376C420;
  v18[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke_64;
  v17[3] = &unk_1E376A510;
  v17[4] = &buf;
  v17[5] = &v19;
  objc_msgSend(v10, "featureProcessingSnapshotWithReply:", v17);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v11;
}

- (id)availabilityStateShouldPersist:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v5 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v27) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: availabilityStateShouldPersist:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3102;
  v33 = __Block_byref_object_dispose__3103;
  v34 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3102;
  v25 = __Block_byref_object_dispose__3103;
  v26 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke;
  v20[3] = &unk_1E376C420;
  v20[4] = &buf;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke_65;
  v19[3] = &unk_1E376A510;
  v19[4] = &buf;
  v19[5] = &v21;
  objc_msgSend(v12, "availabilityStateShouldPersist:reply:", v5, v19);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v13;
}

- (BOOL)clearAvailabilityStateWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: clearAvailabilityStateWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3102;
  v29 = __Block_byref_object_dispose__3103;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke;
  v18[3] = &unk_1E376C420;
  v18[4] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke_66;
  v17[3] = &unk_1E376BF00;
  v17[4] = &buf;
  v17[5] = &v19;
  objc_msgSend(v10, "clearAvailabilityWithReply:", v17);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v11 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v25 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v11 != 0;
}

- (BOOL)signalAvailabilityStateDidChangeWithError:(id *)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: signalAvailabilityStateDidChangeWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3102;
  v29 = __Block_byref_object_dispose__3103;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke;
  v18[3] = &unk_1E376BED8;
  v18[4] = &buf;
  v18[5] = &v19;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke_67;
  v17[3] = &unk_1E376BF00;
  v17[4] = &v19;
  v17[5] = &buf;
  objc_msgSend(v10, "signalAvailabilityStateDidChangeWithReply:", v17);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v11 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v11 != 0;
}

void __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[PLAssetsdLibraryInternalClient signalAvailabilityStateDidChangeWithError:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke_67(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient clearAvailabilityStateWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke_66(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient availabilityStateShouldPersist:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Failed to produced availability snapshot, error: %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = a1 + 32;
  }
  else
  {
    v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), a3);

}

void __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient featureProcessingSnapshotWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Failed to produced processing snapshot, error: %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = a1 + 32;
  }
  else
  {
    v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), a3);

}

uint64_t __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "deleteEmbeddings:assetUUID:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "insertEmbeddings:modelType:assetUUID:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mergeDuplicateAssetUuidSelection:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke_60(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient checkAssetsArePendingForDuplicateMergeProcessing:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient processIdenticalDuplicatesWithProcessingType:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke_58(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __87__PLAssetsdLibraryInternalClient_coreAnalyticsLibrarySummaryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient coreAnalyticsLibrarySummaryDataWithCompletionHandler:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __106__PLAssetsdLibraryInternalClient_forceRunBackgroundJobsOnLibraryPath_criteriaShortCode_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient forceRunBackgroundJobsOnLibraryPath:criteriaShortCode:completionHandler:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 40))
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
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "setWidgetTimelineGeneratedForDisplaySize:completionHandler:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 96), *(double *)(a1 + 104));

}

uint64_t __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "resetLimitedLibraryAccessForApplication:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  __int128 v14;
  _OWORD v15[2];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
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
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15[0]) = 138543362;
      *(_QWORD *)((char *)v15 + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)v15, 0xCu);

    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 128);
  v15[0] = *(_OWORD *)(a1 + 112);
  v15[1] = v14;
  objc_msgSend(v3, "setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", v11, v12, v15, v13);

}

void __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[PLAssetsdLibraryInternalClient invalidateBehavioralScoreOnAllAssetsWithError:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke_49(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[PLAssetsdLibraryInternalClient deleteiTunesSyncedContentWithCompletionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke_48(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 40))
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
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "deleteiTunesSyncedContentWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

void __94__PLAssetsdLibraryInternalClient_backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceBundlesInQueueDictionaryWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke_47(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceStatusCenterDumpWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke_45(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceStateWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke_43(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient registerBackgroundJobServiceIfNecessaryOnLibraryPath:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke_42(uint64_t a1, int a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[PLAssetsdLibraryInternalClient invalidateReverseLocationDataOnAllAssetsWithError:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke_39(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

uint64_t __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke_37(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient setKeywords:forAssetWithUUID:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "applyGraphUpdates:supportingData:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[PLAssetsdLibraryInternalClient pauseSearchIndexingWithCompletionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v15 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_31;
  v11[3] = &unk_1E376C3F8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "pauseSearchIndexingWithReply:", v11);

}

uint64_t __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[PLAssetsdLibraryInternalClient resumeSearchIndexingWithCompletionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v15 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_29;
  v11[3] = &unk_1E376C3F8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "resumeSearchIndexingWithReply:", v11);

}

uint64_t __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryInternalClient waitForSearchIndexExistenceWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke_27(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
  {
    PLSearchBackendIndexStatusGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Error waiting for search index existence: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke_26(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 40))
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
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "getSearchIndexProgressWithReply:", *(_QWORD *)(a1 + 32));

}

void __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient getSearchIndexProgress:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

uint64_t __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "markPersonAsNeedingKeyFaceWithPersonUUID:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63__PLAssetsdLibraryInternalClient_reloadMomentGenerationOptions__block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdLibraryInternalClient reloadMomentGenerationOptions]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

uint64_t __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "updateAssetLocationDataWithUUID:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke_2(_QWORD *a1, int a2, uint64_t a3, void *a4)
{
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Error getting size of resources to upload by CPL, error: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }

}

void __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(unsigned __int8 *)(a1 + 56);
      v12[0] = 67109378;
      v12[1] = v11;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Error getting library sizes fromDB: %d, error: %@", (uint8_t *)v12, 0x12u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  }

}

uint64_t __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 40))
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
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "getLibrarySizesFromDB:reply:", *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 32));

}

uint64_t __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke_2(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 40))
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
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(v3, "getAssetCountsWithReply:", *(_QWORD *)(a1 + 32));

}

@end
