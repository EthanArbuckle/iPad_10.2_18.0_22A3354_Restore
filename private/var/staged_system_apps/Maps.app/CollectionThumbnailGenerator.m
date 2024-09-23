@implementation CollectionThumbnailGenerator

- (CollectionThumbnailGenerator)initWithPlaceCollection:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  CollectionThumbnailGenerator *v9;
  CollectionThumbnailGenerator *v10;
  uint64_t v11;
  UIImage *placeholderImage;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CollectionThumbnailGenerator;
  v9 = -[CollectionThumbnailGenerator init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v10->_size.width = width;
    v10->_size.height = height;
    v10->_hasFinishedLoading = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NoImageGuideIcon")));
    placeholderImage = v10->_placeholderImage;
    v10->_placeholderImage = (UIImage *)v11;

  }
  return v10;
}

- (void)loadThumbnailIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!-[CollectionThumbnailGenerator hasFinishedLoading](self, "hasFinishedLoading"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection photos](self->_collection, "photos"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geo_firstPhotoOfAtLeastSize:", self->_size.width, self->_size.height));

    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100AEB810;
      v10[3] = &unk_1011E21A8;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v7, "loadAppImageAtURL:completionHandler:", v8, v10);

    }
    else
    {
      -[CollectionThumbnailGenerator setHasFinishedLoading:](self, "setHasFinishedLoading:", 1);
      if (v4)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionThumbnailGenerator thumbnailImage](self, "thumbnailImage"));
        (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v9, 0);

      }
    }
    goto LABEL_8;
  }
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionThumbnailGenerator thumbnailImage](self, "thumbnailImage"));
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v5, 0);
LABEL_8:

  }
}

- (id)thumbnailImage
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionThumbnailGenerator currentImage](self, "currentImage"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionThumbnailGenerator placeholderImage](self, "placeholderImage"));
  return v3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)hasFinishedLoading
{
  return self->_hasFinishedLoading;
}

- (void)setHasFinishedLoading:(BOOL)a3
{
  self->_hasFinishedLoading = a3;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
