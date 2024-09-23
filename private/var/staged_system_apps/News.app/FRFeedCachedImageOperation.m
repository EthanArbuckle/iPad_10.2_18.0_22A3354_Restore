@implementation FRFeedCachedImageOperation

- (FRFeedCachedImageOperation)initWithOptions:(id)a3
{
  id v4;
  FRFeedCachedImageOperation *v5;
  FRFeedImageGenerationOptions *v6;
  FRFeedImageGenerationOptions *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRFeedCachedImageOperation;
  v5 = -[FRFeedCachedImageOperation init](&v9, "init");
  if (v5)
  {
    v6 = (FRFeedImageGenerationOptions *)objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = v6;

  }
  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  if ((-[FRFeedCachedImageOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedCachedImageOperation options](self, "options"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedImagePath"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedCachedImageOperation options](self, "options"));
      objc_msgSend(v8, "scale");
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage fr_immediatelyLoadedImageWithData:scale:](UIImage, "fr_immediatelyLoadedImageWithData:scale:", v7));

    }
    else
    {
      v9 = 0;
    }
    -[FRFeedCachedImageOperation setImage:](self, "setImage:", v9);

  }
}

- (FRFeedImageGenerationOptions)options
{
  return self->_options;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
