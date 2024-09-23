@implementation PKDashboardTitleMessageCell

- (PKDashboardTitleMessageCell)initWithFrame:(CGRect)a3
{
  PKDashboardTitleMessageCell *v3;
  PKDashboardTitleMessageCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  uint64_t v17;
  UILabel *messageLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKDashboardTitleMessageCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardTitleMessageCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    v15 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    messageLabel = v4->_messageLabel;
    v4->_messageLabel = (UILabel *)v17;

    v19 = v4->_messageLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](v4->_messageLabel, "setNumberOfLines:", 0);
    v21 = v4->_messageLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    objc_msgSend(v5, "addSubview:", v4->_messageLabel);
  }
  return v4;
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
  CGSize result;

  width = a3.width;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset", a3.width, a3.height);
  v6 = width + v5 * -2.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v6 + -24.0, 1.79769313e308);
  v8 = v7;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_messageLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v6 + -24.0, 1.79769313e308);
  v10 = v8 + 24.0 + 5.0 + v9;
  v11 = v6;
  result.height = v10;
  result.width = v11;
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
  CGSize v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect remainder;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PKDashboardTitleMessageCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v18, sel_layoutSubviews);
  -[PKDashboardTitleMessageCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  remainder.origin.x = v5 + 12.0;
  remainder.origin.y = v7 + 12.0;
  remainder.size.width = v9 + -24.0;
  remainder.size.height = v11 + -24.0;
  v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v16.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v16.size = v12;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v9 + -24.0, v11 + -24.0);
  v14 = v13;
  v19.origin.x = v5 + 12.0;
  v19.origin.y = v7 + 12.0;
  v19.size.width = v9 + -24.0;
  v19.size.height = v11 + -24.0;
  CGRectDivide(v19, &v16, &remainder, v14, CGRectMinYEdge);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
  CGRectDivide(remainder, &v16, &remainder, 5.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_messageLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v16, &remainder, v15, CGRectMinYEdge);
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
