@implementation PKRemoteImagePreparer

- (PKRemoteImagePreparer)init
{
  PKRemoteImagePreparer *v2;
  NSCache *v3;
  NSCache *preparedImageCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *completionHandlers;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKRemoteImagePreparer;
  v2 = -[PKRemoteImagePreparer init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    preparedImageCache = v2->_preparedImageCache;
    v2->_preparedImageCache = v3;

    -[NSCache setTotalCostLimit:](v2->_preparedImageCache, "setTotalCostLimit:", 10485760);
    v2->_completionsLock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    v7 = dispatch_queue_create("com.apple.PKRemoteImagePreparer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)fetchRemoteImage:(id)a3 completion:(id)a4
{
  -[PKRemoteImagePreparer fetchRemoteImage:scaleToSize:preheatBitmap:completion:](self, "fetchRemoteImage:scaleToSize:preheatBitmap:completion:", a3, 0, a4, -1.79769313e308, -1.79769313e308);
}

- (void)fetchRemoteImage:(id)a3 preheatBitmap:(BOOL)a4 completion:(id)a5
{
  -[PKRemoteImagePreparer fetchRemoteImage:scaleToSize:preheatBitmap:completion:](self, "fetchRemoteImage:scaleToSize:preheatBitmap:completion:", a3, a4, a5, -1.79769313e308, -1.79769313e308);
}

- (void)fetchRemoteImage:(id)a3 scaleToSize:(CGSize)a4 preheatBitmap:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  double height;
  double width;
  id v11;
  void (**v12)(id, void *);
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29[3];
  BOOL v30;
  BOOL v31;
  id location;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void (**)(id, void *))a6;
  v13 = width != *MEMORY[0x1E0C9D820];
  if (height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    v13 = 1;
  if (width == 1.79769313e308)
    v13 = 0;
  if (width == -1.79769313e308)
    v13 = 0;
  if (height == 1.79769313e308)
    v13 = 0;
  v14 = height != -1.79769313e308 && v13;
  objc_msgSend(v11, "remoteURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f-%.2f"), *(_QWORD *)&width, *(_QWORD *)&height);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("NativeSize");
  }
  v17 = CFSTR("RawData");
  if (v7)
    v17 = CFSTR("Bitmap");
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = v17;
  objc_msgSend(v15, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@_%@_%@"), v20, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_preparedImageCache, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v12[2](v12, v22);
  }
  else
  {
    v26 = v7;
    os_unfair_lock_lock(&self->_completionsLock);
    -[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v21);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_completionHandlers, "setObject:forKey:", v23, v21);
    }
    v24 = (void *)objc_msgSend(v12, "copy");
    v25 = _Block_copy(v24);
    objc_msgSend(v23, "addObject:", v25);

    os_unfair_lock_unlock(&self->_completionsLock);
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke;
    v27[3] = &unk_1E2AC7A88;
    objc_copyWeak(v29, &location);
    v30 = v14;
    v29[1] = *(id *)&width;
    v29[2] = *(id *)&height;
    v31 = v26;
    v28 = v21;
    objc_msgSend(v11, "fetchImageWithCompletion:", v27);

    objc_destroyWeak(v29);
    objc_destroyWeak(&location);

  }
}

void __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  id v12;
  __int128 v13;
  __int16 v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v6 = WeakRetained[4];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke_2;
  v9[3] = &unk_1E2AC7A60;
  v14 = *(_WORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 48);
  v10 = v3;
  v11 = WeakRetained;
  v12 = *(id *)(a1 + 32);
  v7 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_6;
  block[3] = &unk_1E2ABD9A0;
  v16 = v7;
  v8 = v3;
  dispatch_async(v6, block);

}

void __79__PKRemoteImagePreparer_fetchRemoteImage_scaleToSize_preheatBitmap_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  CGImage *v6;
  CGImage *v7;
  size_t BytesPerRow;
  size_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
  {
    +[PKImageResizingConstraints constraintsWithAspectFitToSize:](PKImageResizingConstraints, "constraintsWithAspectFitToSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resizedImageWithConstraints:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v4;
  }
  if (*(_BYTE *)(a1 + 73))
    objc_msgSend(v2, "preheatBitmapData");
  if (v2)
  {
    v5 = objc_retainAutorelease(v2);
    v6 = (CGImage *)objc_msgSend(v5, "imageRef");
    if (v6)
    {
      v7 = v6;
      BytesPerRow = CGImageGetBytesPerRow(v6);
      v9 = CGImageGetHeight(v7) * BytesPerRow;
    }
    else
    {
      objc_msgSend(v5, "imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "length");

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:cost:", v5, *(_QWORD *)(a1 + 48), v9);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v11, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_preparedImageCache, 0);
}

@end
