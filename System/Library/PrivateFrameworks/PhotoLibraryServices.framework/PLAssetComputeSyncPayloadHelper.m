@implementation PLAssetComputeSyncPayloadHelper

+ (id)mediaAnalysisPayloadDataForWrapperData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  PLAssetComputeSyncPayloadWrapper *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D82B90];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  v6 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
  if (-[PLAssetComputeSyncPayloadWrapper readFrom:](v6, "readFrom:", v5))
  {
    -[PLAssetComputeSyncPayloadWrapper mediaAnalysisPayload](v6, "mediaAnalysisPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)mediaAnalysisPayloadDataForWrapperURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    objc_msgSend(a1, "mediaAnalysisPayloadDataForWrapperData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[CCSS] Unable to read compute sync resource %@: %@", buf, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)computeSyncWrapperDataForAsset:(id)a3 mediaAnalysisPayload:(id)a4 analysisStage:(signed __int16)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v14;
  PLAssetComputeSyncJournalEntryPayload *v15;
  PLAssetComputeSyncJournalEntryPayload *v16;
  void *v17;
  id v18;
  PLAssetComputeSyncPayloadWrapper *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  +[PLAssetComputeSyncJournalEntryPayload payloadAdapterForManagedObject:](PLAssetComputeSyncJournalEntryPayload, "payloadAdapterForManagedObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetComputeSyncPayloadHelper.m"), 27, CFSTR("Unable to create compute sync payload adapter for asset: %@"), v25);

  }
  v14 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:", v7);
  v15 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:info:]([PLAssetComputeSyncJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:info:", v13, 0, v14);
  v16 = v15;
  if (v15)
  {
    -[PLManagedObjectJournalEntryPayload payloadDataWithError:](v15, "payloadDataWithError:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0D82B98]);
      v19 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
      -[PLAssetComputeSyncPayloadWrapper setAssetPayloadVersion:](v19, "setAssetPayloadVersion:", +[PLAssetComputeSyncJournalEntryPayload payloadVersion](PLAssetComputeSyncJournalEntryPayload, "payloadVersion"));
      -[PLAssetComputeSyncPayloadWrapper setAssetPayload:](v19, "setAssetPayload:", v17);
      -[PLAssetComputeSyncPayloadWrapper setMediaAnalysisPayload:](v19, "setMediaAnalysisPayload:", v12);
      objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetComputeSyncPayloadWrapper setDeviceBuild:](v19, "setDeviceBuild:", v20);

      v21 = (void *)MGCopyAnswer();
      -[PLAssetComputeSyncPayloadWrapper setDeviceHwModel:](v19, "setDeviceHwModel:", v21);

      -[PLAssetComputeSyncPayloadWrapper writeTo:](v19, "writeTo:", v18);
      objc_msgSend(v18, "immutableData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)applyComputeSyncWrapperData:(id)a3 toAsset:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetComputeSyncPayloadHelper.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v10, "cloudAssetGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetComputeSyncPayloadHelper assetPayloadForComputeSyncWrapperData:payloadID:error:](self, "assetPayloadForComputeSyncWrapperData:payloadID:error:", v9, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "rawPayloadAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAsset:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAsset:", v10);
      objc_msgSend(v13, "applyPayloadToManagedObject:payloadAttributesToUpdate:info:", v10, 0, v16);

    }
  }

  return v13 != 0;
}

- (id)assetPayloadForComputeSyncWrapperData:(id)a3 payloadID:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  PLAssetComputeSyncPayloadWrapper *v12;
  void *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetComputeSyncPayloadHelper.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrapperData"));

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v9);
  v12 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
  if (-[PLAssetComputeSyncPayloadWrapper readFrom:](v12, "readFrom:", v11)
    && -[PLAssetComputeSyncPayloadWrapper hasAssetPayload](v12, "hasAssetPayload"))
  {
    -[PLAssetComputeSyncPayloadWrapper assetPayload](v12, "assetPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedObjectJournalEntryPayload payloadWithData:forPayloadID:version:andNilProperties:error:](PLAssetComputeSyncJournalEntryPayload, "payloadWithData:forPayloadID:version:andNilProperties:error:", v13, v10, -[PLAssetComputeSyncPayloadWrapper assetPayloadVersion](v12, "assetPayloadVersion"), 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)computeSyncWrapperURLForAsset:(id)a3 analysisStage:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  char v39;
  id v40;
  char v42;
  void *v43;
  char v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "pathForComputeSyncWrapperFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PLBackendGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "scopedIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "[CCSS] Unable to get compute sync resource URL for asset %@", buf, 0xCu);

    }
    goto LABEL_38;
  }
  v10 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v56);
  v14 = v56;

  if ((v13 & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "pathForComputeSyncMediaAnalysisPayloadFile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v55 = v14;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 0, &v55);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v55;

    v49 = v10;
    if (!v18 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "scopedIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v21;
        v59 = 2112;
        v60 = v19;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "[CCSS] Unable to read MAD compute sync sidecar for asset %@: %@", buf, 0x16u);

      }
    }
    v54 = v19;
    -[PLAssetComputeSyncPayloadHelper computeSyncWrapperDataForAsset:mediaAnalysisPayload:analysisStage:error:](self, "computeSyncWrapperDataForAsset:mediaAnalysisPayload:analysisStage:error:", v6, v18, v4, &v54);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v54;

    if (v22)
    {
      v53 = v23;
      v24 = objc_msgSend(v22, "writeToURL:options:error:", v9, 1, &v53);
      v25 = v53;

      if ((v24 & 1) == 0)
      {
        PLBackendGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "scopedIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v36;
          v59 = 2112;
          v60 = v25;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to write compute sync resource for asset %@: %@", buf, 0x16u);

        }
        v30 = 1;
        v23 = v25;
        goto LABEL_34;
      }
      v48 = v22;
      if (!v18)
        goto LABEL_14;
      if (computeSyncWrapperURLForAsset_analysisStage__onceToken != -1)
        dispatch_once(&computeSyncWrapperURLForAsset_analysisStage__onceToken, &__block_literal_global_12830);
      if (!computeSyncWrapperURLForAsset_analysisStage__keepMadSidecarAround)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v25;
        v44 = objc_msgSend(v43, "removeItemAtURL:error:", v17, &v52);
        v26 = v52;

        if ((v44 & 1) == 0)
        {
          PLBackendGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "scopedIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v46;
            v59 = 2112;
            v60 = v26;
            _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "[CCSS] Unable to remove MAD compute sync payload for asset %@: %@", buf, 0x16u);

          }
        }
      }
      else
      {
LABEL_14:
        v26 = v25;
      }
      v27 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v6, "pathManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "capabilities");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v26;
      LOBYTE(v27) = objc_msgSend(v27, "ingestItemAtURL:toURL:type:options:capabilities:error:", v9, v9, 0, 2, v29, &v51);
      v14 = v51;

      if ((v27 & 1) != 0)
      {
        v30 = 0;
        v22 = v48;
        v10 = v49;
LABEL_36:

        goto LABEL_37;
      }
      v22 = v48;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "scopedIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v58 = v9;
          v59 = 2112;
          v60 = v14;
          v61 = 2112;
          v62 = v38;
          _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "[CCSS] Failed to set file protection on generated compute sync wrapper %@, error: %@ %@", buf, 0x20u);

          v22 = v48;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = objc_claimAutoreleasedReturnValue();
      v50 = v14;
      v39 = -[NSObject removeItemAtURL:error:](v34, "removeItemAtURL:error:", v9, &v50);
      v23 = v50;

      if ((v39 & 1) == 0)
      {
        v42 = PLIsErrorFileNotFound();

        if ((v42 & 1) != 0)
        {
          v30 = 1;
          goto LABEL_35;
        }
        PLBackendGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "scopedIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v47;
          v59 = 2112;
          v60 = v23;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to remove compute sync wrapper for asset %@: %@", buf, 0x16u);

        }
        v30 = 0;
LABEL_34:

LABEL_35:
        v14 = v23;
        v10 = v49;
        goto LABEL_36;
      }
    }
    else
    {
      PLBackendGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "scopedIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v35;
        v59 = 2112;
        v60 = v23;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to encode compute sync resource for asset %@: %@", buf, 0x16u);

      }
    }
    v30 = 1;
    goto LABEL_34;
  }
  PLBackendGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "scopedIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v58 = v33;
    v59 = 2112;
    v60 = v11;
    v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[CCSS] Unable to create compute sync resource directory for asset %@ URL %@ error: %@", buf, 0x20u);

  }
  v30 = 1;
LABEL_37:

  objc_autoreleasePoolPop(v10);
  if (!v30)
  {
    v40 = v9;
    goto LABEL_40;
  }
LABEL_38:
  v40 = 0;
LABEL_40:

  return v40;
}

void __79__PLAssetComputeSyncPayloadHelper_computeSyncWrapperURLForAsset_analysisStage___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  computeSyncWrapperURLForAsset_analysisStage__keepMadSidecarAround = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLCCSSKeepMADPayloadAfterWrapperGeneration"));

}

@end
