@implementation PXFileBackedUIMediaProvider

- (PXFileBackedUIMediaProvider)init
{
  return -[PXFileBackedUIMediaProvider initWithCachingEnabled:](self, "initWithCachingEnabled:", 1);
}

- (PXFileBackedUIMediaProvider)initWithCachingEnabled:(BOOL)a3
{
  PXFileBackedUIMediaProvider *v4;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  NSCache *v7;
  NSCache *cache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXFileBackedUIMediaProvider;
  v4 = -[PXFileBackedUIMediaProvider init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v4->_queue;
    v4->_queue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_queue, "setMaxConcurrentOperationCount:", 4);
    -[NSOperationQueue setQualityOfService:](v4->_queue, "setQualityOfService:", 25);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v4->_cache;
    v4->_cache = v7;

    v4->_cachingEnabled = a3;
  }
  return v4;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  objc_class *v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0C8B300];
  v7 = (void (**)(id, void *, _QWORD))a5;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);
  v7[2](v7, v11, 0);

  return 0;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  id v15;
  PXFileBackedImageKey *v16;
  void *v17;
  PXFileBackedImageKey *v18;
  uint64_t v19;
  id v20;
  void (**v21)(void *, void *, _QWORD);
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  PXFileBackedImageKey *v31;
  id v32;
  void (**v33)(void *, void *, _QWORD);
  id v34;
  id location;
  id v36;
  _QWORD aBlock[4];
  id v38;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v12;
  v16 = [PXFileBackedImageKey alloc];
  objc_msgSend(v15, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXFileBackedImageKey initWithUrl:size:preferHDR:](v16, "initWithUrl:size:preferHDR:", v17, objc_msgSend(v13, "preferHDR"), width, height);

  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E513D3D0;
  v20 = v14;
  v38 = v20;
  v21 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v21[2](v21, v22, 0);
  }
  else if (objc_msgSend(v13, "isSynchronous"))
  {
    v36 = 0;
    -[PXFileBackedUIMediaProvider _createImageForKey:error:](self, "_createImageForKey:error:", v18, &v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v36;
    ((void (**)(void *, void *, id))v21)[2](v21, v23, v24);

  }
  else
  {
    objc_msgSend(v15, "previewImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v15, "previewImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v26, 0);

    }
    objc_initWeak(&location, self);
    v27 = (void *)MEMORY[0x1E0CB34C8];
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v30[3] = &unk_1E5147230;
    objc_copyWeak(&v34, &location);
    v31 = v18;
    v32 = v13;
    v33 = v21;
    objc_msgSend(v27, "blockOperationWithBlock:", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v28);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return 0;
}

- (id)_createImageForKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeWithFilenameExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  -[PXFileBackedUIMediaProvider _resizeImageAtURL:imageUTI:targetSize:preferHDR:bakeInOrientation:error:](self, "_resizeImageAtURL:imageUTI:targetSize:preferHDR:bakeInOrientation:error:", v6, v10, objc_msgSend(v5, "preferHDR"), 1, 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFileBackedUIMediaProvider _handleImageCreated:imageKey:](self, "_handleImageCreated:imageKey:", v13, v5);
  return v13;
}

- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 preferHDR:(BOOL)a6 bakeInOrientation:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  double height;
  double width;
  const __CFURL *v14;
  id v15;
  void *v16;
  const __CFDictionary *v17;
  CGImageSourceRef v18;
  CGImageSource *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  CGImageRef ThumbnailAtIndex;
  CGImage *v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[2];

  v9 = a7;
  v10 = a6;
  height = a5.height;
  width = a5.width;
  v30[1] = *MEMORY[0x1E0C80C00];
  v14 = (const __CFURL *)a3;
  v15 = a4;
  v16 = v15;
  if (v15)
  {
    v29 = *MEMORY[0x1E0CBD2A8];
    v30[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = CGImageSourceCreateWithURL(v14, v17);
  if (!v18)
  {
    v27 = 0;
    if (!a8)
      goto LABEL_18;
    goto LABEL_16;
  }
  v19 = v18;
  if (width >= height)
    v20 = width;
  else
    v20 = height;
  v21 = (int)v20;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBD2A0]);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBD178]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CBD190]);

  if (v10)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CBD1B0], *MEMORY[0x1E0CBD1A0]);
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v19, 0, (CFDictionaryRef)v22);
  if (ThumbnailAtIndex)
  {
    v26 = ThumbnailAtIndex;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", ThumbnailAtIndex);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v26);
  }
  else
  {
    v27 = 0;
  }
  CFRelease(v19);

  if (a8)
  {
LABEL_16:
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXFileBackedUIMediaProviderErrorDomain"), -100, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_18:

  return v27;
}

- (void)_handleImageCreated:(id)a3 imageKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 && -[PXFileBackedUIMediaProvider isCachingEnabled](self, "isCachingEnabled"))
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v7, v6);

}

- (BOOL)isCachingEnabled
{
  return self->_cachingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10 = *MEMORY[0x1E0CD1BE8];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v8);

}

void __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id *v7;
  id v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  void *v18;
  id v19;
  id v20;
  id v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v21 = 0;
  objc_msgSend(WeakRetained, "_createImageForKey:error:", v3, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;

  objc_msgSend(*(id *)(a1 + 40), "resultHandlerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
    block[3] = &unk_1E5145688;
    v7 = &v20;
    v8 = *(id *)(a1 + 48);
    v9 = &v18;
    v20 = v8;
    v18 = v4;
    v10 = &v19;
    v19 = v5;
    v11 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = &v16;
    v12 = *(id *)(a1 + 48);
    v9 = &v14;
    v16 = v12;
    v14 = v4;
    v10 = &v15;
    v15 = v5;
    v13 = v4;
    px_dispatch_on_main_queue();
  }

}

uint64_t __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__PXFileBackedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
