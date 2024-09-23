@implementation PKPaymentTransactionCollectionViewCell

- (PKPaymentTransactionCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKPaymentTransactionCollectionViewCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *multiselectImageView;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  void *v11;
  PKPaymentTransactionView *v12;
  PKPaymentTransactionView *transactionView;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    multiselectImageView = v3->_multiselectImageView;
    v3->_multiselectImageView = (UIImageView *)v6;

    -[UIImageView setFrame:](v3->_multiselectImageView, "setFrame:", 0.0, 0.0, 25.6667, 25.6667);
    v8 = v3->_multiselectImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v8, "setTintColor:", v9);

    -[UIImageView setHidden:](v3->_multiselectImageView, "setHidden:", !v3->_isEditing);
    v10 = v3->_multiselectImageView;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v10, "setPreferredSymbolConfiguration:", v11);

    v12 = objc_alloc_init(PKPaymentTransactionView);
    transactionView = v3->_transactionView;
    v3->_transactionView = v12;

    -[PKPaymentTransactionCollectionViewCell contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v3->_multiselectImageView);

    -[PKPaymentTransactionCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v3->_transactionView);

    -[PKPaymentTransactionCollectionViewCell contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 1);

    -[PKPaymentTransactionCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68130]);
  }
  return v3;
}

- (void)prepareForReuse
{
  NSString *identifier;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
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
  -[PKPaymentTransactionView setSecondaryBadgeSymbol:](self->_transactionView, "setSecondaryBadgeSymbol:", 0);
  -[PKPaymentTransactionView setSecondaryBadgeSymbolConfiguration:](self->_transactionView, "setSecondaryBadgeSymbolConfiguration:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  -[PKPaymentTransactionView sizeThatFits:](self->_transactionView, "sizeThatFits:", width + v6 * -2.0, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  CGFloat v12;
  _BOOL8 v18;
  CGRect v19;
  CGRect remainder;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[PKPaymentTransactionCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v4;
  y = v6;
  width = v8;
  height = v10;

  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  memset(&v19, 0, sizeof(v19));
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGRectDivide(v22, &v19, &remainder, 14.0, CGRectMinXEdge);
  -[UIImageView frame](self->_multiselectImageView, "frame");
  CGRectDivide(remainder, &v19, &remainder, v12, CGRectMinXEdge);
  __asm { FMOV            V2.2D, #0.5 }
  -[UIImageView setCenter:](self->_multiselectImageView, "setCenter:", vaddq_f64((float64x2_t)v19.origin, vmulq_f64((float64x2_t)v19.size, _Q2)));
  v18 = !self->_deletable || !self->_isEditing;
  -[UIImageView setHidden:](self->_multiselectImageView, "setHidden:", v18);
  if (self->_isEditing)
  {
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  -[PKPaymentTransactionView setFrame:](self->_transactionView, "setFrame:", x, y, width, height);
}

- (double)maxWidthForTransactionCellInWidth:(double)a3
{
  double v4;

  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  return a3 + v4 * -2.0;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  UIImageView *multiselectImageView;
  void *v10;
  UIImageView *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionCollectionViewCell;
  -[PKPaymentTransactionCollectionViewCell updateConfigurationUsingState:](&v14, sel_updateConfigurationUsingState_, v4);
  if (objc_msgSend(v4, "isEditing") && !self->_isEditing)
  {
    self->_originalShowsDisclosureView = -[PKPaymentTransactionView showsDisclosureView](self->_transactionView, "showsDisclosureView");
    -[PKPaymentTransactionView setShowsDisclosureView:](self->_transactionView, "setShowsDisclosureView:", 0);
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    -[PKPaymentTransactionCollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v6);
  }
  else if ((objc_msgSend(v4, "isEditing") & 1) == 0 && self->_isEditing)
  {
    -[PKPaymentTransactionView setShowsDisclosureView:](self->_transactionView, "setShowsDisclosureView:", self->_originalShowsDisclosureView);
    -[PKPaymentTransactionCollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
  }
  if (objc_msgSend(v4, "isEditing"))
  {
    v8 = objc_msgSend(v4, "isSelected");
    multiselectImageView = self->_multiselectImageView;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](multiselectImageView, "setImage:", v10);

      v11 = self->_multiselectImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](multiselectImageView, "setImage:", v12);

      v11 = self->_multiselectImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v11, "setTintColor:", v13);

  }
  self->_isEditing = objc_msgSend(v4, "isEditing");
  -[PKPaymentTransactionCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[PKPaymentTransactionCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (PKPaymentTransactionView)transactionView
{
  return self->_transactionView;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void)setDeletable:(BOOL)a3
{
  self->_deletable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_multiselectImageView, 0);
}

@end
