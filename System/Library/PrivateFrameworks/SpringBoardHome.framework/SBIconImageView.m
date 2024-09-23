@implementation SBIconImageView

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[SBIconProgressView setCanAnimate:](self->_progressView, "setCanAnimate:", -[SBIconImageView canAnimateProgress](self, "canAnimateProgress"));
  }
}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  SBIcon *icon;
  SBIcon *v11;

  v5 = a5;
  v11 = (SBIcon *)a3;
  v9 = a4;
  icon = self->_icon;
  if (icon != v11)
  {
    -[SBIcon removeObserver:](icon, "removeObserver:", self);
    objc_storeStrong((id *)&self->_icon, a3);
    -[SBIcon addObserver:](self->_icon, "addObserver:", self);
    if (-[SBIconImageView isShowingRealContentsImage](self, "isShowingRealContentsImage"))
      -[SBIconImageView clearDisplayedImage](self, "clearDisplayedImage");
    if ((BSEqualObjects() & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((BSEqualObjects() & 1) == 0)
  {
LABEL_7:
    -[SBIconImageView setLocation:](self, "setLocation:", v9);
LABEL_8:
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", v5);
    -[SBIconImageView sizeToFit](self, "sizeToFit");
  }

}

- (void)setProgressAlpha:(double)a3
{
  -[SBIconProgressView setAlpha:](self->_progressView, "setAlpha:", a3);
}

- (void)updateImageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[SBIconImageView canUpdateImage](self, "canUpdateImage"))
  {
    ++self->_updateImageDepth;
    -[SBIconImageView icon](self, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (objc_msgSend((id)objc_opt_class(), "allowsImageLayer"))
        -[SBIconImageView updateImageSublayerAnimated:](self, "updateImageSublayerAnimated:", v3);
      else
        -[SBIconImageView updateImageContentsAnimated:](self, "updateImageContentsAnimated:", v3);
    }
    else
    {
      -[SBIconImageView clearDisplayedImage](self, "clearDisplayedImage");
    }
    --self->_updateImageDepth;
  }
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SBIconImageView iconView](self, "iconView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[SBIconImageView iconImageCache](self, "iconImageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[SBIconImageView contentsImage](self, "contentsImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v10 = v9;
      v12 = v11;

      v6 = v10;
      v7 = v12;
      goto LABEL_6;
    }
  }
  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
LABEL_6:
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)contentsImage
{
  void *v3;

  if (-[SBIconImageView isShowingRealContentsImage](self, "isShowingRealContentsImage"))
  {
    -[SBIconImageView displayedImage](self, "displayedImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SBIconImageInfo)iconImageInfo
{
  SBIconImageInfo *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self;
  if (!LOBYTE(self[14].scale))
  {
    -[SBIconImageInfo iconView](self, "iconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageInfo iconImageCache](v3, "iconImageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v5 = v4;
    }
    else if (!v5)
    {
      goto LABEL_6;
    }
    objc_msgSend(v5, "iconImageInfo");
LABEL_6:

  }
  return self;
}

- (SBIconView)iconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageView)initWithFrame:(CGRect)a3
{
  SBIconImageView *v3;
  SBIconImageView *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBIconImageView;
  v3 = -[SBIconImageView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBIconImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)&v4->_location, CFSTR("SBIconLocationRoot"));
    v4->_overlayAlpha = 1.0;
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[SBIconImageView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v6, sel_updateImageAfterTraitChange);

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[SBIconImageView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v9, sel_updateImageAfterTraitChange);

  }
  return v4;
}

- (void)_clearProgressView
{
  SBIconProgressView *progressView;

  -[SBIconProgressView setDelegate:](self->_progressView, "setDelegate:", 0);
  -[SBIconProgressView removeFromSuperview](self->_progressView, "removeFromSuperview");
  progressView = self->_progressView;
  self->_progressView = 0;

}

- (void)prepareForReuse
{
  NSHashTable *imageUpdateDisableAssertions;

  -[SBIconImageView setIcon:location:animated:](self, "setIcon:location:animated:", 0, self->_location, 0);
  -[SBIconImageView setBrightness:](self, "setBrightness:", 1.0);
  -[SBIconImageView setShowsSquareCorners:](self, "setShowsSquareCorners:", 0);
  -[SBIconImageView setPaused:](self, "setPaused:", 0);
  -[SBIconImageView setContentVisibility:](self, "setContentVisibility:", 0);
  -[SBIconImageView setJittering:](self, "setJittering:", 0);
  -[SBIconImageView _clearProgressView](self, "_clearProgressView");
  -[SBIconImageView _removeAllAnimations:](self, "_removeAllAnimations:", 0);
  -[SBIconImageView _removeAllRetargetableAnimations:](self, "_removeAllRetargetableAnimations:", 0);
  imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
  self->_imageUpdateDisableAssertions = 0;

}

- (void)setBrightness:(double)a3
{
  CAFilter *multiplyFilter;
  CAFilter *v5;
  CAFilter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  CAFilter *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    multiplyFilter = self->_multiplyFilter;
    if (a3 >= 1.0)
    {
      if (multiplyFilter)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.brightness.inputColor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTimingFunction:", v10);

        -[CAFilter valueForKey:](self->_multiplyFilter, "valueForKey:", CFSTR("inputColor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFromValue:", v11);

        objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B60]);
        objc_msgSend(v9, "setDuration:", 0.3);
        -[SBIconImageView layer](self, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "setValue:forKeyPath:", objc_msgSend(v13, "CGColor"), CFSTR("filters.brightness.inputColor"));

        -[SBIconImageView layer](self, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAnimation:forKey:", v9, CFSTR("filters.brightness.inputColor"));

        v15 = self->_multiplyFilter;
        self->_multiplyFilter = 0;

      }
    }
    else
    {
      if (!multiplyFilter)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
        v5 = (CAFilter *)objc_claimAutoreleasedReturnValue();
        v6 = self->_multiplyFilter;
        self->_multiplyFilter = v5;

        -[CAFilter setName:](self->_multiplyFilter, "setName:", CFSTR("brightness"));
        -[SBIconImageView layer](self, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = self->_multiplyFilter;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFilters:", v8);

      }
      -[SBIconImageView _updateOverlayAlpha](self, "_updateOverlayAlpha");
    }
    -[SBIconImageView _updateOverlayAlpha](self, "_updateOverlayAlpha");
  }
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
    -[SBIconImageView _updateProgressMask](self, "_updateProgressMask");
  }
}

- (void)setJittering:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_jittering != a3)
  {
    v3 = a3;
    self->_jittering = a3;
    -[SBIconImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v3);

    -[SBIconProgressView layer](self->_progressView, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsEdgeAntialiasing:", v3);

  }
}

- (void)_updateOverlayAlpha
{
  CAFilter *multiplyFilter;
  id v3;

  multiplyFilter = self->_multiplyFilter;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", self->_brightness * self->_overlayAlpha, 1.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAFilter setValue:forKey:](multiplyFilter, "setValue:forKey:", objc_msgSend(v3, "CGColor"), CFSTR("inputColor"));

}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setIconImageCache:(id)a3
{
  SBHIconImageCache *v5;
  SBHIconImageCache *iconImageCache;
  SBHIconImageCache *v7;

  v5 = (SBHIconImageCache *)a3;
  iconImageCache = self->_iconImageCache;
  if (iconImageCache != v5)
  {
    v7 = v5;
    -[SBHIconImageCache removeObserver:](iconImageCache, "removeObserver:", self);
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    -[SBHIconImageCache addObserver:](self->_iconImageCache, "addObserver:", self);
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
    -[SBIconImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v7;
  }

}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconImageView;
    v5 = -[SBIconImageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setProgressState:(int64_t)a3 paused:(BOOL)a4 percent:(double)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  SBIconProgressView *progressView;
  SBIconProgressView *v12;
  SBIconProgressView *v13;
  void *v14;
  uint64_t v15;

  v6 = a6;
  v8 = a4;
  progressView = self->_progressView;
  if (!a3 || progressView)
  {
    -[SBIconProgressView setState:paused:fractionLoaded:animated:](progressView, "setState:paused:fractionLoaded:animated:", a3, a4, a6, a5);
  }
  else
  {
    v12 = objc_alloc_init(SBIconProgressView);
    v13 = self->_progressView;
    self->_progressView = v12;

    -[SBIconProgressView setDelegate:](self->_progressView, "setDelegate:", self);
    -[SBIconProgressView setHasOpaqueIconImage:](self->_progressView, "setHasOpaqueIconImage:", -[SBIconImageView hasOpaqueImage](self, "hasOpaqueImage"));
    -[SBIconProgressView layer](self->_progressView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsEdgeAntialiasing:", -[SBIconImageView isJittering](self, "isJittering"));

    -[SBIconImageView addSubview:](self, "addSubview:", self->_progressView);
    -[SBIconImageView _updateProgressMask](self, "_updateProgressMask");
    v15 = -[SBIconImageView isPaused](self, "isPaused") ^ 1;
    -[SBIconProgressView setState:paused:fractionLoaded:animated:](self->_progressView, "setState:paused:fractionLoaded:animated:", a3, v8, v15 & v6, a5);
    -[SBIconProgressView setCanAnimate:](self->_progressView, "setCanAnimate:", v15);
  }
}

- (UIImage)displayedImage
{
  return self->_displayedImage;
}

- (void)_updateProgressMask
{
  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  -[SBIconProgressView setIconImageInfo:](self->_progressView, "setIconImageInfo:");
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  return v2;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBIconImageView;
  -[SBIconImageView layoutSubviews](&v12, sel_layoutSubviews);
  -[SBIconImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBIconProgressView setFrame:](self->_progressView, "setFrame:");
  -[SBIconImageView contentsLayer](self, "contentsLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setPosition:");

}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)willBeginAsynchronousImageLoadForIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconImageView iconView](self, "iconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconImageViewWillBeginAsynchronousImageLoadForIcon:", v4);

}

- (void)didEndAsynchronousImageLoadForIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconImageView iconView](self, "iconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconImageViewDidEndAsynchronousImageLoadForIcon:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheRequestCancellation, 0);
  objc_storeStrong((id *)&self->_requestedImageAppearance, 0);
  objc_storeStrong((id *)&self->_contentsLayer, 0);
  objc_storeStrong((id *)&self->_displayedImageAppearance, 0);
  objc_storeStrong((id *)&self->_displayedImage, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_imageUpdateDisableAssertions, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_multiplyFilter, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[SBIcon removeObserver:](self->_icon, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBIconImageView;
  -[SBIconImageView dealloc](&v3, sel_dealloc);
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  if (!self->_hasSetIconImageInfo
    || !SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    self->_iconImageInfo.size.width = v10;
    self->_iconImageInfo.size.height = v9;
    self->_iconImageInfo.scale = v8;
    self->_iconImageInfo.continuousCornerRadius = v7;
    self->_hasSetIconImageInfo = 1;
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
    -[SBIconImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)clearIconImageInfo
{
  if (self->_hasSetIconImageInfo)
  {
    self->_hasSetIconImageInfo = 0;
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
    -[SBIconImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setOverlayAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    -[SBIconImageView _updateOverlayAlpha](self, "_updateOverlayAlpha");
  }
}

- (void)progressViewCanBeRemoved:(id)a3
{
  if (self->_progressView == a3)
    -[SBIconImageView _clearProgressView](self, "_clearProgressView");
}

- (BOOL)canAnimateProgress
{
  return !-[SBIconImageView isPaused](self, "isPaused")
      && -[SBIconImageView contentVisibility](self, "contentVisibility") != 2;
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t contentVisibility;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL8 v8;

  contentVisibility = self->_contentVisibility;
  if (contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    -[SBIconProgressView setCanAnimate:](self->_progressView, "setCanAnimate:", -[SBIconImageView canAnimateProgress](self, "canAnimateProgress"));
    v6 = -[SBIconImageView delayedImageUpdateDueToContentVisibility](self, "delayedImageUpdateDueToContentVisibility");
    if (a3 != 2 && v6)
    {
      v7 = -[SBIconImageView isShowingRealContentsImage](self, "isShowingRealContentsImage");
      v8 = contentVisibility != 2 && v7;
      -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", v8);
    }
  }
}

+ (BOOL)hasCustomJitter
{
  return 0;
}

- (void)didAddSublayer
{
  if (self->_progressView)
    -[SBIconImageView bringSubviewToFront:](self, "bringSubviewToFront:");
}

+ (BOOL)allowsImageLayer
{
  return 0;
}

+ (BOOL)generatesContentsImage
{
  return 0;
}

- (void)updateImageAnimatedIfShowingRealContentImage
{
  -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", -[SBIconImageView isShowingRealContentsImage](self, "isShowingRealContentsImage"));
}

- (unint64_t)iconImageOptions
{
  return -[SBIconImageView showsSquareCorners](self, "showsSquareCorners") ^ 1;
}

- (unint64_t)imageCacheRetrievalOptions
{
  if (-[SBIconImageView showsSquareCorners](self, "showsSquareCorners"))
    return 2;
  else
    return 0;
}

+ (unint64_t)imageCacheRetrievalOptionsForImageOptions:(unint64_t)a3
{
  return 0;
}

- (unint64_t)imageCacheOptions
{
  return 0;
}

- (unint64_t)imageLoadingBehavior
{
  void *v2;
  unint64_t v3;

  -[SBIconImageView iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageLoadingBehavior");

  return v3;
}

- (SBHIconImageAppearance)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconImageView iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveIconImageAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SBIconImageView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SBHIconImageAppearance *)v4;
}

- (id)effectiveTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[SBIconImageView iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideIconImageAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideIconImageStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconImageView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v5)
    {
      v8 = objc_msgSend(v7, "userInterfaceStyle");
      objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
  }

  return v6;
}

- (BOOL)updateImageContentsFromCacheAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  -[SBIconImageView icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBIconImageView iconImageCache](self, "iconImageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageForIcon:imageAppearance:options:", v5, v7, -[SBIconImageView imageCacheRetrievalOptions](self, "imageCacheRetrievalOptions") | 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
      -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v8, v7, 1, v3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)loadContentsImageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[SBIconImageView iconImageCache](self, "iconImageCache");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    -[SBIconImageView loadContentsImageFromCache:animated:](self, "loadContentsImageFromCache:animated:", v5, v3);
  else
    -[SBIconImageView loadContentsImageFromIconAnimated:](self, "loadContentsImageFromIconAnimated:", v3);

}

- (void)loadContentsImageFromCache:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  SBIconImageView *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  char v27;
  BOOL v28;

  v4 = a4;
  v6 = a3;
  -[SBIconImageView icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBIconImageView cacheRequestCancellation](self, "cacheRequestCancellation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    -[SBIconImageView setCacheRequestCancellation:](self, "setCacheRequestCancellation:", 0);
    -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBIconImageView imageLoadingBehavior](self, "imageLoadingBehavior");
    v11 = v10;
    if (v10 - 1 >= 2)
    {
      if (!v10)
      {
        objc_msgSend(v6, "imageForIcon:imageAppearance:options:", v7, v9, -[SBIconImageView imageCacheRetrievalOptions](self, "imageCacheRetrievalOptions"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v17, v9, 1, v4);

      }
    }
    else
    {
      -[SBIconImageView willBeginAsynchronousImageLoadForIcon:](self, "willBeginAsynchronousImageLoadForIcon:", v7);
      v12 = objc_msgSend((id)objc_opt_class(), "hasIconImage");
      if (!-[SBIconImageView isShowingRealContentsImage](self, "isShowingRealContentsImage"))
      {
        v13 = 0;
        if (v11 == 1 && v12)
        {
          objc_msgSend(v6, "cachingPlaceholderImageWithImageAppearance:options:", v9, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v13, v9, 0, v4);

      }
      -[SBIconImageView setRequestedImageAppearance:](self, "setRequestedImageAppearance:", v9);
      v14 = -[SBIconImageView imageCacheRetrievalOptions](self, "imageCacheRetrievalOptions") | 4;
      v15 = -[SBIconImageView imageCacheOptions](self, "imageCacheOptions");
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke;
      v21 = &unk_1E8D8D710;
      v22 = self;
      v23 = v7;
      v24 = v9;
      v25 = v6;
      v26 = v14;
      v27 = v12;
      v28 = v4;
      objc_msgSend(v25, "cacheImageForIcon:imageAppearance:priority:reason:options:completionHandler:", v23, v24, 3, CFSTR("SBIconImageView loadContentsImage"), v15, &v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconImageView setCacheRequestCancellation:](self, "setCacheRequestCancellation:", v16, v18, v19, v20, v21, v22);

    }
  }

}

void __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cacheRequestCancellation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setCacheRequestCancellation:", 0);
  if (objc_msgSend(v3, "isFinished"))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "effectiveIconImageAppearance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = BSEqualObjects();

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 56), "imageForIcon:imageAppearance:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || !*(_BYTE *)(a1 + 72))
        {
          objc_msgSend(*(id *)(a1 + 32), "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v12, *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 73));
        }
        else
        {
          SBLogIcon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_1((id *)(a1 + 40), v13);

          objc_msgSend(*(id *)(a1 + 32), "loadContentsImageFromIconAnimated:", *(unsigned __int8 *)(a1 + 73));
        }
        objc_msgSend(*(id *)(a1 + 32), "setRequestedImageAppearance:", 0);

      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "didEndAsynchronousImageLoadForIcon:", *(_QWORD *)(a1 + 40));

}

- (void)loadContentsImageFromIconAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = a3;
  -[SBIconImageView icon](self, "icon");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SBIconImageView effectiveTraitCollection](self, "effectiveTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sbh_iconImageAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView iconImageInfo](self, "iconImageInfo");
    objc_msgSend(v12, "iconImageWithInfo:traitCollection:options:", v5, -[SBIconImageView iconImageOptions](self, "iconImageOptions"), v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v11, v6, 1, v3);

  }
}

- (void)updateImageContentsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[SBIconImageView iconView](self, "iconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v5, v6, 1, v3);

  }
  else if (objc_msgSend((id)objc_opt_class(), "generatesContentsImage"))
  {
    -[SBIconImageView updateImageContentsFromGeneratedImageAnimated:](self, "updateImageContentsFromGeneratedImageAnimated:", v3);
  }
  else if (!-[SBIconImageView updateImageContentsFromCacheAnimated:](self, "updateImageContentsFromCacheAnimated:", v3))
  {
    -[SBIconImageView loadContentsImageAnimated:](self, "loadContentsImageAnimated:", v3);
  }

}

- (void)updateImageContentsWithImage:(id)a3 imageAppearance:(id)a4 isRealContentsImage:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CAFrameRateRange v21;

  v6 = a6;
  v7 = a5;
  v20 = a3;
  v10 = a4;
  -[SBIconImageView displayedImage](self, "displayedImage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v20)
  {
    v12 = objc_retainAutorelease(v20);
    v13 = (void *)objc_msgSend(v12, "CGImage");
    -[SBIconImageView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    if (v6)
    {
      objc_msgSend(v14, "contents");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v15;
      if ((id)v16 == v15)
      {
LABEL_7:

        goto LABEL_8;
      }
      v18 = (void *)v16;
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("contents"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDuration:", 0.3388);
      objc_msgSend(v19, "setMass:", 1.0);
      objc_msgSend(v19, "setStiffness:", 343.985);
      objc_msgSend(v19, "setDamping:", 37.0937);
      objc_msgSend(v19, "setInitialVelocity:", 0.0);
      objc_msgSend(v19, "setFromValue:", v18);
      objc_msgSend(v19, "setToValue:", v15);
      objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      v21 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
      objc_msgSend(v19, "setPreferredFrameRateRange:", *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
      objc_msgSend(v19, "setHighFrameRateReason:", 1114147);
      objc_msgSend(v14, "addAnimation:forKey:", v19, CFSTR("SBIconImageViewContents"));
      objc_msgSend(v14, "setContents:", v15);

    }
    else
    {
      objc_msgSend(v14, "setContents:", v15);
    }
    -[SBIconImageView setDisplayedImage:](self, "setDisplayedImage:", v12);
    -[SBIconImageView setDisplayedImageAppearance:](self, "setDisplayedImageAppearance:", v10);
    -[SBIconImageView setShowingRealContentsImage:](self, "setShowingRealContentsImage:", v7);
    -[SBIconImageView icon](self, "icon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView didChangeContents:forIcon:](self, "didChangeContents:forIcon:", v15, v17);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateImageSublayerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBIconImageView retrieveNewContentsLayerMasked:](self, "retrieveNewContentsLayerMasked:", !self->_showsSquareCorners);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView applyImageSublayer:animated:](self, "applyImageSublayer:animated:", v5, v3);

}

- (void)applyImageSublayer:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBIconImageView contentsLayer](self, "contentsLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");
  if (v7)
  {
    -[SBIconImageView bounds](self, "bounds");
    -[SBIconImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:atIndex:", v7, 0);

    UIRectGetCenter();
    objc_msgSend(v7, "setPosition:");
  }
  -[SBIconImageView setContentsLayer:](self, "setContentsLayer:", v7);

}

- (BOOL)updateImageContentsFromGeneratedImageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "generatesContentsImage");
  if (v5)
  {
    if (-[SBIconImageView showsSquareCorners](self, "showsSquareCorners"))
      -[SBIconImageView squareContentsImage](self, "squareContentsImage");
    else
      -[SBIconImageView contentsImage](self, "contentsImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", v6, v7, 1, v3);

  }
  return v5;
}

- (void)clearDisplayedImage
{
  -[SBIconImageView updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:](self, "updateImageContentsWithImage:imageAppearance:isRealContentsImage:animated:", 0, 0, 0, 0);
}

- (void)updateImageAfterTraitChange
{
  void *v3;
  void *v4;
  id v5;

  -[SBIconImageView displayedImageAppearance](self, "displayedImageAppearance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView requestedImageAppearance](self, "requestedImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0 && (BSEqualObjects() & 1) == 0)
  {
    if (-[SBIconImageView contentVisibility](self, "contentVisibility") == 2)
      -[SBIconImageView setDelayedImageUpdateDueToContentVisibility:](self, "setDelayedImageUpdateDueToContentVisibility:", 1);
    else
      -[SBIconImageView effectiveIconImageAppearanceDidChange](self, "effectiveIconImageAppearanceDidChange");
  }

}

- (BOOL)isUpdatingImage
{
  return self->_updateImageDepth != 0;
}

- (BOOL)canUpdateImage
{
  return -[NSHashTable count](self->_imageUpdateDisableAssertions, "count") == 0;
}

- (id)disableImageUpdatesForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *imageUpdateDisableAssertions;
  _SBIconImageViewDisableUpdatesAssertion *v7;

  v4 = a3;
  if (!self->_imageUpdateDisableAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
    self->_imageUpdateDisableAssertions = v5;

  }
  v7 = -[_SBIconImageViewDisableUpdatesAssertion initWithIconImageView:reason:]([_SBIconImageViewDisableUpdatesAssertion alloc], "initWithIconImageView:reason:", self, v4);
  -[NSHashTable addObject:](self->_imageUpdateDisableAssertions, "addObject:", v7);

  return v7;
}

- (void)invalidateImageUpdatesAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_imageUpdateDisableAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_imageUpdateDisableAssertions, "count"))
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
}

- (id)_generateSquareContentsImage
{
  void *v3;
  void *v4;

  -[SBIconImageView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v3, "unmaskedIconImageWithInfo:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)clearCachedImages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SBIconImageView iconImageCache](self, "iconImageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView icon](self, "icon");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "purgeCachedImagesForIcons:", v6);

  }
}

- (void)updateCachedImages
{
  void *v3;
  id v4;

  -[SBIconImageView iconImageCache](self, "iconImageCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "updateImageForIcon:", v3);

}

- (id)retrieveNewContentsLayerMasked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  SBIconImageView *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v3 = a3;
  -[SBIconImageView icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBIconImageView effectiveTraitCollection](self, "effectiveTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView iconImageInfo](self, "iconImageInfo");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = objc_msgSend(v7, "imageLoadingBehavior");
    v17 = v16;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__20;
    v39 = __Block_byref_object_dispose__20;
    v40 = 0;
    if ((unint64_t)(v16 - 1) >= 2)
    {
      if (v16)
      {
LABEL_11:
        v22 = (id)v36[5];
        _Block_object_dispose(&v35, 8);

        goto LABEL_12;
      }
      objc_msgSend(v5, "iconLayerWithInfo:traitCollection:options:", v6, v3, v9, v11, v13, v15);
      v23 = objc_claimAutoreleasedReturnValue();
      v19 = (id)v36[5];
      v36[5] = v23;
    }
    else
    {
      -[SBIconImageView willBeginAsynchronousImageLoadForIcon:](self, "willBeginAsynchronousImageLoadForIcon:", v5);
      -[SBIconImageView iconImageCache](self, "iconImageCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 1;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __50__SBIconImageView_retrieveNewContentsLayerMasked___block_invoke;
      v25[3] = &unk_1E8D8D738;
      v26 = v5;
      v27 = self;
      v29 = &v31;
      v30 = &v35;
      v19 = v18;
      v28 = v19;
      objc_msgSend(v26, "iconLayerWithInfo:traitCollection:options:completionHandler:", v6, v3, v25, v9, v11, v13, v15);
      *((_BYTE *)v32 + 24) = 0;
      if (v17 == 1 && !v36[5])
      {
        +[SBIcon genericIconLayerWithInfo:](SBIcon, "genericIconLayerWithInfo:", v9, v11, v13, v15);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v36[5];
        v36[5] = v20;

      }
      _Block_object_dispose(&v31, 8);
    }

    goto LABEL_11;
  }
  v22 = 0;
LABEL_12:

  return v22;
}

void __50__SBIconImageView_retrieveNewContentsLayerMasked___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      else
        objc_msgSend(*(id *)(a1 + 40), "applyImageSublayer:animated:", v10, 1);
      if ((__sb__runningInSpringBoard() & 1) == 0)
      {
        v6 = *(void **)(a1 + 48);
        v7 = objc_alloc_init(MEMORY[0x1E0DC3870]);
        v8 = *(_QWORD *)(a1 + 32);
        +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cacheImage:forIcon:imageAppearance:", v7, v8, v9);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "didEndAsynchronousImageLoadForIcon:", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasOpaqueImage
{
  return 1;
}

- (void)didChangeContents:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBIconImageView iconView](self, "iconView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconImageViewDidChangeContents:forIcon:", v7, v6);

}

- (BOOL)canOverrideImageTintColor
{
  return 1;
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconImageView icon](self, "icon");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", 1);
    -[SBIconImageView sizeToFit](self, "sizeToFit");
  }
}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  _BOOL8 v15;
  id v16;

  v16 = a5;
  v7 = a4;
  -[SBIconImageView icon](self, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9 && !-[SBIconImageView isUpdatingImage](self, "isUpdatingImage"))
  {
    -[SBIconImageView displayedImageAppearance](self, "displayedImageAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || BSEqualObjects())
    {
      -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11 || BSEqualObjects())
      {
        v12 = -[SBIconImageView contentVisibility](self, "contentVisibility");
        -[SBIconImageView alpha](self, "alpha");
        v15 = v13 > 0.0 && v12 != 2;
        -[SBIconImageView updateImageAnimated:](self, "updateImageAnimated:", v15);
        -[SBIconImageView sizeToFit](self, "sizeToFit");
      }

    }
  }

}

- (NSString)description
{
  return (NSString *)-[SBIconImageView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (CALayer)alternateContentsLayer
{
  if ((objc_msgSend((id)objc_opt_class(), "allowsImageLayer") & 1) != 0)
    -[SBIconImageView contentsLayer](self, "contentsLayer");
  else
    -[SBIconImageView layer](self, "layer");
  return (CALayer *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconImageView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  double v10;
  id v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView frame](self, "frame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("frame"));
  -[SBIconImageView icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("icon"));

  -[SBIconImageView alpha](self, "alpha");
  if (v8 < 1.0)
  {
    -[SBIconImageView alpha](self, "alpha");
    v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("alpha"));
  }
  -[SBIconImageView brightness](self, "brightness");
  if (v10 < 1.0)
    v11 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("brightness"));
  -[SBIconImageView overlayAlpha](self, "overlayAlpha");
  if (v12 < 1.0)
    v13 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("overlayAlpha"));
  v14 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconImageView isPaused](self, "isPaused"), CFSTR("isPaused"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconImageView showsSquareCorners](self, "showsSquareCorners"), CFSTR("showsSquareCorners"));
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_imageUpdateDisableAssertions, CFSTR("imageUpdateDisableAssertions"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconImageView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (NSString)location
{
  return self->_location;
}

- (double)brightness
{
  return self->_brightness;
}

- (void)setDisplayedImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayedImage, a3);
}

- (SBHIconImageAppearance)displayedImageAppearance
{
  return self->_displayedImageAppearance;
}

- (void)setDisplayedImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (BOOL)isJittering
{
  return self->_jittering;
}

- (CALayer)contentsLayer
{
  return self->_contentsLayer;
}

- (void)setContentsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentsLayer, a3);
}

- (BOOL)isShowingRealContentsImage
{
  return self->_showingRealContentsImage;
}

- (void)setShowingRealContentsImage:(BOOL)a3
{
  self->_showingRealContentsImage = a3;
}

- (BOOL)delayedImageUpdateDueToContentVisibility
{
  return self->_delayedImageUpdateDueToContentVisibility;
}

- (void)setDelayedImageUpdateDueToContentVisibility:(BOOL)a3
{
  self->_delayedImageUpdateDueToContentVisibility = a3;
}

- (SBHIconImageAppearance)requestedImageAppearance
{
  return self->_requestedImageAppearance;
}

- (void)setRequestedImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (SBHIconImageCacheRequestIdentifying)cacheRequestCancellation
{
  return self->_cacheRequestCancellation;
}

- (void)setCacheRequestCancellation:(id)a3
{
  objc_storeStrong((id *)&self->_cacheRequestCancellation, a3);
}

- (double)overlayAlpha
{
  return self->_overlayAlpha;
}

void __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Missing cached image for icon '%@' after caching should have completed", (uint8_t *)&v4, 0xCu);

}

@end
