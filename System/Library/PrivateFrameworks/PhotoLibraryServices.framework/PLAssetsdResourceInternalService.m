@implementation PLAssetsdResourceInternalService

- (void)prewarmWithCapturePhotoSettings:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deferredProcessingServicerHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PLAssetsdResourceInternalService_prewarmWithCapturePhotoSettings_reply___block_invoke;
  v11[3] = &unk_1E366F590;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "prewarmWithCapturePhotoSettings:completionHandler:", v7, v11);

}

- (PLAssetsdResourceInternalService)initWithLibraryServicesManager:(id)a3 trustedCallerBundleID:(id)a4
{
  id v7;
  PLAssetsdResourceInternalService *v8;
  PLAssetsdResourceInternalService *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdResourceInternalService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_trustedCallerBundleID, a4);

  return v9;
}

- (void)batchSaveAssetJobs:(id)a3 reply:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  const char *Name;
  id v46;
  id obj;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  _BYTE v63[24];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = a4;
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  v6 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v59) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_199541000, "PLXPC Service: batchSaveAssetJobs:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((_QWORD *)&v59 + 1);
    *((_QWORD *)&v59 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v60 + 8));
  }
  PLGatekeeperXPCGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v63 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Received batchSaveAssets:reply: with %d jobs", buf, 8u);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v56;
    v14 = *MEMORY[0x1E0D74DB8];
    v15 = *MEMORY[0x1E0D74D38];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        if (v12 >= 11)
        {
          PLGatekeeperXPCGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(obj, "count");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v63 = v22 - v12;
            _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "  [...and %d more]", buf, 8u);
          }

          goto LABEL_19;
        }
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        PLGatekeeperXPCGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v63 = v12;
          *(_WORD *)&v63[4] = 2114;
          *(_QWORD *)&v63[6] = v19;
          *(_WORD *)&v63[14] = 2114;
          *(_QWORD *)&v63[16] = v20;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "  [job-%d] type %{public}@ uuid %{public}@", buf, 0x1Cu);

          ++v12;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_19:

  PLGatekeeperXPCGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Begin batchSaveAssetJobs", buf, 2u);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageWriter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke;
  v52[3] = &unk_1E3661E68;
  v52[4] = self;
  v28 = v25;
  v53 = v28;
  v29 = v26;
  v54 = v29;
  objc_msgSend(obj, "enumerateObjectsUsingBlock:", v52);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0D74DD8];
  objc_msgSend(v30, "setObject:forKey:", *MEMORY[0x1E0D74DD8], *MEMORY[0x1E0D74DB8]);
  objc_msgSend(v30, "setObject:forKey:", v29, *MEMORY[0x1E0D74CF0]);
  v49[0] = v27;
  v49[1] = 3221225472;
  v49[2] = __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke_2;
  v49[3] = &unk_1E3661E98;
  v32 = v29;
  v50 = v32;
  v33 = v46;
  v51 = v33;
  v34 = (void *)MEMORY[0x19AEC174C](v49);
  v35 = (void *)objc_msgSend(v34, "copy");
  v36 = (void *)MEMORY[0x19AEC174C]();
  objc_msgSend(v30, "setObject:forKey:", v36, CFSTR("completionBlock"));

  PLGatekeeperXPCGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v63 = v38;
    *(_WORD *)&v63[8] = 2112;
    *(_QWORD *)&v63[10] = v31;
    *(_WORD *)&v63[18] = 1024;
    *(_DWORD *)&v63[20] = v39;
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "[%@] enqueuing batch save job %@ with %d jobs", buf, 0x1Cu);

  }
  objc_msgSend(v28, "enqueueJob:", v30);
  PLGatekeeperXPCGetLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEBUG, "End batchSaveAssetJobs", buf, 2u);
  }

  if ((_BYTE)v59)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v60 + 8));
  if ((_QWORD)v60)
  {
    PLRequestGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    v43 = v60;
    if ((unint64_t)(v60 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      Name = sel_getName(*((SEL *)&v61 + 1));
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v63 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v42, OS_SIGNPOST_INTERVAL_END, v43, "Received batchSaveAssets:reply: with %d jobs", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asynchronousMasterThumbnailForAssetUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  id v27;
  __int128 v28;
  __int128 v29;
  SEL sel[2];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: asynchronousMasterThumbnailForAssetUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceInternalService asynchronousMasterThumbnailForAssetUUID:reply:]");

  objc_msgSend(v13, "thumbnailManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__PLAssetsdResourceInternalService_asynchronousMasterThumbnailForAssetUUID_reply___block_invoke;
  v23[3] = &unk_1E3671878;
  v15 = v6;
  v24 = v15;
  v16 = v13;
  v25 = v16;
  v17 = v14;
  v26 = v17;
  v18 = v7;
  v27 = v18;
  objc_msgSend(v16, "performBlockAndWait:", v23);

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
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v21, "Received batchSaveAssets:reply: with %d jobs", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cancelAllPrewarmingWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deferredProcessingServicerHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PLAssetsdResourceInternalService_cancelAllPrewarmingWithReply___block_invoke;
  v8[3] = &unk_1E366F590;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "cancelAllPrewarmingWithCompletion:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
}

void __65__PLAssetsdResourceInternalService_cancelAllPrewarmingWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __74__PLAssetsdResourceInternalService_prewarmWithCapturePhotoSettings_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __82__PLAssetsdResourceInternalService_asynchronousMasterThumbnailForAssetUUID_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "masterThumbnailFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataForPhoto:format:allowPlaceholder:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v2, objc_msgSend(v5, "formatID"), 0, 0, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Asset not found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41003, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v3 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(a1[4], "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "imageWriterJob:hasValidPathsWithConnection:", v17, v6);

  if (v7)
  {
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D74DB8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D74D78]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D74E00]))
      {
        v10 = *MEMORY[0x1E0D74E70];
        objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D74E70]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "length"))
        {
          if (!objc_msgSend(v9, "length"))
          {
            objc_msgSend(MEMORY[0x1E0D73148], "defaultFileExtensionForAssetType:", 0);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v12;
          }
          objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D74D30]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D60]);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "UUIDString");
                v14 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
            objc_msgSend(a1[5], "cameraAssetPathForNewAssetWithExtension:assetUUID:", v9, v14);
            v16 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v16;
          }
          if (v11)
            objc_msgSend(v17, "setObject:forKey:", v11, v10);
        }
      }
      else
      {
        v11 = 0;
      }

    }
    objc_msgSend(a1[6], "addObject:", v17);
  }
  objc_autoreleasePoolPop(v3);

}

void __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("completionBlock"));
  PLImageWriterRemovePrivateKeysFromJobDictionary(v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("completionBlock"), (_QWORD)v10);
        PLImageWriterRemovePrivateKeysFromJobDictionary(v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
