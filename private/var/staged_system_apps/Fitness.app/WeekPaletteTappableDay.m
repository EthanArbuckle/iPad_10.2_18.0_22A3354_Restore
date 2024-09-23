@implementation WeekPaletteTappableDay

- (WeekPaletteTappableDay)init
{
  WeekPaletteTappableDay *v2;
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *circle;
  UILabel *v9;
  UILabel *weekDayLabel;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WeekPaletteTappableDay;
  v2 = -[WeekPaletteTappableDay init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    circle = v2->_circle;
    v2->_circle = v7;

    -[UIView setAlpha:](v2->_circle, "setAlpha:", 0.0);
    -[WeekPaletteTappableDay addSubview:](v2, "addSubview:", v2->_circle);
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    weekDayLabel = v2->_weekDayLabel;
    v2->_weekDayLabel = v9;

    -[UILabel setTextAlignment:](v2->_weekDayLabel, "setTextAlignment:", 1);
    -[WeekPaletteTappableDay addSubview:](v2, "addSubview:", v2->_weekDayLabel);
  }
  return v2;
}

- (void)setFont:(id)a3 textColor:(id)a4
{
  UIFont *v6;
  UIColor *v7;
  UIFont *dayFont;
  UIColor *dayTextColor;
  UIColor *v10;
  UIFont *v11;

  v6 = (UIFont *)a3;
  v7 = (UIColor *)a4;
  dayFont = self->_dayFont;
  self->_dayFont = v6;
  v11 = v6;

  dayTextColor = self->_dayTextColor;
  self->_dayTextColor = v7;
  v10 = v7;

  -[UILabel setFont:](self->_weekDayLabel, "setFont:", v11);
  -[UILabel setTextColor:](self->_weekDayLabel, "setTextColor:", v10);

}

- (void)setTextColorHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  UIColor *v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonGradientTextColor"));
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.99));

  }
  else
  {
    v6 = self->_dayTextColor;
  }
  -[UILabel setTextColor:](self->_weekDayLabel, "setTextColor:", v6);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double MidX;
  id v12;
  void *v13;
  UIFont *dayFont;
  void *v15;
  id v16;
  double v17;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  NSAttributedStringKey v24;
  UIFont *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v23.receiver = self;
  v23.super_class = (Class)WeekPaletteTappableDay;
  -[WeekPaletteTappableDay layoutSubviews](&v23, "layoutSubviews");
  -[WeekPaletteTappableDay bounds](self, "bounds");
  v4 = v3;
  -[WeekPaletteTappableDay bounds](self, "bounds");
  if (vabdd_f64(v4, v5) >= 2.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_circle, "layer"));
    objc_msgSend(v10, "setCornerRadius:", 8.0);

    -[WeekPaletteTappableDay bounds](self, "bounds");
    -[UIView setFrame:](self->_circle, "setFrame:");
    -[WeekPaletteTappableDay bounds](self, "bounds");
    MidX = CGRectGetMidX(v26);
    -[WeekPaletteTappableDay bounds](self, "bounds");
    -[UIView setCenter:](self->_circle, "setCenter:", MidX, CGRectGetMidY(v27));
  }
  else
  {
    -[WeekPaletteTappableDay bounds](self, "bounds");
    v7 = v6;
    v8 = v6 * 0.5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_circle, "layer"));
    objc_msgSend(v9, "setCornerRadius:", v8);

    -[UIView setFrame:](self->_circle, "setFrame:", 0.0, 0.0, v7, v7);
  }
  v12 = objc_alloc((Class)NSAttributedString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_weekDayLabel, "text"));
  dayFont = self->_dayFont;
  v24 = NSFontAttributeName;
  v25 = dayFont;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v16 = objc_msgSend(v12, "initWithString:attributes:", v13, v15);

  -[WeekPaletteTappableDay bounds](self, "bounds");
  objc_msgSend(v16, "boundingRectWithSize:options:context:", 0, 0, v17, 1.79769313e308);
  v29 = CGRectIntegral(v28);
  width = v29.size.width;
  height = v29.size.height;
  -[WeekPaletteTappableDay bounds](self, "bounds", v29.origin.x, v29.origin.y);
  v21 = UIRoundToViewScale(0, v20 * 0.5 - width * 0.5);
  -[WeekPaletteTappableDay bounds](self, "bounds");
  -[UILabel setFrame:](self->_weekDayLabel, "setFrame:", v21, UIRoundToViewScale(0, v22 * 0.5 - height * 0.5), width, height);

}

- (void)setCircleHidden:(BOOL)a3 updateCircleColor:(BOOL)a4
{
  _BOOL4 v5;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIColor *v11;
  UIColor *v12;
  id v13;
  id v14;

  v5 = a3;
  if (a3)
    v7 = 0.0;
  else
    v7 = 1.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekPaletteTappableDay circle](self, "circle"));
  objc_msgSend(v8, "setAlpha:", v7);

  if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nonGradientTextColor"));

    v10 = (uint64_t)v13;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v14 = (id)v10;
  -[UIView setBackgroundColor:](self->_circle, "setBackgroundColor:", v10);
  if (v5)
    v11 = self->_dayTextColor;
  else
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.99));
  v12 = v11;
  -[UILabel setTextColor:](self->_weekDayLabel, "setTextColor:", v11);

}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (UIView)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
  objc_storeStrong((id *)&self->_circle, a3);
}

- (UILabel)weekDayLabel
{
  return self->_weekDayLabel;
}

- (void)setWeekDayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_weekDayLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekDayLabel, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_dayTextColor, 0);
  objc_storeStrong((id *)&self->_dayFont, 0);
}

@end
