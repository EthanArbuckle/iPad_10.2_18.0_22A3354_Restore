@implementation PXJoiningMediaProvider

- (PXJoiningMediaProvider)initWithMediaProvidersByAssetClassName:(id)a3
{
  id v4;
  PXJoiningMediaProvider *v5;
  uint64_t v6;
  NSDictionary *mediaProvidersByAssetClassName;
  uint64_t v8;
  NSArray *allMediaProviders;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXJoiningMediaProvider;
  v5 = -[PXJoiningMediaProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mediaProvidersByAssetClassName = v5->_mediaProvidersByAssetClassName;
    v5->_mediaProvidersByAssetClassName = (NSDictionary *)v6;

    objc_msgSend(v4, "allValues");
    v8 = objc_claimAutoreleasedReturnValue();
    allMediaProviders = v5->_allMediaProviders;
    v5->_allMediaProviders = (NSArray *)v8;

  }
  return v5;
}

- (PXJoiningMediaProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXJoiningMediaProvider.m"), 35, CFSTR("%s is not available as initializer"), "-[PXJoiningMediaProvider init]");

  abort();
}

- (void)cancelImageRequest:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PXJoiningMediaProvider allMediaProviders](self, "allMediaProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[PXJoiningMediaProvider allMediaProviders](self, "allMediaProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3 % v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cancelImageRequest:", a3 / v6);
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__PXJoiningMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_1E513BD08;
  v18 = v13;
  v14 = v13;
  v15 = -[PXJoiningMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PXJoiningMediaProvider _mediaProviderForAsset:](self, "_mediaProviderForAsset:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  v18 = -[PXJoiningMediaProvider _externalRequestIDForMediaProvider:mediaProviderRequestID:](self, "_externalRequestIDForMediaProvider:mediaProviderRequestID:", v16, v17);
  return v18;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXJoiningMediaProvider _mediaProviderForAsset:](self, "_mediaProviderForAsset:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestImageURLForAsset:options:resultHandler:", v10, v9, v8);

  v13 = -[PXJoiningMediaProvider _externalRequestIDForMediaProvider:mediaProviderRequestID:](self, "_externalRequestIDForMediaProvider:mediaProviderRequestID:", v11, v12);
  return v13;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  -[PXJoiningMediaProvider _mediaProviderForAsset:](self, "_mediaProviderForAsset:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:", v11, v7, a6, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXJoiningMediaProvider _mediaProviderForAsset:](self, "_mediaProviderForAsset:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestPlayerItemForVideo:options:resultHandler:", v10, v9, v8);

  v13 = -[PXJoiningMediaProvider _externalRequestIDForMediaProvider:mediaProviderRequestID:](self, "_externalRequestIDForMediaProvider:mediaProviderRequestID:", v11, v12);
  return v13;
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PXJoiningMediaProvider *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
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
  PXJoiningMediaProvider *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PXJoiningMediaProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
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

  -[PXJoiningMediaProvider requestCountByCacheSpec](self, "requestCountByCacheSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXJoiningMediaProvider requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXJoiningMediaProvider_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5142BA0;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  -[PXJoiningMediaProvider requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (id)_mediaProviderForAsset:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  -[PXJoiningMediaProvider mediaProvidersByAssetClassName](self, "mediaProvidersByAssetClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXJoiningMediaProvider.m"), 127, CFSTR("Unable to find media provider for asset %@"), v5);

  }
  return v9;
}

- (int64_t)_externalRequestIDForMediaProvider:(id)a3 mediaProviderRequestID:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v13;

  v7 = a3;
  -[PXJoiningMediaProvider allMediaProviders](self, "allMediaProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXJoiningMediaProvider.m"), 133, CFSTR("Encountered unknown media provider %@"), v7);

  }
  -[PXJoiningMediaProvider allMediaProviders](self, "allMediaProviders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 + objc_msgSend(v10, "count") * a4;

  return v11;
}

- (NSDictionary)mediaProvidersByAssetClassName
{
  return self->_mediaProvidersByAssetClassName;
}

- (NSArray)allMediaProviders
{
  return self->_allMediaProviders;
}

- (NSMutableDictionary)requestIDByCacheSpec
{
  return self->_requestIDByCacheSpec;
}

- (NSCountedSet)requestCountByCacheSpec
{
  return self->_requestCountByCacheSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountByCacheSpec, 0);
  objc_storeStrong((id *)&self->_requestIDByCacheSpec, 0);
  objc_storeStrong((id *)&self->_allMediaProviders, 0);
  objc_storeStrong((id *)&self->_mediaProvidersByAssetClassName, 0);
}

uint64_t __55__PXJoiningMediaProvider_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelImageRequest:", objc_msgSend(a3, "integerValue"));
}

void __84__PXJoiningMediaProvider_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
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

void __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
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
    v14[2] = __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E5142B50;
    v15 = v3;
    v10 = objc_msgSend(v8, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v7, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));
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

void __85__PXJoiningMediaProvider_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLAudioPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Finished caching image for asset %@: ; Info: %@",
      (uint8_t *)&v8,
      0x16u);
  }

}

void __92__PXJoiningMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  objc_class *v7;
  id v8;
  void (*v9)(uint64_t, _QWORD);
  id v10;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E0DC3870];
    v8 = a4;
    v10 = (id)objc_msgSend([v7 alloc], "initWithCGImage:scale:orientation:", a2, a3, 0.0);
    (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD))(v4 + 16);
    v10 = a4;
    v9(v4, 0);
  }

}

@end
