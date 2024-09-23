@implementation MTArtworkView

- (MTArtworkView)initWithFrame:(CGRect)a3
{
  MTArtworkView *v3;
  MTArtworkView *v4;
  uint64_t v5;
  PUIObjCArtworkProvider *imageProvider;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTArtworkView;
  v3 = -[MTArtworkView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    objc_storeStrong((id *)&v3->_artworkKey, kMTLibraryDefaultImageKey);
    v5 = objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider uiShared](PUIObjCArtworkProvider, "uiShared"));
    imageProvider = v4->_imageProvider;
    v4->_imageProvider = (PUIObjCArtworkProvider *)v5;

    -[MTArtworkView setContentMode:](v4, "setContentMode:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTArtworkView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkView layer](v4, "layer"));
    objc_msgSend(v11, "setBorderWidth:", 1.0 / v10);

    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor artworkBorderColor](UIColor, "artworkBorderColor")));
    v13 = objc_msgSend(v12, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkView layer](v4, "layer"));
    objc_msgSend(v14, "setBorderColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkView layer](v4, "layer"));
    objc_msgSend(v15, "setCornerCurve:", kCACornerCurveContinuous);

    -[MTArtworkView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTArtworkView;
  -[MTArtworkView dealloc](&v4, "dealloc");
}

+ (double)cornerRadiusForSize:(CGSize)a3
{
  double v3;
  double result;
  BOOL v5;

  v3 = floor(a3.width);
  result = 0.0;
  if (v3 >= 10.0)
  {
    result = 3.0;
    if (v3 > 39.0)
    {
      if (v3 < 40.0 || (result = 4.0, v3 > 99.0))
      {
        v5 = v3 > 279.0 || v3 < 100.0;
        result = 8.0;
        if (!v5)
          return 6.0;
      }
    }
  }
  return result;
}

- (void)setArtworkKey:(id)a3
{
  NSString *v5;
  NSString *artworkKey;
  unsigned __int8 v7;
  NSString *v8;

  v5 = (NSString *)a3;
  artworkKey = self->_artworkKey;
  if (artworkKey != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](artworkKey, "isEqualToString:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_artworkKey, a3);
      -[MTArtworkView _reloadArtwork](self, "_reloadArtwork");
      v5 = v8;
    }
  }

}

- (NSString)artworkKey
{
  if (self->_artworkKey)
    return self->_artworkKey;
  else
    return (NSString *)kMTLibraryDefaultImageKey;
}

- (BOOL)isPlaceholder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTArtworkView artworkKey](self, "artworkKey"));
  v3 = objc_msgSend(v2, "isEqualToString:", kMTLibraryDefaultImageKey);

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  double v3;

  self->_enabled = a3;
  v3 = 0.400000006;
  if (a3)
    v3 = 1.0;
  -[MTArtworkView setAlpha:](self, "setAlpha:", v3);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTArtworkView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MTArtworkView;
  -[MTArtworkView setFrame:](&v15, "setFrame:", x, y, width, height);
  -[MTArtworkView frame](self, "frame");
  if (v9 != v13 || v11 != v12)
    -[MTArtworkView _artworkSizeDidChange](self, "_artworkSizeDidChange");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTArtworkView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MTArtworkView;
  -[MTArtworkView setBounds:](&v15, "setBounds:", x, y, width, height);
  -[MTArtworkView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[MTArtworkView _artworkSizeDidChange](self, "_artworkSizeDidChange");
}

- (void)_artworkSizeDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[MTArtworkView _reloadArtwork](self, "_reloadArtwork");
  v3 = (void *)objc_opt_class(self);
  -[MTArtworkView bounds](self, "bounds");
  objc_msgSend(v3, "cornerRadiusForSize:", v4, v5);
  v7 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTArtworkView layer](self, "layer"));
  objc_msgSend(v8, "setCornerRadius:", v7);

}

- (void)_reloadArtwork
{
  double v3;
  double v4;
  double v6;
  double v7;
  uint64_t v9;

  -[MTArtworkView bounds](self, "bounds");
  if (v3 >= 1.0 && v4 >= 1.0)
  {
    v6 = v3;
    v7 = v4;
    if (-[MTArtworkView isPlaceholder](self, "isPlaceholder"))
    {
      -[MTArtworkView applyPlaceholderWithSize:](self, "applyPlaceholderWithSize:", v9, v6, v7);
    }
    else if (self->_artworkKey)
    {
      if (!-[MTArtworkView applyCachedImageForPodcast:withSize:](self, "applyCachedImageForPodcast:withSize:", v6, v7))
        -[MTArtworkView applyImageForPodcast:withSize:](self, "applyImageForPodcast:withSize:", self->_artworkKey, v6, v7);
    }
  }
}

- (void)applyPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  PUIObjCArtworkProvider *imageProvider;
  _QWORD v7[4];
  id v8;
  id location;

  height = a3.height;
  width = a3.width;
  objc_initWeak(&location, self);
  imageProvider = self->_imageProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D0E44;
  v7[3] = &unk_1004A7EA8;
  objc_copyWeak(&v8, &location);
  -[PUIObjCArtworkProvider placeholderWithSize:completionHandler:](imageProvider, "placeholderWithSize:completionHandler:", v7, width, height);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)applyCachedImageForPodcast:(id)a3 withSize:(CGSize)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PUIObjCArtworkProvider legacyUICachedArtworkForPodcastUuid:withSize:](self->_imageProvider, "legacyUICachedArtworkForPodcastUuid:withSize:", a3, a4.width, a4.height));
  if (v5)
    -[MTArtworkView setImage:](self, "setImage:", v5);

  return v5 != 0;
}

- (void)applyImageForPodcast:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  PUIObjCArtworkProvider *imageProvider;
  _QWORD v9[4];
  id v10;
  id location;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_initWeak(&location, self);
  imageProvider = self->_imageProvider;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D10AC;
  v9[3] = &unk_1004AA148;
  objc_copyWeak(&v10, &location);
  -[PUIObjCArtworkProvider keyedArtworkForShow:size:completionHandler:](imageProvider, "keyedArtworkForShow:size:completionHandler:", v7, v9, width, height);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkKey, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
