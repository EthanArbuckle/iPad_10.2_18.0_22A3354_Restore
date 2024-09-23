@implementation PLVideoEditSource

- (PLVideoEditSource)initWithVideoURL:(id)a3
{
  id v5;
  void *v6;
  PLVideoEditSource *v7;
  PLVideoEditSource *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(getPIPhotoEditHelperClass_72665(), "videoSourceWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PLVideoEditSource;
  v7 = -[PLEditSource initWithResolvedSource:mediaType:](&v10, sel_initWithResolvedSource_mediaType_, v6, 2);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_videoURL, a3);

  return v8;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
}

@end
