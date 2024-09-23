@implementation STSSuggestionFooter

- (void)layoutSubviews
{
  double v3;
  double v4;

  if (self->_imageView)
  {
    -[STSSuggestionFooter bounds](self, "bounds");
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v3 + 0.0, v4 + 4.0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIImageView bounds](self->_imageView, "bounds", a3.width, a3.height);
  v4 = v3 + 0.0;
  v6 = v5 + 18.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setSearchProviderImage:(id)a3
{
  UIImage *v5;
  UIImage **p_searchProviderImage;
  UIImageView *imageView;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  double v12;
  double v13;
  UIImage *v14;

  v5 = (UIImage *)a3;
  p_searchProviderImage = &self->_searchProviderImage;
  if (self->_searchProviderImage != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_searchProviderImage, a3);
    imageView = self->_imageView;
    if (imageView)
    {
      -[UIImageView setImage:](imageView, "setImage:", *p_searchProviderImage);
    }
    else
    {
      v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", *p_searchProviderImage);
      v9 = self->_imageView;
      self->_imageView = v8;

      v10 = self->_imageView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "sts_providerImageColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v10, "setTintColor:", v11);

      -[STSSuggestionFooter addSubview:](self, "addSubview:", self->_imageView);
    }
    -[UIImageView bounds](self->_imageView, "bounds");
    -[STSSuggestionFooter setBounds:](self, "setBounds:", 0.0, 0.0, v12 + 0.0, v13 + 18.0);
    -[STSSuggestionFooter setNeedsLayout](self, "setNeedsLayout");
    v5 = v14;
  }

}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
