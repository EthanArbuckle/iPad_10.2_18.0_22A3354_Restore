@implementation SUReflectionImageView

- (SUReflectionImageView)init
{
  return -[SUReflectionImageView initWithReflectionHeight:spacing:](self, "initWithReflectionHeight:spacing:", 15.0, 0.0);
}

- (SUReflectionImageView)initWithReflectionHeight:(double)a3 spacing:(double)a4
{
  SUReflectionImageView *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUReflectionImageView;
  result = -[SUReflectionImageView init](&v7, sel_init);
  if (result)
  {
    result->_reflectionAlpha = 1.0;
    result->_reflectionHeight = a3;
    result->_spacing = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUReflectionImageView;
  -[SUReflectionImageView dealloc](&v3, sel_dealloc);
}

- (BOOL)nonSquareImage
{
  return *((_BYTE *)self + 441) & 1;
}

- (void)setImage:(id)a3
{
  UIImageView *imageView;
  UIImageView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SUReflectionView *reflection;
  SUReflectionView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView setImage:](imageView, "setImage:", a3);
    -[UIImageView setNeedsDisplay](self->_imageView, "setNeedsDisplay");
  }
  else
  {
    v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", a3);
    self->_imageView = v6;
    -[UIImageView setContentMode:](v6, "setContentMode:", 1);
    -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
    -[SUReflectionImageView addSubview:](self, "addSubview:", self->_imageView);
  }
  if (self->_useImageSize)
  {
    -[SUReflectionImageView frame](self, "frame");
    v8 = v7;
    v10 = v9;
    -[UIImageView frame](self->_imageView, "frame");
    v12 = self;
    v13 = v8;
    v14 = v10;
  }
  else
  {
    -[SUReflectionImageView bounds](self, "bounds");
    v16 = v15;
    -[UIImageView frame](self->_imageView, "frame");
    v12 = self->_imageView;
    v11 = v16;
  }
  objc_msgSend(v12, "setFrame:", v13, v14, v11);
  -[UIImageView frame](self->_imageView, "frame");
  v19 = v18 + self->_spacing;
  reflection = self->_reflection;
  if (reflection)
  {
    -[SUReflectionView setFrame:](reflection, "setFrame:", 0.0, v19, v17, self->_reflectionHeight);
  }
  else
  {
    v21 = -[SUReflectionView initWithFrame:]([SUReflectionView alloc], "initWithFrame:", 0.0, v19, v17, self->_reflectionHeight);
    self->_reflection = v21;
    -[SUReflectionView setAlpha:](v21, "setAlpha:", self->_reflectionAlpha);
    -[SUReflectionView setOpaque:](self->_reflection, "setOpaque:", 0);
    -[SUReflectionView setUserInteractionEnabled:](self->_reflection, "setUserInteractionEnabled:", 0);
    -[SUReflectionImageView addSubview:](self, "addSubview:", self->_reflection);
  }
  -[SUReflectionView setImage:](self->_reflection, "setImage:", a3);
  -[SUReflectionView setNeedsDisplay](self->_reflection, "setNeedsDisplay");
  -[SUReflectionImageView frame](self, "frame");
  v23 = v22;
  v25 = v24;
  -[UIImageView frame](self->_imageView, "frame");
  v27 = v26;
  -[SUReflectionView frame](self->_reflection, "frame");
  -[SUReflectionImageView setFrame:](self, "setFrame:", v23, v25, v27, CGRectGetMaxY(v28));
}

- (void)setNonSquareImage:(BOOL)a3
{
  *((_BYTE *)self + 441) = *((_BYTE *)self + 441) & 0xFE | a3;
}

- (void)setReflectionAlphaWhenVisible:(double)a3
{
  double v4;

  self->_reflectionAlpha = a3;
  -[SUReflectionView alpha](self->_reflection, "alpha");
  if (v4 > 0.0)
    -[SUReflectionView setAlpha:](self->_reflection, "setAlpha:", self->_reflectionAlpha);
}

- (void)setReflectionVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double reflectionAlpha;

  v3 = a3;
  -[SUReflectionView alpha](self->_reflection, "alpha");
  v6 = v5;
  if (v3)
  {
    reflectionAlpha = self->_reflectionAlpha;
    if (v6 != reflectionAlpha)
      goto LABEL_7;
  }
  else if (v5 != 0.0)
  {
    reflectionAlpha = 0.0;
LABEL_7:
    -[SUReflectionView setAlpha:](self->_reflection, "setAlpha:", reflectionAlpha);
  }
}

- (void)setUseImageSize:(BOOL)a3
{
  self->_useImageSize = a3;
}

- (double)reflectionSpacing
{
  return self->_spacing;
}

- (void)setReflectionSpacing:(double)a3
{
  self->_spacing = a3;
}

@end
