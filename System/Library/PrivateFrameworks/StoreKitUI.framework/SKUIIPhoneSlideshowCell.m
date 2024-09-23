@implementation SKUIIPhoneSlideshowCell

- (SKUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIIPhoneSlideshowCell *v8;
  UIImageView *v9;
  UIImageView *imageView;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneSlideshowCell initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIIPhoneSlideshowCell;
  v8 = -[SKUIIPhoneSlideshowCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 1);
    -[SKUIIPhoneSlideshowCell contentView](v8, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8->_imageView);

  }
  return v8;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGRect)imageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_imageView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    -[SKUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[SKUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVideo:(BOOL)a3
{
  UIImageView *playIcon;
  _BOOL4 v5;
  UIImageView *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;
  id v13;

  playIcon = self->_playIcon;
  if ((((playIcon == 0) ^ a3) & 1) == 0)
  {
    v5 = a3;
    -[UIImageView removeFromSuperview](playIcon, "removeFromSuperview");
    v6 = self->_playIcon;
    self->_playIcon = 0;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0DC3870];
      if (-[SKUIIPhoneSlideshowCell isHighlighted](self, "isHighlighted"))
        v8 = CFSTR("PlayControlPressed");
      else
        v8 = CFSTR("PlayControl");
      objc_msgSend(v7, "imageNamed:inBundle:", v8, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
      v11 = self->_playIcon;
      self->_playIcon = v10;

      -[SKUIIPhoneSlideshowCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_playIcon);

      -[SKUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)isVideo
{
  return self->_playIcon != 0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIIPhoneSlideshowCell;
  -[SKUIIPhoneSlideshowCell setHighlighted:](&v9, sel_setHighlighted_);
  if (self->_playIcon)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    if (v3)
      v6 = CFSTR("PlayControlPressed");
    else
      v6 = CFSTR("PlayControl");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_playIcon, "setImage:", v8);
    -[SKUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *imageView;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  float v15;
  float v16;
  UIImageView *playIcon;
  UIImageView *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SKUIIPhoneSlideshowCell;
  -[SKUIIPhoneSlideshowCell layoutSubviews](&v19, sel_layoutSubviews);
  -[SKUIIPhoneSlideshowCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  imageView = self->_imageView;
  if (imageView)
  {
    width = self->_imageSize.width;
    height = self->_imageSize.height;
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIImageView image](imageView, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      width = v13;
      height = v14;

      imageView = self->_imageView;
    }
    v15 = (v5 - fmin(width, v5)) * 0.5;
    v16 = (v7 - fmin(height, v7)) * 0.5;
    -[UIImageView setFrame:](imageView, "setFrame:", roundf(v15), roundf(v16));
  }
  playIcon = self->_playIcon;
  if (playIcon)
  {
    -[UIImageView sizeToFit](playIcon, "sizeToFit");
    -[UIImageView frame](self->_playIcon, "frame");
    v18 = self->_playIcon;
    -[SKUIIPhoneSlideshowCell center](self, "center");
    -[UIImageView setCenter:](v18, "setCenter:");
    -[SKUIIPhoneSlideshowCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_playIcon);
  }
}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playIcon, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPhoneSlideshowCell initWithFrame:]";
}

@end
