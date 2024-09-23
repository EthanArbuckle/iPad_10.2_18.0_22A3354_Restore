@implementation PXStoryImageAssetResourcePreloadingOperation

- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 targetSize:(CGSize)a4 mediaProvider:(id)a5 isInline:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  PXStoryImageAssetResourcePreloadingOperation *result;
  objc_super v10;

  height = a4.height;
  width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  result = -[PXStoryDisplayAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:](&v10, sel_initWithDisplayAssetResource_mediaProvider_, a3, a5);
  if (result)
  {
    result->_targetSize.width = width;
    result->_targetSize.height = height;
    result->_isInline = a6;
  }
  return result;
}

- (PXStoryImageAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryImageAssetResourcePreloadingOperation.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryImageAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:]");

  abort();
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXStoryDisplayAssetResourcePreloadingOperation displayAsset](self, "displayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryImageAssetResourcePreloadingOperation targetSize](self, "targetSize");
  v7 = v6;
  -[PXStoryImageAssetResourcePreloadingOperation targetSize](self, "targetSize");
  v9 = v8;
  -[PXStoryImageAssetResourcePreloadingOperation targetSize](self, "targetSize");
  PXSizeGetArea();
  v11 = v10 / 1000000.0;
  v12 = -[PXStoryImageAssetResourcePreloadingOperation imageRequestID](self, "imageRequestID");
  -[PXStoryImageAssetResourcePreloadingOperation fractionComplete](self, "fractionComplete");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Image %@, size %.0f x %.0f (%.1fMP), requestID %ld – %.0f%%"), v5, v7, v9, *(_QWORD *)&v11, v12, v13 * 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)px_start
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  -[PXStoryDisplayAssetResourcePreloadingOperation px_start](&v24, sel_px_start);
  v3 = objc_alloc_init((Class)off_1E50B3068);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v3, "setAllowSecondaryDegradedImage:", 0);
  objc_msgSend(v3, "setLoadingMode:", 0x10000);
  objc_msgSend(v3, "setDeliveryMode:", 1);
  if (-[PXStoryImageAssetResourcePreloadingOperation isInline](self, "isInline"))
    v4 = 12;
  else
    v4 = 5;
  objc_msgSend(v3, "setDownloadIntent:", v4);
  objc_msgSend((id)objc_opt_class(), "_resultHandlingQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultHandlerQueue:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke;
  aBlock[3] = &unk_1E5145AC0;
  objc_copyWeak(&v22, &location);
  v7 = _Block_copy(aBlock);
  -[PXStoryDisplayAssetResourcePreloadingOperation progressHandler](self, "progressHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_2;
    v18[3] = &unk_1E5145AE8;
    objc_copyWeak(&v20, &location);
    v19 = v8;
    v9 = _Block_copy(v18);

    objc_destroyWeak(&v20);
    v7 = v9;
  }
  objc_msgSend(v3, "setProgressHandler:", v7);
  -[PXStoryDisplayAssetResourcePreloadingOperation mediaProvider](self, "mediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDisplayAssetResourcePreloadingOperation displayAsset](self, "displayAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryImageAssetResourcePreloadingOperation targetSize](self, "targetSize");
  v13 = v12;
  v15 = v14;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_3;
  v16[3] = &unk_1E5145B10;
  objc_copyWeak(&v17, &location);
  -[PXStoryImageAssetResourcePreloadingOperation setImageRequestID:](self, "setImageRequestID:", objc_msgSend(v10, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, v3, v16, v13, v15));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_handleImageLoadingResultWithImage:(CGImage *)a3 info:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;

  v6 = *MEMORY[0x1E0CD1C18];
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)a3 | v8;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v18 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v14 = (void *)v18;
    if (v18)
      v16 = 1;
    else
      v16 = v13;
    if (v16 != 1)
      goto LABEL_14;
    goto LABEL_10;
  }
  v14 = (void *)v18;
  v15 = v11 ^ 1;
  if (v18)
    v15 = 1;
  if (((v15 | v13) & 1) != 0)
  {
LABEL_10:
    v17 = -[PXAsyncOperation isExecuting](self, "isExecuting");
    v14 = (void *)v18;
    if (v17)
    {
      if ((v13 & 1) == 0)
        -[PXStoryDisplayAssetResourcePreloadingOperation setError:](self, "setError:", v18);
      -[PXStoryDisplayAssetResourcePreloadingOperation px_finishIfPossible](self, "px_finishIfPossible");
      v14 = (void *)v18;
    }
  }
LABEL_14:

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryImageAssetResourcePreloadingOperation;
  -[PXAsyncOperation cancel](&v4, sel_cancel);
  -[PXStoryDisplayAssetResourcePreloadingOperation mediaProvider](self, "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PXStoryImageAssetResourcePreloadingOperation imageRequestID](self, "imageRequestID"));

}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (OS_dispatch_group)loadingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLoadingGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (void)setImageRequestID:(int64_t)a3
{
  self->_imageRequestID = a3;
}

- (double)fractionComplete
{
  return self->_fractionComplete;
}

- (void)setFractionComplete:(double)a3
{
  self->_fractionComplete = a3;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroup, 0);
}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFractionComplete:", a2);

}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id WeakRetained;
  void *v6;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFractionComplete:", a3);

  v6 = v8;
  if (a3 != 0.0 || v8 != 0)
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
    v6 = v8;
  }

}

void __56__PXStoryImageAssetResourcePreloadingOperation_px_start__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleImageLoadingResultWithImage:info:", a2, v6);

}

+ (id)_resultHandlingQueue
{
  if (_resultHandlingQueue_onceToken != -1)
    dispatch_once(&_resultHandlingQueue_onceToken, &__block_literal_global_287603);
  return (id)_resultHandlingQueue_resultHandlingQueue;
}

void __68__PXStoryImageAssetResourcePreloadingOperation__resultHandlingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PXStoryImageAssetResourcePreloadingOperation.resultHandlingQueue", v2);
  v1 = (void *)_resultHandlingQueue_resultHandlingQueue;
  _resultHandlingQueue_resultHandlingQueue = (uint64_t)v0;

}

@end
