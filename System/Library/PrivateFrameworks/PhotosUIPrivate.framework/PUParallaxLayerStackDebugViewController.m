@implementation PUParallaxLayerStackDebugViewController

- (PUParallaxLayerStackDebugViewController)init
{
  PUParallaxLayerStackDebugViewController *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUParallaxLayerStackDebugViewController;
  v2 = -[PUParallaxLayerStackDebugViewController init](&v5, sel_init);
  PLWallpaperGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v2->_signpost = os_signpost_id_make_with_pointer(v3, v2);

  return v2;
}

- (id)_newButtonWithSystemImageName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3520];
  v4 = a3;
  objc_msgSend(v3, "borderlessButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonSize:", 0);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImage:", v6);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v5);
  objc_msgSend(v7, "sizeToFit");

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PUParallaxLayerStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PUParallaxLayerStackView *v10;
  void *v11;
  void *v12;
  PUWallpaperPosterDateView *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[7];

  v50[6] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PUParallaxLayerStackDebugViewController;
  -[PUParallaxLayerStackDebugViewController viewDidLoad](&v49, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [PUParallaxLayerStackView alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PUParallaxLayerStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  -[PUParallaxLayerStackDebugViewController setLayerStackView:](self, "setLayerStackView:", v10);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v6, v7, v8, v9);
  -[PUParallaxLayerStackDebugViewController setDateTimeView:](self, "setDateTimeView:", v13);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController dateTimeView](self, "dateTimeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  v16 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("square.stack.3d.up"));
  -[PUParallaxLayerStackDebugViewController setParallaxEnabledButton:](self, "setParallaxEnabledButton:", v16);

  -[PUParallaxLayerStackDebugViewController parallaxEnabledButton](self, "parallaxEnabledButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_toggleParallaxEnabled_, 0x2000);

  v18 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("slider.horizontal.below.rectangle"));
  -[PUParallaxLayerStackDebugViewController setLooksButton:](self, "setLooksButton:", v18);

  -[PUParallaxLayerStackDebugViewController looksButton](self, "looksButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_showLooks_, 0x2000);

  v20 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("list.dash"));
  -[PUParallaxLayerStackDebugViewController setLayerListButton:](self, "setLayerListButton:", v20);

  -[PUParallaxLayerStackDebugViewController layerListButton](self, "layerListButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_showLayerList_, 0x2000);

  v22 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("eyedropper.full"));
  -[PUParallaxLayerStackDebugViewController setColorPaletteButton:](self, "setColorPaletteButton:", v22);

  -[PUParallaxLayerStackDebugViewController colorPaletteButton](self, "colorPaletteButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_showColorPalettes_, 0x2000);

  v24 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("square.and.arrow.up"));
  -[PUParallaxLayerStackDebugViewController setShareButton:](self, "setShareButton:", v24);

  -[PUParallaxLayerStackDebugViewController shareButton](self, "shareButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel_shareLayerStack_, 0x2000);

  v26 = -[PUParallaxLayerStackDebugViewController _newButtonWithSystemImageName:](self, "_newButtonWithSystemImageName:", CFSTR("ant.fill"));
  -[PUParallaxLayerStackDebugViewController setRadarButton:](self, "setRadarButton:", v26);

  -[PUParallaxLayerStackDebugViewController radarButton](self, "radarButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addTarget:action:forControlEvents:", self, sel_tapToRadar_, 0x2000);

  v28 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[PUParallaxLayerStackDebugViewController parallaxEnabledButton](self, "parallaxEnabledButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v29;
  -[PUParallaxLayerStackDebugViewController looksButton](self, "looksButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v30;
  -[PUParallaxLayerStackDebugViewController layerListButton](self, "layerListButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v31;
  -[PUParallaxLayerStackDebugViewController colorPaletteButton](self, "colorPaletteButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v32;
  -[PUParallaxLayerStackDebugViewController shareButton](self, "shareButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v33;
  -[PUParallaxLayerStackDebugViewController radarButton](self, "radarButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v28, "initWithArrangedSubviews:", v35);
  -[PUParallaxLayerStackDebugViewController setButtonStackView:](self, "setButtonStackView:", v36);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v37);

  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAxis:", 0);

  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAlignment:", 3);

  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDistribution:", 1);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v43);

  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sizeToFit");

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_panGesture_);
  -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addGestureRecognizer:", v45);

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel_pinchGesture_);
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addGestureRecognizer:", v47);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackDebugViewController;
  -[PUParallaxLayerStackDebugViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackDebugViewController;
  -[PUParallaxLayerStackDebugViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double MidX;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  CGFloat v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat v31;
  void *v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  void *v36;
  double Height;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  double *v45;
  double v46;
  void *v47;
  void *v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v49.receiver = self;
  v49.super_class = (Class)PUParallaxLayerStackDebugViewController;
  -[PUParallaxLayerStackDebugViewController viewDidLayoutSubviews](&v49, sel_viewDidLayoutSubviews);
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MidX = CGRectGetMidX(v50);
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetMidY(v51) * 0.67;
  -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", MidX, v16);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = CGRectGetMidX(v52);
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = CGRectGetMidY(v53) * 1.33;
  -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaInsets");
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v31 = CGRectGetMaxY(v54) - v27;
  -[PUParallaxLayerStackDebugViewController radarButton](self, "radarButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v33 = v31 - CGRectGetHeight(v55);
  -[PUParallaxLayerStackDebugViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetWidth(v56) - v29 - v25;
  -[PUParallaxLayerStackDebugViewController radarButton](self, "radarButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  Height = CGRectGetHeight(v57);

  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v25, v33, v35, Height);

  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "currentLayerStack");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "layout");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v58.origin.x = v5;
    v58.origin.y = v7;
    v58.size.width = v9;
    v58.size.height = v11;
    if (!CGRectIsEmpty(v58))
    {
      -[PUParallaxLayerStackDebugViewController dateTimeView](self, "dateTimeView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "layoutWithLayout:inContainerFrame:", v41, v5, v7, v9, v11);

      -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "clockAppearsAboveForeground");

      if (v44)
        v45 = (double *)MEMORY[0x1E0D756E0];
      else
        v45 = (double *)MEMORY[0x1E0D756D8];
      v46 = *v45;
      -[PUParallaxLayerStackDebugViewController dateTimeView](self, "dateTimeView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setZPosition:", v46);

    }
  }

}

- (void)_updateDateTimeView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUParallaxLayerStackDebugViewController dateTimeView](self, "dateTimeView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clockFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PUPosterSimulatedTimeFontForIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeFont:", v6);

  v7 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v4, "clockColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithCGColor:", objc_msgSend(v8, "CGColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeColor:", v9);

  objc_msgSend(v10, "setUseVibrantAppearance:", 0);
}

- (void)showProgressIndicator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpost;
  PUProgressIndicatorView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUParallaxLayerStackDebugViewController.ProgressIndicator", ", buf, 2u);
    }

    v9 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
    -[PUParallaxLayerStackDebugViewController setProgressIndicator:](self, "setProgressIndicator:", v9);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocalizedMessage:", v4);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeterminate:", 0);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowsBackground:", 1);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginShowingProgressImmediately:animated:", 1, 1);

    -[PUParallaxLayerStackDebugViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeToFit");

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrangedSubviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "setEnabled:", 0);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v21);
  }

}

- (void)updateProgressIndicator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedMessage:", v4);

}

- (void)hideProgressIndicator
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PUParallaxLayerStackDebugViewController progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PUParallaxLayerStackDebugViewController_hideProgressIndicator__block_invoke;
  v14[3] = &unk_1E58ABD10;
  v14[4] = self;
  objc_msgSend(v3, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 1, v14);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)showDownloadProgressIndicator
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpost;
  PUProgressIndicatorView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUParallaxLayerStackDebugViewController.DownloadProgressIndicator", ", v17, 2u);
    }

    v7 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
    -[PUParallaxLayerStackDebugViewController setDownloadProgressIndicator:](self, "setDownloadProgressIndicator:", v7);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalizedMessage:", CFSTR("Downloading…"));

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeterminate:", 1);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentProgress:", 0.0);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowsBackground:", 1);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "beginShowingProgressImmediately:animated:", 1, 1);

    -[PUParallaxLayerStackDebugViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeToFit");

  }
}

- (void)updateDownloadProgressIndicator:(double)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpost;
  uint8_t v9[16];

  -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentProgress:", a3);

  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v7, OS_SIGNPOST_EVENT, signpost, "PUParallaxLayerStackDebugViewController.UpdateDownloadProgress", ", v9, 2u);
  }

}

- (void)hideDowloadProgressIndicator
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingProgress");

  if (v4)
  {
    -[PUParallaxLayerStackDebugViewController downloadProgressIndicator](self, "downloadProgressIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__PUParallaxLayerStackDebugViewController_hideDowloadProgressIndicator__block_invoke;
    v16[3] = &unk_1E58ABD10;
    v16[4] = self;
    objc_msgSend(v5, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 1, v16);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PUParallaxLayerStackDebugViewController buttonStackView](self, "buttonStackView", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrangedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setEnabled:", 1);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)loadPHAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  if (a3)
  {
    v4 = a3;
    -[PUParallaxLayerStackDebugViewController setAsset:](self, "setAsset:", v4);
    -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[PUParallaxLayerStackDebugViewController showProgressIndicator:](self, "showProgressIndicator:", CFSTR("Loading…"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v4);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v6);
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke;
    v11[3] = &unk_1E58AA448;
    v11[4] = self;
    objc_msgSend(v7, "setDownloadProgressHandler:", v11);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_2;
    v10[3] = &unk_1E589FC30;
    v10[4] = self;
    objc_msgSend(v7, "setLoadingHandler:", v10);
    objc_msgSend(v7, "setLoadingHandlerQueue:", MEMORY[0x1E0C80D38]);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_195;
    v9[3] = &unk_1E589FC58;
    v9[4] = self;
    objc_msgSend(v7, "loadSegmentationItemWithCompletion:", v9);

  }
}

- (void)loadPartialSegmentationItem:(id)a3 loadingState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpost;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a4;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_EVENT, signpost, "PUParallaxLayerStackDebugViewController.LoadingState", "state=%lx", buf, 0xCu);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71228]), "initWithSegmentationItem:", v6);
  objc_msgSend(v10, "setResponseQueue:", MEMORY[0x1E0C80D38]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v10, "setPriority:", v11);

  objc_msgSend(v10, "setLayerStackMode:", 2);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PUParallaxLayerStackDebugViewController_loadPartialSegmentationItem_loadingState___block_invoke;
  v14[3] = &unk_1E58AB198;
  v14[4] = self;
  objc_msgSend(v10, "submit:", v14);
  if ((a4 & 4) != 0)
  {
    v13 = CFSTR("Finishing…");
  }
  else if ((a4 & 2) != 0)
  {
    v13 = CFSTR("Analyzing…");
  }
  else if ((a4 & 1) != 0)
  {
    v13 = CFSTR("Segmenting…");
  }
  else
  {
    PLWallpaperGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a4;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Unexpected segmentation loading state; %lx", buf, 0xCu);
    }

    v13 = 0;
  }
  -[PUParallaxLayerStackDebugViewController updateProgressIndicator:](self, "updateProgressIndicator:", v13);

}

- (void)loadSegmentationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v4);
  objc_msgSend(v5, "setResponseQueue:", MEMORY[0x1E0C80D38]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v5, "setPriority:", v6);

  objc_msgSend(v5, "setLayerStackOptions:", 0xFFFFLL);
  if (objc_msgSend(v4, "isSettlingEffectAvailable"))
    objc_msgSend(v5, "setSettlingEffectEnabled:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PUParallaxLayerStackDebugViewController_loadSegmentationItem___block_invoke;
  v8[3] = &unk_1E589FC80;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "submit:", v8);

}

- (void)loadLayerStack:(id)a3
{
  id v4;
  PUParallaxLayerStackViewModel *v5;

  v4 = a3;
  v5 = -[PUParallaxLayerStackViewModel initWithCompoundLayerStack:style:deviceOrientation:]([PUParallaxLayerStackViewModel alloc], "initWithCompoundLayerStack:style:deviceOrientation:", v4, 0, 1);

  -[PUParallaxLayerStackDebugViewController setViewModel:](self, "setViewModel:", v5);
}

- (void)loadLayerStack:(id)a3 segmentationItem:(id)a4
{
  id v6;
  id v7;
  PUParallaxLayerStackViewModel *v8;
  PUParallaxLayerStackViewModelUpdater *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PUParallaxLayerStackViewModel initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:]([PUParallaxLayerStackViewModel alloc], "initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:", v6, 0, v7, 1);

  -[PUParallaxLayerStackDebugViewController setViewModel:](self, "setViewModel:", v8);
  v9 = -[PUParallaxLayerStackViewModelUpdater initWithSegmentationItem:]([PUParallaxLayerStackViewModelUpdater alloc], "initWithSegmentationItem:", v6);

  -[PUParallaxLayerStackDebugViewController setViewModelUpdater:](self, "setViewModelUpdater:", v9);
}

- (void)setViewModel:(id)a3
{
  PUParallaxLayerStackViewModel *v5;
  char v6;
  void *v7;
  PUParallaxLayerStackViewModel *v8;

  v8 = (PUParallaxLayerStackViewModel *)a3;
  v5 = self->_viewModel;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = -[PUParallaxLayerStackViewModel isEqual:](v5, "isEqual:", v8);

    if ((v6 & 1) == 0)
    {
      -[PUParallaxLayerStackViewModel unregisterChangeObserver:context:](self->_viewModel, "unregisterChangeObserver:context:", self, "LayerStackViewModelObservationContext");
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PUParallaxLayerStackViewModel registerChangeObserver:context:](v8, "registerChangeObserver:context:", self, "LayerStackViewModelObservationContext");
      -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setViewModel:", v8);

      -[PUParallaxLayerStackDebugViewController _updateDateTimeView](self, "_updateDateTimeView");
    }
  }

}

- (void)toggleParallaxEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke;
  v12[3] = &unk_1E58ABD10;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.2);
  -[PUParallaxLayerStackDebugViewController parallaxEnabledButton](self, "parallaxEnabledButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0DC3870];
  -[PUParallaxLayerStackViewModel currentLayerStack](self->_viewModel, "currentLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "parallaxDisabled"))
    v9 = CFSTR("square.stack.3d.up.slash");
  else
    v9 = CFSTR("square.stack.3d.up");
  objc_msgSend(v7, "systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v10);

  -[PUParallaxLayerStackDebugViewController parallaxEnabledButton](self, "parallaxEnabledButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfiguration:", v6);

}

- (void)_presentSheetController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = v4;
  v8 = v7;
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissSheetController_);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItems:", v10);

  }
  objc_msgSend(v8, "setModalPresentationStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sheetPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDetents:", v14);

  objc_msgSend(v8, "sheetPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPrefersGrabberVisible:", v6 == 0);

  -[PUParallaxLayerStackDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_dismissSheetController:(id)a3
{
  -[PUParallaxLayerStackDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showLooks:(id)a3
{
  void *v4;
  void *v5;
  PUParallaxLayerStackDebugStyleTableViewController *v6;

  v6 = -[PUParallaxLayerStackDebugStyleTableViewController initWithStyle:]([PUParallaxLayerStackDebugStyleTableViewController alloc], "initWithStyle:", 0);
  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugStyleTableViewController setViewModel:](v6, "setViewModel:", v4);

  -[PUParallaxLayerStackDebugViewController viewModelUpdater](self, "viewModelUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugStyleTableViewController setViewModelUpdater:](v6, "setViewModelUpdater:", v5);

  -[PUParallaxLayerStackDebugStyleTableViewController setTitle:](v6, "setTitle:", CFSTR("Looks"));
  -[PUParallaxLayerStackDebugViewController _presentSheetController:](self, "_presentSheetController:", v6);

}

- (void)showLayerList:(id)a3
{
  void *v4;
  PUParallaxLayerStackDebugTableViewController *v5;

  v5 = -[PUParallaxLayerStackDebugTableViewController initWithStyle:]([PUParallaxLayerStackDebugTableViewController alloc], "initWithStyle:", 0);
  -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugTableViewController setLayerStackView:](v5, "setLayerStackView:", v4);

  -[PUParallaxLayerStackDebugTableViewController setTitle:](v5, "setTitle:", CFSTR("Layers"));
  -[PUParallaxLayerStackDebugViewController _presentSheetController:](self, "_presentSheetController:", v5);

}

- (void)showColorPalettes:(id)a3
{
  PUParallaxLayerStackDebugPaletteViewController *v4;

  v4 = objc_alloc_init(PUParallaxLayerStackDebugPaletteViewController);
  -[PUParallaxLayerStackDebugPaletteViewController setTitle:](v4, "setTitle:", CFSTR("Color Palettes"));
  -[PUParallaxLayerStackDebugViewController _presentSheetController:](self, "_presentSheetController:", v4);

}

- (void)shareLayerStack:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke;
  v5[3] = &unk_1E58A8DE8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityAlertWithConfirmAction:abortAction:", v5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)tapToRadar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[PUParallaxLayerStackDebugViewController asset](self, "asset", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUParallaxLayerStackDebugViewController showProgressIndicator:](self, "showProgressIndicator:", CFSTR("Preparing Attachments…"));
    -[PUParallaxLayerStackViewModel compoundLayerStack](self->_viewModel, "compoundLayerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugViewController asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewModel segmentationItem](self->_viewModel, "segmentationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:](PUWallpaperRadarAttachmentProvider, "radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:", v6, 0, v5, v7, 0, 0, 10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PUParallaxLayerStackDebugViewController_tapToRadar___block_invoke;
    v9[3] = &unk_1E58AB060;
    v9[4] = self;
    objc_msgSend(v8, "setCompletionHandler:", v9);
    PXFileRadarWithConfiguration();

  }
}

- (void)renderAfterVisibleFrameChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PUParallaxLayerStackDebugViewController viewModelUpdater](self, "viewModelUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderOnscreenModelAfterVisibleFrameChange:allViewModels:", v4, v6);

}

- (void)renderAfterStyleChange
{
  void *v3;
  id v4;

  -[PUParallaxLayerStackDebugViewController viewModelUpdater](self, "viewModelUpdater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderOnscreenModelAfterStyleChange:", v3);

}

- (void)panGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PUParallaxLayerStackViewModel *viewModel;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[8];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 2)
  {
    -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v6);

    -[PUParallaxLayerStackViewModel visibleFrame](self->_viewModel, "visibleFrame");
    -[PUParallaxLayerStackViewModel extendedImageRect](self->_viewModel, "extendedImageRect");
    -[PUParallaxLayerStackDebugViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");

    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    PXRectShiftedInsideConstrainingRect();
    viewModel = self->_viewModel;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PUParallaxLayerStackDebugViewController_panGesture___block_invoke;
    v14[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v14[4] = v9;
    v14[5] = v10;
    v14[6] = v11;
    v14[7] = v12;
    -[PUParallaxLayerStackViewModel performChanges:](viewModel, "performChanges:", v14);
    -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

    -[PUParallaxLayerStackDebugViewController renderAfterVisibleFrameChange](self, "renderAfterVisibleFrameChange");
  }
  else if (v5 == 1)
  {
    -[PUParallaxLayerStackViewModel visibleFrame](self->_viewModel, "visibleFrame");
    -[PUParallaxLayerStackDebugViewController setInitialVisibleRect:](self, "setInitialVisibleRect:");
  }

}

- (void)pinchGesture:(id)a3
{
  id v4;
  uint64_t v5;
  PUParallaxLayerStackViewModel *viewModel;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[8];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 2)
  {
    objc_msgSend(v4, "scale");
    -[PUParallaxLayerStackViewModel visibleFrame](self->_viewModel, "visibleFrame");
    -[PUParallaxLayerStackViewModel extendedImageRect](self->_viewModel, "extendedImageRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    -[PUParallaxLayerStackDebugViewController initialVisibleRect](self, "initialVisibleRect");
    PXRectShiftedInsideConstrainingRect();
    viewModel = self->_viewModel;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PUParallaxLayerStackDebugViewController_pinchGesture___block_invoke;
    v12[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v12[4] = v7;
    v12[5] = v8;
    v12[6] = v9;
    v12[7] = v10;
    -[PUParallaxLayerStackViewModel performChanges:](viewModel, "performChanges:", v12);
    -[PUParallaxLayerStackDebugViewController layerStackView](self, "layerStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

    -[PUParallaxLayerStackDebugViewController renderAfterVisibleFrameChange](self, "renderAfterVisibleFrameChange");
  }
  else if (v5 == 1)
  {
    -[PUParallaxLayerStackViewModel visibleFrame](self->_viewModel, "visibleFrame");
    -[PUParallaxLayerStackDebugViewController setInitialVisibleRect:](self, "setInitialVisibleRect:");
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  id v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v6 = a4;
  v9 = a3;
  if (a5 != "LayerStackViewModelObservationContext")
    goto LABEL_9;
  v19 = v9;
  v10 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugViewController.m"), 539, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v16);
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackDebugViewController.m"), 539, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v16, v18);

    goto LABEL_12;
  }
LABEL_4:
  v11 = objc_msgSend(v10, "currentLayerStackPropertiesChange");
  v12 = objc_msgSend(v10, "stylePropertiesChange");
  if (v11 & 0x10 | (unint64_t)(v6 & 0x200))
  {
    -[PUParallaxLayerStackDebugViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

  }
  if ((v12 & 0x11) != 0)
    -[PUParallaxLayerStackDebugViewController _updateDateTimeView](self, "_updateDateTimeView");

  v9 = v19;
LABEL_9:

}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater
{
  return self->_viewModelUpdater;
}

- (void)setViewModelUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_viewModelUpdater, a3);
}

- (PUParallaxLayerStackView)layerStackView
{
  return self->_layerStackView;
}

- (void)setLayerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_layerStackView, a3);
}

- (PUWallpaperPosterDateView)dateTimeView
{
  return self->_dateTimeView;
}

- (void)setDateTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeView, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (UIButton)parallaxEnabledButton
{
  return self->_parallaxEnabledButton;
}

- (void)setParallaxEnabledButton:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxEnabledButton, a3);
}

- (UIButton)looksButton
{
  return self->_looksButton;
}

- (void)setLooksButton:(id)a3
{
  objc_storeStrong((id *)&self->_looksButton, a3);
}

- (UIButton)layerListButton
{
  return self->_layerListButton;
}

- (void)setLayerListButton:(id)a3
{
  objc_storeStrong((id *)&self->_layerListButton, a3);
}

- (UIButton)colorPaletteButton
{
  return self->_colorPaletteButton;
}

- (void)setColorPaletteButton:(id)a3
{
  objc_storeStrong((id *)&self->_colorPaletteButton, a3);
}

- (UIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareButton, a3);
}

- (UIButton)radarButton
{
  return self->_radarButton;
}

- (void)setRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_radarButton, a3);
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (PUProgressIndicatorView)downloadProgressIndicator
{
  return self->_downloadProgressIndicator;
}

- (void)setDownloadProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressIndicator, a3);
}

- (CGRect)initialVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialVisibleRect.origin.x;
  y = self->_initialVisibleRect.origin.y;
  width = self->_initialVisibleRect.size.width;
  height = self->_initialVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialVisibleRect:(CGRect)a3
{
  self->_initialVisibleRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProgressIndicator, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_colorPaletteButton, 0);
  objc_storeStrong((id *)&self->_layerListButton, 0);
  objc_storeStrong((id *)&self->_looksButton, 0);
  objc_storeStrong((id *)&self->_parallaxEnabledButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_dateTimeView, 0);
  objc_storeStrong((id *)&self->_layerStackView, 0);
  objc_storeStrong((id *)&self->_viewModelUpdater, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __56__PUParallaxLayerStackDebugViewController_pinchGesture___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __54__PUParallaxLayerStackDebugViewController_panGesture___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __54__PUParallaxLayerStackDebugViewController_tapToRadar___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "showProgressIndicator:", CFSTR("Preparing…"));
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_2;
  block[3] = &unk_1E58ABD10;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v2 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("share-%@.imagestack"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "currentLayerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", v9, 0);
  v14 = 0;
  LODWORD(v7) = objc_msgSend(MEMORY[0x1E0D75198], "saveCompoundLayerStack:toURL:options:error:", v10, v8, 0xFFFFLL, &v14);
  v11 = v14;
  if ((_DWORD)v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_3;
    block[3] = &unk_1E58ABCA8;
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
  v2 = objc_alloc(MEMORY[0x1E0CB36C8]);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithItem:typeIdentifier:", v3, v4);

  v6 = objc_alloc(MEMORY[0x1E0D96D28]);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v7, 0);

  v10 = *MEMORY[0x1E0D96D88];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncludedActivityTypes:", v9);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 968);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke_2;
  v4[3] = &unk_1E58AB148;
  v4[4] = v1;
  return objc_msgSend(v2, "performChanges:", v4);
}

void __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  v3 = a2;
  objc_msgSend(v2, "currentLayerStack");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParallaxDisabled:", objc_msgSend(v4, "parallaxDisabled") ^ 1);

}

void __64__PUParallaxLayerStackDebugViewController_loadSegmentationItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  objc_msgSend(a2, "result:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Render layer stack stats: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v3, "compoundLayerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "debugRoundTripLayerStack");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "temporaryDirectory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("debugRoundTrip.layerStack"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeItemAtURL:error:", v13, 0);

      v15 = (void *)MEMORY[0x1E0D75198];
      objc_msgSend(v3, "compoundLayerStack");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v17 = objc_msgSend(v15, "saveCompoundLayerStack:toURL:options:error:", v16, v13, 0xFFFFLL, &v25);
      v18 = v25;

      if (v17)
      {
        v24 = v18;
        objc_msgSend(MEMORY[0x1E0D75198], "loadCompoundLayerStackFromURL:options:error:", v13, 0xFFFFLL, &v24);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v24;

        if (v19)
        {
          v8 = (void *)v19;
        }
        else
        {
          PLWallpaperGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v20;
            _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "Failed to load layer stack: %{public}@", buf, 0xCu);
          }

          objc_msgSend(v3, "compoundLayerStack");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        PLWallpaperGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Failed to write layer stack: %{public}@", buf, 0xCu);
        }

        v20 = v18;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "loadLayerStack:segmentationItem:", v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "layerStackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Render layer stack failed: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "layerStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);
  }

  objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

void __84__PUParallaxLayerStackDebugViewController_loadPartialSegmentationItem_loadingState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    PLWallpaperGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Render layer stack stats: %{public}@", buf, 0xCu);

    }
    v7 = objc_alloc(MEMORY[0x1E0D75348]);
    objc_msgSend(v3, "layerStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithPortraitLayerStack:landscapeLayerStack:", v8, 0);

    objc_msgSend(*(id *)(a1 + 32), "loadLayerStack:", v9);
    objc_msgSend(*(id *)(a1 + 32), "layerStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

  }
}

uint64_t __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke(double a1)
{
  NSObject *v2;
  uint8_t buf[4];
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Download progress: %g", buf, 0xCu);
  }

  return px_dispatch_on_main_queue();
}

void __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation loading state: %lx", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadPartialSegmentationItem:loadingState:", v5, a3);
}

void __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadSegmentationItem:", a2);
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to load segmentation item, error: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

uint64_t __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "showDownloadProgressIndicator");
  result = objc_msgSend(*(id *)(a1 + 32), "updateDownloadProgressIndicator:", *(double *)(a1 + 40));
  if (*(double *)(a1 + 40) == 1.0)
    return objc_msgSend(*(id *)(a1 + 32), "hideDowloadProgressIndicator");
  return result;
}

uint64_t __71__PUParallaxLayerStackDebugViewController_hideDowloadProgressIndicator__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint8_t v7[16];

  PLWallpaperGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUParallaxLayerStackDebugViewController.DownloadProgressIndicator", ", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "downloadProgressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setDownloadProgressIndicator:", 0);
}

uint64_t __64__PUParallaxLayerStackDebugViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint8_t v7[16];

  PLWallpaperGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUParallaxLayerStackDebugViewController.ProgressIndicator", ", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setProgressIndicator:", 0);
}

@end
