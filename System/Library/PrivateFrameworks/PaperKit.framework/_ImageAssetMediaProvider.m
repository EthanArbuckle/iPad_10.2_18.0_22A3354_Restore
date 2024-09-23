@implementation _ImageAssetMediaProvider

- (_ImageAssetMediaProvider)initWithData:(id)a3
{
  id v4;
  _ImageAssetMediaProvider *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ImageAssetMediaProvider;
  v5 = -[_ImageAssetMediaProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v9;
  void *v10;

  v9 = a7;
  objc_msgSend(a3, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a7 + 2))(v9, v10, MEMORY[0x1E0C9AA70]);

  return 0;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "image");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "CGImage");
  objc_msgSend(v10, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "imageOrientation");
  (*((void (**)(id, uint64_t, uint64_t, _QWORD))a7 + 2))(v9, v12, v14, MEMORY[0x1E0C9AA70]);

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
