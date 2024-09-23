@implementation PESupport

+ (BOOL)photoWasTakenWithoutFlashWithImageProperties:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v7;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD9470]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD94A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v5, "integerValue") & 1) == 0 && v5 != 0;

  return v7;
}

+ (void)syncMainThread:(id)a3
{
  void *v3;
  void (**v4)(void);
  _QWORD block[4];
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3 = (void *)MEMORY[0x212B9EB94]();
    v4[2]();
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__PESupport_syncMainThread___block_invoke;
    block[3] = &unk_24C618E88;
    v6 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

+ (void)revertEditsForAsset:(id)a3 mediaDestination:(id)a4 currentCompositionController:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDE3528]);
  objc_msgSend(v13, "setResultHandlerQueue:", MEMORY[0x24BDAC9B8]);
  objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v13, "setOriginalChoice:", objc_msgSend(v9, "originalResourceChoice"));
  objc_msgSend(v13, "setForceRunAsUnadjustedAsset:", 1);
  objc_msgSend(v13, "setForceReturnFullLivePhoto:", 1);
  objc_msgSend(v13, "setSkipDisplaySizeImage:", 1);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke;
  v18[3] = &unk_24C618ED8;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v22 = v12;
  v14 = v9;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  objc_msgSend(v14, "requestContentEditingInputWithOptions:completionHandler:", v13, v18);

}

+ (id)repairedAsShotCompositionController:(id)a3 forCurrentCompositionController:(id)a4 isLivePhoto:(BOOL)a5 metadata:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  char v28;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v11, "depthAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "enabled");
  objc_msgSend(v12, "depthAdjustmentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v9, "depthAdjustmentController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_8;
    if (v10)
      v17 = ((unint64_t)objc_msgSend(v10, "photoProcessingFlags") >> 24) & 1;
    else
      LOBYTE(v17) = 0;
    v18 = *MEMORY[0x24BE71DB8];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke;
    v26[3] = &unk_24C618F00;
    v27 = v9;
    v28 = v17;
    objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v18, v26);
    v15 = v27;
  }

LABEL_8:
  objc_msgSend(v12, "portraitVideoAdjustmentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v9, "portraitVideoAdjustmentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = *MEMORY[0x24BE71E40];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_2;
    v24[3] = &unk_24C618F28;
    v25 = v9;
    objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v21, v24);
    v19 = v25;
    goto LABEL_11;
  }
LABEL_12:
  if (((!v7 | v14) & 1) == 0)
  {
    objc_msgSend(v12, "depthAdjustmentController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", *MEMORY[0x24BE71DB8], &__block_literal_global_1937);
  }

  return v12;
}

+ (void)assetHasDepthEnabled:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__PESupport_assetHasDepthEnabled_queue_handler___block_invoke;
  v9[3] = &unk_24C618F90;
  v10 = v7;
  v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:](PEAdjustmentDataCache, "requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:", a3, 0, a4, v9);

}

+ (void)assetPlaybackRate:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__PESupport_assetPlaybackRate_queue_handler___block_invoke;
  v9[3] = &unk_24C618F90;
  v10 = v7;
  v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:](PEAdjustmentDataCache, "requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:", a3, 0, a4, v9);

}

+ (void)assetAudioMixMode:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__PESupport_assetAudioMixMode_queue_handler___block_invoke;
  v9[3] = &unk_24C618F90;
  v10 = v7;
  v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:](PEAdjustmentDataCache, "requestCompositionControllerForAsset:networkAccessAllowed:queue:completion:", a3, 0, a4, v9);

}

+ (id)originalAdjustmentVersionForAsset:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE34D8], "assetResourcesForAsset:", v3);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == 16)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1927;
  v24 = __Block_byref_object_dispose__1928;
  v25 = 0;
  if (v5)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDE34F0]);
    objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    objc_msgSend(MEMORY[0x24BDE34E8], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __47__PESupport_originalAdjustmentVersionForAsset___block_invoke;
    v19[3] = &unk_24C618FB8;
    v19[4] = &v20;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__PESupport_originalAdjustmentVersionForAsset___block_invoke_2;
    v17[3] = &unk_24C618FE0;
    v12 = v10;
    v18 = v12;
    objc_msgSend(v11, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v5, v9, v19, v17);

    v13 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v12, v13);

    v14 = (void *)v21[5];
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

+ (BOOL)assetHasUnsupportedOriginalAdjustments:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  +[PESupport originalAdjustmentVersionForAsset:](PESupport, "originalAdjustmentVersionForAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE71C70], "locallySupportedFormatVersions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);

    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)canPerformEditOnAsset:(id)a3
{
  id v3;
  _BOOL4 v4;
  int v5;
  int v6;
  int v7;

  v3 = a3;
  if (objc_msgSend(v3, "isPhotoIrisPlaceholder"))
    v4 = objc_msgSend(v3, "deferredProcessingNeeded") != 2;
  else
    v4 = 0;
  v5 = objc_msgSend(v3, "isAnimatedImage");
  v6 = objc_msgSend(v3, "isVideo");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v3, "canPlayLoopingVideo");
  LOBYTE(v7) = 0;
  if (((v4 | v5) & 1) == 0 && (v6 & 1) == 0)
    v7 = objc_msgSend(v3, "isTrashed") ^ 1;

  return v7;
}

+ (id)pe_bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

void __47__PESupport_originalAdjustmentVersionForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a2, 0, 0, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *MEMORY[0x24BE72268];
    v5 = v9;
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __47__PESupport_originalAdjustmentVersionForAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    PLPhotoEditGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_20D13D000, v4, OS_LOG_TYPE_ERROR, "PESupport: Unable to retrieve original adjustment data: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __45__PESupport_assetAudioMixMode_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "cinematicAudioAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderingStyle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)*MEMORY[0x24BE71D88];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__PESupport_assetPlaybackRate_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "slomoAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "slomoAdjustmentController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rate");
    v6 = v5;

  }
  else
  {
    v6 = 1.0;
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);
}

void __48__PESupport_assetHasDepthEnabled_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "depthAdjustmentController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "enabled");
  objc_msgSend(v3, "depthAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v4, v5 != 0);
}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE71DB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromAdjustment:", v4);

  objc_msgSend(v9, "capturedAperture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "capturedAperture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v9, "setAperture:", v7);

  }
  objc_msgSend(v9, "capturedFocusRect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFocusRect:", v8);

  objc_msgSend(v9, "setEnabled:", *(_BYTE *)(a1 + 40) == 0);
}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE71E40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromAdjustment:", v4);

  objc_msgSend(v5, "setEnabled:", 1);
  objc_msgSend(v5, "setAperture:", 0);
  objc_msgSend(v5, "setDisparityKeyframes:", 0);
  objc_msgSend(v5, "setCinematographyState:", 0);
  objc_msgSend(v5, "setDebugMode:", 0);

}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  float v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "capturedAperture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v6, "capturedAperture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    objc_msgSend(v6, "setAperture:", v4);

  }
  objc_msgSend(v6, "capturedFocusRect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFocusRect:", v5);

  objc_msgSend(v6, "setEnabled:", 0);
}

void __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a2;
  if (v5)
  {
    v27 = 0;
    +[PESerializationUtility editSourceForContentEditingInput:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useEmbeddedPreview:error:", v5, 0, &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (v6)
    {
      v26 = 0;
      +[PESerializationUtility compositionControllerForContentEditingInput:asShot:source:error:](PESerializationUtility, "compositionControllerForContentEditingInput:asShot:source:error:", v5, 1, v6, &v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v26;
      if (v8)
      {
        v10 = objc_alloc(MEMORY[0x24BE72400]);
        objc_msgSend(v5, "fullSizeImageURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithMediaURL:timeZoneLookup:", v11, 0);

        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "livePhoto");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PESupport repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:](PESupport, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v8, v13, v14 != 0, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      v17 = *(void **)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke_2;
      v20[3] = &unk_24C618EB0;
      v21 = v15;
      v25 = *(id *)(a1 + 56);
      v22 = v5;
      v23 = *(id *)(a1 + 48);
      v24 = *(id *)(a1 + 40);
      v19 = v15;
      objc_msgSend(v17, "revertEditsForAsset:completionHandler:", v18, v20);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDE3790]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BE71F80], "isIdentityCompositionController:", *(_QWORD *)(a1 + 32)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    +[PESerializationUtility contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:](PESerializationUtility, "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v7, *(_QWORD *)(a1 + 32), v6, 1, 0, *(_QWORD *)(a1 + 64));

  }
}

void __28__PESupport_syncMainThread___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212B9EB94]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
