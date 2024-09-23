@implementation PUWallpaperShuffleMediaProvider

- (PUWallpaperShuffleMediaProvider)initWithResourceManager:(id)a3
{
  id v5;
  PUWallpaperShuffleMediaProvider *v6;
  PUWallpaperShuffleMediaProvider *v7;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *operationsByRequestID;
  uint64_t v12;
  PXMediaProviderImageCacher *imageCacher;
  NSCache *v14;
  NSCache *memoryCache;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperShuffleMediaProvider;
  v6 = -[PUWallpaperShuffleMediaProvider init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceManager, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 25);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    operationsByRequestID = v7->_operationsByRequestID;
    v7->_operationsByRequestID = v10;

    v7->_operationsByIDLock._os_unfair_lock_opaque = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B598]), "initWithMediaProvider:", v7);
    imageCacher = v7->_imageCacher;
    v7->_imageCacher = (PXMediaProviderImageCacher *)v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    memoryCache = v7->_memoryCache;
    v7->_memoryCache = v14;

  }
  return v7;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _PUWallpaperShuffleMediaProviderImageOperation *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41[2];
  id location;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B510]), "initWithAsset:targetSize:contentMode:options:", v14, a5, v15, width, height);
  -[PUWallpaperShuffleMediaProvider memoryCache](self, "memoryCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v38 = v15;
    v20 = v14;
    v39 = v20;
    if (v20)
    {
      v21 = v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        v22 = -[PUWallpaperShuffleMediaProvider _nextRequestID](self, "_nextRequestID");
        -[PUWallpaperShuffleMediaProvider resourceManager](self, "resourceManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "posterMedia");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "segmentationItemLoadingOperationForPosterMedia:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)v25;
        v26 = -[_PUWallpaperShuffleMediaProviderImageOperation initWithSegmentationOperation:requestDescriptor:resultHandler:]([_PUWallpaperShuffleMediaProviderImageOperation alloc], "initWithSegmentationOperation:requestDescriptor:resultHandler:", v25, v17, v16);
        os_unfair_lock_lock(&self->_operationsByIDLock);
        -[PUWallpaperShuffleMediaProvider operationsByRequestID](self, "operationsByRequestID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

        os_unfair_lock_unlock(&self->_operationsByIDLock);
        objc_initWeak(&location, self);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __103__PUWallpaperShuffleMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v40[3] = &unk_1E58A79B8;
        objc_copyWeak(v41, &location);
        v41[1] = v22;
        -[_PUWallpaperShuffleMediaProviderImageOperation setCompletionBlock:](v26, "setCompletionBlock:", v40);
        -[PUWallpaperShuffleMediaProvider operationQueue](self, "operationQueue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addOperation:", v26);

        objc_destroyWeak(v41);
        objc_destroyWeak(&location);

        v15 = v38;
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = v21;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "px_descriptionForAssertionMessage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleMediaProvider.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v33, v36);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleMediaProvider.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v33);
    }

    v21 = v39;
    goto LABEL_5;
  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v16 + 2))(v16, objc_msgSend(objc_retainAutorelease(v19), "image"), 0, 0);
LABEL_6:

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  os_unfair_lock_s *p_operationsByIDLock;
  void *v6;
  void *v7;
  id v8;

  p_operationsByIDLock = &self->_operationsByIDLock;
  os_unfair_lock_lock(&self->_operationsByIDLock);
  -[PUWallpaperShuffleMediaProvider operationsByRequestID](self, "operationsByRequestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_operationsByIDLock);
  objc_msgSend(v8, "cancel");

}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  -[PUWallpaperShuffleMediaProvider imageCacher](self, "imageCacher");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);

}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  -[PUWallpaperShuffleMediaProvider imageCacher](self, "imageCacher");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);

}

- (void)stopCachingImagesForAllAssets
{
  id v2;

  -[PUWallpaperShuffleMediaProvider imageCacher](self, "imageCacher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopCachingImagesForAllAssets");

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

- (void)_handleOperationCompletedWithID:(int64_t)a3
{
  os_unfair_lock_s *p_operationsByIDLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  p_operationsByIDLock = &self->_operationsByIDLock;
  os_unfair_lock_lock(&self->_operationsByIDLock);
  -[PUWallpaperShuffleMediaProvider operationsByRequestID](self, "operationsByRequestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperShuffleMediaProvider operationsByRequestID](self, "operationsByRequestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

  os_unfair_lock_unlock(p_operationsByIDLock);
  objc_msgSend(v13, "resultImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PUWallpaperShuffleMediaProvider memoryCache](self, "memoryCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
}

- (PUWallpaperShuffleResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSMutableDictionary)operationsByRequestID
{
  return self->_operationsByRequestID;
}

- (PXMediaProviderImageCacher)imageCacher
{
  return self->_imageCacher;
}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_imageCacher, 0);
  objc_storeStrong((id *)&self->_operationsByRequestID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
}

void __103__PUWallpaperShuffleMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleOperationCompletedWithID:", *(_QWORD *)(a1 + 40));

}

@end
