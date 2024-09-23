@implementation SKUIPlayButton

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        +[SKUIPlayButton sizeThatFitsWidth:viewElement:context:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = fmin(a3, 36.0);
  v15 = v14;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl layoutSubviews](&v8, sel_layoutSubviews);
  if (-[SKUIPlayButton style](self, "style") == 2)
  {
    if (-[SKUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SKUIPlayButton buttonSize](self, "buttonSize");
      v4 = v3;
      v6 = v5;
      -[SKUIPlayButtonControl imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl setEnabled:](&v5, sel_setEnabled_, a3);
  if (-[SKUIPlayButton style](self, "style") == 2)
  {
    if (-[SKUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SKUIPlayButtonControl imageView](self, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 1.0);

    }
  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl tintColorDidChange](&v5, sel_tintColorDidChange);
  if (-[SKUIPlayButton style](self, "style") == 2)
  {
    if (-[SKUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SKUIPlayButtonControl imageView](self, "imageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIPlayButton tintColor](self, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v4);

    }
  }
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  if (self->_style != 1)
    v2 = 28.0;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)buttonCornerRadius
{
  float result;

  result = 14.0;
  if (self->_style == 1)
    return 18.0;
  return result;
}

- (id)cancelImage
{
  void *v3;
  void *v4;
  _BOOL4 showStop;
  void *v6;
  void *v7;

  -[SKUIPlayButtonControl customToggleImage](self, "customToggleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUIPlayButtonControl customToggleImage](self, "customToggleImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    showStop = self->_showStop;
    -[SKUIPlayButton images](self, "images");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (showStop)
      objc_msgSend(v6, "stopImage");
    else
      objc_msgSend(v6, "pauseImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)defaultBackgroundColor
{
  void *v3;
  objc_super v5;

  if (-[SKUIPlayButton style](self, "style") == 2
    && -[SKUIPlayButtonControl backgroundType](self, "backgroundType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUIPlayButton;
    -[SKUIPlayButtonControl defaultBackgroundColor](&v5, sel_defaultBackgroundColor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)outerBorderColor
{
  void *v3;

  if (-[SKUIPlayButton style](self, "style") == 2 || -[SKUIPlayButtonControl isIndeterminate](self, "isIndeterminate"))
  {
    -[SKUIPlayButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)playImage
{
  void *v3;
  void *v4;
  void *v5;

  -[SKUIPlayButtonControl customPlayImage](self, "customPlayImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUIPlayButtonControl customPlayImage](self, "customPlayImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIPlayButton images](self, "images");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)playIndicatorDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  id v10;

  v3 = a3;
  if (-[SKUIPlayButton style](self, "style") == 2 && v3)
  {
    -[SKUIPlayButtonControl imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[SKUIPlayButtonControl imageView](self, "imageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButton tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v6);

  }
  else
  {
    if (-[SKUIPlayButton style](self, "style") != 2)
      return;
    -[SKUIPlayButtonControl imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    -[SKUIPlayButtonControl imageView](self, "imageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIPlayButtonControl playButtonDefaultAlpha](self, "playButtonDefaultAlpha");
    objc_msgSend(v10, "setAlpha:", v9);
  }

}

- (void)refresh
{
  objc_super v2;

  self->_showStop = 0;
  v2.receiver = self;
  v2.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl refresh](&v2, sel_refresh);
}

- (void)reloadWithItemStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = objc_msgSend(v12, "playState");
  v7 = -[SKUIPlayButtonControl isIndeterminate](self, "isIndeterminate");
  if (v6 == 1)
  {
    if (!v7)
      -[SKUIPlayButtonControl beginIndeterminateAnimation](self, "beginIndeterminateAnimation");
  }
  else
  {
    if (v7)
      -[SKUIPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
    objc_msgSend(v12, "duration");
    v9 = v8;
    if (self->_showStop != objc_msgSend(v12, "hideDuration"))
    {
      self->_showStop = objc_msgSend(v12, "hideDuration");
      -[SKUIPlayButtonControl showPlayIndicator:force:](self, "showPlayIndicator:force:", -[SKUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"), 1);
    }
    HIDWORD(v10) = 1018167296;
    if (v9 < 2.22044605e-16 || objc_msgSend(v12, "hideDuration"))
    {
      LODWORD(v10) = 0;
    }
    else
    {
      objc_msgSend(v12, "currentTime");
      v10 = v11 / v9;
      *(float *)&v10 = v10;
    }
    -[SKUIPlayButtonControl setProgress:animated:](self, "setProgress:animated:", v4, v10);
  }

}

- (void)setBackgroundType:(int64_t)a3
{
  objc_super v3;

  self->_showStop = 0;
  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl setBackgroundType:](&v3, sel_setBackgroundType_, a3);
}

- (void)setStyle:(int64_t)a3
{
  SKUIPlayButtonImageCache *v5;
  SKUIPlayButtonImageCache *imageCache;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_style != a3)
  {
    self->_style = a3;
    +[SKUIPlayButtonImageCache imageCacheForStyle:](SKUIPlayButtonImageCache, "imageCacheForStyle:");
    v5 = (SKUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    imageCache = self->_imageCache;
    self->_imageCache = v5;

    -[SKUIPlayButton refresh](self, "refresh");
    if (a3 == 2)
    {
      -[SKUIPlayButton playImage](self, "playImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithRenderingMode:", 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[SKUIPlayButtonControl imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "image");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v13)
      {
        -[SKUIPlayButtonControl imageView](self, "imageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v13);

      }
      if (-[SKUIPlayButtonControl backgroundType](self, "backgroundType") == 1)
      {
        -[SKUIPlayButton defaultBackgroundColor](self, "defaultBackgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIPlayButtonControl setControlColor:](self, "setControlColor:", v11);
      }
      else
      {
        -[SKUIPlayButtonControl imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIPlayButton tintColor](self, "tintColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTintColor:", v12);

      }
      -[SKUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
      -[SKUIPlayButtonControl setShowBorder:](self, "setShowBorder:", 0);
      -[SKUIPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 1);

    }
    else
    {
      -[SKUIPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 0);
      -[SKUIPlayButtonControl setShowBorder:](self, "setShowBorder:", 1);
    }
  }
}

- (id)images
{
  SKUIPlayButtonImageCache *imageCache;
  SKUIPlayButtonImageCache *v4;
  SKUIPlayButtonImageCache *v5;

  imageCache = self->_imageCache;
  if (!imageCache)
  {
    +[SKUIPlayButtonImageCache imageCacheForStyle:](SKUIPlayButtonImageCache, "imageCacheForStyle:", self->_style);
    v4 = (SKUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (BOOL)showOuterBorder
{
  return -[SKUIPlayButton style](self, "style") == 2;
}

- (void)setRadio:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[SKUIPlayButton setStyle:](self, "setStyle:", v3);
}

- (BOOL)isRadio
{
  return -[SKUIPlayButton style](self, "style") == 2;
}

- (void)setUseLargeButton:(BOOL)a3
{
  -[SKUIPlayButton setStyle:](self, "setStyle:", a3);
}

- (BOOL)useLargeButton
{
  return -[SKUIPlayButton style](self, "style") == 1;
}

- (void)_updateEnabledState
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButton;
  -[SKUIPlayButtonControl _updateEnabledState](&v8, sel__updateEnabledState);
  if (-[SKUIPlayButton style](self, "style") == 2)
  {
    if (-[SKUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SKUIPlayButton buttonSize](self, "buttonSize");
      v4 = v3;
      v6 = v5;
      -[SKUIPlayButtonControl imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);

    }
  }
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (void)setPlayItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (void)setShowOnDemand:(BOOL)a3
{
  self->_showOnDemand = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (SKUIPlayButtonImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
