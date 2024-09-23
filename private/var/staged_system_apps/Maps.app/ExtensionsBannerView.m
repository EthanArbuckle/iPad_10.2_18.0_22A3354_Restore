@implementation ExtensionsBannerView

- (ExtensionsBannerView)initWithCoder:(id)a3
{
  ExtensionsBannerView *v3;
  ExtensionsBannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerView;
  v3 = -[ExtensionsBannerView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsBannerView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsBannerView)initWithFrame:(CGRect)a3
{
  ExtensionsBannerView *v3;
  ExtensionsBannerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerView;
  v3 = -[ExtensionsBannerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsBannerView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIView *v3;
  UIView *occludingView;
  void *v5;

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  occludingView = self->_occludingView;
  self->_occludingView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_occludingView, "layer"));
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  -[ExtensionsBannerView addSubview:](self, "addSubview:", self->_occludingView);
  -[ExtensionsBannerView _updateConstraints](self, "_updateConstraints");
}

- (void)_updateConstraints
{
  id v3;

  -[ExtensionsBannerView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_occludingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsForCenteringInView:](self->_occludingView, "_maps_constraintsForCenteringInView:", self));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

}

- (void)setRemoteView:(id)a3
{
  UIView *v5;
  UIView *remoteView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  remoteView = self->_remoteView;
  if (remoteView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](remoteView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_remoteView, a3);
    v5 = v8;
    if (v8)
    {
      -[ExtensionsBannerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v8, self->_occludingView);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsForCenteringInView:](v8, "_maps_constraintsForCenteringInView:", self));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

      v5 = v8;
    }
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 137.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIView)remoteView
{
  return self->_remoteView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteView, 0);
  objc_storeStrong((id *)&self->_occludingView, 0);
}

@end
