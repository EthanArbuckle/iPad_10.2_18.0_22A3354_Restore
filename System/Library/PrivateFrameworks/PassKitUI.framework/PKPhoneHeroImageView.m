@implementation PKPhoneHeroImageView

- (PKPhoneHeroImageView)initWithImage:(id)a3
{
  id v4;
  PKPhoneHeroImageView *v5;
  uint64_t v6;
  UIImageView *phoneView;
  PKPhoneHeroImageView *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPhoneHeroImageView;
    v5 = -[PKPhoneHeroImageView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
      phoneView = v5->_phoneView;
      v5->_phoneView = (UIImageView *)v6;

      -[PKPhoneHeroImageView addSubview:](v5, "addSubview:", v5->_phoneView);
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)layoutSubviews
{
  UIImageView *phoneView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPhoneHeroImageView;
  -[PKPhoneHeroImageView layoutSubviews](&v4, sel_layoutSubviews);
  phoneView = self->_phoneView;
  -[PKPhoneHeroImageView bounds](self, "bounds");
  -[UIImageView setFrame:](phoneView, "setFrame:");
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhoneHeroImageView;
  -[PKPhoneHeroImageView setContentMode:](&v5, sel_setContentMode_);
  -[UIImageView setContentMode:](self->_phoneView, "setContentMode:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[UIImageView image](self->_phoneView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  PKSizeAspectFit();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneView, 0);
}

@end
