@implementation MTATimerCellView

+ (double)estimatedHeightForTimerWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSStringDrawingContext *v13;
  double v14;
  double v15;
  float v16;
  NSAttributedStringKey v18;
  void *v19;
  NSAttributedStringKey v20;
  void *v21;

  v20 = NSFontAttributeName;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
  v21 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(CFSTR("09:58"), "sizeWithAttributes:", v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v10 = v9 + 16.0 * -2.0 - 64.0 + 16.0 * -0.5;

  v18 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v19 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v13 = objc_opt_new(NSStringDrawingContext);
  objc_msgSend(v3, "boundingRectWithSize:options:attributes:context:", 1, v12, v13, v10, 1.79769313e308);
  v15 = v14;

  v16 = v7 + v15 + 8.0 * 2.0;
  return ceilf(v16);
}

- (MTATimerCellView)initWithDelegate:(id)a3
{
  id v4;
  MTATimerCellView *v5;
  MTATimerCellView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTATimerCellView;
  v5 = -[MTATimerCellView init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTATimerCellView setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (MTATimerCellView)initWithFrame:(CGRect)a3
{
  MTATimerCellView *v3;
  MTATimerCellView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerCellView;
  v3 = -[MTATimerCellView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MTATimerCellView localSetup](v3, "localSetup");
  return v4;
}

- (void)localSetup
{
  void *v3;
  id v4;

  -[MTATimerCellView setupCountdownLabel](self, "setupCountdownLabel");
  -[MTATimerCellView setupDurationLabel](self, "setupDurationLabel");
  -[MTATimerCellView setupCountdownView](self, "setupCountdownView");
  -[MTATimerCellView setupControlButton](self, "setupControlButton");
  -[MTATimerCellView setupLayoutConstraints](self, "setupLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v3, "setText:", CFSTR("5:00"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
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
  -[MTATimerCellView setCountDownLabel:](self, "setCountDownLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  -[MTATimerCellView addSubview:](self, "addSubview:", v9);

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
  -[MTATimerCellView setDurationLabel:](self, "setDurationLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v7, "setNumberOfLines:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  -[MTATimerCellView addSubview:](self, "addSubview:", v10);

}

- (void)setupCountdownView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.32));
  v3 = objc_alloc((Class)MTUITimerCountdownView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  v5 = objc_msgSend(v3, "initWithBarColor:backgroundBarColor:barWidth:", v4, v8, 4.0);
  -[MTATimerCellView setCountDownView:](self, "setCountDownView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  -[MTATimerCellView addSubview:](self, "addSubview:", v7);

}

- (void)setupControlButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[MTATimerCellView setControlButton:](self, "setControlButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  objc_msgSend(v4, "_setTouchInsets:", -30.0, -30.0, -30.0, -30.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MTATimerCellView updateControlButtonWithState:](self, "updateControlButtonWithState:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "didTapPauseResumeButton:", 64);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  -[MTATimerCellView addSubview:](self, "addSubview:", v7);

}

- (void)setupLayoutConstraints
{
  UILayoutGuide *v3;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  UILayoutGuide *v6;
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
  UILayoutGuide *v26;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  UILayoutGuide *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  UILayoutGuide *v105;
  NSMutableArray *v106;

  v106 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v3, "setIdentifier:", CFSTR("leftLayoutGuide"));
  -[MTATimerCellView addLayoutGuide:](self, "addLayoutGuide:", v3);
  v4 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v4, "setIdentifier:", CFSTR("rightLayoutGuide"));
  v5 = v4;
  -[MTATimerCellView addLayoutGuide:](self, "addLayoutGuide:", v4);
  v6 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v6, "setIdentifier:", CFSTR("cellContentLayoutGuide"));
  -[MTATimerCellView addLayoutGuide:](self, "addLayoutGuide:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 16.0));
  -[NSMutableArray addObject:](v106, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v6, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -((84.0 - 64.0) * 0.5 + 16.0)));
  -[NSMutableArray addObject:](v106, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v6, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 8.0));
  -[NSMutableArray addObject:](v106, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v6, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -8.0));
  -[NSMutableArray addObject:](v106, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v6, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  -[NSMutableArray addObject:](v106, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v3, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v6, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  -[NSMutableArray addObject:](v106, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v3, "trailingAnchor"));
  v26 = v5;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v5, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 16.0 * -0.5));
  -[NSMutableArray addObject:](v106, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v5, "centerYAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v6, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  -[NSMutableArray addObject:](v106, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v5, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v6, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  -[NSMutableArray addObject:](v106, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  -[NSMutableArray addObject:](v106, "addObject:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v3, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v106, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
  -[NSMutableArray addObject:](v106, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v3, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  -[NSMutableArray addObject:](v106, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v105 = v3;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v3, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
  -[NSMutableArray addObject:](v106, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v3, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  -[NSMutableArray addObject:](v106, "addObject:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "heightAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:", 64.0));
  -[NSMutableArray addObject:](v106, "addObject:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "widthAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v66));
  -[NSMutableArray addObject:](v106, "addObject:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
  v70 = v26;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v26, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));
  -[NSMutableArray addObject:](v106, "addObject:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v26, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
  -[NSMutableArray addObject:](v106, "addObject:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "firstBaselineAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "font"));
  objc_msgSend(v82, "capHeight");
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v80, -(v83 + 2.0)));
  -[NSMutableArray addObject:](v106, "addObject:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bottomAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v70, "bottomAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v87));
  -[NSMutableArray addObject:](v106, "addObject:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "heightAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToConstant:", 30.0));
  -[NSMutableArray addObject:](v106, "addObject:", v91);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "widthAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToConstant:", 30.0));
  -[NSMutableArray addObject:](v106, "addObject:", v94);

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "centerXAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "centerXAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v98));
  -[NSMutableArray addObject:](v106, "addObject:", v99);

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "centerYAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "centerYAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v103));
  -[NSMutableArray addObject:](v106, "addObject:", v104);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v106);
}

- (void)setEditing:(BOOL)a3
{
  double v4;
  void *v5;
  id v6;

  if (a3)
    v4 = 0.0;
  else
    v4 = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  objc_msgSend(v6, "setAlpha:", v4);

}

- (void)tickWithTimer:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "remainingTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "state");

  v8 = round(v6);
  v9 = 0.0;
  if (v7 == (id)2)
    v9 = 1.0;
  if (v8 < v9)
    v8 = v9;
  v10 = FormatTime(0, 0, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v11, "setText:", v12);

}

- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  MTATimerCellView *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  _BOOL4 v36;

  v7 = a7;
  v12 = a6;
  v14 = MTLogForCategory(8, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138544898;
    v24 = self;
    v25 = 2048;
    v26 = a3;
    v27 = 2048;
    v28 = a4;
    v29 = 2048;
    v30 = a5;
    v31 = 2048;
    v32 = -[MTATimerCellView state](self, "state");
    v33 = 2114;
    v34 = v12;
    v35 = 1024;
    v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ setRemainingTime: %f, duration: %f, new state: %li, currentState: %li, title: %{public}@, forceRefresh: %i", (uint8_t *)&v23, 0x44u);
  }

  -[MTATimerCellView processCountdownState:previousState:remainingTime:duration:forceRefresh:](self, "processCountdownState:previousState:remainingTime:duration:forceRefresh:", a5, -[MTATimerCellView state](self, "state"), v7, a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  objc_msgSend(v16, "setNeedsLayout");

  -[MTATimerCellView setState:](self, "setState:", a5);
  -[MTATimerCellView updateControlButtonWithState:](self, "updateControlButtonWithState:", a5);
  -[MTATimerCellView updateLabelColorForState:](self, "updateLabelColorForState:", a5);
  if (objc_msgSend(v12, "length"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
    objc_msgSend(v17, "setText:", v12);

  }
  else
  {
    -[MTATimerCellView setDurationWithInterval:](self, "setDurationWithInterval:", a4);
  }
  v18 = round(a3);
  v19 = 0.0;
  if (a5 == 2)
    v19 = 1.0;
  if (v18 < v19)
    v18 = v19;
  v20 = FormatTime(0, 0, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v22, "setText:", v21);

}

- (void)setDurationWithInterval:(double)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "setText:", v5);

}

- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7
{
  _BOOL4 v7;
  void *v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
  objc_msgSend(v13, "duration");
  v15 = v14;

  if (a3 == a4 && v15 == a6 && !v7)
    return;
  switch(a3)
  {
    case 1uLL:
      v23 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
      objc_msgSend(v23, "stop");
      goto LABEL_25;
    case 3uLL:
      if (a4 != 3 || v7)
      {
        if (a4 >= 2 && a4 != 3)
        {
          if (a4 != 2)
            return;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
          objc_msgSend(v17, "setAnimationRemainingTime:totalTime:", a5, a6);

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
          v19 = objc_msgSend(v18, "isStarted");

          v23 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
          if (v19)
          {
            objc_msgSend(v23, "resume");
            goto LABEL_25;
          }
          v21 = v23;
LABEL_22:
          objc_msgSend(v21, "start");
          goto LABEL_25;
        }
      }
      else if (v15 == a6)
      {
        return;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
      objc_msgSend(v20, "setAnimationRemainingTime:totalTime:", a5, a6);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
      v23 = v21;
      goto LABEL_22;
    case 2uLL:
      if (a4 < 3)
      {
        v23 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
        objc_msgSend(v23, "setAnimationRemainingTime:totalTime:", a5, a6);
LABEL_25:

        return;
      }
      if (a4 == 3)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
        objc_msgSend(v22, "setAnimationRemainingTime:totalTime:", a5, a6);

        v23 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
        objc_msgSend(v23, "pause");
        goto LABEL_25;
      }
      break;
  }
}

- (void)updateControlButtonWithState:(unint64_t)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  if (a3 == 3)
    v3 = CFSTR("pause.fill");
  else
    v3 = CFSTR("play.fill");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCellView controlButton](self, "controlButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", v3, v4, 24.0));
  objc_msgSend(v6, "setImage:forState:", v5, 0);

}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  void *v6;
  void *v7;
  double v8;
  _QWORD v9[6];
  BOOL v10;

  self->_state = a3;
  if (a4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100026C18;
    v9[3] = &unk_1000998E8;
    v10 = a3 == 1;
    v9[4] = self;
    v9[5] = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.2);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownView](self, "countDownView"));
    v7 = v6;
    v8 = 1.0;
    if (a3 == 1)
      v8 = 0.0;
    objc_msgSend(v6, "setAlpha:", v8);

    -[MTATimerCellView updateLabelColorForState:](self, "updateLabelColorForState:", a3);
  }
}

- (void)updateLabelColorForState:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a3 == 2)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView countDownLabel](self, "countDownLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  if (a3 == 2)
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v10 = (id)v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView durationLabel](self, "durationLabel"));
  objc_msgSend(v9, "setTextColor:", v10);

}

- (void)didTapPauseResumeButton:(id)a3
{
  unint64_t state;
  void *v4;
  id v5;

  state = self->_state;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCellView delegate](self, "delegate", a3));
  v5 = v4;
  if (state == 3)
    objc_msgSend(v4, "didSendPauseAction");
  else
    objc_msgSend(v4, "didSendResumeAction");

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

- (MTUITimerCountdownView)countDownView
{
  return self->_countDownView;
}

- (void)setCountDownView:(id)a3
{
  objc_storeStrong((id *)&self->_countDownView, a3);
}

- (UIButton)controlButton
{
  return self->_controlButton;
}

- (void)setControlButton:(id)a3
{
  objc_storeStrong((id *)&self->_controlButton, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (MTATimerCellViewDelegate)delegate
{
  return (MTATimerCellViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlButton, 0);
  objc_storeStrong((id *)&self->_countDownView, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_countDownLabel, 0);
}

@end
