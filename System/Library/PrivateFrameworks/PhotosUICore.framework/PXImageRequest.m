@implementation PXImageRequest

- (PXImageRequest)initWithMediaProvider:(id)a3 asset:(id)a4 targetSize:(CGSize)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  PXImageRequest *v15;
  PXImageRequest *v16;
  objc_super v18;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXImageRequest;
  v15 = -[PXImageRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaProvider, a3);
    objc_storeStrong((id *)&v16->_asset, a4);
    v16->_targetSize.width = width;
    v16->_targetSize.height = height;
    objc_storeStrong((id *)&v16->_options, a6);
  }

  return v16;
}

- (void)cancel
{
  int64_t v3;
  int64_t v4;
  void *v5;

  v3 = -[PXImageRequest requestID](self, "requestID");
  if (v3)
  {
    v4 = v3;
    -[PXImageRequest mediaProvider](self, "mediaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelImageRequest:", v4);

  }
  self->_canceled = 1;
}

- (void)performWithResultHandler:(id)a3
{
  id v4;
  PXUIImageProvider *mediaProvider;
  PXDisplayAsset *asset;
  PXImageRequestOptions *options;
  double width;
  double height;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  mediaProvider = self->_mediaProvider;
  asset = self->_asset;
  options = self->_options;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__PXImageRequest_performWithResultHandler___block_invoke;
  v11[3] = &unk_1E51426A0;
  v11[4] = self;
  v12 = v4;
  width = self->_targetSize.width;
  height = self->_targetSize.height;
  v10 = v4;
  self->_requestID = -[PXUIImageProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](mediaProvider, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", asset, 1, options, v11, width, height);

}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGSize v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)PXImageRequest;
  -[PXImageRequest description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXImageRequest requestID](self, "requestID");
  -[PXImageRequest asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequest targetSize](self, "targetSize");
  NSStringFromCGSize(v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequest image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXImageRequest gotFullQualityImage](self, "gotFullQualityImage");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v11 = v10;
  -[PXImageRequest error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ requestID:%ld asset:%p targetSize:%@ image:%@ gotFullQuality:%@ error:%@>"), v4, v5, v6, v7, v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
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

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(int64_t)a3
{
  self->_requestID = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  self->_image = (UIImage *)a3;
}

- (BOOL)gotFullQualityImage
{
  return self->_gotFullQualityImage;
}

- (void)setGotFullQualityImage:(BOOL)a3
{
  self->_gotFullQualityImage = a3;
}

- (BOOL)resultIsInCloud
{
  return self->_resultIsInCloud;
}

- (void)setResultIsInCloud:(BOOL)a3
{
  self->_resultIsInCloud = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

void __43__PXImageRequest_performWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8440);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGotFullQualityImage:", objc_msgSend(v8, "BOOLValue") ^ 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8448);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultIsInCloud:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8430);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v11);
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%@ recieved error:%@", (uint8_t *)&v14, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
