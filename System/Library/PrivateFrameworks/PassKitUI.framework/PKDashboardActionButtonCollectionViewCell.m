@implementation PKDashboardActionButtonCollectionViewCell

- (PKDashboardActionButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardActionButtonCollectionViewCell *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKDashboardActionButtonCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    v7 = v3->_titleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0, *MEMORY[0x1E0DC1448]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[PKDashboardActionButtonCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_titleLabel);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKDashboardActionButtonCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", a3.width, a3.height);
  v5 = v4;
  -[PKDashboardActionButtonCollectionViewCell _contentHeightWithWidth:](self, "_contentHeightWithWidth:", v4 + -16.0);
  v7 = fmax(v6 + 16.0, 55.0);
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_contentHeightWithWidth:(double)a3
{
  double v3;

  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  return v3 + 16.0;
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
  v12.super_class = (Class)PKDashboardActionButtonCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKDashboardActionButtonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v5 + 8.0, v7 + 8.0, v9 + -16.0, v11 + -16.0);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[PKDashboardActionButtonCollectionViewCell _layoutTitleLabel](self, "_layoutTitleLabel");
  }

}

- (void)_layoutTitleLabel
{
  UILabel *titleLabel;
  void *v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  titleLabel = self->_titleLabel;
  -[PKDashboardActionButtonCollectionViewCell _textColor](self, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](titleLabel, "setTextColor:", v4);

  -[PKDashboardActionButtonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  double v4;

  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  return a3 + v4 * -2.0;
}

- (id)_textColor
{
  if (-[PKDashboardActionButtonCollectionViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled"))objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
