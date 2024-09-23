@implementation PKPhoneHeroView

- (PKPhoneHeroView)initWithFrame:(CGRect)a3
{
  PKPhoneHeroView *v3;
  PKPhoneHeroView *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPhoneHeroView;
  v3 = -[PKPhoneHeroView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKPhoneHeroView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v5, "setShadowRadius:", 25.0);
    LODWORD(v6) = 1042536202;
    objc_msgSend(v5, "setShadowOpacity:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setMasksToBounds:", 0);
    objc_msgSend(v5, "setShadowOffset:", 0.0, 4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhoneHeroView setBackgroundColor:](v4, "setBackgroundColor:", v8);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  PKUIGetMinScreenType();
  PKSizeAspectFit();
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPhoneHeroView;
  -[PKPhoneHeroView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPhoneHeroView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPhoneHeroView;
  -[PKPhoneHeroView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKPhoneHeroView _updateCornerRadius](self, "_updateCornerRadius");
}

- (double)deviceCornerRadius
{
  unint64_t v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v3 = PKUIGetMinScreenType();
  v4 = (double *)((char *)&unk_19DF16BD8 + 8 * v3);
  if (v3 >= 0x12)
    v4 = (double *)MEMORY[0x1E0C9D820];
  v5 = *v4;
  -[PKPhoneHeroView bounds](self, "bounds");
  v7 = v6;
  -[PKPhoneHeroView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayCornerRadius");
  v10 = v9;

  if (v10 == 0.0)
  {
    PKScreenScale();
    v10 = v11 * 8.0;
  }
  return v7 / v5 * v10;
}

- (void)_updateCornerRadius
{
  id v3;

  -[PKPhoneHeroView layer](self, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPhoneHeroView deviceCornerRadius](self, "deviceCornerRadius");
  objc_msgSend(v3, "setCornerRadius:");

}

@end
