@implementation PKPassPaymentSummaryHeaderView

- (PKPassPaymentSummaryHeaderView)init
{
  double v3;

  +[PKPassPaymentSummaryHeaderView preferredHeight](PKPassPaymentSummaryHeaderView, "preferredHeight");
  return -[PKPassPaymentSummaryHeaderView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, v3);
}

- (PKPassPaymentSummaryHeaderView)initWithFrame:(CGRect)a3
{
  PKPassPaymentSummaryHeaderView *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *secondaryTitleLabel;
  UILabel *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPassPaymentSummaryHeaderView;
  v3 = -[PKPassPaymentSummaryHeaderView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    v7 = v3->_titleLabel;
    +[PKPassPaymentSummaryHeaderView _titleFont](PKPassPaymentSummaryHeaderView, "_titleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v4);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryTitleLabel = v3->_secondaryTitleLabel;
    v3->_secondaryTitleLabel = v9;

    v11 = v3->_secondaryTitleLabel;
    +[PKPassPaymentSummaryHeaderView _titleFont](PKPassPaymentSummaryHeaderView, "_titleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setTextColor:](v3->_secondaryTitleLabel, "setTextColor:", v4);
    -[PKPassPaymentSummaryHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[PKPassPaymentSummaryHeaderView addSubview:](v3, "addSubview:", v3->_secondaryTitleLabel);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassPaymentSummaryHeaderView;
  -[PKPassPaymentSummaryHeaderView dealloc](&v2, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  double v12;
  void *v13;
  uint64_t v14;
  CGRectEdge v15;
  void *v16;
  double v17;
  double v18;
  CGSize v19;
  void *v20;
  void *v21;
  CGFloat v22;
  double Width;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGRect v30;
  CGRect remainder;
  CGRect slice;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  v33.receiver = self;
  v33.super_class = (Class)PKPassPaymentSummaryHeaderView;
  -[PKPassPaymentSummaryHeaderView layoutSubviews](&v33, sel_layoutSubviews);
  -[PKPassPaymentSummaryHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&slice, 0, sizeof(slice));
  v11 = -[PKPassPaymentSummaryHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (PKUIGetMinScreenWidthType())
    v12 = 4.0;
  else
    v12 = 20.0;
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  remainder = CGRectInset(v34, v12, 12.0);
  -[UILabel text](self->_secondaryTitleLabel, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    if (v11)
      v15 = CGRectMinXEdge;
    else
      v15 = CGRectMaxXEdge;
    -[UILabel font](self->_secondaryTitleLabel, "font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lineHeight");
    v18 = v17;

    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v30.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v30.size = v19;
    -[UILabel text](self->_secondaryTitleLabel, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassPaymentSummaryHeaderView _titleFont](PKPassPaymentSummaryHeaderView, "_titleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassPaymentSummaryHeaderView _sizeForLabelWithText:font:maximumNumberOfLines:width:](PKPassPaymentSummaryHeaderView, "_sizeForLabelWithText:font:maximumNumberOfLines:width:", v20, v21, 1, remainder.size.width * 0.5);

    PKFloatCeilToPixel();
    CGRectDivide(remainder, &v30, &remainder, v22, v15);
    CGRectDivide(remainder, &slice, &remainder, 5.0, v15);
    v30.size.height = v18;
    -[UILabel setFrame:](self->_secondaryTitleLabel, "setFrame:", *(_OWORD *)&v30.origin, v30.size.width, v18);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_secondaryTitleLabel, "removeFromSuperview");
  }
  -[PKPassPaymentSummaryHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v35);
  if (PKUIGetMinScreenWidthType())
    v24 = 4.0;
  else
    v24 = 20.0;
  v25 = Width + v24 * -2.0;
  -[UILabel font](self->_titleLabel, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lineHeight");
  v28 = v27;

  if (PKUIGetMinScreenWidthType())
    v29 = 4.0;
  else
    v29 = 20.0;
  v30.origin.x = v29;
  v30.origin.y = 12.0;
  v30.size.width = v25;
  v30.size.height = v28;
  CGRectDivide(remainder, &v30, &remainder, v28, CGRectMinYEdge);
  v30.size.height = v28;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v30.origin, v30.size.width, v28);
}

- (void)setPrimaryTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)primaryTitle
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setSecondaryTitle:(id)a3
{
  -[UILabel setText:](self->_secondaryTitleLabel, "setText:", a3);
}

- (NSString)secondaryTitle
{
  return -[UILabel text](self->_secondaryTitleLabel, "text");
}

- (void)setColor:(id)a3
{
  UILabel *titleLabel;
  id v5;

  titleLabel = self->_titleLabel;
  v5 = a3;
  -[UILabel setTextColor:](titleLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_secondaryTitleLabel, "setTextColor:", v5);

}

- (UIColor)color
{
  return -[UILabel textColor](self->_titleLabel, "textColor");
}

+ (double)preferredHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3 + 7.0 + 12.0;

  return v4;
}

+ (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48D0], 13.0));
}

+ (CGSize)_sizeForLabelWithText:(id)a3 font:(id)a4 maximumNumberOfLines:(int64_t)a5 width:(double)a6
{
  double v6;
  double v7;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  _QWORD v21[2];
  CGSize result;

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (a3 && a4 && a5 >= 1)
  {
    v11 = (objc_class *)MEMORY[0x1E0DC12A0];
    v12 = a4;
    v13 = a3;
    v14 = objc_alloc_init(v11);
    objc_msgSend(v14, "setMaximumNumberOfLines:", a5);
    v20 = *MEMORY[0x1E0DC1138];
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 33, v15, v14, a6, 1.79769313e308);
    v6 = v16;
    v7 = v17;

  }
  v18 = v6;
  v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
