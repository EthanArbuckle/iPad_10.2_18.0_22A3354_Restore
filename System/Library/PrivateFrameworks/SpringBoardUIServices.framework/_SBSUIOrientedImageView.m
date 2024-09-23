@implementation _SBSUIOrientedImageView

- (_SBSUIOrientedImageView)initWithFrame:(CGRect)a3
{
  _SBSUIOrientedImageView *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBSUIOrientedImageView;
  v3 = -[_SBSUIOrientedImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[_SBSUIOrientedImageView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    -[_SBSUIOrientedImageView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_SBSUIOrientedImageView;
  -[_SBSUIOrientedImageView layoutSubviews](&v15, sel_layoutSubviews);
  imageView = self->_imageView;
  -[_SBSUIOrientedImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
  -[_SBSUIOrientedImageView frame](self, "frame");
  v5 = v4;
  -[_SBSUIOrientedImageView portraitImage](self, "portraitImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  if (v8 <= v5)
    -[_SBSUIOrientedImageView portraitImage](self, "portraitImage");
  else
    -[_SBSUIOrientedImageView landscapeImage](self, "landscapeImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = self->_imageView;
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41___SBSUIOrientedImageView_layoutSubviews__block_invoke;
    v13[3] = &unk_1E4C3E6A0;
    v13[4] = self;
    v14 = v9;
    objc_msgSend(v12, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v13, 0, 0.0);

  }
}

- (UIImage)portraitImage
{
  return self->_portraitImage;
}

- (void)setPortraitImage:(id)a3
{
  objc_storeStrong((id *)&self->_portraitImage, a3);
}

- (UIImage)landscapeImage
{
  return self->_landscapeImage;
}

- (void)setLandscapeImage:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeImage, 0);
  objc_storeStrong((id *)&self->_portraitImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
