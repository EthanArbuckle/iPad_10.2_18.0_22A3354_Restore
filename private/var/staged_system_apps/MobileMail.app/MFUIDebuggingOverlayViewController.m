@implementation MFUIDebuggingOverlayViewController

- (MFUIDebuggingOverlayViewController)initWithSpecImage:(id)a3
{
  id v4;
  MFUIDebuggingOverlayViewController *v5;
  MFUIDebuggingOverlayViewController *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFUIDebuggingOverlayViewController;
  v5 = -[MFUIDebuggingOverlayViewController init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[MFUIDebuggingOverlayViewController setSpecImage:](v5, "setSpecImage:", v4);
    v7 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v6, "doubleTappedView:");
    objc_msgSend(v7, "setNumberOfTapsRequired:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController view](v6, "view"));
    objc_msgSend(v8, "addGestureRecognizer:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController view](v6, "view"));
    objc_msgSend(v9, "setAlpha:", 0.5);

    -[MFUIDebuggingOverlayViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 4);
  }

  return v6;
}

- (void)doubleTappedView:(id)a3
{
  -[MFUIDebuggingOverlayViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *specImageView;
  void *v7;
  UIImageView *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFUIDebuggingOverlayViewController;
  -[MFUIDebuggingOverlayViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
  specImageView = self->_specImageView;
  self->_specImageView = v5;

  -[UIImageView setAutoresizingMask:](self->_specImageView, "setAutoresizingMask:", 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController view](self, "view"));
  LODWORD(v3) = objc_msgSend(v7, "mf_prefersRightToLeftInterfaceLayout");

  if ((_DWORD)v3)
    -[UIImageView setContentMode:](self->_specImageView, "setContentMode:", 10);
  v8 = self->_specImageView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController specImage](self, "specImage"));
  -[UIImageView setImage:](v8, "setImage:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFUIDebuggingOverlayViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", self->_specImageView);

}

- (void)setSpecImage:(id)a3
{
  UIImage **p_specImage;
  UIImage *v6;

  p_specImage = &self->_specImage;
  v6 = (UIImage *)a3;
  if (*p_specImage != v6)
  {
    objc_storeStrong((id *)&self->_specImage, a3);
    -[UIImageView setImage:](self->_specImageView, "setImage:", *p_specImage);
  }

}

- (UIImage)specImage
{
  return self->_specImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specImage, 0);
  objc_storeStrong((id *)&self->_specImageView, 0);
}

@end
