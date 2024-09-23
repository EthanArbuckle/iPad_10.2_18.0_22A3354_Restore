@implementation PLAssetsdSystemLibraryURLReadOnlyClient

- (id)systemPhotoLibraryURLWithError:(id *)a3
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
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: systemPhotoLibraryURLWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v37 = __Block_byref_object_copy__9991;
  v38 = __Block_byref_object_dispose__9992;
  v39 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9991;
  v30 = __Block_byref_object_dispose__9992;
  v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke;
  v25[3] = &unk_1E376C420;
  v25[4] = &v26;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke_2;
  v24[3] = &unk_1E376C2E0;
  v24[4] = &buf;
  v24[5] = &v26;
  objc_msgSend(v16, "systemPhotoLibraryURL:", v24);

  if (a3)
  {
    v17 = (void *)v27[5];
    if (v17)
      *a3 = objc_retainAutorelease(v17);
  }
  v18 = *(id *)(*((_QWORD *)&buf + 1) + 40);
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

void __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

@end
