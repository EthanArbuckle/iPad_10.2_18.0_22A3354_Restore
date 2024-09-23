@implementation PUCameraTransientAssetsMediaProvider

- (PUCameraTransientAssetsMediaProvider)init
{
  return -[PUCameraTransientAssetsMediaProvider initWithTransientImageManager:supplementaryLivePhotoImageSource:](self, "initWithTransientImageManager:supplementaryLivePhotoImageSource:", 0, 0);
}

- (PUCameraTransientAssetsMediaProvider)initWithTransientImageManager:(id)a3 supplementaryLivePhotoImageSource:(id)a4
{
  id v7;
  id v8;
  PUCameraTransientAssetsMediaProvider *v9;
  uint64_t v10;
  id supplementaryLivePhotoImageSource;
  NSMutableDictionary *v12;
  NSMutableDictionary *livePhotoRequestsByRequestID;
  uint64_t v14;
  OS_dispatch_queue *livePhotoRequestQueue;
  uint64_t v16;
  OS_dispatch_queue *videoFrameGeneratorQueue;
  PUCameraTransientAssetsMediaProvider *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUCameraTransientAssetsMediaProvider;
  v9 = -[PUCameraTransientAssetsMediaProvider init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    supplementaryLivePhotoImageSource = v9->_supplementaryLivePhotoImageSource;
    v9->_supplementaryLivePhotoImageSource = (id)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    livePhotoRequestsByRequestID = v9->__livePhotoRequestsByRequestID;
    v9->__livePhotoRequestsByRequestID = v12;

    px_dispatch_queue_create_serial();
    v14 = objc_claimAutoreleasedReturnValue();
    livePhotoRequestQueue = v9->__livePhotoRequestQueue;
    v9->__livePhotoRequestQueue = (OS_dispatch_queue *)v14;

    px_dispatch_queue_create_serial();
    v16 = objc_claimAutoreleasedReturnValue();
    videoFrameGeneratorQueue = v9->_videoFrameGeneratorQueue;
    v9->_videoFrameGeneratorQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->__transientImageManager, a3);
    atomic_store(0x186A0u, (unsigned int *)&v9->_latestRequestId);
    v18 = v9;
  }

  return v9;
}

- (int)_nextRequestId
{
  int *p_latestRequestId;
  unsigned int v3;
  int result;

  p_latestRequestId = &self->_latestRequestId;
  do
  {
    v3 = __ldaxr((unsigned int *)p_latestRequestId);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, (unsigned int *)p_latestRequestId));
  return result;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double width;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSObject *videoFrameGeneratorQueue;
  _QWORD v21[4];
  id v22;
  id v23;

  width = a4.width;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = objc_opt_respondsToSelector();
  if (v13 && (v14 & 1) != 0)
  {
    v15 = v11;
    objc_msgSend(v15, "placeholderImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "mediaType") != 2)
      goto LABEL_6;
    objc_msgSend(v16, "size");
    if (width <= v17)
      goto LABEL_6;
    v18 = objc_msgSend(v12, "deliveryMode");
    videoFrameGeneratorQueue = self->_videoFrameGeneratorQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v21[3] = &unk_1E58AB968;
    v22 = v15;
    v23 = v13;
    dispatch_async(videoFrameGeneratorQueue, v21);

    if (v18 != 1)
    {
LABEL_6:
      if (v16)
        (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v16, 0);
    }

  }
  return 0;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))a5 + 2))(a5, 0, 0, 0, 0);
  return 0;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(a5, 0, 0, a4);
  return 0;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v16[4];
  void (**v17)(id, void *, _QWORD);

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = objc_msgSend(v7, "mediaType");
  if ((objc_msgSend(v7, "canPlayPhotoIris") & 1) == 0)
  {
    v10 = objc_msgSend(v7, "isPhotoIrisPlaceholder");
    if (v9 != 2)
    {
      if (!v10)
      {
        v13 = 0;
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_5:
    objc_msgSend(v7, "persistenceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCameraTransientAssetsMediaProvider _playerItemForVideoURL:](self, "_playerItemForVideoURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v8[2](v8, v12, 0);

    v13 = 0;
    goto LABEL_10;
  }
  if (v9 == 2)
    goto LABEL_5;
LABEL_9:
  -[PUCameraTransientAssetsMediaProvider _transientImageManager](self, "_transientImageManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PUCameraTransientAssetsMediaProvider _nextRequestId](self, "_nextRequestId");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__PUCameraTransientAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v16[3] = &unk_1E58AA330;
  v17 = v8;
  objc_msgSend(v12, "requestPairedVideoURLForUUID:resultHandler:", v14, v16);

LABEL_10:
LABEL_11:

  return v13;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t, _QWORD);
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  int v15;
  _QWORD v17[5];
  void (**v18)(id, uint64_t, uint64_t, _QWORD);
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t, _QWORD))a5;
  v11 = objc_msgSend(v8, "mediaType");
  if ((objc_msgSend(v8, "canPlayPhotoIris") & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v8, "isPhotoIrisPlaceholder");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__20155;
  v32 = __Block_byref_object_dispose__20156;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__20155;
  v26 = __Block_byref_object_dispose__20156;
  v27 = 0;
  if (v11 == 2)
  {
    v13 = v8;
    objc_msgSend(v13, "persistenceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
    v21[3] = &unk_1E589DB50;
    v21[4] = &v28;
    v21[5] = &v22;
    -[PUCameraTransientAssetsMediaProvider _requestAVAssetForVideoURL:resultHandler:](self, "_requestAVAssetForVideoURL:resultHandler:", v14, v21);
    if (v10)
      v10[2](v10, v29[5], v23[5], 0);
    v15 = 0;
  }
  else
  {
    if (!v12)
    {
      v15 = 0;
      goto LABEL_12;
    }
    -[PUCameraTransientAssetsMediaProvider _transientImageManager](self, "_transientImageManager");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PUCameraTransientAssetsMediaProvider _nextRequestId](self, "_nextRequestId");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
    v17[3] = &unk_1E589DB78;
    v17[4] = self;
    v19 = &v28;
    v20 = &v22;
    v18 = v10;
    objc_msgSend(v13, "requestPairedVideoURLForUUID:resultHandler:", v14, v17);

  }
LABEL_12:
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  int v16;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (-[PUCameraTransientAssetsMediaProvider _requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:targetSize:contentMode:options:resultHandler:](self, "_requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height)|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    v16 = 0;
  }
  else
  {
    v16 = -[PUCameraTransientAssetsMediaProvider _requestLivePhotoForTransientAsset:targetSize:contentMode:options:resultHandler:](self, "_requestLivePhotoForTransientAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
  }

  return v16;
}

- (BOOL)_requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  uint64_t v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double);
  PUCameraPlaceholderLivePhotoRequest *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  int v29;
  _QWORD aBlock[4];
  id v31;
  int v32;
  id location;
  uint8_t buf[4];
  PUCameraTransientAssetsMediaProvider *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  height = a4.height;
  width = a4.width;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v25 = a6;
  v26 = a7;
  v14 = -[PUCameraTransientAssetsMediaProvider _nextRequestId](self, "_nextRequestId");
  -[PUCameraTransientAssetsMediaProvider supplementaryLivePhotoImageSource](self, "supplementaryLivePhotoImageSource");
  v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
  v16 = -[PUCameraPlaceholderLivePhotoRequest initWithAsset:resultHandler:]([PUCameraPlaceholderLivePhotoRequest alloc], "initWithAsset:resultHandler:", v13, v26);
  -[PUCameraTransientAssetsMediaProvider _setLivePhotoRequest:forRequestID:](self, "_setLivePhotoRequest:forRequestID:", v16, v14);
  v17 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v17, "setNetworkAccessAllowed:", objc_msgSend(v25, "isNetworkAccessAllowed"));
  objc_msgSend(v17, "setDeliveryMode:", 1);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E589DBC8;
  objc_copyWeak(&v31, &location);
  v32 = v14;
  v19 = _Block_copy(aBlock);
  if (v15
    && (((uint64_t (**)(_QWORD, id, int64_t, id, void *, double, double))v15)[2](v15, v13, a5, v17, v19, width, height) & 1) != 0)
  {
    -[PUCameraTransientAssetsMediaProvider _transientImageManager](self, "_transientImageManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_36;
    v27[3] = &unk_1E589DBF0;
    objc_copyWeak(&v28, &location);
    v29 = v14;
    objc_msgSend(v20, "requestPairedVideoURLForUUID:resultHandler:", v21, v27);
    objc_destroyWeak(&v28);

    v22 = 1;
  }
  else
  {
    PLOneUpGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, "%@ cannot provide a live photo for iris placeholder asset %@ because its supplementary source cannot provide an image.", buf, 0x16u);
    }

    -[PUCameraPlaceholderLivePhotoRequest setImageRequestFinished:](v16, "setImageRequestFinished:", 1);
    -[PUCameraTransientAssetsMediaProvider _updateResultForLivePhotoRequestID:](self, "_updateResultForLivePhotoRequestID:", v14);
    v22 = 0;
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v22;
}

- (int)_requestLivePhotoForTransientAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v9;
  void (**v10)(id, void *, void *);
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  void (**v29)(id, void *, void *);
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, void *))a7;
  if (v10)
  {
    v11 = -[PUCameraTransientAssetsMediaProvider _nextRequestId](self, "_nextRequestId");
    v12 = v9;
    objc_msgSend(v12, "placeholderImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CD1608]);
    v15 = objc_retainAutorelease(v13);
    v16 = objc_msgSend(v15, "CGImage");
    v17 = objc_msgSend(v15, "imageOrientation");
    objc_msgSend(v12, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0CA2E18];
    v31 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v19 = (void *)objc_msgSend(v14, "initWithImage:uiOrientation:videoAsset:photoTime:assetUUID:options:videoComposition:", v16, v17, 0, &v30, v18, 0, 0);

    v32 = *MEMORY[0x1E0CD1C48];
    v33[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19, v20);

    -[PUCameraTransientAssetsMediaProvider _transientImageManager](self, "_transientImageManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __120__PUCameraTransientAssetsMediaProvider__requestLivePhotoForTransientAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v26[3] = &unk_1E589DC18;
    v26[4] = self;
    v27 = v15;
    v28 = v12;
    v29 = v10;
    v23 = v12;
    v24 = v15;
    objc_msgSend(v21, "requestPairedVideoURLForUUID:resultHandler:", v22, v26);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_handleDelegateImageRequestResultWithImage:(id)a3 info:(id)a4 requestID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v5 = *(_QWORD *)&a5;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestWithID:](self, "_livePhotoRequestWithID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setImage:", v8);
  }
  else
  {
    PLOneUpGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Failed to load image for iris placeholder asset: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setError:", v13);

  objc_msgSend(v11, "setImageRequestFinished:", 1);
  -[PUCameraTransientAssetsMediaProvider _updateResultForLivePhotoRequestID:](self, "_updateResultForLivePhotoRequestID:", v5);

}

- (void)_handleLivePhotoPairedVideoRequestResultURL:(id)a3 filterName:(id)a4 stillDisplayTime:(id *)a5 error:(id)a6 requestID:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  int64_t var3;
  uint64_t v21;

  v7 = *(_QWORD *)&a7;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a4;
  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestWithID:](self, "_livePhotoRequestWithID:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    objc_msgSend(v15, "setVideoURL:", v12);
  }
  else
  {
    PLOneUpGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 138412290;
      *(_QWORD *)((char *)&v19 + 4) = v13;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Failed to load video URL for iris placeholder asse. Error: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  if ((a5->var2 & 1) != 0)
  {
    v19 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v19);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStillDisplayTime:", v18);
  }
  else
  {
    PLOneUpGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 138412290;
      *(_QWORD *)((char *)&v19 + 4) = v13;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Failed to load still display time for iris placeholder asset. Error: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  objc_msgSend(v16, "setFilterName:", v14);
  objc_msgSend(v16, "setError:", v13);
  objc_msgSend(v16, "setVideoRequestFinished:", 1);
  -[PUCameraTransientAssetsMediaProvider _updateResultForLivePhotoRequestID:](self, "_updateResultForLivePhotoRequestID:", v7);

}

- (void)_updateResultForLivePhotoRequestID:(int)a3
{
  uint64_t v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v3 = *(_QWORD *)&a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestWithID:](self, "_livePhotoRequestWithID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "imageRequestFinished") && objc_msgSend(v5, "videoRequestFinished"))
  {
    objc_msgSend(v5, "image");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "videoURL");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v5, "stillDisplayTime");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v5, "asset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "image");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "videoURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0uLL;
          v31 = 0;
          objc_msgSend(v5, "stillDisplayTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "CMTimeValue");
          }
          else
          {
            v30 = 0uLL;
            v31 = 0;
          }

          v26 = objc_msgSend(v12, "hasPhotoColorAdjustments");
          objc_msgSend(v5, "filterName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCameraTransientAssetsMediaProvider _videoCompositionForAVAsset:filterName:](self, "_videoCompositionForAVAsset:filterName:", v14, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_alloc(MEMORY[0x1E0CD1608]);
          v18 = objc_retainAutorelease(v13);
          v24 = objc_msgSend(v18, "CGImage");
          v21 = objc_msgSend(v18, "imageOrientation");
          objc_msgSend(v12, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v30;
          v29 = v31;
          v23 = (void *)objc_msgSend(v25, "initWithImage:uiOrientation:videoAsset:photoTime:assetUUID:options:videoComposition:", v24, v21, v14, &v28, v22, v26, v20);

          ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v23, 0);
LABEL_15:

          -[PUCameraTransientAssetsMediaProvider _removeLivePhotoRequestWithID:](self, "_removeLivePhotoRequestWithID:", v3);
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v5, "error");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (id)v17;
    if (v17)
    {
      v32 = *MEMORY[0x1E0CD1BE8];
      v33[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v12);
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_livePhotoRequestWithID:(int)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20155;
  v14 = __Block_byref_object_dispose__20156;
  v15 = 0;
  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestQueue](self, "_livePhotoRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PUCameraTransientAssetsMediaProvider__livePhotoRequestWithID___block_invoke;
  block[3] = &unk_1E589F790;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)_setLivePhotoRequest:(id)a3 forRequestID:(int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestQueue](self, "_livePhotoRequestQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PUCameraTransientAssetsMediaProvider__setLivePhotoRequest_forRequestID___block_invoke;
  block[3] = &unk_1E589DC40;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_removeLivePhotoRequestWithID:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[PUCameraTransientAssetsMediaProvider _livePhotoRequestQueue](self, "_livePhotoRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PUCameraTransientAssetsMediaProvider__removeLivePhotoRequestWithID___block_invoke;
  v6[3] = &unk_1E589DC68;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_requestAVAssetForVideoURL:(id)a3 resultHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v5 = (void *)MEMORY[0x1E0C8AF90];
  v6 = a4;
  objc_msgSend(v5, "assetWithURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nominalFrameRate");
  objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionRateForNominalFrameRate:");
  v11 = v10;
  if (v10 >= 1.0)
  {
    v13 = 0;
  }
  else
  {
    v21 = 0uLL;
    v22 = 0;
    if (v7)
      objc_msgSend(v7, "duration");
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    v15 = v21;
    *(_QWORD *)&v16 = v22;
    objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionTimeRangeForDuration:", &v15);
    v12 = objc_alloc(MEMORY[0x1E0D75308]);
    v15 = v18;
    v16 = v19;
    v17 = v20;
    v13 = (void *)objc_msgSend(v12, "initWithSlowMotionTimeRange:rate:", &v15, COERCE_DOUBLE(__PAIR64__(DWORD1(v20), LODWORD(v11))));
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v7, v13);
  objc_msgSend(v14, "requestAVAssetWithResultHandler:", v6);

}

- (id)_playerItemForVideoURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__20155;
  v29 = __Block_byref_object_dispose__20156;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nominalFrameRate");
  objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionRateForNominalFrameRate:");
  v8 = v7;
  if (v7 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v26[5];
    v26[5] = v12;

  }
  else
  {
    v23 = 0uLL;
    v24 = 0;
    if (v4)
      objc_msgSend(v4, "duration");
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    v17 = v23;
    *(_QWORD *)&v18 = v24;
    objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionTimeRangeForDuration:", &v17);
    v9 = objc_alloc(MEMORY[0x1E0D75308]);
    v17 = v20;
    v18 = v21;
    v19 = v22;
    v10 = (void *)objc_msgSend(v9, "initWithSlowMotionTimeRange:rate:", &v17, COERCE_DOUBLE(__PAIR64__(DWORD1(v22), LODWORD(v8))));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v4, v10);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__PUCameraTransientAssetsMediaProvider__playerItemForVideoURL___block_invoke;
    v16[3] = &unk_1E589DC90;
    v16[4] = &v25;
    objc_msgSend(v11, "requestPlayerItemWithResultHandler:", v16);

  }
  v14 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)_videoCompositionForAVAsset:(id)a3 filterName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0C8B3C8];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __79__PUCameraTransientAssetsMediaProvider__videoCompositionForAVAsset_filterName___block_invoke;
      v11[3] = &unk_1E589DCB8;
      v12 = v6;
      objc_msgSend(v8, "videoCompositionWithAsset:applyingCIFiltersWithHandler:", v5, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)supplementaryLivePhotoImageSource
{
  return self->_supplementaryLivePhotoImageSource;
}

- (void)setSupplementaryLivePhotoImageSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PUTransientImageManager)_transientImageManager
{
  return self->__transientImageManager;
}

- (NSMutableDictionary)_livePhotoRequestsByRequestID
{
  return self->__livePhotoRequestsByRequestID;
}

- (OS_dispatch_queue)_livePhotoRequestQueue
{
  return self->__livePhotoRequestQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__livePhotoRequestQueue, 0);
  objc_storeStrong((id *)&self->__livePhotoRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->__transientImageManager, 0);
  objc_storeStrong(&self->_supplementaryLivePhotoImageSource, 0);
  objc_storeStrong((id *)&self->_videoFrameGeneratorQueue, 0);
}

void __79__PUCameraTransientAssetsMediaProvider__videoCompositionForAVAsset_filterName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "sourceImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *MEMORY[0x1E0C9E298]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithImage:context:", v4, 0);

}

void __63__PUCameraTransientAssetsMediaProvider__playerItemForVideoURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__PUCameraTransientAssetsMediaProvider__removeLivePhotoRequestWithID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_livePhotoRequestsByRequestID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __74__PUCameraTransientAssetsMediaProvider__setLivePhotoRequest_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_livePhotoRequestsByRequestID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

void __64__PUCameraTransientAssetsMediaProvider__livePhotoRequestWithID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_livePhotoRequestsByRequestID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __120__PUCameraTransientAssetsMediaProvider__requestLivePhotoForTransientAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v23 = 0uLL;
  v24 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyStillDisplayTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CMTimeValue");
  }
  else
  {
    v23 = 0uLL;
    v24 = 0;
  }

  if (v5 && (BYTE12(v23) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0CD1C48];
    v28[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyFilterName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_videoCompositionForAVAsset:filterName:", v12, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0CD1608]);
    v17 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
    v18 = objc_msgSend(*(id *)(a1 + 40), "imageOrientation");
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;
    v22 = v24;
    v20 = (void *)objc_msgSend(v16, "initWithImage:uiOrientation:videoAsset:photoTime:assetUUID:options:videoComposition:", v17, v18, v12, &v21, v19, 0, v10);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyError"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUMediaProviderErrorDomain"), -1, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v11;
    v25 = *MEMORY[0x1E0CD1BE8];
    v26 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v12 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  v10 = *(_DWORD *)(a1 + 40);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  v10 = *(_DWORD *)(a1 + 40);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_2_37(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyFilterName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyStillDisplayTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "CMTimeValue");
  else
    memset(v8, 0, sizeof(v8));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleLivePhotoPairedVideoRequestResultURL:filterName:stillDisplayTime:error:requestID:", v3, v4, v8, v7, *(unsigned int *)(a1 + 56));

}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleDelegateImageRequestResultWithImage:info:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));

}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v20 = 0uLL;
  v21 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyStillDisplayTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CMTimeValue");
  }
  else
  {
    v20 = 0uLL;
    v21 = 0;
  }

  if (v5 && (BYTE12(v20) & 1) != 0)
  {
    v12 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3;
    v18[3] = &unk_1E589DB50;
    v19 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v12, "_requestAVAssetForVideoURL:resultHandler:", v5, v18);
    v24 = CFSTR("PUMediaProviderStillDisplayTimeKey");
    v16 = v20;
    v17 = v21;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyError"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUMediaProviderErrorDomain"), -1, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11;
    v22 = *MEMORY[0x1E0CD1BE8];
    v23 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v15 + 16))(v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);

}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __88__PUCameraTransientAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v18 = 0uLL;
  v19 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyStillDisplayTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CMTimeValue");
  }
  else
  {
    v18 = 0uLL;
    v19 = 0;
  }

  if (v5 && (BYTE12(v18) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("PUMediaProviderStillDisplayTimeKey");
    v16 = v18;
    v17 = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUTransientImageManagerInfoKeyError"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUMediaProviderErrorDomain"), -1, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    v20 = *MEMORY[0x1E0CD1BE8];
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v12, v14);

}

void __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGImage *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _BYTE buf[24];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistenceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v3);
  objc_msgSend(v4, "setAppliesPreferredTrackTransform:", 1);
  v14 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v5 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v4, buf, 0, &v14);
  v6 = v14;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v5);
    CGImageRelease(v5);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    block[3] = &unk_1E58AB968;
    v8 = *(id *)(a1 + 40);
    v12 = v7;
    v13 = v8;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    PLCameraGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v16 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Unable to generate image from video asset %@ for transient asset %@. Error: %@", buf, 0x20u);
    }
  }

}

uint64_t __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
