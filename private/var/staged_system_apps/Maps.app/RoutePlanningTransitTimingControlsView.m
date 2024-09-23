@implementation RoutePlanningTransitTimingControlsView

- (RoutePlanningTransitTimingControlsView)initWithFrame:(CGRect)a3
{
  RoutePlanningTransitTimingControlsView *v3;
  RoutePlanningTransitTimingControlsView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  UISegmentedControl *v12;
  UISegmentedControl *timingTypeControl;
  id v14;
  double y;
  double width;
  double height;
  UIView *v18;
  UIView *planningControlsView;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MapsRadioButton *leaveAtButton;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MapsRadioButton *arriveByButton;
  void *v33;
  uint64_t v34;
  UIStackView *leaveAtStackView;
  void *v36;
  uint64_t v37;
  UIStackView *arriveByStackView;
  void *v39;
  uint64_t v40;
  UIStackView *radioButtonStackView;
  UIDatePicker *v42;
  UIDatePicker *datePicker;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  UIDatePicker *v50;
  UIDatePicker *timePicker;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  UIStackView *datePickerStackView;
  void *v61;
  uint64_t v62;
  UIStackView *timePickerStackView;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];

  v69.receiver = self;
  v69.super_class = (Class)RoutePlanningTransitTimingControlsView;
  v3 = -[RoutePlanningTransitTimingControlsView initWithFrame:](&v69, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RoutePlanningTransitTimingControlsView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave Now [Route Planning, Transit, Catalyst"), CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Plan [Route Planning, Transit, Catalyst"), CFSTR("localized string not found"), 0));

    v10 = objc_alloc((Class)UISegmentedControl);
    v75[0] = v68;
    v75[1] = v67;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
    v12 = (UISegmentedControl *)objc_msgSend(v10, "initWithItems:", v11);
    timingTypeControl = v4->_timingTypeControl;
    v4->_timingTypeControl = v12;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v4->_timingTypeControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UISegmentedControl setSelectedSegmentIndex:](v4->_timingTypeControl, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl addTarget:action:forControlEvents:](v4->_timingTypeControl, "addTarget:action:forControlEvents:", v4, "_planningTypeDidChange:", 4096);
    -[UISegmentedControl setAccessibilityIdentifier:](v4->_timingTypeControl, "setAccessibilityIdentifier:", CFSTR("TimingTypeSegmentedControl"));
    -[RoutePlanningTransitTimingControlsView addSubview:](v4, "addSubview:", v4->_timingTypeControl);
    v14 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v18 = (UIView *)objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    planningControlsView = v4->_planningControlsView;
    v4->_planningControlsView = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_planningControlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](v4->_planningControlsView, "setAlpha:", 0.0);
    -[UIView setAccessibilityIdentifier:](v4->_planningControlsView, "setAccessibilityIdentifier:", CFSTR("PlanningControls"));
    -[RoutePlanningTransitTimingControlsView addSubview:](v4, "addSubview:", v4->_planningControlsView);
    v20 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Leave [Route Planning, Transit, Catalyst, Radio Button]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v20, "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v24 = v20;
    objc_msgSend(v20, "setFont:", v23);

    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("LeaveAtLabel"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v25 = objc_claimAutoreleasedReturnValue(+[MapsRadioButton buttonWithGroupIdentifier:](MapsRadioButton, "buttonWithGroupIdentifier:", v66));
    leaveAtButton = v4->_leaveAtButton;
    v4->_leaveAtButton = (MapsRadioButton *)v25;

    -[MapsRadioButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_leaveAtButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsRadioButton setSelected:](v4->_leaveAtButton, "setSelected:", 1);
    -[MapsRadioButton setControlSize:](v4->_leaveAtButton, "setControlSize:", 1);
    -[MapsRadioButton setAccessibilityIdentifier:](v4->_leaveAtButton, "setAccessibilityIdentifier:", CFSTR("LeaveAtButton"));
    -[MapsRadioButton setAssociatedLabel:](v4->_leaveAtButton, "setAssociatedLabel:", v20);
    -[MapsRadioButton addTarget:action:forControlEvents:](v4->_leaveAtButton, "addTarget:action:forControlEvents:", v4, "_toggleChanged:", 4096);
    v27 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Arrive [Route Planning, Transit, Catalyst, Radio Button]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v27, "setText:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));
    objc_msgSend(v27, "setFont:", v30);

    objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("ArriveByLabel"));
    v31 = objc_claimAutoreleasedReturnValue(+[MapsRadioButton buttonWithGroupIdentifier:](MapsRadioButton, "buttonWithGroupIdentifier:", v66));
    arriveByButton = v4->_arriveByButton;
    v4->_arriveByButton = (MapsRadioButton *)v31;

    -[MapsRadioButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_arriveByButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsRadioButton setControlSize:](v4->_arriveByButton, "setControlSize:", 1);
    -[MapsRadioButton setAccessibilityIdentifier:](v4->_arriveByButton, "setAccessibilityIdentifier:", CFSTR("ArriveByButton"));
    v65 = v27;
    -[MapsRadioButton setAssociatedLabel:](v4->_arriveByButton, "setAssociatedLabel:", v27);
    -[MapsRadioButton addTarget:action:forControlEvents:](v4->_arriveByButton, "addTarget:action:forControlEvents:", v4, "_toggleChanged:", 4096);
    v74[0] = v4->_leaveAtButton;
    v74[1] = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2));
    v34 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView _horizontalStackViewWithViews:spacing:](v4, "_horizontalStackViewWithViews:spacing:", v33, 5.0));
    leaveAtStackView = v4->_leaveAtStackView;
    v4->_leaveAtStackView = (UIStackView *)v34;

    -[UIStackView setAccessibilityIdentifier:](v4->_leaveAtStackView, "setAccessibilityIdentifier:", CFSTR("LeaveAtStackView"));
    v73[0] = v4->_arriveByButton;
    v73[1] = v27;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 2));
    v37 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView _horizontalStackViewWithViews:spacing:](v4, "_horizontalStackViewWithViews:spacing:", v36, 5.0));
    arriveByStackView = v4->_arriveByStackView;
    v4->_arriveByStackView = (UIStackView *)v37;

    -[UIStackView setAccessibilityIdentifier:](v4->_arriveByStackView, "setAccessibilityIdentifier:", CFSTR("ArriveByStackView"));
    v72[0] = v4->_leaveAtStackView;
    v72[1] = v4->_arriveByStackView;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 2));
    v40 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView _horizontalStackViewWithViews:spacing:](v4, "_horizontalStackViewWithViews:spacing:", v39, 20.0));
    radioButtonStackView = v4->_radioButtonStackView;
    v4->_radioButtonStackView = (UIStackView *)v40;

    -[UIStackView setAccessibilityIdentifier:](v4->_radioButtonStackView, "setAccessibilityIdentifier:", CFSTR("RadioButtonStackView"));
    -[UIView addSubview:](v4->_planningControlsView, "addSubview:", v4->_radioButtonStackView);
    v42 = (UIDatePicker *)objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    datePicker = v4->_datePicker;
    v4->_datePicker = v42;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v4->_datePicker, "setDatePickerMode:", 1);
    -[UIDatePicker setAccessibilityIdentifier:](v4->_datePicker, "setAccessibilityIdentifier:", CFSTR("DatePicker"));
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, "_selectedDateDidChange", 4096);
    v44 = objc_alloc((Class)UIImageView);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 16.0));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("calendar"), v45));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "imageWithRenderingMode:", 2));
    v48 = objc_msgSend(v44, "initWithImage:", v47);

    objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v48, "setTintColor:", v49);

    objc_msgSend(v48, "setAccessibilityIdentifier:", CFSTR("DateImageView"));
    v50 = (UIDatePicker *)objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    timePicker = v4->_timePicker;
    v4->_timePicker = v50;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_timePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v4->_timePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setAccessibilityIdentifier:](v4->_timePicker, "setAccessibilityIdentifier:", CFSTR("TimePicker"));
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_timePicker, "addTarget:action:forControlEvents:", v4, "_selectedDateDidChange", 4096);
    v52 = objc_alloc((Class)UIImageView);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 16.0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("clock"), v53));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "imageWithRenderingMode:", 2));
    v56 = objc_msgSend(v52, "initWithImage:", v55);

    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v56, "setTintColor:", v57);

    objc_msgSend(v56, "setAccessibilityIdentifier:", CFSTR("TimeImageView"));
    v71[0] = v48;
    v71[1] = v4->_datePicker;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
    v59 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView _horizontalStackViewWithViews:spacing:](v4, "_horizontalStackViewWithViews:spacing:", v58, 4.0));
    datePickerStackView = v4->_datePickerStackView;
    v4->_datePickerStackView = (UIStackView *)v59;

    v70[0] = v56;
    v70[1] = v4->_timePicker;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 2));
    v62 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView _horizontalStackViewWithViews:spacing:](v4, "_horizontalStackViewWithViews:spacing:", v61, 4.0));
    timePickerStackView = v4->_timePickerStackView;
    v4->_timePickerStackView = (UIStackView *)v62;

    -[UIView addSubview:](v4->_planningControlsView, "addSubview:", v4->_datePickerStackView);
    -[UIView addSubview:](v4->_planningControlsView, "addSubview:", v4->_timePickerStackView);
    v4->_showSchedulingButtons = 1;
    -[RoutePlanningTransitTimingControlsView sendSubviewToBack:](v4, "sendSubviewToBack:", v4->_planningControlsView);
    -[RoutePlanningTransitTimingControlsView _setupInitialConstraints](v4, "_setupInitialConstraints");
    -[RoutePlanningTransitTimingControlsView reset](v4, "reset");

  }
  return v4;
}

- (id)_horizontalStackViewWithViews:(id)a3 spacing:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setSpacing:", a4);
  objc_msgSend(v6, "setAxis:", 0);
  objc_msgSend(v6, "setDistribution:", 0);
  objc_msgSend(v6, "setAlignment:", 3);
  return v6;
}

- (void)_setupInitialConstraints
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
  NSLayoutConstraint *v14;
  NSLayoutConstraint *planningControlsHidingConstraint;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *planningControlsShowingConstraint;
  uint64_t v20;
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
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[16];

  v61 = objc_alloc_init((Class)NSMutableArray);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl topAnchor](self->_timingTypeControl, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView topAnchor](self, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v62[0] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl leadingAnchor](self->_timingTypeControl, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView leadingAnchor](self, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v62[1] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView trailingAnchor](self, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl trailingAnchor](self->_timingTypeControl, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v62[2] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_planningControlsView, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_timingTypeControl, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 12.0));
  v62[3] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_planningControlsView, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView leadingAnchor](self, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v62[4] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView trailingAnchor](self, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_planningControlsView, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v62[5] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadioButton heightAnchor](self->_leaveAtButton, "heightAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadioButton heightAnchor](self->_arriveByButton, "heightAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v62[6] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_radioButtonStackView, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_planningControlsView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v62[7] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_radioButtonStackView, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_planningControlsView, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v62[8] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_planningControlsView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_radioButtonStackView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v32));
  v62[9] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_datePickerStackView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_radioButtonStackView, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 12.0));
  v62[10] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_datePickerStackView, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_planningControlsView, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v62[11] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_timePickerStackView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_datePickerStackView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v62[12] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_timePickerStackView, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_datePickerStackView, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v3, 14.0));
  v62[13] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_planningControlsView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_timePickerStackView, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:", v6));
  v62[14] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_planningControlsView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_datePickerStackView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v62[15] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 16));
  objc_msgSend(v61, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_timingTypeControl, "bottomAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  planningControlsHidingConstraint = self->_planningControlsHidingConstraint;
  self->_planningControlsHidingConstraint = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_planningControlsView, "bottomAnchor"));
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  planningControlsShowingConstraint = self->_planningControlsShowingConstraint;
  self->_planningControlsShowingConstraint = v18;

  if (self->_showPlanningControls)
    v20 = 40;
  else
    v20 = 32;
  objc_msgSend(v61, "addObject:", *(Class *)((char *)&self->super.super.super.isa + v20));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v61);

}

- (void)reset
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", 0, 0, 0));
  -[RoutePlanningTransitTimingControlsView setSelectedTiming:](self, "setSelectedTiming:", v3);

}

- (void)setSelectedTiming:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  RoutePlanningTransitTimingControlsView *v10;
  int v11;
  int v12;

  v5 = a3;
  v6 = self->_selectedTiming;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedTiming, a3);
      if (v7)
      {
        objc_msgSend((id)v7, "timepoint");
        -[MapsRadioButton setSelected:](self->_leaveAtButton, "setSelected:", v12 == 0);
        objc_msgSend((id)v7, "timepoint");
        -[MapsRadioButton setSelected:](self->_arriveByButton, "setSelected:", v11 == 1);
        -[RoutePlanningTransitTimingControlsView _setDatePickerDate](self, "_setDatePickerDate");
        -[RoutePlanningTransitTimingControlsView _setDatePickerBoundaries](self, "_setDatePickerBoundaries");
        -[UISegmentedControl setSelectedSegmentIndex:](self->_timingTypeControl, "setSelectedSegmentIndex:", objc_msgSend((id)v7, "isDepartNow") ^ 1);
        v9 = objc_msgSend((id)v7, "isDepartNow") ^ 1;
        v10 = self;
      }
      else
      {
        -[MapsRadioButton setSelected:](self->_leaveAtButton, "setSelected:", 1);
        -[RoutePlanningTransitTimingControlsView _setDatePickerDate](self, "_setDatePickerDate");
        -[RoutePlanningTransitTimingControlsView _setDatePickerBoundaries](self, "_setDatePickerBoundaries");
        -[UISegmentedControl setSelectedSegmentIndex:](self->_timingTypeControl, "setSelectedSegmentIndex:", 0);
        v10 = self;
        v9 = 0;
      }
      -[RoutePlanningTransitTimingControlsView setShowPlanningControls:](v10, "setShowPlanningControls:", v9);
    }
  }

}

- (void)_notifyDidUpdateTiming
{
  id v3;
  NSObject *v4;
  RoutePlanningTiming *selectedTiming;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  int v8;
  RoutePlanningTiming *v9;

  v3 = sub_10043214C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    selectedTiming = self->_selectedTiming;
    v8 = 138412290;
    v9 = selectedTiming;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Notify selected timing is %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView changeHandler](self, "changeHandler"));
  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView changeHandler](self, "changeHandler"));
    ((void (**)(_QWORD, RoutePlanningTiming *))v7)[2](v7, self->_selectedTiming);

  }
}

- (void)setShowPlanningControls:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  if (self->_showPlanningControls != a3)
  {
    v3 = a3;
    self->_showPlanningControls = a3;
    -[UIView setAlpha:](self->_planningControlsView, "setAlpha:", (double)a3);
    -[NSLayoutConstraint setActive:](self->_planningControlsShowingConstraint, "setActive:", v3);
    -[NSLayoutConstraint setActive:](self->_planningControlsHidingConstraint, "setActive:", v3 ^ 1);
    -[RoutePlanningTransitTimingControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView layoutHandler](self, "layoutHandler"));

    if (v5)
    {
      v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView layoutHandler](self, "layoutHandler"));
      v6[2](v6, v3);

    }
  }
}

- (void)setShowSchedulingButtons:(BOOL)a3
{
  self->_showSchedulingButtons = a3;
  -[UIStackView setHidden:](self->_radioButtonStackView, "setHidden:", !a3);
}

- (void)_planningTypeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RoutePlanningTiming *v8;
  RoutePlanningTiming *selectedTiming;
  void *v10;
  void *v11;
  RoutePlanningTiming *v12;
  RoutePlanningTiming *v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "selectedSegmentIndex"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker date](self->_datePicker, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self->_selectedTiming, "departureTimeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self->_selectedTiming, "arrivalTimeZone"));
    v8 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", v5, v6, v7));
    selectedTiming = self->_selectedTiming;
    self->_selectedTiming = v8;

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self->_selectedTiming, "departureTimeZone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self->_selectedTiming, "arrivalTimeZone"));
    v12 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", 0, v10, v11));
    v13 = self->_selectedTiming;
    self->_selectedTiming = v12;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 3030, 631, 0);
  }

  -[MapsRadioButton setSelected:](self->_leaveAtButton, "setSelected:", 1);
  -[RoutePlanningTransitTimingControlsView _setDatePickerDate](self, "_setDatePickerDate");
  -[RoutePlanningTransitTimingControlsView _setDatePickerBoundaries](self, "_setDatePickerBoundaries");
  v14 = objc_msgSend(v4, "selectedSegmentIndex");

  -[RoutePlanningTransitTimingControlsView setShowPlanningControls:](self, "setShowPlanningControls:", v14 != 0);
  -[RoutePlanningTransitTimingControlsView _notifyDidUpdateTiming](self, "_notifyDidUpdateTiming");
}

- (void)_toggleChanged:(id)a3
{
  MapsRadioButton *v4;
  MapsRadioButton *leaveAtButton;
  uint64_t v6;
  void *v7;

  v4 = (MapsRadioButton *)a3;
  -[RoutePlanningTransitTimingControlsView _setDatePickerBoundaries](self, "_setDatePickerBoundaries");
  -[RoutePlanningTransitTimingControlsView _computeSelectedTiming](self, "_computeSelectedTiming");
  -[RoutePlanningTransitTimingControlsView _setDatePickerDate](self, "_setDatePickerDate");
  leaveAtButton = self->_leaveAtButton;

  if (leaveAtButton == v4)
    v6 = 3028;
  else
    v6 = 3029;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", v6, 631, 0);

  -[RoutePlanningTransitTimingControlsView _notifyDidUpdateTiming](self, "_notifyDidUpdateTiming");
}

- (void)_computeSelectedTiming
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  RoutePlanningTiming *v15;
  RoutePlanningTiming *selectedTiming;
  int v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker date](self->_datePicker, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker date](self->_timePicker, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 96, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v7, v8, 0));

  v10 = sub_10043214C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Computed date is %@", (uint8_t *)&v17, 0xCu);
  }

  v12 = -[MapsRadioButton isSelected](self->_leaveAtButton, "isSelected");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self->_selectedTiming, "departureTimeZone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self->_selectedTiming, "arrivalTimeZone"));
  if (v12)
    v15 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", v9, v13, v14));
  else
    v15 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithArrivalDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithArrivalDate:departureTimeZone:arrivalTimeZone:", v9, v13, v14));
  selectedTiming = self->_selectedTiming;
  self->_selectedTiming = v15;

}

- (void)_selectedDateDidChange
{
  void *v3;

  -[RoutePlanningTransitTimingControlsView _computeSelectedTiming](self, "_computeSelectedTiming");
  if (sub_1002A8AA0(self) == 5)
    -[RoutePlanningTransitTimingControlsView _setDatePickerDate](self, "_setDatePickerDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 3031, 631, 0);

  -[RoutePlanningTransitTimingControlsView _notifyDidUpdateTiming](self, "_notifyDidUpdateTiming");
}

- (void)_setDatePickerDate
{
  unsigned int v3;
  UIDatePicker *timePicker;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSDate *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _BYTE v21[128];

  v3 = -[MapsRadioButton isSelected](self->_leaveAtButton, "isSelected");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  timePicker = self->_timePicker;
  v20[0] = self->_datePicker;
  v20[1] = timePicker;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2, 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView selectedTiming](self, "selectedTiming"));
        v12 = v11;
        if (v3)
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departureDate"));
        else
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrivalDate"));
        v14 = (void *)v13;
        if (v13)
        {
          objc_msgSend(v10, "setDate:", v13);
        }
        else
        {
          v15 = objc_opt_new(NSDate);
          objc_msgSend(v10, "setDate:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

}

- (void)_setDatePickerBoundaries
{
  unsigned int v3;
  UIDatePicker *timePicker;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];

  v3 = -[MapsRadioButton isSelected](self->_leaveAtButton, "isSelected");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  timePicker = self->_timePicker;
  v23[0] = self->_datePicker;
  v23[1] = timePicker;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitTimingControlsView selectedTiming](self, "selectedTiming"));
        v11 = v10;
        if (v3)
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "departureTimeZone"));
        else
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrivalTimeZone"));
        v13 = v12;
        if (v12)
          v14 = v12;
        else
          v14 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
        v15 = v14;

        objc_msgSend(v9, "setTimeZone:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_minimumDateForRoutePlanningWithTimeZone:](NSDate, "_maps_minimumDateForRoutePlanningWithTimeZone:", v15));
        objc_msgSend(v9, "setMinimumDate:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_maximumDateForRoutePlanning](NSDate, "_maps_maximumDateForRoutePlanning"));
        objc_msgSend(v9, "setMaximumDate:", v17);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

}

- (RoutePlanningTiming)selectedTiming
{
  return self->_selectedTiming;
}

- (BOOL)showsSchedulingButtons
{
  return self->_showSchedulingButtons;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)layoutHandler
{
  return self->_layoutHandler;
}

- (void)setLayoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutHandler, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_selectedTiming, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_timePickerStackView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_datePickerStackView, 0);
  objc_storeStrong((id *)&self->_arriveByButton, 0);
  objc_storeStrong((id *)&self->_arriveByStackView, 0);
  objc_storeStrong((id *)&self->_leaveAtButton, 0);
  objc_storeStrong((id *)&self->_leaveAtStackView, 0);
  objc_storeStrong((id *)&self->_radioButtonStackView, 0);
  objc_storeStrong((id *)&self->_planningControlsShowingConstraint, 0);
  objc_storeStrong((id *)&self->_planningControlsHidingConstraint, 0);
  objc_storeStrong((id *)&self->_planningControlsView, 0);
  objc_storeStrong((id *)&self->_timingTypeControl, 0);
}

@end
