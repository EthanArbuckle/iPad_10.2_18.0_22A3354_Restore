@implementation SFPersonImageView

- (SFPersonImageView)initWithImage:(id)a3 isSquare:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SFPersonImageView *v7;
  SFPersonImageView *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPersonImageView;
  v7 = -[SFPersonImageView init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SFPersonImageView setImageIsSquare:](v7, "setImageIsSquare:", v4);
    -[SFPersonImageView setImage:](v8, "setImage:", v6);
  }

  return v8;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  CGRect v9;

  if (-[SFPersonImageView imageIsSquare](self, "imageIsSquare"))
  {
    -[SFPersonImageView frame](self, "frame");
    v3 = CGRectGetWidth(v9) * 0.5;
    -[SFPersonImageView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", v3);

    -[SFPersonImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 1;
  }
  else
  {
    -[SFPersonImageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 0.0);

    -[SFPersonImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 0;
  }
  objc_msgSend(v5, "setMasksToBounds:", v6);

}

- (void)setImageIsSquare:(BOOL)a3
{
  self->_imageIsSquare = a3;
  -[SFPersonImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPersonImageView;
  -[SFPersonImageView setImage:](&v4, sel_setImage_, a3);
  -[SFPersonImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  -[SFPersonImageView highlightDarkeningAlpha](self, "highlightDarkeningAlpha");
  if (fabs(v5) >= 2.22044605e-16)
  {
    if (v3)
    {
      -[SFPersonImageView highlightedImage](self, "highlightedImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = (void *)objc_opt_class();
        -[SFPersonImageView image](self, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPersonImageView highlightDarkeningAlpha](self, "highlightDarkeningAlpha");
        objc_msgSend(v8, "darkenImage:toLevel:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPersonImageView setHighlightedImage:](self, "setHighlightedImage:", v10);

      }
    }
  }
  else
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    -[SFPersonImageView setDrawMode:](self, "setDrawMode:", v6);
  }
  v11.receiver = self;
  v11.super_class = (Class)SFPersonImageView;
  -[SFPersonImageView setHighlighted:](&v11, sel_setHighlighted_, v3);
}

+ (id)darkenImage:(id)a3 toLevel:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  CGContext *CurrentContext;
  id v13;
  CGImage *v14;
  void *v15;
  CGImage *Image;
  void *v17;
  CGSize v19;
  CGRect v20;

  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v7, v8);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "setAlpha:", a4);
  v19.width = v7;
  v19.height = v9;
  UIGraphicsBeginImageContext(v19);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v9);
  CGContextTranslateCTM(CurrentContext, 0.0, v9);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v13 = objc_retainAutorelease(v5);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v7;
  v20.size.height = v9;
  CGContextClipToMask(CurrentContext, v20, v14);
  objc_msgSend(v10, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "renderInContext:", CurrentContext);

  Image = CGBitmapContextCreateImage(CurrentContext);
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", Image);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  UIGraphicsEndImageContext();

  return v17;
}

- (BOOL)imageIsSquare
{
  return self->_imageIsSquare;
}

- (double)highlightDarkeningAlpha
{
  return self->_highlightDarkeningAlpha;
}

- (void)setHighlightDarkeningAlpha:(double)a3
{
  self->_highlightDarkeningAlpha = a3;
}

@end
