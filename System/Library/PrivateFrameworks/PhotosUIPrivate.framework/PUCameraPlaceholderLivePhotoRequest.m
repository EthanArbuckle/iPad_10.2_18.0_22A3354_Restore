@implementation PUCameraPlaceholderLivePhotoRequest

- (PUCameraPlaceholderLivePhotoRequest)initWithAsset:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  PUCameraPlaceholderLivePhotoRequest *v9;
  PUCameraPlaceholderLivePhotoRequest *v10;
  uint64_t v11;
  id resultHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUCameraPlaceholderLivePhotoRequest;
  v9 = -[PUCameraPlaceholderLivePhotoRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v11 = objc_msgSend(v8, "copy");
    resultHandler = v10->_resultHandler;
    v10->_resultHandler = (id)v11;

  }
  return v10;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSValue)stillDisplayTime
{
  return self->_stillDisplayTime;
}

- (void)setStillDisplayTime:(id)a3
{
  objc_storeStrong((id *)&self->_stillDisplayTime, a3);
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void)setFilterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)imageRequestFinished
{
  return self->_imageRequestFinished;
}

- (void)setImageRequestFinished:(BOOL)a3
{
  self->_imageRequestFinished = a3;
}

- (BOOL)videoRequestFinished
{
  return self->_videoRequestFinished;
}

- (void)setVideoRequestFinished:(BOOL)a3
{
  self->_videoRequestFinished = a3;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_stillDisplayTime, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
