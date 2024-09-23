@implementation SXImageView

- (SXImageView)initWithImageResource:(id)a3 resourceDataSource:(id)a4 reachabilityProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXImageView *v12;
  SXImageView *v13;
  uint64_t v14;
  NSMapTable *interestTable;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SXImageView;
  v12 = -[SXImageView init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_autoPlayEnabled = 1;
    v12->_paused = 1;
    objc_storeStrong((id *)&v12->_imageResource, a3);
    objc_storeWeak((id *)&v13->_resourceDataSource, v10);
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    interestTable = v13->_interestTable;
    v13->_interestTable = (NSMapTable *)v14;

    v13->_intendedFrameIndex = -1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel_didReceiveMemoryWarning, *MEMORY[0x24BDF7538], 0);

    objc_msgSend(v11, "addReachabilityObserver:", v13);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SXImageView activeTimer](self, "activeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SXImageView setActiveTimer:](self, "setActiveTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SXImageView;
  -[SXImageView dealloc](&v4, sel_dealloc);
}

- (void)setShouldShowLoadingIndicator:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_shouldShowLoadingIndicator = a3;
  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_6;
  }
  if (!-[SXImageView shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
LABEL_6:
    if (!-[SXImageView shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
    {
      -[SXImageView activityIndicatorView](self, "activityIndicatorView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[SXImageView setActivityIndicatorView:](self, "setActivityIndicatorView:", 0);
    }
    return;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  -[SXImageView setActivityIndicatorView:](self, "setActivityIndicatorView:", v5);

  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesWhenStopped:", 1);

  -[SXImageView layoutActivityIndicator](self, "layoutActivityIndicator");
  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageView addSubview:](self, "addSubview:", v7);

  if (!-[SXImageView hasLoadedImage](self, "hasLoadedImage"))
  {
    -[SXImageView activityIndicatorView](self, "activityIndicatorView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startAnimating");

  }
}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
  id v4;

  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityIndicatorViewStyle:", a3);

}

- (int64_t)loadingIndicatorStyle
{
  void *v2;
  int64_t v3;

  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityIndicatorViewStyle");

  return v3;
}

- (void)layoutActivityIndicator
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SXImageView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[SXImageView bounds](self, "bounds");
  v6 = v5 * 0.5;
  -[SXImageView activityIndicatorView](self, "activityIndicatorView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

}

- (void)addInterestInImageQuality:(int)a3 forObject:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  -[SXImageView interestTable](self, "interestTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "intValue") != (_DWORD)v4)
    {
      -[SXImageView giveUpInterestForObject:](self, "giveUpInterestForObject:", v11);
      -[SXImageView addInterestInImageQuality:forObject:](self, "addInterestInImageQuality:forObject:", v4, v11);
    }
  }
  else
  {
    v8 = &OBJC_IVAR___SXImageView__highQualityInterest;
    if (!(_DWORD)v4)
      v8 = &OBJC_IVAR___SXImageView__preferredQualityInterest;
    ++*(Class *)((char *)&self->super.super.super.super.isa + *v8);
    -[SXImageView interestTable](self, "interestTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

    -[SXImageView validateLoadedImage](self, "validateLoadedImage");
  }

}

- (void)giveUpInterestForObject:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  void (**v13)(void);
  void *v14;
  void (**v15)(void);
  void *v16;
  id v17;

  v17 = a3;
  -[SXImageView interestTable](self, "interestTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    v7 = &OBJC_IVAR___SXImageView__highQualityInterest;
    if (!v6)
      v7 = &OBJC_IVAR___SXImageView__preferredQualityInterest;
    --*(Class *)((char *)&self->super.super.super.super.isa + *v7);
    if (!-[SXImageView prefersHighQuality](self, "prefersHighQuality"))
    {
      -[SXImageView highQualityImage](self, "highQualityImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[SXImageView setHighQualityImage:](self, "setHighQualityImage:", 0);
    }
    -[SXImageView interestTable](self, "interestTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v17);

    if (-[SXImageView hasInterest](self, "hasInterest"))
    {
      if (!-[SXImageView prefersHighQuality](self, "prefersHighQuality"))
      {
        -[SXImageView highQualityImageRequestCancelHandler](self, "highQualityImageRequestCancelHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[SXImageView highQualityImageRequestCancelHandler](self, "highQualityImageRequestCancelHandler");
          v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v11[2]();

          -[SXImageView setHighQualityImageRequestCancelHandler:](self, "setHighQualityImageRequestCancelHandler:", 0);
        }
      }
    }
    else
    {
      -[SXImageView preferredQualityImageRequestCancelHandler](self, "preferredQualityImageRequestCancelHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[SXImageView preferredQualityImageRequestCancelHandler](self, "preferredQualityImageRequestCancelHandler");
        v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v13[2]();

        -[SXImageView setPreferredQualityImageRequestCancelHandler:](self, "setPreferredQualityImageRequestCancelHandler:", 0);
        -[SXImageView setPreferredQualityLoadingImageSize:](self, "setPreferredQualityLoadingImageSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      }
      -[SXImageView highQualityImageRequestCancelHandler](self, "highQualityImageRequestCancelHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[SXImageView highQualityImageRequestCancelHandler](self, "highQualityImageRequestCancelHandler");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();

        -[SXImageView setHighQualityImageRequestCancelHandler:](self, "setHighQualityImageRequestCancelHandler:", 0);
      }
      if (-[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
      {
        -[SXImageView animatedImage](self, "animatedImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPreloadType:currentFrameIndex:", 0, 0);

      }
    }
  }

}

- (BOOL)hasInterest
{
  return -[SXImageView preferredQualityInterest](self, "preferredQualityInterest")
      || -[SXImageView highQualityInterest](self, "highQualityInterest") != 0;
}

- (BOOL)prefersHighQuality
{
  return -[SXImageView highQualityInterest](self, "highQualityInterest") != 0;
}

- (BOOL)objectHasQualityInterest:(id)a3 quality:(int *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SXImageView interestTable](self, "interestTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v8)
    *a4 = objc_msgSend(v8, "intValue");

  return v8 != 0;
}

- (void)validateLoadedImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  -[SXImageView bounds](self, "bounds");
  if (v4 <= 0.0
    || v3 <= 0.0
    || !-[SXImageView hasInterest](self, "hasInterest")
    || -[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
  {
    return;
  }
  if (!-[SXImageView prefersHighQuality](self, "prefersHighQuality"))
  {
    -[SXImageView preferredQualityImage](self, "preferredQualityImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;

    -[SXImageView preferredQualityImage](self, "preferredQualityImage");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_14;
    v15 = (void *)v14;
    -[SXImageView preferredQualityImage](self, "preferredQualityImage");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = ceil(v11);
      -[SXImageView preferredImageSize](self, "preferredImageSize");
      v20 = v19;
      v22 = v21;

      if (v20 != v18 || v22 != ceil(v13))
      {
LABEL_14:
        -[SXImageView preferredImageSize](self, "preferredImageSize");
        v24 = v23;
        v26 = v25;
        -[SXImageView preferredQualityLoadingImageSize](self, "preferredQualityLoadingImageSize");
        if (v24 != v28 || v26 != v27)
          -[SXImageView loadPreferredQualityImage](self, "loadPreferredQualityImage");
        return;
      }
    }
    else
    {

    }
    -[SXImageView image](self, "image");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView preferredQualityImage](self, "preferredQualityImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 == v30)
      return;
    -[SXImageView preferredQualityImage](self, "preferredQualityImage");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v31 = (id)v8;
    -[SXImageView crossfadeToImage:](self, "crossfadeToImage:", v8);

    return;
  }
  -[SXImageView highQualityImage](self, "highQualityImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXImageView loadHighQualityImage](self, "loadHighQualityImage");
    return;
  }
  -[SXImageView highQualityImage](self, "highQualityImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[SXImageView highQualityImage](self, "highQualityImage");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
}

- (void)loadPreferredQualityImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SXImageRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SXImageRequest *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id location;

  -[SXImageView preferredImageSize](self, "preferredImageSize");
  v4 = v3;
  v6 = v5;
  -[SXImageView preferredQualityImageRequestCancelHandler](self, "preferredQualityImageRequestCancelHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SXImageView preferredQualityImageRequestCancelHandler](self, "preferredQualityImageRequestCancelHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    -[SXImageView setPreferredQualityImageRequestCancelHandler:](self, "setPreferredQualityImageRequestCancelHandler:", 0);
  }
  if (!-[SXImageView hasLoadedImage](self, "hasLoadedImage"))
  {
    -[SXImageView activityIndicatorView](self, "activityIndicatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startAnimating");

  }
  self->_preferredQualityLoadingImageSize.width = v4;
  self->_preferredQualityLoadingImageSize.height = v6;
  objc_initWeak(&location, self);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __40__SXImageView_loadPreferredQualityImage__block_invoke;
  v24 = &unk_24D687758;
  objc_copyWeak(&v25, &location);
  v10 = (void *)MEMORY[0x219A070A8](&v21);
  -[SXImageView imageResource](self, "imageResource", v21, v22, v23, v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "wideColorSpace");

  v13 = [SXImageRequest alloc];
  -[SXImageView imageResource](self, "imageResource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageView imageResource](self, "imageResource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v13, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v15, 6, v17, v12, v10, v4, v6);

  -[SXImageView resourceDataSource](self, "resourceDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loadImagesForImageRequest:completionBlock:", v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageView setPreferredQualityImageRequestCancelHandler:](self, "setPreferredQualityImageRequestCancelHandler:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __40__SXImageView_loadPreferredQualityImage__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  char isKindOfClass;
  double *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = (double *)MEMORY[0x24BDBF148];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "animatedImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "didLoadAnimatedImage:", v6);
  }
  else
  {
    v6 = v16;
    objc_msgSend(WeakRetained, "activityIndicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAnimating");

    objc_msgSend(v6, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPreferredQualityImage:", v9);

      objc_msgSend(WeakRetained, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "preferredQualityImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(WeakRetained, "crossfadeToImage:", v11);
      else
        objc_msgSend(WeakRetained, "fadeInImageWhenVisible:", v11);

      objc_msgSend(WeakRetained, "setPreferredQualityLoadingImageSize:", *v5, v5[1]);
      objc_msgSend(WeakRetained, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "preferredQualityImage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageView:didLoadImage:ofQuality:", WeakRetained, v15, 0);

      }
    }
  }

  objc_msgSend(WeakRetained, "setPreferredQualityLoadingImageSize:", *v5, v5[1]);
  objc_msgSend(WeakRetained, "setPreferredQualityImageRequestCancelHandler:", 0);

}

- (void)loadHighQualityImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SXImageRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SXImageRequest *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id location;

  if (!-[SXImageView hasLoadedImage](self, "hasLoadedImage"))
  {
    -[SXImageView activityIndicatorView](self, "activityIndicatorView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAnimating");

  }
  objc_initWeak(&location, self);
  -[SXImageView highQualityImageRequestCancelHandler](self, "highQualityImageRequestCancelHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SXImageView highQualityImage](self, "highQualityImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_6;
    v4 = objc_loadWeakRetained(&location);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __35__SXImageView_loadHighQualityImage__block_invoke;
    v17[3] = &unk_24D687780;
    v17[4] = v4;
    v6 = (void *)MEMORY[0x219A070A8](v17);
    -[SXImageView imageResource](self, "imageResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wideColorSpace");

    v9 = [SXImageRequest alloc];
    -[SXImageView imageResource](self, "imageResource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView imageResource](self, "imageResource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v9, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v11, 6, v13, v8, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

    -[SXImageView resourceDataSource](self, "resourceDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loadImagesForImageRequest:completionBlock:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setHighQualityImageRequestCancelHandler:](self, "setHighQualityImageRequestCancelHandler:", v16);

  }
LABEL_6:
  objc_destroyWeak(&location);
}

void __35__SXImageView_loadHighQualityImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v25;
    objc_msgSend(v3, "animatedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageSize");
    v6 = v5;
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "animatedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageSize");
    v11 = v10;
    v13 = v12;

    if (v6 == v11 && v8 == v13)
      goto LABEL_13;
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v3, "animatedImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didLoadAnimatedImage:", v16);
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stopAnimating");

  objc_msgSend(v25, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHighQualityImage:", v18);

  objc_msgSend(*(id *)(a1 + 32), "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "highQualityImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v20, "crossfadeToImage:", v21);
  else
    objc_msgSend(v20, "fadeInImageWhenVisible:", v21);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(a1 + 32);
    objc_msgSend(v24, "highQualityImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageView:didLoadImage:ofQuality:", v24, v16, 1);
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "setHighQualityImageRequestCancelHandler:", 0);

}

- (void)didLoadAnimatedImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[SXImageView setAnimatedImage:](self, "setAnimatedImage:", a3);
  -[SXImageView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXImageView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SXImageView animatedImage](self, "animatedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView:didLoadAnimatedImage:", self, v6);

  }
}

- (void)didReceiveMemoryWarning
{
  if (!-[SXImageView hasInterest](self, "hasInterest"))
  {
    -[SXImageView setHighQualityImage:](self, "setHighQualityImage:", 0);
    -[SXImageView setPreferredQualityImage:](self, "setPreferredQualityImage:", 0);
  }
}

- (BOOL)hasLoadedImage
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SXImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SXImageView animatedImage](self, "animatedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (CGSize)loadedImageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
  {
    -[SXImageView animatedImage](self, "animatedImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageSize");
  }
  else
  {
    -[SXImageView image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)fadeInImageWhenVisible:(id)a3
{
  void *v4;
  id v5;

  -[SXImageView setImage:](self, "setImage:", a3);
  if (-[SXImageView isVisible](self, "isVisible"))
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", &unk_24D6FEE90);
    objc_msgSend(v5, "setToValue:", &unk_24D6FEEA8);
    objc_msgSend(v5, "setDuration:", 0.2);
    -[SXImageView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("fadeIn"));

  }
}

- (BOOL)isVisible
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  BOOL v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  -[SXImageView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SXImageView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[SXImageView window](self, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  v35 = CGRectInset(v33, -10.0, -10.0);
  v34.origin.x = v23;
  v34.origin.y = v25;
  v34.size.width = v27;
  v34.size.height = v29;
  if (CGRectIntersectsRect(v34, v35))
  {
    -[SXImageView window](self, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 != 0;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)setPreferredImageSize:(CGSize)a3
{
  self->_preferredImageSize.width = ceil(a3.width);
  self->_preferredImageSize.height = ceil(a3.height);
  -[SXImageView validateLoadedImage](self, "validateLoadedImage");
}

- (void)reachabilityChanged:(BOOL)a3
{
  if (a3)
    -[SXImageView validateLoadedImage](self, "validateLoadedImage");
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
  {
    self->_scrubbingEnabled = v3;
    if (v3
      && (-[SXImageView scrubGesture](self, "scrubGesture"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      -[SXImageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_handleScrubGesture_);
      objc_msgSend(v8, "setMinimumPressDuration:", 0.1);
      objc_msgSend(v8, "setNumberOfTouchesRequired:", 1);
      -[SXImageView addGestureRecognizer:](self, "addGestureRecognizer:", v8);
      -[SXImageView setScrubGesture:](self, "setScrubGesture:", v8);

    }
    else
    {
      -[SXImageView scrubGesture](self, "scrubGesture");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SXImageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
        -[SXImageView scrubGesture](self, "scrubGesture");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXImageView removeGestureRecognizer:](self, "removeGestureRecognizer:", v7);

        -[SXImageView setScrubGesture:](self, "setScrubGesture:", 0);
      }
    }
  }
  else
  {
    self->_scrubbingEnabled = 0;
  }
}

- (void)handleScrubGesture:(id)a3
{
  SXImageView *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  double Width;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  BOOL v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;

  v30 = a3;
  if (objc_msgSend(v30, "state") == 1)
  {
    -[SXImageView pause](self, "pause");
    objc_msgSend(v30, "locationInView:", self);
    -[SXImageView setPreviousPoint:](self, "setPreviousPoint:");
    v4 = self;
    v5 = 1;
LABEL_17:
    -[SXImageView setIsScrubbing:](v4, "setIsScrubbing:", v5);
LABEL_18:
    v26 = v30;
    goto LABEL_19;
  }
  if (objc_msgSend(v30, "state") == 2)
  {
    -[SXImageView animatedImage](self, "animatedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfFrames");

    objc_msgSend(v30, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    -[SXImageView previousPoint](self, "previousPoint");
    v13 = v9 - v12;
    v14 = -[SXImageView frameIndex](self, "frameIndex");
    -[SXImageView animatedImage](self, "animatedImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfFrames");
    v17 = -[SXImageView frameIndex](self, "frameIndex");

    -[SXImageView frame](self, "frame");
    Width = CGRectGetWidth(v31);
    v19 = -[SXImageView frameIndex](self, "frameIndex");
    if (v13 <= 0.0)
    {
      -[SXImageView previousPoint](self, "previousPoint");
      v28 = v27 / (double)v14;
      -[SXImageView previousPoint](self, "previousPoint");
      v20 = ((__PAIR128__(v19, *(unint64_t *)&v9) - COERCE_UNSIGNED_INT64(v29 - v28 + 20.0)) >> 64) & ~((uint64_t)((__PAIR128__(v19, *(unint64_t *)&v9) - COERCE_UNSIGNED_INT64(v29 - v28 + 20.0)) >> 64) >> 63);
    }
    else
    {
      v20 = v7 - 1;
      -[SXImageView previousPoint](self, "previousPoint");
      v22 = (Width - v21) / (double)(v16 - v17);
      -[SXImageView previousPoint](self, "previousPoint");
      if (v9 <= v23 + v22)
        v24 = v19;
      else
        v24 = v19 + 1;
      if (v20 >= v24)
        v20 = v24;
    }
    v25 = -[SXImageView frameIndex](self, "frameIndex") == v20;
    v26 = v30;
    if (!v25)
    {
      -[SXImageView setFrameIndex:allowNearest:](self, "setFrameIndex:allowNearest:", v20, 1);
      -[SXImageView setPreviousPoint:](self, "setPreviousPoint:", v9, v11);
      goto LABEL_18;
    }
  }
  else if (objc_msgSend(v30, "state") == 3 || (v25 = objc_msgSend(v30, "state") == 4, v26 = v30, v25))
  {
    if (-[SXImageView autoPlayEnabled](self, "autoPlayEnabled"))
      -[SXImageView resume](self, "resume");
    v4 = self;
    v5 = 0;
    goto LABEL_17;
  }
LABEL_19:

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXImageView;
  -[SXImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[SXImageView layoutActivityIndicator](self, "layoutActivityIndicator");
  -[SXImageView validateLoadedImage](self, "validateLoadedImage");
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXImageView;
  -[SXImageView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  if (a3)
    -[SXImageView setShouldResume:](self, "setShouldResume:", -[SXImageView autoPlayEnabled](self, "autoPlayEnabled"));
}

- (void)didMoveToSuperview
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXImageView;
  -[SXImageView didMoveToSuperview](&v6, sel_didMoveToSuperview);
  -[SXImageView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SXImageView shouldResume](self, "shouldResume");

    if (v5)
    {
      -[SXImageView resume](self, "resume");
      -[SXImageView setShouldResume:](self, "setShouldResume:", 0);
      -[SXImageView validateLoadedImage](self, "validateLoadedImage");
    }
  }
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXImageView;
  -[SXImageView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[SXImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SXImageView pause](self, "pause");
    goto LABEL_6;
  }
  -[SXImageView superview](self, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[SXImageView shouldResume](self, "shouldResume");

    if (v6)
    {
      -[SXImageView resume](self, "resume");
LABEL_6:
      -[SXImageView setShouldResume:](self, "setShouldResume:", v3 == 0);
    }
  }
}

- (BOOL)containsAnimatedImage
{
  void *v2;
  BOOL v3;

  -[SXImageView animatedImage](self, "animatedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setAnimatedImage:(id)a3
{
  SXAnimatedImage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  SXAnimatedImage *v11;

  v5 = (SXAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v11 = v5;
    if (-[SXImageView scrubbingEnabled](self, "scrubbingEnabled"))
      v6 = 2;
    else
      v6 = 1;
    -[SXAnimatedImage setPreloadType:currentFrameIndex:](v11, "setPreloadType:currentFrameIndex:", v6, -[SXImageView frameIndex](self, "frameIndex"));
    -[SXAnimatedImage setDelegate:](self->_animatedImage, "setDelegate:", 0);
    -[SXAnimatedImage setDelegate:](v11, "setDelegate:", self);
    objc_storeStrong((id *)&self->_animatedImage, a3);
    v7 = -[SXAnimatedImage loopCount](v11, "loopCount");
    v8 = -[SXAnimatedImage loopCount](v11, "loopCount");
    if (v7 == -1)
      v9 = v8;
    else
      v9 = v8 + 1;
    self->_playCount = v9;
    v10 = -[SXImageView shouldResumeAfterLoad](self, "shouldResumeAfterLoad");
    v5 = v11;
    if (v10)
    {
      -[SXImageView resume](self, "resume");
      -[SXImageView setShouldResumeAfterLoad:](self, "setShouldResumeAfterLoad:", 0);
      v5 = v11;
    }
  }

}

- (void)showNextFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SXImageView *v24;
  uint64_t v25;
  id v26;

  -[SXImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SXImageView activeTimer](self, "activeTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SXImageView setActiveTimer:](self, "setActiveTimer:", 0);
    -[SXImageView animatedImage](self, "animatedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suspendPreloading");

    -[SXImageView setPaused:](self, "setPaused:", 1);
  }
  -[SXImageView animatedImage](self, "animatedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameAtIndex:", -[SXImageView frameIndex](self, "frameIndex"));
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[SXAnimatedImageFrame index]((uint64_t)v26) + 1;
  -[SXImageView animatedImage](self, "animatedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfFrames");

  if (v7 >= v9)
  {
    -[SXImageView setPlayCount:](self, "setPlayCount:", -[SXImageView playCount](self, "playCount") - 1);
    if (!-[SXImageView playCount](self, "playCount"))
    {
      -[SXImageView pause](self, "pause");
      goto LABEL_15;
    }
    v7 = 0;
  }
  -[SXImageView animatedImage](self, "animatedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXAnimatedImageFrame image]((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self->_frameIndex = v7;
    -[SXAnimatedImageFrame image]((uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setImage:](self, "setImage:", v13);

    -[SXImageView frameChangeBlock](self, "frameChangeBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[SXImageView frameChangeBlock](self, "frameChangeBlock");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16 = -[SXImageView frameIndex](self, "frameIndex");
      -[SXImageView animatedImage](self, "animatedImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SXImageView *, unint64_t, uint64_t))v15)[2](v15, self, v16, objc_msgSend(v17, "numberOfFrames"));

    }
    -[SXImageView activeTimer](self, "activeTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isValid");

    if (v19)
    {
      -[SXImageView activeTimer](self, "activeTimer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "invalidate");

    }
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_showNextFrame, 0, 0, -[SXAnimatedImageFrame duration]((uint64_t)v11));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setActiveTimer:](self, "setActiveTimer:", v21);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView activeTimer](self, "activeTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTimer:forMode:", v23, *MEMORY[0x24BDBCB80]);

    v24 = self;
    v25 = -1;
  }
  else
  {
    v25 = -[SXAnimatedImageFrame index]((uint64_t)v11);
    v24 = self;
  }
  -[SXImageView setIntendedFrameIndex:](v24, "setIntendedFrameIndex:", v25);

LABEL_15:
}

- (void)setFrameIndex:(unint64_t)a3
{
  -[SXImageView setFrameIndex:allowNearest:](self, "setFrameIndex:allowNearest:", a3, 0);
}

- (void)setFrameIndex:(unint64_t)a3 allowNearest:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  self->_frameIndex = a3;
  -[SXImageView animatedImage](self, "animatedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameAtIndex:returnNearestPreloaded:", -[SXImageView frameIndex](self, "frameIndex"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAnimatedImageFrame image]((uint64_t)v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[SXImageView setImage:](self, "setImage:", v9);
    v8 = v9;
  }

}

- (BOOL)paused
{
  void *v2;
  BOOL v3;

  -[SXImageView activeTimer](self, "activeTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)pause
{
  void *v3;
  id v4;

  if (-[SXImageView paused](self, "paused") || !-[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
  {
    if (!-[SXImageView paused](self, "paused"))
      -[SXImageView setShouldResumeAfterLoad:](self, "setShouldResumeAfterLoad:", 0);
  }
  else
  {
    -[SXImageView activeTimer](self, "activeTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[SXImageView setActiveTimer:](self, "setActiveTimer:", 0);
    -[SXImageView animatedImage](self, "animatedImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspendPreloading");

  }
}

- (void)resume
{
  void *v3;

  if (-[SXImageView paused](self, "paused")
    && -[SXImageView playCount](self, "playCount")
    && -[SXImageView containsAnimatedImage](self, "containsAnimatedImage"))
  {
    -[SXImageView animatedImage](self, "animatedImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumePreloading");

    -[SXImageView showNextFrame](self, "showNextFrame");
  }
  else if (-[SXImageView paused](self, "paused"))
  {
    -[SXImageView setShouldResumeAfterLoad:](self, "setShouldResumeAfterLoad:", 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SXImageView *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SXImageView);
  -[SXImageView animatedImage](self, "animatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXImageView animatedImage](self, "animatedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setAnimatedImage:](v4, "setAnimatedImage:", v6);
  }
  else
  {
    -[SXImageView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setImage:](v4, "setImage:", v6);
  }

  return v4;
}

- (void)animatedImage:(id)a3 madeImageAvailableForFrameAtIndex:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SXImageView_animatedImage_madeImageAvailableForFrameAtIndex___block_invoke;
  v4[3] = &unk_24D6877A8;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

uint64_t __63__SXImageView_animatedImage_madeImageAvailableForFrameAtIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intendedFrameIndex");
  if (result == *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "showNextFrame");
  return result;
}

- (id)supportedCustomRotors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[SXAXCustomRotorDefinition imagesRotor]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemsForCustomRotor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[SXAXCustomRotorDefinition imagesRotor]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:", self, 0);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)dragIdentifier
{
  void *v2;
  void *v3;

  -[SXImageView imageResource](self, "imageResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)didStartDragging
{
  -[SXImageView setAlpha:](self, "setAlpha:", 0.200000003);
}

- (void)didEndDragging
{
  -[SXImageView setAlpha:](self, "setAlpha:", 1.0);
}

- (id)stringForAXDragAction
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Drag Image"), &stru_24D68E0F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if (-[SXImageView isDecorative](self, "isDecorative"))
    return 0;
  else
    return !-[NSObject sxax_shouldBeOccluded](self, "sxax_shouldBeOccluded");
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (BOOL)shouldShowLoadingIndicator
{
  return self->_shouldShowLoadingIndicator;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (CGSize)preferredImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredImageSize.width;
  height = self->_preferredImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SXImageViewDelegate)delegate
{
  return (SXImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (void)setIsScrubbing:(BOOL)a3
{
  self->_isScrubbing = a3;
}

- (BOOL)isDecorative
{
  return self->_isDecorative;
}

- (void)setIsDecorative:(BOOL)a3
{
  self->_isDecorative = a3;
}

- (SXAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (id)frameChangeBlock
{
  return self->_frameChangeBlock;
}

- (void)setFrameChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  self->_autoPlayEnabled = a3;
}

- (SXResourceDataSource)resourceDataSource
{
  return (SXResourceDataSource *)objc_loadWeakRetained((id *)&self->_resourceDataSource);
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (id)preferredQualityImageRequestCancelHandler
{
  return self->_preferredQualityImageRequestCancelHandler;
}

- (void)setPreferredQualityImageRequestCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (id)highQualityImageRequestCancelHandler
{
  return self->_highQualityImageRequestCancelHandler;
}

- (void)setHighQualityImageRequestCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (CGSize)preferredQualityLoadingImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredQualityLoadingImageSize.width;
  height = self->_preferredQualityLoadingImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredQualityLoadingImageSize:(CGSize)a3
{
  self->_preferredQualityLoadingImageSize = a3;
}

- (UIImage)preferredQualityImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_preferredQualityImage);
}

- (void)setPreferredQualityImage:(id)a3
{
  objc_storeWeak((id *)&self->_preferredQualityImage, a3);
}

- (UIImage)highQualityImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_highQualityImage);
}

- (void)setHighQualityImage:(id)a3
{
  objc_storeWeak((id *)&self->_highQualityImage, a3);
}

- (unint64_t)preferredQualityInterest
{
  return self->_preferredQualityInterest;
}

- (void)setPreferredQualityInterest:(unint64_t)a3
{
  self->_preferredQualityInterest = a3;
}

- (unint64_t)highQualityInterest
{
  return self->_highQualityInterest;
}

- (void)setHighQualityInterest:(unint64_t)a3
{
  self->_highQualityInterest = a3;
}

- (NSMapTable)interestTable
{
  return self->_interestTable;
}

- (void)setInterestTable:(id)a3
{
  objc_storeStrong((id *)&self->_interestTable, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (BOOL)shouldResume
{
  return self->_shouldResume;
}

- (void)setShouldResume:(BOOL)a3
{
  self->_shouldResume = a3;
}

- (BOOL)shouldResumeAfterLoad
{
  return self->_shouldResumeAfterLoad;
}

- (void)setShouldResumeAfterLoad:(BOOL)a3
{
  self->_shouldResumeAfterLoad = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (NSTimer)activeTimer
{
  return self->_activeTimer;
}

- (void)setActiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeTimer, a3);
}

- (unint64_t)intendedFrameIndex
{
  return self->_intendedFrameIndex;
}

- (void)setIntendedFrameIndex:(unint64_t)a3
{
  self->_intendedFrameIndex = a3;
}

- (UILongPressGestureRecognizer)scrubGesture
{
  return self->_scrubGesture;
}

- (void)setScrubGesture:(id)a3
{
  objc_storeStrong((id *)&self->_scrubGesture, a3);
}

- (CGPoint)previousPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPoint.x;
  y = self->_previousPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPoint:(CGPoint)a3
{
  self->_previousPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubGesture, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_interestTable, 0);
  objc_destroyWeak((id *)&self->_highQualityImage);
  objc_destroyWeak((id *)&self->_preferredQualityImage);
  objc_storeStrong(&self->_highQualityImageRequestCancelHandler, 0);
  objc_storeStrong(&self->_preferredQualityImageRequestCancelHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_destroyWeak((id *)&self->_resourceDataSource);
  objc_storeStrong(&self->_frameChangeBlock, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageResource, 0);
}

@end
