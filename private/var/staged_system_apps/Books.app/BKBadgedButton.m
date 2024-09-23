@implementation BKBadgedButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[BKBadgedButton badgeWidth](self, "badgeWidth", a3.width, a3.height);
  v4 = 18.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)badgeWidth
{
  double v3;

  if (!-[BKBadgedButton value](self, "value"))
    return 0.0;
  -[UILabel frame](self->_badgeLabel, "frame");
  return fmax(v3 + 10.0, 18.0);
}

- (void)layoutSubviews
{
  unint64_t v3;
  UIImageView *badgeBackground;
  id v5;
  UIImageView *v6;
  UIImageView *v7;
  UILabel *v8;
  UILabel *badgeLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  UIImage *ImageFromCurrentImageContext;
  void *v24;
  double v25;
  double y;
  double width;
  double height;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  UIImageView *v33;
  UILabel *v34;
  objc_super v35;
  CGSize v36;
  CGRect v37;
  CGRect v38;

  v35.receiver = self;
  v35.super_class = (Class)BKBadgedButton;
  -[BKBadgedButton layoutSubviews](&v35, "layoutSubviews");
  v3 = -[BKBadgedButton value](self, "value");
  badgeBackground = self->_badgeBackground;
  if (v3)
  {
    if (!badgeBackground)
    {
      v5 = objc_alloc((Class)UIImageView);
      -[BKBadgedButton bounds](self, "bounds");
      v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
      v7 = self->_badgeBackground;
      self->_badgeBackground = v6;

    }
    if (!self->_badgeLabel)
    {
      v8 = (UILabel *)objc_alloc_init((Class)UILabel);
      badgeLabel = self->_badgeLabel;
      self->_badgeLabel = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](self->_badgeLabel, "setBackgroundColor:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    -[UILabel setFont:](self->_badgeLabel, "setFont:", v11);

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), -[BKBadgedButton value](self, "value")));
    -[UILabel setText:](self->_badgeLabel, "setText:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v13);

    -[UILabel sizeToFit](self->_badgeLabel, "sizeToFit");
    -[BKBadgedButton addSubview:](self, "addSubview:", self->_badgeBackground);
    -[BKBadgedButton addSubview:](self, "addSubview:", self->_badgeLabel);
    -[BKBadgedButton badgeWidth](self, "badgeWidth");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBadgedButton window](self, "window"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
    if ((char *)objc_msgSend(v17, "interfaceOrientation") - 3 >= (char *)2)
      v18 = 0.0;
    else
      v18 = -1.0;

    if (v15 < 18.0)
      v15 = 18.0;
    -[UIImageView setFrame:](self->_badgeBackground, "setFrame:", -5.0, v18, v15, 18.0);
    -[UIImageView bounds](self->_badgeBackground, "bounds");
    v36.width = v19;
    v36.height = v20;
    UIGraphicsBeginImageContextWithOptions(v36, 0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    objc_msgSend(v21, "setFill");

    -[UIImageView bounds](self->_badgeBackground, "bounds");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
    objc_msgSend(v22, "fill");

    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v24 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    -[UIImageView setImage:](self->_badgeBackground, "setImage:", v24);

    UIGraphicsEndImageContext();
    -[UILabel frame](self->_badgeLabel, "frame");
    v37.origin.x = CGRectCenterRectInRect(v25);
    v38 = CGRectIntegral(v37);
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    v29 = v38.origin.x + 0.0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v30, "scale");
    v32 = y + -1.0 / v31;

    -[UILabel setFrame:](self->_badgeLabel, "setFrame:", v29, v32, width, height);
  }
  else
  {
    -[UIImageView removeFromSuperview](badgeBackground, "removeFromSuperview");
    v33 = self->_badgeBackground;
    self->_badgeBackground = 0;

    -[UILabel removeFromSuperview](self->_badgeLabel, "removeFromSuperview");
    v34 = self->_badgeLabel;
    self->_badgeLabel = 0;

  }
}

- (void)setValue:(unint64_t)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[BKBadgedButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeBackground, 0);
}

@end
