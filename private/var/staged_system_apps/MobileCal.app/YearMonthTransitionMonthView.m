@implementation YearMonthTransitionMonthView

- (CGRect)monthFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[YearMonthTransitionMonthView frame](self, "frame");
  -[YearMonthTransitionMonthView _adjustFrame:](self, "_adjustFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)monthFrameInMonthView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[YearMonthTransitionMonthView bounds](self, "bounds");
  -[YearMonthTransitionMonthView _adjustFrame:](self, "_adjustFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_adjustFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[YearMonthTransitionView _monthHeaderHeight](YearMonthTransitionView, "_monthHeaderHeight");
  v8 = y + v7 + -8.0;
  v9 = height - v7 + -4.0;
  v10 = x;
  v11 = width;
  result.size.height = v9;
  result.size.width = v11;
  result.origin.y = v8;
  result.origin.x = v10;
  return result;
}

- (CGRect)monthLabelFrame
{
  void *v3;
  void *v4;
  void *v5;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionMonthView weekViews](self, "weekViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionMonthView monthLabel](self, "monthLabel"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[YearMonthTransitionMonthView convertRect:fromView:](self, "convertRect:fromView:", v4, v7, v9, v11, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (NSString)monthLabelText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionMonthView monthLabel](self, "monthLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (UIColor)monthLabelColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[YearMonthTransitionMonthView monthLabel](self, "monthLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (BOOL)hasValidOrigin
{
  return self->_hasValidOrigin;
}

- (void)setHasValidOrigin:(BOOL)a3
{
  self->_hasValidOrigin = a3;
}

- (UILabel)monthLabel
{
  return self->_monthLabel;
}

- (void)setMonthLabel:(id)a3
{
  objc_storeStrong((id *)&self->_monthLabel, a3);
}

- (NSArray)weekViews
{
  return self->_weekViews;
}

- (void)setWeekViews:(id)a3
{
  objc_storeStrong((id *)&self->_weekViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
}

@end
