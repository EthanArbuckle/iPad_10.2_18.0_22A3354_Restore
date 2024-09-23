@implementation PLAssetsdPhotoKitClient

- (id)clientName
{
  return CFSTR("PhotoKit client");
}

- (void)sendChangesRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:reply:](PLAssetsdPhotoKitClient, "sendChangesRequest:usingProxyFactory:reply:", v7, v8, v6);

}

- (BOOL)sendChangesRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:error:](PLAssetsdPhotoKitClient, "sendChangesRequest:usingProxyFactory:error:", v6, v7, a4);

  return (char)a4;
}

- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
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

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v27) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resolveLocalIdentifiersForCloudIdentifiers:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__859;
  v33 = __Block_byref_object_dispose__860;
  v34 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__859;
  v25 = __Block_byref_object_dispose__860;
  v26 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke;
  v20[3] = &unk_1E376C420;
  v20[4] = &buf;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_10;
  v19[3] = &unk_1E376A510;
  v19[4] = &buf;
  v19[5] = &v21;
  objc_msgSend(v12, "resolveLocalIdentifiersForCloudIdentifiers:reply:", v6, v19);

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

- (id)getUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  const char *Name;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  uint64_t *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  SEL sel[2];
  uint8_t v50[128];
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v48 = 0u;
  *(_OWORD *)sel = 0u;
  v47 = 0u;
  v13 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v47) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199DF7000, "PLXPC Client: getUUIDsForAssetObjectIDs:filterPredicate:context:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v47 + 1);
    *((_QWORD *)&v47 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v48 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__859;
  v54 = __Block_byref_object_dispose__860;
  v55 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__859;
  v45 = __Block_byref_object_dispose__860;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "URIRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v18);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke;
  v36[3] = &unk_1E376C420;
  v36[4] = &buf;
  objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  v32[1] = 3221225472;
  v32[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_13;
  v32[3] = &unk_1E37687B0;
  p_buf = &buf;
  v25 = v12;
  v33 = v25;
  v35 = &v41;
  objc_msgSend(v24, "getUUIDsForAssetObjectURIs:filterPredicate:reply:", v16, v11, v32);

  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v26 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v47)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v48 + 8));
  if ((_QWORD)v48)
  {
    PLRequestGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = v48;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v26;
}

- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  const char *Name;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
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
  v10 = a3;
  v11 = a4;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v12 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v41) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199DF7000, "PLXPC Client: processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v41 + 1);
    *((_QWORD *)&v41 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__859;
  v47 = __Block_byref_object_dispose__860;
  v48 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__859;
  v39 = __Block_byref_object_dispose__860;
  v40 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke;
  v34[3] = &unk_1E376C420;
  v34[4] = &v35;
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke_17;
  v29[3] = &unk_1E37687D8;
  p_buf = &buf;
  v18 = v11;
  v30 = v18;
  v19 = v10;
  v31 = v19;
  v33 = &v35;
  objc_msgSend(v17, "processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:reply:", v19, v18, a5, v29);

  v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v21 = (id)v36[5];
  v22 = v21;
  if (!v20 && a6)
    *a6 = objc_retainAutorelease(v21);

  v23 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v41)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  if ((_QWORD)v42)
  {
    PLRequestGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      Name = sel_getName(*((SEL *)&v43 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v23;
}

- (BOOL)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5
{
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
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
  v8 = a3;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v28) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: processUniversalSearchJITForAssetUUID:processingTypes:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__859;
  v34 = __Block_byref_object_dispose__860;
  v35 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke;
  v27[3] = &unk_1E376C420;
  v27[4] = &buf;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke_19;
  v24[3] = &unk_1E376C268;
  v15 = v8;
  v25 = v15;
  p_buf = &buf;
  objc_msgSend(v14, "processUniversalSearchJITForAssetUUID:processingTypes:reply:", v15, a4, v24);

  v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v17 = v16;
  v18 = v17;
  if (v16 && a5)
    *a5 = objc_retainAutorelease(v17);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16 == 0;
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
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
  v8 = a3;
  v9 = a5;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v10 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v26) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199DF7000, "PLXPC Client: analyzeAssets:forFeature:withCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__859;
  v32 = __Block_byref_object_dispose__860;
  v33 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E376C420;
  v25[4] = &buf;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke_20;
  v23[3] = &unk_1E376C3A8;
  v16 = v9;
  v24 = v16;
  objc_msgSend(v15, "analyzeAssets:forFeature:reply:", v8, a4, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v17;
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
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
  v6 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v7 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v23) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199DF7000, "PLXPC Client: analyzeLibraryForFeature:withCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__859;
  v29 = __Block_byref_object_dispose__860;
  v30 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E376C420;
  v22[4] = &buf;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke_22;
  v20[3] = &unk_1E376C3A8;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v12, "analyzeLibraryForFeature:reply:", a3, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v14;
}

- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6
{
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
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
  v10 = a4;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v33) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v33 + 1);
    *((_QWORD *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__859;
  v39 = __Block_byref_object_dispose__860;
  v40 = 0;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke;
  v28[3] = &unk_1E376C420;
  v28[4] = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke_23;
    v27[3] = &unk_1E376BF00;
    v27[4] = &v29;
    v27[5] = &buf;
    v17 = (id)objc_msgSend(v16, "resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:reply:", a3, v10, a5, v27);
    v18 = *((unsigned __int8 *)v30 + 24);
    v19 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v20 = v19;
    if (!v18 && a6)
      *a6 = objc_retainAutorelease(v19);

    v21 = *((_BYTE *)v30 + 24) != 0;
  }
  else
  {
    v21 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

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
      Name = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21;
}

void __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient analyzeLibraryForFeature:withCompletionHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    +[PLResult failureWithError:](PLResult, "failureWithError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResult successWithResult:](PLResult, "successWithResult:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (uint64_t)v5;
  }
  v6 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient analyzeAssets:forFeature:withCompletionHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    +[PLResult failureWithError:](PLResult, "failureWithError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResult successWithResult:](PLResult, "successWithResult:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (uint64_t)v5;
  }
  v6 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient processUniversalSearchJITForAssetUUID:processingTypes:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "US JIT Processing failed for asset %{public}@ : %@", (uint8_t *)&v8, 0x16u);
    }

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:er"
         "ror:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke_17(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  if (!v6)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = a1[5];
      v11 = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "US JIT Processing failed for %{public}@ : %{public}@ : %@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }

}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient getUUIDsForAssetObjectIDs:filterPredicate:context:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLGatekeeperXPCGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Received error getting uuids for asset object IDs, error: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_15;
    v15[3] = &unk_1E3768788;
    v16 = v8;
    v10 = v9;
    v17 = v10;
    v11 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;
    v14 = v10;

  }
}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectIDForURIRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);

}

void __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke(uint64_t a1, void *a2)
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
    v8 = "-[PLAssetsdPhotoKitClient resolveLocalIdentifiersForCloudIdentifiers:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_10(uint64_t a1, void *a2, void *a3)
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
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Received error getting uuids for local cloud identifiers, error: %@", (uint8_t *)&v10, 0xCu);
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

+ (BOOL)inTransactionProxy
{
  return dispatch_get_specific("PLAssetsdPhotoKitClient_transactionProxy") != 0;
}

+ (void)setInTransactionProxy:(BOOL)a3 queue:(id)a4
{
  dispatch_queue_set_specific((dispatch_queue_t)a4, "PLAssetsdPhotoKitClient_transactionProxy", (void *)a3, 0);
}

+ (void)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 reply:(id)a5
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
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v11 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v34) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendChangesRequest:usingProxyFactory:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v34 + 1);
    *((_QWORD *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  objc_msgSend(v9, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke;
  v32[3] = &unk_1E376C3A8;
  v33 = v10;
  v23[0] = v15;
  v23[1] = 3254779904;
  v23[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_3;
  v23[3] = &unk_1E37676A0;
  v27 = v34;
  v28 = *((id *)&v34 + 1);
  v29 = v35;
  v30 = v36;
  v31 = a2;
  v16 = v14;
  v24 = v16;
  v17 = v8;
  v25 = v17;
  v18 = v33;
  v26 = v18;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:handler:", v32, v23);

  if ((_BYTE)v34)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  if ((_QWORD)v35)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v36 + 1));
      *(_DWORD *)buf = 136446210;
      v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

+ (BOOL)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v22[6];
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  __int128 *p_buf;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v31) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199DF7000, "PLXPC Client: sendChangesRequest:usingProxyFactory:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  objc_msgSend(v8, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__859;
  v37 = __Block_byref_object_dispose__860;
  v38 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke;
  v23[3] = &unk_1E3768760;
  v14 = v8;
  v24 = v14;
  v25 = &v27;
  p_buf = &buf;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetsdPhotoKitClient setInTransactionProxy:queue:](PLAssetsdPhotoKitClient, "setInTransactionProxy:queue:", 1, v12);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke_9;
  v22[3] = &unk_1E376BF00;
  v22[4] = &v27;
  v22[5] = &buf;
  objc_msgSend(v15, "applyChangesRequest:reply:", v7, v22);
  +[PLAssetsdPhotoKitClient setInTransactionProxy:queue:](PLAssetsdPhotoKitClient, "setInTransactionProxy:queue:", 0, v12);
  if (*((_BYTE *)v28 + 24))
  {
    v16 = 1;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v16 = *((unsigned __int8 *)v28 + 24);
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v27, 8);

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16 != 0;
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = a1[4];
    NSStringFromSelector(sel_sendChangesRequest_usingProxyFactory_error_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error received from proxy factory %{public}@ in %{public}@: %@", (uint8_t *)&v9, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke_9(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke(uint64_t a1, void *a2)
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
    v5 = 136446466;
    v6 = "+[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:reply:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_3(uint64_t a1, void *a2)
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
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);

    }
  }
  +[PLAssetsdPhotoKitClient setInTransactionProxy:queue:](PLAssetsdPhotoKitClient, "setInTransactionProxy:queue:", 1, *(_QWORD *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_6;
  v12[3] = &unk_1E376C3F8;
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v3, "applyChangesRequest:reply:", v11, v12);
  +[PLAssetsdPhotoKitClient setInTransactionProxy:queue:](PLAssetsdPhotoKitClient, "setInTransactionProxy:queue:", 0, *(_QWORD *)(a1 + 32));

}

uint64_t __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
