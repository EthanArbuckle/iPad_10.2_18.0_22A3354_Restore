@implementation PLAssetsdResourceAvailabilityClient

- (id)sendMakeResourceAvailableRequest:(id)a3 reply:(id)a4
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
  _QWORD v22[4];
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
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendMakeResourceAvailableRequest:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v13 = v7;
  v25 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke_1;
  v22[3] = &unk_1E37689B8;
  v15 = v13;
  v23 = v15;
  objc_msgSend(v14, "makeResourceAvailableWithRequest:reply:", v6, v22);
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

- (void)sendMakeResourceUnavailableRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  char v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendMakeResourceUnavailableRequest:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory", (_QWORD)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unboostingRemoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeResourceUnavailableWithRequest:", v4);

  if (v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)sendVideoRequest:(id)a3 reply:(id)a4
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
  _QWORD v22[4];
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
    v9 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendVideoRequest:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke;
  v24[3] = &unk_1E376C3A8;
  v13 = v7;
  v25 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke_3;
  v22[3] = &unk_1E37689E0;
  v15 = v13;
  v23 = v15;
  objc_msgSend(v14, "runVideoRequest:reply:", v6, v22);
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

- (id)sendResourceRepairRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendResourceRepairRequest:errorCodes:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke;
  v27[3] = &unk_1E376C3A8;
  v16 = v10;
  v28 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke_5;
  v25[3] = &unk_1E376C3F8;
  v18 = v16;
  v26 = v18;
  objc_msgSend(v17, "appyCorrectionsToResourceWithRequest:errorCodes:reply:", v8, v9, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v19;
}

- (id)sendResourceRepairRequestForAsset:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v29) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendResourceRepairRequestForAsset:errorCodes:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke;
  v27[3] = &unk_1E376C3A8;
  v16 = v10;
  v28 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke_7;
  v25[3] = &unk_1E376C3F8;
  v18 = v16;
  v26 = v18;
  objc_msgSend(v17, "appyCorrectionsToAssetWithRequest:errorCodes:reply:", v8, v9, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v19;
}

- (void)setSharedMemoryForCacheMetricsCollector:(id)a3
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
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: setSharedMemoryForCacheMetricsCollector:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceAvailabilityClient.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedData"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3254779904;
  v16[2] = __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke_14;
  v16[3] = &unk_1E3767BB8;
  v18 = v23;
  v19 = *((id *)&v23 + 1);
  v20 = v24;
  v21 = *(_OWORD *)sel;
  v22 = a2;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_1485, v16);

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

void __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke_14(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "initializeSharedMemoryForCacheMetricsCollector:", *(_QWORD *)(a1 + 32));

}

void __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[PLAssetsdResourceAvailabilityClient setSharedMemoryForCacheMetricsCollector:]_block_invoke";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  PLCacheMetricsCollectorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[PLAssetsdResourceAvailabilityClient setSharedMemoryForCacheMetricsCollector:]_block_invoke";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

}

void __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceAvailabilityClient sendResourceRepairRequestForAsset:errorCodes:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceAvailabilityClient sendResourceRepairRequest:errorCodes:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceAvailabilityClient sendVideoRequest:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceAvailabilityClient sendMakeResourceAvailableRequest:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
