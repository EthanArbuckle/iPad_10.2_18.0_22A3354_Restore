@implementation PLAssetsdDiagnosticsClient

- (void)setPhotosXPCEndpoint:(id)a3 completionHandler:(id)a4
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
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  id v31;
  __int128 v32;
  __int128 v33;
  SEL v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  SEL sel[2];
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38 = 0u;
  *(_OWORD *)sel = 0u;
  v37 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v37) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setPhotosXPCEndpoint:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v37 + 1);
    *((_QWORD *)&v37 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  PLRequestGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v13 = os_signpost_id_generate(v12);
  *(_QWORD *)&v38 = v13;
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v41 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdDiagnosticsClient.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

  }
  v17 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
  objc_msgSend(v17, "_setEndpoint:", v7);
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke;
  v35[3] = &unk_1E376C3A8;
  v36 = v8;
  v27[0] = v19;
  v27[1] = 3254779904;
  v27[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_12;
  v27[3] = &unk_1E3767208;
  v30 = v37;
  v31 = *((id *)&v37 + 1);
  v32 = v38;
  v33 = *(_OWORD *)sel;
  v34 = a2;
  v20 = v17;
  v28 = v20;
  v21 = v36;
  v29 = v21;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:handler:", v35, v27);

  if ((_BYTE)v37)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  if ((_QWORD)v38)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v41 = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)incompleteRestoreProcesses:(id *)a3 error:(id *)a4
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
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  SEL sel[2];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v35) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: incompleteRestoreProcesses:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  PLRequestGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v12 = os_signpost_id_generate(v11);
  *(_QWORD *)&v36 = v12;
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
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdDiagnosticsClient.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processes"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__10030;
  v41 = __Block_byref_object_dispose__10031;
  v42 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10030;
  v33 = __Block_byref_object_dispose__10031;
  v34 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke_7;
  v27[3] = &unk_1E376C308;
  v27[4] = &v29;
  objc_msgSend(v18, "incompleteRestoreProcessesWithReply:", v27);

  v19 = (void *)v30[5];
  if (v19 || a4 && (v19 = *(void **)(*((_QWORD *)&buf + 1) + 40), a3 = a4, v19))
    *a3 = objc_retainAutorelease(v19);
  v20 = v30[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&buf, 8);
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
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v20 != 0;
}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[PLAssetsdDiagnosticsClient setPhotosXPCEndpoint:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_12(uint64_t a1, void *a2)
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
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_15;
  v12[3] = &unk_1E376C3F8;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setPhotosXPCEndpoint:withReply:", v11, v12);

}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Error setting photos XPC endpoint: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdDiagnosticsClient incompleteRestoreProcesses:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
