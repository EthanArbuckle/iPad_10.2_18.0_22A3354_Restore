@implementation PUFilmstripMediaProvider

- (PUFilmstripMediaProvider)initWithAVAsset:(id)a3 videoComposition:(id)a4
{
  id v6;
  id v7;
  PUFilmstripMediaProvider *v8;
  uint64_t v9;
  AVAssetImageGenerator *imageGenerator;
  AVAssetImageGenerator *v11;
  AVAssetImageGenerator *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *ivarQueue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *imageGenerationQueue;
  NSMutableDictionary *v24;
  NSMutableDictionary *ivarQueue_completionHandlersByRequestNumber;
  NSMutableDictionary *v26;
  NSMutableDictionary *ivarQueue_resultsByRequestNumber;
  NSMutableArray *v28;
  NSMutableArray *ivarQueue_pendingResults;
  NSCache *v30;
  NSCache *imageCache;
  CMTime v33;
  CMTime v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PUFilmstripMediaProvider;
  v8 = -[PUFilmstripMediaProvider init](&v35, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v6);
      imageGenerator = v8->__imageGenerator;
      v8->__imageGenerator = (AVAssetImageGenerator *)v9;

      -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](v8->__imageGenerator, "setAppliesPreferredTrackTransform:", 1);
      v11 = v8->__imageGenerator;
      CMTimeMake(&v34, 1, 2);
      -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](v11, "setRequestedTimeToleranceAfter:", &v34);
      v12 = v8->__imageGenerator;
      CMTimeMake(&v33, 1, 2);
      -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v12, "setRequestedTimeToleranceBefore:", &v33);
      -[AVAssetImageGenerator setVideoComposition:](v8->__imageGenerator, "setVideoComposition:", v7);
      -[AVAssetImageGenerator customVideoCompositor](v8->__imageGenerator, "customVideoCompositor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[AVAssetImageGenerator customVideoCompositor](v8->__imageGenerator, "customVideoCompositor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setLabel:", CFSTR("PUFilmstripMediaProvider"));

      }
    }
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = dispatch_queue_create("com.apple.PUFilmstripMediaProvider.ivar", v17);
    ivarQueue = v8->_ivarQueue;
    v8->_ivarQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.PUFilmstripMediaProvider.imageGeneration", v21);
    imageGenerationQueue = v8->_imageGenerationQueue;
    v8->_imageGenerationQueue = (OS_dispatch_queue *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ivarQueue_completionHandlersByRequestNumber = v8->_ivarQueue_completionHandlersByRequestNumber;
    v8->_ivarQueue_completionHandlersByRequestNumber = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ivarQueue_resultsByRequestNumber = v8->_ivarQueue_resultsByRequestNumber;
    v8->_ivarQueue_resultsByRequestNumber = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ivarQueue_pendingResults = v8->_ivarQueue_pendingResults;
    v8->_ivarQueue_pendingResults = v28;

    v30 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v8->__imageCache;
    v8->__imageCache = v30;

  }
  return v8;
}

- (PUFilmstripMediaProvider)init
{
  return -[PUFilmstripMediaProvider initWithAVAsset:videoComposition:](self, "initWithAVAsset:videoComposition:", 0, 0);
}

- (void)_performIvarRead:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_ivarQueue, a3);
}

- (void)_performIvarWrite:(id)a3
{
  dispatch_barrier_sync((dispatch_queue_t)self->_ivarQueue, a3);
}

- (void)setTimeTolerance:(double)a3
{
  AVAssetImageGenerator *imageGenerator;
  Float64 v5;
  AVAssetImageGenerator *v6;
  CMTime v7;
  CMTime v8;

  self->_timeTolerance = a3;
  imageGenerator = self->__imageGenerator;
  v5 = a3 * 0.5;
  CMTimeMakeWithSeconds(&v8, a3 * 0.5, 100);
  -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](imageGenerator, "setRequestedTimeToleranceAfter:", &v8);
  v6 = self->__imageGenerator;
  CMTimeMakeWithSeconds(&v7, v5, 100);
  -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v6, "setRequestedTimeToleranceBefore:", &v7);
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[PUFilmstripMediaProvider _deliverPlaceholderImage](self, "_deliverPlaceholderImage");
    v5 = v6;
  }

}

- (void)setDeliversImagesInOrder:(BOOL)a3
{
  if (self->_deliversImagesInOrder != a3)
  {
    self->_deliversImagesInOrder = a3;
    if (!a3)
      -[PUFilmstripMediaProvider _deliverPendingResults](self, "_deliverPendingResults");
  }
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27[5];
  id location;
  _QWORD v29[5];
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  height = a4.height;
  width = a4.width;
  v33[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  LODWORD(v17) = 0;
  if (v13 && v15)
  {
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      LODWORD(v17) = 0;
    }
    else
    {
      -[NSCache objectForKey:](self->__imageCache, "objectForKey:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v19, 0);
        LODWORD(v17) = 0;
      }
      else
      {
        -[PUFilmstripMediaProvider placeholderImage](self, "placeholderImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = *MEMORY[0x1E0CD1C48];
          v32[0] = CFSTR("PHImageResultIsPlaceholderKey");
          v32[1] = v21;
          v33[0] = MEMORY[0x1E0C9AAB0];
          v33[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v16)[2](v16, v20, v22);

        }
        v17 = (void *)(-[PUFilmstripMediaProvider _requestNumber](self, "_requestNumber") + 1);
        v23 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v29[3] = &unk_1E58A7210;
        v29[4] = self;
        v31 = v17;
        v30 = v16;
        -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v29);
        -[PUFilmstripMediaProvider _setRequestNumber:](self, "_setRequestNumber:", v17);
        objc_initWeak(&location, self);
        v25[0] = v23;
        v25[1] = 3221225472;
        v25[2] = __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
        v25[3] = &unk_1E589F768;
        objc_copyWeak(v27, &location);
        v26 = v13;
        v27[1] = *(id *)&width;
        v27[2] = *(id *)&height;
        v27[3] = (id)a5;
        v27[4] = v17;
        objc_msgSend(v26, "loadSourceTimeWithCompletionHandler:", v25);

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);

      }
    }
  }

  return (int)v17;
}

- (void)_handleSourceTimeLoadedForAsset:(id)a3 time:(double)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 requestNumber:(int64_t)a7
{
  double height;
  double width;
  id v12;
  PUFilmstripMediaProviderResult *v13;
  PUFilmstripMediaProviderResult *v14;
  _QWORD v15[5];
  PUFilmstripMediaProviderResult *v16;
  int64_t v17;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = objc_alloc_init(PUFilmstripMediaProviderResult);
  -[PUFilmstripMediaProviderResult setAsset:](v13, "setAsset:", v12);

  if (a6 == 1)
  {
    if (width <= height)
      width = 100000.0;
    else
      height = 100000.0;
  }
  -[PUFilmstripMediaProviderResult setTargetSize:](v13, "setTargetSize:", width, height);
  -[PUFilmstripMediaProviderResult setRequestNumber:](v13, "setRequestNumber:", a7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PUFilmstripMediaProvider__handleSourceTimeLoadedForAsset_time_targetSize_contentMode_requestNumber___block_invoke;
  v15[3] = &unk_1E58A9DF0;
  v16 = v13;
  v17 = a7;
  v15[4] = self;
  v14 = v13;
  -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v15);
  -[PUFilmstripMediaProvider _generateImageForResult:](self, "_generateImageForResult:", v14);

}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v5;
  _QWORD v6[6];
  int v7;
  _QWORD v8[6];
  int v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__30256;
  v10[4] = __Block_byref_object_dispose__30257;
  v11 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke;
  v8[3] = &unk_1E589F790;
  v8[4] = self;
  v8[5] = v10;
  v9 = a3;
  -[PUFilmstripMediaProvider _performIvarRead:](self, "_performIvarRead:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke_2;
  v6[3] = &unk_1E589F790;
  v6[4] = self;
  v6[5] = v10;
  v7 = a3;
  -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v6);
  -[PUFilmstripMediaProvider _deliverPendingResults](self, "_deliverPendingResults");
  _Block_object_dispose(v10, 8);

}

- (void)cancelAllRequests
{
  _QWORD v3[5];

  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->__imageGenerator, "cancelAllCGImageGeneration");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PUFilmstripMediaProvider_cancelAllRequests__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->__imageGenerator, "cancelAllCGImageGeneration");
  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripMediaProvider;
  -[PUFilmstripMediaProvider dealloc](&v3, sel_dealloc);
}

- (void)_generateImageForResult:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  Float64 v15;
  NSObject *imageGenerationQueue;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  CMTime v23;
  id location;
  CMTime v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke;
  v26[3] = &unk_1E58ABCA8;
  v26[4] = self;
  v6 = v4;
  v27 = v6;
  v7 = (void *)MEMORY[0x1AF42B2C0](-[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v26));
  -[PUFilmstripMediaProvider _imageGenerator](self, "_imageGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  objc_msgSend(v6, "targetSize");
  objc_msgSend(v8, "setMaximumSize:", v11 * v12, v11 * v13);
  memset(&v25, 0, sizeof(v25));
  objc_msgSend(v6, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceTime");
  CMTimeMakeWithSeconds(&v25, v15, 600);

  objc_initWeak(&location, self);
  imageGenerationQueue = self->_imageGenerationQueue;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_2;
  v19[3] = &unk_1E589F7E0;
  v20 = v8;
  v23 = v25;
  v17 = v8;
  objc_copyWeak(&v22, &location);
  v18 = v6;
  v21 = v18;
  dispatch_async(imageGenerationQueue, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v7);

}

- (void)_didGenerateImage:(id)a3 error:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 generatorResult:(int64_t)a7 forResult:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSCache *imageCache;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  int64_t var3;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v13)
  {
    imageCache = self->__imageCache;
    objc_msgSend(v15, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](imageCache, "setObject:forKey:", v13, v18);

  }
  if (a7 == 2)
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD1BE0]);
  }
  else if (!v13 || a7 == 1)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("AVAssetImageGenerator failed to generate an image for the requested time"), *MEMORY[0x1E0CB2D50]);
    if (v14)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUFilmstripMediaProviderErrorDomain"), 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CD1BE8]);

  }
  objc_msgSend(v15, "setImage:", v13);
  objc_msgSend(v15, "setResultInfo:", v16);
  v21 = *(_OWORD *)&a6->var0;
  var3 = a6->var3;
  objc_msgSend(v15, "setActualTime:", &v21);
  objc_msgSend(v15, "setIsReadyForDelivery:", 1);
  px_dispatch_on_main_queue();

}

- (void)_deliverPendingResults
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[PUFilmstripMediaProvider deliversImagesInOrder](self, "deliversImagesInOrder"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__30256;
    v25 = __Block_byref_object_dispose__30257;
    v26 = 0;
    v3 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke;
    v20[3] = &unk_1E58AAE48;
    v20[4] = self;
    v20[5] = &v21;
    -[PUFilmstripMediaProvider _performIvarRead:](self, "_performIvarRead:", v20);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (1)
    {
      objc_msgSend((id)v22[5], "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isReadyForDelivery");

      if (!v6)
        break;
      objc_msgSend((id)v22[5], "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFilmstripMediaProvider _deliverResult:](self, "_deliverResult:", v7);
      objc_msgSend(v4, "addObject:", v7);
      objc_msgSend((id)v22[5], "removeObjectAtIndex:", 0);

    }
    v18[0] = v3;
    v18[1] = 3221225472;
    v18[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_2;
    v18[3] = &unk_1E58ABCA8;
    v18[4] = self;
    v12 = v4;
    v19 = v12;
    -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v18);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__30256;
    v25 = __Block_byref_object_dispose__30257;
    v26 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_3;
    v17[3] = &unk_1E58AAE48;
    v17[4] = self;
    v17[5] = &v21;
    -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v17);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = (id)v22[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          -[PUFilmstripMediaProvider _deliverResult:](self, "_deliverResult:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
      }
      while (v9);
    }

    _Block_object_dispose(&v21, 8);
  }
}

- (void)_deliverResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *(*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "requestNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__108;
  v21 = __Block_byref_object_dispose__109;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__PUFilmstripMediaProvider__deliverResult___block_invoke;
  v14[3] = &unk_1E58AAD18;
  v16 = &v17;
  v14[4] = self;
  v7 = v5;
  v15 = v7;
  -[PUFilmstripMediaProvider _performIvarRead:](self, "_performIvarRead:", v14);
  v8 = v18[5];
  if (v8)
  {
    objc_msgSend(v4, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

  }
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __43__PUFilmstripMediaProvider__deliverResult___block_invoke_2;
  v12[3] = &unk_1E58ABCA8;
  v12[4] = self;
  v11 = v7;
  v13 = v11;
  -[PUFilmstripMediaProvider _performIvarWrite:](self, "_performIvarWrite:", v12);

  _Block_object_dispose(&v17, 8);
}

- (void)_deliverPlaceholderImage
{
  _QWORD v2[6];
  _QWORD v3[5];
  id v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__30256;
  v3[4] = __Block_byref_object_dispose__30257;
  v4 = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke;
  v2[3] = &unk_1E58AAE48;
  v2[4] = self;
  v2[5] = v3;
  -[PUFilmstripMediaProvider _performIvarRead:](self, "_performIvarRead:", v2);
  px_dispatch_on_main_queue();
  _Block_object_dispose(v3, 8);

}

- (AVAsset)asset
{
  return self->_asset;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (double)timeTolerance
{
  return self->_timeTolerance;
}

- (BOOL)deliversImagesInOrder
{
  return self->_deliversImagesInOrder;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (AVAssetImageGenerator)_imageGenerator
{
  return self->__imageGenerator;
}

- (void)_setImageGenerator:(id)a3
{
  objc_storeStrong((id *)&self->__imageGenerator, a3);
}

- (int64_t)_requestNumber
{
  return self->__requestNumber;
}

- (void)_setRequestNumber:(int64_t)a3
{
  self->__requestNumber = a3;
}

- (NSCache)_imageCache
{
  return self->__imageCache;
}

- (void)_setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->__imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageCache, 0);
  objc_storeStrong((id *)&self->__imageGenerator, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_ivarQueue_pendingResults, 0);
  objc_storeStrong((id *)&self->_ivarQueue_completionHandlersByRequestNumber, 0);
  objc_storeStrong((id *)&self->_ivarQueue_resultsByRequestNumber, 0);
  objc_storeStrong((id *)&self->_imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "placeholderImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_3;
  v5[3] = &unk_1E589F808;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __52__PUFilmstripMediaProvider__deliverPlaceholderImage__block_invoke_3(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *MEMORY[0x1E0CD1C48];
  v9[0] = CFSTR("PHImageResultIsPlaceholderKey");
  v9[1] = v5;
  v10[0] = MEMORY[0x1E0C9AAB0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))a3)[2](v7, v4, v8);

}

void __43__PUFilmstripMediaProvider__deliverResult___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__PUFilmstripMediaProvider__deliverResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__PUFilmstripMediaProvider__deliverPendingResults__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isReadyForDelivery == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsInArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __103__PUFilmstripMediaProvider__didGenerateImage_error_requestedTime_actualTime_generatorResult_forResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverPendingResults");
}

uint64_t __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sortUsingSelector:", sel_compare_);
}

void __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_3;
  v5[3] = &unk_1E589F7B8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v4, v5);

  objc_destroyWeak(&v7);
}

void __52__PUFilmstripMediaProvider__generateImageForResult___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, void *a6)
{
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v10 = a6;
  v11 = (void *)MEMORY[0x1AF42B2C0]();
  v12 = 0;
  if (a3 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = *(_QWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 64);
  v15 = *a4;
  v16 = *((_QWORD *)a4 + 2);
  objc_msgSend(WeakRetained, "_didGenerateImage:error:requestedTime:actualTime:generatorResult:forResult:", v12, v10, &v17, &v15, a5, v14);

  objc_autoreleasePoolPop(v11);
}

uint64_t __45__PUFilmstripMediaProvider_cancelAllRequests__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

void __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __47__PUFilmstripMediaProvider_cancelImageRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __102__PUFilmstripMediaProvider__handleSourceTimeLoadedForAsset_time_targetSize_contentMode_requestNumber___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = _Block_copy(v5);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

void __94__PUFilmstripMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  id v7;
  NSObject *WeakRetained;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _handleSourceTimeLoadedForAsset:time:targetSize:contentMode:requestNumber:](WeakRetained, "_handleSourceTimeLoadedForAsset:time:targetSize:contentMode:requestNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    PLUIGetLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1AAB61000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load source time for asset: %@. Error: %@", (uint8_t *)&v10, 0x16u);
    }
  }

}

@end
