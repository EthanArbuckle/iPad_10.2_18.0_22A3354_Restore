@implementation PHCarPlayInCallDialerLCDView

- (PHCarPlayInCallDialerLCDView)initWithFrame:(CGRect)a3
{
  PHCarPlayInCallDialerLCDView *v3;
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
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];
  const __CFString *v26;
  void *v27;

  v24.receiver = self;
  v24.super_class = (Class)PHCarPlayInCallDialerLCDView;
  v3 = -[PHCarPlayInCallDialerLCDView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "withCaseSensitiveAttribute"));
    objc_msgSend(v4, "setFont:", v6);

    objc_msgSend(v4, "setTextAlignment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v4, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    objc_msgSend(v4, "setTextColor:", v8);

    objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v4, "setLineBreakMode:", 3);
    objc_msgSend(v4, "setText:", &stru_10008B240);
    -[PHCarPlayInCallDialerLCDView addSubview:](v3, "addSubview:", v4);
    -[PHCarPlayInCallDialerLCDView setMainNumberLabel:](v3, "setMainNumberLabel:", v4);
    v26 = CFSTR("numberLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v27 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 9, 0, v3, 9, 1.0, 0.0));
    v25[0] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, v20, 3, 1.0, 0.0));
    v25[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v11, 4, 1.0, 0.0));
    v25[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 5, 0, v13, 5, 1.0, 0.0));
    v25[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](v3, "mainNumberLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 6, 0, v15, 6, 1.0, 0.0));
    v25[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5));
    -[PHCarPlayInCallDialerLCDView addConstraints:](v3, "addConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[numberLabel]"), 0, 0, v23));
    -[PHCarPlayInCallDialerLCDView addConstraints:](v3, "addConstraints:", v18);

  }
  return v3;
}

- (id)text
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView mainNumberLabel](self, "mainNumberLabel"));
  objc_msgSend(v6, "setText:", v5);

}

- (void)insertStringAtCurrentPosition:(id)a3
{
  -[PHCarPlayInCallDialerLCDView insertStringAtCurrentPosition:deletingPreviousCharacter:](self, "insertStringAtCurrentPosition:deletingPreviousCharacter:", a3, 0);
}

- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR(",")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR(";")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("+")) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView text](self, "text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v7));
    -[PHCarPlayInCallDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v6, 1);

  }
}

- (void)deleteCharacter
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallDialerLCDView text](self, "text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingLastCharacter"));
  -[PHCarPlayInCallDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v3, 0);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainNumberLabel, 0);
}

@end
