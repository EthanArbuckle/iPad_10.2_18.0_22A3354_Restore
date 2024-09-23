@implementation PXMessagesStackActivityIndicatorView

- (PXMessagesStackActivityIndicatorView)initWithFrame:(CGRect)a3
{
  PXMessagesStackActivityIndicatorView *v3;
  void *v4;
  uint64_t v5;
  UIVisualEffectView *visualEffectView;
  uint64_t v7;
  UIActivityIndicatorView *activityIndicatorView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackActivityIndicatorView;
  v3 = -[PXMessagesStackActivityIndicatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v5;

    -[UIVisualEffectView _setContinuousCornerRadius:](v3->_visualEffectView, "_setContinuousCornerRadius:", 5.0);
    -[UIVisualEffectView setClipsToBounds:](v3->_visualEffectView, "setClipsToBounds:", 1);
    -[PXMessagesStackActivityIndicatorView addSubview:](v3, "addSubview:", v3->_visualEffectView);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = (UIActivityIndicatorView *)v7;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_activityIndicatorView, "setHidesWhenStopped:", 0);
    -[UIActivityIndicatorView startAnimating](v3->_activityIndicatorView, "startAnimating");
    -[UIVisualEffectView contentView](v3->_visualEffectView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_activityIndicatorView);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMessagesStackActivityIndicatorView;
  -[PXMessagesStackActivityIndicatorView layoutSubviews](&v6, sel_layoutSubviews);
  -[UIActivityIndicatorView sizeThatFits:](self->_activityIndicatorView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  PXSizeAdd();
  -[PXMessagesStackActivityIndicatorView bounds](self, "bounds");
  PXRectGetCenter();
  -[PXMessagesStackActivityIndicatorView px_screenScale](self, "px_screenScale");
  PXPointCeilingToPixel();
  PXRectWithCenterAndSize();
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
  -[UIActivityIndicatorView superview](self->_activityIndicatorView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  PXRectGetCenter();

  PXRectWithCenterAndSize();
  -[UIActivityIndicatorView setFrame:](self->_activityIndicatorView, "setFrame:", v4 + 1.0, v5 + 1.0);
}

- (void)setUserData:(id)a3
{
  PXMessagesStackActivityIndicatorViewUserData *v4;
  PXMessagesStackActivityIndicatorViewUserData *v5;
  char v6;
  PXMessagesStackActivityIndicatorViewUserData *v7;
  PXMessagesStackActivityIndicatorViewUserData *userData;
  PXMessagesStackActivityIndicatorViewUserData *v9;

  v9 = (PXMessagesStackActivityIndicatorViewUserData *)a3;
  v4 = self->_userData;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = v4;
    v6 = -[PXMessagesStackActivityIndicatorViewUserData isEqual:](v4, "isEqual:", v9);

    if ((v6 & 1) == 0)
    {
      v7 = -[PXMessagesStackActivityIndicatorViewUserData copyWithZone:](v9, "copyWithZone:", 0);
      userData = self->_userData;
      self->_userData = v7;

      if (self->_userData)
        -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
    }
  }

}

- (NSCopying)userData
{
  return (NSCopying *)self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
