@implementation PXCMMPreviewUIImageProvider

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = v14;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v24);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v24, v26);

LABEL_12:
    if (v16)
      goto LABEL_4;
    goto LABEL_13;
  }
  if (v16)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

LABEL_4:
  objc_msgSend(v17, "underlyingAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 31, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("previewAsset.underlyingAsset"), v30, v31);

    }
    -[PXCMMPreviewUIImageProvider _underlyingAssetMediaProviderForUnderlyingAsset:](self, "_underlyingAssetMediaProviderForUnderlyingAsset:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __99__PXCMMPreviewUIImageProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v32[3] = &unk_1E5136A08;
    v33 = v17;
    v34 = v16;
    v20 = objc_msgSend(v19, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v18, a5, v15, v32, width, height);

  }
  else
  {
    _ReturnPreviewCGImage(v17, v16);
    v20 = 0;
  }

  return v20;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  -[PXMediaProvider cancelImageRequest:](self->_underlyingAssetMediaProvider, "cancelImageRequest:", a3);
}

- (void)startCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v14 = a6;
  -[PXCMMPreviewUIImageProvider _underlyingAssetsFromPreviewAssets:](self, "_underlyingAssetsFromPreviewAssets:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMPreviewUIImageProvider _underlyingAssetMediaProviderForUnderlyingAsset:](self, "_underlyingAssetMediaProviderForUnderlyingAsset:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "startCachingImagesForAssets:targetSize:contentMode:options:", v11, a5, v14, width, height);

  }
}

- (void)stopCachingImagesForAssets:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v11 = a6;
  if (self->_underlyingAssetMediaProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXCMMPreviewUIImageProvider _underlyingAssetsFromPreviewAssets:](self, "_underlyingAssetsFromPreviewAssets:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMediaProvider startCachingImagesForAssets:targetSize:contentMode:options:](self->_underlyingAssetMediaProvider, "startCachingImagesForAssets:targetSize:contentMode:options:", v12, a5, v11, width, height);

  }
}

- (void)stopCachingImagesForAllAssets
{
  if (self->_underlyingAssetMediaProvider)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PXMediaProvider stopCachingImagesForAllAssets](self->_underlyingAssetMediaProvider, "stopCachingImagesForAllAssets");
  }
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = v14;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v24);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v24, v26);

LABEL_12:
    if (v16)
      goto LABEL_4;
    goto LABEL_13;
  }
  if (v16)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

LABEL_4:
  objc_msgSend(v17, "underlyingAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 89, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("previewAsset.underlyingAsset"), v30, v31);

    }
    -[PXCMMPreviewUIImageProvider _underlyingAssetMediaProviderForUnderlyingAsset:](self, "_underlyingAssetMediaProviderForUnderlyingAsset:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __97__PXCMMPreviewUIImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v32[3] = &unk_1E5136A08;
    v33 = v17;
    v34 = v16;
    v20 = objc_msgSend(v19, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v18, a5, v15, v32, width, height);

  }
  else
  {
    _ReturnPreviewImage(v17, v16);
    v20 = 0;
  }

  return v20;
}

- (id)_underlyingAssetMediaProviderForUnderlyingAsset:(id)a3
{
  id v5;
  PXMediaProvider *underlyingAssetMediaProvider;
  void *v7;
  PXMediaProvider *v8;
  PXMediaProvider *v9;
  PXMediaProvider *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewUIImageProvider.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingAsset"));

  }
  underlyingAssetMediaProvider = self->_underlyingAssetMediaProvider;
  if (!underlyingAssetMediaProvider)
  {
    objc_msgSend(off_1E50B3348, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageProviderForAsset:", v5);
    v8 = (PXMediaProvider *)objc_claimAutoreleasedReturnValue();
    v9 = self->_underlyingAssetMediaProvider;
    self->_underlyingAssetMediaProvider = v8;

    underlyingAssetMediaProvider = self->_underlyingAssetMediaProvider;
  }
  v10 = underlyingAssetMediaProvider;

  return v10;
}

- (id)_underlyingAssetsFromPreviewAssets:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PXCMMPreviewUIImageProvider__underlyingAssetsFromPreviewAssets___block_invoke;
  v12[3] = &unk_1E5136A30;
  v14 = a2;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAssetMediaProvider, 0);
}

void __66__PXCMMPreviewUIImageProvider__underlyingAssetsFromPreviewAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXCMMPreviewUIImageProvider.m"), 160, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v8, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("PXCMMPreviewUIImageProvider.m"), 160, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v8);
  }

LABEL_3:
  objc_msgSend(v19, "underlyingAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXCMMPreviewUIImageProvider.m"), 161, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("previewAsset.underlyingAsset"), v17, v18);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void __97__PXCMMPreviewUIImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  if (a2
    && (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v6,
        !v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    _ReturnPreviewImage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  }

}

void __99__PXCMMPreviewUIImageProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a4;
  v9 = v6;
  if (a2
    && (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        !v8))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _ReturnPreviewCGImage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  }

}

@end
