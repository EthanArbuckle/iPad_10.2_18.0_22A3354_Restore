@implementation VideosExtrasBackgroundViewController

- (VideosExtrasBackgroundViewController)initWithBackgroundElement:(id)a3
{
  id v4;
  VideosExtrasBackgroundViewController *v5;
  VideosExtrasBackgroundViewController *v6;
  uint64_t v7;
  NSArray *backgroundElements;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasBackgroundViewController;
  v5 = -[VideosExtrasBackgroundViewController init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundElements = v6->_backgroundElements;
    v6->_backgroundElements = (NSArray *)v7;

  }
  return v6;
}

- (VideosExtrasBackgroundViewController)initWithBackgroundElements:(id)a3
{
  id v5;
  VideosExtrasBackgroundViewController *v6;
  VideosExtrasBackgroundViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasBackgroundViewController;
  v6 = -[VideosExtrasBackgroundViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backgroundElements, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[VideosExtrasBackgroundViewController _invalidateTimer](self, "_invalidateTimer");
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasBackgroundViewController;
  -[VideosExtrasBackgroundViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPUArtworkView *v7;
  MPUArtworkView *imageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasBackgroundViewController;
  -[VideosExtrasBackgroundViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[VideosExtrasBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_backgroundElements, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "setBackgroundColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v6);

  }
  objc_msgSend(v3, "setClipsToBounds:", 1);
  v7 = (MPUArtworkView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B3A8]), "initForAutolayout");
  imageView = self->_imageView;
  self->_imageView = v7;

  -[MPUArtworkView setAutomaticallyApplyAspectConstraints:](self->_imageView, "setAutomaticallyApplyAspectConstraints:", 1);
  objc_msgSend(v3, "addSubview:", self->_imageView);
  -[VideosExtrasBackgroundViewController _updateImage](self, "_updateImage");
  -[VideosExtrasBackgroundViewController _initVignette](self, "_initVignette");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasBackgroundViewController;
  -[VideosExtrasBackgroundViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VideosExtrasBackgroundViewController _scheduleTimerIfNeeded](self, "_scheduleTimerIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasBackgroundViewController;
  -[VideosExtrasBackgroundViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[VideosExtrasBackgroundViewController _invalidateTimer](self, "_invalidateTimer");
  -[MPUArtworkView clearArtworkCatalogs](self->_imageView, "clearArtworkCatalogs");
}

- (void)_updateConstraintsForImageSize:(CGSize)a3 position:(unint64_t)a4
{
  double height;
  double width;
  void *v7;
  NSArray *v9;
  void *v10;
  void *v11;
  NSArray *imageConstraints;
  NSArray *v13;
  id v14;

  height = a3.height;
  width = a3.width;
  -[VideosExtrasBackgroundViewController view](self, "view", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  if (self->_imageConstraints)
  {
    objc_msgSend(v7, "removeConstraints:");
    v7 = v14;
  }
  if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_imageView, v14, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v9, "addObjectsFromArray:", v10);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_imageView, 7, 0, v14, 7, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v9, "addObject:", v11);

    imageConstraints = self->_imageConstraints;
    self->_imageConstraints = v9;
    v13 = v9;

    objc_msgSend(v14, "addConstraints:", self->_imageConstraints);
    v7 = v14;
  }

}

- (void)_updateImage
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t displayedImageElement;
  uint64_t v11;
  IKImageElement *v12;
  IKImageElement *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  MPUArtworkView *imageView;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = self->_backgroundElements;
  v4 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "images");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count") == 0;

        if (!v9)
        {
          objc_msgSend(v7, "images");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (objc_msgSend(v4, "count"))
  {
    displayedImageElement = (unint64_t)self->_displayedImageElement;
    if (displayedImageElement)
    {
      v11 = objc_msgSend(v4, "indexOfObject:");
      displayedImageElement = (v11 + 1) % (unint64_t)objc_msgSend(v4, "count");
    }
    objc_msgSend(v4, "objectAtIndex:", displayedImageElement);
    v12 = (IKImageElement *)objc_claimAutoreleasedReturnValue();
    v13 = self->_displayedImageElement;
    self->_displayedImageElement = v12;

    -[IKImageElement artworkCatalog](self->_displayedImageElement, "artworkCatalog");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasBackgroundViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v37.origin.x = v17;
    v37.origin.y = v19;
    v37.size.width = v21;
    v37.size.height = v23;
    if (CGRectIsEmpty(v37))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v21 = v25;
      v23 = v26;

    }
    objc_msgSend(v14, "setFittingSize:", v21, v23);
    objc_initWeak(&location, self);
    imageView = self->_imageView;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__VideosExtrasBackgroundViewController__updateImage__block_invoke;
    v28[3] = &unk_1E9F9DCC8;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v14, "setDestination:configurationBlock:", imageView, v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

void __52__VideosExtrasBackgroundViewController__updateImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didReceiveImage:", v4);

}

- (void)_didReceiveImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  VideosExtrasBackgroundViewController *v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    -[MPUArtworkView layer](self->_imageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      objc_msgSend(v4, "size");
      -[VideosExtrasBackgroundViewController _updateConstraintsForImageSize:position:](self, "_updateConstraintsForImageSize:position:", -[IKImageElement position](self->_displayedImageElement, "position"), v8, v9);
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __57__VideosExtrasBackgroundViewController__didReceiveImage___block_invoke;
      v14 = &unk_1E9F98FD8;
      v15 = self;
      v16 = v4;
      objc_msgSend(v10, "animateWithDuration:animations:", &v11, 1.0);
      -[VideosExtrasBackgroundViewController _scheduleTimerIfNeeded](self, "_scheduleTimerIfNeeded", v11, v12, v13, v14, v15);

    }
  }

}

uint64_t __57__VideosExtrasBackgroundViewController__didReceiveImage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "_setAnimatesContents:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "_setAnimatesContents:", 0);
}

- (void)_scheduleTimerIfNeeded
{
  NSArray *updateTimer;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSTimer *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  updateTimer = self->_backgroundElements;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](updateTimer, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(updateTimer);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "images", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 > 1)
        {

          -[NSArray firstObject](self->_backgroundElements, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "transitionInterval");
          v12 = v11;

          v13 = 3.0;
          if (v12 <= 3.0)
            v13 = v12;
          if (v13 >= 2.22044605e-16)
            v14 = v13;
          else
            v14 = 10.0;
          -[NSTimer invalidate](self->_updateTimer, "invalidate");
          objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateImage, 0, 0, v14);
          v15 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          updateTimer = (NSArray *)self->_updateTimer;
          self->_updateTimer = v15;
          goto LABEL_16;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](updateTimer, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void)_invalidateTimer
{
  NSTimer *updateTimer;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void)_initVignette
{
  UIImageView *v3;
  UIImageView *vignetteView;
  void *v5;
  void *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initForAutolayout");
  vignetteView = self->_vignetteView;
  self->_vignetteView = v3;

  -[VideosExtrasBackgroundViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_vignetteView);

  v6 = (void *)MEMORY[0x1E0CB3718];
  v7 = self->_vignetteView;
  -[VideosExtrasBackgroundViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintsByAttachingView:toView:alongEdges:insets:", v7, v8, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasBackgroundViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v10);

}

- (void)setVignetteType:(unint64_t)a3
{
  id v4;

  if (self->_vignetteType != a3)
  {
    self->_vignetteType = a3;
    if (a3)
    {
      if (!self->_vignetteView)
        -[VideosExtrasBackgroundViewController _initVignette](self, "_initVignette");
    }
    objc_msgSend((id)objc_opt_class(), "vignetteImageForType:", self->_vignetteType);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_vignetteView, "setImage:", v4);
    -[UIImageView setHidden:](self->_vignetteView, "setHidden:", v4 == 0);

  }
}

+ (id)vignetteImageForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 > 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", off_1E9F9DCE8[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)backgroundElements
{
  return self->_backgroundElements;
}

- (unint64_t)vignetteType
{
  return self->_vignetteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vignetteView, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageConstraints, 0);
  objc_storeStrong((id *)&self->_displayedImageElement, 0);
  objc_storeStrong((id *)&self->_backgroundElements, 0);
}

@end
