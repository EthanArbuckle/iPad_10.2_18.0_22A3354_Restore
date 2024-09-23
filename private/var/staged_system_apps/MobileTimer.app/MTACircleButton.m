@implementation MTACircleButton

+ (double)buttonWidthForSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __n128 v16;
  void *v17;
  uint64_t *v18;
  double v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyWindow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));

  v7 = objc_msgSend(v6, "horizontalSizeClass");
  v8 = (double *)&unk_10007AAC0;
  if (v7 != (id)2)
    v8 = (double *)&unk_10007AAB8;
  v9 = *v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyWindow"));
  objc_msgSend(v11, "frame");
  v13 = v12;

  v14 = (v13 + v9 * -4.0) * 0.5;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v17 = v15;
  if (a3)
  {
    v16.n128_u64[0] = 0;
    if (a3 != 1)
      goto LABEL_9;
    v18 = &qword_10007AAD0;
  }
  else
  {
    v18 = &qword_10007AAC8;
  }
  v15 = objc_msgSend(v15, "_scaledValueForValue:", *(double *)v18);
  if (v16.n128_f64[0] >= v14)
    v16.n128_f64[0] = v14;
LABEL_9:
  v19 = MTUIRoundToPixel(v15, v16);

  return v19;
}

- (MTACircleButton)initWithFrame:(CGRect)a3
{
  MTACircleButton *v3;
  MTACircleButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTACircleButton;
  v3 = -[MTACircleButton initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_buttonCircleSize = -1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTACircleButton setTintColor:](v4, "setTintColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    objc_msgSend(v6, "setTextAlignment:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    objc_msgSend(v7, "setBaselineAdjustment:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAUITextStyleDescriptor descriptorWithTextStyle:](NAUITextStyleDescriptor, "descriptorWithTextStyle:", UIFontTextStyleBody));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "descriptorByDisallowingSmallSizes"));
    objc_msgSend(v9, "naui_setDynamicFontTextStyleDescriptor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MTACircleButton setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, v4, 8, 1.0, 0.0));
    objc_msgSend(v12, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v4, 5, 1.0, 8.0));
    objc_msgSend(v12, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, 0, v4, 6, 1.0, -8.0));
    objc_msgSend(v12, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](v4, "titleLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, v4, 9, 1.0, -8.0));

    LODWORD(v21) = 1148829696;
    objc_msgSend(v20, "setPriority:", v21);
    objc_msgSend(v12, "addObject:", v20);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  }
  return v4;
}

- (void)setButtonCircleSize:(unint64_t)a3
{
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  id v9;

  if (self->_buttonCircleSize != a3)
  {
    self->_buttonCircleSize = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
    v7 = sub_100020064(a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));
    -[MTACircleButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v9, 0);

  }
}

- (void)handleContentSizeChange
{
  unint64_t buttonCircleSize;
  void *v4;
  void *v5;
  UIImage *v6;
  void *v7;
  id v8;

  buttonCircleSize = self->_buttonCircleSize;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v6 = sub_100020064(buttonCircleSize, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithRenderingMode:", 2));
  -[MTACircleButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v8, 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)MTACircleButton;
  -[MTACircleButton sizeThatFits:](&v12, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton titleLabel](self, "titleLabel"));
  v9 = objc_msgSend(v8, "adjustsFontSizeToFitWidth");

  if (v9)
    v10 = v7;
  else
    v10 = v5;
  v11 = v10;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)preferredHorizontalMargin
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double result;
  BOOL v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTACircleButton window](self, "window"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  if (MTUIShouldUseLargePadLayout())
  {
    v7 = v6 <= 1024.0 && v4 <= 1024.0;
    result = 90.0;
    if (!v7)
      return 132.0;
  }
  else
  {
    v9 = v6 <= 768.0 && v4 <= 768.0;
    result = 82.0;
    if (v9)
      return 29.0;
  }
  return result;
}

- (unint64_t)buttonCircleSize
{
  return self->_buttonCircleSize;
}

@end
