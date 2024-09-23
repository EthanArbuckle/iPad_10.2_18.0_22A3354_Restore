@implementation CardCustomBorderView

- (CardCustomBorderView)initWithFrame:(CGRect)a3
{
  CardCustomBorderView *v3;
  CardCustomBorderView *v4;
  CardShadowView *v5;
  CardShadowView *cardShadowView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CardCustomBorderView;
  v3 = -[CardCustomBorderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CardCustomBorderView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v4->_cardCustomBorder = 0;
    v5 = -[CardShadowView initWithFrame:]([CardShadowView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CardShadowView setAlpha:](v5, "setAlpha:", 0.0);
    -[CardCustomBorderView addSubview:](v4, "addSubview:", v5);
    cardShadowView = v4->_cardShadowView;
    v4->_cardShadowView = v5;

  }
  return v4;
}

- (void)setCardCustomBorder:(unint64_t)a3
{
  double v4;

  if (self->_cardCustomBorder != a3)
  {
    self->_cardCustomBorder = a3;
    -[CardShadowView setShouldCropBottomEdge:](self->_cardShadowView, "setShouldCropBottomEdge:", a3 == 3);
    v4 = 1.0;
    if (!self->_cardCustomBorder)
      v4 = 0.0;
    -[CardShadowView setAlpha:](self->_cardShadowView, "setAlpha:", v4);
    -[CardCustomBorderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonCard:(BOOL)a3
{
  -[CardShadowView setButtonCard:](self->_cardShadowView, "setButtonCard:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CardCustomBorderView;
  -[CardCustomBorderView layoutSubviews](&v3, "layoutSubviews");
  -[CardCustomBorderView bounds](self, "bounds");
  -[CardShadowView setFrame:](self->_cardShadowView, "setFrame:");
}

- (unint64_t)cardCustomBorder
{
  return self->_cardCustomBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardShadowView, 0);
}

@end
