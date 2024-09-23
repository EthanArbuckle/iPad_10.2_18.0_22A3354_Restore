@implementation VideosExtrasFeatureContainerViewController

- (VideosExtrasFeatureContainerViewController)initWithContext:(id)a3
{
  id v4;
  VideosExtrasFeatureContainerViewController *v5;
  VideosExtrasFeatureContainerViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasFeatureContainerViewController;
  v5 = -[VideosExtrasFeatureContainerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__menuBarHeightChange_, CFSTR("VideosExtrasMainTemplateBarHeightChangeNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasFeatureContainerViewController;
  -[VideosExtrasFeatureContainerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasFeatureContainerViewController;
  -[VideosExtrasFeatureContainerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[VideosExtrasFeatureContainerViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extrasRequestReloadWithContext:", 0);

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  -[VideosExtrasFeatureContainerViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVideoPlaybackViewController:(id)a3
{
  VideosExtrasVideoPlaybackViewController *v5;
  VideosExtrasVideoPlaybackViewController **p_videoPlaybackViewController;
  VideosExtrasVideoPlaybackViewController *videoPlaybackViewController;
  void *v8;
  NSLayoutConstraint *overlayViewAdjustmentConstraint;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  id WeakRetained;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v5 = (VideosExtrasVideoPlaybackViewController *)a3;
  p_videoPlaybackViewController = &self->_videoPlaybackViewController;
  videoPlaybackViewController = self->_videoPlaybackViewController;
  if (videoPlaybackViewController != v5)
  {
    -[VideosExtrasVideoPlaybackViewController willMoveToParentViewController:](videoPlaybackViewController, "willMoveToParentViewController:", 0);
    -[VideosExtrasVideoPlaybackViewController view](*p_videoPlaybackViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[VideosExtrasVideoPlaybackViewController removeFromParentViewController](*p_videoPlaybackViewController, "removeFromParentViewController");
    -[VideosExtrasVideoPlaybackViewController setOverlayVisibilityChangeAnimationBlock:](*p_videoPlaybackViewController, "setOverlayVisibilityChangeAnimationBlock:", 0);
    objc_storeStrong((id *)&self->_videoPlaybackViewController, a3);
    if (v5)
    {
      overlayViewAdjustmentConstraint = self->_overlayViewAdjustmentConstraint;
      if (overlayViewAdjustmentConstraint)
        -[NSLayoutConstraint setActive:](overlayViewAdjustmentConstraint, "setActive:", 0);
      -[VideosExtrasFeatureContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasVideoPlaybackViewController view](v5, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v11, "setFrame:");
      -[VideosExtrasFeatureContainerViewController addChildViewController:](self, "addChildViewController:", v5);
      -[VideosExtrasVideoPlaybackViewController view](v5, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v12);

      -[VideosExtrasVideoPlaybackViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
      -[VideosExtrasVideoPlaybackViewController overlayView](v5, "overlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 4, 0, v11, 4, 1.0, 0.0);
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v15 = self->_overlayViewAdjustmentConstraint;
      self->_overlayViewAdjustmentConstraint = v14;

      WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarView);
      if (WeakRetained)
      {
        -[NSLayoutConstraint setActive:](self->_overlayViewAdjustmentConstraint, "setActive:", 1);
        v17 = objc_loadWeakRetained((id *)&self->_menuBarView);
        objc_msgSend(v13, "alpha");
        objc_msgSend(v17, "setAlpha:");

        v18 = objc_loadWeakRetained((id *)&self->_menuBarView);
        objc_msgSend(v18, "setHidden:", objc_msgSend(v13, "isHidden"));

      }
      objc_initWeak(&location, self);
      v19 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke;
      v22[3] = &unk_1E9F9B3A0;
      objc_copyWeak(&v23, &location);
      -[VideosExtrasVideoPlaybackViewController setOverlayVisibilityChangeAnimationBlock:](v5, "setOverlayVisibilityChangeAnimationBlock:", v22);
      v20[0] = v19;
      v20[1] = 3221225472;
      v20[2] = __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke_2;
      v20[3] = &unk_1E9F9B3A0;
      objc_copyWeak(&v21, &location);
      -[VideosExtrasVideoPlaybackViewController setOverlayVisibilityChangeAnimationCompletionBlock:](v5, "setOverlayVisibilityChangeAnimationCompletionBlock:", v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
  }

}

void __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (id *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v11;
    if (v5 == v11)
    {
      v6 = objc_loadWeakRetained(v11 + 124);
      v7 = v6;
      if (a2)
      {
        v8 = 0.0;
      }
      else
      {
        objc_msgSend(v6, "setHidden:", 0);

        objc_msgSend(v11, "navigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "navigationBar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setHidden:", 0);

        v6 = objc_loadWeakRetained(v11 + 124);
        v7 = v6;
        v8 = 1.0;
      }
      objc_msgSend(v6, "setAlpha:", v8);

      WeakRetained = v11;
    }
  }

}

void __77__VideosExtrasFeatureContainerViewController_setVideoPlaybackViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (id *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v9;
    if (v5 == v9)
    {
      v6 = objc_loadWeakRetained(v9 + 124);
      objc_msgSend(v6, "setHidden:", a2);

      objc_msgSend(v9, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", a2);

      WeakRetained = v9;
    }
  }

}

- (void)_menuBarHeightChange:(id)a3
{
  float v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  -[NSLayoutConstraint setConstant:](self->_overlayViewAdjustmentConstraint, "setConstant:", (float)-v4);

}

- (void)setMenuBarView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;
  _QWORD v8[5];
  CGRect v9;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_menuBarView);

    if (!v6)
    {
      objc_msgSend(obj, "frame");
      -[NSLayoutConstraint setConstant:](self->_overlayViewAdjustmentConstraint, "setConstant:", -CGRectGetHeight(v9));
    }
    objc_storeWeak((id *)&self->_menuBarView, obj);
    -[NSLayoutConstraint setActive:](self->_overlayViewAdjustmentConstraint, "setActive:", obj != 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__VideosExtrasFeatureContainerViewController_setMenuBarView___block_invoke;
    v8[3] = &unk_1E9F98DF0;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    v5 = obj;
  }

}

void __61__VideosExtrasFeatureContainerViewController_setMenuBarView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  objc_msgSend(WeakRetained, "setAlpha:");

  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "overlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "isHidden"));

}

- (VideosExtrasContext)context
{
  return (VideosExtrasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (VideosExtrasVideoPlaybackViewController)videoPlaybackViewController
{
  return self->_videoPlaybackViewController;
}

- (UIView)menuBarView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_menuBarView);
}

- (double)collectionViewHeight
{
  return self->_collectionViewHeight;
}

- (void)setCollectionViewHeight:(double)a3
{
  self->_collectionViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuBarView);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_overlayViewAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_videoPlaybackViewController, 0);
}

@end
