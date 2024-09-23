@implementation PKMultilineKeyValueTableViewCell

- (PKMultilineKeyValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKMultilineKeyValueTableViewCell *v4;
  PKMultilineKeyValueTableViewCell *v5;
  int v6;
  void *v7;
  UILabel *v8;
  UILabel *keyLabel;
  UILabel *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  UILabel *v14;
  UILabel *valueLabel;
  UILabel *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKMultilineKeyValueTableViewCell;
  v4 = -[PKMultilineKeyValueTableViewCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    v6 = -[PKMultilineKeyValueTableViewCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection");
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    keyLabel = v5->_keyLabel;
    v5->_keyLabel = v8;

    -[UILabel setNumberOfLines:](v5->_keyLabel, "setNumberOfLines:", 1);
    v10 = v5->_keyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    if (v6)
      v12 = 2;
    else
      v12 = 0;
    if (v6)
      v13 = 0;
    else
      v13 = 2;
    -[UILabel setTextAlignment:](v5->_keyLabel, "setTextAlignment:", v12);
    -[UILabel setFont:](v5->_keyLabel, "setFont:", v7);
    -[PKMultilineKeyValueTableViewCell addSubview:](v5, "addSubview:", v5->_keyLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = v14;

    -[UILabel setNumberOfLines:](v5->_valueLabel, "setNumberOfLines:", 0);
    v16 = v5->_valueLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel setTextAlignment:](v5->_valueLabel, "setTextAlignment:", v13);
    -[UILabel setFont:](v5->_valueLabel, "setFont:", v7);
    -[PKMultilineKeyValueTableViewCell addSubview:](v5, "addSubview:", v5->_valueLabel);

  }
  return v5;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRectEdge v18;
  double v19;
  CGFloat v20;
  CGRect v21;
  CGRect slice;
  CGRect remainder;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)PKMultilineKeyValueTableViewCell;
  -[PKMultilineKeyValueTableViewCell layoutSubviews](&v24, sel_layoutSubviews);
  -[PKMultilineKeyValueTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKMultilineKeyValueTableViewCell layoutMargins](self, "layoutMargins");
  v13 = v5 + v12;
  v14 = v7 + 12.0;
  v16 = v9 - (v12 + v15);
  remainder.origin.x = v13;
  remainder.origin.y = v14;
  v17 = v11 + -24.0;
  remainder.size.width = v16;
  remainder.size.height = v17;
  if (-[PKMultilineKeyValueTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v18 = CGRectMaxXEdge;
  else
    v18 = CGRectMinXEdge;
  -[UILabel systemLayoutSizeFittingSize:](self->_keyLabel, "systemLayoutSizeFittingSize:", v16, 0.0);
  v20 = v19;
  memset(&slice, 0, sizeof(slice));
  v25.origin.x = v13;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v17;
  CGRectDivide(v25, &slice, &remainder, v20, v18);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](self->_keyLabel, "setFrame:");
  memset(&v21, 0, sizeof(v21));
  CGRectDivide(remainder, &v21, &remainder, 10.0, v18);
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
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
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  -[PKMultilineKeyValueTableViewCell layoutMargins](self, "layoutMargins", a3.width, a3.height);
  v7 = width - v5 - v6;
  -[UILabel systemLayoutSizeFittingSize:](self->_keyLabel, "systemLayoutSizeFittingSize:", v7, 0.0);
  v9 = v8;
  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_valueLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -10.0 - v10, 0.0, v11, v12);
  if (v9 <= v13)
    v14 = v13;
  else
    v14 = v9;
  v15 = v14 + 12.0 + 12.0 + 1.0;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_keyLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end
