@implementation UGCARPPhotoCarouselViewModel

- (UGCARPPhotoCarouselViewModel)initWithImageManager:(id)a3
{
  id v5;
  UGCARPPhotoCarouselViewModel *v6;
  UGCARPPhotoCarouselViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCARPPhotoCarouselViewModel;
  v6 = -[UGCARPPhotoCarouselViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageManager, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCARPPhotoCarouselViewModel identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%d"), self->_enabled));

  return (NSString *)v4;
}

- (NSURL)url
{
  return -[UGCARPPhotoCarouselViewModel imageURL](self, "imageURL");
}

- (double)timeoutInterval
{
  return 30.0;
}

+ (double)preferredCellHeight
{
  return 220.0;
}

- (CGSize)imageSizeForCell
{
  UGCPhotoWithMetadata *photoWithMetadata;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  PHAsset *asset;
  double v14;
  double v15;
  id v16;
  double v17;
  int v18;
  double v19;
  CGSize result;

  photoWithMetadata = self->_photoWithMetadata;
  if (photoWithMetadata)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata image](photoWithMetadata, "image"));
    objc_msgSend(v4, "size");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata image](self->_photoWithMetadata, "image"));
    objc_msgSend(v7, "size");
    v9 = v6 / v8;

    v10 = v9 * 220.0;
    if (v9 * 220.0 == 0.0)
    {
      v11 = sub_10021DFE8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v18 = 134217984;
        v19 = v9;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Image width of 0 where aspect ratio is %f", (uint8_t *)&v18, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    asset = self->_asset;
    if (!asset)
    {
      v10 = 220.0;
      goto LABEL_12;
    }
    -[PHAsset aspectRatio](asset, "aspectRatio");
    v15 = v14;
    v10 = v14 * 220.0;
    if (v10 == 0.0)
    {
      v16 = sub_10021DFE8();
      v12 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v18 = 134217984;
        v19 = v15;
        goto LABEL_9;
      }
LABEL_10:

      v10 = 220.0;
    }
  }
LABEL_12:
  v17 = 220.0;
  result.height = v17;
  result.width = v10;
  return result;
}

- (void)loadOriginalImageWithDisplayScale:(double)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void (*v12)(void);
  PHAsset *asset;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10021E174;
  v18[3] = &unk_1011ACB58;
  v9 = a5;
  v19 = v9;
  v10 = objc_retainBlock(v18);
  v11 = v10;
  if (self->_photoWithMetadata)
  {
    v12 = (void (*)(void))v10[2];
  }
  else
  {
    asset = self->_asset;
    if (asset)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10021E214;
      v16[3] = &unk_1011ACBA8;
      v17 = v8;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10021E304;
      v14[3] = &unk_1011ACBD0;
      v15 = v11;
      -[UGCARPPhotoCarouselViewModel _loadPhotoFromAsset:shouldDegrade:scale:progressHandler:completion:](self, "_loadPhotoFromAsset:shouldDegrade:scale:progressHandler:completion:", asset, 0, v16, v14, a3);

      goto LABEL_6;
    }
    v12 = (void (*)(void))v10[2];
  }
  v12();
LABEL_6:

}

- (void)cancelLoadImageWithRequestID:(int)a3
{
  -[PHCachingImageManager cancelImageRequest:](self->_imageManager, "cancelImageRequest:", *(_QWORD *)&a3);
}

- (void)loadThumbnailImageWithDisplayScale:(double)a3 completion:(id)a4
{
  id v6;
  _QWORD *v7;
  UGCPhotoWithMetadata *photoWithMetadata;
  void *v9;
  PHAsset *asset;
  _QWORD v11[5];
  _QWORD *v12;
  int64x2_t v13;
  double v14;
  _QWORD v15[4];
  id v16;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10021E468;
  v15[3] = &unk_1011ACBF8;
  v6 = a4;
  v16 = v6;
  v7 = objc_retainBlock(v15);
  photoWithMetadata = self->_photoWithMetadata;
  if (photoWithMetadata)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata image](photoWithMetadata, "image"));
    -[UGCARPPhotoCarouselViewModel _prepareImageThumbnailWithOriginalImage:targetSize:scale:completion:](self, "_prepareImageThumbnailWithOriginalImage:targetSize:scale:completion:", v9, v7, 220.0, 220.0, a3);

  }
  else
  {
    asset = self->_asset;
    if (asset)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10021E508;
      v11[3] = &unk_1011ACC20;
      v11[4] = self;
      v13 = vdupq_n_s64(0x406B800000000000uLL);
      v14 = a3;
      v12 = v7;
      -[UGCARPPhotoCarouselViewModel _loadPhotoFromAsset:shouldDegrade:scale:progressHandler:completion:](self, "_loadPhotoFromAsset:shouldDegrade:scale:progressHandler:completion:", asset, 1, 0, v11, a3);

    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v7[2])(v7, 0);
    }
  }

}

- (int)_loadPhotoFromAsset:(id)a3 shouldDegrade:(BOOL)a4 scale:(double)a5 progressHandler:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  PHImageRequestOptions *v15;
  double v16;
  double v17;
  PHCachingImageManager *imageManager;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = objc_opt_new(PHImageRequestOptions);
  -[PHImageRequestOptions setNetworkAccessAllowed:](v15, "setNetworkAccessAllowed:", 1);
  if (v10)
  {
    -[PHImageRequestOptions setDeliveryMode:](v15, "setDeliveryMode:", 0);
    v16 = a5 * 220.0;
    v17 = v16;
  }
  else
  {
    -[PHImageRequestOptions setDeliveryMode:](v15, "setDeliveryMode:", 1);
    v16 = (double)(unint64_t)objc_msgSend(v12, "pixelHeight");
    v17 = (double)(unint64_t)objc_msgSend(v12, "pixelWidth");
  }
  -[PHImageRequestOptions setProgressHandler:](v15, "setProgressHandler:", v13);
  objc_initWeak(&location, self);
  imageManager = self->_imageManager;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10021E704;
  v22[3] = &unk_1011ACC48;
  objc_copyWeak(&v25, &location);
  v19 = v12;
  v23 = v19;
  v20 = v14;
  v24 = v20;
  LODWORD(imageManager) = -[PHCachingImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](imageManager, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v19, 1, v15, v22, v16, v17);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return (int)imageManager;
}

- (void)_prepareImageThumbnailWithOriginalImage:(id)a3 targetSize:(CGSize)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021E970;
  v12[3] = &unk_1011ACC70;
  v13 = a3;
  v14 = a6;
  v10 = v13;
  v11 = v14;
  +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v10, v12, width, height, a5);

}

- (UGCPhotoWithMetadata)photoWithMetadata
{
  return self->_photoWithMetadata;
}

- (void)setPhotoWithMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_photoWithMetadata, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (BOOL)isSuggestedPhoto
{
  return self->_isSuggestedPhoto;
}

- (void)setIsSuggestedPhoto:(BOOL)a3
{
  self->_isSuggestedPhoto = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_photoWithMetadata, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
}

@end
