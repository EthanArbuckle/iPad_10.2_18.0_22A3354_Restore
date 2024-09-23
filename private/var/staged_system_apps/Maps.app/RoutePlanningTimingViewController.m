@implementation RoutePlanningTimingViewController

- (RoutePlanningTimingViewController)initWithCurrentTiming:(id)a3 shouldShowArriveBy:(BOOL)a4 pickerDelegate:(id)a5
{
  id v8;
  id v9;
  RoutePlanningTimingViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSTimeZone *originTimeZone;
  uint64_t v16;
  NSTimeZone *destinationTimeZone;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RoutePlanningTimingViewController;
  v10 = -[RoutePlanningTimingViewController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", 0, 0);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalDate"));
    v12 = v11;
    if (!v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departureDate"));
    objc_storeStrong((id *)&v10->_originalDate, v12);
    if (!v11)

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalDate"));
    v10->_isLeaveAt = v13 == 0;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departureTimeZone"));
    originTimeZone = v10->_originTimeZone;
    v10->_originTimeZone = (NSTimeZone *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalTimeZone"));
    destinationTimeZone = v10->_destinationTimeZone;
    v10->_destinationTimeZone = (NSTimeZone *)v16;

    v10->_showArriveBy = a4;
    objc_storeWeak((id *)&v10->_pickerDelegate, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v18, "setPresentedModally:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v19, "setTakesAvailableHeight:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v10, "_keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

  }
  return v10;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  NSMutableArray *v3;
  ModalCardHeaderView *v4;
  void *v5;
  ModalCardHeaderView *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIScrollView *v36;
  UIScrollView *scrollView;
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
  UISegmentedControl *v59;
  UISegmentedControl *segmentControl;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  UIDatePicker *v73;
  UIDatePicker *datePicker;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSLayoutConstraint *v80;
  NSLayoutConstraint *datePickerWidthConstraint;
  void *v82;
  void *v83;
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
  UIButton *v94;
  UIButton *leaveNowButton;
  void *v96;
  UIButton *v97;
  void *v98;
  void *v99;
  UIButton *v100;
  void *v101;
  UIButton *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  NSArray *v122;
  NSArray *constraintsShowingArriveBy;
  NSArray *v124;
  NSArray *constraintsHidingArriveBy;
  uint64_t v126;
  void *v127;
  NSMutableArray *v128;
  NSMutableArray *v129;
  objc_super v130;
  _QWORD v131[2];

  v130.receiver = self;
  v130.super_class = (Class)RoutePlanningTimingViewController;
  -[ContaineeViewController viewDidLoad](&v130, "viewDidLoad");
  v3 = objc_opt_new(NSMutableArray);
  v129 = objc_opt_new(NSMutableArray);
  v128 = objc_opt_new(NSMutableArray);
  v4 = [ModalCardHeaderView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration routePlanningTimingPickerConfiguration](ModalCardHeaderConfiguration, "routePlanningTimingPickerConfiguration"));
  v6 = -[ModalCardHeaderView initWithConfiguration:](v4, "initWithConfiguration:", v5);

  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ModalCardHeaderView setUseAdaptiveFont:](v6, "setUseAdaptiveFont:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v6, "leadingButton"));
  v8 = sub_1009A98D8();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v6, "leadingButton"));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "handleDismissAction:", 64);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][Timing] Date & Time")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView titleLabel](v6, "titleLabel"));
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView titleLabel](v6, "titleLabel"));
  objc_msgSend(v14, "setTextAlignment:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v6, "trailingButton"));
  v16 = sub_1009A99D4();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v15, "setTitle:forState:", v17, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v6, "trailingButton"));
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "_pressedDone", 64);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v19, "addSubview:", v6);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v6, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v6, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  -[NSMutableArray addObject:](v3, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v6, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  -[NSMutableArray addObject:](v3, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v6, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  -[NSMutableArray addObject:](v3, "addObject:", v35);

  v36 = objc_opt_new(UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v36;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v38, "addSubview:", self->_scrollView);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v3, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v45));
  -[NSMutableArray addObject:](v3, "addObject:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));
  -[NSMutableArray addObject:](v3, "addObject:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
  -[NSMutableArray addObject:](v3, "addObject:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][TimingPicker] Leave at"), CFSTR("localized string not found"), 0));
  v131[0] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][TimingPicker] Arrive by"), CFSTR("localized string not found"), 0));
  v131[1] = v58;
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 2));

  v59 = (UISegmentedControl *)objc_msgSend(objc_alloc((Class)UISegmentedControl), "initWithItems:", v127);
  segmentControl = self->_segmentControl;
  self->_segmentControl = v59;

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RoutePlanningTimingViewController _updateSegmentControl](self, "_updateSegmentControl");
  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentControl, "addTarget:action:forControlEvents:", self, "_pressedSegmentControl", 4096);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_segmentControl);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl leadingAnchor](self->_segmentControl, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl trailingAnchor](self->_segmentControl, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl topAnchor](self->_segmentControl, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, 16.0));
  -[NSMutableArray addObject:](v129, "addObject:", v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_segmentControl, "bottomAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, 0.0));
  -[NSMutableArray addObject:](v128, "addObject:", v72);

  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentControl, "setSelectedSegmentIndex:", !self->_isLeaveAt);
  v73 = objc_opt_new(UIDatePicker);
  datePicker = self->_datePicker;
  self->_datePicker = v73;

  -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](self->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, "_selectedDate", 4096);
  -[UIDatePicker setRoundsToMinuteInterval:](self->_datePicker, "setRoundsToMinuteInterval:", 0);
  -[UIDatePicker setMinuteInterval:](self->_datePicker, "setMinuteInterval:", 1);
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", self->_originalDate);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_maximumDateForRoutePlanning](NSDate, "_maps_maximumDateForRoutePlanning"));
  -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", v75);

  -[UIDatePicker _setContinuousCornerRadius:](self->_datePicker, "_setContinuousCornerRadius:", 10.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker layer](self->_datePicker, "layer"));
  objc_msgSend(v76, "setMasksToBounds:", 1);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_datePicker);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker widthAnchor](self->_datePicker, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController view](self, "view"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "widthAnchor"));
  v80 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, -32.0));
  datePickerWidthConstraint = self->_datePickerWidthConstraint;
  self->_datePickerWidthConstraint = v80;

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker leadingAnchor](self->_datePicker, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker trailingAnchor](self->_datePicker, "trailingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:constant:", v86, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker topAnchor](self->_datePicker, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_segmentControl, "bottomAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, 16.0));
  -[NSMutableArray addObject:](v129, "addObject:", v90);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker topAnchor](self->_datePicker, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92, 16.0));
  -[NSMutableArray addObject:](v128, "addObject:", v93);

  v94 = objc_opt_new(UIButton);
  leaveNowButton = self->_leaveNowButton;
  self->_leaveNowButton = v94;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_leaveNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_leaveNowButton, "addTarget:action:forControlEvents:", self, "_pressedLeaveNow", 64);
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  -[UIButton setBackgroundColor:](self->_leaveNowButton, "setBackgroundColor:", v96);

  -[UIButton _setContinuousCornerRadius:](self->_leaveNowButton, "_setContinuousCornerRadius:", 10.0);
  -[UIButton setContentHorizontalAlignment:](self->_leaveNowButton, "setContentHorizontalAlignment:", 4);
  -[UIButton setTitleEdgeInsets:](self->_leaveNowButton, "setTitleEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  v97 = self->_leaveNowButton;
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning][Timing] Leave Now"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v97, "setTitle:forState:", v99, 0);

  v100 = self->_leaveNowButton;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTitleColor:forState:](v100, "setTitleColor:forState:", v101, 0);

  v102 = self->_leaveNowButton;
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
  -[UIButton setTitleColor:forState:](v102, "setTitleColor:forState:", v103, 2);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_leaveNowButton);
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_leaveNowButton, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v105, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v106);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_leaveNowButton, "trailingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v108, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v109);

  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_leaveNowButton, "topAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker bottomAnchor](self->_datePicker, "bottomAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v112);

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_leaveNowButton, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v115);

  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_leaveNowButton, "widthAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController view](self, "view"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "widthAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:constant:", v118, -32.0));
  -[NSMutableArray addObject:](v3, "addObject:", v119);

  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_leaveNowButton, "heightAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintGreaterThanOrEqualToConstant:", 50.0));
  -[NSMutableArray addObject:](v3, "addObject:", v121);

  v122 = (NSArray *)-[NSMutableArray copy](v129, "copy");
  constraintsShowingArriveBy = self->_constraintsShowingArriveBy;
  self->_constraintsShowingArriveBy = v122;

  v124 = (NSArray *)-[NSMutableArray copy](v128, "copy");
  constraintsHidingArriveBy = self->_constraintsHidingArriveBy;
  self->_constraintsHidingArriveBy = v124;

  -[UISegmentedControl setHidden:](self->_segmentControl, "setHidden:", !self->_showArriveBy);
  if (self->_showArriveBy)
    v126 = 168;
  else
    v126 = 176;
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.isa + v126));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
  -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
  -[RoutePlanningTimingViewController setLeavingNow:](self, "setLeavingNow:", self->_originalDate == 0);

}

- (void)setShowArriveBy:(BOOL)a3
{
  -[RoutePlanningTimingViewController setShowArriveBy:animated:](self, "setShowArriveBy:animated:", a3, 0);
}

- (void)setShowArriveBy:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (self->_showArriveBy != a3)
  {
    v4 = a4;
    self->_showArriveBy = a3;
    if (!a3 && !self->_isLeaveAt)
    {
      self->_isLeaveAt = 1;
      -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C0A020;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    v6 = objc_retainBlock(v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C0A0B0;
    v10[3] = &unk_1011AE8F8;
    v10[4] = self;
    v7 = objc_retainBlock(v10);
    if (v4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100C0A0DC;
      v8[3] = &unk_1011ACAD0;
      v8[4] = self;
      v9 = v6;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v7, UINavigationControllerHideShowBarDuration);

    }
    else
    {
      ((void (*)(_QWORD *))v6[2])(v6);
      ((void (*)(_QWORD *, uint64_t))v7[2])(v7, 1);
    }

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningTimingViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
  -[RoutePlanningTimingViewController _updateSegmentControl](self, "_updateSegmentControl");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningTimingViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[UIDatePicker setMinuteInterval:](self->_datePicker, "setMinuteInterval:", 5);
}

- (void)_updateDatePicker
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = -[RoutePlanningTimingViewController _shouldShowCompact](self, "_shouldShowCompact");
  if (v3)
    v4 = 2;
  else
    v4 = 3;
  -[UIDatePicker setPreferredDatePickerStyle:](self->_datePicker, "setPreferredDatePickerStyle:", v4);
  if (v3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  v6 = (void *)v5;
  -[UIDatePicker setBackgroundColor:](self->_datePicker, "setBackgroundColor:", v5);

  -[NSLayoutConstraint setActive:](self->_datePickerWidthConstraint, "setActive:", v3 ^ 1);
  if (self->_isLeaveAt)
    v7 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController originTimeZone](self, "originTimeZone"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController destinationTimeZone](self, "destinationTimeZone"));
  v9 = (id)v7;
  -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_minimumDateForRoutePlanningWithTimeZone:](NSDate, "_maps_minimumDateForRoutePlanningWithTimeZone:", v9));
  -[UIDatePicker setMinimumDate:](self->_datePicker, "setMinimumDate:", v8);

}

- (void)_updateSegmentControl
{
  void *v3;
  void *v4;
  void *v5;
  UISegmentedControl *segmentControl;
  void *v7;
  NSAttributedStringKey v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v4));

  segmentControl = self->_segmentControl;
  v8 = NSFontAttributeName;
  v9 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  -[UISegmentedControl setTitleTextAttributes:forState:](segmentControl, "setTitleTextAttributes:forState:", v7, 0);

}

- (void)setLeavingNow:(BOOL)a3
{
  if (self->_leavingNow != a3)
  {
    self->_leavingNow = a3;
    -[UIButton setEnabled:](self->_leaveNowButton, "setEnabled:", !a3);
  }
}

- (NSTimeZone)originTimeZone
{
  NSTimeZone *originTimeZone;
  NSTimeZone *v4;
  NSTimeZone *v5;

  originTimeZone = self->_originTimeZone;
  if (!originTimeZone)
  {
    v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v5 = self->_originTimeZone;
    self->_originTimeZone = v4;

    originTimeZone = self->_originTimeZone;
  }
  return originTimeZone;
}

- (void)setOriginTimeZone:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_originTimeZone;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_originTimeZone, a3);
      -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
      v7 = (unint64_t)v9;
    }
  }

}

- (NSTimeZone)destinationTimeZone
{
  NSTimeZone *destinationTimeZone;
  NSTimeZone *v4;
  NSTimeZone *v5;

  destinationTimeZone = self->_destinationTimeZone;
  if (!destinationTimeZone)
  {
    v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v5 = self->_destinationTimeZone;
    self->_destinationTimeZone = v4;

    destinationTimeZone = self->_destinationTimeZone;
  }
  return destinationTimeZone;
}

- (void)setDestinationTimeZone:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_destinationTimeZone;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_destinationTimeZone, a3);
      -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
      v7 = (unint64_t)v9;
    }
  }

}

- (id)_currentTiming
{
  _BOOL4 isLeaveAt;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  isLeaveAt = self->_isLeaveAt;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker date](self->_datePicker, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController originTimeZone](self, "originTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController destinationTimeZone](self, "destinationTimeZone"));
  if (isLeaveAt)
    v7 = objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", v4, v5, v6));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithArrivalDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithArrivalDate:departureTimeZone:arrivalTimeZone:", v4, v5, v6));
  v8 = (void *)v7;

  return v8;
}

- (BOOL)_shouldShowCompact
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "verticalSizeClass") == (id)1;

  return v3;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  double v14;
  double y;
  UIScrollView *scrollView;
  double x;
  double top;
  double left;
  double bottom;
  double right;
  id v22;
  CGRect v23;
  CGRect v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));

  if (!v22)
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
LABEL_6:
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", top, left, bottom, right);
    x = CGPointZero.x;
    y = CGPointZero.y;
    scrollView = self->_scrollView;
    goto LABEL_7;
  }
  objc_msgSend(v22, "CGRectValue");
  -[UIScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  Height = CGRectGetHeight(v23);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v14 = Height - CGRectGetMinY(v24);
  if (v14 <= 0.0)
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    goto LABEL_6;
  }
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, v14, 0.0);
  -[UIDatePicker frame](self->_datePicker, "frame");
  scrollView = self->_scrollView;
  x = 0.0;
LABEL_7:
  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", x, y);

}

- (void)handleDismissAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "dismiss:", 1);

}

- (void)_pressedDone
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 17, 631, 0);
  v3 = -[RoutePlanningTimingViewController isLeavingNow](self, "isLeavingNow");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController pickerDelegate](self, "pickerDelegate"));
  if (v3)
    v5 = objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTimingViewController _currentTiming](self, "_currentTiming"));
  v6 = (void *)v5;
  objc_msgSend(v4, "timingViewController:didPickTiming:", self, v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "dismiss:", 1);

}

- (void)_pressedSegmentControl
{
  BOOL v3;
  uint64_t v4;

  v3 = -[UISegmentedControl selectedSegmentIndex](self->_segmentControl, "selectedSegmentIndex") == 0;
  self->_isLeaveAt = v3;
  if (v3)
    v4 = 3028;
  else
    v4 = 3029;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v4, 631, 0);
  -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
}

- (void)_selectedDate
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3031, 631, 0);
  -[RoutePlanningTimingViewController setLeavingNow:](self, "setLeavingNow:", 0);
}

- (void)_pressedLeaveNow
{
  NSDate *v3;

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3030, 631, 0);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentControl, "setSelectedSegmentIndex:", 0);
  self->_isLeaveAt = 1;
  v3 = objc_opt_new(NSDate);
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", v3);

  -[RoutePlanningTimingViewController setLeavingNow:](self, "setLeavingNow:", 1);
  -[RoutePlanningTimingViewController _updateDatePicker](self, "_updateDatePicker");
}

- (RoutePlanningTimingViewControllerDelegate)pickerDelegate
{
  return (RoutePlanningTimingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_pickerDelegate);
}

- (BOOL)shouldShowArriveBy
{
  return self->_showArriveBy;
}

- (BOOL)isLeavingNow
{
  return self->_leavingNow;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pickerDelegate);
  objc_storeStrong((id *)&self->_destinationTimeZone, 0);
  objc_storeStrong((id *)&self->_originTimeZone, 0);
  objc_storeStrong((id *)&self->_constraintsHidingArriveBy, 0);
  objc_storeStrong((id *)&self->_constraintsShowingArriveBy, 0);
  objc_storeStrong((id *)&self->_datePickerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leaveNowButton, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_segmentControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
}

@end
