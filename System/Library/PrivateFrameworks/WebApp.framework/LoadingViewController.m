@implementation LoadingViewController

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (LoadingViewController)initWithWebClip:(id)a3 orientation:(int64_t)a4
{
  id v6;
  LoadingViewController *v7;
  void *v8;

  v6 = a3;
  v7 = -[LoadingViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  -[LoadingViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  -[LoadingViewController setModalPresentationCapturesStatusBarAppearance:](v7, "setModalPresentationCapturesStatusBarAppearance:", 1);
  -[LoadingViewController setModalTransitionStyle:](v7, "setModalTransitionStyle:", 2);
  v7->_orientation = a4;
  objc_msgSend(v6, "webClipStatusBarStyle");
  v7->_preferredStatusBarStyle = UIStatusBarStyleFromUIWebClipStatusBarStyle();
  objc_msgSend(v6, "getStartupImage:", v7->_orientation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", v7->_orientation, &v7->_imageIsFullScreen))objc_storeStrong((id *)&v7->_image, v8);
  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v2;

  v2 = self->_orientation - 1;
  if (v2 > 3)
    return 30;
  else
    return qword_22E293258[v2];
}

- (void)loadView
{
  id v3;
  UIImageView *v4;
  UIImageView *imageView;
  UIView *v6;
  UIView *statusBarView;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v3, "setBackgroundColor:", v9);
  -[LoadingViewController setView:](self, "setView:", v3);
  if (self->_image)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = self->_imageView;
    self->_imageView = v4;

    -[UIImageView setImage:](self->_imageView, "setImage:", self->_image);
    objc_msgSend(v3, "addSubview:", self->_imageView);
  }
  if (!self->_imageIsFullScreen)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    statusBarView = self->_statusBarView;
    self->_statusBarView = v6;

    if (-[LoadingViewController preferredStatusBarStyle](self, "preferredStatusBarStyle"))
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_statusBarView, "setBackgroundColor:", v8);

    }
    else
    {
      -[UIView setBackgroundColor:](self->_statusBarView, "setBackgroundColor:", v9);
    }
    objc_msgSend(v3, "addSubview:", self->_statusBarView);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
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
  CGFloat Width;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17.receiver = self;
  v17.super_class = (Class)LoadingViewController;
  -[LoadingViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[LoadingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "statusBarHeightForOrientation:", self->_orientation);
  v13 = v12;
  -[LoadingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = 0.0;
  -[UIView setFrame:](self->_statusBarView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v18), v13);

  if (self->_imageIsFullScreen)
  {
    v15 = v5;
  }
  else
  {
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    Width = CGRectGetWidth(v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    v11 = CGRectGetHeight(v20) - v13;
    v9 = Width;
    v7 = v13;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
