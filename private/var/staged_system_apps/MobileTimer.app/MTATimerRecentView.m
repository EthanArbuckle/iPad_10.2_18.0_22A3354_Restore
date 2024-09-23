@implementation MTATimerRecentView

+ (double)estimatedHeightForTimerWithTitle:(id)a3
{
  double result;

  +[MTATimerCellView estimatedHeightForTimerWithTitle:](MTATimerCellView, "estimatedHeightForTimerWithTitle:", a3);
  return result;
}

- (void)setDelegate:(id)a3 duration:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MTATimerRecentView setDelegate:](self, "setDelegate:", a3);
  -[MTATimerRecentView setDuration:](self, "setDuration:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView duration](self, "duration"));
  -[MTATimerRecentView updateDuration:](self, "updateDuration:", v7);

}

- (MTATimerRecentView)initWithFrame:(CGRect)a3
{
  MTATimerRecentView *v3;
  MTATimerRecentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerRecentView;
  v3 = -[MTATimerRecentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MTATimerRecentView localSetup](v3, "localSetup");
  return v4;
}

- (void)localSetup
{
  void *v3;
  id v4;

  -[MTATimerRecentView setupCountdownLabel](self, "setupCountdownLabel");
  -[MTATimerRecentView setupDurationLabel](self, "setupDurationLabel");
  -[MTATimerRecentView setupControlButton](self, "setupControlButton");
  -[MTATimerRecentView setupLayoutConstraints](self, "setupLayoutConstraints");
  -[MTATimerRecentView setupDateFormatters](self, "setupDateFormatters");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v3, "setText:", CFSTR("5:00"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "setText:", CFSTR("15:00"));

}

- (void)setupCountdownLabel
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_opt_new(UILabel);
  -[MTATimerRecentView setCountDownLabel:](self, "setCountDownLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  -[MTATimerRecentView addSubview:](self, "addSubview:", v9);

}

- (void)setupDurationLabel
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_opt_new(UILabel);
  -[MTATimerRecentView setDurationLabel:](self, "setDurationLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v7, "setNumberOfLines:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  -[MTATimerRecentView addSubview:](self, "addSubview:", v10);

}

- (void)setupControlButton
{
  MTATimerRecentStartButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[MTATimerRecentStartButton initWithFrame:]([MTATimerRecentStartButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MTATimerRecentView setControlButton:](self, "setControlButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setCornerRadius:", 33.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", CFSTR("play.fill"), v9, 24.0));
  objc_msgSend(v8, "setImage:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "didTapStartButton:", 64);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  -[MTATimerRecentView addSubview:](self, "addSubview:", v12);

}

- (void)setupDateFormatters
{
  NSDateComponentsFormatter *v3;
  void *v4;
  void *v5;
  NSDateComponentsFormatter *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(NSDateComponentsFormatter);
  -[MTATimerRecentView setDurationFormatter:](self, "setDurationFormatter:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationFormatter](self, "durationFormatter"));
  objc_msgSend(v4, "setAllowedUnits:", 224);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationFormatter](self, "durationFormatter"));
  objc_msgSend(v5, "setUnitsStyle:", 2);

  v6 = objc_opt_new(NSDateComponentsFormatter);
  -[MTATimerRecentView setTitleFormatter:](self, "setTitleFormatter:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView titleFormatter](self, "titleFormatter"));
  objc_msgSend(v7, "setAllowedUnits:", 224);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView titleFormatter](self, "titleFormatter"));
  objc_msgSend(v8, "setUnitsStyle:", 0);

}

- (void)setupLayoutConstraints
{
  UILayoutGuide *v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSMutableArray *v65;

  v65 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v3, "setIdentifier:", CFSTR("cellContentLayoutGuide"));
  -[MTATimerRecentView addLayoutGuide:](self, "addLayoutGuide:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0));
  -[NSMutableArray addObject:](v65, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v3, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView trailingAnchor](self, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -16.0));
  -[NSMutableArray addObject:](v65, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v3, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView topAnchor](self, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0));
  -[NSMutableArray addObject:](v65, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v3, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -8.0));
  -[NSMutableArray addObject:](v65, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  -[NSMutableArray addObject:](v65, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 16.0 * -0.5));
  -[NSMutableArray addObject:](v65, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v3, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  -[NSMutableArray addObject:](v65, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  -[NSMutableArray addObject:](v65, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  -[NSMutableArray addObject:](v65, "addObject:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v65, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v3, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  -[NSMutableArray addObject:](v65, "addObject:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 66.0));
  -[NSMutableArray addObject:](v65, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", 66.0));
  -[NSMutableArray addObject:](v65, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstBaselineAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "font"));
  objc_msgSend(v58, "capHeight");
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, -(v59 + 2.0)));
  -[NSMutableArray addObject:](v65, "addObject:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v3, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, (84.0 + -66.0) * -0.5));
  -[NSMutableArray addObject:](v65, "addObject:", v64);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v65);
}

- (void)setEditing:(BOOL)a3
{
  double v3;
  id v4;

  if (a3)
    v3 = 0.0;
  else
    v3 = 1.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView controlButton](self, "controlButton"));
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)updateDuration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView titleFormatter](self, "titleFormatter"));
  objc_msgSend(v12, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromTimeInterval:"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
    objc_msgSend(v10, "setText:", v9);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationFormatter](self, "durationFormatter"));
    objc_msgSend(v12, "duration");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromTimeInterval:"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView durationLabel](self, "durationLabel"));
    objc_msgSend(v11, "setText:", v10);

  }
}

- (void)didTapStartButton:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerRecentView duration](self, "duration"));
  objc_msgSend(v5, "didSelectRecentDuration:", v4);

}

- (UILabel)countDownLabel
{
  return self->_countDownLabel;
}

- (void)setCountDownLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countDownLabel, a3);
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_durationLabel, a3);
}

- (UIButton)controlButton
{
  return self->_controlButton;
}

- (void)setControlButton:(id)a3
{
  objc_storeStrong((id *)&self->_controlButton, a3);
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_durationFormatter, a3);
}

- (NSDateComponentsFormatter)titleFormatter
{
  return self->_titleFormatter;
}

- (void)setTitleFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_titleFormatter, a3);
}

- (MTARecentCellViewDelegate)delegate
{
  return (MTARecentCellViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTTimerDuration)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_controlButton, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_countDownLabel, 0);
}

@end
