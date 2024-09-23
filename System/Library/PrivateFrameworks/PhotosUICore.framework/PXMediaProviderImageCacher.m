@implementation PXMediaProviderImageCacher

- (PXMediaProviderImageCacher)initWithMediaProvider:(id)a3
{
  id v4;
  PXMediaProviderImageCacher *v5;
  PXMediaProviderImageCacher *v6;
  NSCountedSet *v7;
  NSCountedSet *requestCountByCacheSpec;
  NSMutableDictionary *v9;
  NSMutableDictionary *requestIDByCacheSpec;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMediaProviderImageCacher;
  v5 = -[PXMediaProviderImageCacher init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mediaProvider, v4);
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    requestCountByCacheSpec = v6->_requestCountByCacheSpec;
    v6->_requestCountByCacheSpec = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestIDByCacheSpec = v6->_requestIDByCacheSpec;
    v6->_requestIDByCacheSpec = v9;

  }
  return v6;
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PXMediaProviderImageCacher *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
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
  PXMediaProviderImageCacher *v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v18;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PXMediaProviderImageCacher_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
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

  -[PXMediaProviderImageCacher requestCountByCacheSpec](self, "requestCountByCacheSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXMediaProviderImageCacher requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXMediaProviderImageCacher_stopCachingImagesForAllAssets__block_invoke;
  v6[3] = &unk_1E5142BA0;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  -[PXMediaProviderImageCacher requestIDByCacheSpec](self, "requestIDByCacheSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (PXMediaProvider)mediaProvider
{
  return (PXMediaProvider *)objc_loadWeakRetained((id *)&self->_mediaProvider);
}

- (void)setMediaProvider:(id)a3
{
  objc_storeWeak((id *)&self->_mediaProvider, a3);
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
  objc_destroyWeak((id *)&self->_mediaProvider);
}

void __59__PXMediaProviderImageCacher_stopCachingImagesForAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "mediaProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v6, "cancelImageRequest:", v5);
}

void __88__PXMediaProviderImageCacher_stopCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PXImageRequestDescriptor *v12;

  v3 = a2;
  v12 = -[PXImageRequestDescriptor initWithAsset:targetSize:contentMode:options:]([PXImageRequestDescriptor alloc], "initWithAsset:targetSize:contentMode:options:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCountByCacheSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v12);

    objc_msgSend(*(id *)(a1 + 40), "requestCountByCacheSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countForObject:", v12);

    if (!v8)
    {
      v9 = objc_msgSend(v5, "integerValue");
      objc_msgSend(*(id *)(a1 + 40), "mediaProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancelImageRequest:", v9);

      objc_msgSend(*(id *)(a1 + 40), "requestIDByCacheSpec");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);

    }
  }

}

void __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXImageRequestDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
    objc_msgSend(*(id *)(a1 + 40), "mediaProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
    v14[3] = &unk_1E5142B50;
    v15 = v3;
    v10 = objc_msgSend(v7, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v15, v8, v9, v14, *(double *)(a1 + 48), *(double *)(a1 + 56));

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

void __89__PXMediaProviderImageCacher_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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

@end
