@implementation PXMusicCurator

+ (id)_requestQueue
{
  if (_requestQueue_onceToken != -1)
    dispatch_once(&_requestQueue_onceToken, &__block_literal_global_232775);
  return (id)_requestQueue_queue;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__PXMusicCurator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_232773 != -1)
    dispatch_once(&log_onceToken_232773, block);
  return (OS_os_log *)(id)log_log_232774;
}

+ (id)bestLocallyAvailableAudioAssetForAssetContainer:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, a1);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryMusicCuratorBestLocallyAvailable", ", (uint8_t *)&v21, 2u);
  }

  objc_msgSend(v4, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;

    if (v10)
    {
      v11 = objc_msgSend(v10, "suggestedMood");
      goto LABEL_10;
    }
  }
  else
  {

    v10 = 0;
  }
  v11 = 16;
LABEL_10:
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchLocalAssetForMood:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLStoryGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) bestLocallyAvailableAudioAssetForAssetContainer finished successfully for asset container (%@) with song: %@.", (uint8_t *)&v21, 0x16u);

  }
  v18 = v8;
  v19 = v18;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_END, v6, "StoryMusicCuratorBestLocallyAvailable", ", (uint8_t *)&v21, 2u);
  }

  return v14;
}

+ (id)requestAppleMusicCurationForAssetContainer:(id)a3 recentlyUsedAdamIDs:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke;
  block[3] = &unk_1E513ABE0;
  v25 = a1;
  v21 = v8;
  v13 = v11;
  v23 = v9;
  v24 = v10;
  v22 = v13;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(v12, block);

  v17 = v23;
  v18 = v13;

  return v18;
}

+ (id)requestFlexMusicCurationForAssetContainer:(id)a3 recentlyUsedFlexSongIDs:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke;
  block[3] = &unk_1E513ABE0;
  v25 = a1;
  v21 = v8;
  v13 = v11;
  v23 = v9;
  v24 = v10;
  v22 = v13;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(v12, block);

  v17 = v23;
  v18 = v13;

  return v18;
}

+ (id)requestAudioAssetFetchResultForAdamIDs:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke;
  v24[3] = &unk_1E513AC50;
  v30 = a1;
  v25 = v10;
  v16 = v14;
  v26 = v16;
  v27 = v12;
  v28 = v11;
  v29 = v13;
  v17 = v11;
  v18 = v12;
  v19 = v13;
  v20 = v10;
  dispatch_async(v15, v24);

  v21 = v28;
  v22 = v16;

  return v22;
}

+ (id)requestAudioAssetIdentifierForPurchasedSongID:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke;
  v24[3] = &unk_1E513AC50;
  v30 = a1;
  v25 = v12;
  v16 = v14;
  v26 = v16;
  v27 = v11;
  v28 = v10;
  v29 = v13;
  v17 = v10;
  v18 = v11;
  v19 = v13;
  v20 = v12;
  dispatch_async(v15, v24);

  v21 = v28;
  v22 = v16;

  return v22;
}

+ (id)_fetchFlexMusicAssetsWithIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsWithIdentifiers:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)requestDebugInformationForAudioAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_requestDebugInformationForFlexMusicAsset:assetContainer:resultHandler:", v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Unsupported audio asset class: %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v9[2](v9, v15, 0);
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));

      goto LABEL_7;
    }
    objc_msgSend((id)objc_opt_class(), "_requestDebugInformationForAppleMusicAsset:assetContainer:resultHandler:", v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

+ (id)_requestDebugInformationForAppleMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoAnalysisClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke;
    v18[3] = &unk_1E513ACC8;
    v14 = v10;
    v19 = v14;
    v22 = v9;
    v20 = v8;
    v21 = v12;
    objc_msgSend(v21, "requestMusicCurationDebugInformationForSongWithAdamID:reply:", v13, v18);

    v15 = v21;
    v16 = v14;

  }
  else
  {
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v16);
  }

  return v10;
}

+ (id)_requestDebugInformationForFlexMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoAnalysisClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke;
    v18[3] = &unk_1E513ACC8;
    v14 = v10;
    v19 = v14;
    v22 = v9;
    v20 = v8;
    v21 = v12;
    objc_msgSend(v21, "requestFlexMusicCurationDebugInformationForSongWithUID:reply:", v13, v18);

    v15 = v21;
    v16 = v14;

  }
  else
  {
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v16);
  }

  return v10;
}

+ (id)_invalidPhotoAnalysisClientError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2938];
  v7[0] = CFSTR("Invalid PhotoAnalysis Client");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "setCompletedUnitCount:", 1);
      objc_msgSend(*(id *)(a1 + 40), "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v8, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke_2;
      v11[3] = &unk_1E513ACA0;
      v12 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 56);
      v13 = v5;
      objc_msgSend(v9, "requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:reply:", v10, v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n==== [Flex Song] ====\n\n%@\n\n==== [Asset Collection] ====\n\n%@"), *(_QWORD *)(a1 + 40), v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "setCompletedUnitCount:", 1);
      objc_msgSend(*(id *)(a1 + 40), "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v8, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke_2;
      v11[3] = &unk_1E513ACA0;
      v12 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 56);
      v13 = v5;
      objc_msgSend(v9, "requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:reply:", v10, v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n==== [Music Song] ====\n\n%@\n\n==== [Asset Collection] ====\n\n%@"), *(_QWORD *)(a1 + 40), v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  NSObject *v14;
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 72), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 72));
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "requestOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke_173;
    v12[3] = &unk_1E513AC78;
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    v16 = v3;
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v6, "requestMusicCatalogAdamIDsForPurchasedSongID:options:reply:", v8, v7, v12);

    v9 = v13;
  }
  else
  {
    +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLStoryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForPurchaasedSongID failed with error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v11 = v5;
    v9 = v11;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", ", buf, 2u);
    }
  }

}

void __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID was cancelled -> exiting without calling resultHandler.", (uint8_t *)&v19, 2u);
    }

    v8 = *(id *)(a1 + 40);
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", ", (uint8_t *)&v19, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  PLStoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v12)
    {
      v19 = 134217984;
      v20 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID finished successfully with fetchResult of length: %ld.", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    objc_msgSend(v5, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v13 = *(id *)(a1 + 40);
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 56);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", ", (uint8_t *)&v19, 2u);
    }

    goto LABEL_14;
  }
  if (v12)
  {
    v19 = 138412290;
    v20 = (uint64_t)v6;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID failed with error %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v16 = *(id *)(a1 + 40);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", ", (uint8_t *)&v19, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

}

void __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[9], "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, a1[9]);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryMusicCuratorFetchFromAdamIDs", ", buf, 2u);
  }

  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[6], "photoAnalysisClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1[7], "requestOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke_169;
      v11[3] = &unk_1E513AC28;
      v8 = a1[4];
      v12 = a1[5];
      v15 = a1[8];
      v13 = a1[6];
      v14 = v5;
      v16 = v3;
      objc_msgSend(v6, "requestSongsForAdamIDs:options:reply:", v8, v7, v11);

    }
    else
    {
      +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLStoryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with error: %@", buf, 0xCu);
      }

      objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
      (*((void (**)(void))a1[8] + 2))();
    }

  }
  else
  {
    PLStoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs returning an empty fetch result because no adamIDs were requested", buf, 2u);
    }

    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    PXAudioAssetFetchResultWithArray(MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[8] + 2))();
  }

}

void __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs was cancelled -> exiting without calling resultHandler.", buf, 2u);
    }

  }
  else if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if (objc_msgSend(v9, "count"))
    {
      +[PXAppleMusicCuration parseAppleMusicAssetsFromJSONArray:photoLibrary:](PXAppleMusicCuration, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v9, *(_QWORD *)(a1 + 40));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      PLStoryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134217984;
        v21 = v13;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs finished successfully with fetchResult of length: %ld.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v14 = *(id *)(a1 + 48);
      v15 = v14;
      v16 = *(_QWORD *)(a1 + 64);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PXStoryMusicCuratorFetchFromAdamIDs", ", buf, 2u);
      }
    }
    else
    {
      PLStoryGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v10;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with json serialization error: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Photo Analysis response contained no songs"), *MEMORY[0x1E0CB2938]);
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PXMusicCuratorErrorDomain"), 0, v11);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    PLStoryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v6;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[16];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[8], "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, a1[8]);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StoryMusicCuratorFlexMusic", ", buf, 2u);
  }

  objc_msgSend(a1[4], "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_161;
    aBlock[3] = &unk_1E513AC28;
    v22 = a1[4];
    v23 = a1[5];
    v25 = a1[7];
    v24 = v5;
    v26 = v3;
    v8 = _Block_copy(aBlock);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)objc_msgSend(a1[6], "copy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D721F8]);

    objc_msgSend(a1[4], "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D72048]);

    objc_msgSend(a1[4], "assetCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isTransient") & 1) != 0)
    {
      objc_msgSend(v13, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "librarySpecificFetchOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = *MEMORY[0x1E0CD19C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFetchPropertySets:", v16);

      objc_msgSend(v15, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v13, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requestFlexMusicCurationForAssetLocalIdentifiers:options:reply:", v18, v9, v8);

    }
    else
    {
      objc_msgSend(v13, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requestFlexMusicCurationForAssetCollectionLocalIdentifier:options:reply:", v15, v9, v8);
    }

    v20 = v22;
  }
  else
  {
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    v19 = (void (**)(id, _QWORD, void *))a1[7];
    +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, v20);
  }

}

void __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXFlexMusicCuration *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLStoryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration received reply for asset container (%@).", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    PLStoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration for asset container (%@) was cancelled -> exiting without calling resultHandler.", buf, 0xCu);

    }
  }
  else if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (objc_msgSend(v12, "count"))
    {
      v29 = v13;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bestSongSuggestions"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXMusicCurator _fetchFlexMusicAssetsWithIdentifiers:](PXMusicCurator, "_fetchFlexMusicAssetsWithIdentifiers:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("secondarySongSuggestions"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXMusicCurator _fetchFlexMusicAssetsWithIdentifiers:](PXMusicCurator, "_fetchFlexMusicAssetsWithIdentifiers:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[PXFlexMusicCuration initWithBestSongSuggestions:secondarySongSuggestions:]([PXFlexMusicCuration alloc], "initWithBestSongSuggestions:secondarySongSuggestions:", v15, v17);
      PLStoryGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138412546;
        v32 = v20;
        v33 = 2048;
        v34 = v21;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration finished successfully for asset container (%@) with bestSongSuggestions count: %ld.", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v22 = *(id *)(a1 + 48);
      v23 = v22;
      v24 = *(_QWORD *)(a1 + 64);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_END, v24, "StoryMusicCuratorFlexMusic", ", buf, 2u);
      }

      v13 = v29;
    }
    else
    {
      PLStoryGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v28;
        v33 = 2112;
        v34 = (uint64_t)v13;
        _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration failed for asset container (%@) with JSON serialization error: %@.", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    PLStoryGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v26;
      v33 = 2112;
      v34 = (uint64_t)v6;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration for asset container (%@) failed with error: %@.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_167(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  void *v30;
  void *v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  os_signpost_id_t v38;
  uint8_t buf[8];
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[8], "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, a1[8]);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StoryMusicCuratorAppleMusic", ", buf, 2u);
  }

  objc_msgSend(a1[4], "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_146;
    aBlock[3] = &unk_1E513AB98;
    v33 = a1[4];
    v34 = a1[5];
    v37 = a1[7];
    v31 = v6;
    v35 = v6;
    v36 = v5;
    v38 = v3;
    v30 = _Block_copy(aBlock);
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "useOnlyMusicForTopicInTopPickSuggestions");
    v10 = objc_msgSend(v8, "includeChillMixInMusicForYou");
    v11 = objc_msgSend(v8, "includeGetUpMixInMusicForYou");
    v12 = objc_alloc(MEMORY[0x1E0C99E08]);
    v41[0] = *MEMORY[0x1E0D72468];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v13;
    v41[1] = *MEMORY[0x1E0D723F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v14;
    v41[2] = *MEMORY[0x1E0D723F8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithDictionary:", v16);

    v18 = (void *)objc_msgSend(a1[6], "copy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D72200]);

    objc_msgSend(a1[4], "originalContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D72048]);

    objc_msgSend(a1[4], "assetCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isTransient") & 1) != 0)
    {
      objc_msgSend(v21, "photoLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "librarySpecificFetchOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = *MEMORY[0x1E0CD19C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFetchPropertySets:", v24);

      objc_msgSend(v23, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v21, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v30;
      objc_msgSend(v7, "requestMusicCurationForAssetLocalIdentifiers:options:reply:", v26, v17, v30);

    }
    else
    {
      objc_msgSend(v21, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v30;
      objc_msgSend(v7, "requestMusicCurationForAssetCollectionLocalIdentifier:options:reply:", v23, v17, v30);
    }

    v29 = v33;
    v6 = v31;
  }
  else
  {
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    v28 = (void (**)(id, _QWORD, void *))a1[7];
    +[PXMusicCurator _invalidPhotoAnalysisClientError](PXMusicCurator, "_invalidPhotoAnalysisClientError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 0, v29);
  }

}

void __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLStoryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration received reply for asset container (%@).", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    PLStoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration was cancelled for asset container (%@) -> exiting without calling resultHandler.", buf, 0xCu);

    }
  }
  else
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject musicSimulatedFailureMode](v9, "musicSimulatedFailureMode") == 3)
    {
      PXStoryErrorCreateWithCodeDebugFormat(5, CFSTR("Simulated Error"), v11, v12, v13, v14, v15, v16, v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PLStoryGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v19;
        v41 = 2112;
        v42 = (uint64_t)v17;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with error: %@.", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    else
    {
      if (-[NSObject musicSimulatedFailureMode](v9, "musicSimulatedFailureMode") == 2)
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 10.0);
      if (objc_msgSend(v5, "length"))
      {
        objc_msgSend(v5, "dataUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v20, 0, &v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v38;
        if (objc_msgSend(v21, "count"))
        {
          +[PXAppleMusicCuration curationFromDictionary:photoLibrary:](PXAppleMusicCuration, "curationFromDictionary:photoLibrary:", v21, *(_QWORD *)(a1 + 48));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PLStoryGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "bestMusicSuggestions");
            v37 = v20;
            v26 = v22;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");
            *(_DWORD *)buf = 138412546;
            v40 = v25;
            v41 = 2048;
            v42 = v28;
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration finished successfully for asset container (%@) with bestMusicSuggestions count: %ld.", buf, 0x16u);

            v22 = v26;
            v20 = v37;

          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          v29 = *(id *)(a1 + 56);
          v30 = v29;
          v31 = *(_QWORD *)(a1 + 72);
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v30, OS_SIGNPOST_INTERVAL_END, v31, "StoryMusicCuratorAppleMusic", ", buf, 2u);
          }

        }
        else
        {
          PLStoryGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v40 = v35;
            v41 = 2112;
            v42 = (uint64_t)v22;
            _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with JSON serialization error: %@.", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        }

      }
      else
      {
        PLStoryGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v33;
          v41 = 2112;
          v42 = (uint64_t)v6;
          _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with error: %@.", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
    }
  }

}

uint64_t __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_158(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __21__PXMusicCurator_log__block_invoke(uint64_t a1)
{
  id v1;
  const char *v2;
  os_log_t v3;
  void *v4;

  NSStringFromClass(*(Class *)(a1 + 32));
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v1, "UTF8String");

  v3 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v2);
  v4 = (void *)log_log_232774;
  log_log_232774 = (uint64_t)v3;

}

void __31__PXMusicCurator__requestQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PXMusicCuration", v0);
  v2 = (void *)_requestQueue_queue;
  _requestQueue_queue = (uint64_t)v1;

}

@end
