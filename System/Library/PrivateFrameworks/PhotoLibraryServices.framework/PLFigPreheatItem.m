@implementation PLFigPreheatItem

- (PLFigPreheatItem)initWithImagePath:(id)a3 format:(unsigned __int16)a4 imageType:(int64_t)a5 optimalSourcePixelSize:(CGSize)a6 options:(unsigned int)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  PLFigPreheatItem *v14;
  uint64_t v15;
  NSString *imagePath;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  dispatch_group_t v19;
  OS_dispatch_group *requestGroup;
  objc_super v22;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLFigPreheatItem;
  v14 = -[PLFigPreheatItem init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    imagePath = v14->_imagePath;
    v14->_imagePath = (NSString *)v15;

    v14->super._format = a4;
    v14->super._optimalSourcePixelSize.width = width;
    v14->super._optimalSourcePixelSize.height = height;
    v14->_loadingOptions = a7;
    v14->super._imageType = a5;
    v17 = dispatch_queue_create("PLFigPreheatItem", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    v19 = dispatch_group_create();
    requestGroup = v14->_requestGroup;
    v14->_requestGroup = (OS_dispatch_group *)v19;

    v14->_requestID = 0;
  }

  return v14;
}

- (void)dealloc
{
  NSObject *waitGroup;
  objc_super v4;

  waitGroup = self->_waitGroup;
  if (waitGroup)
    dispatch_group_leave(waitGroup);
  v4.receiver = self;
  v4.super_class = (Class)PLFigPreheatItem;
  -[PLFigPreheatItem dealloc](&v4, sel_dealloc);
}

- (void)_cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (void)_uncancel
{
  atomic_store(0, (unsigned __int8 *)&self->_cancelled);
}

- (BOOL)_hasCachedImage
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_hasCachedImage);
  return v2 & 1;
}

- (void)_setHasCachedImage:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_hasCachedImage);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (id)cachedImage:(BOOL *)a3
{
  id v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__82469;
  v19 = __Block_byref_object_dispose__82470;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  pl_dispatch_sync();
  if (*((_BYTE *)v8 + 24))
  {
    dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0xFFFFFFFFFFFFFFFFLL);
    pl_dispatch_sync();
  }
  if (a3)
    *a3 = *((_BYTE *)v12 + 24);
  v5 = (id)v16[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

- (id)cachedImageIfAvailable:(BOOL *)a3
{
  id v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__82469;
  v15 = __Block_byref_object_dispose__82470;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[PLFigPreheatItem _hasCachedImage](self, "_hasCachedImage")
    || !dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0))
  {
    pl_dispatch_sync();
  }
  if (a3)
    *a3 = *((_BYTE *)v8 + 24);
  v5 = (id)v12[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v5;
}

- (BOOL)addImageHandler:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFigPreheatItem.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v6 = v5;
  pl_dispatch_async();

  return 1;
}

- (id)initialDecodeSessionOptions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((self->_loadingOptions & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09560]);
  return v4;
}

- (id)decodeSessionOptions
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[PLPreheatItem optimalSourcePixelSize](self, "optimalSourcePixelSize");
  if (v4 == 0.0 && v3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[PLPreheatItem optimalSourcePixelSize](self, "optimalSourcePixelSize");
    v8 = v7;
    -[PLPreheatItem optimalSourcePixelSize](self, "optimalSourcePixelSize");
    v10 = v9;
    -[PLPreheatItem optimalSourcePixelSize](self, "optimalSourcePixelSize");
    if (v8 <= v10)
      v11 = v12;
    objc_msgSend(v6, "numberWithInt:", (int)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, *MEMORY[0x1E0D09568]);

  }
  return v5;
}

- (void)_cacheImage
{
  id v3;
  NSString *imagePath;
  void *v5;
  id v6;
  void *v7;
  int CGImageFromImageData;
  NSObject *v9;
  NSString *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedImage)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D50]);
    imagePath = self->_imagePath;
    v11 = 0;
    v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:options:error:", imagePath, 2, &v11);
    v6 = v11;
    if (objc_msgSend(v5, "length"))
    {
      -[PLFigPreheatItem decodeSessionOptions](self, "decodeSessionOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageFromImageData = PFFigCreateCGImageFromImageData();

      if (CGImageFromImageData)
      {
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = self->_imagePath;
          *(_DWORD *)buf = 136315650;
          v13 = "-[PLFigPreheatItem _cacheImage]";
          v14 = 2048;
          v15 = CGImageFromImageData;
          v16 = 2048;
          v17 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %s returned %ld from %lu", buf, 0x20u);
        }

        self->_cachedImageCancelled = 0;
      }
      else
      {
        self->_cachedImageCancelled = 0;
      }
      -[PLFigPreheatItem _setHasCachedImage:](self, "_setHasCachedImage:", 1);
    }

  }
}

- (void)_loadPreheatDataWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[PLFigPreheatItem isCancelled](self, "isCancelled"))
  {
    v4[2](v4, 0);
  }
  else
  {
    pl_dispatch_once();
    v5 = (void *)_loadPreheatDataWithHandler__concurrentQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_2;
    v6[3] = &unk_1E3675C58;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "dispatchAsync:", v6);

  }
}

- (id)preheatData
{
  id v3;
  NSString *imagePath;
  void *v5;
  id v6;
  id v8;

  if (self->_imagePath)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D50]);
    imagePath = self->_imagePath;
    v8 = 0;
    v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:options:error:", imagePath, 2, &v8);
    v6 = v8;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return v5;
}

- (void)_leaveWaitGroupIfNeeded
{
  NSObject *waitGroup;
  OS_dispatch_group *v3;
  PLFigPreheatItem *obj;

  obj = self;
  objc_sync_enter(obj);
  waitGroup = obj->_waitGroup;
  if (waitGroup)
  {
    dispatch_group_leave(waitGroup);
    v3 = obj->_waitGroup;
    obj->_waitGroup = 0;

  }
  objc_sync_exit(obj);

}

- (void)startPreheatRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLFigPreheatItem _uncancel](self, "_uncancel");
  dispatch_group_enter((dispatch_group_t)self->_requestGroup);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v7);
  pl_dispatch_async();

}

- (void)cancelPreheatRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLFigPreheatItem _cancel](self, "_cancel");
  -[PLFigPreheatItem _setHasCachedImage:](self, "_setHasCachedImage:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PLFigPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v7);
  pl_dispatch_async();

}

- (unsigned)options
{
  return self->_loadingOptions;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_waitGroup, 0);
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __62__PLFigPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[18])
  {
    if (v2[19])
    {
      CMPhotoDecompressionContainerCancelAsyncRequest();
      v2 = *(_QWORD **)(a1 + 32);
    }
    v2[18] = 0;
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = (void *)v2[16];
  v2[16] = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_leaveWaitGroupIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 128) || *(_BYTE *)(v2 + 176) || *(_QWORD *)(v2 + 144))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v2 + 160));
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 0);
  }
  else
  {
    *(_BYTE *)(v2 + 136) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E36733B0;
    v5 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v6 = (void *)MEMORY[0x19AEC174C](v11);
    v7 = *(void **)(a1 + 32);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E3673400;
    v9[4] = v7;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "_loadPreheatDataWithHandler:", v9);

  }
}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 120));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_leaveWaitGroupIfNeeded");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 160));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);

}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int Container;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, int);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PFSharedFigDecodeSession();
    Container = CMPhotoDecompressionSessionCreateContainer();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4;
    v14 = &unk_1E36733D8;
    v5 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v5;
    v6 = (void *)MEMORY[0x19AEC174C](&v11);
    if (Container)
    {
      PLImageManagerGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
        *(_DWORD *)buf = 134218242;
        v18 = Container;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to open Fig container, %ld, %@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "decodeSessionOptions", v11, v12, v13, v14, v15);
      if (!CMPhotoDecompressionContainerDecodeImageForIndexAsync())
      {
LABEL_12:

        goto LABEL_13;
      }
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 152));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "isCancelled", v11, v12, v13, v14, v15));
    goto LABEL_12;
  }
  PLImageManagerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to load image data, %@", buf, 0xCu);
  }

  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "isCancelled"));
LABEL_13:

}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 != -17105 && a4 != 0)
  {
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
      *(_DWORD *)buf = 136315650;
      v11 = "-[PLFigPreheatItem startPreheatRequestWithCompletionHandler:]_block_invoke_4";
      v12 = 2048;
      v13 = a4;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "CMPhoto decompression session create in %s returned %ld from %@", buf, 0x20u);
    }

  }
  v9 = *(id *)(a1 + 40);
  pl_dispatch_sync();

}

void __61__PLFigPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 144))
  {
    *(_QWORD *)(v2 + 144) = 0;
    if (*(_QWORD *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    {
      v4 = DCIM_newPLImageWithCGImage();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 128);
      *(_QWORD *)(v5 + 128) = v4;

      v7 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
      objc_msgSend(*(id *)(a1 + 32), "_setHasCachedImage:", 1);
      v3 = v7;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 152));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;

}

void __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preheatData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v3 = v2;
  pl_dispatch_async();

}

uint64_t __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48__PLFigPreheatItem__loadPreheatDataWithHandler___block_invoke()
{
  PLConcurrentQueue *v0;
  void *v1;
  dispatch_queue_t v2;

  v2 = dispatch_queue_create("com.apple.PLFigPreheatItem.loadPreheatData", MEMORY[0x1E0C80D50]);
  v0 = -[PLConcurrentQueue initWithTargetQueue:width:]([PLConcurrentQueue alloc], "initWithTargetQueue:width:", v2, 2);
  v1 = (void *)_loadPreheatDataWithHandler__concurrentQueue;
  _loadPreheatDataWithHandler__concurrentQueue = (uint64_t)v0;

}

void __36__PLFigPreheatItem_addImageHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_group_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__PLFigPreheatItem_addImageHandler___block_invoke_2;
  v10[3] = &unk_1E3675C58;
  v2 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v3 = MEMORY[0x19AEC174C](v10);
  v4 = (void *)v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 128))
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v6 = *(NSObject **)(v5 + 168);
    if (!v6)
    {
      v7 = dispatch_group_create();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 168);
      *(_QWORD *)(v8 + 168) = v7;

      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 168));
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 168);
    }
    dispatch_group_notify(v6, *(dispatch_queue_t *)(v5 + 120), v4);
  }

}

void __36__PLFigPreheatItem_addImageHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v4 = *(id *)(a1 + 40);
  v3 = v2;
  pl_dispatch_async();

}

uint64_t __36__PLFigPreheatItem_addImageHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __43__PLFigPreheatItem_cachedImageIfAvailable___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 128));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 136);
}

void __32__PLFigPreheatItem_cachedImage___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 128) && !*(_BYTE *)(v2 + 136))
  {
    if (*(_BYTE *)(v2 + 176) || *(_QWORD *)(v2 + 144))
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    else
      objc_msgSend((id)v2, "_cacheImage");
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 128));
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 136);
  }
}

void __32__PLFigPreheatItem_cachedImage___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cacheImage");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136);
}

@end
