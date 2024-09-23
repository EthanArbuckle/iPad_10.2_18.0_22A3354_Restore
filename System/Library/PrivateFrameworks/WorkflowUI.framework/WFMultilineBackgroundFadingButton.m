@implementation WFMultilineBackgroundFadingButton

- (WFMultilineBackgroundFadingButton)initWithFrame:(CGRect)a3
{
  WFMultilineBackgroundFadingButton *v3;
  WFMultilineBackgroundFadingButton *v4;
  void *v5;
  void *v6;
  void *v7;
  WFMultilineBackgroundFadingButton *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFMultilineBackgroundFadingButton;
  v3 = -[WFMultilineBackgroundFadingButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFMultilineBackgroundFadingButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", 0);

    -[WFMultilineBackgroundFadingButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 1);

    -[WFMultilineBackgroundFadingButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[WFMultilineBackgroundFadingButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[WFMultilineBackgroundFadingButton contentEdgeInsets](self, "contentEdgeInsets");
  v10 = v7 + v8 + v9;
  v13 = v5 + v11 + v12;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  -[WFMultilineBackgroundFadingButton frame](self, "frame");
  v4 = v3;
  -[WFMultilineBackgroundFadingButton contentEdgeInsets](self, "contentEdgeInsets");
  v6 = v4 - v5;
  -[WFMultilineBackgroundFadingButton contentEdgeInsets](self, "contentEdgeInsets");
  v8 = v6 - v7;
  -[WFMultilineBackgroundFadingButton titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredMaxLayoutWidth:", v8);

  v10.receiver = self;
  v10.super_class = (Class)WFMultilineBackgroundFadingButton;
  -[WFMultilineBackgroundFadingButton layoutSubviews](&v10, sel_layoutSubviews);
}

@end
