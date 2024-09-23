@implementation STSLoadMoreFooter

- (STSLoadMoreFooter)initWithFrame:(CGRect)a3
{
  STSLoadMoreFooter *v3;
  uint64_t v4;
  UIActivityIndicatorView *activityIndicator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSLoadMoreFooter;
  v3 = -[STSLoadMoreFooter initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 4);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    -[STSLoadMoreFooter addSubview:](v3, "addSubview:", v3->_activityIndicator);
  }
  return v3;
}

+ (double)defaultHeight
{
  return 44.0;
}

- (void)layoutSubviews
{
  UIImageView *providerIconView;

  -[STSLoadMoreFooter bounds](self, "bounds");
  -[UIActivityIndicatorView bounds](self->_activityIndicator, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0x3FF0000000000000);
  providerIconView = self->_providerIconView;
  if (providerIconView)
  {
    -[UIImageView bounds](providerIconView, "bounds");
    UIRectCenteredYInRectScale();
    -[UIImageView setFrame:](self->_providerIconView, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_handleLogoTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[STSLoadMoreFooter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[STSLoadMoreFooter delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadMoreFooterDidTapLogo");

  }
}

- (void)setLoading:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
      -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
  }
}

- (void)setSearchProviderImage:(id)a3
{
  UIImage *v5;
  UIImage **p_searchProviderImage;
  UIImageView *providerIconView;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  UIImage *v13;

  v5 = (UIImage *)a3;
  p_searchProviderImage = &self->_searchProviderImage;
  if (self->_searchProviderImage != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_searchProviderImage, a3);
    providerIconView = self->_providerIconView;
    if (providerIconView)
    {
      -[UIImageView setImage:](providerIconView, "setImage:", *p_searchProviderImage);
    }
    else
    {
      v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", *p_searchProviderImage);
      v9 = self->_providerIconView;
      self->_providerIconView = v8;

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleLogoTap_);
      -[UIImageView addGestureRecognizer:](self->_providerIconView, "addGestureRecognizer:", v10);
      -[UIImageView setUserInteractionEnabled:](self->_providerIconView, "setUserInteractionEnabled:", 1);
      v11 = self->_providerIconView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "sts_providerImageColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v11, "setTintColor:", v12);

      -[STSLoadMoreFooter addSubview:](self, "addSubview:", self->_providerIconView);
    }
    -[STSLoadMoreFooter setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (STSLoadMoreFooterDelegate)delegate
{
  return (STSLoadMoreFooterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerIconView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
