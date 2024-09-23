@implementation _CHWorkoutSummaryTabbedLabelContainer

- (_CHWorkoutSummaryTabbedLabelContainer)initWithFrame:(CGRect)a3
{
  _CHWorkoutSummaryTabbedLabelContainer *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *totalLabel;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *averageLabel;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_CHWorkoutSummaryTabbedLabelContainer;
  v3 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v13);

    -[_CHWorkoutSummaryTabbedLabelContainer addSubview:](v3, "addSubview:", v3->_titleLabel);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    totalLabel = v3->_totalLabel;
    v3->_totalLabel = v14;

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_totalLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_totalLabel, "setFont:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_totalLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_totalLabel, "setBackgroundColor:", v18);

    -[_CHWorkoutSummaryTabbedLabelContainer addSubview:](v3, "addSubview:", v3->_totalLabel);
    v19 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    averageLabel = v3->_averageLabel;
    v3->_averageLabel = v19;

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_averageLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_averageLabel, "setFont:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_averageLabel, "setTextColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_averageLabel, "setBackgroundColor:", v23);

    -[_CHWorkoutSummaryTabbedLabelContainer addSubview:](v3, "addSubview:", v3->_averageLabel);
  }
  return v3;
}

- (void)setTextColor:(id)a3
{
  UIColor **p_textColor;
  id v6;

  p_textColor = &self->_textColor;
  objc_storeStrong((id *)&self->_textColor, a3);
  v6 = a3;
  -[UILabel setTextColor:](self->_totalLabel, "setTextColor:", *p_textColor);
  -[UILabel setTextColor:](self->_averageLabel, "setTextColor:", *p_textColor);

}

- (void)setTitleText:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_titleText, a3);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  if (-[NSString length](self->_titleText, "length"))
    v5 = 4;
  else
    v5 = 1;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v5);

}

- (void)setTotalText:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_totalText, a3);
  -[UILabel setText:](self->_totalLabel, "setText:", self->_totalText);
  if (-[NSString length](self->_totalText, "length"))
    v5 = 4;
  else
    v5 = 1;
  -[UILabel setTextAlignment:](self->_totalLabel, "setTextAlignment:", v5);

}

- (void)setAverageText:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_averageText, a3);
  -[UILabel setText:](self->_averageLabel, "setText:", self->_averageText);
  if (-[NSString length](self->_averageText, "length"))
    v5 = 4;
  else
    v5 = 1;
  -[UILabel setTextAlignment:](self->_averageLabel, "setTextAlignment:", v5);

}

- (void)setText:(id)a3
{
  UILabel *titleLabel;
  id v5;

  titleLabel = self->_titleLabel;
  v5 = a3;
  -[UILabel setText:](titleLabel, "setText:", v5);
  -[UILabel setText:](self->_totalLabel, "setText:", v5);
  -[UILabel setText:](self->_averageLabel, "setText:", v5);

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  UILabel *totalLabel;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v10.receiver = self;
  v10.super_class = (Class)_CHWorkoutSummaryTabbedLabelContainer;
  -[_CHWorkoutSummaryTabbedLabelContainer layoutSubviews](&v10, "layoutSubviews");
  v3 = sub_1000D3D50() + -4.0;
  -[_CHWorkoutSummaryTabbedLabelContainer bounds](self, "bounds");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v3, CGRectGetHeight(v12));
  -[UILabel frame](self->_titleLabel, "frame");
  v4 = CGRectGetMaxX(v13) + 4.0;
  v5 = sub_1000D3DB4() + -4.0;
  -[_CHWorkoutSummaryTabbedLabelContainer bounds](self, "bounds");
  -[UILabel setFrame:](self->_totalLabel, "setFrame:", v4, 0.0, v5, CGRectGetHeight(v14));
  -[UILabel frame](self->_totalLabel, "frame");
  v6 = CGRectGetMaxX(v15) + 4.0;
  v7 = sub_1000D3DB4() + -4.0;
  -[_CHWorkoutSummaryTabbedLabelContainer bounds](self, "bounds");
  -[UILabel setFrame:](self->_averageLabel, "setFrame:", v6, 0.0, v7, CGRectGetHeight(v16));
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == (id)1)
  {
    totalLabel = self->_totalLabel;
    v11[0] = self->_titleLabel;
    v11[1] = totalLabel;
    v11[2] = self->_averageLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));
    -[_CHWorkoutSummaryTabbedLabelContainer ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v9);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetWidth(v10) + -16.0 + -15.0;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[_CHWorkoutSummaryTabbedLabelContainer frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[_CHWorkoutSummaryTabbedLabelContainer intrinsicContentSize](self, "intrinsicContentSize");
  -[_CHWorkoutSummaryTabbedLabelContainer setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (double)_firstBaselineOffsetFromTop
{
  double result;

  -[UILabel _firstBaselineOffsetFromTop](self->_titleLabel, "_firstBaselineOffsetFromTop");
  return result;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)totalText
{
  return self->_totalText;
}

- (NSString)averageText
{
  return self->_averageText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_averageText, 0);
  objc_storeStrong((id *)&self->_totalText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_averageLabel, 0);
  objc_storeStrong((id *)&self->_totalLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
