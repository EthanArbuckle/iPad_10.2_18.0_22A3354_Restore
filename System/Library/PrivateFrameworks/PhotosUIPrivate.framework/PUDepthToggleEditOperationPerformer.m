@implementation PUDepthToggleEditOperationPerformer

- (PHAsset)asset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUDepthToggleEditOperationPerformer;
  -[PXAssetEditOperationPerformer asset](&v3, sel_asset);
  return (PHAsset *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)performAction:(id)a3
{
  id v4;
  NSString *v5;
  NSString *sourceEditOperationType;
  id v7;

  v4 = a3;
  -[PUDepthToggleEditOperationPerformer _shouldEnableDepth](self, "_shouldEnableDepth");
  PXAssetEditOperationTypeForDepthToggle();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  sourceEditOperationType = self->_sourceEditOperationType;
  self->_sourceEditOperationType = v5;

  -[PXAssetEditOperationPerformer editOperationType](self, "editOperationType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUDepthToggleEditOperationPerformer _performEditOperation:completionHandler:](self, "_performEditOperation:completionHandler:", v7, v4);

}

- (void)performUndo:(id)a3
{
  -[PUDepthToggleEditOperationPerformer _performEditOperation:completionHandler:](self, "_performEditOperation:completionHandler:", self->_sourceEditOperationType, a3);
}

- (void)_performEditOperation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id completionHandler;
  PEPhotoKitMediaDestination *v10;
  PEPhotoKitMediaDestination *mediaDestination;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v8;

  v10 = (PEPhotoKitMediaDestination *)objc_alloc_init(MEMORY[0x1E0D7CAF8]);
  mediaDestination = self->_mediaDestination;
  self->_mediaDestination = v10;

  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "_sharedResourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDepthToggleEditOperationPerformer asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PUDepthToggleEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2;
  v15[3] = &unk_1E58A3558;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v16 = v14;
  objc_msgSend(v12, "loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:", v13, 0, 0, &__block_literal_global_269, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  px_dispatch_on_main_queue();

}

- (void)_handleLoadResult:(id)a3 imageValues:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUPhotoEditIrisModel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  PEPhotoKitMediaDestination *mediaDestination;
  void *v26;
  void *v27;
  PEPhotoKitMediaDestination *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  objc_msgSend(v33, "portraitValuesWithAccuracy:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D71358]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v6, "compositionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v8, "depthAdjustmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "depthInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("focusRect"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "adjustmentConstants");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "PIDepthAdjustmentKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke;
      v47[3] = &unk_1E58A3728;
      v48 = v35;
      v49 = v36;
      v50 = v34;
      objc_msgSend(v8, "modifyAdjustmentWithKey:modificationBlock:", v12, v47);

    }
    -[PUDepthToggleEditOperationPerformer asset](self, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUPhotoEditIrisModel initWithAsset:compositionController:]([PUPhotoEditIrisModel alloc], "initWithAsset:compositionController:", v13, v8);
    objc_msgSend(v6, "contentEditingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "livePhoto");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "videoComplementOriginalStillImageTime");
    }
    else
    {
      v45 = 0uLL;
      v46 = 0;
    }
    v43 = v45;
    v44 = v46;
    -[PUDepthToggleEditOperationPerformer setOriginalStillImageTime:](self, "setOriginalStillImageTime:", &v43);
    -[PUDepthToggleEditOperationPerformer setLiveIsEnabled:](self, "setLiveIsEnabled:", -[PUPhotoEditIrisModel isVideoEnabled](v14, "isVideoEnabled"));
    if (v16)
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CAE8]), "initWithAsset:delegate:hasDepth:hasLive:", v13, self, 1, 1);
    else
      v32 = 0;
    +[PUPhotoEditEffectsSupport updateCompositionController:withDepthEnabled:livePortraitBehaviorController:](PUPhotoEditEffectsSupport, "updateCompositionController:withDepthEnabled:livePortraitBehaviorController:", v8, -[PUDepthToggleEditOperationPerformer _shouldEnableDepth](self, "_shouldEnableDepth"), v32);
    if ((-[PUDepthToggleEditOperationPerformer liveIsEnabled](self, "liveIsEnabled") || v16 == 0)
      && !-[PUDepthToggleEditOperationPerformer _shouldEnableDepth](self, "_shouldEnableDepth")
      && (v42 = 0,
          objc_msgSend(MEMORY[0x1E0D7CB38], "compositionControllerForContentEditingInput:asShot:error:", v15, 1, &v42),
          (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = objc_alloc(MEMORY[0x1E0D75140]);
      objc_msgSend(v15, "fullSizeImageURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v20, "initWithMediaURL:timeZoneLookup:", v21, 0);

      objc_msgSend(MEMORY[0x1E0D7CB58], "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v19, v8, v16 != 0, v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "composition");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v8, "isEqual:visualChangesOnly:", v23, 1);

      objc_initWeak(&location, self);
      if (v24)
      {
        mediaDestination = self->_mediaDestination;
        v26 = (void *)MEMORY[0x1E0D7CB58];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_2;
        v39[3] = &unk_1E58A3580;
        objc_copyWeak(&v40, &location);
        objc_msgSend(v26, "revertEditsForAsset:mediaDestination:currentCompositionController:completionHandler:", v13, mediaDestination, v8, v39);
        objc_destroyWeak(&v40);
LABEL_18:
        objc_destroyWeak(&location);

        goto LABEL_19;
      }
    }
    else
    {
      objc_initWeak(&location, self);
    }
    objc_msgSend(MEMORY[0x1E0D7CB38], "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v15, v8, v13, 0, 0, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self->_mediaDestination;
    v29 = objc_msgSend(v6, "retrievedVersion");
    v30 = -[PUPhotoEditIrisModel editingVisibility](v14, "editingVisibility");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_3;
    v37[3] = &unk_1E58A35A8;
    objc_copyWeak(&v38, &location);
    -[PEPhotoKitMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:](v28, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v13, v8, v27, v29, v30, v37);
    objc_destroyWeak(&v38);

    goto LABEL_18;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2938];
  v52[0] = CFSTR("Asset is missing depth info");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PUEditOperationPerformerErrorDomain"), 1, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUDepthToggleEditOperationPerformer _completeWithSuccess:error:](self, "_completeWithSuccess:error:", 0, v8);
LABEL_19:

}

- (BOOL)_shouldEnableDepth
{
  void *v2;
  char IsEnableDepth;

  -[PXAssetEditOperationPerformer editOperationType](self, "editOperationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEnableDepth = PXAssetEditOperationTypeIsEnableDepth();

  return IsEnableDepth;
}

- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D7CB60]);
  objc_msgSend(v6, "editSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditSource:", v9);

  objc_msgSend(v6, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71378]);
  objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71470]);
  objc_msgSend(v8, "setCompositionController:", v11);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke;
  v14[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v17, &location);
  v12 = v6;
  v15 = v12;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v13, "precomputeImageValuesWithCompletion:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)liveIsEnabled
{
  return self->_liveIsEnabled;
}

- (void)setLiveIsEnabled:(BOOL)a3
{
  self->_liveIsEnabled = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[5].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[5].var3 + 4);
  return self;
}

- (void)setOriginalStillImageTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)(&self->_liveIsEnabled + 4) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_originalStillImageTime.flags = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEditOperationType, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;

  objc_copyWeak(&v4, a1 + 6);
  v2 = a1[4];
  v3 = a1[5];
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v4);
}

void __83__PUDepthToggleEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleLoadResult:imageValues:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  float v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setDepthInfo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D71340]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v7, "setAperture:", v4);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D71348]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFocusRect:", v5);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D71350]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlassesMatteAllowed:", v6);

  if (!*(_QWORD *)(a1 + 48))
    objc_msgSend(v7, "setEnabled:", 0);

}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_completeWithSuccess:error:", v4 == 0, v4);

}

void __69__PUDepthToggleEditOperationPerformer__handleLoadResult_imageValues___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_completeWithSuccess:error:", v4 == 0, v4);

}

void __66__PUDepthToggleEditOperationPerformer__completeWithSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalUnitCount");
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedUnitCount:", v3);

  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = (void *)MEMORY[0x1E0D09910];
    v14 = *MEMORY[0x1E0D09830];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.saving.depthEffectSavingFailed"), v8);

  }
  v9 = *(const void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v9)
  {
    v10 = _Block_copy(v9);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 88);
    *(_QWORD *)(v11 + 88) = 0;

    objc_msgSend(*(id *)(a1 + 32), "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCancellationHandler:", 0);

    (*((void (**)(void *, _QWORD, _QWORD))v10 + 2))(v10, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
}

void __79__PUDepthToggleEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v8)
    objc_msgSend(WeakRetained, "_resourceLoadedWithResult:editOperationType:", v8, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_completeWithSuccess:error:", 0, v5);

}

+ (id)_sharedResourceManager
{
  if (_sharedResourceManager_onceToken_266 != -1)
    dispatch_once(&_sharedResourceManager_onceToken_266, &__block_literal_global_268);
  return (id)_sharedResourceManager_manager_267;
}

void __61__PUDepthToggleEditOperationPerformer__sharedResourceManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D7CB30]);
  v1 = (void *)_sharedResourceManager_manager_267;
  _sharedResourceManager_manager_267 = (uint64_t)v0;

}

@end
