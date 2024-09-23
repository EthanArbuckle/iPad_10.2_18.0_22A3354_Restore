@implementation PXAppleMusicMediaProvider

- (PXAppleMusicMediaProvider)init
{
  return -[PXAppleMusicMediaProvider initWithQOSClass:](self, "initWithQOSClass:", 21);
}

- (PXAppleMusicMediaProvider)initWithQOSClass:(unsigned int)a3
{
  PXAppleMusicMediaProvider *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *queue_requestByID;
  NSMutableDictionary *v8;
  NSMutableDictionary *queue_requestIDsByAsset;
  NSMutableDictionary *v10;
  NSMutableDictionary *queue_downloaderByAsset;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXAppleMusicMediaProvider;
  v3 = -[PXAppleMusicMediaProvider init](&v13, sel_init);
  if (v3)
  {
    px_dispatch_queue_create_serial();
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_requestByID = v3->_queue_requestByID;
    v3->_queue_requestByID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_requestIDsByAsset = v3->_queue_requestIDsByAsset;
    v3->_queue_requestIDsByAsset = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_downloaderByAsset = v3->_queue_downloaderByAsset;
    v3->_queue_downloaderByAsset = v10;

  }
  return v3;
}

- (int64_t)requestMediaForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  PXAudioRequestOptions *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  int64_t v15;
  _PXAppleMusicMediaProviderRequest *v16;
  NSObject *queue;
  _PXAppleMusicMediaProviderRequest *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  _PXAppleMusicMediaProviderRequest *v32;
  id v33;
  id location;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (PXAudioRequestOptions *)a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "originalAsset");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
  }
  v13 = v9;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicMediaProvider.m"), 111, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("asset"), v29, v30);

    }
  }
  objc_msgSend(v13, "introPreviewURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[PXAppleMusicMediaProvider _nextRequestID](self, "_nextRequestID");
    if (!v10)
      v10 = objc_alloc_init(PXAudioRequestOptions);
    v16 = -[_PXAppleMusicMediaProviderRequest initWithAsset:options:requestID:resultHandler:]([_PXAppleMusicMediaProviderRequest alloc], "initWithAsset:options:requestID:resultHandler:", v13, v10, v15, v11);
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PXAppleMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v33, &location);
    v32 = v16;
    v18 = v16;
    dispatch_async(queue, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("Could not find apple music preview for asset with identifier %@"), v20);

    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v37 = *MEMORY[0x1E0CB2938];
    v38[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("PXAppleMusicMediaProviderErrorDomain"), 1, v23);

    v35 = CFSTR("Error");
    v36 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v25);

    v15 = 0;
  }

  return v15;
}

- (void)cancelRequest:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXAppleMusicMediaProvider_cancelRequest___block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_queue_cancelRequest:(int64_t)a3
{
  NSMutableDictionary *queue_requestByID;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  queue_requestByID = self->_queue_requestByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](queue_requestByID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_queue_requestByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

    if (!objc_msgSend(v11, "count"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_downloaderByAsset, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "cancel");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", 0, v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("Error");
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resultHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v17)[2](v17, 0, 0, v16);

    }
  }

}

- (int64_t)_nextRequestID
{
  int *p_requestIDCounter;
  unsigned int v3;
  signed int v4;

  p_requestIDCounter = &self->_requestIDCounter;
  do
  {
    v3 = __ldaxr((unsigned int *)p_requestIDCounter);
    v4 = v3 + 1;
  }
  while (__stlxr(v4, (unsigned int *)p_requestIDCounter));
  return v4;
}

- (id)_localMediaURLForAsset:(id)a3 createIntermediateDirectories:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {
    v24 = 0;
    objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (v11)
    {
      objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    if (!v13)
    {
LABEL_15:
      v16 = 0;
      if (!a5)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v8, "temporaryDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (!v13)
      goto LABEL_15;
  }
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleMusicMedia"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23 = v12;
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v23);
    v15 = v23;

    v12 = v15;
  }
  if (v12)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "introPreviewURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathExtension:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v21, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a5)
LABEL_11:
    *a5 = objc_retainAutorelease(v12);
LABEL_12:

  return v16;
}

- (BOOL)_canByPassExportRestriction
{
  void *v2;
  void *v3;
  char v4;

  if (!PFOSVariantHasInternalUI() || !_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.plphotosctl"));

  return v4;
}

- (void)_queue_processRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXMusicCuratorAudioAssetRequestOptions *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intent");

  if (v7 == 2)
  {
    v8 = objc_alloc_init(PXMusicCuratorAudioAssetRequestOptions);
    -[PXMusicCuratorAudioAssetRequestOptions setForceMetadataRefetch:](v8, "setForceMetadataRefetch:", 1);
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "A photo library is required and must be provided through PXAppleMusicAsset, as deprecated PHPhotoLibrary singleton may not always be available", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "storeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PXAppleMusicMediaProvider__queue_processRequest___block_invoke;
    v14[3] = &unk_1E5127748;
    v14[4] = self;
    v15 = v5;
    v16 = v4;
    v13 = +[PXMusicCurator requestAudioAssetFetchResultForAdamIDs:requestOptions:photoLibrary:completionHandler:](PXMusicCurator, "requestAudioAssetFetchResultForAdamIDs:requestOptions:photoLibrary:completionHandler:", v12, v8, v9, v14);

  }
  else
  {
    -[PXAppleMusicMediaProvider _queue_startDownloadIfNeededForRequest:](self, "_queue_startDownloadIfNeededForRequest:", v4);
  }

}

- (void)_queue_startDownloadIfNeededForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSMutableDictionary *queue_requestByID;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicMediaProvider _localMediaURLForAsset:createIntermediateDirectories:error:](self, "_localMediaURLForAsset:createIntermediateDirectories:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    -[PXAppleMusicMediaProvider _queue_deliverResultForRequest:localMediaURL:error:](self, "_queue_deliverResultForRequest:localMediaURL:error:", v4, v6, 0);
  }
  else
  {
    objc_msgSend(v4, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "networkAccessAllowed");

    if ((v11 & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_downloaderByAsset, "objectForKeyedSubscript:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v5, "introPreviewURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __68__PXAppleMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke;
        v30[3] = &unk_1E5127770;
        objc_copyWeak(&v32, &location);
        v24 = v5;
        v31 = v24;
        objc_msgSend(v23, "downloadTaskWithURL:completionHandler:", v22, v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", v13, v24);
        objc_msgSend(v4, "setSignpostID:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

      }
      v25 = objc_msgSend(v4, "requestID");
      queue_requestByID = self->_queue_requestByID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](queue_requestByID, "setObject:forKeyedSubscript:", v4, v27);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v5);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_requestIDsByAsset, "setObject:forKeyedSubscript:", v28, v5);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);

      objc_msgSend(v13, "resume");
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Could not get media for song with identifier %@ because it is not local and downloading is not allowed by the request options."), v15);

      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = *MEMORY[0x1E0CB2938];
      v37[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("PXAppleMusicMediaProviderErrorDomain"), 2, v18);

      v34 = CFSTR("Error");
      v35 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resultHandler");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v21)[2](v21, 0, 0, v20);

    }
  }

}

- (void)_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PXAppleMusicMediaProvider__handleDownloadFinishedForAsset_downloadLocation_error___block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_queue_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  v24 = v10;
  if (v9)
  {
    v12 = v10;
    if (!v10)
    {
      v32 = 0;
      -[PXAppleMusicMediaProvider _localMediaURLForAsset:createIntermediateDirectories:error:](self, "_localMediaURLForAsset:createIntermediateDirectories:error:", v8, 1, &v32, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v32;
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v12;
        v15 = objc_msgSend(v14, "moveItemAtURL:toURL:error:", v9, v13, &v31);
        v16 = v31;

        if (v15)
          v11 = v13;
        else
          v11 = 0;
        v12 = v16;
      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v12 = v10;
  }
  v26 = v9;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v8, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestByID, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_requestByID, "setObject:forKeyedSubscript:", 0, v22);
        -[PXAppleMusicMediaProvider _queue_deliverResultForRequest:localMediaURL:error:](self, "_queue_deliverResultForRequest:localMediaURL:error:", v23, v11, v12);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v19);
  }
  objc_msgSend(v17, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", 0, v8);

}

- (void)_queue_deliverResultForRequest:(id)a3 localMediaURL:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  PXAppleMusicMediaProvider *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "signpostID");
  if (v12)
  {
    v13 = v12;
    v14 = (void *)MEMORY[0x1E0D09910];
    v15 = *MEMORY[0x1E0D09708];
    v40[0] = *MEMORY[0x1E0D09830];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = *MEMORY[0x1E0D09850];
    v41[0] = v17;
    v41[1] = CFSTR("com.apple.photos.CPAnalytics.appleMusicSongDownloaded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v18 = v11;
    v19 = self;
    v20 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endSignpost:forEventName:withPayload:", v13, v15, v21);

    v9 = v20;
    self = v19;
    v11 = v18;

  }
  if (v10)
  {
    v38 = *MEMORY[0x1E0CB3388];
    v39 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PXAppleMusicMediaProviderErrorDomain"), 3, v22);
    v36 = CFSTR("Error");
    v37 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
  }
  else
  {
    objc_msgSend(v11, "loudnessMainPeak");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v11, "loudnessMainValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v34[0] = CFSTR("PeakdBFS");
        objc_msgSend(v11, "loudnessMainPeak");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = CFSTR("ProgramLoudnessLKFS");
        v35[0] = v28;
        objc_msgSend(v11, "loudnessMainValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }
    }
    objc_msgSend(v8, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "entryPoint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v22, "fadeOutDuration");
      objc_msgSend(v22, "maximumDuration");
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      memset(v32, 0, sizeof(v32));
    }
    v31 = 0;
    -[PXAppleMusicMediaProvider _avAssetWithLocalMediaURL:entryPoint:fadeOutDuration:maximumDuration:audioMix:](self, "_avAssetWithLocalMediaURL:entryPoint:fadeOutDuration:maximumDuration:audioMix:", v9, v23, v33, v32, &v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v31;
  }

  objc_msgSend(v8, "resultHandler");
  v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id, void *))v30)[2](v30, v26, v25, v24);

}

- (id)_avAssetWithLocalMediaURL:(id)a3 entryPoint:(id)a4 fadeOutDuration:(id *)a5 maximumDuration:(id *)a6 audioMix:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  Float64 v15;
  uint64_t v16;
  id v17;
  int v18;
  NSObject *v19;
  Float64 Seconds;
  _BOOL4 v21;
  id v22;
  id v23;
  CMTime *v24;
  char v25;
  void *v26;
  NSObject *v27;
  CMTimeEpoch epoch;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v39;
  NSObject *v40;
  id v41;
  CMTime v43;
  CMTimeRange v44;
  CMTime lhs;
  CMTime v46;
  CMTime rhs;
  CMTime time1;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  CMTime *p_time2;
  CMTimeRange *p_start;
  CMTime time2;
  int v55;
  id v56;
  id v57;
  CMTime end;
  CMTimeRange v59;
  CMTime v60;
  NSObject *v61;
  CMTimeRange start;
  CMTimeEpoch v63;
  uint64_t v64;
  _QWORD v65[4];

  v65[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v64 = *MEMORY[0x1E0C8AD90];
  v65[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithURL:options:", v10, v13);

  objc_msgSend(v11, "time");
  memset(&v60, 0, sizeof(v60));
  CMTimeMakeWithSeconds(&v60, v15, PXAudioDefaultCMTimeScale);
  memset(&v59, 0, sizeof(v59));
  if (v14)
    objc_msgSend(v14, "duration");
  else
    memset(&end, 0, sizeof(end));
  start.start = v60;
  CMTimeRangeFromTimeToTime(&v59, &start.start, &end);
  if ((a6->var2 & 0x1D) == 1)
  {
    v57 = 0;
    *(_OWORD *)&start.start.value = *(_OWORD *)&a6->var0;
    start.start.epoch = a6->var3;
    objc_msgSend(v14, "px_assetByClampingToDuration:error:", &start, &v57);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v57;

    if (v16)
    {
      v18 = 0;
      v14 = (void *)v16;
    }
    else
    {
      PLAudioPlaybackGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)&start.start.value = *(_OWORD *)&a6->var0;
        start.start.epoch = a6->var3;
        Seconds = CMTimeGetSeconds(&start.start);
        LODWORD(start.start.value) = 134218498;
        *(Float64 *)((char *)&start.start.value + 4) = Seconds;
        LOWORD(start.start.flags) = 2112;
        *(_QWORD *)((char *)&start.start.flags + 2) = 0;
        HIWORD(start.start.epoch) = 2112;
        start.duration.value = (CMTimeValue)v17;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Failed to trim asset to duration %.2fs asset for asset %@: %@", (uint8_t *)&start, 0x20u);
      }

      v14 = 0;
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  if (PXAudioAssetEntryPointIsNull(v11))
  {
    *(_OWORD *)&start.start.value = *(_OWORD *)&a5->var0;
    start.start.epoch = a5->var3;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v21 = CMTimeCompare(&start.start, &time2) > 0;
  }
  else
  {
    v21 = 1;
  }
  if (((v18 | !v21) & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C8B268]);
    v56 = v17;
    start = v59;
    v24 = (CMTime *)MEMORY[0x1E0CA2E68];
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v25 = objc_msgSend(MEMORY[0x1E0D75130], "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", &start, v14, &time2, v23, &v56);
    v41 = v56;

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v23, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0C8B258]);
        v40 = objc_alloc_init(MEMORY[0x1E0C8B260]);
        -[NSObject setTrackID:](v40, "setTrackID:", -[NSObject trackID](v27, "trackID"));
        time2.value = 0;
        *(_QWORD *)&time2.timescale = &time2;
        time2.epoch = 0x2020000000;
        v55 = 0;
        start.start.value = 0;
        *(_QWORD *)&start.start.timescale = &start;
        start.start.epoch = 0x3810000000;
        *(_OWORD *)&start.duration.timescale = *(_OWORD *)&v24->value;
        epoch = v24->epoch;
        start.duration.value = (CMTimeValue)&unk_1A7E74EE7;
        v63 = epoch;
        objc_msgSend(v11, "fadeInKeyTimeOffsets");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v40;
        if (objc_msgSend(v39, "count"))
        {
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __107__PXAppleMusicMediaProvider__avAssetWithLocalMediaURL_entryPoint_fadeOutDuration_maximumDuration_audioMix___block_invoke;
          v49[3] = &unk_1E5127798;
          v50 = v11;
          v51 = v40;
          p_time2 = &time2;
          p_start = &start;
          objc_msgSend(v39, "enumerateObjectsUsingBlock:", v49);

          v29 = v40;
        }
        else
        {
          *(_DWORD *)(*(_QWORD *)&time2.timescale + 24) = 1065353216;
        }
        if ((a5->var2 & 0x1D) == 1)
        {
          time1 = (CMTime)*a5;
          rhs = *v24;
          if (CMTimeCompare(&time1, &rhs) >= 1)
          {
            memset(&time1, 0, sizeof(time1));
            v31 = *(_QWORD *)&start.start.timescale;
            if (v23)
              objc_msgSend(v23, "duration");
            else
              memset(&lhs, 0, sizeof(lhs));
            rhs = (CMTime)*a5;
            CMTimeSubtract(&v46, &lhs, &rhs);
            rhs = *(CMTime *)(v31 + 32);
            CMTimeMaximum(&time1, &rhs, &v46);
            v32 = *(_DWORD *)(*(_QWORD *)&time2.timescale + 24);
            if (v23)
              objc_msgSend(v23, "duration");
            else
              memset(&v43, 0, sizeof(v43));
            rhs = time1;
            CMTimeRangeFromTimeToTime(&v44, &rhs, &v43);
            LODWORD(v33) = 0;
            LODWORD(v34) = v32;
            -[NSObject setVolumeRampFromStartVolume:toEndVolume:timeRange:](v29, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v44, v34, v33);
          }
        }
        v61 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setInputParameters:", v35);

        _Block_object_dispose(&start, 8);
        _Block_object_dispose(&time2, 8);
        v30 = v40;
      }
      else
      {
        PLAudioPlaybackGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LODWORD(start.start.value) = 138412546;
          *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v14;
          LOWORD(start.start.flags) = 2112;
          *(_QWORD *)((char *)&start.start.flags + 2) = v41;
          _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "Failed to find audio track for apply audio ramping to asset %@: %@", (uint8_t *)&start, 0x16u);
        }
        v22 = 0;
      }

      v36 = objc_msgSend(v23, "copy");
      v14 = (void *)v36;
    }
    else
    {
      PLAudioPlaybackGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(start.start.value) = 138412546;
        *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v14;
        LOWORD(start.start.flags) = 2112;
        *(_QWORD *)((char *)&start.start.flags + 2) = v41;
        _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Failed to create AVComposition to apply audio ramping to asset %@: %@", (uint8_t *)&start, 0x16u);
      }
      v22 = 0;
    }

    v17 = v41;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v22);
  v37 = v14;

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloaderByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestIDsByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestByID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

double __107__PXAppleMusicMediaProvider__avAssetWithLocalMediaURL_entryPoint_fadeOutDuration_maximumDuration_audioMix___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  int v6;
  double v7;
  Float64 v8;
  void *v9;
  double v10;
  double v11;
  double result;
  CMTime v13;
  CMTime start;
  CMTimeRange v15;
  CMTime v16;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "fadeInGainAtOffset:");
  v6 = v5;
  memset(&v16, 0, sizeof(v16));
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  CMTimeMakeWithSeconds(&v16, v8, PXAudioDefaultCMTimeScale);
  v9 = (void *)a1[5];
  LODWORD(v8) = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  start = *(CMTime *)(*(_QWORD *)(a1[7] + 8) + 32);
  v13 = v16;
  CMTimeRangeFromTimeToTime(&v15, &start, &v13);
  LODWORD(v10) = LODWORD(v8);
  LODWORD(v11) = v6;
  objc_msgSend(v9, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v15, v10, v11);
  result = *(double *)&v16.value;
  *(CMTime *)(*(_QWORD *)(a1[7] + 8) + 32) = v16;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  return result;
}

void __84__PXAppleMusicMediaProvider__handleDownloadFinishedForAsset_downloadLocation_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_queue_handleDownloadFinishedForAsset:downloadLocation:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __68__PXAppleMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleDownloadFinishedForAsset:downloadLocation:error:", *(_QWORD *)(a1 + 32), v8, v7);

}

void __51__PXAppleMusicMediaProvider__queue_processRequest___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "flags") & 2) != 0 || (objc_msgSend(a1[4], "_canByPassExportRestriction") & 1) != 0)
  {
    objc_msgSend(a1[4], "_queue_startDownloadIfNeededForRequest:", a1[6]);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(a1[5], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Asset can't be shared, identifier %@"), v5);

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("PXAppleMusicMediaProviderErrorDomain"), 4, v8);

    v12 = CFSTR("Error");
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "resultHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v10);

  }
}

void __43__PXAppleMusicMediaProvider_cancelRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cancelRequest:", *(_QWORD *)(a1 + 40));

}

void __72__PXAppleMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_processRequest:", *(_QWORD *)(a1 + 32));

}

+ (PXAudioAssetMediaProvider)sharedInstance
{
  if (sharedInstance_onceToken_110084 != -1)
    dispatch_once(&sharedInstance_onceToken_110084, &__block_literal_global_110085);
  return (PXAudioAssetMediaProvider *)(id)sharedInstance_sharedProvider;
}

void __43__PXAppleMusicMediaProvider_sharedInstance__block_invoke()
{
  PXAppleMusicMediaProvider *v0;
  void *v1;

  v0 = objc_alloc_init(PXAppleMusicMediaProvider);
  v1 = (void *)sharedInstance_sharedProvider;
  sharedInstance_sharedProvider = (uint64_t)v0;

}

@end
