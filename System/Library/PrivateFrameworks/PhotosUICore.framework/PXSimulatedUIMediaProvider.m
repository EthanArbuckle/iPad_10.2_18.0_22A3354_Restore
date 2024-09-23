@implementation PXSimulatedUIMediaProvider

- (PXSimulatedUIMediaProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSimulatedUIMediaProvider.m"), 63, CFSTR("%s is not available as initializer"), "-[PXSimulatedUIMediaProvider init]");

  abort();
}

- (PXSimulatedUIMediaProvider)initWithMediaProvider:(id)a3
{
  id v5;
  PXSimulatedUIMediaProvider *v6;
  PXSimulatedUIMediaProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSimulatedUIMediaProvider;
  v6 = -[PXSimulatedUIMediaProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaProvider, a3);

  return v7;
}

- (id)_simulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  return +[_PXSimulatedMediaRequest defaultSimulatedMediaRequestWithOriginalOptions:simulatedResultHandler:](_PXSimulatedMediaRequest, "defaultSimulatedMediaRequestWithOriginalOptions:simulatedResultHandler:", a3, a4);
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  -[PXSimulatedUIMediaProvider _simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:](self, "_simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:", a6, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSimulatedUIMediaProvider mediaProvider](self, "mediaProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "simulatedOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__PXSimulatedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E513F148;
  v21 = v14;
  v17 = v14;
  v18 = objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v16, v20, width, height);

  return v18;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  -[PXSimulatedUIMediaProvider _simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:](self, "_simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSimulatedUIMediaProvider mediaProvider](self, "mediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simulatedOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PXSimulatedUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v15[3] = &unk_1E513C4A8;
  v16 = v9;
  v12 = v9;
  v13 = objc_msgSend(v10, "requestPlayerItemForVideo:options:resultHandler:", v8, v11, v15);

  return v13;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  -[PXSimulatedUIMediaProvider _simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:](self, "_simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:", a6, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSimulatedUIMediaProvider mediaProvider](self, "mediaProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "simulatedOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__PXSimulatedUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E513C4D0;
  v21 = v14;
  v17 = v14;
  v18 = objc_msgSend(v15, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v16, v20, width, height);

  return v18;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  -[PXSimulatedUIMediaProvider _simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:](self, "_simulatedMediaRequestWithOriginalOptions:simulatedResultHandler:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSimulatedUIMediaProvider mediaProvider](self, "mediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simulatedOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PXSimulatedUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E513C4F8;
  v16 = v9;
  v12 = v9;
  v13 = objc_msgSend(v10, "requestAnimatedImageForAsset:options:resultHandler:", v8, v11, v15);

  return v13;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

void __81__PXSimulatedUIMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v12 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSimulatedUIMediaProvider requestAnimatedImageForAsset:options:resultHandler:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXSimulatedUIMediaProvider.m"), 113, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("result"), v10, v11);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleOriginalResult:info:", v12, v6);

}

void __100__PXSimulatedUIMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v12 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSimulatedUIMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXSimulatedUIMediaProvider.m"), 104, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("result"), v10, v11);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleOriginalResult:info:", v12, v6);

}

uint64_t __78__PXSimulatedUIMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOriginalResult:info:", a2, a3);
}

uint64_t __96__PXSimulatedUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOriginalResult:info:", a2, a3);
}

+ (id)defaultMediaProviderWithMediaProvider:(id)a3
{
  id v3;
  void *v4;
  PXSimulatedUIMediaProvider *v5;
  PXSimulatedUIMediaProvider *v6;

  v3 = a3;
  +[PXMediaProviderSettings sharedInstance](PXMediaProviderSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "wantsSimulation") & 1) != 0)
    v5 = -[PXSimulatedUIMediaProvider initWithMediaProvider:]([PXSimulatedUIMediaProvider alloc], "initWithMediaProvider:", v3);
  else
    v5 = (PXSimulatedUIMediaProvider *)v3;
  v6 = v5;

  return v6;
}

@end
