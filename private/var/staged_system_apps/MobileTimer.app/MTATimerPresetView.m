@implementation MTATimerPresetView

- (MTATimerPresetView)initWithFrame:(CGRect)a3
{
  MTATimerPresetView *v3;
  MTATimerPresetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerPresetView;
  v3 = -[MTATimerPresetView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MTATimerPresetView localSetup](v3, "localSetup");
  return v4;
}

- (void)setPresetItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "number"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  objc_msgSend(v6, "setText:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  objc_msgSend(v7, "setText:", v8);

}

- (void)localSetup
{
  -[MTATimerPresetView setupCircleView](self, "setupCircleView");
  -[MTATimerPresetView setupNumberLabel](self, "setupNumberLabel");
  -[MTATimerPresetView setupUnitLabel](self, "setupUnitLabel");
  -[MTATimerPresetView setupLayoutConstraints](self, "setupLayoutConstraints");
}

- (void)setupCircleView
{
  UIView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = objc_opt_new(UIView);
  -[MTATimerPresetView setCircleView:](self, "setCircleView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MTATimerPresetView bounds](self, "bounds");
  v6 = v5;
  -[MTATimerPresetView bounds](self, "bounds");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  v9 = v8 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v11, "setCornerRadius:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  -[MTATimerPresetView addSubview:](self, "addSubview:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  objc_msgSend(v15, "setHoverStyle:", 0);

  v17 = (id)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView hoverStyle](self, "hoverStyle"));
  objc_msgSend(v16, "setShape:", v17);

}

- (void)setupNumberLabel
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
  -[MTATimerPresetView setNumberLabel:](self, "setNumberLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  objc_msgSend(v7, "setTextAlignment:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 28.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  -[MTATimerPresetView addSubview:](self, "addSubview:", v10);

}

- (void)setupUnitLabel
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(UILabel);
  -[MTATimerPresetView setUnitLabel:](self, "setUnitLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  objc_msgSend(v7, "setTextAlignment:", 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  -[MTATimerPresetView addSubview:](self, "addSubview:", v8);

}

- (void)setupLayoutConstraints
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UILayoutGuide *v19;
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
  double v38;
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
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSMutableArray *v65;

  v65 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  -[NSMutableArray addObject:](v65, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  -[NSMutableArray addObject:](v65, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView topAnchor](self, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v65, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  -[NSMutableArray addObject:](v65, "addObject:", v18);

  v19 = objc_opt_new(UILayoutGuide);
  -[MTATimerPresetView addLayoutGuide:](self, "addLayoutGuide:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v19, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView centerXAnchor](self, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  -[NSMutableArray addObject:](v65, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v19, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView centerYAnchor](self, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  -[NSMutableArray addObject:](v65, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v19, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v28));
  -[NSMutableArray addObject:](v65, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v19, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v32));
  -[NSMutableArray addObject:](v65, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v19, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));

  LODWORD(v38) = 1144750080;
  objc_msgSend(v37, "setPriority:", v38);
  -[NSMutableArray addObject:](v65, "addObject:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v19, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v65, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
  -[NSMutableArray addObject:](v65, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v19, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:", v50));
  -[NSMutableArray addObject:](v65, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v19, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v54));
  -[NSMutableArray addObject:](v65, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v19, "centerXAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));

  LODWORD(v60) = 1144750080;
  objc_msgSend(v59, "setPriority:", v60);
  -[NSMutableArray addObject:](v65, "addObject:", v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v19, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
  -[NSMutableArray addObject:](v65, "addObject:", v64);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v65);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
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
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTATimerPresetView;
  -[MTATimerPresetView setHighlighted:](&v16, "setHighlighted:");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.28));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
    objc_msgSend(v11, "setTextColor:", v10);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView circleView](self, "circleView"));
    objc_msgSend(v13, "setBackgroundColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView numberLabel](self, "numberLabel"));
    objc_msgSend(v15, "setTextColor:", v14);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetView unitLabel](self, "unitLabel"));
    objc_msgSend(v10, "setTextColor:", v9);
  }

}

- (UIView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (UILabel)unitLabel
{
  return self->_unitLabel;
}

- (void)setUnitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_unitLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
}

@end
