@implementation PKAddDebitCardHeroView

- (PKAddDebitCardHeroView)initWithPassSnapShot:(id)a3
{
  id v4;
  PKAddDebitCardHeroView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *debitCardView;
  uint64_t v10;
  UIImageView *passSnapshotView;
  void *v12;
  id v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAddDebitCardHeroView;
  v5 = -[PKAddDebitCardHeroView init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageNamed(CFSTR("AddDebitCard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    debitCardView = v5->_debitCardView;
    v5->_debitCardView = (UIImageView *)v8;

    -[PKAddDebitCardHeroView addSubview:](v5, "addSubview:", v5->_debitCardView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    passSnapshotView = v5->_passSnapshotView;
    v5->_passSnapshotView = (UIImageView *)v10;

    -[UIImageView setContentMode:](v5->_passSnapshotView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_passSnapshotView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKAddDebitCardHeroView addSubview:](v5, "addSubview:", v5->_passSnapshotView);
    -[UIImageView layer](v5->_passSnapshotView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShouldRasterize:", 1);
    objc_msgSend(v12, "setRasterizationScale:", PKUIScreenScale());
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.25, 1.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

    LODWORD(v14) = 1041865114;
    objc_msgSend(v12, "setShadowOpacity:", v14);
    objc_msgSend(v12, "setShadowOffset:", 0.0, 4.0);
    objc_msgSend(v12, "setShadowRadius:", 4.0);

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAddDebitCardHeroView;
  -[PKAddDebitCardHeroView layoutSubviews](&v8, sel_layoutSubviews);
  -[PKAddDebitCardHeroView bounds](self, "bounds");
  v4 = v3 * 0.5 + -146.5;
  -[UIImageView frame](self->_debitCardView, "frame");
  -[UIImageView setFrame:](self->_debitCardView, "setFrame:", v4);
  -[UIImageView frame](self->_passSnapshotView, "frame");
  v6 = v5;
  PKFloatRoundToPixel();
  -[UIImageView setFrame:](self->_passSnapshotView, "setFrame:", v4 + 62.0, v6, 243.0, v7);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 183.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debitCardView, 0);
  objc_storeStrong((id *)&self->_passSnapshotView, 0);
}

@end
