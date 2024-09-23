@implementation VUIPostPlayView

- (VUIPostPlayView)initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  VUIPostPlayView *v16;
  VUIPostPlayView *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VUIPostPlayView;
  v16 = -[VUIPostPlayView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
    -[VUIPostPlayView _initWithFrame:andTVImageProxy:andTitle:andHeader:](v16, "_initWithFrame:andTVImageProxy:andTitle:andHeader:", v13, v14, v15, x, y, width, height);

  return v17;
}

- (VUIPostPlayView)initWithFrame:(CGRect)a3 andEpisodeArtworkURLStringFormat:(id)a4 andTitle:(id)a5 andHeader:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  VUIPostPlayView *v16;
  VUIPostPlayView *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VUIPostPlayView;
  v16 = -[VUIPostPlayView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  v18 = 0;
  if (v13 && v16)
  {
    if (objc_msgSend(v13, "length"))
    {
      -[VUIPostPlayView traitCollection](v17, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isAXEnabled"))
        v20 = 154.0;
      else
        v20 = 107.0;

      v21 = objc_alloc(MEMORY[0x1E0DB1890]);
      -[VUIPostPlayView bounds](v17, "bounds");
      v23 = (void *)objc_msgSend(v21, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v13, 0, CFSTR("jpeg"), v22, v20, 0.0);
      objc_msgSend(MEMORY[0x1E0DB18A0], "imageURLWithDescription:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0DB1870]);
      objc_msgSend(MEMORY[0x1E0DB1898], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v25, "initWithObject:imageLoader:groupType:", v24, v26, 0);

    }
    else
    {
      v18 = 0;
    }
  }
  -[VUIPostPlayView _initWithFrame:andTVImageProxy:andTitle:andHeader:](v17, "_initWithFrame:andTVImageProxy:andTitle:andHeader:", v18, v14, v15, x, y, width, height);

  return v17;
}

- (void)_initWithFrame:(CGRect)a3 andTVImageProxy:(id)a4 andTitle:(id)a5 andHeader:(id)a6
{
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v10 = a6;
  -[VUIPostPlayView setTitle:](self, "setTitle:", a5);
  -[VUIPostPlayView setHeader:](self, "setHeader:", v10);

  if (v23)
  {
    -[VUIPostPlayView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isAXEnabled"))
      v12 = 154.0;
    else
      v12 = 107.0;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v12 * 1.77777778 * v14;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v12 * v17;

    v19 = (void *)MEMORY[0x1E0DB1868];
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "decoratorWithOutlineColor:outlineWidths:", v20, 0.5, 0.5, 0.5, 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setScaleToSize:", v15, v18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBgColor:", v22);

    objc_msgSend(v21, "setScaleMode:", 2);
    objc_msgSend(v23, "setDecorator:", v21);
    objc_storeStrong((id *)&self->_episodeImageProxy, a4);

  }
  -[VUIPostPlayView _setupViews](self, "_setupViews");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIPostPlayView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)VUIPostPlayView;
  -[VUIPostPlayView layoutSubviews](&v4, sel_layoutSubviews);
  -[VUIPostPlayView bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[VUIPostPlayView bounds](self, "bounds");
  -[VUIPostPlayView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (void)_setupViews
{
  double v2;
  NSNumber *v4;
  NSNumber *defaultAutoPlayDuration;
  VUITextLayout *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  VUILabel *v10;
  VUILabel *headerLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  AVBackgroundView *v18;
  AVBackgroundView *backgroundView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _TVImageView *v25;
  _TVImageView *episodeImageView;
  _TVImageView *v27;
  void *v28;
  VUITextLayout *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  VUILabel *v35;
  VUILabel *nextEpisodeLabel;
  id v37;

  self->_canAutoPlay = 1;
  LODWORD(v2) = 10.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  defaultAutoPlayDuration = self->_defaultAutoPlayDuration;
  self->_defaultAutoPlayDuration = v4;

  -[VUIPostPlayView header](self, "header");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "length"))
  {
    v6 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v6, "setTextStyle:", 13);
    -[VUITextLayout setFontWeight:](v6, "setFontWeight:", 7);
    -[VUIPostPlayView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isAXEnabled"))
      v8 = 3;
    else
      v8 = 2;
    -[VUITextLayout setNumberOfLines:](v6, "setNumberOfLines:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v6, "setColor:", v9);

    -[VUITextLayout setMaximumContentSizeCategory:](v6, "setMaximumContentSizeCategory:", 8);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v37, v6, 0);
    v10 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    headerLabel = self->_headerLabel;
    self->_headerLabel = v10;

    -[VUIPostPlayView addSubview:](self, "addSubview:", self->_headerLabel);
  }
  -[VUIPostPlayView bounds](self, "bounds");
  v13 = v12;
  -[VUIPostPlayView bounds](self, "bounds");
  v15 = v14;
  -[VUIPostPlayView bounds](self, "bounds");
  v17 = v16 + -34.0 + -12.0;
  v18 = (AVBackgroundView *)objc_alloc_init(MEMORY[0x1E0C8B3F8]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v18;

  -[AVBackgroundView setFrame:](self->_backgroundView, "setFrame:", v13, 46.0, v15, v17);
  -[AVBackgroundView layer](self->_backgroundView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", 16.0);

  -[AVBackgroundView layer](self->_backgroundView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMasksToBounds:", 1);

  -[VUIPostPlayView backgroundView](self, "backgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPostPlayView addSubview:](self, "addSubview:", v22);

  -[VUIPostPlayView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "isAXEnabled");

  v24 = objc_alloc(MEMORY[0x1E0DB18B0]);
  -[VUIPostPlayView bounds](self, "bounds");
  v25 = (_TVImageView *)objc_msgSend(v24, "initWithFrame:", 0.0, 0.0);
  episodeImageView = self->_episodeImageView;
  self->_episodeImageView = v25;

  v27 = self->_episodeImageView;
  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("PreloadAsset-Dark-Generic16x9"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVImageView setPlaceholderImage:](v27, "setPlaceholderImage:", v28);

  if (self->_episodeImageProxy)
    -[_TVImageView setImageProxy:](self->_episodeImageView, "setImageProxy:");
  -[AVBackgroundView addSubview:](self->_backgroundView, "addSubview:", self->_episodeImageView);
  v29 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v29, "setTextStyle:", 14);
  -[VUITextLayout setFontWeight:](v29, "setFontWeight:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v29, "setColor:", v30);

  if (objc_msgSend(v37, "length"))
  {
    -[VUITextLayout setMaximumContentSizeCategory:](v29, "setMaximumContentSizeCategory:", 8);
    v31 = 1;
  }
  else
  {
    v31 = 2;
  }
  -[VUITextLayout setNumberOfLines:](v29, "setNumberOfLines:", v31);
  -[VUIPostPlayView title](self, "title");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v32, "length"))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:", CFSTR("TV.PostPlay.NextEpisode"));
    v34 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v34;
  }
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v32, v29, 0);
  v35 = (VUILabel *)objc_claimAutoreleasedReturnValue();
  nextEpisodeLabel = self->_nextEpisodeLabel;
  self->_nextEpisodeLabel = v35;

  -[AVBackgroundView addSubview:](self->_backgroundView, "addSubview:", self->_nextEpisodeLabel);
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  int v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[VUIPostPlayView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAXEnabled");

  if (v9)
    -[VUIPostPlayView _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  else
    -[VUIPostPlayView _layoutForOriginal:metricsOnly:](self, "_layoutForOriginal:metricsOnly:", v4, width, height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  uint64_t v6;
  double v7;
  double v8;
  VUILabel *headerLabel;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double width;
  double v24;
  CGSize result;

  height = a3.height;
  if (self->_headerLabel)
    v6 = 1;
  else
    v6 = 2;
  width = a3.width;
  v24 = a3.width + -32.0;
  -[VUILabel textRectForBounds:limitedToNumberOfLines:](self->_nextEpisodeLabel, "textRectForBounds:limitedToNumberOfLines:", v6, 16.0, 0.0);
  v8 = v7;
  headerLabel = self->_headerLabel;
  -[VUIPostPlayView bounds](self, "bounds");
  -[VUILabel textRectForBounds:limitedToNumberOfLines:](headerLabel, "textRectForBounds:limitedToNumberOfLines:", 3);
  v12 = v11 + 11.0;
  v13 = v8 + v11 + 11.0 + 154.0;
  if (height >= v13)
    v14 = 0.0;
  else
    v14 = height - (v8 + 154.0);
  -[VUIPostPlayView bounds](self, "bounds", *(_QWORD *)&v11, v10);
  v16 = v15;
  -[VUIPostPlayView backgroundView](self, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v16, v14, width, fmax(v8 + 154.0 + 11.0, 141.0));

  -[VUILabel setFrame:](self->_nextEpisodeLabel, "setFrame:", 16.0, v8 * 0.5 + 154.0, v24, v8);
  if (self->_headerLabel)
  {
    -[AVBackgroundView frame](self->_backgroundView, "frame");
    -[VUILabel setFrame:](self->_headerLabel, "setFrame:", 4.0, v18 - v12, v22, v21);
  }
  if (height >= v13)
    v19 = height;
  else
    v19 = v13;
  v20 = width;
  result.height = v19;
  result.width = v20;
  return result;
}

- (CGSize)_layoutForOriginal:(CGSize)a3 metricsOnly:(BOOL)a4
{
  CGFloat height;
  double width;
  VUILabel *headerLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  VUILabel *nextEpisodeLabel;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  headerLabel = self->_headerLabel;
  if (headerLabel)
  {
    -[VUIPostPlayView bounds](self, "bounds", a4);
    -[VUILabel sizeThatFits:](headerLabel, "sizeThatFits:", v8 + -8.0, 34.0);
    v10 = v9;
    -[VUILabel setFrame:](self->_headerLabel, "setFrame:", 4.0, 0.0, v11, v9);
    v12 = v10 + 11.0;
  }
  else
  {
    v12 = 45.0;
  }
  -[VUIPostPlayView bounds](self, "bounds");
  v14 = v13;
  -[VUIPostPlayView backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v14, v12, width, 141.0);

  nextEpisodeLabel = self->_nextEpisodeLabel;
  -[VUIPostPlayView bounds](self, "bounds");
  -[VUILabel sizeThatFits:](nextEpisodeLabel, "sizeThatFits:", v17 + -24.0, 34.0);
  v19 = v18;
  v20 = (34.0 - v18) * 0.5 + 107.0;
  -[VUIPostPlayView bounds](self, "bounds");
  -[VUILabel setFrame:](self->_nextEpisodeLabel, "setFrame:", 12.0, v20, v21 + -24.0, v19);
  v22 = width;
  v23 = height;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)setCanAutoPlay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  VUILabel *nextEpisodeLabel;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  self->_canAutoPlay = a3;
  -[VUIPostPlayView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    nextEpisodeLabel = self->_nextEpisodeLabel;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3)
      v10 = CFSTR("TV.PostPlay.NextEpisode");
    else
      v10 = CFSTR("POST_PLAY_UP_NEXT");
    objc_msgSend(v8, "localizedStringForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILabel setText:](nextEpisodeLabel, "setText:", v11);

    -[VUIPostPlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_startAutoPlayAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  VUICountDownProgressIndicator *v16;
  double v17;
  double v18;
  double v19;
  VUICountDownProgressIndicator *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  -[VUIPostPlayView autoPlayIndicator](self, "autoPlayIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[VUIPostPlayView canAutoPlay](self, "canAutoPlay"))
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackUpNextConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "autoPlayTimerDuration");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (v7 || (v7 = self->_defaultAutoPlayDuration) != 0)
    {
      if (-[NSNumber unsignedIntegerValue](v7, "unsignedIntegerValue"))
      {
        v8 = (double)-[NSNumber unsignedIntegerValue](v7, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("PlayMask"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vui_imageWithColor:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIPostPlayView traitCollection](self, "traitCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isAXEnabled");

        if (v13)
          v14 = 8.0;
        else
          v14 = 4.0;
        if (v13)
          v15 = 96.0;
        else
          v15 = 48.0;
        v16 = [VUICountDownProgressIndicator alloc];
        -[_TVImageView center](self->_episodeImageView, "center");
        v18 = v17 - v15 * 0.5;
        -[_TVImageView center](self->_episodeImageView, "center");
        v20 = -[VUICountDownProgressIndicator initWithFrame:duration:](v16, "initWithFrame:duration:", v18, v19 - v15 * 0.5, v15, v15, v8);
        -[VUICountDownProgressIndicator setProgressWidth:](v20, "setProgressWidth:", v14);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUICountDownProgressIndicator setProgressTintColor:](v20, "setProgressTintColor:", v21);

        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "colorWithAlphaComponent:", 0.7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUICountDownProgressIndicator setBackgroundTintColor:](v20, "setBackgroundTintColor:", v23);

        -[VUICountDownProgressIndicator setCenterImage:](v20, "setCenterImage:", v11);
        -[VUICountDownProgressIndicator setCountDownProgressDirection:](v20, "setCountDownProgressDirection:", 1);
        objc_initWeak(&location, self);
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __42__VUIPostPlayView__startAutoPlayAnimation__block_invoke;
        v27 = &unk_1E9F99C98;
        objc_copyWeak(&v28, &location);
        -[VUICountDownProgressIndicator setCompletion:](v20, "setCompletion:", &v24);
        -[VUIPostPlayView setAutoPlayIndicator:](self, "setAutoPlayIndicator:", v20, v24, v25, v26, v27);
        -[_TVImageView addSubview:](self->_episodeImageView, "addSubview:", v20);
        -[VUIPostPlayView setNeedsLayout](self, "setNeedsLayout");
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);

      }
    }

  }
}

void __42__VUIPostPlayView__startAutoPlayAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchAutoPlayEvent");

}

- (void)_invalidateAutoPlayIfNeeded
{
  void *v3;
  id v4;

  -[VUIPostPlayView autoPlayIndicator](self, "autoPlayIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "removeFromSuperview");
    -[VUIPostPlayView setAutoPlayIndicator:](self, "setAutoPlayIndicator:", 0);
    v3 = v4;
  }

}

- (void)_dispatchAutoPlayEvent
{
  void *v3;

  -[VUIPostPlayView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoPlayTimerDidCompleteForPostPlayView:", self);

  -[VUIPostPlayView _invalidateAutoPlayIfNeeded](self, "_invalidateAutoPlayIfNeeded");
}

- (VUIPostPlayViewDelegate)delegate
{
  return (VUIPostPlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canAutoPlay
{
  return self->_canAutoPlay;
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (_TVImageView)episodeImageView
{
  return self->_episodeImageView;
}

- (void)setEpisodeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_episodeImageView, a3);
}

- (VUILabel)nextEpisodeLabel
{
  return self->_nextEpisodeLabel;
}

- (void)setNextEpisodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nextEpisodeLabel, a3);
}

- (VUILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (TVImageProxy)episodeImageProxy
{
  return self->_episodeImageProxy;
}

- (void)setEpisodeImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_episodeImageProxy, a3);
}

- (VUICountDownProgressIndicator)autoPlayIndicator
{
  return self->_autoPlayIndicator;
}

- (void)setAutoPlayIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_autoPlayIndicator, a3);
}

- (NSNumber)autoPlayDuration
{
  return self->_autoPlayDuration;
}

- (void)setAutoPlayDuration:(id)a3
{
  objc_storeStrong((id *)&self->_autoPlayDuration, a3);
}

- (NSNumber)defaultAutoPlayDuration
{
  return self->_defaultAutoPlayDuration;
}

- (void)setDefaultAutoPlayDuration:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAutoPlayDuration, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultAutoPlayDuration, 0);
  objc_storeStrong((id *)&self->_autoPlayDuration, 0);
  objc_storeStrong((id *)&self->_autoPlayIndicator, 0);
  objc_storeStrong((id *)&self->_episodeImageProxy, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_nextEpisodeLabel, 0);
  objc_storeStrong((id *)&self->_episodeImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
