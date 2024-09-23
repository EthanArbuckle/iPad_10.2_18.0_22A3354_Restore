@implementation TPSImageAssetView

+ (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
}

+ (BOOL)cacheImageAvailableForIdentifier:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  +[TPSImageAssetController imageFromMemoryCacheForIdentifier:](TPSImageAssetController, "imageFromMemoryCacheForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  if (v3 && !v4)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (cacheImageAvailableForIdentifier__predicate != -1)
        dispatch_once(&cacheImageAvailableForIdentifier__predicate, &__block_literal_global_1);
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", v3, cacheImageAvailableForIdentifier__gFrameworkBundle, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v6 != 0;

  }
  return v5;
}

void __54__TPSImageAssetView_cacheImageAvailableForIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TipsUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cacheImageAvailableForIdentifier__gFrameworkBundle;
  cacheImageAvailableForIdentifier__gFrameworkBundle = v0;

}

- (void)commonInit
{
  UIColor *noImageBackgroundColor;
  id v4;
  UIImageView *v5;
  UIImageView *imageView;
  id obj;

  self->_status = 0;
  self->_roundedCorner = 0;
  self->_roundedCornerRadius = 10.0;
  +[TPSImageAssetView defaultBackgroundColor](TPSImageAssetView, "defaultBackgroundColor");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_defaultBackgroundColor)
    objc_storeStrong((id *)&self->_defaultBackgroundColor, obj);
  noImageBackgroundColor = self->_noImageBackgroundColor;
  if (!noImageBackgroundColor)
  {
    objc_storeStrong((id *)&self->_noImageBackgroundColor, obj);
    noImageBackgroundColor = self->_noImageBackgroundColor;
  }
  -[TPSImageAssetView setBackgroundColor:](self, "setBackgroundColor:", noImageBackgroundColor);
  if (!self->_imageView)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    imageView = self->_imageView;
    self->_imageView = v5;

    -[TPSImageAssetView addSubview:](self, "addSubview:", self->_imageView);
    -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  }

}

- (TPSImageAssetView)initWithDefaultBackgroundColor:(id)a3 noImageBackgroundColor:(id)a4
{
  id v7;
  id v8;
  TPSImageAssetView *v9;
  TPSImageAssetView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSImageAssetView;
  v9 = -[TPSImageAssetView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaultBackgroundColor, a3);
    objc_storeStrong((id *)&v10->_noImageBackgroundColor, a4);
    -[TPSImageAssetView commonInit](v10, "commonInit");
  }

  return v10;
}

- (TPSImageAssetView)init
{
  TPSImageAssetView *v2;
  TPSImageAssetView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSImageAssetView;
  v2 = -[TPSImageAssetView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSImageAssetView commonInit](v2, "commonInit");
  return v3;
}

- (TPSImageAssetView)initWithFrame:(CGRect)a3
{
  TPSImageAssetView *v3;
  TPSImageAssetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSImageAssetView;
  v3 = -[TPSImageAssetView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TPSImageAssetView commonInit](v3, "commonInit");
  return v4;
}

- (TPSImageAssetView)initWithCoder:(id)a3
{
  TPSImageAssetView *v3;
  TPSImageAssetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSImageAssetView;
  v3 = -[TPSImageAssetView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TPSImageAssetView commonInit](v3, "commonInit");
  return v4;
}

- (void)setAspectFillAsset:(BOOL)a3
{
  uint64_t v3;

  if (self->_aspectFillAsset != a3)
  {
    self->_aspectFillAsset = a3;
    if (a3)
      v3 = 2;
    else
      v3 = 1;
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v3);
  }
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setRoundedCorner:(BOOL)a3
{
  double roundedCornerRadius;
  double v5;
  double v6;
  id v7;

  if (self->_roundedCorner != a3)
  {
    self->_roundedCorner = a3;
    roundedCornerRadius = 0.0;
    if (a3)
      roundedCornerRadius = self->_roundedCornerRadius;
    -[TPSImageAssetView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", roundedCornerRadius);
    -[TPSImageAssetView _continuousCornerRadius](self, "_continuousCornerRadius");
    v6 = v5;
    -[TPSImageAssetView imageView](self, "imageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

  }
}

- (void)cancel
{
  void *v3;
  TPSURLSessionItem *imageURLSessionItem;
  NSString *currentDisplayIdentifier;

  objc_msgSend(MEMORY[0x24BEB7DC8], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSessionItem:", self->_imageURLSessionItem);

  imageURLSessionItem = self->_imageURLSessionItem;
  self->_imageURLSessionItem = 0;

  currentDisplayIdentifier = self->_currentDisplayIdentifier;
  self->_currentDisplayIdentifier = 0;

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    if (self->_hideImageWhenNil)
    {
      -[TPSImageAssetView imageView](self, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", v6 == 0);

    }
  }
  -[TPSImageAssetView updateBackgroundColor](self, "updateBackgroundColor");

}

- (void)setDefaultBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_defaultBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
    -[TPSImageAssetView updateBackgroundColor](self, "updateBackgroundColor");
  }

}

- (void)setNoImageBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_noImageBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_noImageBackgroundColor, a3);
    -[TPSImageAssetView updateBackgroundColor](self, "updateBackgroundColor");
  }

}

- (void)updateBackgroundColor
{
  _BOOL4 respectLoadingStatus;
  void *v4;
  void *v5;
  unint64_t status;
  uint64_t v7;
  int *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  respectLoadingStatus = self->_respectLoadingStatus;
  -[UIImageView image](self->_imageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (respectLoadingStatus)
  {

    status = self->_status;
    if (v5)
    {
      if ((status | 4) != 4)
        goto LABEL_12;
      v7 = 464;
    }
    else
    {
      if (status != 2)
        goto LABEL_12;
      v7 = 472;
    }
    v9 = *(id *)((char *)&self->super.super.super.isa + v7);
    v10 = v13;
  }
  else
  {
    v8 = &OBJC_IVAR___TPSImageAssetView__defaultBackgroundColor;
    if (!v4)
      v8 = &OBJC_IVAR___TPSImageAssetView__noImageBackgroundColor;
    v9 = *(id *)((char *)&self->super.super.super.isa + *v8);

    v10 = v5;
  }

  v13 = v9;
LABEL_12:
  -[TPSImageAssetView backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v13);

  if ((v12 & 1) == 0)
    -[TPSImageAssetView setBackgroundColor:](self, "setBackgroundColor:", v13);

}

- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  id *p_currentDisplayIdentifier;
  id v10;
  NSString *currentImagePath;
  void *v12;
  TPSURLSessionItem *imageURLSessionItem;
  void *v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  int v25;
  double v26;
  TPSURLSessionItem *v27;
  TPSURLSessionItem *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  id from;
  id location;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    self->_status = 2;
LABEL_8:
    -[TPSImageAssetView setImage:](self, "setImage:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "imageAssetViewImageUpdated:", self);

    goto LABEL_9;
  }
  p_currentDisplayIdentifier = (id *)&self->_currentDisplayIdentifier;
  if (-[NSString isEqualToString:](self->_currentDisplayIdentifier, "isEqualToString:", v7))
    goto LABEL_9;
  self->_status = 1;
  v10 = *p_currentDisplayIdentifier;
  *p_currentDisplayIdentifier = 0;

  currentImagePath = self->_currentImagePath;
  self->_currentImagePath = 0;

  objc_msgSend(MEMORY[0x24BEB7DC8], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelSessionItem:", self->_imageURLSessionItem);

  imageURLSessionItem = self->_imageURLSessionItem;
  self->_imageURLSessionItem = 0;

  -[TPSImageAssetView setImage:](self, "setImage:", 0);
  if (!v8)
  {
    self->_status = 2;
    goto LABEL_8;
  }
  +[TPSImageAssetController imageFromMemoryCacheForIdentifier:](TPSImageAssetController, "imageFromMemoryCacheForIdentifier:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentDisplayIdentifier, a3);
  objc_storeStrong((id *)&self->_currentImagePath, a4);
  if (v14)
  {
    -[TPSImageAssetView setImage:](self, "setImage:", v14);
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "imageAssetViewImageUpdated:", self);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v8, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v17 = (void *)v19;

      }
      else
      {
        objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("@"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_initWeak(&location, self);
          objc_initWeak(&from, *p_currentDisplayIdentifier);
          +[TPSImageAssetController dataCacheForIdentifier:](TPSImageAssetController, "dataCacheForIdentifier:", v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 != 0;

          v25 = *MEMORY[0x24BDD1350];
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke;
          v29[3] = &unk_24C5DDD78;
          objc_copyWeak(&v31, &location);
          objc_copyWeak(&v32, &from);
          v33 = v24;
          v30 = v8;
          LODWORD(v26) = v25;
          +[TPSImageAssetController formattedDataForPath:identifier:priority:completionHandler:](TPSImageAssetController, "formattedDataForPath:identifier:priority:completionHandler:", v30, v7, v29, v26);
          v27 = (TPSURLSessionItem *)objc_claimAutoreleasedReturnValue();
          v28 = self->_imageURLSessionItem;
          self->_imageURLSessionItem = v27;

          objc_destroyWeak(&v32);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
          goto LABEL_9;
        }
      }
    }
    self->_status = 4;
    -[TPSImageAssetView setImage:](self, "setImage:", v17);
    -[TPSImageAssetView setStatus:](self, "setStatus:", 4);
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "imageAssetViewImageUpdated:", self);

  }
LABEL_9:

}

void __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  NSObject *v23;
  void *v24;

  v10 = a3;
  v11 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "currentDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v11)
  {
    if (objc_msgSend(WeakRetained, "status") == 4)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x24BEB7D68], "data");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke_cold_1(a1, (uint64_t)v11, v23);

      goto LABEL_16;
    }
    v16 = 2;
  }
  else
  {
    objc_msgSend(WeakRetained, "imageURLSessionItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15 & ~objc_msgSend(v17, "isCancelled");

    if (v18 == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v10;
        objc_msgSend(WeakRetained, "setStatus:", 4);
        objc_msgSend(WeakRetained, "setImage:", v19);
        objc_msgSend(WeakRetained, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "imageAssetViewImageUpdated:", WeakRetained);

        v21 = (a5 & 1) == 0 && *(_BYTE *)(a1 + 56) == 0;
        objc_msgSend(WeakRetained, "animateImageView:", v21);

      }
      else
      {
        objc_msgSend(WeakRetained, "setStatus:", 2);
        objc_msgSend(WeakRetained, "setImage:", 0);
        objc_msgSend(WeakRetained, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "imageAssetViewImageUpdated:", WeakRetained);

        objc_msgSend(WeakRetained, "setCurrentDisplayIdentifier:", 0);
        objc_msgSend(WeakRetained, "setCurrentImagePath:", 0);
      }
      goto LABEL_16;
    }
    if (objc_msgSend(WeakRetained, "status") == 4)
      goto LABEL_16;
    v16 = 3;
  }
  objc_msgSend(WeakRetained, "setStatus:", v16);
  if (v15)
  {
    objc_msgSend(WeakRetained, "setImage:", 0);
    objc_msgSend(WeakRetained, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageAssetViewImageUpdated:", WeakRetained);

  }
  if (v11)
    goto LABEL_13;
LABEL_16:
  objc_msgSend(WeakRetained, "setImageURLSessionItem:", 0);

}

- (void)animateImageView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = a3;
  -[TPSImageAssetView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__TPSImageAssetView_animateImageView___block_invoke;
    v7[3] = &unk_24C5DDBD0;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, &__block_literal_global_18, 0.2);
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);

  }
}

void __38__TPSImageAssetView_animateImageView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)showHighlight:(BOOL)a3
{
  UIView *highlightView;
  UIView *v5;
  id v6;
  UIView *v7;
  UIView *v8;
  void *v9;

  highlightView = self->_highlightView;
  if (a3)
  {
    if (!highlightView)
    {
      v6 = objc_alloc(MEMORY[0x24BEBDB00]);
      -[TPSImageAssetView bounds](self, "bounds");
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      v8 = self->_highlightView;
      self->_highlightView = v7;

      -[TPSImageAssetView _continuousCornerRadius](self, "_continuousCornerRadius");
      -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:");
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.31372549, 0.25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v9);

      -[TPSImageAssetView addSubview:](self, "addSubview:", self->_highlightView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    v5 = self->_highlightView;
    self->_highlightView = 0;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSImageAssetView;
  -[TPSImageAssetView layoutSubviews](&v11, sel_layoutSubviews);
  -[TPSImageAssetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_highlightView, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)respectLoadingStatus
{
  return self->_respectLoadingStatus;
}

- (void)setRespectLoadingStatus:(BOOL)a3
{
  self->_respectLoadingStatus = a3;
}

- (BOOL)hideImageWhenNil
{
  return self->_hideImageWhenNil;
}

- (void)setHideImageWhenNil:(BOOL)a3
{
  self->_hideImageWhenNil = a3;
}

- (BOOL)roundedCorner
{
  return self->_roundedCorner;
}

- (BOOL)aspectFillAsset
{
  return self->_aspectFillAsset;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_roundedCornerRadius = a3;
}

- (TPSImageAssetViewDelegate)delegate
{
  return (TPSImageAssetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (UIColor)noImageBackgroundColor
{
  return self->_noImageBackgroundColor;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (void)setOverlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_overlayColor, a3);
}

- (NSString)currentImagePath
{
  return self->_currentImagePath;
}

- (void)setCurrentImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_currentImagePath, a3);
}

- (NSString)currentDisplayIdentifier
{
  return self->_currentDisplayIdentifier;
}

- (void)setCurrentDisplayIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentDisplayIdentifier, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (TPSURLSessionItem)imageURLSessionItem
{
  return self->_imageURLSessionItem;
}

- (void)setImageURLSessionItem:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLSessionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLSessionItem, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_currentImagePath, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_noImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

void __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_20CF80000, log, OS_LOG_TYPE_DEBUG, "Image asset path %@ fetch error: %@", (uint8_t *)&v4, 0x16u);
}

@end
