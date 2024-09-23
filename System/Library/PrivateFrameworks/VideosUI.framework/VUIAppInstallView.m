@implementation VUIAppInstallView

- (VUIAppInstallView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  VUIAppInstallView *v7;
  uint64_t v8;
  UIImageView *appIconImageView;
  UIImageView *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  VUISBIconProgressView *v18;
  VUISBIconProgressView *progressView;
  VUISBIconProgressView *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)VUIAppInstallView;
  v7 = -[VUIAppInstallView initWithFrame:](&v23, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    appIconImageView = v7->_appIconImageView;
    v7->_appIconImageView = (UIImageView *)v8;

    -[UIImageView setClipsToBounds:](v7->_appIconImageView, "setClipsToBounds:", 1);
    -[UIImageView setAutoresizingMask:](v7->_appIconImageView, "setAutoresizingMask:", 18);
    if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") & 1) == 0)
    {
      v10 = v7->_appIconImageView;
      +[VUIAppInstallView _appIconRadius](VUIAppInstallView, "_appIconRadius");
      -[UIImageView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = 1.0 / v12;

      v7->_imageBorderWidth = v13;
      -[UIImageView layer](v7->_appIconImageView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBorderWidth:", v13);

      -[UIImageView layer](v7->_appIconImageView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

      -[UIImageView layer](v7->_appIconImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBorderPathIsBounds:", 1);

    }
    -[VUIAppInstallView addSubview:](v7, "addSubview:", v7->_appIconImageView);
    v18 = -[VUISBIconProgressView initWithFrame:]([VUISBIconProgressView alloc], "initWithFrame:", x, y, width, height);
    progressView = v7->_progressView;
    v7->_progressView = v18;

    -[VUISBIconProgressView setDelegate:](v7->_progressView, "setDelegate:", v7);
    v20 = v7->_progressView;
    objc_msgSend((id)objc_opt_class(), "_progressMaskImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISBIconProgressView setOverlayImage:](v20, "setOverlayImage:", v21);

    -[VUISBIconProgressView setAutoresizingMask:](v7->_progressView, "setAutoresizingMask:", 18);
    -[UIImageView addSubview:](v7->_appIconImageView, "addSubview:", v7->_progressView);
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_appIconSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIAppInstallView;
  -[VUIAppInstallView layoutSubviews](&v11, sel_layoutSubviews);
  -[VUIAppInstallView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_appIconImageView, "setFrame:");
  -[VUISBIconProgressView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
}

- (void)dealloc
{
  objc_super v3;

  -[VUISBIconProgressView setDelegate:](self->_progressView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUIAppInstallView;
  -[VUIAppInstallView dealloc](&v3, sel_dealloc);
}

- (void)progressViewCanBeRemoved:(id)a3
{
  void (**completion)(id, SEL, id);
  id v5;

  completion = (void (**)(id, SEL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a2, a3);
    v5 = self->_completion;
    self->_completion = 0;

    -[VUIAppInstallView _makeImageBorderVisible:](self, "_makeImageBorderVisible:", 1);
  }
}

- (void)finishInstallationWithCompletion:(id)a3
{
  void *v4;
  id completion;

  v4 = (void *)objc_msgSend(a3, "copy");
  completion = self->_completion;
  self->_completion = v4;

  -[VUISBIconProgressView setState:paused:fractionLoaded:animated:](self->_progressView, "setState:paused:fractionLoaded:animated:", 0, 0, 1, 1.0);
}

- (void)setAppIcon:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_appIcon != v5)
  {
    objc_storeStrong((id *)&self->_appIcon, a3);
    -[UIImageView setImage:](self->_appIconImageView, "setImage:", v5);
  }

}

- (void)setInstallProgress:(double)a3
{
  if (vabdd_f64(self->_installProgress, a3) > 0.00000011920929)
  {
    self->_installProgress = a3;
    -[VUISBIconProgressView setState:paused:fractionLoaded:animated:](self->_progressView, "setState:paused:fractionLoaded:animated:", 2, 0, 1);
    -[VUIAppInstallView _makeImageBorderVisible:](self, "_makeImageBorderVisible:", 0);
  }
}

- (void)setWaiting
{
  -[VUISBIconProgressView setState:paused:fractionLoaded:animated:](self->_progressView, "setState:paused:fractionLoaded:animated:", 1, 0, 0, 0.0);
  -[VUIAppInstallView _makeImageBorderVisible:](self, "_makeImageBorderVisible:", 0);
}

- (void)_makeImageBorderVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double imageBorderWidth;
  id v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") & 1) == 0)
  {
    -[UIImageView layer](self->_appIconImageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    imageBorderWidth = 0.0;
    if (v3)
      imageBorderWidth = self->_imageBorderWidth;
    v7 = v5;
    objc_msgSend(v5, "setBorderWidth:", imageBorderWidth);

  }
}

+ (id)_progressMaskImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CGSize v20;

  v3 = (void *)_progressMaskImage__progressMaskImage;
  if (!_progressMaskImage__progressMaskImage)
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(a1, "_appIconSize");
    v7 = v6;
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;
    v20.width = v7;
    v20.height = v9;
    UIGraphicsBeginImageContextWithOptions(v20, 0, v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFill");

    v14 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(a1, "_appIconRadius");
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v4, v5, v7, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fillWithBlendMode:alpha:", 17, 1.0);

    UIGraphicsGetImageFromCurrentImageContext();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)_progressMaskImage__progressMaskImage;
    _progressMaskImage__progressMaskImage = v17;

    UIGraphicsEndImageContext();
    v3 = (void *)_progressMaskImage__progressMaskImage;
  }
  return v3;
}

+ (double)_appIconRadius
{
  double result;

  objc_msgSend(a1, "_appIconSize");
  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  return result;
}

+ (CGSize)_appIconSize
{
  void *v2;
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 2;

  v4 = dbl_1DA1C24D0[v3];
  v5 = dbl_1DA1C24E0[v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (double)installProgress
{
  return self->_installProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_backgroundKnockoutView, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
}

@end
