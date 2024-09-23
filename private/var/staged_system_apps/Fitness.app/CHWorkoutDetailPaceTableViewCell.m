@implementation CHWorkoutDetailPaceTableViewCell

+ (id)_paceFormats
{
  if (qword_10083DE98 != -1)
    dispatch_once(&qword_10083DE98, &stru_100777C30);
  return (id)qword_10083DE90;
}

+ (double)preferredHeightForWorkout:(id)a3
{
  id v3;
  double result;

  v3 = objc_msgSend(a3, "workoutActivityType");
  result = 74.0;
  if (v3 == (id)46)
    return 116.0;
  return result;
}

- (CHWorkoutDetailPaceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailPaceTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHWorkoutDetailPaceTableViewCell;
  v4 = -[CHWorkoutDetailPaceTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHWorkoutDetailPaceTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[CHWorkoutDetailPaceTableViewCell _createSeparator](v4, "_createSeparator");
    -[CHWorkoutDetailPaceTableViewCell _createLabels](v4, "_createLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    objc_msgSend((id)objc_opt_class(v4, v8), "preferredHeightForWorkout:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));

    LODWORD(v10) = 1148829696;
    objc_msgSend(v9, "setPriority:", v10);
    objc_msgSend(v9, "setActive:", 1);
    -[CHWorkoutDetailPaceTableViewCell setHeightConstraint:](v4, "setHeightConstraint:", v9);

  }
  return v4;
}

- (void)_createLabels
{
  UILabel *v3;
  UILabel *titleLabel;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *valueLabel;
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
  _QWORD v34[4];

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORKOUT_PACE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_titleLabel);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, sub_10005F11C());
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v18, "_scaledValueForValue:", 28.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v17));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
  v21 = (UILabel *)objc_alloc_init((Class)UILabel);
  valueLabel = self->_valueLabel;
  self->_valueLabel = v21;

  -[UILabel setFont:](self->_valueLabel, "setFont:", v20);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors paceColors](ARUIMetricColors, "paceColors"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nonGradientTextColor"));
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  objc_msgSend(v25, "addSubview:", self->_valueLabel);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  objc_msgSend(v26, "bringSubviewToFront:", self->_titleLabel);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_valueLabel, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_valueLabel, "firstBaselineAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 30.0));

  v34[0] = v14;
  v34[1] = v19;
  v34[2] = v29;
  v34[3] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

}

- (void)_createSegmentedControl
{
  id v3;
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UISegmentedControl *v16;
  UISegmentedControl *segmentedControl;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
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
  _QWORD v41[5];
  _QWORD v42[4];
  _QWORD v43[3];

  if (!self->_segmentedControl)
  {
    v3 = objc_msgSend((id)objc_opt_class(self, a2), "_paceFormats");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100051150;
    v41[3] = &unk_100777C58;
    v41[4] = self;
    v4 = objc_retainBlock(v41);
    v5 = objc_alloc((Class)UISegmentedControl);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", 0));
    v7 = ((uint64_t (*)(_QWORD *, void *))v4[2])(v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v43[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", 1));
    v10 = ((uint64_t (*)(_QWORD *, void *))v4[2])(v4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v43[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", 2));
    v39 = v4;
    v13 = ((uint64_t (*)(_QWORD *, void *))v4[2])(v4, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v43[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 3));
    v16 = (UISegmentedControl *)objc_msgSend(v5, "initWithItems:", v15);
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v16;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors paceColors](ARUIMetricColors, "paceColors"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nonGradientTextColor"));
    -[UISegmentedControl setTintColor:](self->_segmentedControl, "setTintColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
    objc_msgSend(v20, "addSubview:", self->_segmentedControl);

    -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, "_segmentedControlValueDidChange:", 4096);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v24 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, sub_10005F11C());
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -sub_10005F11C());
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 14.0));

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 28.0));

    -[CHWorkoutDetailPaceTableViewCell setSegControlToBaselineConstraint:](self, "setSegControlToBaselineConstraint:", v37);
    v42[0] = v25;
    v42[1] = v30;
    v42[2] = v34;
    v42[3] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

  }
}

- (void)_createSeparator
{
  UIView *v3;
  UIView *separatorView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  _QWORD v29[4];

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v5);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_separatorView);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell separatorView](self, "separatorView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 1.0 / v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell separatorView](self, "separatorView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, sub_10005F11C());
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell separatorView](self, "separatorView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell separatorView](self, "separatorView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  v29[0] = v11;
  v29[1] = v17;
  v29[2] = v22;
  v29[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutConfiguration"));
    v12 = objc_msgSend(v11, "activityType");

    v13 = v9;
  }
  else
  {
    v12 = objc_msgSend(v8, "workoutActivityType");
    v13 = v8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fiui_activityType"));
  if (v12 == (id)46)
  {
    objc_initWeak(&location, self);
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_100051860;
    v38 = &unk_100777CA8;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v10, "swimmingSplitsForWorkout:workoutActivity:completion:", v8, v9, &v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v35, v36, v37, v38));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SWIM_PACE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v17, "setText:", v16);

    -[CHWorkoutDetailPaceTableViewCell _createSegmentedControl](self, "_createSegmentedControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segControlToBaselineConstraint](self, "segControlToBaselineConstraint"));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segmentedControl](self, "segmentedControl"));
    objc_msgSend(v19, "setHidden:", 0);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell formattingManager](self, "formattingManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "formattedPaceOrSpeedForWorkout:workoutActivity:context:", v8, v9, CFSTR("WorkoutDetailDisplayContext")));

    v23 = FIUIPaceFormatForWorkoutActivityType(v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = v24;
    if (v23 == 4)
      v26 = CFSTR("WORKOUT_SPEED_TITLE");
    else
      v26 = CFSTR("WORKOUT_PACE_TITLE");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1007AE1D0, CFSTR("Localizable")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v28, "setText:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell valueLabel](self, "valueLabel"));
    objc_msgSend(v29, "setAttributedText:", v22);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segControlToBaselineConstraint](self, "segControlToBaselineConstraint"));
    objc_msgSend(v30, "setActive:", 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segmentedControl](self, "segmentedControl"));
    objc_msgSend(v31, "setHidden:", 1);

  }
  objc_msgSend((id)objc_opt_class(self, v20), "preferredHeightForWorkout:", v8);
  v33 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell heightConstraint](self, "heightConstraint"));
  objc_msgSend(v34, "setConstant:", v33);

}

- (void)setSelectedPaceFormat:(int64_t)a3
{
  id v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *i;
  void *v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  self->_selectedPaceFormat = a3;
  v5 = objc_msgSend((id)objc_opt_class(self, a2), "_paceFormats");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = &FIUIDistanceTypeForActivityType_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = objc_msgSend(v6, "indexOfObject:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segmentedControl](self, "segmentedControl"));
  v11 = objc_msgSend(v10, "selectedSegmentIndex");

  if (v11 != v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell segmentedControl](self, "segmentedControl"));
    objc_msgSend(v12, "setSelectedSegmentIndex:", v9);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell splitsDictionary](self, "splitsDictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  if (objc_msgSend(v15, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v39;
      v21 = 0.0;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v23, "durationScaledToFillSplit");
          v21 = v21 + v24;
          v19 += (uint64_t)objc_msgSend(v23, "strokeCountScaledToFillSplit");
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
      v25 = (double)v19;
      v7 = &FIUIDistanceTypeForActivityType_ptr;
    }
    else
    {
      v25 = 0.0;
      v21 = 0.0;
    }

    v26 = llround(v25 / (double)(unint64_t)objc_msgSend(v16, "count"));
    v27 = v21 / (double)(unint64_t)objc_msgSend(v16, "count");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell formattingManager](self, "formattingManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fitnessUIFormattingManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringWithDuration:durationFormat:", 1, v27));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[369], "numberWithInteger:", v26));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v31, 1));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SWIM_PACE_STROKECOUNT_FORMAT"), &stru_1007AE1D0, CFSTR("Localizable")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v30, v32, (_QWORD)v38));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell valueLabel](self, "valueLabel"));
    objc_msgSend(v36, "setText:", v35);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailPaceTableViewCell paceSelectionDelegate](self, "paceSelectionDelegate"));
  objc_msgSend(v37, "paceCell:didSelectNewPaceFormat:", self, a3);

}

- (void)_segmentedControlValueDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "_paceFormats");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "selectedSegmentIndex");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8));
  v10 = objc_msgSend(v9, "integerValue");

  -[CHWorkoutDetailPaceTableViewCell setSelectedPaceFormat:](self, "setSelectedPaceFormat:", v10);
}

- (CHWorkoutDetailPaceSelectionDelegate)paceSelectionDelegate
{
  return (CHWorkoutDetailPaceSelectionDelegate *)objc_loadWeakRetained((id *)&self->_paceSelectionDelegate);
}

- (void)setPaceSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paceSelectionDelegate, a3);
}

- (int64_t)selectedPaceFormat
{
  return self->_selectedPaceFormat;
}

- (CHWorkoutFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (NSDictionary)splitsDictionary
{
  return self->_splitsDictionary;
}

- (void)setSplitsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_splitsDictionary, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)segControlToBaselineConstraint
{
  return self->_segControlToBaselineConstraint;
}

- (void)setSegControlToBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_segControlToBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segControlToBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_splitsDictionary, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_destroyWeak((id *)&self->_paceSelectionDelegate);
}

@end
