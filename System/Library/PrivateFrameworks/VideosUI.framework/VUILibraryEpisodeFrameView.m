@implementation VUILibraryEpisodeFrameView

- (VUILibraryEpisodeFrameView)initWithFrame:(CGRect)a3
{
  VUILibraryEpisodeFrameView *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUILibraryEpisodeFrameView;
  v3 = -[VUILibraryEpisodeFrameView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__isPlaybackUIBeingShownDidChange_, v5, v6);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VUILibraryEpisodeFrameView setMediaItem:](self, "setMediaItem:", 0);
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryEpisodeFrameView;
  -[VUILibraryEpisodeFrameView dealloc](&v4, sel_dealloc);
}

+ (void)configureEpisodeFrameView:(id)a3 withMedia:(id)a4 layout:(int64_t)a5 imageSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SEL v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  VUIButton *v41;
  VUIButton *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int64_t v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id from;
  id location[2];

  height = a6.height;
  width = a6.width;
  v10 = a3;
  v11 = a4;
  v56 = a5;
  objc_msgSend(v10, "setLayout:", a5);
  objc_msgSend(v10, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "imageView");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A20]), "initWithFrame:", 0.0, 0.0, width, height);
  }
  v14 = (void *)v13;

  if (v56 == 1)
  {
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryDynamicBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithColor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaceholderImage:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVuiBackgroundColor:", v18);

    objc_msgSend(v10, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", objc_msgSend(v16, "userInterfaceStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaceholderImage:", v19);

  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = width * v21;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scale");
  v25 = height * v24;

  v26 = (void *)MEMORY[0x1E0DC6A08];
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "decoratorWithOutlineColor:outlineWidths:", v27, 1.0, 1.0, 1.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setScaleToSize:", v22, v25);
  if (v56 == 1 && !+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface"))
  {
    objc_msgSend(v28, "setCornerRadii:", *MEMORY[0x1E0DC6AE8], *(double *)(MEMORY[0x1E0DC6AE8] + 8), *(double *)(MEMORY[0x1E0DC6AE8] + 16), *(double *)(MEMORY[0x1E0DC6AE8] + 24));
    objc_msgSend(v14, "setCornerRadius:", 0.0);
  }
  else
  {
    +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:");
    objc_msgSend(v28, "setCornerRadii:");
    +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 0);
    objc_msgSend(v14, "setCornerRadius:");
    objc_msgSend(v14, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 0);
    objc_msgSend(v29, "setCornerRadius:");

    objc_msgSend(v14, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMasksToBounds:", 1);

  }
  objc_msgSend(v28, "setScaleMode:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBgColor:", v31);

  v32 = NSSelectorFromString(CFSTR("previewArtworkURL"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(id, SEL))objc_msgSend(v11, "methodForSelector:", v32))(v11, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  if (objc_msgSend(v33, "length"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1890]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v33, 0, CFSTR("jpeg"), width, height, 70.0, v33);
    objc_msgSend(MEMORY[0x1E0DB18A0], "imageURLWithDescription:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(MEMORY[0x1E0DC6A98], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithObject:imageLoader:groupType:", v35, v37, 0);

LABEL_18:
    goto LABEL_19;
  }
  +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v11, 1, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v39 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(v11, "mediaLibrary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v39, "initWithObject:imageLoader:groupType:", v34, v35, 0);
    goto LABEL_18;
  }
  v38 = 0;
LABEL_19:

  objc_msgSend(v38, "setDecorator:", v28);
  objc_initWeak(location, v10);
  objc_initWeak(&from, v11);
  objc_initWeak(&v61, v28);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __83__VUILibraryEpisodeFrameView_configureEpisodeFrameView_withMedia_layout_imageSize___block_invoke;
  v57[3] = &unk_1E9FA05D8;
  objc_copyWeak(&v58, location);
  objc_copyWeak(&v59, &from);
  objc_copyWeak(&v60, &v61);
  objc_msgSend(v14, "setImageProxy:completion:", v38, v57);
  objc_msgSend(v14, "setImageContainsCornerRadius:", 1);
  objc_msgSend(v10, "setImageView:", v14);
  if (v56 == 1)
  {
    objc_msgSend(v10, "playButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v10, "playButton");
      v41 = (VUIButton *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = -[VUIButton initWithType:interfaceStyle:]([VUIButton alloc], "initWithType:interfaceStyle:", 5, 0);
    }
    v42 = v41;

    -[VUIButton setCornerRadius:](v42, "setCornerRadius:", 32.0);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scale");
    v45 = v44;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    v48 = v47;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x1E0DC1440], 24.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A58]), "initWithSymbol:size:symbolConfiguration:", CFSTR("play.fill"), v49, v45 * 32.0, v48 * 38.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTintColor:", v51);

    objc_msgSend(MEMORY[0x1E0DC6A00], "makeImageViewWithResourceDescriptor:existingView:", v50, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setImageView:](v42, "setImageView:", v52);
    -[VUIButton setGroupName:](v42, "setGroupName:", 0);
    -[VUIButton setTextContentView:](v42, "setTextContentView:", 0);
    -[VUIButton setImageTrailsTextContent:](v42, "setImageTrailsTextContent:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.78, 0.78, 0.8, 0.8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setButtonBackgroundColor:](v42, "setButtonBackgroundColor:", v53);

    -[VUIButton setExclusiveTouch:](v42, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyBlueHighlightedColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setHighlightColor:](v42, "setHighlightColor:", v54);

    objc_msgSend(v10, "setPlayButton:", v42);
  }
  objc_msgSend(v10, "updateProgress:", v11);
  if (!v56)
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __83__VUILibraryEpisodeFrameView_configureEpisodeFrameView_withMedia_layout_imageSize___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v6 = objc_loadWeakRetained(a1 + 5);
  v7 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && v6 && (!a2 || a3))
  {
    +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0DC6A10]);
      objc_msgSend(v6, "mediaLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithObject:imageLoader:groupType:", v8, v10, 0);

      if (v7)
        objc_msgSend(v11, "setDecorator:", v7);
      objc_msgSend(WeakRetained, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setImageProxy:", v11);

    }
  }

}

- (void)updateProgress:(id)a3
{
  void *v4;
  float v5;
  float v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[VUILibraryEpisodeFrameView setMediaItem:](self, "setMediaItem:", v25);
  objc_msgSend(v25, "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  if (v6 > 0.0)
  {
    -[VUILibraryEpisodeFrameView progressView](self, "progressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[VUILibraryEpisodeFrameView progressView](self, "progressView");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0DB18C8]);
      v8 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v14 = (void *)v8;

    objc_msgSend(v14, "setCornerRadius:", 5.0);
    objc_msgSend(v14, "setStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProgressTintColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 0.9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompleteTintColor:", v16);

    objc_msgSend(v25, "bookmark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;
    objc_msgSend(v25, "duration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v14, "setProgress:", (float)(v19 / v21));

    -[VUILibraryEpisodeFrameView setProgressView:](self, "setProgressView:", v14);
    -[VUILibraryEpisodeFrameView setFullyPlayedImageView:](self, "setFullyPlayedImageView:", 0);
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v25, "playedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 == 3)
  {
    -[VUILibraryEpisodeFrameView fullyPlayedImageView](self, "fullyPlayedImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[VUILibraryEpisodeFrameView fullyPlayedImageView](self, "fullyPlayedImageView");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0DC6A20]);
      v12 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    v14 = (void *)v12;

    if (-[VUILibraryEpisodeFrameView layout](self, "layout") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("CornerGradientCheck"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setTintColor:", v24);

    }
    objc_msgSend(v14, "setImage:", v23);
    -[VUILibraryEpisodeFrameView setFullyPlayedImageView:](self, "setFullyPlayedImageView:", v14);
    -[VUILibraryEpisodeFrameView setProgressView:](self, "setProgressView:", 0);

    goto LABEL_15;
  }
  -[VUILibraryEpisodeFrameView setProgressView:](self, "setProgressView:", 0);
  -[VUILibraryEpisodeFrameView setFullyPlayedImageView:](self, "setFullyPlayedImageView:", 0);
LABEL_16:

}

- (void)setImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView *imageView;
  VUIImageView *v7;

  v5 = (VUIImageView *)a3;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v7 = v5;
    -[VUIImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    if (self->_imageView)
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
    -[VUILibraryEpisodeFrameView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setProgressView:(id)a3
{
  _TVProgressView *v5;
  _TVProgressView *progressView;
  _TVProgressView *v7;

  v5 = (_TVProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    v7 = v5;
    -[_TVProgressView removeFromSuperview](progressView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView)
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
    -[VUILibraryEpisodeFrameView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setPlayButton:(id)a3
{
  VUIButton *v5;
  VUIButton **p_playButton;
  VUIButton *playButton;
  VUIButton *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (VUIButton *)a3;
  p_playButton = &self->_playButton;
  playButton = self->_playButton;
  if (playButton != v5)
  {
    -[VUIButton removeFromSuperview](playButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_playButton, a3);
    if (*p_playButton)
    {
      -[VUILibraryEpisodeFrameView addSubview:](self, "addSubview:");
      objc_initWeak(&location, self);
      v8 = *p_playButton;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __44__VUILibraryEpisodeFrameView_setPlayButton___block_invoke;
      v12 = &unk_1E9F990E0;
      objc_copyWeak(&v13, &location);
      -[VUIButton setSelectActionHandler:](v8, "setSelectActionHandler:", &v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    -[VUILibraryEpisodeFrameView setNeedsLayout](self, "setNeedsLayout", v9, v10, v11, v12);
  }

}

void __44__VUILibraryEpisodeFrameView_setPlayButton___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playButtonPressed");

}

- (void)setFullyPlayedImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView *fullyPlayedImageView;
  VUIImageView *v7;

  v5 = (VUIImageView *)a3;
  fullyPlayedImageView = self->_fullyPlayedImageView;
  if (fullyPlayedImageView != v5)
  {
    v7 = v5;
    -[VUIImageView removeFromSuperview](fullyPlayedImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_fullyPlayedImageView, a3);
    if (self->_fullyPlayedImageView)
      -[VUIImageView addSubview:](self->_imageView, "addSubview:");
    -[VUILibraryEpisodeFrameView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  VUIImageView *imageView;
  VUIButton *playButton;
  CGFloat v5;
  _TVProgressView *progressView;
  double MinX;
  double v8;
  double v9;
  double MaxY;
  double v11;
  double v12;
  double Width;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  VUIImageView *fullyPlayedImageView;
  CGFloat v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v22.receiver = self;
  v22.super_class = (Class)VUILibraryEpisodeFrameView;
  -[VUILibraryEpisodeFrameView layoutSubviews](&v22, sel_layoutSubviews);
  imageView = self->_imageView;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  -[VUIImageView setFrame:](imageView, "setFrame:");
  if (self->_layout == 1)
  {
    playButton = self->_playButton;
    -[VUILibraryEpisodeFrameView bounds](self, "bounds");
    v5 = CGRectGetMidX(v23) + -32.0;
    -[VUILibraryEpisodeFrameView bounds](self, "bounds");
    -[VUIButton setFrame:](playButton, "setFrame:", v5, CGRectGetMidY(v24) + -32.0, 64.0, 64.0);
  }
  progressView = self->_progressView;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  MinX = CGRectGetMinX(v25);
  if (self->_layout == 1)
    v8 = 12.0;
  else
    v8 = 4.0;
  v9 = MinX + v8;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v26);
  v11 = 9.0;
  if (self->_layout == 1)
    v11 = 17.0;
  v12 = MaxY - v11;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  Width = CGRectGetWidth(v27);
  if (self->_layout == 1)
    v14 = 12.0;
  else
    v14 = 4.0;
  -[_TVProgressView setFrame:](progressView, "setFrame:", v9, v12, Width + v14 * -2.0, 5.0);
  -[VUIImageView image](self->_fullyPlayedImageView, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  fullyPlayedImageView = self->_fullyPlayedImageView;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  v21 = CGRectGetMaxX(v28) - v17;
  -[VUILibraryEpisodeFrameView bounds](self, "bounds");
  -[VUIImageView setFrame:](fullyPlayedImageView, "setFrame:", v21, CGRectGetMaxY(v29) - v19, v17, v19);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;
  CGRect v7;

  width = a3.width;
  -[VUIImageView frame](self->_imageView, "frame", a3.width, a3.height);
  v4 = CGRectGetHeight(v7) + 0.0;
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_playButtonPressed
{
  id v3;

  -[VUILibraryEpisodeFrameView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didTapButtonForEpisodeFrameView:", self);

}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__VUILibraryEpisodeFrameView__isPlaybackUIBeingShownDidChange___block_invoke;
  v4[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__VUILibraryEpisodeFrameView__isPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaybackUIBeingShown");

  if ((v3 & 1) == 0)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "mediaItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mediaItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;
      objc_msgSend(WeakRetained, "mediaItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playedState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "integerValue");
      VUIBoolLogString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v6;
      v17 = 2048;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUILibraryEpisodeFrameView:: playback dismissed. Update progress for item %@ # bookmark time %f # isFullyWatched %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(WeakRetained, "mediaItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateProgress:", v14);

  }
}

- (VUILibraryEpisodeFrameViewDelegate)delegate
{
  return (VUILibraryEpisodeFrameViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (_TVProgressView)progressView
{
  return self->_progressView;
}

- (VUIButton)playButton
{
  return self->_playButton;
}

- (int64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(int64_t)a3
{
  self->_layout = a3;
}

- (VUIImageView)fullyPlayedImageView
{
  return self->_fullyPlayedImageView;
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_fullyPlayedImageView, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
