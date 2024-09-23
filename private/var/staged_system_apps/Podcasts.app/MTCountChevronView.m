@implementation MTCountChevronView

- (MTCountChevronView)initWithFrame:(CGRect)a3
{
  MTCountChevronView *v3;
  MTCountChevronView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTCountChevronView;
  v3 = -[MTCountChevronView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](v3, "countLabel"));
    -[MTCountChevronView addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](v4, "chevronView"));
    -[MTCountChevronView addSubview:](v4, "addSubview:", v6);

  }
  return v4;
}

- (void)setCount:(id)a3
{
  NSNumber *v5;
  NSNumber *count;
  unsigned __int8 v7;
  __CFString *v8;
  void *v9;
  NSNumber *v10;

  v5 = (NSNumber *)a3;
  count = self->_count;
  if (count != v5)
  {
    v10 = v5;
    if (!v5 || (v7 = -[NSNumber isEqualToNumber:](count, "isEqualToNumber:", v5), v5 = v10, (v7 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_count, a3);
      if (-[NSNumber longLongValue](v10, "longLongValue") < 0)
      {
        v8 = CFSTR("!");
      }
      else if (-[NSNumber unsignedLongLongValue](v10, "unsignedLongLongValue"))
      {
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%lu"), -[NSNumber unsignedIntegerValue](v10, "unsignedIntegerValue")));
      }
      else
      {
        v8 = 0;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
      objc_msgSend(v9, "setText:", v8);

      -[MTCountChevronView _updateCurrentTextColor](self, "_updateCurrentTextColor");
      -[MTCountChevronView setNeedsLayout](self, "setNeedsLayout");

      v5 = v10;
    }
  }

}

- (UIFont)font
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v5, "setFont:", v4);

  -[MTCountChevronView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[MTCountChevronView _updateCurrentTextColor](self, "_updateCurrentTextColor");
}

- (void)layoutSubviews
{
  double v3;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTCountChevronView;
  -[MTCountChevronView layoutSubviews](&v25, "layoutSubviews");
  -[MTCountChevronView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MTCountChevronView _countFrameForViewSize:](self, "_countFrameForViewSize:", v3, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[MTCountChevronView _chevronFrameForViewSize:](self, "_chevronFrameForViewSize:", v4, v6);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](self, "chevronView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[MTCountChevronView _countSize](self, "_countSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[MTCountChevronView _chevronSize](self, "_chevronSize");
  v10 = v5 + 14.0 + v9;
  if (v7 >= v8)
    v8 = v7;
  result.height = v8;
  result.width = v10;
  return result;
}

- (void)_updateCurrentTextColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCountChevronView count](self, "count"));
  if (((unint64_t)objc_msgSend(v6, "longLongValue") & 0x8000000000000000) != 0)
    v3 = objc_claimAutoreleasedReturnValue(-[MTCountChevronView tintColor](self, "tintColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[MTCountChevronView textColor](self, "textColor"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (CGRect)_chevronFrameForViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[MTCountChevronView _chevronSize](self, "_chevronSize");
  v7 = v6;
  v9 = v8;
  v10 = IMRoundToPixel((height - v8) * 0.5);
  v11 = -[MTCountChevronView mt_isRTL](self, "mt_isRTL");
  v12 = width - v7;
  if (v11)
    v12 = 0.0;
  v13 = v10;
  v14 = v7;
  v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_chevronSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView chevronView](self, "chevronView"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_countSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView countLabel](self, "countLabel"));
  objc_msgSend(v2, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)_countFrameForViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[MTCountChevronView _countSize](self, "_countSize");
  v7 = v6;
  v9 = v8;
  v10 = IMRoundToPixel((height - v8) * 0.5);
  v11 = -[MTCountChevronView mt_isRTL](self, "mt_isRTL");
  v12 = width - v7;
  if (!v11)
    v12 = 0.0;
  v13 = v10;
  v14 = v7;
  v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UILabel)countLabel
{
  UILabel *countLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  countLabel = self->_countLabel;
  if (!countLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_countLabel;
    self->_countLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView font](self, "font"));
    -[UILabel setFont:](self->_countLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountChevronView textColor](self, "textColor"));
    -[UILabel setTextColor:](self->_countLabel, "setTextColor:", v7);

    countLabel = self->_countLabel;
  }
  return countLabel;
}

- (MTChevronView)chevronView
{
  MTChevronView *chevronView;
  MTChevronView *v4;
  MTChevronView *v5;

  chevronView = self->_chevronView;
  if (!chevronView)
  {
    v4 = objc_opt_new(MTChevronView);
    v5 = self->_chevronView;
    self->_chevronView = v4;

    -[MTChevronView sizeToFit](self->_chevronView, "sizeToFit");
    chevronView = self->_chevronView;
  }
  return chevronView;
}

- (NSNumber)count
{
  return self->_count;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_count, 0);
}

@end
