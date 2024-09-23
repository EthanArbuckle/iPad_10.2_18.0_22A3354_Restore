@implementation SBSUIWallpaperPreviewViewController

- (SBSUIWallpaperPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBSUIWallpaperPreviewViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperPreviewViewController;
  result = -[SBSUIWallpaperPreviewViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  if (result)
  {
    result->_motionEnabled = 1;
    result->_variant = -1;
  }
  return result;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3
{
  id v4;
  SBSUIWallpaperPreviewViewController *v5;
  uint64_t v6;
  PBUIWallpaperConfiguration *initialConfiguration;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  UIImage *v19;
  UIImage *wallpaperImage;
  UIImage *v21;
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;

  v4 = a3;
  v5 = -[SBSUIWallpaperPreviewViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65298]), "initWithVariant:type:", -1, 1);
    initialConfiguration = v5->_initialConfiguration;
    v5->_initialConfiguration = (PBUIWallpaperConfiguration *)v6;

    if (objc_msgSend(v4, "imageOrientation"))
    {
      objc_msgSend(MEMORY[0x1E0CEA618], "defaultFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      objc_msgSend(v4, "scale");
      objc_msgSend(v9, "setScale:");
      objc_msgSend(v4, "size");
      v11 = v10;
      v13 = v12;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v9, v10, v12);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__SBSUIWallpaperPreviewViewController_initWithImage___block_invoke;
      v23[3] = &unk_1E4C3FB00;
      v24 = v4;
      v25 = v11;
      v26 = v13;
      objc_msgSend(v14, "imageWithActions:", v23);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = objc_alloc(MEMORY[0x1E0D652C8]);
    v4 = objc_retainAutorelease(v4);
    v16 = objc_msgSend(v4, "CGImage");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = (UIImage *)objc_msgSend(v15, "initWithCGImage:scale:orientation:wallpaperFileURL:", v16, objc_msgSend(v4, "imageOrientation"), 0, v18);

    wallpaperImage = v5->_wallpaperImage;
    v5->_wallpaperImage = v19;
    v21 = v19;

    -[PBUIWallpaperConfiguration setWallpaperImage:](v5->_initialConfiguration, "setWallpaperImage:", v21);
  }

  return v5;
}

uint64_t __53__SBSUIWallpaperPreviewViewController_initWithImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (SBSUIWallpaperPreviewViewController)initWithWallpaperVariant:(int64_t)a3
{
  SBSUIWallpaperPreviewViewController *v4;
  uint64_t v5;
  PBUIWallpaperConfiguration *initialConfiguration;

  v4 = -[SBSUIWallpaperPreviewViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65298]), "initWithVariant:type:", -1, 1);
    initialConfiguration = v4->_initialConfiguration;
    v4->_initialConfiguration = (PBUIWallpaperConfiguration *)v5;

    v4->_variant = a3;
  }
  return v4;
}

- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  SBSUIWallpaperPreviewViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PBUIWallpaperConfiguration *initialConfiguration;

  v7 = a3;
  v8 = a4;
  v9 = -[SBSUIWallpaperPreviewViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    v11 = v10;
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x1E0D653B8]);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65298]), "initWithVariant:type:", -1, 2);
    initialConfiguration = v9->_initialConfiguration;
    v9->_initialConfiguration = (PBUIWallpaperConfiguration *)v12;

    -[PBUIWallpaperConfiguration setProceduralWallpaperInfo:](v9->_initialConfiguration, "setProceduralWallpaperInfo:", v11);
    objc_storeStrong((id *)&v9->_proceduralWallpaper, a3);
    objc_storeStrong((id *)&v9->_proceduralWallpaperOptions, a4);

  }
  return v9;
}

- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4 variant:(int64_t)a5 disableSegmentedControl:(BOOL)a6 enableButtons:(BOOL)a7 disableContents:(BOOL)a8
{
  id v14;
  id v15;
  SBSUIWallpaperPreviewViewController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PBUIWallpaperConfiguration *initialConfiguration;

  v14 = a3;
  v15 = a4;
  v16 = -[SBSUIWallpaperPreviewViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v16)
  {
    v17 = (void *)objc_msgSend(v14, "mutableCopy");
    v18 = v17;
    if (v15)
      objc_msgSend(v17, "setObject:forKey:", v15, *MEMORY[0x1E0D653B8]);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65298]), "initWithVariant:type:", -1, 2);
    initialConfiguration = v16->_initialConfiguration;
    v16->_initialConfiguration = (PBUIWallpaperConfiguration *)v19;

    -[PBUIWallpaperConfiguration setProceduralWallpaperInfo:](v16->_initialConfiguration, "setProceduralWallpaperInfo:", v18);
    objc_storeStrong((id *)&v16->_proceduralWallpaper, a3);
    objc_storeStrong((id *)&v16->_proceduralWallpaperOptions, a4);
    v16->_variant = a5;
    v16->_enableButtons = a7;
    v16->_disableContents = a8;

  }
  return v16;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4
{
  return -[SBSUIWallpaperPreviewViewController initWithImage:name:video:time:](self, "initWithImage:name:video:time:", a3, a4, 0, 0.0);
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4 video:(id)a5 time:(double)a6
{
  id v10;
  id v11;
  SBSUIWallpaperPreviewViewController *v12;
  id v13;
  uint64_t v14;
  NSString *name;
  SBSUIWallpaperPreviewViewController *v16;

  v10 = a4;
  v11 = a5;
  v12 = -[SBSUIWallpaperPreviewViewController initWithImage:](self, "initWithImage:", a3);
  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D652D0]);
    objc_msgSend(v13, "setName:", v10);
    objc_msgSend(v13, "setStillTimeInVideo:", a6);
    -[PBUIWallpaperConfiguration setWallpaperOptions:](v12->_initialConfiguration, "setWallpaperOptions:", v13);
    v14 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v14;

    objc_storeStrong((id *)&v12->_video, a5);
    if (v11)
      v12->_stillTimeInVideo = a6;
    v16 = v12;

  }
  return v12;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 video:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  SBSUIWallpaperPreviewViewController *v23;
  uint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint8_t buf[4];
  _BOOL4 v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v26 = a7;
  v27 = a8;
  v34 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a4;
  v15 = a3;
  SBLogWallpaper();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240706;
    v29 = v15 != 0;
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = v17;
    _os_log_impl(&dword_1A471F000, v16, OS_LOG_TYPE_DEFAULT, "Initializing full screen preview with given image: %{public}d and options: %{public}@ for variant: %{public}@", buf, 0x1Cu);

  }
  PBUIStringForWallpaperMode();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v15, v18, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v14, v18, 0);

  v21 = objc_alloc(MEMORY[0x1E0C99D80]);
  v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v13, v18, 0);
  LOWORD(v25) = a9;
  v23 = -[SBSUIWallpaperPreviewViewController initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:](self, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", v19, v20, a5, v22, v26, v27, v25);

  return v23;
}

- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[SBSUIWallpaperPreviewViewController initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:](self, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", a3, a4, a5, a6, a7, a8, v10);
}

- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9 disableParallax:(BOOL)a10
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  SBSUIWallpaperPreviewViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  _BOOL4 v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  SBLogWallpaper();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240706;
    v37 = v14 != 0;
    v38 = 2114;
    v39 = v16;
    v40 = 2114;
    v41 = v18;
    _os_log_impl(&dword_1A471F000, v17, OS_LOG_TYPE_DEFAULT, "Initializing full screen preview with given image: %{public}d and options: %{public}@ for variant: %{public}@", buf, 0x1Cu);

  }
  v19 = -[SBSUIWallpaperPreviewViewController init](self, "init");
  if ((unint64_t)objc_msgSend(v14, "count") >= 2)
  {
    -[SBSUIWallpaperPreviewViewController traitCollection](v19, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userInterfaceStyle");

  }
  PBUIStringForWallpaperMode();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBSUIWallpaperPreviewViewController initWithImage:](v19, "initWithImage:", v22);

  if (v23)
  {
    objc_storeStrong((id *)(v23 + 1008), a3);
    objc_storeStrong((id *)(v23 + 1072), a4);
    objc_storeStrong((id *)(v23 + 1096), a6);
    objc_msgSend(v16, "objectForKeyedSubscript:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(v23 + 1088);
    *(_QWORD *)(v23 + 1088) = v24;

    objc_msgSend(*(id *)(v23 + 992), "setWallpaperOptions:", *(_QWORD *)(v23 + 1088));
    objc_msgSend(*(id *)(v23 + 1088), "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    v28 = *(void **)(v23 + 1048);
    *(_QWORD *)(v23 + 1048) = v27;

    objc_msgSend(v15, "objectForKeyedSubscript:", v21);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(v23 + 1064);
    *(_QWORD *)(v23 + 1064) = v29;

    *(_QWORD *)(v23 + 1040) = a5;
    *(_BYTE *)(v23 + 1032) = objc_msgSend(*(id *)(v23 + 1088), "supportsCropping");
    *(_BYTE *)(v23 + 1104) = a8;
    *(_BYTE *)(v23 + 1105) = a9;
    *(_BYTE *)(v23 + 1106) = a10;
    if (*(_QWORD *)(v23 + 1064))
    {
      objc_msgSend(*(id *)(v23 + 1088), "stillTimeInVideo");
      *(_QWORD *)(v23 + 1080) = v31;
    }
    v32 = (id)v23;
  }

  return (SBSUIWallpaperPreviewViewController *)v23;
}

- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3
{
  return -[SBSUIWallpaperPreviewViewController initWithScrollableImage:video:time:](self, "initWithScrollableImage:video:time:", a3, 0, 0.0);
}

- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3 video:(id)a4 time:(double)a5
{
  id v9;
  SBSUIWallpaperPreviewViewController *v10;
  id v11;
  SBSUIWallpaperPreviewViewController *v12;

  v9 = a4;
  v10 = -[SBSUIWallpaperPreviewViewController initWithImage:](self, "initWithImage:", a3);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D652D0]);
    objc_msgSend(v11, "setStillTimeInVideo:", a5);
    -[PBUIWallpaperConfiguration setWallpaperOptions:](v10->_initialConfiguration, "setWallpaperOptions:", v11);
    v10->_allowScrolling = 1;
    objc_storeStrong((id *)&v10->_video, a4);
    if (v9)
      v10->_stillTimeInVideo = a5;
    v12 = v10;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[SBSUIWallpaperPreviewViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("parallaxEnabled"));
    objc_msgSend(v3, "setDelegate:", 0);
    if (_os_feature_enabled_impl())
    {
      -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDateView:", 0);

      -[SBFLockScreenDateViewController removeFromParentViewController](self->_dateViewController, "removeFromParentViewController");
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperPreviewViewController;
  -[SBSUIWallpaperPreviewViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
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
  uint64_t v12;
  SBSUIWallpaperPreviewView *v13;
  _SBSUIOrientedImageView *v14;
  _SBSUIOrientedImageView *homeScreenPreviewView;
  void *v16;
  double Width;
  double Height;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _SBSUIOrientedImageView *v23;
  void *v24;
  SBFLockScreenDateViewController *v25;
  SBFLockScreenDateViewController *dateViewController;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:](self, "_wallpaperViewWithFrame:", v5, v7, v9, v11);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v32, "parallaxEnabled");
  v13 = -[SBSUIWallpaperPreviewView initWithFrame:wallpaperView:disableParallax:]([SBSUIWallpaperPreviewView alloc], "initWithFrame:wallpaperView:disableParallax:", v32, self->_disableParallax, v5, v7, v9, v11);
  -[SBSUIWallpaperPreviewView setDelegate:](v13, "setDelegate:", self);
  -[SBSUIWallpaperPreviewViewController setView:](self, "setView:", v13);
  objc_msgSend(v32, "addObserver:forKeyPath:options:context:", self, CFSTR("parallaxEnabled"), 0, &SBParallaxEnabledChanged);
  -[SBSUIWallpaperPreviewViewController setMotionEnabled:](self, "setMotionEnabled:", v12);
  if (!self->_enableButtons)
  {
    -[SBSUIWallpaperPreviewView setIrisButton:](v13, "setIrisButton:", 0);
    -[SBSUIWallpaperPreviewView setParallaxButton:](v13, "setParallaxButton:", 0);
    -[SBSUIWallpaperPreviewView setCancelButton:](v13, "setCancelButton:", 0);
    -[SBSUIWallpaperPreviewView setSetButton:](v13, "setSetButton:", 0);
  }
  if (self->_variant == 1)
    goto LABEL_22;
  if (!self->_disableContents)
  {
    v33.origin.x = v5;
    v33.origin.y = v7;
    v33.size.width = v9;
    v33.size.height = v11;
    Width = CGRectGetWidth(v33);
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    Height = CGRectGetHeight(v34);
    if (Width >= Height)
      Width = Height;
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v9;
    v35.size.height = v11;
    v19 = CGRectGetWidth(v35);
    v36.origin.x = v5;
    v36.origin.y = v7;
    v36.size.width = v9;
    v36.size.height = v11;
    v20 = CGRectGetHeight(v36);
    if (v19 < v20)
      v19 = v20;
    SBSUIWallpaperGetPreview(0, 250, Width);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SBSUIWallpaperGetPreview(0, 378, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[_SBSUIOrientedImageView initWithFrame:]([_SBSUIOrientedImageView alloc], "initWithFrame:", v5, v7, v9, v11);
    -[_SBSUIOrientedImageView setAutoresizingMask:](v23, "setAutoresizingMask:", 18);
    -[_SBSUIOrientedImageView setPortraitImage:](v23, "setPortraitImage:", v21);
    -[_SBSUIOrientedImageView setLandscapeImage:](v23, "setLandscapeImage:", v22);
    -[SBSUIWallpaperPreviewViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v23);

    if (_os_feature_enabled_impl())
    {
      v25 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E0DA9E60]);
      dateViewController = self->_dateViewController;
      self->_dateViewController = v25;

      -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DA9E58], "timeFont");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCustomTimeFont:", v28);

      -[SBSUIWallpaperPreviewViewController legibilitySettings](self, "legibilitySettings");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLegibilitySettings:", v29);

      -[SBSUIWallpaperPreviewViewController addChildViewController:](self, "addChildViewController:", self->_dateViewController);
      -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDateView:", v27);

    }
    if (self->_variant == 1)
    {
LABEL_22:
      if (!self->_disableContents)
      {
        v14 = -[_SBSUIOrientedImageView initWithFrame:]([_SBSUIOrientedImageView alloc], "initWithFrame:", v5, v7, v9, v11);
        homeScreenPreviewView = self->_homeScreenPreviewView;
        self->_homeScreenPreviewView = v14;

        -[_SBSUIOrientedImageView setAutoresizingMask:](self->_homeScreenPreviewView, "setAutoresizingMask:", 18);
        -[SBSUIWallpaperPreviewViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", self->_homeScreenPreviewView);

        -[SBSUIWallpaperPreviewViewController _applyHomeScreenPreview](self, "_applyHomeScreenPreview");
      }
    }
  }
  -[SBSUIWallpaperPreviewViewController _enableIrisOrParallaxIfEligible](self, "_enableIrisOrParallaxIfEligible");
  if ((objc_msgSend(v32, "parallaxEnabled") & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v32, "setAutomaticallyEnablesParallax:", 0);
  objc_msgSend(v32, "legibilitySettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    -[SBSUIWallpaperPreviewViewController providerLegibilitySettingsChanged:](self, "providerLegibilitySettingsChanged:", v32);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSUIWallpaperPreviewViewController;
  -[SBSUIWallpaperPreviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBSUIWallpaperPreviewViewController _updateDateView](self, "_updateDateView");
  -[SBSUIWallpaperPreviewViewController _enableIrisOrParallaxIfEligible](self, "_enableIrisOrParallaxIfEligible");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSUIWallpaperPreviewViewController;
  -[SBSUIWallpaperPreviewViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBSUIWallpaperPreviewViewController _stopDateTimer](self, "_stopDateTimer");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperPreviewViewController;
  -[SBSUIWallpaperPreviewViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  SBLogWallpaper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperTypeDescription](self, "_wallpaperTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "PRESENTING Wallpaper Preview View Controller: %{public}@", buf, 0xCu);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperPreviewViewController;
  -[SBSUIWallpaperPreviewViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  SBLogWallpaper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperTypeDescription](self, "_wallpaperTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "DISMISSING Wallpaper Preview View Controller: %{public}@", buf, 0xCu);

  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *wallpaperImage;
  AVURLAsset *v11;
  AVURLAsset *video;
  PBUIWallpaperOptions *v13;
  PBUIWallpaperOptions *options;
  void *v15;
  NSUInteger v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  -[SBSUIWallpaperPreviewViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (!v6)
    return;
  if (-[NSDictionary count](self->_wallpaperImageDict, "count") >= 2)
  {
    -[SBSUIWallpaperPreviewViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInterfaceStyle");

    PBUIStringForWallpaperMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_wallpaperImageDict, "objectForKeyedSubscript:", v8);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    wallpaperImage = self->_wallpaperImage;
    self->_wallpaperImage = v9;

    if (-[NSDictionary count](self->_videoDict, "count") >= 2)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_videoDict, "objectForKeyedSubscript:", v8);
      v11 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
      video = self->_video;
      self->_video = v11;

    }
    if (-[NSDictionary count](self->_optionsDict, "count") >= 2)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_optionsDict, "objectForKeyedSubscript:", v8);
      v13 = (PBUIWallpaperOptions *)objc_claimAutoreleasedReturnValue();
      options = self->_options;
      self->_options = v13;

    }
  }
  if (-[NSDictionary count](self->_wallpaperImageDict, "count") > 1)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:](self, "_wallpaperViewWithFrame:", v19, v21, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;
    if (v26)
    {
      objc_msgSend(v26, "setDelegate:", self);
      objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, CFSTR("parallaxEnabled"), 0, &SBParallaxEnabledChanged);
      objc_msgSend(v15, "setParallaxEnabled:", -[SBSUIWallpaperPreviewViewController motionEnabled](self, "motionEnabled"));
      if (self->_video)
      {
        v27 = v15;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;

        objc_msgSend(v29, "irisGestureRecognizer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "irisButton");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setEnabled:", objc_msgSend(v32, "isSelected"));

      }
      -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setWallpaperView:", v15);

    }
    goto LABEL_18;
  }
  -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "enableWallpaperDimming"))
  {
    v16 = -[NSDictionary count](self->_wallpaperImageDict, "count");

    if (v16 != 1)
      goto LABEL_19;
    goto LABEL_11;
  }
LABEL_18:

LABEL_19:
  if (self->_variant == 1 && !self->_disableContents)
    -[SBSUIWallpaperPreviewViewController _applyHomeScreenPreview](self, "_applyHomeScreenPreview");
}

- (id)_wallpaperConfigurationManager
{
  PBUIWallpaperConfigurationManager *wallpaperConfigurationManager;
  PBUIWallpaperConfigurationManager *v4;
  PBUIWallpaperConfigurationManager *v5;
  id v6;

  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (!wallpaperConfigurationManager)
  {
    v4 = (PBUIWallpaperConfigurationManager *)objc_alloc_init(MEMORY[0x1E0D652A0]);
    v5 = self->_wallpaperConfigurationManager;
    self->_wallpaperConfigurationManager = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0D652A8]);
    -[PBUIWallpaperConfigurationManager setEnableWallpaperDimming:](self->_wallpaperConfigurationManager, "setEnableWallpaperDimming:", objc_msgSend(v6, "enableWallpaperDimming"));

    wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  }
  return wallpaperConfigurationManager;
}

- (id)_wallpaperTypeDescription
{
  int64_t v3;
  NSDictionary *proceduralWallpaperOptions;
  NSDictionary *proceduralWallpaper;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = -[SBSUIWallpaperPreviewViewController _wallpaperType](self, "_wallpaperType");
  switch(v3)
  {
    case 1:
      v8 = 1000;
LABEL_11:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "description");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v8 = 1064;
      goto LABEL_11;
    case 2:
      proceduralWallpaperOptions = self->_proceduralWallpaperOptions;
      v13[0] = CFSTR("proceduralWallpaperOptions");
      v13[1] = CFSTR("proceduralWallpaper");
      proceduralWallpaper = self->_proceduralWallpaper;
      if (!proceduralWallpaperOptions)
        proceduralWallpaperOptions = (NSDictionary *)MEMORY[0x1E0C9AA70];
      if (!proceduralWallpaper)
        proceduralWallpaper = (NSDictionary *)MEMORY[0x1E0C9AA70];
      v14[0] = proceduralWallpaperOptions;
      v14[1] = proceduralWallpaper;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = CFSTR("(NO CONTEXT)");
      break;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  PBUIStringForWallpaperType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ : %@"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)_wallpaperType
{
  if (self->_proceduralWallpaper)
    return 2;
  if (self->_video)
    return 3;
  return self->_wallpaperImage != 0;
}

- (double)_parallaxFactor
{
  void *v2;
  double v3;
  double v4;

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (objc_msgSend(v2, "parallaxEnabled"))
  {
    objc_msgSend(v2, "parallaxFactor");
    v3 = v4;
  }

  return v3;
}

- (void)setWallpaperForLocations:(int64_t)a3
{
  -[SBSUIWallpaperPreviewViewController setWallpaperForLocations:completionHandler:](self, "setWallpaperForLocations:completionHandler:", a3, 0);
}

- (void)setWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD block[5];
  id v8;
  int64_t v9;

  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[SBSUIWallpaperPreviewViewController _setWallpaperForLocationsOnMainThread:completionHandler:](self, "_setWallpaperForLocationsOnMainThread:completionHandler:", a3, v6);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SBSUIWallpaperPreviewViewController_setWallpaperForLocations_completionHandler___block_invoke;
    block[3] = &unk_1E4C3FB28;
    block[4] = self;
    v9 = a3;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __82__SBSUIWallpaperPreviewViewController_setWallpaperForLocations_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWallpaperForLocationsOnMainThread:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_setWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  unint64_t v7;
  void (**v8)(id, id);

  v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBSUIWallpaperPreviewViewController _logWallpaperChangeForLocations:](self, "_logWallpaperChangeForLocations:", a3);
  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wallpaperType");
  if (v7 <= 5)
  {
    if (((1 << v7) & 0xB) != 0)
    {
      -[SBSUIWallpaperPreviewViewController setImageWallpaperForLocations:completionHandler:](self, "setImageWallpaperForLocations:completionHandler:", a3, v8);
    }
    else if (((1 << v7) & 0x30) != 0)
    {
      if (v8)
        v8[2](v8, v8);
    }
    else
    {
      -[SBSUIWallpaperPreviewViewController _setProceduralWallpaperForLocationsOnMainThread:completionHandler:](self, "_setProceduralWallpaperForLocationsOnMainThread:completionHandler:", a3, v8);
    }
  }

}

- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5
{
  -[SBSUIWallpaperPreviewViewController setWallpaperImages:options:locations:completionHandler:](self, "setWallpaperImages:options:locations:completionHandler:", a3, a4, a5, 0);
}

- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  int64_t v18;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_msgSend(a3, "copy");
  v13 = (void *)objc_msgSend(v11, "copy");

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[SBSUIWallpaperPreviewViewController _setWallpaperImagesOnMainThread:options:locations:completionHandler:](self, "_setWallpaperImagesOnMainThread:options:locations:completionHandler:", v12, v13, a5, v10);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__SBSUIWallpaperPreviewViewController_setWallpaperImages_options_locations_completionHandler___block_invoke;
    block[3] = &unk_1E4C3FB50;
    block[4] = self;
    v15 = v12;
    v16 = v13;
    v18 = a5;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __94__SBSUIWallpaperPreviewViewController_setWallpaperImages_options_locations_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWallpaperImagesOnMainThread:options:locations:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_setWallpaperImagesOnMainThread:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  uint64_t v26;
  BOOL v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBSUIWallpaperPreviewViewController _displaySettingWallpaperHUD](self, "_displaySettingWallpaperHUD");
  -[SBSUIWallpaperPreviewViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceStyle");

  if (v14 == 1)
    v15 = 1;
  else
    v15 = 2 * (v14 == 2);
  v16 = -[SBSUIWallpaperPreviewViewController irisEnabled](self, "irisEnabled");
  if (!-[NSDictionary count](self->_videoDict, "count"))
    v16 = 0;
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__SBSUIWallpaperPreviewViewController__setWallpaperImagesOnMainThread_options_locations_completionHandler___block_invoke;
  v21[3] = &unk_1E4C3FB78;
  v27 = v16;
  v22 = v10;
  v23 = v11;
  v25 = a5;
  v26 = v15;
  v24 = v12;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(v17, v21);

}

uint64_t __107__SBSUIWallpaperPreviewViewController__setWallpaperImagesOnMainThread_options_locations_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 1) != 0 && !*(_BYTE *)(a1 + 72))
  {
    SBSUIWallpaperClearVideo();
    v2 = *(_QWORD *)(a1 + 56);
  }
  SBSUIWallpaperSetImages(*(void **)(a1 + 32), *(void **)(a1 + 40), v2, *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setImageWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD block[5];
  id v8;
  int64_t v9;

  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[SBSUIWallpaperPreviewViewController _setImageWallpaperForLocationsOnMainThread:completionHandler:](self, "_setImageWallpaperForLocationsOnMainThread:completionHandler:", a3, v6);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__SBSUIWallpaperPreviewViewController_setImageWallpaperForLocations_completionHandler___block_invoke;
    block[3] = &unk_1E4C3FB28;
    block[4] = self;
    v9 = a3;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __87__SBSUIWallpaperPreviewViewController_setImageWallpaperForLocations_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setImageWallpaperForLocationsOnMainThread:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_setImageWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double stillTimeInVideo;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  AVURLAsset *video;
  AVURLAsset *v32;
  NSUInteger v33;
  NSObject *v34;
  unint64_t v35;
  _BOOL8 v36;
  void *v37;
  NSDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  NSDictionary *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSDictionary *v49;
  void *v50;
  void *v51;
  void *v52;
  NSDictionary *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSDictionary *optionsDict;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _BOOL4 v76;
  unsigned int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  BOOL v81;
  _BOOL4 v82;
  int64_t v83;
  void *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  id v90;
  int64_t v91;
  double v92;
  double v93;
  double v94;
  double v95;
  BOOL v96;
  BOOL v97;
  char v98;
  _QWORD block[4];
  id v100;
  SBSUIWallpaperPreviewViewController *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  char v106;

  v85 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperPreviewViewController wallpaperImage](self, "wallpaperImage");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  -[SBSUIWallpaperPreviewViewController _parallaxFactor](self, "_parallaxFactor");
  v10 = v9;
  objc_msgSend(v6, "cropZoomScale");
  v12 = v11;
  objc_msgSend(v6, "cropRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v6, "supportsCropping");
  v22 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  stillTimeInVideo = 0.0;
  if ((a3 & 1) == 0 || !-[SBSUIWallpaperPreviewViewController irisEnabled](self, "irisEnabled"))
  {
LABEL_12:
    v82 = 0;
    v27 = 0;
    goto LABEL_13;
  }
  if (self->_variant == -1)
  {
    video = self->_video;
    v32 = video;
    if (video)
    {
      v27 = v32;
      stillTimeInVideo = self->_stillTimeInVideo;
      v82 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v24 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  objc_msgSend(v26, "videoFileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v27 != 0;

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0C8B3C0];
    objc_msgSend(v26, "videoFileURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "assetWithURL:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stillTimeInVideo");
    stillTimeInVideo = v30;
  }

LABEL_13:
  if (!v7)
  {
    objc_msgSend(v6, "untreatedWallpaperImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[SBSUIWallpaperPreviewViewController irisEnabled](self, "irisEnabled"))
  {
    v33 = -[NSDictionary count](self->_videoDict, "count");
    if ((a3 & 1) != 0 && v33 >= 2)
    {
      dispatch_get_global_queue(0, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke;
      block[3] = &unk_1E4C3FBA0;
      v102 = v14;
      v103 = v16;
      v104 = v18;
      v105 = v20;
      v100 = v8;
      v101 = self;
      v106 = v21;
      dispatch_async(v34, block);

    }
  }
  v35 = v22 - 1;
  v83 = a3;
  v84 = v6;
  if (-[NSDictionary count](self->_wallpaperImageDict, "count") < 2)
  {
    v81 = v7 == 0;
    -[SBSUIWallpaperPreviewViewController _displaySettingWallpaperHUD](self, "_displaySettingWallpaperHUD");
    v66 = (void *)MEMORY[0x1E0D652D0];
    v67 = (void *)-[NSString copy](self->_name, "copy");
    v68 = v8;
    optionsDict = self->_optionsDict;
    PBUIStringForWallpaperMode();
    v70 = v27;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](optionsDict, "objectForKeyedSubscript:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "wallpaperKitData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v67, v21, v35 < 2, v82, 0, 1, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v68;
    v58 = v70;

    dispatch_get_global_queue(0, 0);
    v75 = objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke_2;
    v86[3] = &unk_1E4C3FBC8;
    v96 = v82;
    v91 = a3;
    v97 = v81;
    v92 = v14;
    v93 = v16;
    v94 = v18;
    v95 = v20;
    v87 = v68;
    v98 = v21;
    v88 = v70;
    v89 = v74;
    v90 = v85;
    v59 = v74;
    dispatch_async(v75, v86);

    v65 = v84;
    v57 = v87;
  }
  else
  {
    v36 = v35 < 2;
    v76 = v35 < 2;
    v37 = (void *)MEMORY[0x1E0D652D0];
    v79 = v27;
    v38 = self->_optionsDict;
    PBUIStringForWallpaperMode();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v8;
    v42 = self->_optionsDict;
    PBUIStringForWallpaperMode();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "wallpaperKitData");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v21;
    v77 = v21;
    v47 = (void *)v45;
    objc_msgSend(v37, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v41, v46, v36, v82, 1, 0, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v45);
    v78 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)MEMORY[0x1E0D652D0];
    v49 = self->_optionsDict;
    PBUIStringForWallpaperMode();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "name");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = self->_optionsDict;
    PBUIStringForWallpaperMode();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "wallpaperKitData");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v52, v77, v76, v82, 2, 0, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v79;
    v59 = (id)v78;

    v60 = objc_alloc(MEMORY[0x1E0C99D80]);
    PBUIStringForWallpaperMode();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v60, "initWithObjectsAndKeys:", v78, v61, v57, v62, 0);

    v64 = v80;
    v65 = v84;
    -[SBSUIWallpaperPreviewViewController setWallpaperImages:options:locations:completionHandler:](self, "setWallpaperImages:options:locations:completionHandler:", self->_wallpaperImageDict, v63, v83, v85);

  }
}

void __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  CGRect v16;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v3 = 1.0 / v2;
  objc_msgSend(*(id *)(a1 + 32), "size");
  CGAffineTransformMakeScale(&v15, v3, 1.0 / v4);
  v16 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 48), &v15);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  PBUIStringForWallpaperMode();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBSUIWallpaperSetVideoWithWallpaperMode(v11, *(unsigned __int8 *)(a1 + 80), 1, x, y, width, height);

  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  PBUIStringForWallpaperMode();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBSUIWallpaperSetVideoWithWallpaperMode(v14, *(unsigned __int8 *)(a1 + 80), 2, x, y, width, height);

}

uint64_t __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  CGFloat v4;
  double v5;
  uint64_t result;
  CGAffineTransform v7;
  CGRect v8;

  v2 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(a1 + 104))
  {
    if ((v2 & 1) != 0)
    {
      if (!*(_BYTE *)(a1 + 105))
        SBSUIWallpaperClearVideo();
      objc_msgSend(*(id *)(a1 + 32), "size");
      v4 = 1.0 / v3;
      objc_msgSend(*(id *)(a1 + 32), "size");
      CGAffineTransformMakeScale(&v7, v4, 1.0 / v5);
      v8 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 72), &v7);
      SBSUIWallpaperSetVideo(*(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 106), v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
    }
  }
  else if ((v2 & 1) != 0)
  {
    SBSUIWallpaperClearVideo();
  }
  SBSUIWallpaperSetImage(*(void **)(a1 + 32), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setProceduralWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  int64_t v17;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBSUIWallpaperPreviewViewController _displaySettingWallpaperHUD](self, "_displaySettingWallpaperHUD");
  v7 = (void *)-[NSDictionary copy](self->_proceduralWallpaper, "copy");
  v8 = (void *)-[NSDictionary copy](self->_proceduralWallpaperOptions, "copy");
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__SBSUIWallpaperPreviewViewController__setProceduralWallpaperForLocationsOnMainThread_completionHandler___block_invoke;
  v13[3] = &unk_1E4C3FBF0;
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v17 = a3;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __105__SBSUIWallpaperPreviewViewController__setProceduralWallpaperForLocationsOnMainThread_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  SBSUIMagicWallpaperSetWithOptions(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_applyHomeScreenPreview
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  double Height;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  if (self->_homeScreenPreviewView)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    Width = CGRectGetWidth(v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    Height = CGRectGetHeight(v20);
    if (Width >= Height)
      Width = Height;
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    v14 = CGRectGetWidth(v21);
    v22.origin.x = v5;
    v22.origin.y = v7;
    v22.size.width = v9;
    v22.size.height = v11;
    v15 = CGRectGetHeight(v22);
    if (v14 >= v15)
      v16 = v14;
    else
      v16 = v15;
    SBSUIWallpaperGetPreview(1u, 704, Width);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    SBSUIWallpaperGetPreview(1u, 832, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBSUIOrientedImageView setPortraitImage:](self->_homeScreenPreviewView, "setPortraitImage:", v18);
    -[_SBSUIOrientedImageView setLandscapeImage:](self->_homeScreenPreviewView, "setLandscapeImage:", v17);

  }
}

- (SBFWallpaperOptions)wallpaperOptions
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  double v21;

  v3 = (void *)-[PBUIWallpaperOptions copy](self->_options, "copy");
  -[SBSUIWallpaperPreviewViewController _wallpaperViewIfLoaded](self, "_wallpaperViewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cropRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cropZoomScale");
    v16 = v15;

    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "parallaxEnabled");

    v19 = 0.0;
    if (v18)
    {
      -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "parallaxFactor");
      v19 = v21;

    }
    objc_msgSend(v3, "setCropRect:", v7, v9, v11, v13);
    objc_msgSend(v3, "setZoomScale:", v16);
    objc_msgSend(v3, "setParallaxFactor:", v19);
  }
  return (SBFWallpaperOptions *)v3;
}

- (void)setIrisEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  if (self->_irisEnabled != a3)
  {
    -[SBSUIWallpaperPreviewViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("irisEnabled"));
    self->_irisEnabled = v3;
    -[SBSUIWallpaperPreviewViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("irisEnabled"));
  }
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "irisButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v3);

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "irisGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEnabled:", v3);
  if (v3)
    -[SBSUIWallpaperPreviewViewController setMotionEnabled:](self, "setMotionEnabled:", 0);
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayInstructionsForEffect:enabled:animated:", 1, v3, 1);

}

- (void)setMotionEnabled:(BOOL)a3
{
  -[SBSUIWallpaperPreviewViewController setMotionEnabled:updateParallaxOnWallpaperView:](self, "setMotionEnabled:updateParallaxOnWallpaperView:", a3, 1);
}

- (void)setMotionEnabled:(BOOL)a3 updateParallaxOnWallpaperView:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  if (self->_motionEnabled != a3)
  {
    -[SBSUIWallpaperPreviewViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("motionEnabled"));
    self->_motionEnabled = v5;
    -[SBSUIWallpaperPreviewViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("motionEnabled"));
  }
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parallaxButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", v5);

  if (v5)
    -[SBSUIWallpaperPreviewViewController setIrisEnabled:](self, "setIrisEnabled:", 0);
  if (v4)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParallaxEnabled:", v5);

  }
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayInstructionsForEffect:enabled:animated:", 0, v5, 1);

}

- (_UILegibilitySettings)legibilitySettings
{
  void *v2;
  void *v3;

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v3;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  objc_msgSend(a3, "legibilitySettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperPreviewViewController _dateView](self, "_dateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v7);

  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForChangedSettings:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "providerLegibilitySettingsChanged:", self);

}

- (void)userDidTapOnIrisButton:(id)a3
{
  -[SBSUIWallpaperPreviewViewController setIrisEnabled:](self, "setIrisEnabled:", -[SBSUIWallpaperPreviewViewController irisEnabled](self, "irisEnabled", a3) ^ 1);
}

- (void)userDidTapOnParallaxButton:(id)a3
{
  -[SBSUIWallpaperPreviewViewController setMotionEnabled:](self, "setMotionEnabled:", -[SBSUIWallpaperPreviewViewController motionEnabled](self, "motionEnabled", a3) ^ 1);
}

- (void)userDidTapOnCancelButton:(id)a3
{
  id v4;

  -[SBSUIWallpaperPreviewViewController previewDelegate](self, "previewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperPreviewViewControllerCancelButtonPressed:", self);

}

- (void)userDidTapOnSetButton:(id)a3
{
  NSObject *v4;
  NSDictionary *optionsDict;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSDictionary *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogWallpaper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    optionsDict = self->_optionsDict;
    v10 = 138543362;
    v11 = optionsDict;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "This is what we believe the wallpaper options are when the user tapped on the set button: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cropRect");
  -[SBSUIWallpaperPreviewViewController setCropRect:](self, "setCropRect:");

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cropZoomScale");
  -[SBSUIWallpaperPreviewViewController setZoomScale:](self, "setZoomScale:");

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parallaxFactor");
  -[SBSUIWallpaperPreviewViewController setParallaxFactor:](self, "setParallaxFactor:");

  -[SBSUIWallpaperPreviewViewController previewDelegate](self, "previewDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wallpaperPreviewViewControllerSetButtonPressed:", self);

}

- (id)_wallpaperViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PBUIWallpaperOptions *options;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  UIImage *wallpaperImage;
  AVURLAsset *video;
  void *v25;
  AVURLAsset *v27;
  UIImage *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  options = self->_options;
  if (options)
  {
    -[PBUIWallpaperOptions cropRect](options, "cropRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v40 = v15;
    -[PBUIWallpaperOptions zoomScale](self->_options, "zoomScale");
    v17 = v16;
    v18 = -[PBUIWallpaperOptions parallaxEnabled](self->_options, "parallaxEnabled");
    -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "enableWallpaperDimming"))
    {
      -[SBSUIWallpaperPreviewViewController traitCollection](self, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceStyle") == 2
         && -[NSDictionary count](self->_wallpaperImageDict, "count") == 1;

    }
    else
    {
      v21 = 0;
    }

    wallpaperImage = self->_wallpaperImage;
    video = self->_video;
    -[AVURLAsset URL](video, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", wallpaperImage, video, v25, self->_allowScrolling, self->_variant, v21, x, y, width, height, self->_stillTimeInVideo);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v10 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v40 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (self->_proceduralWallpaper)
  {
    -[SBSUIWallpaperPreviewViewController _proceduralWallpaperViewWithFrame:variant:configuration:](self, "_proceduralWallpaperViewWithFrame:variant:configuration:", 0, self->_initialConfiguration, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v18 = 1;
    v17 = 1.0;
    goto LABEL_12;
  }
  v27 = self->_video;
  v28 = self->_wallpaperImage;
  if (v27)
  {
    -[AVURLAsset URL](self->_video, "URL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v28, v27, v29, self->_allowScrolling, 0, 0, x, y, width, height, self->_stillTimeInVideo);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    objc_msgSend(MEMORY[0x1E0DA9E70], "currentMagnifyMode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "zoomFactor");
      v17 = 1.0 / v32;
    }
    else
    {
      v17 = 1.0;
    }

    v18 = 1;
    goto LABEL_12;
  }
  if (v28)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", self->_wallpaperImage, 0, 0, self->_allowScrolling, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (self->_variant == -1)
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65298]), "initWithVariant:type:", self->_variant, 0);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D652E8]), "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v39, self->_variant, 0, 0, 0, x, y, width, height);

    goto LABEL_7;
  }
  SBSUIWallpaperGetOptions();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1.0;
  if (objc_msgSend(v33, "supportsCropping"))
  {
    objc_msgSend(v33, "cropRect");
    v10 = v34;
    v12 = v35;
    v14 = v36;
    v40 = v37;
    objc_msgSend(v33, "zoomScale");
    v17 = v38;
  }
  v18 = objc_msgSend(v33, "parallaxEnabled");
  -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:variant:options:](self, "_wallpaperViewWithFrame:variant:options:", self->_variant, v33, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(v22, "setDelegate:", self);
  objc_msgSend(v22, "setParallaxEnabled:", v18);
  objc_msgSend(v22, "setCropRect:zoomScale:", v10, v12, v14, v40, v17);
  return v22;
}

- (id)_wallpaperViewWithFrame:(CGRect)a3 image:(id)a4 video:(id)a5 videoURL:(id)a6 stillTimeInVideo:(double)a7 supportsCropping:(BOOL)a8 variant:(int64_t)a9 needsWallpaperDimming:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  _BOOL4 v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  int64_t v46;
  uint64_t v47;
  objc_class *v48;
  void *v50;
  id v51;

  v10 = a10;
  v12 = a8;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = (unint64_t)a5;
  v21 = (unint64_t)a6;
  v51 = (id)v20;
  v22 = (v20 | v21) == 0;
  v23 = (v20 | v21) != 0;
  if (v22)
    v24 = 1;
  else
    v24 = 3;
  v25 = (objc_class *)MEMORY[0x1E0D65298];
  v26 = a4;
  v27 = (void *)objc_msgSend([v25 alloc], "initWithVariant:type:", a9, v24);
  v28 = objc_alloc(MEMORY[0x1E0D652C8]);
  v29 = objc_retainAutorelease(v26);
  v30 = objc_msgSend(v29, "CGImage");
  objc_msgSend(v29, "scale");
  v32 = v31;
  v33 = objc_msgSend(v29, "imageOrientation");

  v34 = (void *)objc_msgSend(v28, "initWithCGImage:scale:orientation:wallpaperFileURL:", v30, v33, 0, v32);
  objc_msgSend(v27, "setWallpaperImage:", v34);

  objc_msgSend(v27, "setVideoURL:", v21);
  v35 = objc_alloc_init(MEMORY[0x1E0D652D0]);
  objc_msgSend(v35, "setStillTimeInVideo:", a7);
  objc_msgSend(v35, "setSupportsCropping:", v12);
  objc_msgSend(v27, "setWallpaperOptions:", v35);
  objc_msgSend(v27, "setNeedsWallpaperDimmingTreatment:", v10);
  if (!v12)
  {
    if (v23)
    {
      v40 = objc_alloc(MEMORY[0x1E0D65268]);
      v41 = x;
      v42 = y;
      v43 = width;
      v44 = height;
      v45 = v27;
      v46 = a9;
      v47 = 16;
LABEL_13:
      v39 = (void *)objc_msgSend(v40, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v45, v46, 0, 0, v47, v41, v42, v43, v44);
      v38 = v51;
      goto LABEL_14;
    }
    v48 = (objc_class *)MEMORY[0x1E0D65288];
LABEL_12:
    v40 = [v48 alloc];
    v41 = x;
    v42 = y;
    v43 = width;
    v44 = height;
    v45 = v27;
    v46 = a9;
    v47 = 0;
    goto LABEL_13;
  }
  if (!v23)
  {
    v48 = (objc_class *)MEMORY[0x1E0D65280];
    goto LABEL_12;
  }
  v36 = objc_alloc(MEMORY[0x1E0D65278]);
  v37 = v36;
  v38 = v51;
  if (v51)
  {
    v39 = (void *)objc_msgSend(v36, "initWithFrame:configuration:wallpaperVideo:variant:", v27, v51, a9, x, y, width, height);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v21);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithFrame:configuration:wallpaperVideo:variant:", v27, v50, a9, x, y, width, height);

  }
LABEL_14:

  return v39;
}

- (id)_wallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 options:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *wallpaperImageDict;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSDictionary *v37;
  NSDictionary *optionsDict;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSDictionary *v44;
  NSDictionary *videoDict;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  double v52;
  void *v53;
  id v54;
  void *v55;
  NSDictionary *v56;
  NSDictionary *v57;
  id v58;
  void *v59;
  void *v60;
  NSDictionary *v61;
  NSDictionary *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a4, 51, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_wallpaperConfiguration, v13);
  -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasWallpaperImageForVariant:wallpaperMode:", a4, 2);

  v16 = 0;
  if (a4 == 1 && (v15 & 1) == 0)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "hasWallpaperImageForVariant:wallpaperMode:", 1, 0) ^ 1;

  }
  if ((v15 | v16) == 1)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperConfigurationManager](self, "_wallpaperConfigurationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:", a4, 51, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v13, "proceduralWallpaperInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_storeStrong((id *)&self->_proceduralWallpaper, v20);
    -[SBSUIWallpaperPreviewViewController _proceduralWallpaperViewWithFrame:variant:configuration:](self, "_proceduralWallpaperViewWithFrame:variant:configuration:", a4, v13, x, y, width, height);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v22 = (void *)v21;
    goto LABEL_12;
  }
  if (objc_msgSend(v13, "wallpaperType") == 4)
  {
    -[SBSUIWallpaperPreviewViewController _colorWallpaperViewWithFrame:variant:configuration:](self, "_colorWallpaperViewWithFrame:variant:configuration:", a4, v13, x, y, width, height);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v13, "wallpaperOriginalImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v13, "wallpaperImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "videoURL");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v25 = v24;
    v65 = v11;
    objc_msgSend(v19, "wallpaperOriginalImage");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(v19, "wallpaperImage");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v67 = (void *)v26;
    objc_msgSend(v19, "videoURL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0C99D80]);
    PBUIStringForWallpaperMode();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v25;
    v30 = (NSDictionary *)objc_msgSend(v27, "initWithObjectsAndKeys:", v25, v28, v26, v29, 0);
    wallpaperImageDict = self->_wallpaperImageDict;
    self->_wallpaperImageDict = v30;

    v32 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v13, "wallpaperOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wallpaperOptions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (NSDictionary *)objc_msgSend(v32, "initWithObjectsAndKeys:", v33, v34, v35, v36, 0);
    optionsDict = self->_optionsDict;
    self->_optionsDict = v37;

    v39 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v68);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v64);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (NSDictionary *)objc_msgSend(v39, "initWithObjectsAndKeys:", v40, v41, v42, v43, 0);
    videoDict = self->_videoDict;
    self->_videoDict = v44;

    -[SBSUIWallpaperPreviewViewController traitCollection](self, "traitCollection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceStyle");

    v48 = v67;
    if (v47 == 2)
    {
      v49 = v64;
    }
    else
    {
      v48 = v66;
      v49 = (void *)v68;
    }
    v50 = v48;
    v51 = v49;
    v11 = v65;
    objc_msgSend(v65, "stillTimeInVideo");
    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v50, 0, v51, objc_msgSend(v65, "supportsCropping"), a4, objc_msgSend(v13, "needsWallpaperDimmingTreatment"), x, y, width, height, v52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = (void *)v68;
    v24 = v66;

  }
  else
  {
    v54 = objc_alloc(MEMORY[0x1E0C99D80]);
    PBUIStringForWallpaperMode();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (NSDictionary *)objc_msgSend(v54, "initWithObjectsAndKeys:", v24, v55, 0);
    v57 = self->_wallpaperImageDict;
    self->_wallpaperImageDict = v56;

    v58 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v13, "wallpaperOptions");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (NSDictionary *)objc_msgSend(v58, "initWithObjectsAndKeys:", v59, v60, 0);
    v62 = self->_optionsDict;
    self->_optionsDict = v61;

    v53 = (void *)v68;
    objc_msgSend(v11, "stillTimeInVideo");
    -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v24, 0, v68, objc_msgSend(v11, "supportsCropping"), a4, objc_msgSend(v13, "needsWallpaperDimmingTreatment"), x, y, width, height, v63);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "parallaxFactor");
  objc_msgSend(v22, "setParallaxFactor:");

LABEL_12:
  return v22;
}

- (id)_proceduralWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v10;
  id v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (objc_class *)MEMORY[0x1E0D65248];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v11, a4, 0, 0, 0, x, y, width, height);

  objc_msgSend(v12, "prepareToAppear");
  return v12;
}

- (id)_colorWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0D65258];
  v7 = a5;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v7, a4, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v9, "prepareToAppear");
  return v9;
}

- (id)_wallpaperView
{
  void *v2;
  void *v3;

  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_wallpaperViewIfLoaded
{
  void *v2;
  void *v3;

  -[SBSUIWallpaperPreviewViewController _previewViewIfLoaded](self, "_previewViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_displaySettingWallpaperHUD
{
  SBSUIWallpaperProgressHUD *v3;
  SBSUIWallpaperProgressHUD *hud;
  SBSUIWallpaperProgressHUD *v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3 = objc_alloc_init(SBSUIWallpaperProgressHUD);
  hud = self->_hud;
  self->_hud = v3;

  v5 = self->_hud;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SETTING_WALLPAPER"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIWallpaperProgressHUD showMessage:inView:](v5, "showMessage:inView:", v6, v7);

}

- (void)_enableIrisOrParallaxIfEligible
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "parallaxEnabled");

  if ((v4 & 1) != 0 && v3)
  {
    -[SBSUIWallpaperPreviewViewController setIrisEnabled:](self, "setIrisEnabled:", 1);
  }
  else if (v6)
  {
    -[SBSUIWallpaperPreviewViewController setMotionEnabled:](self, "setMotionEnabled:", 1);
  }
}

- (void)_logWallpaperChangeForLocations:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  SBFWallpaperCoreAnalyticsLogger *v6;
  SBFWallpaperCoreAnalyticsLogger *wallpaperCoreAnalyticsLogger;
  id v8;
  id v9;
  void *v10;
  id v11;

  -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wallpaperType");
  v6 = (SBFWallpaperCoreAnalyticsLogger *)objc_alloc_init(MEMORY[0x1E0DA9F70]);
  wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  self->_wallpaperCoreAnalyticsLogger = v6;

  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 1 && -[SBSUIWallpaperPreviewViewController irisEnabled](self, "irisEnabled"))
  {
    v8 = v4;
    objc_opt_respondsToSelector();

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D652A8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDateWallpaperLastChanged:", v10);

  v11 = v4;
  AnalyticsSendEventLazy();

}

id __71__SBSUIWallpaperPreviewViewController__logWallpaperChangeForLocations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "parallaxEnabled"))
    v2 = objc_msgSend((id)objc_opt_class(), "allowsParallax");
  else
    v2 = 0;
  v22[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v22[1] = CFSTR("age");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "ageOfWallpaper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  v22[2] = CFSTR("type");
  PBUIStringForWallpaperType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v6;
  v22[3] = CFSTR("locations");
  PBUIStringForWallpaperLocations();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v7;
  v22[4] = CFSTR("parallax");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = *(_QWORD *)(a1 + 64);
  if (v11 < 2)
    goto LABEL_7;
  if (v11 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "objectForKeyedSubscript:", *MEMORY[0x1E0D653B8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D653B0]);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "length"))
    {
LABEL_14:

      return v10;
    }
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = CFSTR("bokehVariant");
LABEL_13:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);

    goto LABEL_14;
  }
  if (v11 == 3)
  {
LABEL_7:
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1096);
    PBUIStringForWallpaperMode();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 1048);
    v17 = v16;

    if (!objc_msgSend(v17, "length"))
      goto LABEL_14;
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = CFSTR("name");
    goto LABEL_13;
  }
  return v10;
}

- (id)_dateView
{
  void *v2;
  void *v3;

  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateDateView
{
  void *v3;
  void *v4;
  void *v5;

  -[SBSUIWallpaperPreviewViewController _stopDateTimer](self, "_stopDateTimer");
  -[SBSUIWallpaperPreviewViewController _previewView](self, "_previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

  -[SBSUIWallpaperPreviewViewController _startDateTimer](self, "_startDateTimer");
}

- (void)_stopDateTimer
{
  NSTimer *dateTimer;

  -[NSTimer invalidate](self->_dateTimer, "invalidate");
  dateTimer = self->_dateTimer;
  self->_dateTimer = 0;

}

- (void)_startDateTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *dateTimer;

  v3 = (void *)MEMORY[0x1E0C99E88];
  BSTimeUntilNextClockMinute();
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateDateView, 0, 0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  dateTimer = self->_dateTimer;
  self->_dateTimer = v4;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if (a6 == &SBParallaxEnabledChanged)
  {
    -[SBSUIWallpaperPreviewViewController _wallpaperView](self, "_wallpaperView", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSUIWallpaperPreviewViewController setMotionEnabled:updateParallaxOnWallpaperView:](self, "setMotionEnabled:updateParallaxOnWallpaperView:", objc_msgSend(v7, "parallaxEnabled"), 0);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSUIWallpaperPreviewViewController;
    -[SBSUIWallpaperPreviewViewController observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setColorSamplingEnabled:(BOOL)a3
{
  self->_colorSamplingEnabled = a3;
}

- (BOOL)colorSamplingEnabled
{
  return self->_colorSamplingEnabled;
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  return (SBFLegibilitySettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSUIWallpaperPreviewViewControllerDelegate)previewDelegate
{
  return (SBSUIWallpaperPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_previewDelegate);
}

- (void)setPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_previewDelegate, a3);
}

- (UIImage)wallpaperImage
{
  return (UIImage *)objc_getProperty(self, a2, 1000, 1);
}

- (BOOL)motionEnabled
{
  return self->_motionEnabled;
}

- (BOOL)irisEnabled
{
  return self->_irisEnabled;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperCoreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_homeScreenPreviewView, 0);
  objc_storeStrong((id *)&self->_hud, 0);
  objc_storeStrong((id *)&self->_optionsDict, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_videoDict, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperOptions, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaper, 0);
  objc_storeStrong((id *)&self->_wallpaperImageDict, 0);
  objc_storeStrong((id *)&self->_wallpaperImage, 0);
  objc_storeStrong((id *)&self->_initialConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_dateTimer, 0);
}

@end
