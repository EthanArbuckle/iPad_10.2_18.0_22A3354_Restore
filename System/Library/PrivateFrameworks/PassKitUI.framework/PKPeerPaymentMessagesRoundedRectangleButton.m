@implementation PKPeerPaymentMessagesRoundedRectangleButton

+ (CGSize)referenceSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = PKIsPad();
  v3 = 153.0;
  if (v2)
    v3 = 163.0;
  v4 = 50.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPeerPaymentMessagesRoundedRectangleButton)init
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend((id)objc_opt_class(), "referenceSize");
  return -[PKPeerPaymentMessagesRoundedRectangleButton initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (PKPeerPaymentMessagesRoundedRectangleButton)initWithFrame:(CGRect)a3
{
  PKPeerPaymentMessagesRoundedRectangleButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  v3 = -[PKPeerPaymentMessagesButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedRectangleButton setTitleColor:forState:](v3, "setTitleColor:forState:", v4, 0);

    +[PKPeerPaymentTheme disabledTextColor](PKPeerPaymentTheme, "disabledTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedRectangleButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 2);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentMessagesRoundedRectangleButton titleLabel](v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[PKPeerPaymentMessagesButton setHighlighted:](v3, "setHighlighted:", 0);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  -[PKPeerPaymentMessagesRoundedRectangleButton sizeThatFits:](&v8, sel_sizeThatFits_, a3.width, 50.0);
  v4 = v3;
  if (PKIsPad())
    v5 = 163.0;
  else
    v5 = 153.0;
  v6 = v4 + 32.0;
  if (v5 > v4 + 32.0)
  {
    if (PKIsPad())
      v6 = 163.0;
    else
      v6 = 153.0;
  }
  v7 = 50.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  -[PKPeerPaymentMessagesButton layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPeerPaymentMessagesRoundedRectangleButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 12.0);
}

@end
