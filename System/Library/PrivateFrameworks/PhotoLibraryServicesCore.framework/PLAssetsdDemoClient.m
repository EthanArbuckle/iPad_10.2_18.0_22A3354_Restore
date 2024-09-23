@implementation PLAssetsdDemoClient

- (void)cleanupForStoreDemoModeWithCompletion:(id)a3
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
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: cleanupForStoreDemoModeWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdDemoClient.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v25 = v5;
  v17[0] = v10;
  v17[1] = 3254779904;
  v17[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_7;
  v17[3] = &unk_1E3767A68;
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

- (BOOL)cleanupForStoreDemoMode:(id *)a3
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
    v6 = _os_activity_create(&dword_199DF7000, "PLXPC Client: cleanupForStoreDemoMode:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1441;
  v29 = __Block_byref_object_dispose__1442;
  v30 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke;
  v18[3] = &unk_1E376BED8;
  v18[4] = &v19;
  v18[5] = &buf;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke_13;
  v17[3] = &unk_1E376BF00;
  v17[4] = &v19;
  v17[5] = &buf;
  objc_msgSend(v10, "cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:", v17);

  v11 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v11 = *((unsigned __int8 *)v20 + 24);
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
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

- (BOOL)hasCompletedRestorePostProcessing:(BOOL *)a3 error:(id *)a4
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
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: hasCompletedRestorePostProcessing:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdDemoClient.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1441;
  v36 = __Block_byref_object_dispose__1442;
  v37 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke;
  v29[3] = &unk_1E376C420;
  v29[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke_16;
  v28[3] = &__block_descriptor_40_e8_v12__0B8l;
  v28[4] = a3;
  objc_msgSend(v18, "hasCompletedRestorePostProcessingWithReply:", v28);

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

- (BOOL)hasCompletedMomentAnalysis:(BOOL *)a3 error:(id *)a4
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
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v30) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: hasCompletedMomentAnalysis:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdDemoClient.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1441;
  v36 = __Block_byref_object_dispose__1442;
  v37 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke;
  v29[3] = &unk_1E376C420;
  v29[4] = &buf;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke_19;
  v28[3] = &__block_descriptor_40_e8_v12__0B8l;
  v28[4] = a3;
  objc_msgSend(v18, "hasCompletedMomentAnalysisWithReply:", v28);

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

void __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdDemoClient hasCompletedMomentAnalysis:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke_19(uint64_t result, char a2)
{
  **(_BYTE **)(result + 32) = a2;
  return result;
}

void __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdDemoClient hasCompletedRestorePostProcessing:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke_16(uint64_t result, char a2)
{
  **(_BYTE **)(result + 32) = a2;
  return result;
}

void __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdDemoClient cleanupForStoreDemoMode:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke_13(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdDemoClient cleanupForStoreDemoModeWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_7(uint64_t a1, void *a2)
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
  v11[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_10;
  v11[3] = &unk_1E376C3F8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:", v11);

}

uint64_t __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
