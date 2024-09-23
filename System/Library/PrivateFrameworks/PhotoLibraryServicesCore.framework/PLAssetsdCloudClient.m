@implementation PLAssetsdCloudClient

- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  char v27;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL v31;
  unint64_t v32;
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
  v10 = a5;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v35) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  objc_msgSend(v9, "URIRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke;
  v33[3] = &unk_1E376C3A8;
  v34 = v10;
  v24[0] = v16;
  v24[1] = 3254779904;
  v24[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_7;
  v24[3] = &unk_1E37674E0;
  v27 = v35;
  v28 = *((id *)&v35 + 1);
  v29 = v36;
  v30 = v37;
  v31 = a2;
  v17 = v14;
  v25 = v17;
  v32 = a4;
  v18 = v34;
  v26 = v18;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:handler:", v33, v24);

  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v37 + 1));
      *(_DWORD *)buf = 136446210;
      v39 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cancelCPLDownloadWithContext:(id)a3 completionHandler:(id)a4
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
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: cancelCPLDownloadWithContext:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke;
  v28[3] = &unk_1E376C3A8;
  v29 = v8;
  v20[0] = v13;
  v20[1] = 3254779904;
  v20[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_2;
  v20[3] = &unk_1E3767160;
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

- (void)downloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 trackCPLDownload:(BOOL)a6 downloadIsTransient:(BOOL)a7 proposedTaskIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  const char *Name;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  char v38;
  id v39;
  __int128 v40;
  __int128 v41;
  SEL v42;
  unint64_t v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = a9;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v18 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v49) = v18;
  if (v18)
  {
    v19 = _os_activity_create(&dword_199DF7000, "PLXPC Client: downloadCloudPhotoLibraryAsset:resourceType:highPriority:trackCPLDownload:downloadIsTransient:proposedTaskIdentifier:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v20 = (void *)*((_QWORD *)&v49 + 1);
    *((_QWORD *)&v49 + 1) = v19;

    os_activity_scope_enter(v19, (os_activity_scope_state_t)((char *)&v50 + 8));
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v15, "URIRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke;
  v47[3] = &unk_1E376C3A8;
  v48 = v17;
  v34[0] = v23;
  v34[1] = 3254779904;
  v34[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_2;
  v34[3] = &unk_1E37678D0;
  v38 = v49;
  v39 = *((id *)&v49 + 1);
  v40 = v50;
  v41 = v51;
  v42 = a2;
  v24 = v21;
  v35 = v24;
  v25 = v16;
  v36 = v25;
  v43 = a4;
  v44 = a5;
  v45 = a6;
  v46 = a7;
  v26 = v48;
  v37 = v26;
  objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:handler:", v47, v34);

  if ((_BYTE)v49)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v50 + 8));
  if ((_QWORD)v50)
  {
    PLRequestGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = v50;
    if ((unint64_t)(v50 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(*((SEL *)&v51 + 1));
      *(_DWORD *)buf = 136446210;
      v53 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)requestCPLDownloadImageDataForAssets:(id)a3 format:(unint64_t)a4 doneTokens:(id)a5 completionHandler:(id)a6
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
  unint64_t v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v14 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v39) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199DF7000, "PLXPC Client: requestCPLDownloadImageDataForAssets:format:doneTokens:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v39 + 1);
    *((_QWORD *)&v39 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke;
  v37[3] = &unk_1E376C3A8;
  v38 = v13;
  v27[0] = v18;
  v27[1] = 3254779904;
  v27[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_2;
  v27[3] = &unk_1E3767898;
  v31 = v39;
  v32 = *((id *)&v39 + 1);
  v33 = v40;
  v34 = v41;
  v35 = a2;
  v19 = v11;
  v28 = v19;
  v20 = v12;
  v29 = v20;
  v36 = a4;
  v21 = v38;
  v30 = v21;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:handler:", v37, v27);

  if ((_BYTE)v39)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  if ((_QWORD)v40)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(*((SEL *)&v41 + 1));
      *(_DWORD *)buf = 136446210;
      v43 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:(id)a3 completionHandler:(id)a4
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
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("virtualTaskIdentifiers"));

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke;
  v30[3] = &unk_1E376C3A8;
  v31 = v8;
  v22[0] = v13;
  v22[1] = 3254779904;
  v22[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_2;
  v22[3] = &unk_1E3767160;
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

- (void)computeFingerPrintsOfAsset:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id *v19;
  id *v20;
  void *v21;
  uint64_t v22;
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
  char v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v44 = 0u;
  v45 = 0u;
  v43 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v43) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: computeFingerPrintsOfAsset:synchronously:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v43 + 1);
    *((_QWORD *)&v43 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudClient.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v9, "URIRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  if (v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke;
    v41[3] = &unk_1E376C3A8;
    v17 = v10;
    v42 = v17;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_29;
    v39[3] = &unk_1E376C180;
    v40 = v17;
    objc_msgSend(v18, "computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:", v14, 1, v39);

    v19 = &v42;
    v20 = &v40;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_31;
    v37[3] = &unk_1E376C3A8;
    v38 = v10;
    v28[0] = v22;
    v28[1] = 3254779904;
    v28[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_32;
    v28[3] = &unk_1E3767358;
    v31 = v43;
    v32 = *((id *)&v43 + 1);
    v33 = v44;
    v34 = v45;
    v35 = a2;
    v29 = v14;
    v36 = 0;
    v30 = v38;
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:handler:", v37, v28);

    v19 = &v38;
    v20 = &v32;
    v15 = v29;
  }

  if ((_BYTE)v43)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v44 + 8));
  if ((_QWORD)v44)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v44;
    if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(*((SEL *)&v45 + 1));
      *(_DWORD *)buf = 136446210;
      v47 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdCloudClient computeFingerPrintsOfAsset:synchronously:completionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Unable to get asset fingerprints because XPC service returned an error. (%@)", (uint8_t *)&v11, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_31(uint64_t a1, void *a2)
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
    v6 = "-[PLAssetsdCloudClient computeFingerPrintsOfAsset:synchronously:completionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_32(uint64_t a1, void *a2)
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
  v11 = *(unsigned __int8 *)(a1 + 104);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_33;
  v13[3] = &unk_1E376C180;
  v12 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:", v12, v11, v13);

}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Unable to get asset fingerprints because XPC service returned an error. (%@)", (uint8_t *)&v11, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  v12[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_27;
  v12[3] = &unk_1E376C158;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:reply:", v11, v12);

}

uint64_t __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  if (*(_BYTE *)(a1 + 56))
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
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 112);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_22;
  v14[3] = &unk_1E376C130;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v3, "asynchronousStartPreheatingCPLDownloadForAssets:doneTokens:format:reply:", v11, v12, v13, v14);

}

uint64_t __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
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
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(unsigned __int8 *)(a1 + 120);
  v15 = *(unsigned __int8 *)(a1 + 121);
  v16 = *(unsigned __int8 *)(a1 + 122);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_18;
  v17[3] = &unk_1E376C108;
  v20 = v15;
  v18 = v11;
  v19 = *(id *)(a1 + 48);
  objc_msgSend(v3, "downloadCloudPhotoLibraryAssetWithObjectURI:taskIdentifier:resourceType:HighPriority:trackCPLDownload:downloadIsTransient:reply:", v12, v18, v13, v14, v15, v16, v17);

}

void __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_18(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  PLCPLDownloadContext *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v11 = objc_alloc_init(PLCPLDownloadContext);
      -[PLCPLDownloadContext setTaskIdentifier:](v11, "setTaskIdentifier:", *(_QWORD *)(a1 + 32));
      -[PLCPLDownloadContext setResourceTypeDescription:](v11, "setResourceTypeDescription:", v9);
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_13;
  v12[3] = &unk_1E376C0E0;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "cancelCPLDownloadTaskWithIdentifier:reply:", v11, v12);

}

uint64_t __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    v7 = "-[PLAssetsdCloudClient requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:completionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

void __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_7(uint64_t a1, void *a2)
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
  v11 = *(_QWORD *)(a1 + 104);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_10;
  v13[3] = &unk_1E376C5B8;
  v12 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:reply:", v12, v11, v13);

}

uint64_t __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
