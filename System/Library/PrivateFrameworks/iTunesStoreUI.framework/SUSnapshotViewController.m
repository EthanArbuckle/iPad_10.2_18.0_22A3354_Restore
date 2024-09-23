@implementation SUSnapshotViewController

- (SUSnapshotViewController)initWithOriginal:(id)a3
{
  id v5;
  SUSnapshotViewController *v6;
  SUSnapshotViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUSnapshotViewController;
  v6 = -[SUSnapshotViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_originalOrientation = -[SUSnapshotViewController _currentOrientation](v6, "_currentOrientation");
    objc_storeStrong((id *)&v7->_originalViewController, a3);
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUSnapshotViewController setTitle:](v7, "setTitle:", v8);

    -[SUSnapshotViewController navigationItem](v7, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v11);

  }
  return v7;
}

- (void)viewDidLoad
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicatorView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *imageView;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUSnapshotViewController;
  -[SUSnapshotViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v3;

  -[SUSnapshotViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_activityIndicatorView);

  -[SUSnapshotViewController originalViewController](self, "originalViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSnapshotViewController _snapshotOfView:](self, "_snapshotOfView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v8);
  imageView = self->_imageView;
  self->_imageView = v9;

  -[SUSnapshotViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  -[SUSnapshotViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_imageView);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUSnapshotViewController;
  -[SUSnapshotViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[SUSnapshotViewController activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSnapshotViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  objc_msgSend(v3, "setCenter:");

  -[SUSnapshotViewController imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_originalViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUSnapshotViewController;
  -[SUSnapshotViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  v4 = -[SUSnapshotViewController _currentOrientation](self, "_currentOrientation");
  if ((unint64_t)(v4 - 1) > 1)
  {
    if ((unint64_t)(v4 - 3) > 1
      || (unint64_t)(-[SUSnapshotViewController originalOrientation](self, "originalOrientation") - 3) > 1)
    {
      goto LABEL_7;
    }
LABEL_6:
    -[SUSnapshotViewController imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[SUSnapshotViewController _stopActivityIndicator](self, "_stopActivityIndicator");
    return;
  }
  if ((unint64_t)(-[SUSnapshotViewController originalOrientation](self, "originalOrientation") - 1) < 2)
    goto LABEL_6;
LABEL_7:
  -[SUSnapshotViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[SUSnapshotViewController _startActivityIndicator](self, "_startActivityIndicator");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSnapshotViewController;
  -[SUSnapshotViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUSnapshotViewController _stopActivityIndicator](self, "_stopActivityIndicator");
}

- (int64_t)_currentOrientation
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  return v3;
}

- (id)_snapshotOfView:(id)a3
{
  id v3;
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
  void *v15;
  CGSize v17;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;
  v17.width = v9;
  v17.height = v11;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v14);

  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v5, v7, v9, v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (void)_startActivityIndicator
{
  void *v3;
  id v4;

  -[SUSnapshotViewController activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  -[SUSnapshotViewController activityIndicatorView](self, "activityIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)_stopActivityIndicator
{
  void *v3;
  id v4;

  -[SUSnapshotViewController activityIndicatorView](self, "activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[SUSnapshotViewController activityIndicatorView](self, "activityIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  objc_storeStrong((id *)&self->_originalViewController, a3);
}

- (int64_t)originalOrientation
{
  return self->_originalOrientation;
}

- (void)setOriginalOrientation:(int64_t)a3
{
  self->_originalOrientation = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_originalViewController, 0);
}

@end
