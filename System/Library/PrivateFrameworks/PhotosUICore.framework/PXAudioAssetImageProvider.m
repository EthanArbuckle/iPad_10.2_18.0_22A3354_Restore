@implementation PXAudioAssetImageProvider

- (PXAudioAssetImageProvider)init
{
  PXAudioAssetImageProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *requestsByImageLoaderIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *requestByClientID;
  NSMutableDictionary *v7;
  NSMutableDictionary *imageLoaderByIdentifier;
  NSCache *v9;
  NSCache *imageCache;
  objc_class *v11;
  id v12;
  const char *v13;
  os_log_t v14;
  OS_os_log *log;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXAudioAssetImageProvider;
  v2 = -[PXAudioAssetImageProvider init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestsByImageLoaderIdentifier = v2->_requestsByImageLoaderIdentifier;
    v2->_requestsByImageLoaderIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestByClientID = v2->_requestByClientID;
    v2->_requestByClientID = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imageLoaderByIdentifier = v2->_imageLoaderByIdentifier;
    v2->_imageLoaderByIdentifier = v7;

    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v9;

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    v14 = os_log_create((const char *)*MEMORY[0x1E0D71100], v13);
    log = v2->_log;
    v2->_log = (OS_os_log *)v14;

  }
  return v2;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  int64_t v20;
  _PXAudioAssetImageProviderRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id buf[2];

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  -[PXAudioAssetImageProvider log](self, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_make_with_pointer(v16, self);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "AudioAssetImageProviderResultDelivery", ", (uint8_t *)buf, 2u);
  }

  -[PXAudioAssetImageProvider setRequestCounter:](self, "setRequestCounter:", -[PXAudioAssetImageProvider requestCounter](self, "requestCounter") + 1);
  v20 = -[PXAudioAssetImageProvider requestCounter](self, "requestCounter");
  v39 = v15;
  v40 = v14;
  v21 = -[_PXAudioAssetImageProviderRequest initWithAsset:targetSize:contentMode:options:resultHandler:requestID:signpostID:]([_PXAudioAssetImageProviderRequest alloc], "initWithAsset:targetSize:contentMode:options:resultHandler:requestID:signpostID:", v13, a5, v14, v15, v20, v17, width, height);
  -[PXAudioAssetImageProvider imageCacheKeyForRequest:](self, "imageCacheKeyForRequest:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAudioAssetImageProvider imageCache](self, "imageCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_PXAudioAssetImageProviderRequest resultHandler](v21, "resultHandler");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v25)[2](v25, v24, 0);

    v26 = v19;
    v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v27, OS_SIGNPOST_INTERVAL_END, v17, "AudioAssetImageProviderResultDelivery", ", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v38 = v13;
    -[PXAudioAssetImageProvider requestByClientID](self, "requestByClientID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, v29);

    -[PXAudioAssetImageProvider imageLoaderCoalescingKeyForRequest:](self, "imageLoaderCoalescingKeyForRequest:", v21);
    v27 = objc_claimAutoreleasedReturnValue();
    -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v27);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v27);

    }
    objc_msgSend(v31, "addObject:", v21);
    -[PXAudioAssetImageProvider imageLoaderByIdentifier](self, "imageLoaderByIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      -[PXAudioAssetImageProvider createImageLoaderForRequest:](self, "createImageLoaderForRequest:", v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAudioAssetImageProvider imageLoaderByIdentifier](self, "imageLoaderByIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v27);

      objc_initWeak(buf, self);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
      v41[3] = &unk_1E5147280;
      objc_copyWeak(&v43, buf);
      v42 = v27;
      objc_msgSend(v35, "startWithCompletion:", v41);

      objc_destroyWeak(&v43);
      objc_destroyWeak(buf);

    }
    v13 = v38;
  }

  return v20;
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PXAudioAssetImageProvider *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5142B78;
  v16 = width;
  v17 = height;
  v18 = a5;
  v14 = v11;
  v15 = self;
  v12 = v11;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v13);

}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PXAudioAssetImageProvider *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PXAudioAssetImageProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
  v13[3] = &unk_1E5142B78;
  v16 = width;
  v17 = height;
  v18 = a5;
  v14 = v11;
  v15 = self;
  v12 = v11;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v13);

}

- (void)stopCachingImagesForAllAssets
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PXAudioAssetImageProvider requestCountByCacheSpec](self, "requestCountByCacheSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXAudioAssetImageProvider requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXAudioAssetImageProvider_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5142BA0;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  -[PXAudioAssetImageProvider requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)cancelImageRequest:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[PXAudioAssetImageProvider requestByClientID](self, "requestByClientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v18;
  if (v18)
  {
    -[PXAudioAssetImageProvider requestByClientID](self, "requestByClientID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

    -[PXAudioAssetImageProvider imageLoaderCoalescingKeyForRequest:](self, "imageLoaderCoalescingKeyForRequest:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v18);

    -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
    {
      -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v10);

      -[PXAudioAssetImageProvider imageLoaderByIdentifier](self, "imageLoaderByIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v10);

    }
    v7 = v18;
  }

}

- (id)imageCacheKeyForRequest:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetImageProvider.m"), 171, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioAssetImageProvider imageCacheKeyForRequest:]", v8);

  abort();
}

- (id)imageLoaderCoalescingKeyForRequest:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetImageProvider.m"), 175, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioAssetImageProvider imageLoaderCoalescingKeyForRequest:]", v8);

  abort();
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetImageProvider.m"), 179, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioAssetImageProvider createImageLoaderForRequest:]", v8);

  abort();
}

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetImageProvider.m"), 183, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioAssetImageProvider resultForCompletedImageLoader:request:error:]", v12);

  abort();
}

- (void)_handleImageLoaderCompletionForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v11 = a3;
  -[PXAudioAssetImageProvider imageLoaderByIdentifier](self, "imageLoaderByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXAudioAssetImageProvider imageLoaderByIdentifier](self, "imageLoaderByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v11);

    -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PXAudioAssetImageProvider__handleImageLoaderCompletionForIdentifier___block_invoke;
    v12[3] = &unk_1E511EC28;
    v12[4] = self;
    v13 = v5;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
    -[PXAudioAssetImageProvider requestsByImageLoaderIdentifier](self, "requestsByImageLoaderIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

  }
}

- (int64_t)requestCounter
{
  return self->_requestCounter;
}

- (void)setRequestCounter:(int64_t)a3
{
  self->_requestCounter = a3;
}

- (NSMutableDictionary)requestByClientID
{
  return self->_requestByClientID;
}

- (NSMutableDictionary)requestIDByCacheSpec
{
  return self->_requestIDByCacheSpec;
}

- (NSCountedSet)requestCountByCacheSpec
{
  return self->_requestCountByCacheSpec;
}

- (NSMutableDictionary)requestsByImageLoaderIdentifier
{
  return self->_requestsByImageLoaderIdentifier;
}

- (NSMutableDictionary)imageLoaderByIdentifier
{
  return self->_imageLoaderByIdentifier;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_imageLoaderByIdentifier, 0);
  objc_storeStrong((id *)&self->_requestsByImageLoaderIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCountByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestIDByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestByClientID, 0);
}

void __71__PXAudioAssetImageProvider__handleImageLoaderCompletionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v20 = 0;
  objc_msgSend(v4, "resultForCompletedImageLoader:request:error:", v5, v3, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageCacheKeyForRequest:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v6, v9);

    objc_msgSend(v3, "resultHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v6, 0);

    objc_msgSend(*(id *)(a1 + 32), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "signpostID");
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v19 = 0;
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioAssetImageProviderResultDelivery", ", v19, 2u);
      }
    }
  }
  else
  {
    if (v7)
    {
      v21 = *MEMORY[0x1E0CD1BE8];
      v22[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v3, "resultHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v9);

    objc_msgSend(*(id *)(a1 + 32), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v3, "signpostID");
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v16;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v19 = 0;
        goto LABEL_11;
      }
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "requestByClientID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "requestID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v18);

}

uint64_t __58__PXAudioAssetImageProvider_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelImageRequest:", objc_msgSend(a3, "integerValue"));
}

void __87__PXAudioAssetImageProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PXImageRequestDescriptor *v10;

  v3 = a2;
  v10 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCountByCacheSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v10);

    objc_msgSend(*(id *)(a1 + 40), "requestCountByCacheSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countForObject:", v10);

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "cancelImageRequest:", objc_msgSend(v5, "integerValue"));
      objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    }
  }

}

void __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXImageRequestDescriptor *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E513F148;
    v15 = v3;
    v10 = objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v7, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "requestCountByCacheSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v4);

}

void __88__PXAudioAssetImageProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAudioPlaybackGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Finished caching artwork for asset %@: ; Info: %@",
      (uint8_t *)&v7,
      0x16u);
  }

}

void __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __95__PXAudioAssetImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleImageLoaderCompletionForIdentifier:", *(_QWORD *)(a1 + 32));

}

@end
