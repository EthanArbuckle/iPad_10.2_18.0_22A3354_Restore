@implementation SFAirDropActiveIconView

+ (id)baseImage
{
  if (baseImage_onceToken != -1)
    dispatch_once(&baseImage_onceToken, &__block_literal_global_7);
  return (id)baseImage_image;
}

void __36__SFAirDropActiveIconView_baseImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "AirDrop-active.png", 0, v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithContentsOfFile:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)baseImage_image;
  baseImage_image = v4;

}

- (SFAirDropActiveIconView)initWithFrame:(CGRect)a3 grayscale:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  SFAirDropActiveIconView *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "baseImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  objc_msgSend(v6, "size");
  v14.receiver = self;
  v14.super_class = (Class)SFAirDropActiveIconView;
  v10 = -[SFAirDropActiveIconView initWithFrame:](&v14, sel_initWithFrame_, 0.0, 0.0, v8, v9);
  if (v10)
  {
    if (v4)
    {
      objc_msgSend(v6, "imageWithRenderingMode:", 2);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropActiveIconView setTintColor:](v10, "setTintColor:", v12);

      v6 = (void *)v11;
    }
    -[SFAirDropActiveIconView setImage:](v10, "setImage:", v6);
    -[SFAirDropActiveIconView setContentMode:](v10, "setContentMode:", 4);
  }

  return v10;
}

- (void)layoutSubviews
{
  id v3;
  UIView *v4;
  UIView *circleMaskView;
  void *v6;
  CGFloat v7;
  void *v8;
  UIView *v9;
  void *v10;
  objc_super v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;

  if (!self->_circleMaskView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[SFAirDropActiveIconView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    circleMaskView = self->_circleMaskView;
    self->_circleMaskView = v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_circleMaskView, "setBackgroundColor:", v6);

    -[UIView bounds](self->_circleMaskView, "bounds");
    v7 = CGRectGetWidth(v14) * 0.5;
    -[UIView layer](self->_circleMaskView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);

    CGAffineTransformMakeScale(&v13, 0.0, 0.0);
    v9 = self->_circleMaskView;
    v12 = v13;
    -[UIView setTransform:](v9, "setTransform:", &v12);
    -[UIView layer](self->_circleMaskView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", CFSTR("destOut"));

    -[SFAirDropActiveIconView addSubview:](self, "addSubview:", self->_circleMaskView);
    self->_masked = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SFAirDropActiveIconView;
  -[SFAirDropActiveIconView layoutSubviews](&v11, sel_layoutSubviews);
}

- (void)setMasked:(BOOL)a3
{
  CGFloat v4;
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (self->_masked != a3)
  {
    self->_masked = a3;
    memset(&v7, 0, sizeof(v7));
    if (a3)
    {
      v4 = 1.0;
      v5 = 1.0;
    }
    else
    {
      v4 = 0.0;
      v5 = 0.0;
    }
    CGAffineTransformMakeScale(&v7, v4, v5);
    v6 = v7;
    -[UIView setTransform:](self->_circleMaskView, "setTransform:", &v6);
  }
}

- (BOOL)isMasked
{
  return self->_masked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleMaskView, 0);
}

@end
