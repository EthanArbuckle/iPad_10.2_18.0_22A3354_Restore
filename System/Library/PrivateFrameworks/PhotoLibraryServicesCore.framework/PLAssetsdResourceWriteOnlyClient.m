@implementation PLAssetsdResourceWriteOnlyClient

- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  char v33;
  id v34;
  __int128 v35;
  __int128 v36;
  SEL v37;
  __IOSurface *v38;
  __IOSurface *v39;
  _QWORD v40[4];
  id v41;
  __IOSurface *v42;
  __IOSurface *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v13 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v44) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199DF7000, "PLXPC Client: saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdResourceWriteOnlyClient.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v16 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(v11, "objectForKey:", CFSTR("callStack"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    PLGatekeeperXPCGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v19;
      v49 = 2112;
      v50 = v17;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_DEFAULT, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _PLJobLogDictionary(v11, 0, v20);

  }
  if (a4)
    CFRetain(a4);
  if (a5)
    CFRetain(a5);
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke;
  v40[3] = &unk_1E376C350;
  v42 = a4;
  v43 = a5;
  v41 = v12;
  v30[0] = v22;
  v30[1] = 3254779904;
  v30[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_10;
  v30[3] = &unk_1E3767860;
  v33 = v44;
  v34 = *((id *)&v44 + 1);
  v35 = v45;
  v36 = v46;
  v37 = a2;
  v23 = v11;
  v31 = v23;
  v38 = a4;
  v39 = a5;
  v24 = v41;
  v32 = v24;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:handler:", v40, v30);

  objc_autoreleasePoolPop(v16);
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
      Name = sel_getName(*((SEL *)&v46 + 1));
      *(_DWORD *)buf = 136446210;
      v48 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke(_QWORD *a1, void *a2)
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
    v8 = "-[PLAssetsdResourceWriteOnlyClient saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandle"
         "r:]_block_invoke";
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

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_10(uint64_t a1, void *a2)
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
  v16[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_13;
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

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_13(uint64_t a1, int a2, void *a3, int a4, int a5, void *a6)
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
