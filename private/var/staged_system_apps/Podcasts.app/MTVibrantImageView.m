@implementation MTVibrantImageView

- (MTVibrantImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MTVibrantImageView *v7;
  UIImageView *v8;
  UIImageView *imageView;
  UIView *v10;
  UIView *vibrancyView;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MTVibrantImageView;
  v7 = -[MTVibrantImageView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = v8;

    -[UIImageView setAutoresizingMask:](v7->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 2);
    -[MTVibrantImageView addSubview:](v7, "addSubview:", v7->_imageView);
    v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    vibrancyView = v7->_vibrancyView;
    v7->_vibrancyView = v10;

    v12 = kCAFilterPlusL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7->_vibrancyView, "layer"));
    objc_msgSend(v13, "setCompositingFilter:", v12);

    -[UIView setAutoresizingMask:](v7->_vibrancyView, "setAutoresizingMask:", 18);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[UIView setBackgroundColor:](v7->_vibrancyView, "setBackgroundColor:", v14);

    -[MTVibrantImageView addSubview:](v7, "addSubview:", v7->_vibrancyView);
  }
  return v7;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (id)compositingFilter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_vibrancyView, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "compositingFilter"));

  return v3;
}

- (void)setCompositingFilter:(id)a3
{
  UIView *vibrancyView;
  id v4;
  id v5;

  vibrancyView = self->_vibrancyView;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](vibrancyView, "layer"));
  objc_msgSend(v5, "setCompositingFilter:", v4);

}

- (UIColor)vibrancyColor
{
  return -[UIView backgroundColor](self->_vibrancyView, "backgroundColor");
}

- (void)setVibrancyColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_vibrancyView, "setBackgroundColor:", a3);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
