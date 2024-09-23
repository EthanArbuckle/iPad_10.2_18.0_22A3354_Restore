@implementation PHCarPlayDialerLCDView

- (PHCarPlayDialerLCDView)initWithFrame:(CGRect)a3
{
  PHCarPlayDialerLCDView *v3;
  id v4;
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
  objc_super v18;
  const __CFString *v19;
  void *v20;

  v18.receiver = self;
  v18.super_class = (Class)PHCarPlayDialerLCDView;
  v3 = -[PHCarPlayDialerLCDView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 150.0, 22.0);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setTextAlignment:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v4, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    objc_msgSend(v4, "setTextColor:", v7);

    objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v4, "setMinimumScaleFactor:", 0.699999988);
    objc_msgSend(v4, "setLineBreakMode:", 3);
    objc_msgSend(v4, "setText:", &stru_10008B240);
    -[PHCarPlayDialerLCDView addSubview:](v3, "addSubview:", v4);
    -[PHCarPlayDialerLCDView setMainNumberLabel:](v3, "setMainNumberLabel:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 9, 0, v3, 9, 1.0, 0.0));
    -[PHCarPlayDialerLCDView addConstraint:](v3, "addConstraint:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 1, 1, v3, 1, 1.0, 0.0));
    -[PHCarPlayDialerLCDView addConstraint:](v3, "addConstraint:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 2, -1, v3, 2, 1.0, 0.0));
    -[PHCarPlayDialerLCDView addConstraint:](v3, "addConstraint:", v13);

    v19 = CFSTR("numberLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[numberLabel]"), 0, 0, v15));
    -[PHCarPlayDialerLCDView addConstraints:](v3, "addConstraints:", v16);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)PHCarPlayDialerLCDView;
  -[PHCarPlayDialerLCDView dealloc](&v2, "dealloc");
}

- (id)text
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet unicodeDirectionalCharactersSet](NSCharacterSet, "unicodeDirectionalCharactersSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  return v5;
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v12 = v6;
  if (a4)
  {
    v7 = sub_100021574(v6);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  objc_msgSend(v10, "setText:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView delegate](self, "delegate"));
  objc_msgSend(v11, "dialerLCDFieldTextDidChange:", self);

}

- (void)insertStringAtCurrentPosition:(id)a3
{
  -[PHCarPlayDialerLCDView insertStringAtCurrentPosition:deletingPreviousCharacter:](self, "insertStringAtCurrentPosition:deletingPreviousCharacter:", a3, 0);
}

- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView text](self, "text"));
  v7 = objc_msgSend(v6, "mutableCopy");

  if ((!objc_msgSend(v7, "isEqualToString:", CFSTR("*"))
     || (objc_msgSend(v9, "isEqualToString:", CFSTR(",")) & 1) == 0)
    && (!objc_msgSend(v7, "isEqualToString:", CFSTR("#"))
     || (objc_msgSend(v9, "isEqualToString:", CFSTR(";")) & 1) == 0))
  {
    if (v4)
      objc_msgSend(v7, "deleteCharactersInRange:", (char *)objc_msgSend(v7, "length") - 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", v9));
    -[PHCarPlayDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v8, !v4);

  }
}

- (void)deleteCharacter
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = UIFormattedPhoneStringByRemovingFromEnd();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PHCarPlayDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v6, 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView delegate](self, "delegate"));
  objc_msgSend(v7, "dialerLCDFieldTextDidChange:", self);

}

- (void)setDelegate:(id)a3
{
  self->_delegate = (DialerLCDFieldDelegate *)a3;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  objc_msgSend(v2, "bounds");
  v4 = v3;

  v5 = 150.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)highlighted
{
  return 0;
}

- (id)name
{
  return 0;
}

- (UILabel)mainNumberLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMainNumberLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (DialerLCDFieldDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainNumberLabel, 0);
}

@end
