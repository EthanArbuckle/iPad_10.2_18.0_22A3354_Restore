@implementation PUPhotoKitMediaProvider

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  PUPhotoKitMediaProviderImageDownloadSimulation *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v40;
  int v41;
  void *v43;
  int64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  id v58;
  uint8_t *v59;
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD aBlock[4];
  id v67;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v17 = v15;
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E58AA608;
  v19 = v16;
  v67 = v19;
  v20 = _Block_copy(aBlock);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v44 = a5;
    *(_QWORD *)buf = 0;
    v61 = buf;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__65024;
    v64 = __Block_byref_object_dispose__65025;
    v65 = 0;
    v53 = v18;
    v54 = 3221225472;
    v55 = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_136;
    v56 = &unk_1E58AAD18;
    v59 = buf;
    v57 = v21;
    v58 = v14;
    px_dispatch_on_main_queue();
    objc_msgSend(v17, "progressHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _Block_copy(v20);
    v25 = (void *)objc_msgSend(v17, "copy");

    v49[0] = v18;
    v49[1] = 3221225472;
    v49[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v49[3] = &unk_1E58A53C0;
    v26 = v23;
    v51 = v26;
    v27 = v57;
    v50 = v27;
    v52 = buf;
    objc_msgSend(v25, "setProgressHandler:", v49);
    v45[0] = v18;
    v45[1] = 3221225472;
    v45[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    v45[3] = &unk_1E58A5410;
    v47 = v24;
    v46 = v27;
    v48 = buf;
    v28 = v24;
    v29 = _Block_copy(v45);

    _Block_object_dispose(buf, 8);
    v20 = v29;
    a5 = v44;
  }
  else
  {
    v25 = v17;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "simulateAssetContentLoading");

  if (v31)
  {
    PLUIGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v32, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image loading because of debug 1-up settings", buf, 2u);
    }

    v33 = objc_alloc_init(PUPhotoKitMediaProviderImageDownloadSimulation);
    objc_msgSend(v25, "progressHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderImageDownloadSimulation setExternalProgressHandler:](v33, "setExternalProgressHandler:", v34);

    -[PUPhotoKitMediaProviderImageDownloadSimulation setExternalResultHandler:](v33, "setExternalResultHandler:", v20);
    v35 = (void *)objc_msgSend(v25, "copy");

    -[PUPhotoKitMediaProviderImageDownloadSimulation internalProgressHandler](v33, "internalProgressHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setProgressHandler:", v36);

    -[PUPhotoKitMediaProviderImageDownloadSimulation internalResultHandler](v33, "internalResultHandler");
    v37 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v37;
    v25 = v35;
  }
  if (objc_msgSend(v14, "isCloudPlaceholder"))
  {
    objc_msgSend(v25, "progressHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      buf[0] = 0;
      objc_msgSend(v25, "progressHandler");
      v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, uint8_t *, _QWORD, double))v39)[2](v39, 0, buf, 0, 0.0);

    }
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, a5, v25, v20, width, height);

  return v41;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  PUPhotoKitMediaProviderImageDataDownloadSimulation *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  int v34;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  uint8_t *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  id v52;
  id v53;
  uint8_t *v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v12 = v10;
  v13 = _Block_copy(v11);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    *(_QWORD *)buf = 0;
    v56 = buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__65024;
    v59 = __Block_byref_object_dispose__65025;
    v60 = 0;
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
    v51 = &unk_1E58AAD18;
    v54 = buf;
    v37 = v14;
    v52 = v14;
    v53 = v9;
    px_dispatch_on_main_queue();
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v19 = (void *)objc_msgSend(v12, "copy");

    v44[0] = v16;
    v44[1] = 3221225472;
    v44[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2;
    v44[3] = &unk_1E58A53C0;
    v20 = v17;
    v46 = v20;
    v21 = v52;
    v45 = v21;
    v47 = buf;
    objc_msgSend(v19, "setProgressHandler:", v44);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A5438;
    v42 = v18;
    v41 = v21;
    v43 = buf;
    v22 = v18;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v13 = v23;
    v15 = v37;
  }
  else
  {
    v19 = v12;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "simulateAssetContentLoading");

  if (v25)
  {
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image data loading because of debug 1-up settings", buf, 2u);
    }

    v27 = objc_alloc_init(PUPhotoKitMediaProviderImageDataDownloadSimulation);
    objc_msgSend(v19, "progressHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderImageDataDownloadSimulation setExternalProgressHandler:](v27, "setExternalProgressHandler:", v28);

    -[PUPhotoKitMediaProviderImageDataDownloadSimulation setExternalResultHandler:](v27, "setExternalResultHandler:", v13);
    v29 = (void *)objc_msgSend(v19, "copy");

    -[PUPhotoKitMediaProviderImageDataDownloadSimulation internalProgressHandler](v27, "internalProgressHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProgressHandler:", v30);

    -[PUPhotoKitMediaProviderImageDataDownloadSimulation internalResultHandler](v27, "internalResultHandler");
    v31 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v31;
    v19 = v29;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_144;
  v38[3] = &unk_1E58A5460;
  v39 = v13;
  v33 = v13;
  v34 = objc_msgSend(v32, "requestImageDataAndOrientationForAsset:options:resultHandler:", v9, v19, v38);

  return v34;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  PUPhotoKitMediaProviderPlayerItemDownloadSimulation *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  uint8_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  id v50;
  uint8_t *v51;
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v12 = v10;
  objc_msgSend(v12, "setLiveRenderVideoIfNeeded:", 1);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLiveRenderAndOnDemandRenderVideoConcurrently:", objc_msgSend(v13, "enableLiveVideoRender") ^ 1);

  v14 = _Block_copy(v11);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    *(_QWORD *)buf = 0;
    v53 = buf;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__65024;
    v56 = __Block_byref_object_dispose__65025;
    v17 = MEMORY[0x1E0C809B0];
    v57 = 0;
    v45 = MEMORY[0x1E0C809B0];
    v46 = 3221225472;
    v47 = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
    v48 = &unk_1E58AAD18;
    v51 = buf;
    v49 = v15;
    v50 = v9;
    px_dispatch_on_main_queue();
    objc_msgSend(v12, "progressHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _Block_copy(v14);
    v20 = (void *)objc_msgSend(v12, "copy");

    v41[0] = v17;
    v41[1] = 3221225472;
    v41[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
    v41[3] = &unk_1E58A53C0;
    v21 = v18;
    v43 = v21;
    v22 = v49;
    v42 = v22;
    v44 = buf;
    objc_msgSend(v20, "setProgressHandler:", v41);
    aBlock[0] = v17;
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A5488;
    v39 = v19;
    v38 = v22;
    v40 = buf;
    v23 = v19;
    v24 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v14 = v24;
  }
  else
  {
    v20 = v12;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "simulateAssetContentLoading");

  if (v26)
  {
    PLUIGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating AVPlayerItem loading because of debug 1-up settings", buf, 2u);
    }

    v28 = objc_alloc_init(PUPhotoKitMediaProviderPlayerItemDownloadSimulation);
    objc_msgSend(v20, "progressHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation setExternalProgressHandler:](v28, "setExternalProgressHandler:", v29);

    -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation setExternalResultHandler:](v28, "setExternalResultHandler:", v14);
    v30 = (void *)objc_msgSend(v20, "copy");

    -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation internalProgressHandler](v28, "internalProgressHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setProgressHandler:", v31);

    -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation internalResultHandler](v28, "internalResultHandler");
    v32 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v32;
    v20 = v30;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "requestPlayerItemForVideo:options:resultHandler:", v9, v20, v14);

  return v34;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  PUPhotoKitMediaProviderAVAssetDownloadSimulation *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  uint8_t *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  id v49;
  uint8_t *v50;
  uint8_t buf[8];
  uint8_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v12 = v10;
  v13 = _Block_copy(v11);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    *(_QWORD *)buf = 0;
    v52 = buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__65024;
    v55 = __Block_byref_object_dispose__65025;
    v16 = MEMORY[0x1E0C809B0];
    v56 = 0;
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
    v47 = &unk_1E58AAD18;
    v50 = buf;
    v48 = v14;
    v49 = v9;
    px_dispatch_on_main_queue();
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v19 = (void *)objc_msgSend(v12, "copy");

    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
    v40[3] = &unk_1E58A53C0;
    v20 = v17;
    v42 = v20;
    v21 = v48;
    v41 = v21;
    v43 = buf;
    objc_msgSend(v19, "setProgressHandler:", v40);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A54B0;
    v38 = v18;
    v37 = v21;
    v39 = buf;
    v22 = v18;
    v23 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v13 = v23;
  }
  else
  {
    v19 = v12;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "simulateAssetContentLoading");

  if (v25)
  {
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating AVAsset loading because of debug 1-up settings", buf, 2u);
    }

    v27 = objc_alloc_init(PUPhotoKitMediaProviderAVAssetDownloadSimulation);
    objc_msgSend(v19, "progressHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderAVAssetDownloadSimulation setExternalProgressHandler:](v27, "setExternalProgressHandler:", v28);

    -[PUPhotoKitMediaProviderAVAssetDownloadSimulation setExternalResultHandler:](v27, "setExternalResultHandler:", v13);
    v29 = (void *)objc_msgSend(v19, "copy");

    -[PUPhotoKitMediaProviderAVAssetDownloadSimulation internalProgressHandler](v27, "internalProgressHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProgressHandler:", v30);

    -[PUPhotoKitMediaProviderAVAssetDownloadSimulation internalResultHandler](v27, "internalResultHandler");
    v31 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v31;
    v19 = v29;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "requestAVAssetForVideo:options:resultHandler:", v9, v19, v13);

  return v33;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  PUPhotoKitMediaProviderLivePhotoDownloadSimulation *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v40;
  int64_t v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  uint8_t *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  id v54;
  id v55;
  uint8_t *v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v17 = v15;
  v18 = _Block_copy(v16);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v41 = a5;
    *(_QWORD *)buf = 0;
    v58 = buf;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__65024;
    v61 = __Block_byref_object_dispose__65025;
    v21 = MEMORY[0x1E0C809B0];
    v62 = 0;
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v53 = &unk_1E58AAD18;
    v56 = buf;
    v54 = v19;
    v55 = v14;
    px_dispatch_on_main_queue();
    objc_msgSend(v17, "progressHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _Block_copy(v18);
    v24 = (void *)objc_msgSend(v17, "copy");

    v46[0] = v21;
    v46[1] = 3221225472;
    v46[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v46[3] = &unk_1E58A53C0;
    v25 = v22;
    v48 = v25;
    v26 = v54;
    v47 = v26;
    v49 = buf;
    objc_msgSend(v24, "setProgressHandler:", v46);
    aBlock[0] = v21;
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A54D8;
    v44 = v23;
    v43 = v26;
    v45 = buf;
    v27 = v23;
    v28 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v18 = v28;
    a5 = v41;
  }
  else
  {
    v24 = v17;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "simulateAssetContentLoading");

  if (v30)
  {
    PLUIGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v31, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating Live Photo loading because of debug 1-up settings", buf, 2u);
    }

    v32 = objc_alloc_init(PUPhotoKitMediaProviderLivePhotoDownloadSimulation);
    objc_msgSend(v24, "progressHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderLivePhotoDownloadSimulation setExternalProgressHandler:](v32, "setExternalProgressHandler:", v33);

    -[PUPhotoKitMediaProviderLivePhotoDownloadSimulation setExternalResultHandler:](v32, "setExternalResultHandler:", v18);
    v34 = (void *)objc_msgSend(v24, "copy");

    -[PUPhotoKitMediaProviderLivePhotoDownloadSimulation internalProgressHandler](v32, "internalProgressHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setProgressHandler:", v35);

    -[PUPhotoKitMediaProviderLivePhotoDownloadSimulation internalResultHandler](v32, "internalResultHandler");
    v36 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v36;
    v24 = v34;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v14, a5, v24, v18, width, height);

  return v38;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  PUPhotoKitMediaProviderImageDownloadSimulation *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  uint8_t *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52;
  uint8_t *v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v12, "setLoadingMode:", 0x10000);
  v13 = _Block_copy(v11);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    *(_QWORD *)buf = 0;
    v55 = buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__65024;
    v58 = __Block_byref_object_dispose__65025;
    v59 = 0;
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
    v50 = &unk_1E58AAD18;
    v53 = buf;
    v51 = v14;
    v52 = v9;
    px_dispatch_on_main_queue();
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v43[0] = v16;
    v43[1] = 3221225472;
    v43[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2;
    v43[3] = &unk_1E58A53C0;
    v19 = v17;
    v45 = v19;
    v20 = v51;
    v44 = v20;
    v46 = buf;
    objc_msgSend(v12, "setProgressHandler:", v43);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A5500;
    v41 = v18;
    v40 = v20;
    v42 = buf;
    v21 = v18;
    v22 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v13 = v22;
  }
  v37[0] = v16;
  v37[1] = 3221225472;
  v37[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6;
  v37[3] = &unk_1E58AA608;
  v23 = v13;
  v38 = v23;
  v24 = _Block_copy(v37);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "simulateAssetContentLoading");

  if (v26)
  {
    PLUIGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image URL loading because of debug 1-up settings", buf, 2u);
    }

    v28 = objc_alloc_init(PUPhotoKitMediaProviderImageDownloadSimulation);
    objc_msgSend(v12, "progressHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderImageDownloadSimulation setExternalProgressHandler:](v28, "setExternalProgressHandler:", v29);

    -[PUPhotoKitMediaProviderImageDownloadSimulation setExternalResultHandler:](v28, "setExternalResultHandler:", v24);
    v30 = (void *)objc_msgSend(v12, "copy");

    -[PUPhotoKitMediaProviderImageDownloadSimulation internalProgressHandler](v28, "internalProgressHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setProgressHandler:", v31);

    -[PUPhotoKitMediaProviderImageDownloadSimulation internalResultHandler](v28, "internalResultHandler");
    v32 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v32;
    v12 = v30;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v24, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

  return v34;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  uint8_t *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  uint8_t *v49;
  uint8_t buf[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitMediaProvider.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:[PHAsset class]]"));

  }
  v12 = v10;
  v13 = _Block_copy(v11);
  -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    *(_QWORD *)buf = 0;
    v51 = buf;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__65024;
    v54 = __Block_byref_object_dispose__65025;
    v16 = MEMORY[0x1E0C809B0];
    v55 = 0;
    v43 = MEMORY[0x1E0C809B0];
    v44 = 3221225472;
    v45 = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
    v46 = &unk_1E58AAD18;
    v49 = buf;
    v47 = v14;
    v48 = v9;
    px_dispatch_on_main_queue();
    objc_msgSend(v12, "progressHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _Block_copy(v13);
    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2;
    v39[3] = &unk_1E58A53C0;
    v19 = v17;
    v41 = v19;
    v20 = v47;
    v40 = v20;
    v42 = buf;
    objc_msgSend(v12, "setProgressHandler:", v39);
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E58A5528;
    v37 = v18;
    v36 = v20;
    v38 = buf;
    v21 = v18;
    v22 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    v13 = v22;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "simulateAssetContentLoading");

  if (v24)
  {
    PLUIGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating animated image loading because of debug 1-up settings", buf, 2u);
    }

    v26 = objc_alloc_init(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation);
    objc_msgSend(v12, "progressHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation setExternalProgressHandler:](v26, "setExternalProgressHandler:", v27);

    -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation setExternalResultHandler:](v26, "setExternalResultHandler:", v13);
    v28 = (void *)objc_msgSend(v12, "copy");

    -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation internalProgressHandler](v26, "internalProgressHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setProgressHandler:", v29);

    -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation internalResultHandler](v26, "internalResultHandler");
    v30 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v30;
  }
  else
  {
    v28 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "requestAnimatedImageForAsset:options:resultHandler:", v9, v28, v13);

  return v32;
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CD15A0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PUPhotoKitMediaProvider_requestAsynchronousVideoURLForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E58AA330;
  v16 = v7;
  v12 = v7;
  v13 = objc_msgSend(v11, "requestURLForVideo:options:resultHandler:", v10, v9, v15);

  return v13;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", v3);

}

uint64_t __85__PUPhotoKitMediaProvider_requestAsynchronousVideoURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58A53E8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58A53E8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *MEMORY[0x1E0CD1C18];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58A53E8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_5;
  v14[3] = &unk_1E58A53E8;
  v15 = v8;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v7;
  v18 = v11;
  v16 = v10;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL8 v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48) != 0;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4, v5);

  }
}

uint64_t __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58A53E8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v11 + 16))(v11, v9, a3, a4, v10);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5;
  v16[3] = &unk_1E58A53E8;
  v17 = v10;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v9;
  v20 = v13;
  v18 = v12;
  v14 = v9;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_144(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v8 = a5;
    v9 = a3;
    v11 = a2;
    v10 = PLImageOrientationFromExifOrientation();
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v5 + 16))(v5, v11, v9, v10, v8);

  }
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL8 v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48) != 0;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4, v5);

  }
}

uint64_t __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = v7 - 9997;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v5;
  v12 = v11;
  if ((v10 & 1) != 0 || (v13 = v11, v8 <= 3))
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 < 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PUMediaProviderResultIsFullSizeFormat"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("PHImageResultIsPlaceholderKey"));

  }
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v17, v13);

}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_136(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginLoadOperationWithItemIdentifier:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v2 = a2.n128_u64[0];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(__n128))(v4 + 16))(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58A9260;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58A53E8;
  v13 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v14 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 48) != 0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, v7);

    }
  }
}

uint64_t __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(a1 + 48));
}

@end
