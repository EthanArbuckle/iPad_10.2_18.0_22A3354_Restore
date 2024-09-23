@implementation PXPlaceholderView

- (void)setShouldShowIndicatorView:(BOOL)a3
{
  if (self->_shouldShowIndicatorView != a3)
  {
    self->_shouldShowIndicatorView = a3;
    -[PXPlaceholderView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)prepareForReuse
{
  -[PXPlaceholderView setHidden:](self, "setHidden:", 0);
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
  -[UIActivityIndicatorView setHidden:](self->_indicator, "setHidden:", 0);
}

- (void)becomeReusable
{
  -[PXPlaceholderView setHidden:](self, "setHidden:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_indicator, "stopAnimating");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPlaceholderView;
  -[PXPlaceholderView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIActivityIndicatorView sizeToFit](self->_indicator, "sizeToFit");
  -[PXPlaceholderView bounds](self, "bounds");
  PXRectGetCenter();
  -[UIActivityIndicatorView frame](self->_indicator, "frame");
  PXRectWithCenterAndSize();
  -[UIActivityIndicatorView setFrame:](self->_indicator, "setFrame:");
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v5;

  objc_msgSend(a4, "viewSpec", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView px_setSpec:](self, "px_setSpec:", v5);

}

- (void)_updateSubviews
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *indicator;
  void *v5;
  UIActivityIndicatorView *v6;

  if (self->_shouldShowIndicatorView)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    indicator = self->_indicator;
    self->_indicator = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_indicator, "setColor:", v5);

    -[PXPlaceholderView addSubview:](self, "addSubview:", self->_indicator);
    -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
  }
  else
  {
    -[UIActivityIndicatorView removeFromSuperview](self->_indicator, "removeFromSuperview");
    v6 = self->_indicator;
    self->_indicator = 0;

  }
}

- (BOOL)shouldShowIndicatorView
{
  return self->_shouldShowIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
