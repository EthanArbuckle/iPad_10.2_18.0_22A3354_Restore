@implementation FullscreenImageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (FullscreenImageViewController)initWithImage:(id)a3 scrollable:(BOOL)a4
{
  id v7;
  FullscreenImageViewController *v8;
  FullscreenImageViewController *v9;
  FullscreenImageViewController *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FullscreenImageViewController;
  v8 = -[FullscreenImageViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    v9->_isScrollable = a4;
    v10 = v9;
  }

  return v9;
}

- (FullscreenImageViewController)initWithView:(id)a3 scrollable:(BOOL)a4
{
  id v7;
  FullscreenImageViewController *v8;
  FullscreenImageViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FullscreenImageViewController;
  v8 = -[FullscreenImageViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentView, a3);
    v9->_isScrollable = a4;
  }

  return v9;
}

- (FullscreenImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[FullscreenImageViewController initWithImage:scrollable:](self, "initWithImage:scrollable:", 0, 1);
}

- (FullscreenImageViewController)initWithCoder:(id)a3
{
  return -[FullscreenImageViewController initWithImage:scrollable:](self, "initWithImage:scrollable:", 0, 1);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *contentView;
  UIView *v25;
  void *v26;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  UINavigationBar *v31;
  UINavigationBar *topBar;
  id v33;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)FullscreenImageViewController;
  -[FullscreenImageViewController viewDidLoad](&v72, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setDecelerationRate:](self->_scrollView, "setDecelerationRate:", 0.850000024);
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", 3.0);
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_scrollView);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  contentView = self->_contentView;
  if (!contentView)
  {
    v25 = (UIView *)objc_alloc_init((Class)UIImageView);
    -[UIView setImage:](v25, "setImage:", self->_image);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UIView setContentMode:](v25, "setContentMode:", 1);
    v27 = self->_contentView;
    self->_contentView = v25;

    contentView = self->_contentView;
  }
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", contentView);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
  objc_msgSend(v28, "setEffect:", v29);

  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v30, "addSubview:", v28);

  v31 = (UINavigationBar *)objc_alloc_init((Class)UINavigationBar);
  topBar = self->_topBar;
  self->_topBar = v31;

  -[UINavigationBar setTranslatesAutoresizingMaskIntoConstraints:](self->_topBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UINavigationBar setBarStyle:](self->_topBar, "setBarStyle:", 1);
  -[UINavigationBar setTranslucent:](self->_topBar, "setTranslucent:", 1);
  v33 = objc_alloc_init((Class)UIImage);
  -[UINavigationBar setBackgroundImage:forBarMetrics:](self->_topBar, "setBackgroundImage:forBarMetrics:", v33, 0);
  -[UINavigationBar setShadowImage:](self->_topBar, "setShadowImage:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UINavigationBar setTintColor:](self->_topBar, "setTintColor:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v35, "addSubview:", self->_topBar);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar leadingAnchor](self->_topBar, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
  objc_msgSend(v39, "setActive:", 1);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar trailingAnchor](self->_topBar, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  objc_msgSend(v43, "setActive:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar topAnchor](self->_topBar, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "safeAreaLayoutGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v47));
  objc_msgSend(v48, "setActive:", 1);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v51));
  objc_msgSend(v52, "setActive:", 1);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v55));
  objc_msgSend(v56, "setActive:", 1);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v59));
  objc_msgSend(v60, "setActive:", 1);

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar bottomAnchor](self->_topBar, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
  objc_msgSend(v63, "setActive:", 1);

  v64 = objc_alloc((Class)UINavigationItem);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController title](self, "title"));
  v66 = objc_msgSend(v64, "initWithTitle:", v65);

  v67 = objc_alloc((Class)UIBarButtonItem);
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_imageNamed:](UIImage, "_mapkit_imageNamed:", CFSTR("UI_close")));
  v69 = objc_msgSend(v67, "initWithImage:style:target:action:", v68, 0, self, "_close:");

  objc_msgSend(v66, "setRightBarButtonItem:", v69);
  -[UINavigationBar pushNavigationItem:animated:](self->_topBar, "pushNavigationItem:animated:", v66, 0);
  v70 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "zoomToPoint:");
  objc_msgSend(v70, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v70, "setDelaysTouchesBegan:", 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v71, "addGestureRecognizer:", v70);

}

- (void)_updateMaxZoomScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  -[UIImage size](self->_image, "size");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v4 / v6;

  -[UIImage size](self->_image, "size");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v9 / v11;

  if (v7 <= v12)
    v13 = v12;
  else
    v13 = v7;
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", fmax(v13, 3.0));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");

  -[FullscreenImageViewController _updateMaxZoomScale](self, "_updateMaxZoomScale");
  v4.receiver = self;
  v4.super_class = (Class)FullscreenImageViewController;
  -[FullscreenImageViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
}

- (void)_close:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 4, 613, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FullscreenImageViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)zoomToPoint:(id)a3
{
  double v4;
  double v5;
  UIScrollView *scrollView;
  double v7;
  double v8;
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

  objc_msgSend(a3, "locationInView:", self->_scrollView);
  if (self->_isZoomed)
  {
    self->_isZoomed = 0;
    scrollView = self->_scrollView;
    -[UIScrollView minimumZoomScale](scrollView, "minimumZoomScale");
    -[UIScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1);
  }
  else
  {
    v7 = v4;
    v8 = v5;
    self->_isZoomed = 1;
    -[UIScrollView frame](self->_scrollView, "frame");
    v10 = v9;
    -[UIScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
    v12 = v10 / v11;
    -[UIScrollView frame](self->_scrollView, "frame");
    v14 = v13;
    -[UIScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
    v16 = v14 / v15;
    if (v7 - v12 * 0.5 >= 0.0)
      v17 = v7 - v12 * 0.5;
    else
      v17 = 0.0;
    if (v8 - v16 * 0.5 >= 0.0)
      v18 = v8 - v16 * 0.5;
    else
      v18 = 0.0;
    -[UIScrollView frame](self->_scrollView, "frame");
    if (v12 + v17 > v19)
      -[UIScrollView frame](self->_scrollView, "frame");
    -[UIScrollView frame](self->_scrollView, "frame");
    if (v16 + v18 > v20)
      -[UIScrollView frame](self->_scrollView, "frame");
    -[UIScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if (self->_isScrollable)
    return self->_contentView;
  else
    return 0;
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a3;
  objc_msgSend(v6, "zoomScale");
  v8 = v7;
  objc_msgSend(v6, "minimumZoomScale");
  v10 = v9;

  self->_isZoomed = v8 != v10;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
