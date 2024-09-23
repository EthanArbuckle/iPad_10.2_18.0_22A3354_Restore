@implementation PXFlexMusicMediaProvider

- (PXFlexMusicMediaProvider)init
{
  return -[PXFlexMusicMediaProvider initWithQOSClass:](self, "initWithQOSClass:", 21);
}

- (PXFlexMusicMediaProvider)initWithQOSClass:(unsigned int)a3
{
  PXFlexMusicMediaProvider *v3;
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
  v13.super_class = (Class)PXFlexMusicMediaProvider;
  v3 = -[PXFlexMusicMediaProvider init](&v13, sel_init);
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
  int64_t v12;
  id v13;
  _PXFlexMusicMediaProviderRequest *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *queue;
  _PXFlexMusicMediaProviderRequest *v18;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  _PXFlexMusicMediaProviderRequest *v25;
  id v26;
  id buf[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v9 = a3;
  v10 = (PXAudioRequestOptions *)a4;
  v11 = a5;
  if (!v10)
    v10 = objc_alloc_init(PXAudioRequestOptions);
  v12 = -[PXFlexMusicMediaProvider _nextRequestID](self, "_nextRequestID");
  v13 = v9;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicMediaProvider.m"), 71, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("asset"), v22, v23);

    }
  }
  v14 = -[_PXFlexMusicMediaProviderRequest initWithAsset:options:requestID:resultHandler:]([_PXFlexMusicMediaProviderRequest alloc], "initWithAsset:options:requestID:resultHandler:", v13, v10, v12, v11);
  if (v10)
  {
    -[PXAudioRequestOptions maximumDuration](v10, "maximumDuration");
    if ((BYTE4(v32) & 0x1D) == 1)
    {
      PLAudioPlaybackGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "PXAudioRequestOptions.maximumDuration is not currently supported by PXFlexMusicMediaProvider", (uint8_t *)buf, 2u);
      }

    }
    -[PXAudioRequestOptions fadeOutDuration](v10, "fadeOutDuration");
    if ((BYTE4(v29) & 0x1D) == 1)
    {
      PLAudioPlaybackGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "PXAudioRequestOptions.fadeOutDuration is not currently supported by PXFlexMusicMediaProvider", (uint8_t *)buf, 2u);
      }

    }
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v29 = 0;
    v30 = 0;
    v28 = 0;
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PXFlexMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v26, buf);
  v25 = v14;
  v18 = v14;
  dispatch_async(queue, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);

  return v12;
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
  block[2] = __42__PXFlexMusicMediaProvider_cancelRequest___block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
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
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
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
      {
        objc_msgSend(v13, "progress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cancel");

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", 0, v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("Error");
      v20[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resultHandler");
      v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v18)[2](v18, 0, 0, v17);

    }
  }

}

- (void)_queue_startDownloadIfNeededForRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXFlexMusicDownloader *v8;
  NSMutableDictionary *queue_requestByID;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "requestID");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_downloaderByAsset, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = -[PXFlexMusicDownloader initWithAsset:resource:]([PXFlexMusicDownloader alloc], "initWithAsset:resource:", v5, 2);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", v8, v5);
  }
  queue_requestByID = self->_queue_requestByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](queue_requestByID, "setObject:forKeyedSubscript:", v4, v10);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_requestIDsByAsset, "setObject:forKeyedSubscript:", v11, v5);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PXFlexMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke;
  v14[3] = &unk_1E51472F8;
  objc_copyWeak(&v16, &location);
  v13 = v5;
  v15 = v13;
  -[PXFlexMusicDownloader startWithCompletion:](v8, "startWithCompletion:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXFlexMusicMediaProvider__handleDownloaderFinishedForAsset_success_error___block_invoke;
  block[3] = &unk_1E5135448;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_queue_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestByID, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_requestByID, "setObject:forKeyedSubscript:", 0, v14);
        objc_msgSend(v15, "options");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "preferredDuration");
        else
          memset(v19, 0, sizeof(v19));
        objc_msgSend(v15, "resultHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFlexMusicMediaProvider _deliverResultForAsset:preferredDuration:error:toHandler:](self, "_deliverResultForAsset:preferredDuration:error:toHandler:", v7, v19, v8, v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  objc_msgSend(v9, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queue_downloaderByAsset, "setObject:forKeyedSubscript:", 0, v7);

}

- (void)_deliverResultForAsset:(id)a3 preferredDuration:(id *)a4 error:(id)a5 toHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, id, void *);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  double v22;
  double v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  id v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v22 = 0.0;
  v23 = 0.0;
  v11 = (void (**)(id, void *, id, void *))a6;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  buf = *a4;
  objc_msgSend(v12, "playableAssetForAsset:preferredDuration:audioMix:peakValue:loudness:", v9, &buf, &v21, &v23, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  v28[0] = CFSTR("PeakdBFS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v28[1] = CFSTR("ProgramLoudnessLKFS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("Error"));
    v19 = objc_msgSend(v18, "copy");

    v17 = (void *)v19;
  }
  PLAudioPlaybackGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.var0) = 138413058;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v9;
    LOWORD(buf.var2) = 2112;
    *(_QWORD *)((char *)&buf.var2 + 2) = v13;
    HIWORD(buf.var3) = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "Delivering download result for asset %@; Result: (%@; %@; %@)",
      (uint8_t *)&buf,
      0x2Au);
  }

  v11[2](v11, v13, v14, v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloaderByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestIDsByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestByID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__PXFlexMusicMediaProvider__handleDownloaderFinishedForAsset_success_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_handleDownloaderFinishedForAsset:success:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __67__PXFlexMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleDownloaderFinishedForAsset:success:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __42__PXFlexMusicMediaProvider_cancelRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cancelRequest:", *(_QWORD *)(a1 + 40));

}

void __71__PXFlexMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_startDownloadIfNeededForRequest:", *(_QWORD *)(a1 + 32));

}

+ (PXAudioAssetMediaProvider)sharedInstance
{
  if (sharedInstance_onceToken_201690 != -1)
    dispatch_once(&sharedInstance_onceToken_201690, &__block_literal_global_201691);
  return (PXAudioAssetMediaProvider *)(id)sharedInstance_sharedProvider_201692;
}

void __42__PXFlexMusicMediaProvider_sharedInstance__block_invoke()
{
  PXFlexMusicMediaProvider *v0;
  void *v1;

  v0 = objc_alloc_init(PXFlexMusicMediaProvider);
  v1 = (void *)sharedInstance_sharedProvider_201692;
  sharedInstance_sharedProvider_201692 = (uint64_t)v0;

}

@end
