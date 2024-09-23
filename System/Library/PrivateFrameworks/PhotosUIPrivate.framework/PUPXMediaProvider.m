@implementation PUPXMediaProvider

- (PUPXMediaProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXMediaProvider.m"), 22, CFSTR("%s is not available as initializer"), "-[PUPXMediaProvider init]");

  abort();
}

- (PUPXMediaProvider)initWithUnderlyingMediaProvider:(id)a3
{
  id v5;
  PUPXMediaProvider *v6;
  PUPXMediaProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXMediaProvider;
  v6 = -[PUPXMediaProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingMediaProvider, a3);

  return v7;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestImageDataForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestImageURLForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestPlayerItemForVideo:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestAnimatedImageForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (void)cancelImageRequest:(int)a3
{
  id v4;

  -[PUPXMediaProvider underlyingMediaProvider](self, "underlyingMediaProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", a3);

}

- (PXUIMediaProvider)underlyingMediaProvider
{
  return self->_underlyingMediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMediaProvider, 0);
}

@end
