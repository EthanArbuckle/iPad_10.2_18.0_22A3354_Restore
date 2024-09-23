@implementation REUpNextImageView

- (REUpNextImageView)initWithFrame:(CGRect)a3
{
  REUpNextImageView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIImageView *foregroundImageView;
  uint64_t v11;
  UIImageView *foregroundAccentImageView;
  uint64_t v13;
  UIImageView *backgroundImageView;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)REUpNextImageView;
  v3 = -[REUpNextImageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    foregroundImageView = v3->_foregroundImageView;
    v3->_foregroundImageView = (UIImageView *)v9;

    -[UIImageView setContentMode:](v3->_foregroundImageView, "setContentMode:", 4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v5, v6, v7, v8);
    foregroundAccentImageView = v3->_foregroundAccentImageView;
    v3->_foregroundAccentImageView = (UIImageView *)v11;

    -[UIImageView setContentMode:](v3->_foregroundAccentImageView, "setContentMode:", 4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v5, v6, v7, v8);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = (UIImageView *)v13;

    -[UIImageView setContentMode:](v3->_backgroundImageView, "setContentMode:", 4);
    -[REUpNextImageView addSubview:](v3, "addSubview:", v3->_backgroundImageView);
    -[REUpNextImageView addSubview:](v3, "addSubview:", v3->_foregroundImageView);
    -[REUpNextImageView addSubview:](v3, "addSubview:", v3->_foregroundAccentImageView);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  UIImage *overrideImage;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  const char *v23;
  __int128 v24;
  CGSize result;

  overrideImage = self->_overrideImage;
  if (overrideImage)
  {
    -[UIImage size](overrideImage, "size");
    if (v4 >= 3.0 || (-[UIImage size](self->_overrideImage, "size"), v5 >= 5.0))
    {
      -[UIImage size](self->_overrideImage, "size");
      v7 = v8;
      v6 = v9;
    }
    else
    {
      v6 = *MEMORY[0x24BDF7FB8];
      v7 = 2.5;
    }
  }
  else if (self->_imageProvider)
  {
    if (-[REUpNextImageView _hasMultipartImages](self, "_hasMultipartImages"))
    {
      v20 = 0;
      v21 = (double *)&v20;
      v22 = 0x3010000000;
      v23 = "";
      v24 = *MEMORY[0x24BDBF148];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __41__REUpNextImageView_intrinsicContentSize__block_invoke;
      v19[3] = &unk_24CF79FF0;
      v19[4] = &v20;
      v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199AF51C](v19);
      -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v11);

      -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v12);

      -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v13);

      v7 = v21[4];
      v6 = v21[5];

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      -[CLKImageProvider onePieceImage](self->_imageProvider, "onePieceImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v7 = v15;
      v6 = v16;

    }
  }
  else
  {
    v7 = *MEMORY[0x24BDF7FB8];
    v6 = *MEMORY[0x24BDF7FB8];
  }
  v17 = v7;
  v18 = v6;
  result.height = v18;
  result.width = v17;
  return result;
}

void __41__REUpNextImageView_intrinsicContentSize__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4 = a2;
  objc_msgSend(v4, "size");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v5;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v4, "size");
  v8 = v7;

  if (v6 >= v8)
    v9 = v6;
  else
    v9 = v8;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v9;
}

- (void)layoutSubviews
{
  UIImageView *foregroundAccentImageView;
  UIImageView *foregroundImageView;
  UIImageView *backgroundImageView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REUpNextImageView;
  -[REUpNextImageView layoutSubviews](&v6, sel_layoutSubviews);
  foregroundAccentImageView = self->_foregroundAccentImageView;
  -[REUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](foregroundAccentImageView, "setFrame:");
  foregroundImageView = self->_foregroundImageView;
  -[REUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  backgroundImageView = self->_backgroundImageView;
  -[REUpNextImageView bounds](self, "bounds");
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
}

- (BOOL)_hasMultipartImages
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[CLKImageProvider twoPieceImageBackground](self->_imageProvider, "twoPieceImageBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CLKImageProvider twoPieceImageForeground](self->_imageProvider, "twoPieceImageForeground");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CLKImageProvider foregroundAccentImage](self->_imageProvider, "foregroundAccentImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6 != 0;

  if (v3)
  {
    v4 = 0;
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)setImageProvider:(id)a3
{
  CLKImageProvider *v5;
  CLKImageProvider **p_imageProvider;
  UIImage *overrideImage;
  _BOOL4 v8;
  UIImageView *foregroundImageView;
  UIImageView *v10;
  void *v11;
  void *v12;
  UIImageView *backgroundImageView;
  void *v14;
  void *v15;
  UIImageView *foregroundAccentImageView;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CLKImageProvider *v21;

  v5 = (CLKImageProvider *)a3;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v5)
  {
    v21 = v5;
    overrideImage = self->_overrideImage;
    self->_overrideImage = 0;

    objc_storeStrong((id *)&self->_imageProvider, a3);
    v8 = -[REUpNextImageView _hasMultipartImages](self, "_hasMultipartImages");
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
    foregroundImageView = self->_foregroundImageView;
    if (v8)
    {
      -[UIImageView setHidden:](foregroundImageView, "setHidden:", 0);
      -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 0);
      v10 = self->_foregroundImageView;
      -[CLKImageProvider twoPieceImageForeground](*p_imageProvider, "twoPieceImageForeground");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageWithRenderingMode:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v10, "setImage:", v12);

      backgroundImageView = self->_backgroundImageView;
      -[CLKImageProvider twoPieceImageBackground](*p_imageProvider, "twoPieceImageBackground");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithRenderingMode:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](backgroundImageView, "setImage:", v15);

      foregroundAccentImageView = self->_foregroundAccentImageView;
      -[CLKImageProvider foregroundAccentImage](*p_imageProvider, "foregroundAccentImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 1;
    }
    else
    {
      -[UIImageView setHidden:](foregroundImageView, "setHidden:", 1);
      -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 1);
      foregroundAccentImageView = self->_backgroundImageView;
      -[CLKImageProvider onePieceImage](*p_imageProvider, "onePieceImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 2;
    }
    objc_msgSend(v17, "imageWithRenderingMode:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](foregroundAccentImageView, "setImage:", v20);

    -[REUpNextImageView _updateColors](self, "_updateColors");
    -[REUpNextImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v21;
  }

}

- (void)setOverrideImage:(id)a3
{
  UIImage *v5;
  CLKImageProvider *imageProvider;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_overrideImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overrideImage, a3);
    imageProvider = self->_imageProvider;
    self->_imageProvider = 0;

    -[UIImageView setHidden:](self->_foregroundImageView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_foregroundAccentImageView, "setHidden:", 0);
    -[UIImageView setImage:](self->_foregroundAccentImageView, "setImage:", self->_overrideImage);
    -[REUpNextImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v7;
  }

}

- (void)_updateColors
{
  UIColor *v3;
  UIColor *fallbackTintColor;
  UIColor *v5;
  UIImageView *foregroundImageView;
  void *v7;
  UIColor *v8;

  -[CLKImageProvider tintColor](self->_imageProvider, "tintColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  fallbackTintColor = v3;
  if (v3 || (fallbackTintColor = self->_fallbackTintColor) != 0)
  {
    v5 = fallbackTintColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  foregroundImageView = self->_foregroundImageView;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](foregroundImageView, "setTintColor:", v7);

  -[UIImageView setTintColor:](self->_backgroundImageView, "setTintColor:", v8);
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REUpNextImageView;
  -[REUpNextImageView setContentMode:](&v5, sel_setContentMode_);
  -[UIImageView setContentMode:](self->_foregroundImageView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_backgroundImageView, "setContentMode:", a3);
  -[UIImageView setContentMode:](self->_foregroundAccentImageView, "setContentMode:", a3);
}

- (UIColor)fallbackTintColor
{
  return self->_fallbackTintColor;
}

- (void)setFallbackTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackTintColor, a3);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTintColor, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
}

@end
