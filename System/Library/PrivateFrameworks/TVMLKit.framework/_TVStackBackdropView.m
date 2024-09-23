@implementation _TVStackBackdropView

- (_TVStackBackdropView)initWithBlurEffectStyle:(int64_t)a3
{
  _TVStackBackdropView *v4;
  _TVStackBackdropView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIVisualEffectView *visualEffectView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TVStackBackdropView;
  v4 = -[_TVStackBackdropView init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_blurEffectStyle = a3;
    v6 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithEffect:", v7);
    visualEffectView = v5->_visualEffectView;
    v5->_visualEffectView = (UIVisualEffectView *)v8;

    -[_TVStackBackdropView addSubview:](v5, "addSubview:", v5->_visualEffectView);
  }
  return v5;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  UIVisualEffectView *visualEffectView;
  id v4;

  if (self->_blurEffectStyle != a3)
  {
    self->_blurEffectStyle = a3;
    visualEffectView = self->_visualEffectView;
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](visualEffectView, "setEffect:", v4);

  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[_TVStackBackdropView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  UIImageView *imageView;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_TVStackBackdropView;
  -[_TVStackBackdropView layoutSubviews](&v13, sel_layoutSubviews);
  -[_TVStackBackdropView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_TVStackBackdropView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  imageView = self->_imageView;
  if (v7)
  {
    if (!imageView)
    {
      _TVStackMakeImageView();
      v9 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageView;
      self->_imageView = v9;

      -[_TVStackBackdropView insertSubview:below:](self, "insertSubview:below:", self->_imageView, self->_visualEffectView);
      imageView = self->_imageView;
    }
    -[_TVStackBackdropView image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](imageView, "setImage:", v11);

    -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v4, v6);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    v12 = self->_imageView;
    self->_imageView = 0;

  }
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
