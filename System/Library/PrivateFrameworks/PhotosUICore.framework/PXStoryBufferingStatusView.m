@implementation PXStoryBufferingStatusView

- (PXStoryBufferingStatusView)initWithFrame:(CGRect)a3
{
  PXStoryBufferingStatusView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinnerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryBufferingStatusView;
  v3 = -[PXStoryBufferingStatusView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 9);
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIActivityIndicatorView *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v3->_spinnerView, "setColor:", v6);

    -[PXStoryBufferingStatusView addSubview:](v3, "addSubview:", v3->_spinnerView);
    -[PXStoryBufferingStatusView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXStoryBufferingStatusView;
  -[PXStoryBufferingStatusView layoutSubviews](&v10, sel_layoutSubviews);
  -[PXStoryBufferingStatusView bounds](self, "bounds");
  PXRectGetCenter();
  v4 = v3;
  v6 = v5;
  -[PXStoryBufferingStatusView spinnerView](self, "spinnerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  -[PXStoryBufferingStatusView userData](self, "userData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "wantsBackground") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryBufferingStatusView setBackgroundColor:](self, "setBackgroundColor:", v9);

  }
  else
  {
    -[PXStoryBufferingStatusView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }

}

- (void)_updateAnimation
{
  void *v3;
  UIActivityIndicatorView *spinnerView;

  -[PXStoryBufferingStatusView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  spinnerView = self->_spinnerView;
  if (v3)
    -[UIActivityIndicatorView startAnimating](spinnerView, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](spinnerView, "stopAnimating");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryBufferingStatusView;
  -[PXStoryBufferingStatusView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXStoryBufferingStatusView _updateAnimation](self, "_updateAnimation");
}

- (void)setUserData:(id)a3
{
  PXStoryBufferingStatusViewConfiguration *v4;
  PXStoryBufferingStatusViewConfiguration *userData;

  v4 = (PXStoryBufferingStatusViewConfiguration *)objc_msgSend(a3, "copy");
  userData = self->_userData;
  self->_userData = v4;

  -[PXStoryBufferingStatusView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  -[PXStoryBufferingStatusView setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXStoryBufferingStatusViewConfiguration)userData
{
  return self->_userData;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
