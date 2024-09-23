@implementation PKPaymentTransactionTableCell

- (PKPaymentTransactionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentTransactionTableCell *v4;
  PKPaymentTransactionView *v5;
  PKPaymentTransactionView *transactionView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionTableCell;
  v4 = -[PKPaymentTransactionTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PKPaymentTransactionView);
    transactionView = v4->_transactionView;
    v4->_transactionView = v5;

    -[PKPaymentTransactionTableCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_transactionView);

    -[PKPaymentTransactionTableCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68130]);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentTransactionView sizeThatFits:](self->_transactionView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionTableCell;
  -[PKPaymentTransactionTableCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPaymentTransactionTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPaymentTransactionView setFrame:](self->_transactionView, "setFrame:", v5 + self->_additionalInsets.left, v7 + self->_additionalInsets.top, v9 - (self->_additionalInsets.left + self->_additionalInsets.right), v11 - (self->_additionalInsets.top + self->_additionalInsets.bottom));
}

- (void)prepareForReuse
{
  NSString *identifier;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionTableCell;
  -[PKTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKPaymentTransactionTableCell setAccessoryType:](self, "setAccessoryType:", 0);
  identifier = self->_identifier;
  self->_identifier = 0;

  -[PKPaymentTransactionView setPrimaryColor:](self->_transactionView, "setPrimaryColor:", 0);
  -[PKPaymentTransactionView setSecondaryColor:](self->_transactionView, "setSecondaryColor:", 0);
  -[PKPaymentTransactionView setPrimaryString:](self->_transactionView, "setPrimaryString:", 0);
  -[PKPaymentTransactionView setSecondaryString:](self->_transactionView, "setSecondaryString:", 0);
  -[PKPaymentTransactionView setTertiaryString:](self->_transactionView, "setTertiaryString:", 0);
  -[PKPaymentTransactionView setTransactionValueAttributedText:](self->_transactionView, "setTransactionValueAttributedText:", 0);
  -[PKPaymentTransactionView setBadgeString:](self->_transactionView, "setBadgeString:", 0);
  -[PKPaymentTransactionView setShowsAvatarView:](self->_transactionView, "setShowsAvatarView:", 0);
  -[PKPaymentTransactionView setShowsDisclosureView:](self->_transactionView, "setShowsDisclosureView:", 0);
  -[PKPaymentTransactionView setPrimaryImage:](self->_transactionView, "setPrimaryImage:", 0);
  -[PKPaymentTransactionView setAlpha:](self->_transactionView, "setAlpha:", 1.0);
}

- (void)setPrimaryColor:(id)a3
{
  -[PKPaymentTransactionView setPrimaryColor:](self->_transactionView, "setPrimaryColor:", a3);
}

- (UIColor)primaryColor
{
  return -[PKPaymentTransactionView primaryColor](self->_transactionView, "primaryColor");
}

- (void)setSecondaryColor:(id)a3
{
  -[PKPaymentTransactionView setSecondaryColor:](self->_transactionView, "setSecondaryColor:", a3);
}

- (UIColor)secondaryColor
{
  return -[PKPaymentTransactionView secondaryColor](self->_transactionView, "secondaryColor");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (PKPaymentTransactionView)transactionView
{
  return self->_transactionView;
}

- (UIEdgeInsets)additionalInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalInsets.top;
  left = self->_additionalInsets.left;
  bottom = self->_additionalInsets.bottom;
  right = self->_additionalInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
