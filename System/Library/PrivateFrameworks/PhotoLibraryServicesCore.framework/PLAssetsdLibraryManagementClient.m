@implementation PLAssetsdLibraryManagementClient

- (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4
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
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v26[5];
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
  v7 = a3;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setSystemPhotoLibraryURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v33 = __Block_byref_object_copy__4782;
  v34 = __Block_byref_object_dispose__4783;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:](PLAutoBindingProxyFactory, "clientToServiceSandboxExtensionForURL:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke_2;
  v26[3] = &unk_1E376C420;
  v26[4] = &buf;
  objc_msgSend(v18, "setSystemPhotoLibraryURL:sandboxExtension:options:reply:", v7, v19, 2 * (v7 == 0), v26);

  v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20 == 0;
}

- (BOOL)removePhotoLibraryURL:(id)a3 error:(id *)a4
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
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v26[5];
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
  v7 = a3;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: removePhotoLibraryURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v33 = __Block_byref_object_copy__4782;
  v34 = __Block_byref_object_dispose__4783;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:](PLAutoBindingProxyFactory, "clientToServiceSandboxExtensionForURL:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke_2;
  v26[3] = &unk_1E376C420;
  v26[4] = &buf;
  objc_msgSend(v18, "setSystemPhotoLibraryURL:sandboxExtension:options:reply:", v7, v19, 2, v26);

  v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20 == 0;
}

- (BOOL)closeAndDeletePhotoLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4782;
  v19 = __Block_byref_object_dispose__4783;
  v20 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke;
  v14[3] = &unk_1E376BED8;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke_2;
  v13[3] = &unk_1E376BF00;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "closeAndDeletePhotoLibraryAtURL:reply:", v6, v13);

  v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = objc_retainAutorelease((id)v16[5]);
    v10 = *((unsigned __int8 *)v22 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (BOOL)closePhotoLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4782;
  v19 = __Block_byref_object_dispose__4783;
  v20 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke;
  v14[3] = &unk_1E376BED8;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke_2;
  v13[3] = &unk_1E376BF00;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "closePhotoLibraryAtURL:reply:", v6, v13);

  v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = objc_retainAutorelease((id)v16[5]);
    v10 = *((unsigned __int8 *)v22 + 24);
  }
  v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (BOOL)overrideSystemPhotoLibraryURL:(id)a3 error:(id *)a4
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: overrideSystemPhotoLibraryURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v30 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
    v16 = 1;
  else
    v16 = 3;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4782;
  v35 = __Block_byref_object_dispose__4783;
  v36 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:](PLAutoBindingProxyFactory, "clientToServiceSandboxExtensionForURL:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke_2;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v19, "setSystemPhotoLibraryURL:sandboxExtension:options:reply:", v7, v20, v16, v27);

  v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (a4 && v21)
  {
    *a4 = objc_retainAutorelease(v21);
    v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

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
      v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21 == 0;
}

- (id)activePhotoLibraries:(id *)a3
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
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *v22;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v32) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: activePhotoLibraries:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v34 + 1) = a2;
  v10 = os_signpost_id_generate(v9);
  *(_QWORD *)&v33 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(*((SEL *)&v34 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4782;
  v38 = __Block_byref_object_dispose__4783;
  v39 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4782;
  v30 = __Block_byref_object_dispose__4783;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__PLAssetsdLibraryManagementClient_activePhotoLibraries___block_invoke;
  v25[3] = &unk_1E376C420;
  v25[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __57__PLAssetsdLibraryManagementClient_activePhotoLibraries___block_invoke_2;
  v24[3] = &unk_1E3769F90;
  v24[4] = &v26;
  v24[5] = &buf;
  objc_msgSend(v16, "getActivePhotoLibrariesWithReply:", v24);

  if (a3)
  {
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v17)
      *a3 = objc_retainAutorelease(v17);
  }
  v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v22 = sel_getName(*((SEL *)&v34 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v18;
}

- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4
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
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v25[4];
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
  SEL sel[2];
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v35) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getPhotoLibraryURLsWithLibraryURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  PLRequestGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v13 = os_signpost_id_generate(v12);
  *(_QWORD *)&v36 = v13;
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v39 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke;
  v33[3] = &unk_1E376C3A8;
  v34 = v8;
  v25[0] = v18;
  v25[1] = 3254779904;
  v25[2] = __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_9;
  v25[3] = &unk_1E37672E8;
  v28 = v35;
  v29 = *((id *)&v35 + 1);
  v30 = v36;
  v31 = *(_OWORD *)sel;
  v32 = a2;
  v19 = v7;
  v26 = v19;
  v20 = v34;
  v27 = v20;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:handler:", v33, v25);

  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v39 = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)resetSyndicationLibrary:(id *)a3
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
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resetSyndicationLibrary:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v30 = __Block_byref_object_copy__4782;
  v31 = __Block_byref_object_dispose__4783;
  v32 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke;
  v24[3] = &unk_1E376C420;
  v24[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke_2;
  v23[3] = &unk_1E376C630;
  v23[4] = &buf;
  objc_msgSend(v16, "resetSyndicationLibraryWithReply:", v23);

  v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v17 && a3)
    *a3 = objc_retainAutorelease(v17);
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

- (BOOL)getPhotosXPCEndpoint:(id *)a3 error:(id *)a4
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
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v26[7];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  __int128 v39;
  SEL sel[2];
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  *(_OWORD *)sel = 0u;
  v38 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v38) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getPhotosXPCEndpoint:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v38 + 1);
    *((_QWORD *)&v38 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v39 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v39 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4782;
  v44 = __Block_byref_object_dispose__4783;
  v45 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4782;
  v32 = __Block_byref_object_dispose__4783;
  v33 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdLibraryManagementClient_getPhotosXPCEndpoint_error___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __63__PLAssetsdLibraryManagementClient_getPhotosXPCEndpoint_error___block_invoke_13;
  v26[3] = &unk_1E3769FB8;
  v26[4] = &v34;
  v26[5] = &v28;
  v26[6] = &buf;
  objc_msgSend(v18, "getPhotosXPCEndpointWithReply:", v26);

  if (!a4 || (v19 = *(void **)(*((_QWORD *)&buf + 1) + 40)) == 0)
  {
    v19 = (void *)v29[5];
    a4 = a3;
  }
  *a4 = objc_retainAutorelease(v19);
  v20 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v34, 8);
  if ((_BYTE)v38)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v39 + 8));
  if ((_QWORD)v39)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v39;
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20 != 0;
}

- (void)filesystemSizeForLibraryURL:(id)a3 result:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  _QWORD v25[9];
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a4;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v45) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: filesystemSizeForLibraryURL:result:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v45 + 1);
    *((_QWORD *)&v45 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v46 + 8));
  }
  PLRequestGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v47 + 1) = a2;
  v13 = os_signpost_id_generate(v12);
  *(_QWORD *)&v46 = v13;
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(*((SEL *)&v47 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__4782;
  v51 = __Block_byref_object_dispose__4783;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke;
  v26[3] = &unk_1E376C268;
  v19 = v7;
  v27 = v19;
  p_buf = &buf;
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke_15;
  v25[3] = &unk_1E3769FE0;
  v25[4] = &buf;
  v25[5] = &v41;
  v25[6] = &v37;
  v25[7] = &v33;
  v25[8] = &v29;
  objc_msgSend(v20, "filesystemSizeForLibraryURL:reply:", v19, v25);

  v8[2](v8, v42[3], v38[3], v34[3], v30[3], *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v45)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v46 + 8));
  if ((_QWORD)v46)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v46;
    if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(*((SEL *)&v47 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (id)photoLibraryIdentifierForPhotoLibraryURL:(id)a3 error:(id *)a4
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
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  const char *v27;
  _QWORD v29[4];
  id v30;
  __int128 *p_buf;
  uint64_t *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 v40;
  __int128 v41;
  SEL sel[2];
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v41 = 0u;
  *(_OWORD *)sel = 0u;
  v40 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v40) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: photoLibraryIdentifierForPhotoLibraryURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v40 + 1);
    *((_QWORD *)&v40 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v41 = v12;
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
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4782;
  v46 = __Block_byref_object_dispose__4783;
  v47 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4782;
  v38 = __Block_byref_object_dispose__4783;
  v39 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke;
  v33[3] = &unk_1E376C420;
  v33[4] = &v34;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_17;
  v29[3] = &unk_1E376A008;
  p_buf = &buf;
  v19 = v7;
  v30 = v19;
  v32 = &v34;
  objc_msgSend(v18, "getPhotoLibraryIdentifierWithLibraryURL:reply:", v19, v29);

  v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v21 = (id)v35[5];
  v22 = v21;
  if (!v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v40)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  if ((_QWORD)v41)
  {
    PLRequestGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      v27 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v27;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v23;
}

- (id)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4
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
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *v26;
  _QWORD v28[6];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v36) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v36 + 1);
    *((_QWORD *)&v36 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v37 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v38 + 1) = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v37 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v38 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4782;
  v42 = __Block_byref_object_dispose__4783;
  v43 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4782;
  v34 = __Block_byref_object_dispose__4783;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke;
  v29[3] = &unk_1E376C420;
  v29[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke_19;
  v28[3] = &unk_1E376A030;
  v28[4] = &v30;
  v28[5] = &buf;
  objc_msgSend(v18, "findPhotoLibraryIdentifiersMatchingSearchCriteria:reply:", v7, v28);

  v19 = v31[5];
  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v21 = v20;
  if (!v19 && a4)
    *a4 = objc_retainAutorelease(v20);

  v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v36)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
  if ((_QWORD)v37)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v37;
    if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = sel_getName(*((SEL *)&v38 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v22;
}

- (id)createManagedPhotoLibraryWithOptions:(id)a3 error:(id *)a4
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  const char *v31;
  _QWORD v33[6];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v41) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: createManagedPhotoLibraryWithOptions:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v41 + 1);
    *((_QWORD *)&v41 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v43 + 1) = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v42 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v43 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4782;
  v47 = __Block_byref_object_dispose__4783;
  v48 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4782;
  v39 = __Block_byref_object_dispose__4783;
  v40 = 0;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsBundleURLKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsTestOptionsKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PLInternalTestOptionsPhotoLibraryDomainRootURLKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v16;
  if (v16 || (v19 = v18) != 0)
  {
    +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:](PLAutoBindingProxyFactory, "clientToServiceSandboxExtensionForURL:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke;
  v34[3] = &unk_1E376C420;
  v34[4] = &buf;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke_21;
  v33[3] = &unk_1E376C2E0;
  v33[4] = &v35;
  v33[5] = &buf;
  objc_msgSend(v23, "createManagedPhotoLibraryWithOptions:sandboxExtension:reply:", v7, v20, v33);

  v24 = v36[5];
  v25 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v26 = v25;
  if (!v24 && a4)
    *a4 = objc_retainAutorelease(v25);

  v27 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v41)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  if ((_QWORD)v42)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      v31 = sel_getName(*((SEL *)&v43 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v27;
}

void __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryManagementClient createManagedPhotoLibraryWithOptions:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
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

void __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryManagementClient findPhotoLibraryIdentifiersMatchingSearchCriteria:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
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

void __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryManagementClient photoLibraryIdentifierForPhotoLibraryURL:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_17(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Error getting photo library identifier for url %@: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }

}

void __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting filesystem size for libraryURL %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke_15(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12;
  id v13;

  v12 = a6;
  if (v12)
  {
    v13 = v12;
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a6);
    v12 = v13;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a5;
  }

}

void __63__PLAssetsdLibraryManagementClient_getPhotosXPCEndpoint_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdLibraryManagementClient getPhotosXPCEndpoint:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __63__PLAssetsdLibraryManagementClient_getPhotosXPCEndpoint_error___block_invoke_13(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    objc_msgSend(a3, "_endpoint");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "Error getting photos XPC endpoint: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }

}

void __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke_2(uint64_t a1, char a2, void *a3)
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

void __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdLibraryManagementClient getPhotoLibraryURLsWithLibraryURL:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_9(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "getPhotoLibraryURLsWithLibraryURL:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__PLAssetsdLibraryManagementClient_activePhotoLibraries___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__PLAssetsdLibraryManagementClient_activePhotoLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "code") == 4099
    && (objc_msgSend(v6, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v4,
        v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    if (objc_msgSend(v5, "code") != 41026
      || (objc_msgSend(v6, "domain"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.photos.error")),
          v7,
          !v8))
    {
      v9 = 0;
      goto LABEL_7;
    }
    NSLog((NSString *)CFSTR("Ignoring filesystem deletion error (probably files still in use by photoanalysisd): %@"), v6);

    v6 = 0;
  }
  v9 = 1;
LABEL_7:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

void __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "code") == 4099
    && (objc_msgSend(v6, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v4,
        v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
