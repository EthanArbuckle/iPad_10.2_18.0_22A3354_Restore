@implementation PKPeerPaymentMessagesRoundedButton

+ (CGSize)referenceSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 164.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPeerPaymentMessagesRoundedButton)initWithFrame:(CGRect)a3
{
  PKPeerPaymentMessagesRoundedButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  v3 = -[PKPeerPaymentMessagesButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setTitleColor:forState:](v3, "setTitleColor:forState:", v4, 0);

    +[PKPeerPaymentTheme disabledTextColor](PKPeerPaymentTheme, "disabledTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesRoundedButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 2);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentMessagesRoundedButton titleLabel](v3, "titleLabel");
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
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  -[PKPeerPaymentMessagesRoundedButton sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, 50.0);
  v4 = v3 + 32.0;
  if (v4 < 164.0)
    v4 = 164.0;
  v5 = 50.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  -[PKPeerPaymentMessagesButton layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPeerPaymentMessagesRoundedButton bounds](self, "bounds");
  PKFloatRoundToPixel();
  -[PKPeerPaymentMessagesRoundedButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
}

@end
