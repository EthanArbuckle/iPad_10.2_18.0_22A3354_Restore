@implementation PULivePhotoVariationEditOperationPerformer

- (PHAsset)asset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVariationEditOperationPerformer;
  -[PXAssetEditOperationPerformer asset](&v3, sel_asset);
  return (PHAsset *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *sourceEditOperationType;
  void *v9;
  id v10;

  v4 = a3;
  -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playbackStyle");

  if (v6 == 1)
  {
    v7 = (NSString *)(id)*MEMORY[0x1E0D7C180];
  }
  else
  {
    -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_currentVariationType");

    PXAssetEditOperationTypeForVariationType();
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  sourceEditOperationType = self->_sourceEditOperationType;
  self->_sourceEditOperationType = v7;

  -[PXAssetEditOperationPerformer editOperationType](self, "editOperationType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVariationEditOperationPerformer _performEditOperation:completionHandler:](self, "_performEditOperation:completionHandler:", v10, v4);

}

- (void)performUndo:(id)a3
{
  -[PULivePhotoVariationEditOperationPerformer _performEditOperation:completionHandler:](self, "_performEditOperation:completionHandler:", self->_sourceEditOperationType, a3);
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
  -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PULivePhotoVariationEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2;
  v15[3] = &unk_1E58A3558;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v16 = v14;
  objc_msgSend(v12, "loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:", v13, 0, 0, &__block_literal_global_141, v15);

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

- (void)_saveAssetEditsWithContentEditingInput:(id)a3 compositionController:(id)a4 lastSavedCompositionController:(id)a5 imageVersion:(int64_t)a6 editOperationType:(id)a7
{
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  PUPhotoEditIrisModel *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  PEPhotoKitMediaDestination *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  PEPhotoKitMediaDestination *mediaDestination;
  uint64_t v46;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  PUPhotoEditIrisModel *v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id location;
  _QWORD v65[4];
  PUPhotoEditIrisModel *v66;
  char v67;

  v51 = a3;
  v11 = a4;
  v50 = a5;
  v12 = a7;
  -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoLibrary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((id)*MEMORY[0x1E0D7C180] == v12)
    v14 = 1;
  else
    v14 = objc_msgSend(v12, "isEqualToString:");
  PXAssetEditOperationTypeForVariationType();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v12)
    v16 = 1;
  else
    v16 = objc_msgSend(v12, "isEqualToString:", v15);

  v17 = -[PUPhotoEditIrisModel initWithAsset:compositionController:]([PUPhotoEditIrisModel alloc], "initWithAsset:compositionController:", v13, v11);
  if (v14 == -[PUPhotoEditIrisModel isVideoEnabled](v17, "isVideoEnabled"))
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke;
    v65[3] = &unk_1E58AAD68;
    v66 = v17;
    v67 = v14 ^ 1;
    -[PUViewModel performChanges:](v66, "performChanges:", v65);

  }
  objc_initWeak(&location, self);
  objc_msgSend(v50, "composition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v11, "isEqual:visualChangesOnly:", v18, 0);

  if (v19 && !objc_msgSend(v13, "hasAdjustments"))
  {
    v42 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_4;
    v56[3] = &unk_1E58ABCA8;
    v43 = v13;
    v57 = v43;
    v58 = v17;
    v52[0] = v42;
    v52[1] = 3221225472;
    v52[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_5;
    v52[3] = &unk_1E58A39C8;
    objc_copyWeak(&v55, &location);
    v53 = v49;
    v54 = v43;
    objc_msgSend(v53, "performChanges:completionHandler:", v56, v52);

    objc_destroyWeak(&v55);
    goto LABEL_26;
  }
  objc_msgSend(v11, "depthAdjustmentController", a6, v49);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "enabled");

  if (((v21 ^ 1 | v14) & 1) == 0)
  {
    -[PULivePhotoVariationEditOperationPerformer setLiveIsEnabled:](self, "setLiveIsEnabled:", -[PUPhotoEditIrisModel isVideoEnabled](v17, "isVideoEnabled"));
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CAE8]), "initWithAsset:delegate:hasDepth:hasLive:", v13, self, 1, 1);
    v23 = v22;
    if (v16)
      v24 = 4;
    else
      v24 = 6;
    objc_msgSend(v22, "applySideEffectsForAction:compositionController:", v24, v11);

  }
  PXAssetEditOperationTypeForVariationType();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  v27 = v25;
  v28 = 0x1E0D7C000uLL;
  if (v27 == v26)
  {

  }
  else
  {
    v29 = v27;
    v30 = objc_msgSend(v26, "isEqualToString:", v27);

    if (!v30)
      goto LABEL_25;
  }
  v63 = 0;
  objc_msgSend(MEMORY[0x1E0D7CB38], "compositionControllerForContentEditingInput:asShot:error:", v51, 1, &v63);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v63;
  v33 = v32;
  if (!v31)
  {

    v28 = 0x1E0D7C000uLL;
    goto LABEL_25;
  }
  v34 = objc_alloc(MEMORY[0x1E0D75140]);
  objc_msgSend(v51, "fullSizeImageURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithMediaURL:timeZoneLookup:", v35, 0);

  objc_msgSend(MEMORY[0x1E0D7CB58], "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v31, v11, 1, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "composition");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v11, "isEqual:visualChangesOnly:", v38, 1);

  v28 = 0x1E0D7C000;
  if ((v39 & 1) == 0)
  {
LABEL_25:
    objc_msgSend(*(id *)(v28 + 2872), "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v51, v11, v13, 0, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    mediaDestination = self->_mediaDestination;
    v46 = -[PUPhotoEditIrisModel editingVisibility](v17, "editingVisibility");
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_3;
    v59[3] = &unk_1E58A35A8;
    objc_copyWeak(&v60, &location);
    -[PEPhotoKitMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:](mediaDestination, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v13, v11, v44, v48, v46, v59);
    objc_destroyWeak(&v60);

    goto LABEL_26;
  }
  v40 = self->_mediaDestination;
  v41 = (void *)MEMORY[0x1E0D7CB58];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_2;
  v61[3] = &unk_1E58A3580;
  objc_copyWeak(&v62, &location);
  objc_msgSend(v41, "revertEditsForAsset:mediaDestination:currentCompositionController:completionHandler:", v13, v40, v11, v61);
  objc_destroyWeak(&v62);
LABEL_26:
  objc_destroyWeak(&location);

}

- (void)_handleLoadResult:(id)a3 analysisResult:(id)a4 editOperationType:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(_QWORD);
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  id v31;
  PULivePhotoVariationEditOperationPerformer *v32;
  id v33;
  uint64_t v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "retrievedVersion");
  objc_msgSend(v8, "contentEditingInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compositionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke;
  aBlock[3] = &unk_1E58A3670;
  v14 = v8;
  v28 = v14;
  v15 = v13;
  v29 = v15;
  v16 = v10;
  v30 = v16;
  v17 = v9;
  v31 = v17;
  v32 = self;
  v18 = v12;
  v33 = v18;
  v34 = v11;
  v19 = (void (**)(_QWORD))_Block_copy(aBlock);
  v20 = objc_alloc(MEMORY[0x1E0D7CAE8]);
  -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithAsset:delegate:hasDepth:hasLive:", v21, self, 1, 1);

  objc_msgSend(v22, "confirmationWarningStringForAction:compositionController:", 6, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
    v26 = v19;
    px_dispatch_on_main_queue();

  }
  else
  {
    v19[2](v19);
  }

}

- (void)_handleDidFinishSavingEditsForAsset:(id)a3 error:(id)a4
{
  -[PULivePhotoVariationEditOperationPerformer _completeWithSuccess:error:](self, "_completeWithSuccess:error:", a4 == 0);
}

- (void)_resourceLoadedWithResult:(id)a3 editOperationType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id buf;
  id v44;

  v6 = a3;
  v7 = a4;
  -[PULivePhotoVariationEditOperationPerformer asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentEditingInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D71260];
  v38 = v9;
  objc_msgSend(v9, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imagePropertiesRequestWithComposition:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setName:", CFSTR("PLCompositionHelper-getImageURL"));
  v44 = 0;
  objc_msgSend(v14, "submitSynchronous:", &v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v44;
  v37 = v10;
  if (v15
    && (objc_msgSend(v15, "properties"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "url"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v17))
  {
    objc_msgSend(v10, "overCapturePhotoURL");
    v18 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqual:", v18))
      v19 = CFSTR("-Overcapture");
    else
      v19 = CFSTR("-Original");
  }
  else
  {
    PLPhotoEditGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEBUG, "Could not read image source URL for composition controller", (uint8_t *)&buf, 2u);
    }
    v17 = 0;
    v19 = CFSTR("-Original");
  }

  objc_msgSend(v11, "stringByAppendingString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (id)*MEMORY[0x1E0D7C180];
  if (v21 == v7)
    goto LABEL_16;
  v22 = v21;
  v23 = objc_msgSend(v7, "isEqualToString:", v21);

  if ((v23 & 1) != 0)
  {
LABEL_17:
    -[PULivePhotoVariationEditOperationPerformer _handleLoadResult:analysisResult:editOperationType:](self, "_handleLoadResult:analysisResult:editOperationType:", v6, 0, v7);
    v30 = v38;
    goto LABEL_18;
  }
  PXAssetEditOperationTypeForVariationType();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 == v7)
  {

LABEL_16:
    goto LABEL_17;
  }
  v25 = v24;
  v26 = objc_msgSend(v7, "isEqualToString:", v24);

  if ((v26 & 1) != 0)
    goto LABEL_17;
  objc_msgSend(v8, "photoLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "variationCache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v28;
  objc_msgSend(v28, "analysisResultForAssetIdentifier:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[PULivePhotoVariationEditOperationPerformer _handleLoadResult:analysisResult:editOperationType:](self, "_handleLoadResult:analysisResult:editOperationType:", v6, v29, v7);
    v30 = v38;
  }
  else
  {
    objc_msgSend(v6, "compositionController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "composition");
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v32;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71168]), "initWithComposition:", v32);
    objc_initWeak(&buf, self);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __90__PULivePhotoVariationEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke;
    v39[3] = &unk_1E58A36C0;
    objc_copyWeak(&v42, &buf);
    v40 = v6;
    v41 = v7;
    objc_msgSend(v34, "submit:", v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&buf);

    v30 = v38;
    v29 = 0;
  }

LABEL_18:
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (BOOL)liveIsEnabled
{
  return self->_liveIsEnabled;
}

- (void)setLiveIsEnabled:(BOOL)a3
{
  self->_liveIsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEditOperationType, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __90__PULivePhotoVariationEditOperationPerformer__resourceLoadedWithResult_editOperationType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_handleLoadResult:analysisResult:editOperationType:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(WeakRetained, "_completeWithSuccess:error:", 0, v4);

}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v2 = objc_alloc(MEMORY[0x1E0D71990]);
  objc_msgSend(*(id *)(a1 + 32), "editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEditSource:renderPriority:", v3, 2);

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = PXAssetVariationTypeForEditOperationType();
  objc_msgSend(*(id *)(a1 + 32), "editSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2;
  v28[3] = &unk_1E58A35D0;
  v30 = v6;
  v29 = *(id *)(a1 + 56);
  objc_msgSend(v4, "applySourceChangesToCompositionSynchronously:source:withBlock:", v5, v7, v28);

  if (v6 == 3)
  {
    v9 = objc_alloc(MEMORY[0x1E0D711E0]);
    objc_msgSend(v5, "composition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithComposition:", v10);

    objc_msgSend(v11, "setName:", CFSTR("PU-PILongExposureFusionAutoCalculator"));
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3;
    v21[3] = &unk_1E58A3648;
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(void **)(a1 + 72);
    v22 = v5;
    v23 = v12;
    v24 = v13;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 80);
    v25 = v14;
    v27 = v15;
    v26 = *(id *)(a1 + 48);
    v16 = v5;
    objc_msgSend(v11, "submit:", v21);

  }
  else
  {
    v18 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v17 = v5;
    px_dispatch_on_main_queue();

  }
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3_168(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D7B190];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4_170;
  v5[3] = &unk_1E58A3698;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v4 = (id)objc_msgSend(v2, "show:", v5);

}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4_170(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v6);

  PXLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_5;
  v11[3] = &unk_1E58ABAC8;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v7, 0, v11);

  PXLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_6;
  v10[3] = &unk_1E58ABD10;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v9, 1, v10);

}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeWithSuccess:error:", 1, 0);
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D71660];
  v4 = a2;
  objc_msgSend(v3, "compositionController:applyAssetVariation:withRecipe:", v4, PFMetadataPlaybackVariationFromPXAssetVariation(), *(_QWORD *)(a1 + 32));

}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(a2, "result:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed generating long exposure fusion alignment data. Error: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "count"))
  {
    v6 = a1[4];
    v7 = *MEMORY[0x1E0D71370];
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4;
    v13[3] = &unk_1E58A35F8;
    v14 = v3;
    objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v13);
    v8 = v14;
LABEL_6:

  }
  v9 = a1[6];
  v10 = a1[4];
  v11 = a1[7];
  v12 = a1[8];
  px_dispatch_on_main_queue();

}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_2_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveAssetEditsWithContentEditingInput:compositionController:lastSavedCompositionController:imageVersion:editOperationType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

void __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAlignment:", v2);
  objc_msgSend(v3, "setEnabled:", 1);

}

uint64_t __97__PULivePhotoVariationEditOperationPerformer__handleLoadResult_analysisResult_editOperationType___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveAssetEditsWithContentEditingInput:compositionController:lastSavedCompositionController:imageVersion:editOperationType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

uint64_t __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishSavingEditsForAsset:error:", v7, v5);

}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidFinishSavingEditsForAsset:error:", v7, v5);

}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoIrisVisibilityState:", objc_msgSend(*(id *)(a1 + 40), "editingVisibility"));

}

void __169__PULivePhotoVariationEditOperationPerformer__saveAssetEditsWithContentEditingInput_compositionController_lastSavedCompositionController_imageVersion_editOperationType___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleDidFinishSavingEditsForAsset:error:", v12, 0);

  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v6, "_handleDidFinishSavingEditsForAsset:error:", 0, v5);
  }

}

void __73__PULivePhotoVariationEditOperationPerformer__completeWithSuccess_error___block_invoke(uint64_t a1)
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
    objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.saving.livePhotoEffectSavingFailed"), v8);

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

void __86__PULivePhotoVariationEditOperationPerformer__performEditOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  if (_sharedResourceManager_onceToken != -1)
    dispatch_once(&_sharedResourceManager_onceToken, &__block_literal_global_137);
  return (id)_sharedResourceManager_manager;
}

void __68__PULivePhotoVariationEditOperationPerformer__sharedResourceManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D7CB30]);
  v1 = (void *)_sharedResourceManager_manager;
  _sharedResourceManager_manager = (uint64_t)v0;

}

@end
