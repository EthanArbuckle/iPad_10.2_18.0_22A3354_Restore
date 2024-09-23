@implementation PLAssetsdResourceClient

- (PLAssetsdResourceClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  PLAssetsdResourceClient *v5;
  PLAssetJobExecutor *v6;
  PLAssetJobExecutor *creationRequestBridge;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdResourceClient;
  v5 = -[PLAssetsdBaseClient initWithQueue:proxyCreating:proxyGetter:](&v9, sel_initWithQueue_proxyCreating_proxyGetter_, a3, a4, a5);
  if (v5)
  {
    pl_dispatch_once(&PLIsCamera_didCheck, &__block_literal_global_60_3388);
    if (PLIsCamera_isCamera
      || (pl_dispatch_once(&PLIsNebulad_didCheck, &__block_literal_global_95), PLIsNebulad_isNebulad))
    {
      if (_os_feature_enabled_impl())
      {
        v6 = (PLAssetJobExecutor *)objc_alloc_init(NSClassFromString((NSString *)CFSTR("PHAssetCreationRequestBridge")));
        creationRequestBridge = v5->_creationRequestBridge;
        v5->_creationRequestBridge = v6;

      }
    }
  }
  return v5;
}

- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  PLAssetJobExecutor *creationRequestBridge;
  char v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  const char *Name;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;
  id v42;
  __int128 v43;
  __int128 v44;
  SEL v45;
  __IOSurface *v46;
  __IOSurface *v47;
  _QWORD v48[4];
  id v49;
  __IOSurface *v50;
  __IOSurface *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v13 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v52) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199DF7000, "PLXPC Client: saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v52 + 1);
    *((_QWORD *)&v52 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v53 + 8));
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v16 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kPLImageWriterPhotoIrisMediaGroupUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("JobType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("VideoJob"));

  }
  else
  {
    v19 = 0;
  }

  creationRequestBridge = self->_creationRequestBridge;
  if (creationRequestBridge)
    v21 = v19;
  else
    v21 = 1;
  if ((v21 & 1) != 0)
  {
    PLGatekeeperXPCGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("JobType"));
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CreatedAssetUUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v23;
      v57 = 2114;
      v58 = v24;
      _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_DEFAULT, "Sending saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHander: with job type %{public}@ uuid %{public}@", buf, 0x16u);

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("callStack"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      PLGatekeeperXPCGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = v27;
        v57 = 2112;
        v58 = v25;
        _os_log_impl(&dword_199DF7000, v26, OS_LOG_TYPE_DEFAULT, "##### %@ %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _PLJobLogDictionary(v11, 0, v28);

    }
    if (a4)
      CFRetain(a4);
    if (a5)
      CFRetain(a5);
    -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke;
    v48[3] = &unk_1E376C350;
    v50 = a4;
    v51 = a5;
    v49 = v12;
    v38[0] = v30;
    v38[1] = 3254779904;
    v38[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_14;
    v38[3] = &unk_1E37677F0;
    v41 = v52;
    v42 = *((id *)&v52 + 1);
    v43 = v53;
    v44 = v54;
    v45 = a2;
    v39 = v11;
    v46 = a4;
    v47 = a5;
    v40 = v49;
    objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:handler:", v48, v38);

    v31 = v49;
  }
  else
  {
    -[PLAssetJobExecutor executeCreationRequestWithJobDict:previewImageSurface:](creationRequestBridge, "executeCreationRequestWithJobDict:previewImageSurface:", v11, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v25, "isSuccess");
    objc_msgSend(v25, "error");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, id, id))v12 + 2))(v12, v32, v11, v31);
  }

  objc_autoreleasePoolPop(v16);
  if ((_BYTE)v52)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v53 + 8));
  if ((_QWORD)v53)
  {
    PLRequestGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = v53;
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      Name = sel_getName(*((SEL *)&v54 + 1));
      *(_DWORD *)buf = 136446210;
      v56 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v34, OS_SIGNPOST_INTERVAL_END, v35, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)addGroupWithName:(id)a3 completionHandler:(id)a4
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
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: addGroupWithName:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke;
  v29[3] = &unk_1E376C3A8;
  v30 = v8;
  v21[0] = v13;
  v21[1] = 3254779904;
  v21[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_21;
  v21[3] = &unk_1E37671D0;
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

- (void)addAssetWithURL:(id)a3 toAlbumWithUUID:(id)a4 completionHandler:(id)a5
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
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  char v31;
  id v32;
  __int128 v33;
  __int128 v34;
  SEL v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v38) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: addAssetWithURL:toAlbumWithUUID:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v38 + 1);
    *((_QWORD *)&v38 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v39 + 8));
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetURL"));

  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumUUID"));

  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke;
  v36[3] = &unk_1E376C3A8;
  v37 = v11;
  v27[0] = v16;
  v27[1] = 3254779904;
  v27[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_29;
  v27[3] = &unk_1E3767630;
  v31 = v38;
  v32 = *((id *)&v38 + 1);
  v33 = v39;
  v34 = v40;
  v35 = a2;
  v17 = v9;
  v28 = v17;
  v18 = v10;
  v29 = v18;
  v19 = v37;
  v30 = v19;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:handler:", v36, v27);

  if ((_BYTE)v38)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v39 + 8));
  if ((_QWORD)v39)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v39;
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(*((SEL *)&v40 + 1));
      *(_DWORD *)buf = 136446210;
      v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)fileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6
{
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
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *v28;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  SEL sel[2];
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v8 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v45 = 0u;
  *(_OWORD *)sel = 0u;
  v44 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v44) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: fileURLForAssetURL:withAdjustments:fileURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  PLRequestGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v16 = os_signpost_id_generate(v15);
  *(_QWORD *)&v45 = v16;
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("withAdjustments"));

  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outFileURL"));

  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__10083;
  v50 = __Block_byref_object_dispose__10084;
  v51 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10083;
  v38 = __Block_byref_object_dispose__10084;
  v39 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke;
  v33[3] = &unk_1E376C420;
  v33[4] = &buf;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_37;
  v32[3] = &unk_1E376C448;
  v32[4] = &v34;
  v32[5] = &v40;
  v32[6] = &buf;
  objc_msgSend(v22, "filePathForPersistentURL:withAdjustments:reply:", v11, v8, v32);

  if (*((_BYTE *)v41 + 24))
    *a5 = objc_retainAutorelease((id)v35[5]);
  if (a6)
  {
    v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v23)
      *a6 = objc_retainAutorelease(v23);
  }
  v24 = *((unsigned __int8 *)v41 + 24);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v40, 8);
  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v24 != 0;
}

- (BOOL)sandboxExtensionFileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6
{
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
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *v28;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  SEL sel[2];
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v8 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v45 = 0u;
  *(_OWORD *)sel = 0u;
  v44 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v44) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sandboxExtensionFileURLForAssetURL:withAdjustments:fileURL:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  PLRequestGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v16 = os_signpost_id_generate(v15);
  *(_QWORD *)&v45 = v16;
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("withAdjustments"));

  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outFileURL"));

  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__10083;
  v50 = __Block_byref_object_dispose__10084;
  v51 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10083;
  v38 = __Block_byref_object_dispose__10084;
  v39 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke;
  v33[3] = &unk_1E376C420;
  v33[4] = &buf;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_39;
  v32[3] = &unk_1E376C470;
  v32[4] = &v34;
  v32[5] = &v40;
  v32[6] = &buf;
  objc_msgSend(v22, "sandboxExtensionURLForPersistentURL:withAdjustments:reply:", v11, v8, v32);

  if (*((_BYTE *)v41 + 24))
    *a5 = objc_retainAutorelease((id)v35[5]);
  if (a6)
  {
    v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v23)
      *a6 = objc_retainAutorelease(v23);
  }
  v24 = *((unsigned __int8 *)v41 + 24);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v40, 8);
  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v24 != 0;
}

- (BOOL)fileDescriptorForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileExtension:(id *)a5 fileDescriptor:(int *)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *Name;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  const char *v30;
  void *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v10 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v46) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v46 + 1);
    *((_QWORD *)&v46 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v47 + 8));
  }
  PLRequestGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v48 + 1) = a2;
  v18 = os_signpost_id_generate(v17);
  *(_QWORD *)&v47 = v18;
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    Name = sel_getName(*((SEL *)&v48 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetURL"));

  }
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outFileDescriptor"));

  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__10083;
  v52 = __Block_byref_object_dispose__10084;
  v53 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10083;
  v40 = __Block_byref_object_dispose__10084;
  v41 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke;
  v35[3] = &unk_1E376C420;
  v35[4] = &buf;
  objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v23;
  v34[1] = 3221225472;
  v34[2] = __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke_44;
  v34[3] = &unk_1E376C498;
  v34[4] = &v36;
  v34[5] = &v42;
  v34[6] = &buf;
  v34[7] = a6;
  objc_msgSend(v24, "fileDescriptorForPersistentURL:withAdjustments:reply:", v13, v10, v34);

  if (a5 && *((_BYTE *)v43 + 24))
    *a5 = objc_retainAutorelease((id)v37[5]);
  if (a7)
  {
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v25)
      *a7 = objc_retainAutorelease(v25);
  }
  v26 = *((unsigned __int8 *)v43 + 24);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v42, 8);
  if ((_BYTE)v46)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v47 + 8));
  if ((_QWORD)v47)
  {
    PLRequestGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = v47;
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      v30 = sel_getName(*((SEL *)&v48 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v30;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v26 != 0;
}

- (BOOL)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageData:(id *)a9 outImageDataInfo:(id *)a10 outCPLDownloadContext:(id *)a11 error:(id *)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL4 v15;
  unsigned __int16 v16;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *Name;
  _BOOL8 v27;
  PLImageDataInfo *v28;
  _BOOL8 v29;
  _BOOL8 v30;
  PLCPLDownloadContext *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  PLImageDataInfo *v35;
  PLCPLDownloadContext *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  const char *v43;
  unsigned __int16 v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  PLImageDataInfo *v49;
  PLCPLDownloadContext *v50;
  uint64_t *v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  _QWORD v55[5];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v12 = a8;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  v19 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v62) = v19;
  if (v19)
  {
    v20 = _os_activity_create(&dword_199DF7000, "PLXPC Client: imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageData:outImageDataInfo:outCPLDownloadContext:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v21 = (void *)*((_QWORD *)&v62 + 1);
    *((_QWORD *)&v62 + 1) = v20;

    os_activity_scope_enter(v20, (os_activity_scope_state_t)((char *)&v63 + 8));
  }
  PLRequestGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v64 + 1) = a2;
  v23 = os_signpost_id_generate(v22);
  *(_QWORD *)&v63 = v23;
  v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    Name = sel_getName(*((SEL *)&v64 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__10083;
  v68 = __Block_byref_object_dispose__10084;
  v69 = 0;
  objc_msgSend(v47, "URIRepresentation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v16;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__10083;
  v60 = __Block_byref_object_dispose__10084;
  v61 = 0;
  v27 = v14;
  if (a10)
  {
    v28 = objc_alloc_init(PLImageDataInfo);
    v29 = v13;
  }
  else
  {
    v29 = v13;
    v28 = 0;
  }
  v30 = v12;
  if (a11)
    v31 = objc_alloc_init(PLCPLDownloadContext);
  else
    v31 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke;
  v55[3] = &unk_1E376C420;
  v55[4] = &buf;
  objc_msgSend(v32, "synchronousRemoteObjectProxyWithErrorHandler:", v55);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v33;
  v48[1] = 3221225472;
  v48[2] = __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke_48;
  v48[3] = &unk_1E376C4C0;
  v35 = v28;
  v49 = v35;
  v36 = v31;
  v52 = v29;
  v53 = v30;
  v54 = a9 != 0;
  v50 = v36;
  v51 = &v56;
  objc_msgSend(v34, "imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:", v46, v45, v15, v27, v29, v30, v48);

  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (a9)
      *a9 = objc_retainAutorelease((id)v57[5]);
    if (a10)
      *a10 = objc_retainAutorelease(v35);
    if (a11)
      *a11 = objc_retainAutorelease(v36);
  }
  v37 = *((_QWORD *)&buf + 1);
  if (a12)
  {
    v38 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v38)
    {
      *a12 = objc_retainAutorelease(v38);
      v37 = *((_QWORD *)&buf + 1);
    }
  }
  v39 = *(_QWORD *)(v37 + 40);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v62)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v63 + 8));
  if ((_QWORD)v63)
  {
    PLRequestGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v42 = v63;
    if ((unint64_t)(v63 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      v43 = sel_getName(*((SEL *)&v64 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v41, OS_SIGNPOST_INTERVAL_END, v42, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v39 == 0;
}

- (void)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionHandler:(id)a9
{
  id v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  char v34;
  id v35;
  __int128 v36;
  __int128 v37;
  SEL v38;
  int v39;
  BOOL v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v16 = a9;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v17 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v46) = v17;
  if (v17)
  {
    v18 = _os_activity_create(&dword_199DF7000, "PLXPC Client: imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v19 = (void *)*((_QWORD *)&v46 + 1);
    *((_QWORD *)&v46 + 1) = v18;

    os_activity_scope_enter(v18, (os_activity_scope_state_t)((char *)&v47 + 8));
  }
  objc_msgSend(v29, "URIRepresentation", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke;
  v44[3] = &unk_1E376C3A8;
  v45 = v16;
  v31[0] = v22;
  v31[1] = 3254779904;
  v31[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_50;
  v31[3] = &unk_1E3767518;
  v34 = v46;
  v35 = *((id *)&v46 + 1);
  v36 = v47;
  v37 = v48;
  v38 = a2;
  v23 = v20;
  v32 = v23;
  v39 = a4;
  v40 = a5;
  v41 = a6;
  v42 = a7;
  v43 = a8;
  v24 = v45;
  v33 = v24;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:handler:", v44, v31);

  if ((_BYTE)v46)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v47 + 8));
  if ((_QWORD)v47)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v47;
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(*((SEL *)&v48 + 1));
      *(_DWORD *)buf = 136446210;
      v50 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)sandboxExtensionsForAssetWithUUID:(id)a3 sandboxExtensionTokens:(id *)a4 error:(id *)a5
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
  int v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *v26;
  void *v28;
  void *v29;
  _QWORD v30[7];
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
  SEL sel[2];
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v43 = 0u;
  *(_OWORD *)sel = 0u;
  v42 = 0u;
  v10 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v42) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v42 + 1);
    *((_QWORD *)&v42 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v43 + 8));
  }
  PLRequestGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v14 = os_signpost_id_generate(v13);
  *(_QWORD *)&v43 = v14;
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUID"));

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathToTokenMap"));

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__10083;
  v48 = __Block_byref_object_dispose__10084;
  v49 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__10083;
  v36 = __Block_byref_object_dispose__10084;
  v37 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke;
  v31[3] = &unk_1E376C420;
  v31[4] = &buf;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke_57;
  v30[3] = &unk_1E376C510;
  v30[4] = &v32;
  v30[5] = &v38;
  v30[6] = &buf;
  objc_msgSend(v20, "getSandboxExtensionsForAssetWithUUID:reply:", v9, v30);

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
      v26 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v22 != 0;
}

- (BOOL)sandboxExtensionForFileSystemBookmark:(id)a3 bookmarkURL:(id *)a4 sandboxExtensionToken:(id *)a5 error:(id *)a6
{
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
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v52) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sandboxExtensionForFileSystemBookmark:bookmarkURL:sandboxExtensionToken:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v52 + 1);
    *((_QWORD *)&v52 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v53 + 8));
  }
  PLRequestGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v54 + 1) = a2;
  v16 = os_signpost_id_generate(v15);
  *(_QWORD *)&v53 = v16;
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(*((SEL *)&v54 + 1));
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 409, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 410, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarkURL"));

  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__10083;
  v58 = __Block_byref_object_dispose__10084;
  v59 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__10083;
  v46 = __Block_byref_object_dispose__10084;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10083;
  v40 = __Block_byref_object_dispose__10084;
  v41 = 0;
  objc_msgSend(v11, "URIRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke;
  v35[3] = &unk_1E376C420;
  v35[4] = &buf;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke_65;
  v34[3] = &unk_1E376C538;
  v34[4] = &v42;
  v34[5] = &v36;
  v34[6] = &v48;
  v34[7] = &buf;
  objc_msgSend(v23, "getSandboxExtensionForFileSystemBookmark:reply:", v20, v34);

  if (*((_BYTE *)v49 + 24))
  {
    *a5 = objc_retainAutorelease((id)v37[5]);
    *a4 = objc_retainAutorelease((id)v43[5]);
  }
  if (a6)
  {
    v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v24)
      *a6 = objc_retainAutorelease(v24);
  }
  v25 = *((unsigned __int8 *)v49 + 24);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v48, 8);
  if ((_BYTE)v52)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v53 + 8));
  if ((_QWORD)v53)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v53;
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v29 = sel_getName(*((SEL *)&v54 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v25 != 0;
}

- (void)adjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 trackCPLDownload:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  char v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v37) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v37 + 1);
    *((_QWORD *)&v37 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 447, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v10, "URIRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke;
  v35[3] = &unk_1E376C3A8;
  v36 = v11;
  v26[0] = v17;
  v26[1] = 3254779904;
  v26[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_67;
  v26[3] = &unk_1E3767390;
  v29 = v37;
  v30 = *((id *)&v37 + 1);
  v31 = v38;
  v32 = v39;
  v33 = a2;
  v18 = v15;
  v27 = v18;
  v34 = a4;
  v19 = v36;
  v28 = v19;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:handler:", v35, v26);

  if ((_BYTE)v37)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  if ((_QWORD)v38)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(*((SEL *)&v39 + 1));
      *(_DWORD *)buf = 136446210;
      v41 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (BOOL)estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 outFileLength:(int64_t *)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *Name;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  const char *v36;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  SEL sel[2];
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v48 = 0u;
  *(_OWORD *)sel = 0u;
  v47 = 0u;
  v19 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v47) = v19;
  if (v19)
  {
    v20 = _os_activity_create(&dword_199DF7000, "PLXPC Client: estimatedOutputFileLengthForVideoURL:fallbackFilePath:exportPreset:exportProperties:outFileLength:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v21 = (void *)*((_QWORD *)&v47 + 1);
    *((_QWORD *)&v47 + 1) = v20;

    os_activity_scope_enter(v20, (os_activity_scope_state_t)((char *)&v48 + 8));
  }
  PLRequestGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v23 = os_signpost_id_generate(v22);
  *(_QWORD *)&v48 = v23;
  v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoURL"));

  }
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outFileLength"));

  }
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = -1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__10083;
  v53 = __Block_byref_object_dispose__10084;
  v54 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke;
  v42[3] = &unk_1E376C420;
  v42[4] = &buf;
  objc_msgSend(v27, "synchronousRemoteObjectProxyWithErrorHandler:", v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v28;
  v41[1] = 3221225472;
  v41[2] = __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke_78;
  v41[3] = &unk_1E376C590;
  v41[4] = &v43;
  objc_msgSend(v29, "estimatedFileLengthOfVideo:fallbackFilePath:exportPreset:exportProperties:reply:", v15, v16, v17, v18, v41);

  if (a7)
    *a7 = v44[3];
  v30 = *((_QWORD *)&buf + 1);
  if (a8)
  {
    v31 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v31)
    {
      *a8 = objc_retainAutorelease(v31);
      v30 = *((_QWORD *)&buf + 1);
    }
  }
  v32 = *(_QWORD *)(v30 + 40);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v43, 8);
  if ((_BYTE)v47)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v48 + 8));
  if ((_QWORD)v48)
  {
    PLRequestGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = v48;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      v36 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v36;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v34, OS_SIGNPOST_INTERVAL_END, v35, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v32 == 0;
}

- (void)downloadCloudSharedAsset:(id)a3 withCloudPlaceholderKind:(unint64_t)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  char v31;
  id v32;
  __int128 v33;
  __int128 v34;
  SEL v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  SEL sel[2];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v42 = 0u;
  *(_OWORD *)sel = 0u;
  v41 = 0u;
  v15 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v41) = v15;
  if (v15)
  {
    v16 = _os_activity_create(&dword_199DF7000, "PLXPC Client: downloadCloudSharedAsset:withCloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v17 = (void *)*((_QWORD *)&v41 + 1);
    *((_QWORD *)&v41 + 1) = v16;

    os_activity_scope_enter(v16, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  objc_msgSend(v13, "URIRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke;
  v39[3] = &unk_1E376C3A8;
  v40 = v14;
  v28[0] = v20;
  v28[1] = 3254779904;
  v28[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_80;
  v28[3] = &unk_1E3767780;
  v31 = v41;
  v32 = *((id *)&v41 + 1);
  v33 = v42;
  v34 = *(_OWORD *)sel;
  v35 = a2;
  v21 = v18;
  v29 = v21;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v22 = v40;
  v30 = v22;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:handler:", v39, v28);

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

- (id)consolidateAssets:(id)a3 completionHandler:(id)a4
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
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v31) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: consolidateAssets:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs"));

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke;
  v28[3] = &unk_1E376C5E0;
  v14 = v7;
  v29 = v14;
  v15 = v8;
  v30 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke_86;
  v26[3] = &unk_1E376C608;
  v17 = v15;
  v27 = v17;
  objc_msgSend(v16, "consolidateAssets:reply:", v14, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v18;
}

- (BOOL)updateInternalResourcePath:(id)a3 objectURI:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *Name;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  SEL sel[2];
  uint64_t v38;
  id v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v35) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: updateInternalResourcePath:objectURI:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 581, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceURI"));

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 582, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10083;
  v43 = __Block_byref_object_dispose__10084;
  v44 = 0;
  PLGetSandboxExtensionTokenWithFlags(v9, *MEMORY[0x1E0C80000], *MEMORY[0x1E0C806D0], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    PLSandboxExtensionTokenAsData(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke;
    v34[3] = &unk_1E376C420;
    v34[4] = &buf;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v18;
    v33[1] = 3221225472;
    v33[2] = __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke_92;
    v33[3] = &unk_1E376C630;
    v33[4] = &buf;
    objc_msgSend(v19, "updateInternalResourcePath:objectURI:sandboxExtension:reply:", v9, v10, v16, v33);

    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v21 = v20 == 0;
    if (a5 && v20)
      *a5 = objc_retainAutorelease(v20);

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2AA0];
    v39 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 44004, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;

    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21;
}

- (id)projectExtensionDataForProjectUuid:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 *p_buf;
  __int128 v22;
  __int128 v23;
  SEL sel[2];
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0u;
  *(_OWORD *)sel = 0u;
  v22 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v22) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199DF7000, "PLXPC Client: projectExtensionDataForProjectUuid:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceClient.m"), 622, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("projectUuid"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10083;
  v28 = __Block_byref_object_dispose__10084;
  v29 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10085);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke_95;
  v19[3] = &unk_1E376C678;
  p_buf = &buf;
  v11 = v5;
  v20 = v11;
  objc_msgSend(v10, "projectExtensionDataForProjectUuid:reply:", v11, v19);

  v12 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationRequestBridge, 0);
}

void __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Error getting projectExtensionDataForProjectUuid = %@: %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

void __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[PLAssetsdResourceClient projectExtensionDataForProjectUuid:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PLAssetsdResourceClient updateInternalResourcePath:objectURI:error:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB3388];
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41002, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke_92(uint64_t a1, char a2, void *a3)
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

void __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PLAssetsdResourceClient consolidateAssets:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v11 = "-[PLAssetsdResourceClient downloadCloudSharedAsset:withCloudPlaceholderKind:shouldPrioritize:shouldExtendTimer"
          ":completionHandler:]_block_invoke";
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

void __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_80(uint64_t a1, void *a2)
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
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v19 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(__int16 *)(a1 + 104);
  v12 = *(unsigned __int8 *)(a1 + 112);
  v13 = *(unsigned __int8 *)(a1 + 113);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_81;
  v15[3] = &unk_1E376C5B8;
  v14 = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v3, "downloadCloudSharedAsset:wantedPlaceholderkind:shouldPrioritize:shouldExtendTimer:reply:", v14, v11, v12, v13, v15);

}

uint64_t __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient estimatedOutputFileLengthForVideoURL:fallbackFilePath:exportPreset:exportProperties:o"
         "utFileLength:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke_78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceClient adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_67(uint64_t a1, void *a2)
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
  _QWORD v13[4];
  id v14;
  char v15;
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
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_68;
  v13[3] = &unk_1E376C568;
  v15 = v11;
  v12 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "asynchronousAdjustmentDataForAsset:networkAccessAllowed:reply:", v12, v11, v13);

}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_68(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  NSObject *v33;
  PLCPLDownloadContext *v34;
  os_log_t log;
  int v36[2];
  int v37[2];
  int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (v17)
  {
    objc_msgSend(v17, "object");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = xpc_fd_dup(v20);

    if ((v21 & 0x80000000) == 0)
    {
      dataWithMappedContentsOfFileDescriptor(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v25 = 0;
LABEL_30:
        close(v21);

        goto LABEL_31;
      }
      v39 = v18;
      v42 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v22, 0, 0, &v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v42;
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v40 = v23;
      if (!v23)
      {
        *(_QWORD *)v37 = v22;
        PLGatekeeperXPCGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v41;
          _os_log_impl(&dword_199DF7000, v27, OS_LOG_TYPE_ERROR, "Failed to serialize adjustments property list: %@", buf, 0xCu);
        }

        v22 = *(void **)v37;
        v18 = v39;
        goto LABEL_29;
      }
      if (v24)
      {
        v18 = v39;
        if (!objc_msgSend(v24, "length"))
        {
          *(_QWORD *)v36 = v22;
          PLGatekeeperXPCGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199DF7000, v26, OS_LOG_TYPE_ERROR, "Adjustments property list contains an empty data blob", buf, 2u);
          }

          v22 = *(void **)v36;
        }
        goto LABEL_29;
      }
      v18 = v39;
      if (v39)
      {
        objc_msgSend(v39, "object");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = xpc_fd_dup(v28);

        if ((v38 & 0x80000000) == 0)
        {
          dataWithMappedContentsOfFileDescriptor(v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PLGatekeeperXPCGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          log = v29;
          if (v25)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v30 = "Fetched adjustments data from file";
              v31 = log;
              v32 = OS_LOG_TYPE_DEFAULT;
LABEL_27:
              _os_log_impl(&dword_199DF7000, v31, v32, v30, buf, 2u);
            }
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v30 = "Adjustments data file does not contain a data blob";
            v31 = log;
            v32 = OS_LOG_TYPE_ERROR;
            goto LABEL_27;
          }

          close(v38);
          goto LABEL_29;
        }
      }
      else
      {
        PLGatekeeperXPCGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199DF7000, v33, OS_LOG_TYPE_ERROR, "Adjustments property list does not contain a data blob", buf, 2u);
        }

      }
      v25 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v25 = 0;
  }
  else
  {
    v25 = 0;
  }
LABEL_31:
  v34 = 0;
  if (v19 && *(_BYTE *)(a1 + 40))
  {
    v34 = objc_alloc_init(PLCPLDownloadContext);
    -[PLCPLDownloadContext setError:](v34, "setError:", v19);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient sandboxExtensionForFileSystemBookmark:bookmarkURL:sandboxExtensionToken:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke_65(_QWORD *a1, int a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a5;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a5);
  }

}

void __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke_57(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }

}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdResourceClient imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDo"
         "wnload:completionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_50(uint64_t a1, void *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  char v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v23 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(unsigned __int16 *)(a1 + 104);
  v12 = *(unsigned __int8 *)(a1 + 108);
  v13 = *(unsigned __int8 *)(a1 + 109);
  v14 = *(unsigned __int8 *)(a1 + 110);
  v15 = *(unsigned __int8 *)(a1 + 111);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_51;
  v17[3] = &unk_1E376C4E8;
  v19 = v14;
  v20 = v15;
  v16 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v3, "imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:", v16, v11, v12, v13, v14, v15, v17);

}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_51(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  id v19;
  id v20;
  id v21;
  id v22;
  PLImageDataInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  PLCPLDownloadContext *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  id v32;
  unint64_t v33;
  id v34;

  v34 = a2;
  v33 = a10;
  v32 = a11;
  v31 = a12;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  v23 = objc_alloc_init(PLImageDataInfo);
  -[PLImageDataInfo setDeliveredFormat:](v23, "setDeliveredFormat:", a4);
  -[PLImageDataInfo setCanDownloadFromCloud:](v23, "setCanDownloadFromCloud:", a5);
  -[PLImageDataInfo setURL:](v23, "setURL:", v21);

  -[PLImageDataInfo setSandboxExtensionToken:](v23, "setSandboxExtensionToken:", v20);
  -[PLImageDataInfo setUTI:](v23, "setUTI:", v19);

  -[PLImageDataInfo setEXIFOrientation:](v23, "setEXIFOrientation:", a9);
  if (*(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
  {
    v25 = v32;
    v24 = (void *)v33;
    v26 = (void *)v31;
    if (v33 | v31)
    {
      v27 = objc_alloc_init(PLCPLDownloadContext);
      -[PLCPLDownloadContext setTaskIdentifier:](v27, "setTaskIdentifier:", v33);
      -[PLCPLDownloadContext setResourceTypeDescription:](v27, "setResourceTypeDescription:", v32);
      -[PLCPLDownloadContext setError:](v27, "setError:", v31);
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
    v25 = v32;
    v24 = (void *)v33;
    v26 = (void *)v31;
  }
  objc_msgSend(v34, "object");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v22, "longLongValue");

  PLDataFromXPCDataObject(v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDo"
         "wnload:outImageData:outImageDataInfo:outCPLDownloadContext:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke_48(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;

  v32 = a2;
  v31 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = *(void **)(a1 + 32);
  if (v25)
  {
    objc_msgSend(v25, "setDeliveredFormat:", a4);
    objc_msgSend(*(id *)(a1 + 32), "setCanDownloadFromCloud:", a5);
    objc_msgSend(*(id *)(a1 + 32), "setURL:", v19);
    objc_msgSend(*(id *)(a1 + 32), "setSandboxExtensionToken:", v20);
    objc_msgSend(*(id *)(a1 + 32), "setUTI:", v21);
    objc_msgSend(*(id *)(a1 + 32), "setEXIFOrientation:", a9);
  }
  v26 = *(void **)(a1 + 40);
  if (v26 && *(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 57) && v22 | v24)
  {
    objc_msgSend(v26, "setTaskIdentifier:", v22);
    objc_msgSend(*(id *)(a1 + 40), "setResourceTypeDescription:", v23);
    objc_msgSend(*(id *)(a1 + 40), "setError:", v24);
  }
  if (*(_BYTE *)(a1 + 58))
  {
    objc_msgSend(v32, "object");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PLDataFromXPCDataObject(v27, objc_msgSend(v31, "longLongValue"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
}

void __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke_44(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a4;
  v10 = a5;
  v11 = v10;
  if (a2)
  {
    objc_msgSend(a3, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    **(_DWORD **)(a1 + 56) = xpc_fd_dup(v12);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v10;
    v12 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }

}

void __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient sandboxExtensionFileURLForAssetURL:withAdjustments:fileURL:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_39(_QWORD *a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a5;
  if (a2)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a3, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[4] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    MEMORY[0x19AEC2954](*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), v15);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a5);
  }

}

void __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdResourceClient fileURLForAssetURL:withAdjustments:fileURL:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_37(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }

}

void __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v11 = "-[PLAssetsdResourceClient addAssetWithURL:toAlbumWithUUID:completionHandler:]_block_invoke";
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

void __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_29(uint64_t a1, void *a2)
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
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
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
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_30;
  v13[3] = &unk_1E376C3F8;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v3, "addAssetWithURL:toAlbum:reply:", v11, v12, v13);

}

uint64_t __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v11 = "-[PLAssetsdResourceClient addGroupWithName:completionHandler:]_block_invoke";
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

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_21(uint64_t a1, void *a2)
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
  v12[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_22;
  v12[3] = &unk_1E376C3D0;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addAssetGroupWithName:reply:", v11, v12);

}

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;

  v5 = 0;
  v6 = a3;
  if (!v6 && (a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 41007, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  const void *v5;
  const void *v6;
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
    v8 = "-[PLAssetsdResourceClient saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = (const void *)a1[5];
  v6 = (const void *)a1[6];
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
  (*(void (**)(void))(a1[4] + 16))();

}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_14(uint64_t a1, void *a2)
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
  const void *v14;
  const void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    v20 = CFSTR("SignpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 112);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_17;
  v16[3] = &unk_1E376C380;
  v13 = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  objc_msgSend(v3, "saveAssetWithDataAndPorts:imageSurface:previewImageSurface:reply:", v13, v11, v12, v16);
  v14 = *(const void **)(a1 + 104);
  v15 = *(const void **)(a1 + 112);
  if (v14)
    CFRelease(v14);
  if (v15)
    CFRelease(v15);

}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_17(uint64_t a1, int a2, void *a3, int a4, int a5, void *a6)
{
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v12 + 16))(v12, 1, v16, 0);
  }
  else
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 42001;
    }
    else
    {
      if (!a5)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v12 + 16))(v12, 0, 0, v11);
        goto LABEL_9;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 42002;
    }
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v15);

  }
LABEL_9:

}

@end
