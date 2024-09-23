@implementation CarCardRoundedButton

+ ($3CC2805F0189FCCE51047C0D2B5A52A9)buttonMetrics
{
  *(_OWORD *)&retstr->var0 = xmmword_100E355D8;
  *(_OWORD *)&retstr->var2 = unk_100E355E8;
  retstr->var4 = 36.0;
  return result;
}

+ (id)button
{
  return objc_msgSend(a1, "buttonWithType:", 0);
}

+ (CarCardRoundedButton)buttonWithType:(int64_t)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CarCardRoundedButton;
  v3 = objc_msgSendSuper2(&v6, "buttonWithType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "_commonInit");
  return (CarCardRoundedButton *)v4;
}

- (CarCardRoundedButton)initWithFrame:(CGRect)a3
{
  CarCardRoundedButton *v3;
  CarCardRoundedButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarCardRoundedButton;
  v3 = -[CarFocusableButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarCardRoundedButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton layer](self, "layer"));
  objc_msgSend(v3, "setCornerRadius:", 4.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton layer](self, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", 1);

  -[CarCardRoundedButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 0);
  -[CarCardRoundedButton setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setTextAlignment:", 4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightMedium));
  objc_msgSend(v7, "setFont:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton imageView](self, "imageView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("ImageView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton imageView](self, "imageView"));
  objc_msgSend(v10, "setContentMode:", 1);

  -[CarFocusableButton setModifiesBackgroundColor:](self, "setModifiesBackgroundColor:", 1);
  -[CarFocusableButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
  -[CarFocusableButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self, "setNonFocusedTintColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  -[CarFocusableButton setFocusedTintColor:](self, "setFocusedTintColor:", v12);

  v13 = sub_100C55480();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[CarFocusableButton setNonFocusedBackgroundColor:](self, "setNonFocusedBackgroundColor:", v14);

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self, "setFocusedBackgroundColor:", v15);

}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MidY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentTitle](self, "currentTitle"));
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentAttributedTitle](self, "currentAttributedTitle"));
    v9 = v10 == 0;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentImage](self, "currentImage"));
  v12 = v11;
  if (!v11 || v9)
  {
    v34.receiver = self;
    v34.super_class = (Class)CarCardRoundedButton;
    -[CarCardRoundedButton imageRectForContentRect:](&v34, "imageRectForContentRect:", x, y, width, height);
  }
  else
  {
    objc_msgSend(v11, "size");
    v14 = 0.0;
    if (41.0 - v13 > 0.0)
    {
      objc_msgSend(v12, "size");
      v14 = (41.0 - v15) * 0.5;
    }
    objc_msgSend(v12, "size");
    v17 = v16;
    v19 = v18;
    -[CarCardRoundedButton titleRectForContentRect:](self, "titleRectForContentRect:", x, y, width, height);
    MidY = CGRectGetMidY(v35);
    objc_msgSend(v12, "size");
    v22 = sub_1004B3958(v14, MidY + v21 * -0.5, v17, v19, x, y, width, height);
  }
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;

  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentImage](self, "currentImage"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentTitle](self, "currentTitle"));
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentAttributedTitle](self, "currentAttributedTitle"));
    v10 = v11 == 0;

  }
  v30.receiver = self;
  v30.super_class = (Class)CarCardRoundedButton;
  -[CarCardRoundedButton titleRectForContentRect:](&v30, "titleRectForContentRect:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (v8 && !v10)
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v28 = CGRectGetWidth(v31);
    v29 = height;
    v32.origin.x = 41.0;
    v32.origin.y = v14;
    v32.size.width = v16;
    v32.size.height = v18;
    v19 = v28 - CGRectGetMinX(v32) + -6.0;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v20 = CGRectGetHeight(v33);
    v34.origin.x = 41.0;
    v34.origin.y = v14;
    v34.size.width = v19;
    v34.size.height = v18;
    v21 = CGRectGetHeight(v34);
    v12 = sub_1004B3958(41.0, (v20 - v21) * 0.5, v19, v18, x, y, width, v29);
    v14 = v22;
    v16 = v23;
    v18 = v24;
  }
  v25 = v14;
  v26 = v16;
  v27 = v18;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v12;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarCardRoundedButton;
  -[MapsLargerHitTargetButton layoutSubviews](&v6, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton currentImage](self, "currentImage"));
  if (v3)
    v4 = 4;
  else
    v4 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTextAlignment:", v4);

}

@end
