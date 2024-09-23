@implementation VideosExtrasSlideshowViewController

- (VideosExtrasSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  VideosExtrasSlideshowViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasSlideshowViewController;
  result = -[VideosExtrasSlideshowViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_visibleImageIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[VideosExtrasSlideshowViewController _invalidateTransitionTimer](self, "_invalidateTransitionTimer");
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowViewController;
  -[VideosExtrasSlideshowViewController dealloc](&v3, sel_dealloc);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowViewController;
  -[VideosExtrasSlideshowViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VideosExtrasSlideshowViewController setViewVisible:](self, "setViewVisible:", 1);
  -[VideosExtrasSlideshowViewController _prepareNextImageAndScheduleTransitionTimerIfAppropriate](self, "_prepareNextImageAndScheduleTransitionTimerIfAppropriate");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasSlideshowViewController;
  -[VideosExtrasSlideshowViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[VideosExtrasSlideshowViewController setViewVisible:](self, "setViewVisible:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasSlideshowViewController;
  -[VideosExtrasSlideshowViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", 0);
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "appearState") == 1)
  {
    objc_msgSend(v8, "zoomingImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replicateStateFromImageView:", v5);

  }
  -[VideosExtrasSlideshowViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "appearState"))
  {
    objc_msgSend(v7, "zoomingImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicateStateFromImageView:", v6);

  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4;

  -[VideosExtrasSlideshowViewController view](self, "view", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[VideosExtrasSlideshowViewController _reload](self, "_reload");
    v5 = obj;
  }

}

- (void)setVisibleImageIndex:(unint64_t)a3
{
  if (self->_visibleImageIndex != a3)
  {
    self->_visibleImageIndex = a3;
    -[VideosExtrasSlideshowViewController _reload](self, "_reload");
  }
}

- (double)transitionInterval
{
  double result;

  result = self->_transitionInterval;
  if (result < 2.22044605e-16)
    return 3.0;
  return result;
}

- (void)_invalidateTransitionTimer
{
  void *v3;

  -[VideosExtrasSlideshowViewController transitionTimer](self, "transitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[VideosExtrasSlideshowViewController setTransitionTimer:](self, "setTransitionTimer:", 0);
}

- (void)_scheduleTransitionTimer
{
  void *v3;
  id v4;

  -[VideosExtrasSlideshowViewController _invalidateTransitionTimer](self, "_invalidateTransitionTimer");
  v3 = (void *)MEMORY[0x1E0C99E88];
  -[VideosExtrasSlideshowViewController transitionInterval](self, "transitionInterval");
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__transitionTimerDidFire_, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController setTransitionTimer:](self, "setTransitionTimer:", v4);

}

- (void)_transitionTimerDidFire:(id)a3
{
  -[VideosExtrasSlideshowViewController _invalidateTransitionTimer](self, "_invalidateTransitionTimer", a3);
  -[VideosExtrasSlideshowViewController _transitionToNextImageIfAppropriate](self, "_transitionToNextImageIfAppropriate");
}

- (void)_performDissolveTransition
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
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController setDisappearingImageContainerView:](self, "setDisappearingImageContainerView:", v19);
  -[VideosExtrasSlideshowViewController nextImage](self, "nextImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", v3);

  -[VideosExtrasSlideshowViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v19);

  objc_msgSend(v19, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v5, "setMask:", v14);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setFromValue:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v16, "setToValue:", objc_msgSend(v14, "backgroundColor"));
  objc_msgSend(v16, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v18);

  objc_msgSend(v16, "setDelegate:", self);
  objc_msgSend(v14, "addAnimation:forKey:", v16, CFSTR("dissolve"));

}

- (void)_performInstantaneousTransition
{
  void *v3;
  void *v4;

  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController setDisappearingImageContainerView:](self, "setDisappearingImageContainerView:", v3);

  -[VideosExtrasSlideshowViewController nextImage](self, "nextImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", v4);

  -[VideosExtrasSlideshowViewController _transitionDidComplete](self, "_transitionDidComplete");
}

- (void)_performPushTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double Width;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  CGRect v26;

  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController setDisappearingImageContainerView:](self, "setDisappearingImageContainerView:", v3);
  -[VideosExtrasSlideshowViewController nextImage](self, "nextImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", v4);

  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v26);

  v8 = Width + 60.0;
  objc_msgSend(v5, "center");
  v10 = v9;
  v12 = v8 + v11;
  objc_msgSend(v5, "setCenter:", v8 + v11);
  objc_msgSend(v3, "center");
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke;
  v19[3] = &unk_1E9F9C0F0;
  v22 = v12 - v8;
  v23 = v10;
  v20 = v5;
  v21 = v3;
  v24 = v14 - v8;
  v25 = v15;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke_2;
  v18[3] = &unk_1E9F9B4F8;
  v18[4] = self;
  v16 = v3;
  v17 = v5;
  objc_msgSend(v13, "animateWithDuration:animations:completion:", v19, v18, 0.5);

}

uint64_t __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __61__VideosExtrasSlideshowViewController__performPushTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionDidComplete");
}

- (void)_performWipeTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];
  CGRect v29;

  v28[2] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController setDisappearingImageContainerView:](self, "setDisappearingImageContainerView:", v3);
  -[VideosExtrasSlideshowViewController nextImage](self, "nextImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", v4);

  -[VideosExtrasSlideshowViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v3);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v11 = 20.0 / CGRectGetWidth(v29);
  v12 = v11 + 1.0;
  v13 = -v11;
  v14 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28[0] = objc_msgSend(v15, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28[1] = objc_msgSend(v16, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColors:", v17);

  objc_msgSend(v14, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v14, "setEndPoint:", v13, 0.5);
  objc_msgSend(v14, "setFrame:", x, y, width, height);
  objc_msgSend(v6, "setMask:", v14);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("startPoint"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setToValue:", v20);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("endPoint"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 1.0, 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFromValue:", v22);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v13, 0.5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setToValue:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  v27[0] = v18;
  v27[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAnimations:", v25);

  objc_msgSend(v24, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTimingFunction:", v26);

  objc_msgSend(v24, "setDelegate:", self);
  objc_msgSend(v14, "addAnimation:forKey:", v24, CFSTR("wipe"));

}

- (void)_transitionDidComplete
{
  void *v3;

  -[VideosExtrasSlideshowViewController disappearingImageContainerView](self, "disappearingImageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[VideosExtrasSlideshowViewController setDisappearingImageContainerView:](self, "setDisappearingImageContainerView:", 0);
  -[VideosExtrasSlideshowViewController setAnimatingTransition:](self, "setAnimatingTransition:", 0);
}

- (void)_loadImageContainerViewIfAppropriateWithImage:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  VideosExtrasConstrainedArtworkContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  VideosExtrasConstrainedArtworkContainerView *v17;

  v4 = a3;
  v5 = -[VideosExtrasSlideshowViewController visibleImageIndex](self, "visibleImageIndex");
  v6 = -[VideosExtrasSlideshowViewController _numberOfImages](self, "_numberOfImages");
  if (v4 || v5 < v6)
  {
    -[VideosExtrasSlideshowViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v12 = -[VideosExtrasConstrainedArtworkContainerView initWithFrame:]([VideosExtrasConstrainedArtworkContainerView alloc], "initWithFrame:", v8, v9, v10, v11);
    -[VideosExtrasConstrainedArtworkContainerView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasConstrainedArtworkContainerView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[VideosExtrasConstrainedArtworkContainerView setShouldAutoresizeMaskLayerToFillBounds:](v12, "setShouldAutoresizeMaskLayerToFillBounds:", 1);
    objc_msgSend(v7, "addSubview:", v12);
    -[VideosExtrasSlideshowViewController setImageContainerView:](self, "setImageContainerView:", v12);
    if (v4)
    {
      -[VideosExtrasConstrainedArtworkContainerView artworkView](v12, "artworkView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v4);

    }
    else
    {
      -[VideosExtrasSlideshowViewController dataSource](self, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __85__VideosExtrasSlideshowViewController__loadImageContainerViewIfAppropriateWithImage___block_invoke;
      v16[3] = &unk_1E9F9BAC8;
      v17 = v12;
      objc_msgSend(v15, "slideshowViewController:loadImageAtIndex:withCompletionHandler:", self, v5, v16);

    }
  }

}

void __85__VideosExtrasSlideshowViewController__loadImageContainerViewIfAppropriateWithImage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "artworkView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

- (unint64_t)_numberOfImages
{
  void *v3;
  unint64_t v4;

  -[VideosExtrasSlideshowViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfImagesForSlideshowViewController:", self);

  return v4;
}

- (void)_prepareNextImageAndScheduleTransitionTimerIfAppropriate
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  if (-[VideosExtrasSlideshowViewController isViewVisible](self, "isViewVisible"))
  {
    v3 = -[VideosExtrasSlideshowViewController visibleImageIndex](self, "visibleImageIndex");
    v4 = -[VideosExtrasSlideshowViewController _numberOfImages](self, "_numberOfImages");
    if (v3 < v4)
    {
      v5 = v4;
      -[VideosExtrasSlideshowViewController setNextImage:](self, "setNextImage:", 0);
      -[VideosExtrasSlideshowViewController _scheduleTransitionTimer](self, "_scheduleTransitionTimer");
      if (v3 + 1 == v5)
        v6 = 0;
      else
        v6 = v3 + 1;
      -[VideosExtrasSlideshowViewController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __95__VideosExtrasSlideshowViewController__prepareNextImageAndScheduleTransitionTimerIfAppropriate__block_invoke;
      v9[3] = &unk_1E9F9C118;
      v10 = v7;
      v11 = v3;
      v9[4] = self;
      v8 = v7;
      objc_msgSend(v8, "slideshowViewController:loadImageAtIndex:withCompletionHandler:", self, v6, v9);

    }
  }
}

void __95__VideosExtrasSlideshowViewController__prepareNextImageAndScheduleTransitionTimerIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "visibleImageIndex") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNextImage:", v6);
      objc_msgSend(*(id *)(a1 + 32), "transitionTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        objc_msgSend(*(id *)(a1 + 32), "_transitionToNextImageIfAppropriate");
    }
  }

}

- (void)_reload
{
  void *v3;

  if (-[VideosExtrasSlideshowViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[VideosExtrasSlideshowViewController imageContainerView](self, "imageContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[VideosExtrasSlideshowViewController setImageContainerView:](self, "setImageContainerView:", 0);
    -[VideosExtrasSlideshowViewController _invalidateTransitionTimer](self, "_invalidateTransitionTimer");
    -[VideosExtrasSlideshowViewController _loadImageContainerViewIfAppropriateWithImage:](self, "_loadImageContainerViewIfAppropriateWithImage:", 0);
    -[VideosExtrasSlideshowViewController _prepareNextImageAndScheduleTransitionTimerIfAppropriate](self, "_prepareNextImageAndScheduleTransitionTimerIfAppropriate");
  }
}

- (void)_transitionToNextImageIfAppropriate
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  -[VideosExtrasSlideshowViewController nextImage](self, "nextImage");
  v7 = objc_claimAutoreleasedReturnValue();
  v3 = -[VideosExtrasSlideshowViewController _numberOfImages](self, "_numberOfImages");
  v4 = (void *)v7;
  if (v7)
  {
    v5 = v3;
    if (self->_visibleImageIndex < v3)
    {
      v6 = -[VideosExtrasSlideshowViewController isViewVisible](self, "isViewVisible");
      v4 = (void *)v7;
      if (v6)
      {
        self->_visibleImageIndex = (self->_visibleImageIndex + 1) % v5;
        -[VideosExtrasSlideshowViewController setAnimatingTransition:](self, "setAnimatingTransition:", 1);
        switch(-[VideosExtrasSlideshowViewController transitionStyle](self, "transitionStyle"))
        {
          case 0uLL:
            -[VideosExtrasSlideshowViewController _performInstantaneousTransition](self, "_performInstantaneousTransition");
            break;
          case 1uLL:
            -[VideosExtrasSlideshowViewController _performDissolveTransition](self, "_performDissolveTransition");
            break;
          case 2uLL:
            -[VideosExtrasSlideshowViewController _performPushTransition](self, "_performPushTransition");
            break;
          case 3uLL:
            -[VideosExtrasSlideshowViewController _performWipeTransition](self, "_performWipeTransition");
            break;
          default:
            break;
        }
        -[VideosExtrasSlideshowViewController _prepareNextImageAndScheduleTransitionTimerIfAppropriate](self, "_prepareNextImageAndScheduleTransitionTimerIfAppropriate");
        v4 = (void *)v7;
      }
    }
  }

}

- (VideosExtrasSlideshowViewControllerDataSource)dataSource
{
  return (VideosExtrasSlideshowViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(unint64_t)a3
{
  self->_transitionStyle = a3;
}

- (void)setTransitionInterval:(double)a3
{
  self->_transitionInterval = a3;
}

- (unint64_t)visibleImageIndex
{
  return self->_visibleImageIndex;
}

- (BOOL)isAnimatingTransition
{
  return self->_animatingTransition;
}

- (void)setAnimatingTransition:(BOOL)a3
{
  self->_animatingTransition = a3;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (VideosExtrasConstrainedArtworkContainerView)disappearingImageContainerView
{
  return self->_disappearingImageContainerView;
}

- (void)setDisappearingImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingImageContainerView, a3);
}

- (VideosExtrasConstrainedArtworkContainerView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerView, a3);
}

- (UIImage)nextImage
{
  return self->_nextImage;
}

- (void)setNextImage:(id)a3
{
  objc_storeStrong((id *)&self->_nextImage, a3);
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_nextImage, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_disappearingImageContainerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
