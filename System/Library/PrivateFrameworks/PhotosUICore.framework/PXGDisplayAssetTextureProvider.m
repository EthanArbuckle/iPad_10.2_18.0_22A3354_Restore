@implementation PXGDisplayAssetTextureProvider

- (void)viewEnvironmentDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v4 = a3;
  -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    os_unfair_lock_lock(&self->_lookupLock);
    v8 = (id)-[NSMutableIndexSet copy](self->_lookupLock_requestIDsWithDeliveredPlaceholders, "copy");
    os_unfair_lock_unlock(&self->_lookupLock);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PXGDisplayAssetTextureProvider_viewEnvironmentDidChange___block_invoke;
    v9[3] = &unk_1E5140880;
    v9[4] = self;
    objc_msgSend(v8, "enumerateRangesUsingBlock:", v9);

  }
}

uint64_t __73__PXGDisplayAssetTextureProvider__workQueue_processDeferredImageRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 137);
  LOBYTE(v2) = *(_BYTE *)(a1 + 136);
  objc_msgSend(WeakRetained, "_requestQueue_requestTexturesForSpritesInRange:observer:textureRequestIDs:displayAssetFetchResult:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:cannotBeSatisfiedWithThumbnail:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), vcvtq_f64_f32(*(float32x2_t *)(a1 + 96)), *(double *)(a1 + 104), *(double *)(a1 + 112), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120), v2, *(_QWORD *)(a1 + 56));

}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_performDeferredImageRequest:targetSize:contentMode:options:resultHandler:textureRequestID:mediaProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

- (void)_workQueue_performDeferredImageRequest:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 textureRequestID:(int)a8 mediaProvider:(id)a9
{
  uint64_t v10;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *cancelationQueue;
  _QWORD v23[4];
  id v24;
  PXGDisplayAssetTextureProvider *v25;
  uint64_t v26;
  int v27;

  v10 = *(_QWORD *)&a8;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v10))
  {
    v21 = objc_msgSend(v20, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v17, a5, v18, v19, width, height);
    if (v21)
    {
      cancelationQueue = self->_cancelationQueue;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __149__PXGDisplayAssetTextureProvider__workQueue_performDeferredImageRequest_targetSize_contentMode_options_resultHandler_textureRequestID_mediaProvider___block_invoke;
      v23[3] = &unk_1E512A8B8;
      v25 = self;
      v26 = v21;
      v24 = v20;
      v27 = v10;
      dispatch_async(cancelationQueue, v23);

    }
  }

}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v7;
  id v8;
  id WeakRetained;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:", a2, a3, v8, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if (*(_BYTE *)(a1 + 84))
    PFSharedFigDecodeSessionDiscardCachedBuffers();
}

- (id)_requestOptionsForUseCase:(unint64_t)a3 forDrawing:(BOOL)a4 intent:(unint64_t)a5 useLowMemoryDecode:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v6 = a6;
  if (a3 <= 3 && a4)
    a3 = qword_1A7C09A48[a3];
  -[NSArray objectAtIndexedSubscript:](self->_requestOptions, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGTextureProvider workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultHandlerQueue:", v10);

  objc_msgSend(v9, "setUseLowMemoryMode:", -[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode") | v6);
  v11 = objc_msgSend(v9, "loadingMode") & 0xFFFFFFFFFF9FFFFFLL;
  v12 = 6291456;
  if (!v6)
    v12 = 0;
  objc_msgSend(v9, "setLoadingMode:", v11 | v12);
  if (a5 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXImageRequestOptionsDownloadIntent PXGPHRequestOptionsDownloadIntentFromPresentationIntent(PXGDisplayAssetPresentationIntent)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGDisplayAssetSource_Internal.h"), 55, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_msgSend(v9, "setDownloadIntent:", qword_1A7C09A68[a5]);
  return v9;
}

- (void)interactionStateDidChange:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  _QWORD v11[5];
  char v12;
  char v13;
  uint64_t v14;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_isLowSpec)
    v7 = objc_msgSend(v5, "videoAllowedAtOrBelowSpeedForLowSpec");
  else
    v7 = objc_msgSend(v5, "videoAllowedAtOrBelowSpeed");
  v8 = v7;
  -[PXGTextureProvider interactionState](self, "interactionState");
  -[PXGDisplayAssetTextureProvider setVideoRequestsAllowed:](self, "setVideoRequestsAllowed:", v14 <= v8);
  -[PXGTextureProvider interactionState](self, "interactionState");
  v9 = v13;
  if (v13 != a3->var7)
  {
    -[PXGTextureProvider workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PXGDisplayAssetTextureProvider_interactionStateDidChange___block_invoke;
    v11[3] = &unk_1E5144398;
    v11[4] = self;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

- (void)didFinishRequestingTextures
{
  BOOL v3;
  void *v4;
  char v5;
  _BOOL4 v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXGTextureProvider interactionState](self, "interactionState");
  v3 = 1;
  -[PXGTextureProvider requestIDsInTargetRect](self, "requestIDsInTargetRect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if (-[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode"))
  {
    v6 = -[PXGTextureProvider allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode");
    v7 = 1;
    if (v6)
      v7 = 2;
    if ((uint64_t)v15 > v7)
      v5 = 0;
    v3 = BYTE10(v15) == 0;
  }
  v8 = v5 != 0;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke;
  block[3] = &unk_1E512D848;
  v13 = v8;
  block[4] = self;
  v12 = v4;
  v14 = v3;
  v10 = v4;
  dispatch_async(v9, block);

}

- (void)_workQueue_performRequestForDisplayAsset:(id)a3 textureRequestID:(int)a4 sharedState:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned int v35;
  uint64_t v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  id v45;
  int v46;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  NSMutableDictionary *workQueue_deferredImageRequestBlocksByTextureID;
  void *v53;
  void *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSMutableDictionary *v59;
  id *v60;
  id *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *cancelationQueue;
  id *v65;
  id *v66;
  double v67;
  id *v68;
  double v69;
  int v70;
  uint64_t v71;
  double v72;
  _PXGMediaRequest *v73;
  double v74;
  void *v75;
  void *v76;
  unsigned int v77;
  id *v78;
  uint64_t v79;
  id *v80;
  void *v81;
  _PXGMediaRequest *v82;
  void *v83;
  _QWORD block[4];
  id v85;
  PXGDisplayAssetTextureProvider *v86;
  uint64_t v87;
  int v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[3];
  id v92[4];
  int v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[3];
  id v97[4];
  int v98;
  char v99;
  _QWORD aBlock[4];
  _PXGMediaRequest *v101;
  id v102;
  id v103[4];
  int v104;
  char v105;
  _OWORD v106[2];
  __int128 location;
  __int128 v108;
  unsigned int v109;
  unsigned __int8 v110;
  uint64_t v111[3];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v6))
  {
    -[PXGTextureProvider workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    objc_msgSend(v9, "targetSize");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v9, "screenScale");
    v16 = v15;
    objc_msgSend(v9, "screenMaxHeadroom");
    v67 = v17;
    v77 = objc_msgSend(v9, "useLowMemoryDecode");
    objc_msgSend(v9, "adjustment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "presentationStyles");
    objc_msgSend(v9, "observer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v20;
    objc_msgSend(v20, "masterThumbnailSize");
    if (v22 >= v23)
      v24 = v23;
    else
      v24 = v22;
    if (-[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode"))
      v25 = 1.5;
    else
      v25 = 1.2;
    if (objc_msgSend(v21, "simulateSomeAssetsInCloud")
      && 0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v8, "thumbnailIndex") <= 0x3333333333333333)
    {
      objc_msgSend(v83, "observeIsInCloud:forDisplayAsset:", 1, v8);
LABEL_69:

      goto LABEL_70;
    }
    v74 = v25;
    if (v18)
    {
      objc_msgSend(v18, "requestSizeForProposedTargetSize:", v12, v14);
      v27 = v26;
      v29 = v28;
      v30 = objc_msgSend(v18, "wantsSingleHighQualityDelivery");
    }
    else
    {
      v30 = 0;
      v29 = v14;
      v27 = v12;
    }
    if (v27 >= v29)
      v31 = v29;
    else
      v31 = v27;
    v32 = fmax(v31, 1.0);
    if (objc_msgSend(v21, "requestMasterThumbsOnly") && v24 != 0.0 && v32 > v24)
    {
      PXSizeScale();
      v27 = round(v33);
      v29 = round(v34);
      if (v27 >= v29)
        v32 = v29;
      else
        v32 = v27;
    }
    if (v18)
      v79 = objc_msgSend(v18, "contentModeForProposedContentMode:", 1);
    else
      v79 = 1;
    v76 = v21;
    if ((v19 & 4) != 0)
    {
      v35 = objc_msgSend(v8, "representsBurst");
      v36 = v35;
    }
    else
    {
      v35 = 0;
      v36 = 0;
    }
    v37 = -[PXGTextureProvider preferMipmaps](self, "preferMipmaps");
    v82 = -[_PXGMediaRequest initWithAsset:observer:postProcessOptions:]([_PXGMediaRequest alloc], "initWithAsset:observer:postProcessOptions:", v8, v83, v36);
    -[_PXGMediaRequest setAdjustment:](v82, "setAdjustment:", v18);
    v111[0] = 0;
    v110 = 0;
    v109 = 0;
    v69 = v12;
    v72 = v14;
    if (-[PXGAssetImageCache getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:](self->_imageCache, "getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:", v111, &v109, &v110, v8, v79, v6, v27, v29))
    {
      if (v35)
      {
        v38 = v74;
        -[PXGDisplayAssetTextureProvider _workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:](self, "_workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:", v111[0], v109, 0, v82, v6, v9, v27, v29, *(double *)&v16);
      }
      else
      {
        location = 0u;
        v108 = 0u;
        v41 = v109;
        if (v9)
          v42 = objc_msgSend(v9, "applyCleanApertureCrop");
        else
          v42 = 1;
        v38 = v74;
        -[PXGDisplayAssetTextureProvider _defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:](self, "_defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:", v8, v41, v42);
        v106[0] = location;
        v106[1] = v108;
        -[PXGDisplayAssetTextureProvider _workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:](self, "_workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:", v111[0], v106, v18, v110, v6);
      }
      PXCGImageGetSizeWithOrientation();
      v39 = v43;
      v40 = v44;
    }
    else
    {
      v38 = v74;
      v39 = *MEMORY[0x1E0C9D820];
      v40 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    -[_PXGMediaRequest setBestReceivedSize:](v82, "setBestReceivedSize:", v39, v40);
    if (v39 >= v27 && v40 >= v29)
    {
LABEL_68:

      v21 = v76;
      goto LABEL_69;
    }
    objc_initWeak((id *)&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke;
    aBlock[3] = &unk_1E512A868;
    v65 = v103;
    objc_copyWeak(v103, (id *)&location);
    v103[1] = *(id *)&v69;
    v103[2] = *(id *)&v72;
    v103[3] = v16;
    v73 = v82;
    v101 = v73;
    v104 = v6;
    v45 = v9;
    v102 = v45;
    v105 = v77;
    v75 = _Block_copy(aBlock);
    v70 = v30;
    if (v32 < v38 * v24)
      v46 = (v32 > v24) & ~v30;
    else
      v46 = 0;
    v47 = v46 == 1
       && -[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode", v103)
       && objc_msgSend(v76, "inLowMemoryModePreferMasterThumb")
       && !-[PXGTextureProvider allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode")|| v32 < v24;
    v48 = v35 | v37;
    if (-[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode", v65)
      && (-[PXGTextureProvider interactionState](self, "interactionState"), v99))
    {
      -[PXGDisplayAssetTextureProvider _requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:](self, "_requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:", 2, v48, objc_msgSend(v45, "intent"), v77);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v27 = v24;
        v29 = v24;
      }
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_2;
      v94[3] = &unk_1E512A890;
      v78 = v97;
      objc_copyWeak(v97, (id *)&location);
      v95 = v8;
      v97[1] = *(id *)&v27;
      v97[2] = *(id *)&v29;
      v97[3] = (id)v79;
      v50 = v49;
      v96[0] = v50;
      v96[2] = v75;
      v98 = v6;
      v96[1] = v81;
      v51 = _Block_copy(v94);
      workQueue_deferredImageRequestBlocksByTextureID = self->_workQueue_deferredImageRequestBlocksByTextureID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](workQueue_deferredImageRequestBlocksByTextureID, "setObject:forKeyedSubscript:", v51, v53);
      v54 = v51;
      v80 = &v95;
      v68 = (id *)v96;
      v71 = 0;
      v55 = v94;
    }
    else
    {
      if (!v46)
      {
        v62 = objc_msgSend(v45, "intent");
        if (v70)
          v63 = 2;
        else
          v63 = 0;
        -[PXGDisplayAssetTextureProvider _requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:](self, "_requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:", v63, v48, v62, v77);
        v50 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setPreferHDR:", v67 > 1.0);
        objc_msgSend(v50, "setTargetHDRHeadroom:", v67);
        v57 = objc_msgSend(v81, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v8, v79, v50, v75, v27, v29);
        goto LABEL_61;
      }
      -[PXGDisplayAssetTextureProvider _requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:](self, "_requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:", 2, v48, objc_msgSend(v45, "intent"), v77);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v81, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v8, v79, v50, v75, v24, v24);
      v57 = v56;
      if (v47)
      {
LABEL_61:

        if (!-[_PXGMediaRequest gotAnyResult](v73, "gotAnyResult")
          && objc_msgSend(v8, "thumbnailIndex") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v8, "isInCloud"))
        {
          objc_msgSend(v83, "observeIsInCloud:forDisplayAsset:", 1, v8);
        }
        if (v57)
        {
          cancelationQueue = self->_cancelationQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_4;
          block[3] = &unk_1E512A8B8;
          v86 = self;
          v87 = v57;
          v85 = v81;
          v88 = v6;
          dispatch_async(cancelationQueue, block);

        }
        objc_destroyWeak(v66);
        objc_destroyWeak((id *)&location);
        goto LABEL_68;
      }
      v71 = v56;
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_3;
      v89[3] = &unk_1E512A890;
      v78 = v92;
      objc_copyWeak(v92, (id *)&location);
      v90 = v8;
      v92[1] = *(id *)&v27;
      v92[2] = *(id *)&v29;
      v92[3] = (id)v79;
      v50 = v50;
      v91[0] = v50;
      v91[2] = v75;
      v93 = v6;
      v91[1] = v81;
      v58 = _Block_copy(v89);
      v59 = self->_workQueue_deferredImageRequestBlocksByTextureID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v58, v53);
      v54 = v58;
      v80 = &v90;
      v68 = (id *)v91;
      v55 = v89;
    }
    v60 = (id *)(v55 + 7);
    v61 = (id *)(v55 + 6);

    objc_destroyWeak(v78);
    v57 = v71;
    goto LABEL_61;
  }
LABEL_70:

}

- (void)_workQueue_handleResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 mediaRequest:(id)a8 textureRequestID:(int)a9 sharedState:(id)a10
{
  uint64_t v11;
  double height;
  double width;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  NSObject *drawingQueue;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44[5];
  int v45;
  int v46;
  id location;
  _QWORD block[5];
  id v49;
  int v50;

  v11 = *(_QWORD *)&a9;
  height = a6.height;
  width = a6.width;
  v18 = a5;
  v19 = a8;
  v20 = a10;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v11))
  {
    -[PXGTextureProvider workQueue](self, "workQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v21);

    v22 = CGImagePropertyOrientationFromPXImageOrientation();
    if (a3)
    {
      objc_msgSend(v19, "setGotAnyResult:", 1);
      PXCGImageGetSizeWithOrientation();
      v24 = v23;
      v26 = v25;
      v27 = 0;
    }
    else
    {
      v28 = (double *)MEMORY[0x1E0C9D820];
      objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8430);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[PXGTextureProvider requestQueue](self, "requestQueue");
        v30 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke;
        block[3] = &unk_1E513A5E0;
        block[4] = self;
        v49 = v18;
        v50 = v11;
        dispatch_async(v30, block);

      }
      v24 = *v28;
      v26 = v28[1];
      objc_msgSend(v19, "asset");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v31, "isInCloud");

    }
    objc_msgSend(v19, "observer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "asset");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "observeIsInCloud:forDisplayAsset:", v27, v33);

    v34 = -[NSMutableIndexSet containsIndex:](self->_workQueue_textureRequestIDsThatCannotBeSatisfiedWithThumbnails, "containsIndex:", (int)v11);
    objc_msgSend(v19, "adjustment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 || (v34 & 1) != 0)
    {

    }
    else if (-[PXGDisplayAssetTextureProvider _imageSizeSatisfiedByThumbnail:](self, "_imageSizeSatisfiedByThumbnail:", v24, v26))
    {
      goto LABEL_18;
    }
    if ((MEMORY[0x1A85CD5B8](objc_msgSend(v19, "bestReceivedSize")) & 1) == 0
      && (-[NSMutableIndexSet containsIndex:](self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, "containsIndex:", (int)v11) & 1) == 0)
    {
      objc_msgSend(v19, "setBestReceivedSize:", v24, v26);
      CGImageRetain(a3);
      if (objc_msgSend(v19, "postProcessOptions"))
      {
        CGImageRetain(a3);
        objc_initWeak(&location, self);
        drawingQueue = self->_drawingQueue;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_2;
        v40[3] = &unk_1E512A908;
        v40[4] = self;
        v45 = v11;
        v41 = v19;
        v44[1] = a3;
        v44[2] = *(id *)&width;
        v44[3] = *(id *)&height;
        v44[4] = *(id *)&a7;
        objc_copyWeak(v44, &location);
        v46 = v22;
        v42 = v18;
        v43 = v20;
        dispatch_async(drawingQueue, v40);

        objc_destroyWeak(v44);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(v19, "asset");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "adjustment");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v39) = v11;
        -[PXGDisplayAssetTextureProvider _workQueue_handleCGImageResult:orientation:forAsset:info:targetSize:adjustment:shouldCache:textureRequestID:sharedState:](self, "_workQueue_handleCGImageResult:orientation:forAsset:info:targetSize:adjustment:shouldCache:textureRequestID:sharedState:", a3, v22, v37, v18, v38, 1, width, height, v39, v20);

      }
      CGImageRelease(a3);
    }
  }
LABEL_18:

}

- (BOOL)_imageSizeSatisfiedByThumbnail:(CGSize)a3
{
  return self->_largestImageDataSpecSize.width >= a3.width
      && self->_largestImageDataSpecSize.height >= a3.height
      && -[PXGTextureProvider canDeliverThumbnailData](self, "canDeliverThumbnailData");
}

- (void)_workQueue_handleCGImageResult:(CGImage *)a3 orientation:(unsigned int)a4 forAsset:(id)a5 info:(id)a6 targetSize:(CGSize)a7 adjustment:(id)a8 shouldCache:(BOOL)a9 textureRequestID:(int)a10 sharedState:(id)a11
{
  _BOOL4 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  v11 = a9;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a11;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  if (a3 && -[PXGTextureProvider isRequestActive:](self, "isRequestActive:", a10))
  {
    v25 = a4;
    objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8440);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v11)
    {
      v24 = v25;
      a3 = -[PXGAssetImageCache cacheCGImage:orientation:isDegraded:forRequestID:](self->_imageCache, "cacheCGImage:orientation:isDegraded:forRequestID:", a3, v25, v23, a10);
    }
    else
    {
      v24 = v25;
    }
    v27 = 0u;
    v28 = 0u;
    -[PXGDisplayAssetTextureProvider _defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:](self, "_defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:", v17, v24, objc_msgSend(v20, "applyCleanApertureCrop"));
    v26[0] = v27;
    v26[1] = v28;
    -[PXGDisplayAssetTextureProvider _workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:](self, "_workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:", a3, v26, v19, v23, a10);
  }

}

- (void)_workQueue_provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7
{
  _BOOL4 v7;
  char v8;
  __int128 *v9;
  id v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  PXGDisplayAssetTextureProvider *v19;
  id v20;
  CGImage *v21;
  _BOOL4 v22;
  char v23;

  v7 = a6;
  v8 = (char)a5;
  v9 = *(__int128 **)&a4.var0;
  v12 = *(id *)&a4.var2;
  CGImageRetain(a3);
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__PXGDisplayAssetTextureProvider__workQueue_provideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke;
  v16[3] = &unk_1E512A930;
  v20 = v12;
  v21 = a3;
  v14 = v9[1];
  v17 = *v9;
  v18 = v14;
  v19 = self;
  v23 = v8;
  v22 = v7;
  v15 = v12;
  dispatch_async(v13, v16);

}

- ($CD50236D32D92DEB4B82C0BF1F758B74)_defaultStillImageTextureProcessingOptionsForAsset:(id)a3 orientation:(unsigned int)a4 applyCleanAperture:(BOOL)a5
{
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;
  __int128 v12;
  _BOOL8 v13;
  _BOOL4 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  $CD50236D32D92DEB4B82C0BF1F758B74 result;

  v6 = a5;
  v8 = v5;
  v9 = a3;
  PXGSpriteTextureInfoOrientationFromCGOrientation();
  memset(&v17, 0, sizeof(v17));
  PXGSpriteTextureInfoOrientationToCGAffineTransform();
  if (v6)
  {
    v10 = objc_msgSend(v9, "playbackStyle");
    v11 = 1.11111111;
    if (v10 != 3)
      v11 = 1.0;
    v15 = v17;
    CGAffineTransformScale(&v16, &v15, v11, v11);
    v17 = v16;
  }
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  v16 = v17;
  PXGSpriteTextureInfoOrientationFromCGAffineTransform();
  *(_OWORD *)v8 = v12;
  *(_BYTE *)(v8 + 16) = -[PXGTextureProvider preferMipmaps](self, "preferMipmaps");
  *(_DWORD *)(v8 + 20) = 1065353216;
  *(_BYTE *)(v8 + 24) = 0;

  result.var0 = v13;
  result.var1 = *((float *)&v13 + 1);
  result.var2 = v14;
  return result;
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 137);
  LOBYTE(v2) = *(_BYTE *)(a1 + 136);
  objc_msgSend(WeakRetained, "_requestQueue_requestTexturesForSpritesInRange:observer:textureRequestIDs:displayAssetFetchResult:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:cannotBeSatisfiedWithThumbnail:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), vcvtq_f64_f32(*(float32x2_t *)(a1 + 96)), *(double *)(a1 + 104), *(double *)(a1 + 112), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120), v2, *(_QWORD *)(a1 + 56));

}

- (void)setVideoRequestsAllowed:(BOOL)a3
{
  NSObject *videoSessionsRequestQueue;

  if (self->_videoRequestsAllowed != a3)
  {
    self->_videoRequestsAllowed = a3;
    videoSessionsRequestQueue = self->_videoSessionsRequestQueue;
    if (a3)
      dispatch_resume(videoSessionsRequestQueue);
    else
      dispatch_suspend(videoSessionsRequestQueue);
  }
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(v2) = *(_DWORD *)(a1 + 92);
  objc_msgSend(WeakRetained, "_workQueue_requestVideoTexturesForSpriteAtIndex:spriteReference:displayAsset:presentationController:adjustment:presentationType:textureRequestID:mediaProvider:pixelBufferSourcesProvider:", *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)_workQueue_requestVideoTexturesForSpriteAtIndex:(unsigned int)a3 spriteReference:(id)a4 displayAsset:(id)a5 presentationController:(id)a6 adjustment:(id)a7 presentationType:(unsigned __int8)a8 textureRequestID:(int)a9 mediaProvider:(id)a10 pixelBufferSourcesProvider:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  id *v26;
  id v27;
  id *v28;
  id *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *queuea;
  id *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  int v56;
  _QWORD block[4];
  id v58;
  void *v59;
  _QWORD v60[2];
  id v61;
  id v62;
  id v63;
  id v64;
  int v65;
  char v66;
  unsigned __int8 v67;
  char v68;
  id location[2];

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  v20 = a11;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v46 = v17;
  v47 = (void *)v22;
  if (v17)
  {
    v41 = v15;
    v23 = v19;
    v42 = v20;
    -[PXGTextureProvider interactionState](self, "interactionState");
    v24 = v68;
    objc_msgSend(v17, "accessQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke;
    block[3] = &unk_1E512A9D0;
    v26 = &v64;
    objc_copyWeak(&v64, location);
    v65 = a9;
    v45 = &v58;
    v27 = v17;
    v66 = v24;
    v67 = a8;
    v28 = &v59;
    v58 = v27;
    v59 = v23;
    v29 = (id *)v60;
    v30 = v23;
    v60[0] = v21;
    v60[1] = self;
    v61 = v16;
    v62 = v18;
    v63 = v47;
    v31 = v18;
    v32 = v16;
    v33 = v21;
    v34 = v23;
    dispatch_async(v25, block);

    v15 = v41;
    v35 = v42;
  }
  else
  {
    queuea = self->_videoSessionsRequestQueue;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_7;
    v48[3] = &unk_1E512A980;
    v26 = &v55;
    objc_copyWeak(&v55, location);
    v56 = a9;
    v45 = &v49;
    v36 = v20;
    v35 = v20;
    v28 = &v50;
    v49 = v36;
    v50 = v16;
    v29 = &v51;
    v51 = v19;
    v52 = v15;
    v53 = v21;
    v54 = v18;
    v37 = v18;
    v38 = v16;
    v39 = v21;
    v40 = v19;
    dispatch_async(queuea, v48);

    v30 = v19;
  }

  objc_destroyWeak(v26);
  objc_destroyWeak(location);

}

- (void)_workQueue_processDeferredImageRequests
{
  NSObject *v3;

  -[PXGTextureProvider workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_workQueue_deferredImageRequestBlocksByTextureID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_101);
  -[NSMutableDictionary removeAllObjects](self->_workQueue_deferredImageRequestBlocksByTextureID, "removeAllObjects");
}

uint64_t __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_processThumbnailRequestsOnRequestQueue:", 0);
  if (*(_BYTE *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_workQueue_processImageRequestsWithAllowedIDs:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 48))
    {
      if (*(_BYTE *)(a1 + 49))
        return objc_msgSend(*(id *)(a1 + 32), "_workQueue_processDeferredImageRequests");
    }
  }
  return result;
}

void __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "_processThumbnailRequestsOnRequestQueue:", 1);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke_2;
  block[3] = &unk_1E512D848;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  block[1] = 3221225472;
  v5 = v3;
  v7 = *(_BYTE *)(a1 + 49);
  dispatch_async(v2, block);

}

- (void)_processThumbnailRequestsOnRequestQueue:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  PXGThumbnailRequestQueue *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  unsigned int v22;
  unint64_t v23;
  float v24;
  float v25;
  unint64_t v26;
  double v27;
  uint64_t v28;
  _BOOL8 v29;
  NSObject *v30;
  CGImage *v31;
  PXGThumbnailRequestQueue *v32;
  __int128 v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void *context;
  uint64_t v38;
  uint64_t v39;
  _QWORD block[5];
  id v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  int v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v3 = a3;
  if (a3)
  {
    -[PXGTextureProvider requestQueue](self, "requestQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v6 = self->_requestQueue_thumbnailRequestQueue;
    v7 = self->_workQueue_thumbnailRequestQueue != 0;
  }
  else
  {
    -[PXGTextureProvider workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    v6 = self->_workQueue_thumbnailRequestQueue;
    v7 = 0;
  }
  -[PXGThumbnailRequestQueue sortRequests](v6, "sortRequests");
  v9 = -[PXGThumbnailRequestQueue count](v6, "count");
  v32 = objc_retainAutorelease(v6);
  v10 = -[PXGThumbnailRequestQueue requests](v32, "requests");
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "simulateSomeAssetsInCloud");

  v36 = v9;
  if (v9 >= -99)
  {
    v13 = 0;
    v35 = v9 / 100;
    v33 = *(_OWORD *)off_1E50B83E0;
    v14 = v9;
    v34 = v7;
    while (1)
    {
      v38 = v14 - 100;
      if (v14 >= 100)
        v14 = 100;
      v15 = v14 <= 1 ? 1 : v14;
      context = (void *)MEMORY[0x1A85CE17C]();
      v39 = v13;
      if (v36 - 100 * v13 >= 1)
        break;
LABEL_32:
      objc_autoreleasePoolPop(context);
      v14 = v38;
      v13 = v39 + 1;
      if (v39 == v35)
        goto LABEL_33;
    }
    while (1)
    {
      v16 = *(unsigned int *)(v10 + 24);
      if (!-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v16)
        || -[PXGDisplayAssetTextureProvider _hasDeliveredThumbnailForTextureRequestID:](self, "_hasDeliveredThumbnailForTextureRequestID:", v16))
      {
        goto LABEL_31;
      }
      v17 = *(id *)(v10 + 8);
      v18 = *(id *)v10;
      LOWORD(v19) = *(_WORD *)(v10 + 28);
      LOWORD(v20) = *(_WORD *)(v10 + 30);
      v51 = 0;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v17, "thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:", v18, v7, &v49, (double)v19, (double)v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v24 = *(float *)(v10 + 32);
      if (v24 > 0.0)
      {
        LOWORD(v22) = WORD6(v50);
        v25 = (float)v22;
        LOWORD(v23) = WORD4(v50);
        *(double *)&v26 = (double)v23;
        v27 = *(double *)&v26 + (float)((float)(1.0 - v24) * v25) * 0.5;
        WORD4(v50) = (int)v27;
        LOWORD(v27) = HIWORD(v50);
        *(float *)&v27 = (float)LODWORD(v27);
        LOWORD(v26) = WORD5(v50);
        WORD5(v50) = (int)((double)v26 + (float)((float)(1.0 - v24) * *(float *)&v27) * 0.5);
        WORD6(v50) = (int)(float)(v24 * v25);
        HIWORD(v50) = (int)(float)(v24 * *(float *)&v27);
      }
      if ((_DWORD)v12 && 0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v18, "thumbnailIndex") <= 0x3333333333333333)
      {

      }
      else if (v21)
      {
        if (-[PXGDisplayAssetTextureProvider _noteThumbnailAsDeliveredForRequestID:](self, "_noteThumbnailAsDeliveredForRequestID:", v16))
        {
          if (v3)
          {
            v46 = v49;
            v47 = v50;
            v48 = v51;
            -[PXGDisplayAssetTextureProvider _requestQueue_handleThumbnailData:spec:forTextureRequestID:](self, "_requestQueue_handleThumbnailData:spec:forTextureRequestID:", v21, &v46, v16);
          }
          else
          {
            -[PXGTextureProvider requestQueue](self, "requestQueue");
            v28 = v12;
            v29 = v3;
            v30 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __74__PXGDisplayAssetTextureProvider__processThumbnailRequestsOnRequestQueue___block_invoke;
            block[3] = &unk_1E512A820;
            block[4] = self;
            v21 = v21;
            v41 = v21;
            v42 = v49;
            v43 = v50;
            v44 = v51;
            v45 = v16;
            dispatch_async(v30, block);

            v3 = v29;
            v12 = v28;
            v7 = v34;

          }
        }
        goto LABEL_30;
      }
      if ((v7 & 1) == 0
        && -[PXGDisplayAssetTextureProvider _noteThumbnailAsDeliveredForRequestID:](self, "_noteThumbnailAsDeliveredForRequestID:", v16))
      {
        v31 = -[PXGDisplayAssetTextureProvider placeholderImage](self, "placeholderImage");
        v46 = v33;
        v47 = 0x3F80000000000000uLL;
        if (v3)
          -[PXGTextureProvider provideCGImage:options:isDegraded:forRequestID:](self, "provideCGImage:options:isDegraded:forRequestID:", v31, &v46, 1, v16);
        else
          -[PXGDisplayAssetTextureProvider _workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:](self, "_workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:", v31, &v46, 0, 1, v16);
      }
      v21 = 0;
LABEL_30:

LABEL_31:
      v10 += 40;
      if (!--v15)
        goto LABEL_32;
    }
  }
LABEL_33:
  -[PXGThumbnailRequestQueue removeAllRequests](v32, "removeAllRequests");

}

- (void)_workQueue_processImageRequestsWithAllowedIDs:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[PXGImageRequestQueue performRequestsWithAllowedIDs:](self->_workQueue_imageRequestQueue, "performRequestsWithAllowedIDs:", v5);
}

- (void)performRequestForSpriteIndex:(unsigned int)a3 textureRequestID:(int)a4 sharedState:(id)a5
{
  uint64_t v5;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(_QWORD *)&a4;
  v13 = a5;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v13, "displayAssetFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDisplayAssetTextureProvider.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayAsset != nil"));

  }
  -[PXGDisplayAssetTextureProvider _workQueue_performRequestForDisplayAsset:textureRequestID:sharedState:](self, "_workQueue_performRequestForDisplayAsset:textureRequestID:sharedState:", v11, v5, v13);

}

- (void)_requestQueue_handleThumbnailData:(id)a3 spec:(PXMediaProviderThumbnailDataSpec *)a4 forTextureRequestID:(int)a5
{
  uint64_t v5;
  id v8;
  unint64_t var0;
  __CFString *var1;
  unsigned __int16 var2;
  unsigned __int16 var3;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  _BYTE v22[22];
  uint64_t v23;

  v5 = *(_QWORD *)&a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  var0 = a4->var0.var0;
  var1 = a4->var0.var1;
  var2 = a4->var0.var2;
  var3 = a4->var0.var3;
  *(_QWORD *)v22 = a4->var0.var0;
  *(_QWORD *)&v22[8] = var1;
  *(_WORD *)&v22[16] = var2;
  *(_WORD *)&v22[18] = var3;
  v13 = -[PXGTextureProvider requestQueue_indexForImageDataSpec:](self, "requestQueue_indexForImageDataSpec:", v22);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PXGTungstenGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v22 = var0;
      *(_QWORD *)&v22[8] = var1;
      *(_WORD *)&v22[16] = var2;
      *(_WORD *)&v22[18] = var3;
      PXGImageDataSpecDescription();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = self;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v21;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "%@ got thumbnail data back with a format that hasn't been registered, so unable to use:%@", v22, 0x16u);

    }
  }
  else
  {
    LOWORD(v14) = a4->var5;
    LOWORD(v15) = a4->var6;
    LOWORD(v16) = a4->var1;
    LOWORD(v17) = a4->var2;
    LOWORD(v18) = a4->var3;
    LOWORD(v19) = a4->var4;
    -[PXGTextureProvider provideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:](self, "provideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:", v8, v13, a4->var7, v5, (double)v14, (double)v15, (double)v16, (double)v17, (double)v18, (double)v19);
  }

}

- (BOOL)_noteThumbnailAsDeliveredForRequestID:(int)a3
{
  os_unfair_lock_s *p_lookupLock;
  char v6;

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  v6 = -[NSMutableIndexSet containsIndex:](self->_lookupLock_requestIDsWithDeliveredThumbnails, "containsIndex:", a3) ^ 1;
  -[NSMutableIndexSet addIndex:](self->_lookupLock_requestIDsWithDeliveredThumbnails, "addIndex:", a3);
  os_unfair_lock_unlock(p_lookupLock);
  return v6;
}

- (BOOL)_hasDeliveredThumbnailForTextureRequestID:(int)a3
{
  os_unfair_lock_s *p_lookupLock;

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(a3) = -[NSMutableIndexSet containsIndex:](self->_lookupLock_requestIDsWithDeliveredThumbnails, "containsIndex:", a3);
  os_unfair_lock_unlock(p_lookupLock);
  return a3;
}

uint64_t __57__PXGDisplayAssetTextureProvider_registerImageDataSpecs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t result;
  unint64_t v8;
  double v9;
  double v10;
  double *v11;
  _QWORD v12[2];
  int v13;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_DWORD *)(a2 + 16);
  v6 = *(void **)(a1 + 32);
  v12[0] = *(_QWORD *)a2;
  v12[1] = v4;
  v13 = v5;
  result = objc_msgSend(v6, "registerImageDataSpec:", v12);
  if (!*(_BYTE *)(a1 + 48))
  {
    LOWORD(v8) = *(_WORD *)(a2 + 16);
    v9 = (double)v8;
    LOWORD(v8) = *(_WORD *)(a2 + 18);
    v10 = (double)v8;
    result = MEMORY[0x1A85CD5B8](result, v9, (double)v8, *(double *)(*(_QWORD *)(a1 + 40) + 408), *(double *)(*(_QWORD *)(a1 + 40) + 416));
    if ((_DWORD)result)
    {
      v11 = (double *)(*(_QWORD *)(a1 + 40) + 408);
      *v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

void __149__PXGDisplayAssetTextureProvider__workQueue_performDeferredImageRequest_targetSize_contentMode_options_resultHandler_textureRequestID_mediaProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _PXGMediaRequestToken *v4;

  v4 = -[_PXGMediaRequestToken initWithMediaProvider:mediaRequestID:]([_PXGMediaRequestToken alloc], "initWithMediaProvider:mediaRequestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 328);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v3);

}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _PXGMediaRequestToken *v4;

  v4 = -[_PXGMediaRequestToken initWithMediaProvider:mediaRequestID:]([_PXGMediaRequestToken alloc], "initWithMediaProvider:mediaRequestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 320);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v3);

}

- (void)setPreferBGRA:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXGTextureProvider preferBGRA](self, "preferBGRA") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGDisplayAssetTextureProvider;
    -[PXGTextureProvider setPreferBGRA:](&v5, sel_setPreferBGRA_, v3);
    -[PXGDisplayAssetTextureProvider _setupRequestOptions](self, "_setupRequestOptions");
  }
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  char *v8;
  NSUInteger v9;
  __int16 v10;
  __int16 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PXGSpriteIndexRange v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  void *v23;
  char *v24;
  unint64_t v25;
  unsigned __int8 *v26;
  float32x2_t v27;
  int v28;
  id v29;
  void *v30;
  int32x2_t v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  int v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  NSObject *v42;
  _PXGSpriteIndexRange v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  id v52;
  id v53;
  NSUInteger v54;
  NSUInteger v55;
  void *v56;
  void *v57;
  NSUInteger v58;
  char *v59;
  uint64_t v61;
  char v62;
  uint64_t v63;
  float32x4_t v64;
  void *v65;
  NSObject *queue;
  void *v67;
  unint64_t v68;
  void *v71;
  void *v72;
  char v73;
  unint64_t v74;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  id v80;
  float32x2_t v81;
  _QWORD v82[4];
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  unsigned int v91;
  int v92;
  char v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99[8];
  unsigned int v100;
  int v101;
  BOOL v102;
  char v103;
  char v104;
  _QWORD block[4];
  id v106;
  id v107;
  id v108;
  id v109;
  id v110[8];
  unsigned int v111;
  int v112;
  BOOL v113;
  char v114;
  char v115;
  id location;
  objc_super v117;
  uint8_t buf[4];
  id v119;
  __int16 v120;
  void *v121;
  uint64_t v122;
  _NSRange result;
  CGSize v124;
  CGSize v125;

  v122 = *MEMORY[0x1E0C80C00];
  v117.receiver = self;
  v117.super_class = (Class)PXGDisplayAssetTextureProvider;
  v78 = a7;
  v8 = (char *)-[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v117, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, a3, a4, a5, a6);
  v58 = v9;
  v59 = v8;
  objc_msgSend(v78, "displayAssetSource");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "displayAssetSourceRespondsTo");
  v11 = v10;
  if ((v79 & 1) != 0)
    v68 = objc_msgSend(v77, "supportedDisplayAssetPresentationStylesInLayout:", v78);
  else
    v68 = 1;
  objc_msgSend(v77, "displayAssetFetchResultForSpritesInRange:inLayout:", a3, v78);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v79 & 0x10000) != 0)
  {
    objc_msgSend(v77, "displayAssetRequestObserverForSpritesInRange:inLayout:", a3, v78);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = 0;
  }
  if (!v76)
  {
    v12 = objc_msgSend(v77, "desiredPlaceholderStyleInLayout:", v78);
    if (v12 == 1)
    {
      os_unfair_lock_lock(&self->_lookupLock);
      -[NSMutableIndexSet addIndexesInRange:](self->_lookupLock_requestIDsWithDeliveredPlaceholders, "addIndexesInRange:", v59, v58);
      os_unfair_lock_unlock(&self->_lookupLock);
    }
    -[PXGDisplayAssetTextureProvider _providePlaceholdersForRequestIDs:placeholderStyle:](self, "_providePlaceholdersForRequestIDs:placeholderStyle:", v59, v58, v12);
    goto LABEL_68;
  }
  if ((v79 & 0x1000000000000) != 0)
    objc_msgSend(v77, "customMediaProviderForDisplayAssetsInLayout:", v78);
  else
    -[PXGDisplayAssetTextureProvider defaultMediaProvider](self, "defaultMediaProvider", v78);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v78;
  if ((v79 & 0x100000000000000) == 0)
  {
    v57 = 0;
    if ((v11 & 1) == 0)
      goto LABEL_16;
LABEL_19:
    v62 = objc_msgSend(v77, "useLowMemoryDecodeInLayout:", v13);
    v13 = v78;
    if ((v11 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  objc_msgSend(v77, "customPixelBufferSourcesProviderForDisplayAssetsInLayout:", v78);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v78;
  if ((v11 & 1) != 0)
    goto LABEL_19;
LABEL_16:
  v62 = 0;
  if ((v11 & 0x100) == 0)
  {
LABEL_17:
    v61 = (v68 >> 1) & 1;
    goto LABEL_21;
  }
LABEL_20:
  LOBYTE(v61) = objc_msgSend(v77, "shouldApplyCleanApertureCropToStillImagesInLayout:", v13);
  v13 = v78;
LABEL_21:
  objc_msgSend(v13, "displayScale");
  v15 = v14;
  objc_msgSend(v78, "displayMaximumHeadroom");
  v17 = v16;
  objc_initWeak(&location, self);
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  queue = objc_claimAutoreleasedReturnValue();
  -[PXGTextureProvider workQueue](self, "workQueue");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a3;
  v80 = 0;
  v74 = HIDWORD(*(unint64_t *)&a3);
  if ((v68 & 1) != 0 && HIDWORD(*(unint64_t *)&a3))
  {
    v80 = 0;
    v19 = 0;
    v72 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v64 = *(float32x4_t *)off_1E50B8218;
    v23 = 0;
    v63 = 1;
    v24 = v59;
    v25 = HIDWORD(*(unint64_t *)&a3);
    do
    {
      v26 = &a6->var0 + 40 * v18.location;
      v27 = *(float32x2_t *)(v26 + 8);
      v81 = v27;
      if ((vceq_f32(v27, (float32x2_t)vdup_lane_s32((int32x2_t)v27, 1)).u32[0] & 1) != 0
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*((float32x4_t *)&a5->var1 + 10 * v18.location), v64)), 0xFuLL))) & 1) == 0)
      {
        v27.f32[0] = v27.f32[0] + 1.0;
        v81 = v27;
      }
      v28 = *v26;
      if ((v79 & 0x100000000) != 0)
      {
        objc_msgSend(v76, "objectAtIndex:", v18.location, v56, v57);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "adjustmentForDisplayAsset:spriteIndex:inLayout:", v30, v18, v78);
        v29 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = 0;
      }
      v31 = vceq_f32(v81, (float32x2_t)v23);
      if ((v31.i8[0] & 1) == 0 || (v31.i8[4] & 1) == 0 || v29 != v80 || v28 != v22)
      {
        if ((_DWORD)v20)
        {
          if ((v79 & 0x10000000000) != 0)
            v63 = objc_msgSend(v77, "presentationIntentForSpritesInRange:inLayout:", v21 | (unint64_t)(v20 << 32), v78);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
          block[3] = &unk_1E512A780;
          objc_copyWeak(v110, &location);
          v111 = v21;
          v112 = v20;
          v106 = v65;
          v110[1] = v72;
          v110[2] = v19;
          v107 = v76;
          v110[3] = (id)v68;
          v110[4] = v23;
          v110[5] = v15;
          v110[6] = v17;
          v108 = v80;
          v110[7] = (id)v63;
          v113 = v28 == 1;
          v114 = v62;
          v115 = v61;
          v109 = v67;
          dispatch_async(queue, block);

          objc_destroyWeak(v110);
        }
        v32 = v29;

        LODWORD(v20) = 0;
        v19 = 0;
        v23 = (void *)v81;
        v22 = v28;
        v21 = v18.location;
        v72 = v24;
        v80 = v32;
      }

      v20 = (v20 + 1);
      ++v19;
      ++v24;
      v18 = (_PXGSpriteIndexRange)(v18.location + 1);
      --v25;
    }
    while (v25);
    if ((_DWORD)v20)
    {
      if ((v79 & 0x10000000000) != 0)
        v63 = objc_msgSend(v77, "presentationIntentForSpritesInRange:inLayout:", v21 | (unint64_t)(v20 << 32), v78);
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
      v94[3] = &unk_1E512A780;
      objc_copyWeak(v99, &location);
      v100 = v21;
      v101 = v20;
      v95 = v65;
      v99[1] = v72;
      v99[2] = v19;
      v96 = v76;
      v99[3] = (id)v68;
      v99[4] = v23;
      v99[5] = v15;
      v99[6] = v17;
      v80 = v80;
      v97 = v80;
      v99[7] = (id)v63;
      v102 = v22 == 1;
      v103 = v62;
      v104 = v61;
      v98 = v67;
      dispatch_async(queue, v94);

      objc_destroyWeak(v99);
    }
    v18 = a3;
  }
  if ((v68 & 2) != 0)
  {
    if ((v79 & 0x100) != 0)
    {
      objc_msgSend(v77, "minSpriteSizeForPresentationStyle:", 2);
      v33 = v35;
      v34 = v36;
    }
    else
    {
      v33 = *MEMORY[0x1E0C9D820];
      v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    objc_msgSend(v78, "rootLayout", v56);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_opt_respondsToSelector();
    if (v74)
    {
      v37 = (int)v59;
      while (1)
      {
        PXRectWithCenterAndSize();
        v39 = v38;
        v41 = v40;
        if (!PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance())
        {
          PXGTungstenGetLog();
          v42 = objc_claimAutoreleasedReturnValue();
          v43.location = v18.location;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v124.width = v39;
            v124.height = v41;
            NSStringFromCGSize(v124);
            v45 = (id)objc_claimAutoreleasedReturnValue();
            v125.width = v33;
            v125.height = v34;
            NSStringFromCGSize(v125);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v119 = v45;
            v120 = 2112;
            v121 = v46;
            _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEBUG, "Asset is too small to be played – size: %@, min size: %@", buf, 0x16u);

          }
          goto LABEL_65;
        }
        objc_msgSend(v76, "objectAtIndex:", v18.location);
        v42 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(-[NSObject playbackStyle](v42, "playbackStyle") - 3) <= 2)
          break;
        v43.location = v18.location;
LABEL_65:

        ++v37;
        v18 = (_PXGSpriteIndexRange)(v43.location + 1);
        if (!--v74)
          goto LABEL_66;
      }
      v43 = v18;
      if ((v73 & 1) != 0)
      {
        objc_msgSend(v77, "videoPresentationControllerForDisplayAsset:spriteIndex:inLayout:", v42, v18, v78);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      if ((v79 & 0x100000000) != 0)
      {
        objc_msgSend(v77, "adjustmentForDisplayAsset:spriteIndex:inLayout:", v42, v43, v78);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
          goto LABEL_61;
      }
      else
      {
        v47 = 0;
        if (v44)
        {
LABEL_61:
          v48 = 0;
LABEL_64:
          v50 = *(&a6->var0 + 40 * v43.location);
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3;
          v82[3] = &unk_1E512A7D0;
          v83 = v56;
          objc_copyWeak(&v90, &location);
          v91 = v43.location;
          v84 = v48;
          v42 = v42;
          v85 = v42;
          v86 = v44;
          v87 = v47;
          v93 = v50;
          v92 = v37;
          v88 = v67;
          v89 = v57;
          v51 = v47;
          v52 = v44;
          v53 = v48;
          dispatch_async(queue, v82);

          objc_destroyWeak(&v90);
          goto LABEL_65;
        }
      }
      objc_msgSend(v78, "objectReferenceForSpriteIndex:", v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "spriteReferenceForSpriteIndex:objectReference:", objc_msgSend(v71, "convertSpriteIndex:fromLayout:", v43, v78), v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_64;
    }
LABEL_66:

  }
  objc_destroyWeak(&location);

LABEL_68:
  v55 = v58;
  v54 = (NSUInteger)v59;
  result.length = v55;
  result.location = v54;
  return result;
}

- (PXMediaProvider)defaultMediaProvider
{
  return self->_defaultMediaProvider;
}

- (CGImage)placeholderImage
{
  void *v3;
  uint64_t v4;
  int *v5;
  CGImage *v6;

  -[PXGTextureProvider viewEnvironment](self, "viewEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = &OBJC_IVAR___PXGDisplayAssetTextureProvider__lightPlaceholderImage;
  if (v4 == 2)
    v5 = &OBJC_IVAR___PXGDisplayAssetTextureProvider__darkPlaceholderImage;
  v6 = *(Class *)((char *)&self->super.super.isa + *v5);

  return v6;
}

void __103__PXGDisplayAssetTextureProvider__workQueue_provideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(void **)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(unsigned __int8 *)(a1 + 92);
  v6 = *(unsigned int *)(a1 + 88);
  v7 = *(_OWORD *)(a1 + 48);
  v8[0] = *(_OWORD *)(a1 + 32);
  v8[1] = v7;
  objc_msgSend(v3, "provideCGImage:options:adjustment:isDegraded:forRequestID:", v2, v8, v4, v5, v6);
  CGImageRelease(*(CGImageRef *)(a1 + 80));
}

- (PXGDisplayAssetTextureProvider)initWithDefaultMediaProvider:(id)a3 layoutQueue:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  dispatch_queue_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  PXGThumbnailRequestQueue *v25;
  void *v26;
  PXGThumbnailRequestQueue *v27;
  void *v28;
  PXGImageRequestQueue *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  PXGAssetImageCache *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  _QWORD v48[4];
  id v49;
  objc_super v50;

  v7 = a3;
  v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PXGDisplayAssetTextureProvider;
  v9 = -[PXGTextureProvider init](&v50, sel_init);
  if (v9)
  {
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v9 + 54, a3);
    dispatch_queue_attr_make_initially_inactive(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.photos.texture-provider.video-requests", v11);
    v13 = (void *)*((_QWORD *)v9 + 30);
    *((_QWORD *)v9 + 30) = v12;

    *((_BYTE *)v9 + 424) = 1;
    objc_msgSend(v9, "setLayoutQueue:", v8);
    if (v8 == (id)MEMORY[0x1E0C80D38])
    {
      +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke;
      v48[3] = &unk_1E5149198;
      v49 = v9;
      objc_msgSend(v14, "scheduleMainQueueTask:", v48);

    }
    else
    {
      dispatch_activate(*((dispatch_object_t *)v9 + 30));
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = (void *)*((_QWORD *)v9 + 40);
    *((_QWORD *)v9 + 40) = v15;

    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = (void *)*((_QWORD *)v9 + 41);
    *((_QWORD *)v9 + 41) = v17;

    v19 = dispatch_queue_create("com.apple.photos.texture-provider.cancel", 0);
    v20 = (void *)*((_QWORD *)v9 + 39);
    *((_QWORD *)v9 + 39) = v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INITIATED, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.photos.texture-provider.drawing", v22);
    v24 = (void *)*((_QWORD *)v9 + 29);
    *((_QWORD *)v9 + 29) = v23;

    v25 = objc_alloc_init(PXGThumbnailRequestQueue);
    v26 = (void *)*((_QWORD *)v9 + 31);
    *((_QWORD *)v9 + 31) = v25;

    if (objc_msgSend(v10, "loadThumbnailsAsync"))
    {
      v27 = objc_alloc_init(PXGThumbnailRequestQueue);
      v28 = (void *)*((_QWORD *)v9 + 35);
      *((_QWORD *)v9 + 35) = v27;

    }
    v29 = objc_alloc_init(PXGImageRequestQueue);
    v30 = (void *)*((_QWORD *)v9 + 36);
    *((_QWORD *)v9 + 36) = v29;

    objc_msgSend(*((id *)v9 + 36), "setImageRequestPerformer:", v9);
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = (void *)*((_QWORD *)v9 + 37);
    *((_QWORD *)v9 + 37) = v31;

    v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = (void *)*((_QWORD *)v9 + 32);
    *((_QWORD *)v9 + 32) = v33;

    v35 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v36 = (void *)*((_QWORD *)v9 + 33);
    *((_QWORD *)v9 + 33) = v35;

    v37 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v38 = (void *)*((_QWORD *)v9 + 34);
    *((_QWORD *)v9 + 34) = v37;

    *((_DWORD *)v9 + 84) = 0;
    v39 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v40 = (void *)*((_QWORD *)v9 + 43);
    *((_QWORD *)v9 + 43) = v39;

    v41 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v42 = (void *)*((_QWORD *)v9 + 44);
    *((_QWORD *)v9 + 44) = v41;

    *((_QWORD *)v9 + 48) = PXGLightPlaceholderImage();
    *((_QWORD *)v9 + 49) = PXGDarkPlaceholderImage();
    *((_QWORD *)v9 + 50) = MEMORY[0x1A85CCE98](0, 0, &__block_literal_global_128297, 1.0, 1.0);
    v43 = objc_alloc_init(PXGAssetImageCache);
    v44 = (void *)*((_QWORD *)v9 + 45);
    *((_QWORD *)v9 + 45) = v43;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "processorCount");
    *((_BYTE *)v9 + 368) = v46 <= objc_msgSend(v10, "lowSpecProcessorCountLimit");

    objc_msgSend(v9, "_setupRequestOptions");
    *((_QWORD *)v9 + 55) = 0;

  }
  return (PXGDisplayAssetTextureProvider *)v9;
}

uint64_t __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke_2()
{
  return CGContextClear();
}

- (void)_setupRequestOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *requestOptions;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init((Class)off_1E50B3068);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setDeliveryMode:", 0);
  objc_msgSend(v4, "setOpportunisticDegradedImagesToReturn:", 2);
  if (-[PXGTextureProvider preferBGRA](self, "preferBGRA"))
    objc_msgSend(v4, "setLoadingMode:", objc_msgSend(v4, "loadingMode") | 0x40000);
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setLoadingMode:", objc_msgSend(v5, "loadingMode") | 0x40000);
  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v6, "setDeliveryMode:", 1);
  if (-[PXGTextureProvider preferBGRA](self, "preferBGRA"))
    objc_msgSend(v6, "setLoadingMode:", objc_msgSend(v6, "loadingMode") | 0x40000);
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setLoadingMode:", objc_msgSend(v7, "loadingMode") | 0x40000);
  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  requestOptions = self->_requestOptions;
  self->_requestOptions = v8;

}

- (void)registerImageDataSpecs:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXGDisplayAssetTextureProvider *v11;
  char v12;

  v4 = a3;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableLowResThumbnails");

  -[PXGDisplayAssetTextureProvider defaultMediaProvider](self, "defaultMediaProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PXGDisplayAssetTextureProvider_registerImageDataSpecs___block_invoke;
  v9[3] = &unk_1E512A758;
  v12 = v6;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "enumerateAvailableThumbnailDataFormats:", v9);

}

uint64_t __60__PXGDisplayAssetTextureProvider_interactionStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_updateTextureStreamingVisibility:", *(unsigned __int8 *)(a1 + 40));
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  char v13;

  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4;
  block[3] = &unk_1E512A7A8;
  objc_copyWeak(&v10, (id *)(a1 + 88));
  v11 = *(_DWORD *)(a1 + 96);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v13 = *(_BYTE *)(a1 + 104);
  v12 = *(_DWORD *)(a1 + 100);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  dispatch_async(v2, block);

  objc_destroyWeak(&v10);
}

- (void)_workQueue_updateTextureStreamingVisibility:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_workQueue_textureStreamingSessionsMap, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "presentationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "accessQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          v13[0] = v8;
          v13[1] = 3221225472;
          v13[2] = __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke;
          v13[3] = &unk_1E5144398;
          v14 = v11;
          v15 = a3;
          dispatch_async(v12, v13);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (PXGDisplayAssetTextureProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDisplayAssetTextureProvider.m"), 244, CFSTR("%s is not available as initializer"), "-[PXGDisplayAssetTextureProvider init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_lightPlaceholderImage);
  CGImageRelease(self->_darkPlaceholderImage);
  CGImageRelease(self->_transparentPlaceholderImage);
  if (!self->_videoRequestsAllowed)
  {
    self->_videoRequestsAllowed = 1;
    dispatch_resume((dispatch_object_t)self->_videoSessionsRequestQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetTextureProvider;
  -[PXGTextureProvider dealloc](&v3, sel_dealloc);
}

- (void)releaseCachedResources
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetTextureProvider;
  -[PXGTextureProvider releaseCachedResources](&v3, sel_releaseCachedResources);
  -[PXGAssetImageCache clearAllCachedImages](self->_imageCache, "clearAllCachedImages");
}

- (void)_requestQueue_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 observer:(id)a4 textureRequestIDs:(_NSRange)a5 displayAssetFetchResult:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 cannotBeSatisfiedWithThumbnail:(BOOL)a13 useLowMemoryDecode:(BOOL)a14 applyCleanApertureCrop:(BOOL)a15 mediaProvider:(id)a16
{
  double height;
  double width;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  char v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD block[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _NSRange v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double v54;
  double v55;
  unint64_t v56;
  _PXGSpriteIndexRange v57;
  BOOL v58;
  char v59;
  BOOL v60;
  BOOL v61;

  height = a8.height;
  width = a8.width;
  v23 = a4;
  v24 = a6;
  v25 = a11;
  v26 = a16;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = width;
  v29 = height;
  if (v25
    && (v30 = objc_msgSend(v25, "allowsUnadjustedOpportunisticDelivery"),
        objc_msgSend(v25, "requestSizeForProposedTargetSize:", width, height),
        v28 = v31,
        v29 = v32,
        !v30))
  {
    v33 = 0;
  }
  else
  {
    if (-[PXGTextureProvider canDeliverThumbnailData](self, "canDeliverThumbnailData")
      && (objc_msgSend(v27, "disableLowResThumbnails") & 1) == 0)
    {
      -[PXGThumbnailRequestQueue enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:](self->_requestQueue_thumbnailRequestQueue, "enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:", a3.location, HIDWORD(*(unint64_t *)&a3), a5.location, a5.length, v24, a15, v28, v29, v26);
    }
    v33 = 1;
  }
  -[PXGTextureProvider workQueue](self, "workQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __297__PXGDisplayAssetTextureProvider__requestQueue_requestTexturesForSpritesInRange_observer_textureRequestIDs_displayAssetFetchResult_presentationStyles_targetSize_screenScale_screenMaxHeadroom_adjustment_intent_cannotBeSatisfiedWithThumbnail_useLowMemoryDecode_applyCleanApertureCrop_mediaProvider___block_invoke;
  block[3] = &unk_1E512A7F8;
  v58 = a13;
  v48 = a5;
  v59 = v33;
  block[4] = self;
  v43 = v27;
  v49 = v28;
  v50 = v29;
  v60 = a15;
  v44 = v24;
  v45 = v26;
  v51 = width;
  v52 = height;
  v46 = v25;
  v47 = v23;
  v53 = a7;
  v54 = a9;
  v55 = a10;
  v56 = a12;
  v57 = a3;
  v61 = a14;
  v35 = v23;
  v36 = v25;
  v37 = v26;
  v38 = v24;
  v39 = v27;
  dispatch_async(v34, block);

}

- (void)_providePlaceholdersForRequestIDs:(_NSRange)a3 placeholderStyle:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  CGImage *transparentPlaceholderImage;
  _QWORD block[8];
  _QWORD v12[7];

  length = a3.length;
  location = a3.location;
  if (a4 == 2)
  {
    transparentPlaceholderImage = self->_transparentPlaceholderImage;
LABEL_7:
    CGImageRetain(transparentPlaceholderImage);
    -[PXGTextureProvider requestQueue](self, "requestQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_3;
    block[3] = &unk_1E51446C8;
    block[4] = self;
    block[5] = location;
    block[6] = length;
    block[7] = transparentPlaceholderImage;
    v9 = block;
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    transparentPlaceholderImage = -[PXGDisplayAssetTextureProvider placeholderImage](self, "placeholderImage");
    goto LABEL_7;
  }
  if (a4)
    return;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke;
  v12[3] = &unk_1E5149060;
  v12[5] = location;
  v12[6] = length;
  v12[4] = self;
  v9 = v12;
LABEL_8:
  dispatch_async(v7, v9);

}

- (void)_workQueue_startRequestingVideoTexturesForDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7 textureRequestID:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _PXGTextureStreamingSession *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  int v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id from;
  id location;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v8))
  {
    if (v15)
      objc_msgSend(v15, "identifier");
    else
      objc_msgSend(v14, "uuid");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "objectForKeyedSubscript:", v19);
    v20 = (_PXGTextureStreamingSession *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = -[_PXGTextureStreamingSession initWithDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:]([_PXGTextureStreamingSession alloc], "initWithDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:", v14, v15, v16, v17, v18);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "setObject:forKeyedSubscript:", v20, v19);
    }
    -[_PXGTextureStreamingSession addTextureRequestID:](v20, "addTextureRequestID:", v8, v19);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v20);
    v21 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __185__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID___block_invoke;
    v26[3] = &unk_1E5144DF8;
    objc_copyWeak(&v27, &location);
    objc_copyWeak(&v28, &from);
    objc_msgSend(v16, "setPixelBufferDidChangeHandler:", v26);
    v23[0] = v21;
    v23[1] = 3221225472;
    v23[2] = __185__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID___block_invoke_2;
    v23[3] = &unk_1E512FC70;
    objc_copyWeak(&v24, &location);
    v25 = v8;
    objc_msgSend(v16, "setProvidePlaceholderHandler:", v23);
    -[PXGDisplayAssetTextureProvider _workQueue_provideVideoFrameForTextureStreamingSession:](self, "_workQueue_provideVideoFrameForTextureStreamingSession:", v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (void)_handlePixelBufferChangedForTextureStreamingSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PXGDisplayAssetTextureProvider__handlePixelBufferChangedForTextureStreamingSession___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleProvidePlaceholderForTextureRequestID:(int)a3
{
  NSObject *v5;
  __int128 v6;
  _QWORD block[4];
  __int128 v8;
  char v9;
  __int16 v10;
  char v11;
  int v12;
  char v13;
  _BYTE v14[7];
  PXGDisplayAssetTextureProvider *v15;
  int v16;

  v11 = 0;
  v10 = 0;
  memset(v14, 0, sizeof(v14));
  v6 = *(_OWORD *)off_1E50B83E0;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PXGDisplayAssetTextureProvider__handleProvidePlaceholderForTextureRequestID___block_invoke;
  block[3] = &unk_1E512A9F8;
  v15 = self;
  v8 = v6;
  v9 = 0;
  v12 = 0;
  v13 = 0;
  v16 = a3;
  dispatch_async(v5, block);

}

- (void)_workQueue_provideVideoFrameForTextureStreamingSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  PXGDisplayAssetTextureProvider *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __CVBuffer *v32;
  __int128 location;
  __int128 v34;
  __int128 v35;

  v4 = a3;
  objc_msgSend(v4, "textureRequestIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pixelBufferSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v6, "currentPixelBuffer"));

  kdebug_trace();
  if (v7)
  {
    v8 = -[PXGDisplayAssetTextureProvider _workQueue_renderCrossfadeIfNeededWithPixelBuffer:forVideoSession:textureRequestID:](self, "_workQueue_renderCrossfadeIfNeededWithPixelBuffer:forVideoSession:textureRequestID:", v7, v4, v5);
    if (v8)
    {
      v9 = v8;
      CVPixelBufferRelease(v7);
      v7 = v9;
    }
    objc_msgSend(v4, "displayAdjustment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    location = 0u;
    objc_msgSend(v4, "pixelBufferSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "preferredTransform");
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      location = 0u;
    }

    -[NSMutableIndexSet addIndexes:](self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, "addIndexes:", v5);
    -[PXGTextureProvider requestQueue](self, "requestQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke;
    v25[3] = &unk_1E512AA48;
    v18 = v5;
    v29 = location;
    v30 = v34;
    v31 = v35;
    v26 = v18;
    v27 = self;
    v32 = v7;
    v28 = v10;
    v13 = v10;
    dispatch_async(v17, v25);

  }
  else
  {
    objc_msgSend(v4, "presentationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_initWeak((id *)&location, self);
      -[PXGTextureProvider workQueue](self, "workQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_3;
      block[3] = &unk_1E512BD68;
      v20 = v13;
      v21 = v14;
      v16 = v14;
      objc_copyWeak(&v24, (id *)&location);
      v22 = v4;
      v23 = v5;
      dispatch_async(v15, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)&location);
    }
    else
    {
      -[PXGDisplayAssetTextureProvider _workQueue_cleanupTextureStreamingSession:textureRequestIDs:](self, "_workQueue_cleanupTextureStreamingSession:textureRequestIDs:", v4, v5);
    }
  }

  kdebug_trace();
}

- (void)_workQueue_didDeliverVideoContentForRequestID:(int)a3
{
  -[NSMutableIndexSet addIndex:](self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, "addIndex:", a3);
}

- (void)_workQueue_cleanupTextureStreamingSession:(id)a3 textureRequestIDs:(id)a4
{
  id v6;
  NSMutableIndexSet *workQueue_textureRequestIDsWithDeliveredVideoFrames;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  workQueue_textureRequestIDsWithDeliveredVideoFrames = self->_workQueue_textureRequestIDsWithDeliveredVideoFrames;
  v8 = a4;
  -[NSMutableIndexSet removeIndexes:](workQueue_textureRequestIDsWithDeliveredVideoFrames, "removeIndexes:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PXGDisplayAssetTextureProvider__workQueue_cleanupTextureStreamingSession_textureRequestIDs___block_invoke;
  v10[3] = &unk_1E51460E8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v10);

  objc_msgSend(v9, "setFirstPixelBufferDisplayDate:", 0);
}

- (__CVBuffer)_workQueue_renderCrossfadeIfNeededWithPixelBuffer:(__CVBuffer *)a3 forVideoSession:(id)a4 textureRequestID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  PXGAssetImageCache *imageCache;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CIContext *v56;
  CIContext *workQueue_crossfadeRenderContext;
  __CVPixelBufferPool *v58;
  void *v59;
  uint64_t PixelFormatType;
  uint64_t v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  const __CFDictionary *v68;
  __CVBuffer *v69;
  unsigned int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CVPixelBufferPoolRef poolOut;
  CGAffineTransform v82;
  CGAffineTransform v83;
  CGAffineTransform v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  char v89;
  unsigned int v90;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v92[5];
  _QWORD v93[8];

  v93[5] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PXGTextureProvider workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  pixelBufferOut = 0;
  objc_msgSend(v8, "displayAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "isCrossfadingFromStillToVideoEnabled"))
    goto LABEL_28;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "livePhotoInitialCrossfadeDuration");
  v16 = v15;

  if (v16 <= 0.0 || objc_msgSend(v11, "playbackStyle") != 3)
    goto LABEL_28;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "livePhotoInitialCrossfadeDuration");
  v19 = v18;

  objc_msgSend(v8, "firstPixelBufferDisplayDate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(v8, "presentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22
      && (objc_msgSend(v8, "presentationController"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "desiredPlayState"),
          v23,
          v24 != 1))
    {
      v20 = 0;
    }
    else
    {
      v20 = v21;
      objc_msgSend(v8, "setFirstPixelBufferDisplayDate:", v20);
    }
  }
  objc_msgSend(v21, "timeIntervalSinceDate:", v20);
  if (v25 < v19)
  {
    v26 = v25;
    v90 = 1;
    v89 = 1;
    v88 = 0;
    imageCache = self->_imageCache;
    v28 = objc_msgSend(v9, "firstIndex");
    if (-[PXGAssetImageCache getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:](imageCache, "getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:", &v88, &v90, &v89, v11, 0, v28, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)))
    {
      if (v88)
      {
        v29 = objc_alloc(MEMORY[0x1E0C9DDC8]);
        v30 = (void *)objc_msgSend(v29, "initWithCGImage:", v88);
        objc_msgSend(v30, "imageByApplyingCGOrientation:", v90);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", a3);
        objc_msgSend(v8, "pixelBufferSource");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v74 = v21;
        if (v32)
        {
          objc_msgSend(v32, "preferredTransform");
        }
        else
        {
          v86 = 0u;
          v87 = 0u;
          v85 = 0u;
        }
        v79 = v31;
        _PXGRotatedImageWithTransform(v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "displayAsset");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "playbackStyle") == 3)
          v36 = 0.9;
        else
          v36 = 1.0;

        objc_msgSend(v34, "extent");
        v38 = v37;
        objc_msgSend(v80, "extent");
        objc_msgSend(v80, "px_imageByApplyingScale:", v38 / v39 / v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "extent");
        v42 = v41;
        v44 = v43;
        objc_msgSend(v34, "extent");
        v76 = v40;
        objc_msgSend(v40, "imageByCroppingToRect:", (v42 - v45) * 0.5, (v44 - v46) * 0.5);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "extent");
        v49 = -v48;
        objc_msgSend(v47, "extent");
        CGAffineTransformMakeTranslation(&v84, v49, -v50);
        objc_msgSend(v47, "imageByApplyingTransform:", &v84);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = v51;
        objc_msgSend(v51, "px_imageByApplyingAlpha:", 1.0 - v26 / v19);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v34;
        objc_msgSend(v52, "imageByCompositingOverImage:", v34);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pixelBufferSource");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        v73 = v52;
        if (v54)
          objc_msgSend(v54, "preferredTransform");
        else
          memset(&v82, 0, sizeof(v82));
        CGAffineTransformInvert(&v83, &v82);
        _PXGRotatedImageWithTransform(v53);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v74;
        if (!self->_workQueue_crossfadeRenderContext)
        {
          v56 = (CIContext *)objc_alloc_init(MEMORY[0x1E0C9DD90]);
          workQueue_crossfadeRenderContext = self->_workQueue_crossfadeRenderContext;
          self->_workQueue_crossfadeRenderContext = v56;

        }
        v58 = (__CVPixelBufferPool *)objc_msgSend(v8, "pixelBufferPool");
        poolOut = v58;
        v59 = v79;
        if (!v58)
        {
          PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
          v71 = MEMORY[0x1A85CD09C](PixelFormatType);
          v61 = *MEMORY[0x1E0CA8FF0];
          v92[0] = *MEMORY[0x1E0CA9010];
          v92[1] = v61;
          v93[0] = MEMORY[0x1E0C9AAB0];
          v93[1] = MEMORY[0x1E0C9AA70];
          v92[2] = *MEMORY[0x1E0CA90E0];
          v62 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v78, "extent");
          objc_msgSend(v62, "numberWithDouble:", v63);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v93[2] = v72;
          v92[3] = *MEMORY[0x1E0CA8FD8];
          v64 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v78, "extent");
          objc_msgSend(v64, "numberWithDouble:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v93[3] = v66;
          v92[4] = *MEMORY[0x1E0CA9040];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v71);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v93[4] = v67;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 5);
          v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          v59 = v79;
          CVPixelBufferPoolCreate(0, 0, v68, &poolOut);
          objc_msgSend(v8, "setPixelBufferPool:", poolOut);

          v58 = poolOut;
        }
        CVPixelBufferPoolCreatePixelBuffer(0, v58, &pixelBufferOut);
        -[CIContext render:toCVPixelBuffer:](self->_workQueue_crossfadeRenderContext, "render:toCVPixelBuffer:", v78, pixelBufferOut);

      }
    }
  }

  v69 = pixelBufferOut;
  if (!pixelBufferOut)
  {
LABEL_28:
    objc_msgSend(v8, "setPixelBufferPool:", 0);
    v69 = pixelBufferOut;
  }

  return v69;
}

- (void)cancelTextureRequests:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *cancelationQueue;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXGDisplayAssetTextureProvider;
  -[PXGTextureProvider cancelTextureRequests:](&v16, sel_cancelTextureRequests_, v4);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke;
  aBlock[3] = &unk_1E5148D08;
  aBlock[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  v8 = -[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode");
  cancelationQueue = self->_cancelationQueue;
  if (v8)
    dispatch_sync(cancelationQueue, v7);
  else
    dispatch_async(cancelationQueue, v7);
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_2;
  v12[3] = &unk_1E5148D08;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(v10, v12);

}

- (void)_cancelationQueue_cancelImageRequests:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PXGDisplayAssetTextureProvider__cancelationQueue_cancelImageRequests___block_invoke;
  v5[3] = &unk_1E5148928;
  v5[4] = self;
  v4 = a3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMutableIndexSet removeIndexes:](self->_lookupLock_requestIDsWithDeliveredPlaceholders, "removeIndexes:", v4);

  os_unfair_lock_unlock(&self->_lookupLock);
}

- (void)_workQueue_cancelTextureRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  PXGDisplayAssetTextureProvider *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _BYTE v47[128];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGImageRequestQueue cancelTextureRequests:](self->_workQueue_imageRequestQueue, "cancelTextureRequests:", v4);
  v5 = -[NSMutableDictionary count](self->_workQueue_deferredImageRequestBlocksByTextureID, "count");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke;
    v46[3] = &unk_1E5148928;
    v46[4] = self;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v46);
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSMutableDictionary allKeys](self->_workQueue_textureStreamingSessionsMap, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v43;
    v32 = self;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "objectForKeyedSubscript:", v9, v32);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeTextureRequestIDs:", v4);
        objc_msgSend(v10, "textureRequestIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (!v12)
        {
          objc_msgSend(v10, "pixelBufferSource");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v10, "displayAsset");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v10, "pixelBufferSourcesProvider");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "displayAsset");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
              v18 = v7;
              v19 = v6;
              v20 = v4;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "recyclePixelBufferSourceForDisplayAssets:", v21);

              v4 = v20;
              v6 = v19;
              v7 = v18;
              self = v32;

            }
          }
          objc_msgSend(v7, "addObject:", v9);
          objc_msgSend(v10, "presentationController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "accessQueue");
            v24 = objc_claimAutoreleasedReturnValue();
            block[0] = v6;
            block[1] = 3221225472;
            block[2] = __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke_2;
            block[3] = &unk_1E5149198;
            v41 = v23;
            dispatch_async(v24, block);

          }
        }

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v35);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = v7;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPixelBufferPool:", 0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "setObject:forKeyedSubscript:", 0, v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v27);
  }

  -[NSMutableIndexSet removeIndexes:](self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, "removeIndexes:", v4);
  -[NSMutableIndexSet removeIndexes:](self->_workQueue_textureRequestIDsThatCannotBeSatisfiedWithThumbnails, "removeIndexes:", v4);
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMutableIndexSet removeIndexes:](self->_lookupLock_requestIDsWithDeliveredThumbnails, "removeIndexes:", v4);
  os_unfair_lock_unlock(&self->_lookupLock);
  -[PXGAssetImageCache clearCachedImagesForRequestIDs:](self->_imageCache, "clearCachedImagesForRequestIDs:", v4);

}

- (double)displayLinkLastTargetTimestamp
{
  return self->_displayLinkLastTargetTimestamp;
}

- (void)setDisplayLinkLastTargetTimestamp:(double)a3
{
  self->_displayLinkLastTargetTimestamp = a3;
}

- (BOOL)videoRequestsAllowed
{
  return self->_videoRequestsAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMediaProvider, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_lookupLock_requestIDsWithDeliveredPlaceholders, 0);
  objc_storeStrong((id *)&self->_lookupLock_requestIDsWithDeliveredThumbnails, 0);
  objc_storeStrong((id *)&self->_cancelationQueue_deferredMediaRequestIDByTextureID, 0);
  objc_storeStrong((id *)&self->_cancelationQueue_mediaRequestIDByTextureID, 0);
  objc_storeStrong((id *)&self->_cancelationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_crossfadeRenderContext, 0);
  objc_storeStrong((id *)&self->_workQueue_deferredImageRequestBlocksByTextureID, 0);
  objc_storeStrong((id *)&self->_workQueue_imageRequestQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_thumbnailRequestQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_textureRequestIDsThatCannotBeSatisfiedWithThumbnails, 0);
  objc_storeStrong((id *)&self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, 0);
  objc_storeStrong((id *)&self->_workQueue_textureStreamingSessionsMap, 0);
  objc_storeStrong((id *)&self->_requestQueue_thumbnailRequestQueue, 0);
  objc_storeStrong((id *)&self->_videoSessionsRequestQueue, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);
}

void __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

uint64_t __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recyclePixelBufferSource");
}

void __72__PXGDisplayAssetTextureProvider__cancelationQueue_cancelImageRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXGTungstenGetLog();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mediaRequestID");
  if (v6)
  {
    v7 = v6;
    v8 = v4;
    v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v20 = 134217984;
        v21 = objc_msgSend(v3, "integerValue");
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_EVENT, v10, "PXGDisplayAssetTextureProviderCancelImageRequest", "Context=%{signpost.telemetry:string2}lu deferred=NO", (uint8_t *)&v20, 0xCu);
      }
    }

    objc_msgSend(v5, "mediaProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelImageRequest:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeObjectForKey:", v3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "objectForKeyedSubscript:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mediaRequestID");
  if (v13)
  {
    v14 = v13;
    v15 = v4;
    v16 = os_signpost_id_make_with_pointer(v15, *(const void **)(a1 + 32));
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        v18 = objc_msgSend(v3, "integerValue");
        v20 = 134217984;
        v21 = v18;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_EVENT, v17, "PXGDisplayAssetTextureProviderCancelImageRequest", "Context=%{signpost.telemetry:string2}lu deferred=YES", (uint8_t *)&v20, 0xCu);
      }
    }

    objc_msgSend(v12, "mediaProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cancelImageRequest:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObjectForKey:", v3);
  }

}

uint64_t __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelationQueue_cancelImageRequests:", *(_QWORD *)(a1 + 40));
}

void __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_3;
  v4[3] = &unk_1E5148D08;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 312);
  v5 = MEMORY[0x1E0C809B0];
  v7 = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_4;
  v8 = &unk_1E5148D08;
  v6 = 3221225472;
  v9 = v2;
  v10 = v3;
  dispatch_async(v4, &v5);
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_cancelTextureRequests:", *(_QWORD *)(a1 + 40), v5, v6, v7, v8, v9);

}

uint64_t __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelationQueue_cancelImageRequests:", *(_QWORD *)(a1 + 40));
}

void __94__PXGDisplayAssetTextureProvider__workQueue_cleanupTextureStreamingSession_textureRequestIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayAsset");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_workQueue_performRequestForDisplayAsset:textureRequestID:sharedState:", v4, a2, 0);

}

void __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_2;
  v4[3] = &unk_1E512AA20;
  v2 = *(_OWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 88);
  v3 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 104);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 104));

}

void __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldDisplayPreviousNonNullPixelBuffer") & 1) == 0)
  {
    v2 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_4;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v6, (id *)(a1 + 64));
    v4 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    dispatch_async(v2, block);

    objc_destroyWeak(&v6);
  }
}

void __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_workQueue_cleanupTextureStreamingSession:textureRequestIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __89__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v4;
  v12 = *(_OWORD *)(a1 + 80);
  PXGSpriteTextureInfoOrientationFromCGAffineTransform();
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v8;
  v11 = 0x3F80000000000000uLL;
  return objc_msgSend(v6, "providePixelBuffer:options:adjustment:forRequestID:", v5, &v10, v7, a2);
}

uint64_t __79__PXGDisplayAssetTextureProvider__handleProvidePlaceholderForTextureRequestID___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];

  v1 = *(_QWORD **)(a1 + 64);
  v2 = v1[48];
  v3 = *(unsigned int *)(a1 + 72);
  v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return objc_msgSend(v1, "_workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:", v2, v6, 0, 0, v3);
}

uint64_t __86__PXGDisplayAssetTextureProvider__handlePixelBufferChangedForTextureStreamingSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_provideVideoFrameForTextureStreamingSession:", *(_QWORD *)(a1 + 40));
}

void __185__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePixelBufferChangedForTextureStreamingSession:", v2);

}

void __185__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleProvidePlaceholderForTextureRequestID:", *(unsigned int *)(a1 + 40));

}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  PXGVideoPlayerViewConfiguration *v10;
  PXGViewPayload *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  PXGViewPayload *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  PXGViewPayload *v31;
  id v32;
  int v33;
  _QWORD block[4];
  id v35;
  char v36;

  v2 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v4 = objc_msgSend(WeakRetained, "isRequestActive:", *(unsigned int *)(a1 + 96));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_2;
    block[3] = &unk_1E5144398;
    v35 = *(id *)(a1 + 32);
    v36 = *(_BYTE *)(a1 + 100);
    dispatch_async(v5, block);

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 101) == 1)
    {
      objc_msgSend(v7, "videoSessionWithMediaProvider:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = -[PXGVideoPlayerViewConfiguration initWithVideoSession:toneMapToStandardDynamicRange:]([PXGVideoPlayerViewConfiguration alloc], "initWithVideoSession:toneMapToStandardDynamicRange:", v9, 1);
      v11 = -[PXGViewPayload initWithViewClass:userData:]([PXGViewPayload alloc], "initWithViewClass:userData:", objc_opt_class(), v10);
      v12 = *(NSObject **)(a1 + 48);
      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_4;
      v25[3] = &unk_1E512A980;
      objc_copyWeak(&v32, v2);
      v33 = *(_DWORD *)(a1 + 96);
      v13 = *(id *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(void **)(a1 + 64);
      v26 = v13;
      v27 = v14;
      v28 = v15;
      v29 = *(id *)(a1 + 72);
      v30 = *(id *)(a1 + 80);
      v31 = v11;
      v16 = v11;
      dispatch_async(v12, v25);

      objc_destroyWeak(&v32);
    }
    else
    {
      objc_msgSend(v7, "pixelBufferSourceWithMediaProvider:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v17 = *(NSObject **)(a1 + 48);
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_6;
        v18[3] = &unk_1E512A9A8;
        objc_copyWeak(&v23, v2);
        v19 = *(id *)(a1 + 64);
        v20 = *(id *)(a1 + 32);
        v9 = v9;
        v21 = v9;
        v22 = *(id *)(a1 + 72);
        v24 = *(_DWORD *)(a1 + 96);
        dispatch_async(v17, v18);

        objc_destroyWeak(&v23);
      }
    }

  }
}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_7(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;

  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = objc_msgSend(WeakRetained, "isRequestActive:", *(unsigned int *)(a1 + 88));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pixelBufferSourceForDisplayAsset:mediaProvider:spriteReference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 64);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_8;
      v7[3] = &unk_1E512A9A8;
      objc_copyWeak(&v12, v2);
      v8 = *(id *)(a1 + 40);
      v9 = v5;
      v10 = *(id *)(a1 + 32);
      v11 = *(id *)(a1 + 72);
      v13 = *(_DWORD *)(a1 + 88);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v12);
    }

  }
}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_startRequestingVideoTexturesForDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:textureRequestID:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72));

}

uint64_t __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_3;
  v3[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  _PXGTextureStreamingSession *v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  int v12;

  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = objc_msgSend(WeakRetained, "isRequestActive:", *(unsigned int *)(a1 + 88));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "objectForKeyedSubscript:", v5);
    v6 = (_PXGTextureStreamingSession *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[_PXGTextureStreamingSession initWithDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:]([_PXGTextureStreamingSession alloc], "initWithDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "setObject:forKeyedSubscript:", v6, v5);
    }
    -[_PXGTextureStreamingSession addTextureRequestID:](v6, "addTextureRequestID:", *(unsigned int *)(a1 + 88));
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_workQueue_didDeliverVideoContentForRequestID:", *(unsigned int *)(a1 + 88));

    v8 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_5;
    block[3] = &unk_1E512A958;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 88);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }
}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_startRequestingVideoTexturesForDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:textureRequestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72));

}

void __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "providePayload:forRequestID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));

}

uint64_t __220__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsVisible:", *(unsigned __int8 *)(a1 + 32));
}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8430);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provideFailureWithError:forRequestID:", v3, *(unsigned int *)(a1 + 48));

}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10[2];
  __int128 v11;
  int v12;
  int v13;

  if (objc_msgSend(*(id *)(a1 + 32), "isRequestActive:", *(unsigned int *)(a1 + 104))
    && (objc_msgSend(*(id *)(a1 + 40), "postProcessOptions") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewEnvironment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "CGColor");
    v4 = (void *)PXGCreateBurstImageStackFromImage();

    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_3;
    v6[3] = &unk_1E512A8E0;
    objc_copyWeak(v10, (id *)(a1 + 64));
    v10[1] = v4;
    v12 = *(_DWORD *)(a1 + 108);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v11 = *(_OWORD *)(a1 + 80);
    v13 = *(_DWORD *)(a1 + 104);
    v9 = *(id *)(a1 + 56);
    dispatch_async(v5, v6);

    objc_destroyWeak(v10);
  }
  CGImageRelease(*(CGImageRef *)(a1 + 72));
}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(unsigned int *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)(a1 + 92);
  objc_msgSend(WeakRetained, "_workQueue_handleCGImageResult:orientation:forAsset:info:targetSize:adjustment:shouldCache:textureRequestID:sharedState:", v3, v4, v5, v6, v7, 0, *(double *)(a1 + 72), *(double *)(a1 + 80), v8, *(_QWORD *)(a1 + 48));

  CGImageRelease(*(CGImageRef *)(a1 + 64));
}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_performDeferredImageRequest:targetSize:contentMode:options:resultHandler:textureRequestID:mediaProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

uint64_t __74__PXGDisplayAssetTextureProvider__processThumbnailRequestsOnRequestQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 88);
  v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  v7 = *(_QWORD *)(a1 + 80);
  return objc_msgSend(v2, "_requestQueue_handleThumbnailData:spec:forTextureRequestID:", v1, v6, v3);
}

_QWORD *__85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke(_QWORD *result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  char v12;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_2;
  v10 = &unk_1E5148928;
  v1 = result[5];
  v11 = result[4];
  v2 = result[6];
  v3 = v2 + v1;
  v12 = 0;
  if (v1 == 0x7FFFFFFFFFFFFFFFLL || v2 == 0)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = v1;
  if (v5 < v3)
  {
    v6 = v3 - 1;
    do
    {
      result = (_QWORD *)((uint64_t (*)(_QWORD *, unint64_t, char *))v9)(v8, v5, &v12);
      if (v12)
        v7 = 1;
      else
        v7 = v6 == v5;
      ++v5;
    }
    while (!v7);
  }
  return result;
}

void __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  CGImage *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  CGImage *v15;
  char v16;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_4;
  v13 = &unk_1E51479F0;
  v2 = a1[4];
  v3 = a1[5];
  v4 = (CGImage *)a1[7];
  v5 = a1[6];
  v14 = v2;
  v15 = v4;
  v6 = v5 + v3;
  v16 = 0;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = v3;
  if (v8 < v6)
  {
    v9 = v6 - 1;
    do
    {
      ((void (*)(_QWORD *, unint64_t, char *))v12)(v11, v8, &v16);
      if (v16)
        v10 = 1;
      else
        v10 = v9 == v8;
      ++v8;
    }
    while (!v10);
    v4 = (CGImage *)a1[7];
  }
  CGImageRelease(v4);
}

uint64_t __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideCGImage:forRequestID:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideNothingForRequestID:", a2);
}

uint64_t __297__PXGDisplayAssetTextureProvider__requestQueue_requestTexturesForSpritesInRange_observer_textureRequestIDs_displayAssetFetchResult_presentationStyles_targetSize_screenScale_screenMaxHeadroom_adjustment_intent_cannotBeSatisfiedWithThumbnail_useLowMemoryDecode_applyCleanApertureCrop_mediaProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 168))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addIndexesInRange:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  if (*(_BYTE *)(a1 + 169)
    && objc_msgSend(*(id *)(a1 + 32), "canDeliverThumbnailData")
    && (objc_msgSend(*(id *)(a1 + 40), "disableLowResThumbnails") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:", *(_QWORD *)(a1 + 160), HIDWORD(*(_QWORD *)(a1 + 160)), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 170), *(double *)(a1 + 96), *(double *)(a1 + 104), *(_QWORD *)(a1 + 56));
  }
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    goto LABEL_10;
  if (*(_BYTE *)(a1 + 168))
  {
    v2 = 0;
LABEL_10:
    BYTE1(v4) = *(_BYTE *)(a1 + 170);
    LOBYTE(v4) = *(_BYTE *)(a1 + 171);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "enqueueRequestsWithSpriteIndexRange:textureRequestIDs:displayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 128), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 136), *(double *)(a1 + 144), v2, *(_QWORD *)(a1 + 152), v4, *(_QWORD *)(a1 + 56));
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_imageSizeSatisfiedByThumbnail:", *(double *)(a1 + 112), *(double *)(a1 + 120));
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "requestThumbnailsOnly");
    if ((result & 1) == 0)
    {
      v2 = *(_QWORD *)(a1 + 64);
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t __59__PXGDisplayAssetTextureProvider_viewEnvironmentDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_providePlaceholdersForRequestIDs:placeholderStyle:", a2, a3, 1);
}

uint64_t __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke_2;
  v3[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsVisible:", *(unsigned __int8 *)(a1 + 32));
}

void __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke(uint64_t a1)
{
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 240));
}

+ (id)defaultMediaVersionHandlerWithDataSourceBeforeChanges:(id)a3 dataSourceAfterChanges:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__PXGDisplayAssetTextureProvider_defaultMediaVersionHandlerWithDataSourceBeforeChanges_dataSourceAfterChanges___block_invoke;
  v11[3] = &unk_1E513BA08;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  return v9;
}

BOOL __111__PXGDisplayAssetTextureProvider_defaultMediaVersionHandlerWithDataSourceBeforeChanges_dataSourceAfterChanges___block_invoke(uint64_t a1, __int128 *a2, __int128 *a3)
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  _BOOL8 v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v17 = *a2;
  v18 = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v9 = a3[1];
  v17 = *a3;
  v18 = v9;
  objc_msgSend(v8, "assetAtItemIndexPath:", &v17);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v11;
  if (v10 == v11)
  {
    v14 = 0;
  }
  else
  {
    if (v11)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v14 = 1;
    }
    else
    {
      v15 = objc_msgSend(v10, "isContentEqualTo:", v11);
      if (!v15)
        v15 = objc_msgSend(v12, "isContentEqualTo:", v10);
      v14 = v15 != 2;
    }
  }

  return v14;
}

@end
