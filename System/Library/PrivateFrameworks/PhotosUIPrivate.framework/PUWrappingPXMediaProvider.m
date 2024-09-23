@implementation PUWrappingPXMediaProvider

- (PUWrappingPXMediaProvider)initWithWrappedMediaProvider:(id)a3
{
  id v5;
  PUWrappingPXMediaProvider *v6;
  PUWrappingPXMediaProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUWrappingPXMediaProvider;
  v6 = -[PUWrappingPXMediaProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedMediaProvider, a3);

  return v7;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoKitRequestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__PUWrappingPXMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E58AA608;
  v21 = v13;
  v18 = v13;
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v20, width, height);

  return (int)a5;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PUWrappingPXMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E589F4D8;
  v16 = v8;
  v13 = v8;
  LODWORD(v9) = objc_msgSend(v11, "requestImageDataForAsset:options:resultHandler:", v10, v12, v15);

  return (int)v9;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PUWrappingPXMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E58AA330;
  v16 = v8;
  v13 = v8;
  LODWORD(v9) = objc_msgSend(v11, "requestImageURLForAsset:options:resultHandler:", v10, v12, v15);

  return (int)v9;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PUWrappingPXMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v15[3] = &unk_1E589F500;
  v16 = v8;
  v13 = v8;
  LODWORD(v9) = objc_msgSend(v11, "requestPlayerItemForVideo:options:resultHandler:", v10, v12, v15);

  return (int)v9;
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWrappingPXMediaProvider.m"), 56, CFSTR("%s is not implemented"), "-[PUWrappingPXMediaProvider requestURLForVideo:options:resultHandler:]");

  abort();
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWrappingPXMediaProvider.m"), 60, CFSTR("%s is not implemented"), "-[PUWrappingPXMediaProvider requestStreamForVideo:options:resultHandler:]");

  abort();
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__PUWrappingPXMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E58AA380;
  v16 = v8;
  v13 = v8;
  LODWORD(v9) = objc_msgSend(v11, "requestAnimatedImageForAsset:options:resultHandler:", v10, v12, v15);

  return (int)v9;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoKitRequestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__PUWrappingPXMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v20[3] = &unk_1E58AA358;
  v21 = v13;
  v18 = v13;
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v20, width, height);

  return (int)a5;
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4;

  -[PUWrappingPXMediaProvider wrappedMediaProvider](self, "wrappedMediaProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", a3);

}

- (PUMediaProvider)wrappedMediaProvider
{
  return self->_wrappedMediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedMediaProvider, 0);
}

uint64_t __99__PUWrappingPXMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PUWrappingPXMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PUWrappingPXMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PUWrappingPXMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PUWrappingPXMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__PUWrappingPXMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_retainAutorelease(a2);
  v9 = a3;
  v6 = v5;
  v7 = objc_msgSend(v6, "CGImage");
  v8 = objc_msgSend(v6, "imageOrientation");

  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v7, v8, v9);
}

@end
