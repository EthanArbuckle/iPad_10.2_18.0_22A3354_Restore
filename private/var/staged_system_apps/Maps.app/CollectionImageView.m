@implementation CollectionImageView

- (CollectionImageView)initWithFrame:(CGRect)a3 makeCornersRounded:(BOOL)a4
{
  CollectionImageView *v5;
  CollectionImageView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CollectionImageView;
  v5 = -[CollectionImageView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CollectionImageView setAccessibilityIgnoresInvertColors:](v5, "setAccessibilityIgnoresInvertColors:", 1);
    v6->_makeCornersRoundedForMainView = a4;
    -[CollectionImageView _createViews](v6, "_createViews");
  }
  return v6;
}

- (CollectionImageView)init
{
  return -[CollectionImageView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)imageAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionImageViewButtonSelected:", self);

}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 editing;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (-[CollectionHandlerInfo canEditImage](self->_collectionInfo, "canEditImage"))
      editing = self->_editing;
    else
      editing = 0;
    -[UIButton setEnabled:](self->_editButton, "setEnabled:", editing);
    -[CollectionImageView _updateGlyph](self, "_updateGlyph");
  }
}

- (void)setCollectionInfo:(id)a3
{
  CollectionHandlerInfo *v5;
  CollectionHandlerInfo *collectionInfo;
  CollectionHandlerInfo *v7;

  v5 = (CollectionHandlerInfo *)a3;
  collectionInfo = self->_collectionInfo;
  if (collectionInfo != v5)
  {
    v7 = v5;
    -[CollectionHandlerInfo removeObserver:](collectionInfo, "removeObserver:", self);
    objc_storeStrong((id *)&self->_collectionInfo, a3);
    -[CollectionHandlerInfo addObserver:](self->_collectionInfo, "addObserver:", self);
    -[CollectionImageView _updateImages](self, "_updateImages");
    v5 = v7;
  }

}

- (void)_enableShadow:(BOOL)a3 imageView:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v4 = a3;
  v5 = a4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v5, "setTintColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v7, "setShadowOffset:", 0.0, 0.0);

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 1.0)));
    v9 = objc_msgSend(v8, "CGColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v10, "setShadowColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    LODWORD(v12) = 1050253722;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v15, "setShadowRadius:", 3.0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.620000005, 1.0));
    objc_msgSend(v5, "setTintColor:", v13);

    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    LODWORD(v14) = 0;
    objc_msgSend(v15, "setShadowOpacity:", v14);
  }

}

- (void)_updateImages
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CollectionHandlerInfo isFavoriteCollection](self->_collectionInfo, "isFavoriteCollection"))
  {
    -[UIImageView setImage:](self->_mainImageView, "setImage:", 0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo image](self->_collectionInfo, "image"));
    -[UIImageView setImage:](self->_mainImageView, "setImage:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageBackgroundColor"));
    -[UIImageView setTintColor:](self->_mainImageView, "setTintColor:", v5);

    -[CollectionImageView _addVibrancyIfNeeded](self, "_addVibrancyIfNeeded");
  }
  -[CollectionImageView _updateGlyph](self, "_updateGlyph");
}

- (void)_updateGlyph
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;

  -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", 0);
  -[UIImageView setBackgroundColor:](self->_glyphImageView, "setBackgroundColor:", 0);
  -[UIImageView _setContinuousCornerRadius:](self->_glyphImageView, "_setContinuousCornerRadius:", 0.0);
  -[UIImageView setHidden:](self->_glyphImageView, "setHidden:", 0);
  if (-[CollectionHandlerInfo handlerType](self->_collectionInfo, "handlerType") == (id)1)
  {
    -[CollectionImageView _enableShadow:imageView:](self, "_enableShadow:imageView:", 0, self->_glyphImageView);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView theme](self, "theme"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
    -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v4);

LABEL_5:
    v5 = objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo glyphImage](self->_collectionInfo, "glyphImage"));
LABEL_6:
    v6 = (void *)v5;
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", v5);

    goto LABEL_7;
  }
  if (-[CollectionHandlerInfo handlerType](self->_collectionInfo, "handlerType") == (id)2)
  {
    -[CollectionImageView _enableShadow:imageView:](self, "_enableShadow:imageView:", 0, self->_glyphImageView);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v3);
    goto LABEL_5;
  }
  if (-[CollectionHandlerInfo isFavoriteCollection](self->_collectionInfo, "isFavoriteCollection"))
  {
    -[CollectionImageView _enableShadow:imageView:](self, "_enableShadow:imageView:", 0, self->_glyphImageView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView theme](self, "theme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "favoriteCollectionIconBackgroundColor"));
    -[UIImageView setBackgroundColor:](self->_glyphImageView, "setBackgroundColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView theme](self, "theme"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "favoriteCollectionIconColor"));
    -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerInfo glyphImage](self->_collectionInfo, "glyphImage"));
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", v14);

    -[UIImageView _setContinuousCornerRadius:](self->_glyphImageView, "_setContinuousCornerRadius:", 8.0);
  }
  else
  {
    if (self->_editing)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_mainImageView, "image"));
      v16 = v15 != 0;

      -[CollectionImageView _enableShadow:imageView:](self, "_enableShadow:imageView:", v16, self->_glyphImageView);
      v5 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.fill")));
      goto LABEL_6;
    }
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", 0);
    -[UIImageView setHidden:](self->_glyphImageView, "setHidden:", 1);
  }
LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_glyphImageView, "image"));
  v8 = objc_msgSend(v7, "isSymbolImage");

  if (v8)
    v9 = 4;
  else
    v9 = 1;
  -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", v9);
}

- (void)_addVibrancyIfNeeded
{
  void *v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *visualEffectView;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;

  if (sub_1002A8AA0(self) != 5)
  {
    if (-[CollectionHandlerInfo hasDefaultImage](self->_collectionInfo, "hasDefaultImage"))
    {
      if (!self->_visualEffectView)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1100));
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v3, 6));
        v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v4);
        visualEffectView = self->_visualEffectView;
        self->_visualEffectView = v5;

        -[CollectionImageView addSubview:](self, "addSubview:", self->_visualEffectView);
        -[CollectionImageView sendSubviewToBack:](self, "sendSubviewToBack:", self->_visualEffectView);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[UIImageView setTintColor:](self->_mainImageView, "setTintColor:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_visualEffectView, "contentView"));
      objc_msgSend(v9, "addSubview:", self->_mainImageView);

    }
    else
    {
      -[CollectionImageView addSubview:](self, "addSubview:", self->_mainImageView);
      -[CollectionImageView sendSubviewToBack:](self, "sendSubviewToBack:", self->_mainImageView);
      v8 = self->_visualEffectView;
      self->_visualEffectView = 0;

    }
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionImageView superview](self, "superview"));
    if (v4)
    {
      while (1)
      {
        v7 = v4;
        if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___MKVibrantGroup))
          break;
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

        v4 = (void *)v5;
        if (!v5)
          return;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vibrancyGroupName"));
      -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v6);

    }
  }
}

- (void)_createViews
{
  id v3;
  UIImageView **p_mainImageView;
  UIImageView *v5;
  UIImageView *glyphImageView;
  UIImageView *v7;
  UIButton *v8;
  UIButton *editButton;
  UIButton *v10;
  id obj;

  -[CollectionImageView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CollectionImageView"));
  v3 = objc_alloc((Class)UIImageView);
  -[CollectionImageView bounds](self, "bounds");
  obj = objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(obj, "setClipsToBounds:", 1);
  objc_msgSend(obj, "setContentMode:", 2);
  p_mainImageView = &self->_mainImageView;
  objc_storeStrong((id *)&self->_mainImageView, obj);
  -[UIImageView setAccessibilityIdentifier:](self->_mainImageView, "setAccessibilityIdentifier:", CFSTR("CollectionImageViewMainImage"));
  if (sub_1002A8AA0(self) == 5)
    -[CollectionImageView addSubview:](self, "addSubview:", *p_mainImageView);
  if (self->_makeCornersRoundedForMainView)
    -[UIImageView _setContinuousCornerRadius:](*p_mainImageView, "_setContinuousCornerRadius:", 8.0);
  v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[UIImageView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CollectionImageViewGlyphImage"));
  -[CollectionImageView addSubview:](self, "addSubview:", v5);
  glyphImageView = self->_glyphImageView;
  self->_glyphImageView = v5;
  v7 = v5;

  v8 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[UIButton setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("CollectionImageViewButton"));
  -[CollectionImageView addSubview:](self, "addSubview:", v8);
  -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, "imageAction:", 64);
  editButton = self->_editButton;
  self->_editButton = v8;
  v10 = v8;

  -[UIButton setEnabled:](self->_editButton, "setEnabled:", 0);
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
  CGFloat v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)CollectionImageView;
  -[CollectionImageView layoutSubviews](&v13, "layoutSubviews");
  -[CollectionImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_editButton, "setFrame:");
  -[UIImageView setFrame:](self->_mainImageView, "setFrame:", v4, v6, v8, v10);
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", v4, v6, v8, v10);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v11 = CGRectGetWidth(v14) * 0.361111111;
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:", v4, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2, v11));
  -[UIImageView setPreferredSymbolConfiguration:](self->_glyphImageView, "setPreferredSymbolConfiguration:", v12);

}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (CollectionImageViewDelegate)delegate
{
  return (CollectionImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end
