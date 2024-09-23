@implementation PKMonthDayCollectionViewCell

- (PKMonthDayCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKMonthDayCollectionViewCell *v3;
  UILabel *v4;
  UILabel *dayLabel;
  UILabel *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *topLine;
  UIView *v11;
  UIView *bottomLine;
  UIView *v13;
  UIView *leftLine;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKMonthDayCollectionViewCell;
  v3 = -[PKMonthDayCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dayLabel = v3->_dayLabel;
    v3->_dayLabel = v4;

    v6 = v3->_dayLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topLine = v3->_topLine;
    v3->_topLine = v9;

    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomLine = v3->_bottomLine;
    v3->_bottomLine = v11;

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    leftLine = v3->_leftLine;
    v3->_leftLine = v13;

    -[UIView setBackgroundColor:](v3->_topLine, "setBackgroundColor:", v8);
    -[UIView setBackgroundColor:](v3->_leftLine, "setBackgroundColor:", v8);
    -[UIView setBackgroundColor:](v3->_bottomLine, "setBackgroundColor:", v8);
    -[PKMonthDayCollectionViewCell addSubview:](v3, "addSubview:", v3->_topLine);
    -[PKMonthDayCollectionViewCell addSubview:](v3, "addSubview:", v3->_bottomLine);
    -[PKMonthDayCollectionViewCell addSubview:](v3, "addSubview:", v3->_leftLine);
    -[PKMonthDayCollectionViewCell addSubview:](v3, "addSubview:", v3->_dayLabel);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *dayLabel;
  double MidX;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)PKMonthDayCollectionViewCell;
  -[PKMonthDayCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[PKMonthDayCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
  -[UIView setFrame:](self->_leftLine, "setFrame:", 0.0, 0.0, 1.0, v10);
  -[UIView setFrame:](self->_bottomLine, "setFrame:", 0.0, v10 + -1.0, v8, 1.0);
  -[UIView setHidden:](self->_topLine, "setHidden:", (unint64_t)(self->_dayNumber - 1) < 7);
  -[UIView setHidden:](self->_bottomLine, "setHidden:", (unint64_t)(self->_dayNumber - 1) < 0x1C);
  -[UIView setHidden:](self->_leftLine, "setHidden:", self->_dayNumber % 7 == 1);
  dayLabel = self->_dayLabel;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[UILabel setCenter:](dayLabel, "setCenter:", MidX, CGRectGetMidY(v15));
}

- (void)setDayNumber:(int64_t)a3 withTitle:(id)a4
{
  self->_dayNumber = a3;
  -[UILabel setText:](self->_dayLabel, "setText:", a4);
  -[UILabel sizeToFit](self->_dayLabel, "sizeToFit");
  -[PKMonthDayCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[PKMonthDayCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setEnabled:(BOOL)a3
{
  UILabel *dayLabel;
  uint64_t v5;
  void *v6;
  id v7;

  self->_enabled = a3;
  if (a3)
  {
    dayLabel = self->_dayLabel;
    if ((-[PKMonthDayCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](dayLabel, "setTextColor:", v6);

    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v5;
  -[UILabel setTextColor:](self->_dayLabel, "setTextColor:", v5);

}

- (void)setSelected:(BOOL)a3
{
  UILabel *dayLabel;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKMonthDayCollectionViewCell;
  -[PKMonthDayCollectionViewCell setSelected:](&v10, sel_setSelected_);
  if (!self->_enabled)
  {
    if (a3)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  dayLabel = self->_dayLabel;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](dayLabel, "setTextColor:", v8);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](dayLabel, "setTextColor:", v6);

LABEL_5:
  -[PKMonthDayCollectionViewCell tintColor](self, "tintColor");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (void *)v7;
  -[PKMonthDayCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v7);

}

- (int64_t)dayNumber
{
  return self->_dayNumber;
}

- (void)setDayNumber:(int64_t)a3
{
  self->_dayNumber = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_leftLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end
