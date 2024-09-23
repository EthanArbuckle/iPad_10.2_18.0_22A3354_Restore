@implementation MTAStopwatchLapTableHeaderView

- (MTAStopwatchLapTableHeaderView)initWithFrame:(CGRect)a3
{
  MTAStopwatchLapTableHeaderView *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)MTAStopwatchLapTableHeaderView;
  v3 = -[MTAStopwatchLapTableHeaderView initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    -[MTAStopwatchLapTableHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView labelFont](v3, "labelFont"));
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapTableHeaderView setLapNumberLabel:](v3, "setLapNumberLabel:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](v3, "lapNumberLabel"));
    objc_msgSend(v11, "setFont:", v5);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("STOPWATCH_LAP_HEADER"), &stru_10009A4D0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](v3, "lapNumberLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](v3, "lapNumberLabel"));
    objc_msgSend(v16, "setTextColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](v3, "lapNumberLabel"));
    -[MTAStopwatchLapTableHeaderView addSubview:](v3, "addSubview:", v17);

    v18 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapTableHeaderView setSplitLabel:](v3, "setSplitLabel:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](v3, "splitLabel"));
    objc_msgSend(v19, "setFont:", v5);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("STOPWATCH_SPLIT_HEADER"), &stru_10009A4D0, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](v3, "splitLabel"));
    objc_msgSend(v22, "setText:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](v3, "splitLabel"));
    objc_msgSend(v24, "setTextColor:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](v3, "splitLabel"));
    -[MTAStopwatchLapTableHeaderView addSubview:](v3, "addSubview:", v25);

    v26 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MTAStopwatchLapTableHeaderView setTotalLabel:](v3, "setTotalLabel:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](v3, "totalLabel"));
    objc_msgSend(v27, "setFont:", v5);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("STOPWATCH_TOTAL_HEADER"), &stru_10009A4D0, 0));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](v3, "totalLabel"));
    objc_msgSend(v30, "setText:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](v3, "totalLabel"));
    objc_msgSend(v32, "setTextColor:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](v3, "totalLabel"));
    -[MTAStopwatchLapTableHeaderView addSubview:](v3, "addSubview:", v33);

    v34 = objc_opt_new(UIView);
    -[MTAStopwatchLapTableHeaderView setBottomKeylineView:](v3, "setBottomKeylineView:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellSeparatorColor](UIColor, "mtui_cellSeparatorColor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](v3, "bottomKeylineView"));
    objc_msgSend(v36, "setBackgroundColor:", v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](v3, "bottomKeylineView"));
    -[MTAStopwatchLapTableHeaderView addSubview:](v3, "addSubview:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v38, "addObserver:selector:name:object:", v3, "_updateForContentSizeChange", UIContentSizeCategoryDidChangeNotification, 0);

    -[MTAStopwatchLapTableHeaderView setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)_updateForContentSizeChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView labelFont](self, "labelFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  objc_msgSend(v3, "setFont:", v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](self, "splitLabel"));
  objc_msgSend(v4, "setFont:", v12);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](self, "totalLabel"));
  objc_msgSend(v5, "setFont:", v12);

  objc_msgSend(v12, "_scaledValueForValue:", 24.0);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabelBaselineTopOffsetConstraint](self, "lapNumberLabelBaselineTopOffsetConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  objc_msgSend(v12, "_scaledValueForValue:", 15.0);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabelBaselineBottomOffsetConstraint](self, "lapNumberLabelBaselineBottomOffsetConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

}

- (id)labelFont
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));

  if (UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityExtraLarge) == NSOrderedDescending)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraLarge));
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v4));

  return v5;
}

- (void)setupConstraints
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
  uint64_t v54;
  id v55;
  void *v56;
  NSMutableArray *v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](self, "splitLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](self, "totalLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](self, "bottomKeylineView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v57 = objc_opt_new(NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView leadingAnchor](self, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  -[NSMutableArray addObject:](v57, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView labelFont](self, "labelFont"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView topAnchor](self, "topAnchor"));
  objc_msgSend(v11, "_scaledValueForValue:", 24.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14));
  -[MTAStopwatchLapTableHeaderView setLapNumberLabelBaselineTopOffsetConstraint:](self, "setLapNumberLabelBaselineTopOffsetConstraint:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabelBaselineTopOffsetConstraint](self, "lapNumberLabelBaselineTopOffsetConstraint"));
  -[NSMutableArray addObject:](v57, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastBaselineAnchor"));
  objc_msgSend(v11, "_scaledValueForValue:", 15.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19));
  -[MTAStopwatchLapTableHeaderView setLapNumberLabelBaselineBottomOffsetConstraint:](self, "setLapNumberLabelBaselineBottomOffsetConstraint:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabelBaselineBottomOffsetConstraint](self, "lapNumberLabelBaselineBottomOffsetConstraint"));
  -[NSMutableArray addObject:](v57, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](self, "splitLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView centerXAnchor](self, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  -[NSMutableArray addObject:](v57, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView splitLabel](self, "splitLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  -[NSMutableArray addObject:](v57, "addObject:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](self, "totalLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  -[NSMutableArray addObject:](v57, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView totalLabel](self, "totalLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView lapNumberLabel](self, "lapNumberLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastBaselineAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
  -[NSMutableArray addObject:](v57, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](self, "bottomKeylineView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView leadingAnchor](self, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  -[NSMutableArray addObject:](v57, "addObject:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](self, "bottomKeylineView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView trailingAnchor](self, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  -[NSMutableArray addObject:](v57, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](self, "bottomKeylineView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomAnchor](self, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  -[NSMutableArray addObject:](v57, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchLapTableHeaderView bottomKeylineView](self, "bottomKeylineView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "heightAnchor"));
  v55 = objc_msgSend(v53, "constraintEqualToConstant:", 1.0 / MTUIMainScreenScale(v53, v54));
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  -[NSMutableArray addObject:](v57, "addObject:", v56);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v57);
}

- (UILabel)lapNumberLabel
{
  return self->_lapNumberLabel;
}

- (void)setLapNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lapNumberLabel, a3);
}

- (UILabel)splitLabel
{
  return self->_splitLabel;
}

- (void)setSplitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_splitLabel, a3);
}

- (UILabel)totalLabel
{
  return self->_totalLabel;
}

- (void)setTotalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_totalLabel, a3);
}

- (UIView)bottomKeylineView
{
  return self->_bottomKeylineView;
}

- (void)setBottomKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomKeylineView, a3);
}

- (NSLayoutConstraint)lapNumberLabelBaselineTopOffsetConstraint
{
  return self->_lapNumberLabelBaselineTopOffsetConstraint;
}

- (void)setLapNumberLabelBaselineTopOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lapNumberLabelBaselineTopOffsetConstraint, a3);
}

- (NSLayoutConstraint)lapNumberLabelBaselineBottomOffsetConstraint
{
  return self->_lapNumberLabelBaselineBottomOffsetConstraint;
}

- (void)setLapNumberLabelBaselineBottomOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lapNumberLabelBaselineBottomOffsetConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lapNumberLabelBaselineBottomOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_lapNumberLabelBaselineTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_bottomKeylineView, 0);
  objc_storeStrong((id *)&self->_totalLabel, 0);
  objc_storeStrong((id *)&self->_splitLabel, 0);
  objc_storeStrong((id *)&self->_lapNumberLabel, 0);
}

@end
