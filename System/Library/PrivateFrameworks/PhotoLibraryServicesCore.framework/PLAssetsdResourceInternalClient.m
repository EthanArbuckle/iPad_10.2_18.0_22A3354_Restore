@implementation PLAssetsdResourceInternalClient

- (void)prewarmWithCapturePhotoSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLGatekeeperXPCGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Sending prewarm with PLCapturePhotoSettings: %@", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_22;
  v12[3] = &unk_1E376BF48;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_9306, v12);

}

- (void)batchSaveAssetsWithJobDictionaries:(id)a3 completionHandler:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  const char *Name;
  void *v28;
  void *context;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  char v36;
  id v37;
  __int128 v38;
  __int128 v39;
  SEL v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  SEL sel[2];
  uint8_t buf[4];
  _BYTE v51[14];
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v48 = 0u;
  *(_OWORD *)sel = 0u;
  v47 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v47) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: batchSaveAssetsWithJobDictionaries:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v47 + 1);
    *((_QWORD *)&v47 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v48 + 8));
  }
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceInternalClient.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  context = (void *)MEMORY[0x19AEC2E4C]();
  PLGatekeeperXPCGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v51 = v10;
    _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Sending batchSaveAssetsWithJobDictionaries:completionHander: with %d jobs", buf, 8u);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        PLGatekeeperXPCGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v13 >= 11)
        {
          if (v18)
          {
            v21 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v51 = v21 - v13;
            _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEFAULT, "  [...and %d more]", buf, 8u);
          }

          goto LABEL_21;
        }
        if (v18)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("JobType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CreatedAssetUUID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = v13;
          *(_WORD *)&v51[4] = 2114;
          *(_QWORD *)&v51[6] = v19;
          v52 = 2114;
          v53 = v20;
          _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEFAULT, "  [job-%d] type %{public}@ uuid %{public}@", buf, 0x1Cu);

          ++v13;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_21:

  pl_dispatch_once(&PLIsCamera_didCheck, &__block_literal_global_60_3388);
  if (!PLIsCamera_isCamera
    || !_os_feature_enabled_impl()
    || !-[PLAssetsdResourceInternalClient handlePhotoKitIngestJobs:withCompletionHandler:](self, "handlePhotoKitIngestJobs:withCompletionHandler:", v11, v32))
  {
    -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke;
    v41[3] = &unk_1E376C3A8;
    v42 = v32;
    v33[0] = v23;
    v33[1] = 3254779904;
    v33[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_11;
    v33[3] = &unk_1E37672B0;
    v36 = v47;
    v37 = *((id *)&v47 + 1);
    v38 = v48;
    v39 = *(_OWORD *)sel;
    v40 = a2;
    v34 = v11;
    v35 = v42;
    objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:handler:", v41, v33);

  }
  objc_autoreleasePoolPop(context);
  if ((_BYTE)v47)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v48 + 8));
  if ((_QWORD)v48)
  {
    PLRequestGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v48;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v51 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)requestMasterThumbnailForAssetUUID:(id)a3 completionHandler:(id)a4
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
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: requestMasterThumbnailForAssetUUID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceInternalClient.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke;
  v29[3] = &unk_1E376C3A8;
  v30 = v8;
  v21[0] = v13;
  v21[1] = 3254779904;
  v21[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_2;
  v21[3] = &unk_1E37672B0;
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

- (BOOL)handlePhotoKitIngestJobs:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, id, void *);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, id, void *))a4;
  v7 = objc_alloc_init(NSClassFromString((NSString *)CFSTR("PHAssetCreationRequestBridge")));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "executeCreationRequestWithBatchJobDictionaries:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSuccess");
    objc_msgSend(v9, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, v5, v11);

  }
  return v8 != 0;
}

- (void)prewarmWithCapturePhotoSettings:(id)a3
{
  -[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:completionHandler:](self, "prewarmWithCapturePhotoSettings:completionHandler:", a3, 0);
}

- (BOOL)prewarmWithCapturePhotoSettings:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9300;
  v21 = __Block_byref_object_dispose__9301;
  v22 = 0;
  PLGatekeeperXPCGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_DEFAULT, "Sending prewarm with PLCapturePhotoSettings: %@", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke;
  v16[3] = &unk_1E376BED8;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke_20;
  v15[3] = &unk_1E376BF00;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v10, "prewarmWithCapturePhotoSettings:reply:", v6, v15);

  LODWORD(v10) = *((unsigned __int8 *)v24 + 24);
  v11 = (id)v18[5];
  v12 = v11;
  if (!(_DWORD)v10 && a4)
    *a4 = objc_retainAutorelease(v11);

  v13 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void)cancelAllPrewarming
{
  -[PLAssetsdResourceInternalClient cancelAllPrewarmingWithCompletionHandler:](self, "cancelAllPrewarmingWithCompletionHandler:", 0);
}

- (BOOL)cancelAllPrewarming:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9300;
  v20 = __Block_byref_object_dispose__9301;
  v21 = 0;
  PLGatekeeperXPCGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel all prewarming", buf, 2u);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke;
  v14[3] = &unk_1E376BED8;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke_24;
  v13[3] = &unk_1E376BF00;
  v13[4] = &v22;
  v13[5] = &v16;
  objc_msgSend(v8, "cancelAllPrewarmingWithReply:", v13);

  LODWORD(v8) = *((unsigned __int8 *)v23 + 24);
  v9 = (id)v17[5];
  v10 = v9;
  if (!(_DWORD)v8 && a3)
    *a3 = objc_retainAutorelease(v9);

  v11 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  PLGatekeeperXPCGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel all prewarming", buf, 2u);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_26;
  v8[3] = &unk_1E376BF90;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:handler:", &__block_literal_global_25_9296, v8);

}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E376C3F8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "cancelAllPrewarmingWithReply:", v3);

}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdResourceInternalClient cancelAllPrewarmingWithCompletionHandler:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[PLAssetsdResourceInternalClient cancelAllPrewarmingWithCompletionHandler:]_block_invoke_2";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceInternalClient cancelAllPrewarming:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke_24(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[PLAssetsdResourceInternalClient cancelAllPrewarming:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEBUG, "Sending PLCapturePhotoSettings over proxy: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_23;
  v6[3] = &unk_1E376C3F8;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prewarmWithCapturePhotoSettings:reply:", v5, v6);

}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:completionHandler:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:completionHandler:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

uint64_t __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  id v14;
  uint8_t buf[4];
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v17 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_16;
  v12[3] = &unk_1E376BEB0;
  v13 = v11;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "asynchronousMasterThumbnailForAssetUUID:reply:", v13, v12);

}

void __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_16(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v10;
      v13 = 2080;
      v14 = "-[PLAssetsdResourceInternalClient requestMasterThumbnailForAssetUUID:completionHandler:]_block_invoke";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Error getting master thumbnail %@ for %s: %@", (uint8_t *)&v11, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PLAssetsdResourceInternalClient batchSaveAssetsWithJobDictionaries:completionHandler:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB3388];
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41002, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_11(uint64_t a1, void *a2)
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
  v12[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_13;
  v12[3] = &unk_1E376C158;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "batchSaveAssetJobs:reply:", v11, v12);

}

uint64_t __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
