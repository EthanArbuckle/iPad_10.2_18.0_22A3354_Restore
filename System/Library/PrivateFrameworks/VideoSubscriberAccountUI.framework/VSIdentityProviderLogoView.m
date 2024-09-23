@implementation VSIdentityProviderLogoView

- (VSIdentityProviderLogoView)initWithFrame:(CGRect)a3
{
  VSIdentityProviderLogoView *v3;
  VSIdentityProviderLogoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderLogoView;
  v3 = -[VSIdentityProviderLogoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit_4(v3);
  return v4;
}

- (VSIdentityProviderLogoView)initWithCoder:(id)a3
{
  VSIdentityProviderLogoView *v3;
  VSIdentityProviderLogoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderLogoView;
  v3 = -[VSIdentityProviderLogoView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_4(v3);
  return v4;
}

- (CGRect)_imageViewFrame
{
  double v3;
  CGFloat v4;
  CGRect v5;

  -[VSIdentityProviderLogoView marginLength](self, "marginLength");
  v4 = v3;
  -[VSIdentityProviderLogoView bounds](self, "bounds");
  return CGRectInset(v5, v4, v4);
}

- (double)_height
{
  return 133.0;
}

- (void)setLogo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VSIdentityProviderLogoView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[VSIdentityProviderLogoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (UIImage)logo
{
  void *v2;
  void *v3;

  -[VSIdentityProviderLogoView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (double)marginLength
{
  return 30.0;
}

- (CGSize)preferredImageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[VSIdentityProviderLogoView _imageViewFrame](self, "_imageViewFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[VSIdentityProviderLogoView _height](self, "_height");
  v4 = v3;
  -[VSIdentityProviderLogoView logo](self, "logo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  if (v7 == *MEMORY[0x24BDBF148] && v9 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[VSIdentityProviderLogoView preferredImageSize](self, "preferredImageSize");
    v11 = v12;
  }
  else
  {
    v11 = v4 * v7 / v9;
  }
  -[VSIdentityProviderLogoView marginLength](self, "marginLength");
  v14 = v11 + v13 + v13;
  v15 = v4;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderLogoView;
  -[VSIdentityProviderLogoView layoutSubviews](&v4, sel_layoutSubviews);
  -[VSIdentityProviderLogoView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView _imageViewFrame](self, "_imageViewFrame");
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[VSIdentityProviderLogoView _height](self, "_height", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
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
}

@end
