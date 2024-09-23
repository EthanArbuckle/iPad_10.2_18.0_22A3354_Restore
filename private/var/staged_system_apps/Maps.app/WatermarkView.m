@implementation WatermarkView

- (WatermarkView)initWithFrame:(CGRect)a3
{
  WatermarkView *v3;
  WatermarkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WatermarkView;
  v3 = -[WatermarkView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[WatermarkView _commonInit](v3, "_commonInit");
  return v4;
}

- (WatermarkView)initWithCoder:(id)a3
{
  WatermarkView *v3;
  WatermarkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WatermarkView;
  v3 = -[WatermarkView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[WatermarkView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  uint64_t v4;
  void *v5;
  id configListener;
  id v7;
  id v8;
  FCFImageEncoder *v9;
  FCFImageEncoder *imageEncoder;
  id v11;
  double v12;
  WatermarkProperties *v13;
  WatermarkProperties *watermarkProperties;
  uint64_t v15;
  void *v16;
  UIImageView *v17;
  UIImageView *imageView;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "addTileGroupObserver:queue:", self, &_dispatch_main_q);

  MapsFeature_AddDelegateListener(MapsFeaturesConfig_Watermarking[0], MapsFeaturesConfig_Watermarking[1], &_dispatch_main_q, self);
  objc_initWeak(&location, self);
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_10080F408;
  v26 = &unk_1011B98E0;
  objc_copyWeak(&v27, &location);
  v4 = _GEOConfigAddBlockListenerForKey(MapsConfig_ACPersonID, off_1014B3E38, &_dispatch_main_q, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  configListener = self->_configListener;
  self->_configListener = v5;

  -[WatermarkView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0, v23, v24, v25, v26);
  if (sub_10080ED04(0))
  {
    v7 = sub_10080EE18();
    if (objc_opt_class(v7))
    {
      v8 = sub_10080EF3C();
      if (objc_opt_class(v8))
      {
        v9 = (FCFImageEncoder *)objc_alloc_init((Class)sub_10080EE18());
        imageEncoder = self->_imageEncoder;
        self->_imageEncoder = v9;

        v11 = objc_alloc((Class)sub_10080EF3C());
        LODWORD(v12) = 0.5;
        v13 = (WatermarkProperties *)objc_msgSend(v11, "initWatermarkPropertiesWithHeight:width:angle:transparency:", 200.0, 200.0, 45.0, v12);
        watermarkProperties = self->_watermarkProperties;
        self->_watermarkProperties = v13;

        -[WatermarkProperties setTextOrigin:](self->_watermarkProperties, "setTextOrigin:", 0.0, 100.0);
        -[WatermarkProperties setFontSize:](self->_watermarkProperties, "setFontSize:", 12.0);
        -[WatermarkProperties setTextLineYIncrement:](self->_watermarkProperties, "setTextLineYIncrement:", 18);
        -[WatermarkProperties setXGridInterval:](self->_watermarkProperties, "setXGridInterval:", 175);
        -[WatermarkProperties setYGridInterval:](self->_watermarkProperties, "setYGridInterval:", 175);
        -[WatermarkProperties setColorMode:](self->_watermarkProperties, "setColorMode:", 1);
        if (sub_1002A8AA0(self) == 3)
          v15 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
        else
          v15 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
        v16 = (void *)v15;
        -[WatermarkProperties setDarkColor:](self->_watermarkProperties, "setDarkColor:", v15);

      }
    }
  }
  v17 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v17;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v19);

  -[WatermarkView addSubview:](self, "addSubview:", self->_imageView);
  LODWORD(v20) = 1148846080;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_imageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, -50.0, -25.0, 0.0, 0.0, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  MapsFeature_RemoveDelegateListenerForAllKeys(self, v4);
  v5.receiver = self;
  v5.super_class = (Class)WatermarkView;
  -[WatermarkView dealloc](&v5, "dealloc");
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)WatermarkView;
  -[WatermarkView layoutSubviews](&v11, "layoutSubviews");
  -[WatermarkView bounds](self, "bounds");
  v12.origin.x = v3;
  v12.origin.y = v4;
  v12.size.width = v5;
  v12.size.height = v6;
  if (!CGRectEqualToRect(self->_savedBounds, v12))
  {
    -[WatermarkView bounds](self, "bounds");
    self->_savedBounds.origin.x = v7;
    self->_savedBounds.origin.y = v8;
    self->_savedBounds.size.width = v9;
    self->_savedBounds.size.height = v10;
    -[WatermarkView _updateWatermark](self, "_updateWatermark");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WatermarkView;
  v4 = a3;
  -[WatermarkView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[WatermarkView _updateWatermark](self, "_updateWatermark");
}

- (id)_clearImage
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGSize v14;
  CGRect v15;

  -[WatermarkView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v14.width = v6;
  v14.height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v10, "set");

  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  UIRectFill(v15);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v12;
}

- (void)_updateWatermark
{
  uint64_t String;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  int HasValue;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  _QWORD v33[2];

  if (GEOShouldWatermark(self, a2))
  {
    String = GEOConfigGetString(MapsConfig_ACPersonID, off_1014B3E38);
    v4 = (void *)objc_claimAutoreleasedReturnValue(String);
    if (objc_msgSend(v4, "length"))
    {
      if ((_GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken[0], GeoServicesConfig_MapsRefreshToken[1]) & 1) == 0)
      {
        v5 = sub_10043284C();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Missing a valid auth token, but we have a valid personID. Will apply watermarking in case the auth token has not been persisted yet.", buf, 2u);
        }

      }
      v7 = sub_10043284C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Applying watermark", buf, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView _clearImage](self, "_clearImage"));
      v10 = v4;
      if (sub_10080ED04(0))
      {
        v11 = sub_10080EE18();
        if (objc_opt_class(v11))
        {
          v12 = sub_10080EF3C();
          if (objc_opt_class(v12))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView imageEncoder](self, "imageEncoder"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView watermarkProperties](self, "watermarkProperties"));
            v31 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addBinaryGridWatermarkToImage:ForId:withProperties:error:", v9, v10, v14, &v31));
            v16 = v31;

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView imageView](self, "imageView"));
            objc_msgSend(v17, "setImage:", v15);

            if (v16)
            {
              v18 = sub_10043284C();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v33[0] = v16;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error when applying watermark: %@", buf, 0xCu);
              }

            }
          }
        }
      }
    }
    else
    {
      v22 = sub_10043284C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v4, "length") != 0;
        HasValue = _GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken[0], GeoServicesConfig_MapsRefreshToken[1]);
        *(_DWORD *)buf = 67109376;
        LODWORD(v33[0]) = v24;
        WORD2(v33[0]) = 1024;
        *(_DWORD *)((char *)v33 + 6) = HasValue;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Can't apply watermark. Has personID %d, has valid token %d", buf, 0xEu);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView imageView](self, "imageView"));
      objc_msgSend(v26, "setImage:", 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
      objc_msgSend(v27, "invalidateTokens");

      -[WatermarkView flushTileCache](self, "flushTileCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      v9 = v28;
      if (!v28)
        goto LABEL_27;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topMostPresentedViewController"));
      v29 = sub_10043284C();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Requesting credentials from AppleConnect", buf, 2u);
      }

      +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:withProxyURL:](MapsAppleConnectAuthViewController, "presentAppleConnectAuthControllerFrom:withProxyURL:", v10, 0);
    }

LABEL_27:
    goto LABEL_28;
  }
  v20 = sub_10043284C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GEOShouldWatermark() returned NO, won't apply watermark", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView imageView](self, "imageView"));
  objc_msgSend(v4, "setImage:", 0);
LABEL_28:

}

- (void)flushTileCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader"));
  objc_msgSend(v2, "shrinkDiskCacheToSize:callbackQ:finished:", 0, &_dispatch_main_q, &stru_1011C9E68);

}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (FCFImageEncoder)imageEncoder
{
  return self->_imageEncoder;
}

- (void)setImageEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_imageEncoder, a3);
}

- (WatermarkProperties)watermarkProperties
{
  return self->_watermarkProperties;
}

- (void)setWatermarkProperties:(id)a3
{
  objc_storeStrong((id *)&self->_watermarkProperties, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_watermarkProperties, 0);
  objc_storeStrong((id *)&self->_imageEncoder, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong(&self->_configListener, 0);
}

@end
