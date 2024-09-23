@implementation PXPhotosExportUtilities

+ (void)exportAsset:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v10, "activityTypeForAssetExportAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(a1, "_exportRequestForAsset:analyticsActivityType:error:", v13, v14, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v25;
  if (v15)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke;
    v21 = &unk_1E513F6E0;
    v24 = a1;
    v22 = v10;
    v23 = v12;
    objc_msgSend(a1, "_exportAssetUsingExportRequest:configuration:completion:", v15, v22, &v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChild:withPendingUnitCount:", v17, 90, v18, v19, v20, v21);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v15;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Finished creating export request: %@ (progress: %@)", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      v28 = 2112;
      v29 = v11;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Creating export request failed with error: %@ (progress: %@)", buf, 0x16u);
    }
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v16);
  }

}

+ (void)exportAssetsInContainer:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_exportCollectionList:configuration:progress:completion:", v10, v11, v12, v13);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchExclusiveAssetsForSocialGroup:options:", v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (void *)v14;
    if (v14)
    {
      objc_msgSend(a1, "exportAssets:configuration:progress:completion:", v14, v11, v12, v13);

      goto LABEL_13;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to determine assets contained in %@", (uint8_t *)&v16, 0xCu);
  }
LABEL_13:

}

+ (void)exportAssets:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(id, void *, id);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = (void (**)(id, void *, id))a6;
  objc_msgSend(v14, "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("AssetFetchResult-%lf"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fileURLWithPath:isDirectory:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v24 = objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 0, 0, &v26);
  v25 = v26;

  if (v24)
  {
    objc_msgSend(a1, "_exportAssets:toURL:configuration:progress:", v10, v22, v11, v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v25;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create export directory: %@", buf, 0xCu);
  }
  v15[2](v15, v22, v25);

}

+ (void)_exportCollectionList:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(id, void *, id);
  id v34;
  id v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v35 = a4;
  v34 = a5;
  v32 = (void (**)(id, void *, id))a6;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("CollectionList-%lf"), v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v13;
  objc_msgSend(v15, "stringByAppendingPathComponent:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:isDirectory:", v16, 1);
  v17 = objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = (void *)v17;
  +[PXExportContainer containersForRootCollection:destinationURL:](PXExportContainer, "containersForRootCollection:destinationURL:", v9, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        v23 = v20;
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "url");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v20;
        v27 = objc_msgSend(v25, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 0, 0, &v37);
        v20 = v37;

        if (v27)
        {
          objc_msgSend(v24, "assets");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "url");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_exportAssets:toURL:configuration:progress:", v28, v29, v35, v34);

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v20;
          _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create export directory: %@", buf, 0xCu);
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  v32[2](v32, v30, v20);
}

+ (id)_exportRequestForAsset:(id)a3 analyticsActivityType:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setAnalyticsActivityType:", v7);
    objc_msgSend(v9, "setShouldSendTimingIntervalsToAnalytics:", 1);
  }

  return v9;
}

+ (void)_downscaleAssetAtURLIfNeeded:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "downscalingTargetDimension");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 && (v12 = (void *)v11, v13 = objc_msgSend(v9, "itemType"), v12, v13 == 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "downscalingTargetDimension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Downscaling asset (%@) to target dimension: %@", buf, 0x16u);

    }
    objc_msgSend(v9, "downscalingTargetDimension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__PXPhotosExportUtilities__downscaleAssetAtURLIfNeeded_configuration_completion___block_invoke;
    v16[3] = &unk_1E51414E0;
    v17 = v10;
    objc_msgSend(a1, "_downscaleImageAtURL:targetDimension:completion:", v8, v15, v16);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Don't need to downscale asset: %@", buf, 0xCu);
    }
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v8, 0);
  }

}

+ (void)_downscaleImageAtURL:(id)a3 targetDimension:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[6];
  _QWORD v56[8];

  v56[6] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (_downscaleImageAtURL_targetDimension_completion__onceToken != -1)
    dispatch_once(&_downscaleImageAtURL_targetDimension_completion__onceToken, &__block_literal_global_255028);
  v10 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v7, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typeWithFilenameExtension:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v14;
  PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v55[0] = *MEMORY[0x1E0D47D48];
  objc_msgSend(MEMORY[0x1E0D47C00], "standardPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v16;
  v55[1] = *MEMORY[0x1E0D47D78];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PUPhotosFileProviderItemProvider downscaling image to target length: %@"), v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D47CE0];
  v56[1] = v17;
  v56[2] = MEMORY[0x1E0C9AAB0];
  v19 = *MEMORY[0x1E0D47D38];
  v55[2] = v18;
  v55[3] = v19;
  v20 = *MEMORY[0x1E0D47D30];
  v56[3] = v8;
  v56[4] = &unk_1E53EF258;
  v21 = *MEMORY[0x1E0D47D58];
  v55[4] = v20;
  v55[5] = v21;
  v47 = (void *)v15;
  v56[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
  v46 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "temporaryDirectory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", v25, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  LODWORD(v23) = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v54);
  v28 = v54;

  if ((_DWORD)v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v45 = v7;
    LODWORD(v30) = objc_msgSend(v32, "moveItemAtURL:toURL:error:", v7, v31, &v53);
    v33 = v53;

    if ((_DWORD)v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLByAppendingPathComponent:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D47C18], "collectionWithMainResourceURL:", v31);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D47C18], "collectionWithMainResourceURL:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = _downscaleImageAtURL_targetDimension_completion__client;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke_98;
      v49[3] = &unk_1E513F728;
      v52 = v9;
      v50 = v36;
      v51 = v26;
      v40 = v36;
      v41 = (void *)v39;
      v42 = v37;
      v43 = (void *)v37;
      v44 = (void *)v46;
      objc_msgSend(v41, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v42, v38, v46, v49);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v33);
      v44 = (void *)v46;
    }

    v7 = v45;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v28);
    v44 = (void *)v46;
  }

}

+ (void)_exportAssets:(id)a3 toURL:(id)a4 configuration:(id)a5 progress:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  dispatch_semaphore_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  id obj;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  dispatch_semaphore_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a4;
  v11 = a5;
  v28 = a6;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v12)
  {
    v14 = v12;
    v15 = MEMORY[0x1E0C81028];
    v29 = *(_QWORD *)v37;
    *(_QWORD *)&v13 = 138412546;
    v25 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
        objc_msgSend(v11, "activityTypeForAssetExportAnalytics", v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(a1, "_exportRequestForAsset:analyticsActivityType:error:", v17, v18, &v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v35;

        if (v19)
        {
          v21 = dispatch_semaphore_create(0);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke;
          v30[3] = &unk_1E513F778;
          v34 = a1;
          v22 = v11;
          v31 = v22;
          v32 = v27;
          v33 = v21;
          v23 = v21;
          objc_msgSend(a1, "_exportAssetUsingExportRequest:configuration:completion:", v19, v22, v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addChild:withPendingUnitCount:", v24, 90);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v41 = v19;
            v42 = 2112;
            v43 = v28;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Finished creating export request: %@ (progress: %@)", buf, 0x16u);
          }
          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v25;
          v41 = v20;
          v42 = 2112;
          v43 = v28;
          _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Creating export request failed with error: %@ (progress: %@)", buf, 0x16u);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v14);
  }

}

+ (id)_optionsForExportRequest:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosExportUtilities.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exportRequest"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosExportUtilities.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

LABEL_3:
  v10 = objc_alloc_init(MEMORY[0x1E0CD1418]);
  objc_msgSend(v7, "variants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "variantToRequest:asset:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "itemType") == 2)
  {
    objc_msgSend(v10, "setTreatLivePhotoAsStill:", 0);
    if (objc_msgSend(v9, "encodingPolicy") == 2)
      v14 = 2;
    else
      v14 = 1;
    objc_msgSend(v10, "setVariant:", v14);
    objc_msgSend(v10, "setShouldBundleComplexAssetResources:", 1);
  }
  else if (v13)
  {
    objc_msgSend(v10, "setTreatLivePhotoAsStill:", 1);
    objc_msgSend(v10, "setVariant:", objc_msgSend(v13, "PHAssetExportRequestVariantValue"));
  }
  objc_msgSend(v10, "setFlattenSlomoVideos:", 1);
  objc_msgSend(v10, "setShouldStripLocation:", objc_msgSend(v9, "shouldIncludeLocation") ^ 1);
  objc_msgSend(v10, "setShouldStripCaption:", objc_msgSend(v9, "shouldIncludeCaption") ^ 1);
  if (objc_msgSend(v9, "shouldExportForMail"))
    objc_msgSend(v10, "setVideoExportPreset:", *MEMORY[0x1E0C89E78]);

  return v10;
}

+ (id)_exportAssetUsingExportRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosExportUtilities.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (v11)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosExportUtilities.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exportRequest"));

  if (!v10)
    goto LABEL_13;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosExportUtilities.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_optionsForExportRequest:configuration:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__PXPhotosExportUtilities__exportAssetUsingExportRequest_configuration_completion___block_invoke;
    v24[3] = &unk_1E513F7A0;
    v25 = v10;
    v14 = v9;
    v26 = v14;
    v15 = v12;
    v27 = v15;
    v28 = v11;
    objc_msgSend(v14, "exportWithOptions:completionHandler:", v13, v24);
    objc_msgSend(v14, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addChild:withPendingUnitCount:", v16, 1);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v13;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Exporting asset with options: %@ (export progress: %@)", buf, 0x16u);
    }

    v17 = v25;
  }
  else
  {
    v29 = *MEMORY[0x1E0CB2938];
    v30 = CFSTR("Failed to find a variant.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFPAssetRequestErrorDomain"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "variants");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      v33 = 2112;
      v34 = v12;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to find a supported variant in: %@ (export progress: %@)", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

  }
  return v12;
}

+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, id, _QWORD);
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D715D8];
  v7 = (void (**)(id, id, _QWORD))a4;
  if (objc_msgSend(v6, "markPurgeableForFileAtURL:withUrgency:outInode:", v5, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Marked file provider URL (%@) as purgeable.", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to mark file provider URL (%@) as purgeable.", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Successfully provided file at URL: %@", (uint8_t *)&v8, 0xCu);
  }
  v7[2](v7, v5, 0);

}

+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  int v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3620];
  v11 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v10, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v13 = objc_msgSend(v12, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v8, v9, 0, 0, 0, &v15);
  v14 = v15;

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Replaced existing file at URL (%@) with URL (%@).", buf, 0x16u);
    }
    objc_msgSend(a1, "_markURLAsPurgable:completionHandler:", v8, v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to replace file at URL (%@) with URL (%@) with error: %@", buf, 0x20u);
    }
    v11[2](v11, 0, v14);
  }

}

void __83__PXPhotosExportUtilities__exportAssetUsingExportRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "itemType");
  switch(v7)
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isLoopingVideo");
      v11 = (_QWORD *)MEMORY[0x1E0CD18B8];
      if (!v10)
        v11 = (_QWORD *)MEMORY[0x1E0CD18B0];
      goto LABEL_15;
    case 3:
      v8 = (_QWORD *)MEMORY[0x1E0CD18B8];
      goto LABEL_9;
    case 2:
      v8 = (_QWORD *)MEMORY[0x1E0CD1898];
LABEL_9:
      objc_msgSend(v5, "objectForKeyedSubscript:", *v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = *(void **)(a1 + 32);
    v22 = 138412290;
    v23 = v21;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Trying to export unsupported media type: %@", (uint8_t *)&v22, 0xCu);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v13)
  {
    v11 = (_QWORD *)MEMORY[0x1E0CD18B8];
LABEL_15:
    objc_msgSend(v5, "objectForKeyedSubscript:", *v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v14 = v13;
LABEL_16:
  v12 = v14;

LABEL_17:
  if (objc_msgSend(*(id *)(a1 + 48), "isCancelled"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 48);
      v22 = 138412802;
      v23 = v12;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v15;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Exporting asset (%@) cancelled with error: %@ (export progress: %@)";
      v18 = 32;
LABEL_25:
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v18);
    }
  }
  else if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 48);
      v22 = 138412802;
      v23 = v12;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exporting asset (%@) failed with error: %@ (export progress: %@)", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void **)(a1 + 48);
    v22 = 138412546;
    v23 = v12;
    v24 = 2112;
    v25 = v20;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Finished exporting asset: %@ (export progress: %@)";
    v18 = 22;
    goto LABEL_25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke_2;
    v9[3] = &unk_1E513F750;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_downscaleAssetAtURLIfNeeded:configuration:completion:", v5, v8, v9);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to export photo library asset with error: %@", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

void __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v5, v8, &v12);
    v11 = v12;

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Moved %@ to %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed move file: %@", buf, 0xCu);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to downscale photo library asset with error: %@", buf, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke_98(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1[6];
  if (a2 == 1)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, a1[4], 0);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v12 = 0;
    v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v12);
    v9 = v12;

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[5];
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Deleted downscaling temp file at URL: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = a1[5];
      *(_DWORD *)buf = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to delete downscaling temp file at URL: %@ error: %@", buf, 0x16u);
    }

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, a4);
  }
}

void __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
  v1 = (void *)_downscaleImageAtURL_targetDimension_completion__client;
  _downscaleImageAtURL_targetDimension_completion__client = (uint64_t)v0;

}

uint64_t __81__PXPhotosExportUtilities__downscaleAssetAtURLIfNeeded_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke_2;
    v9[3] = &unk_1E51414E0;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_downscaleAssetAtURLIfNeeded:configuration:completion:", v5, v7, v9);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to export photo library asset with error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to downscale photo library asset with error: %@", (uint8_t *)&v8, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

@end
