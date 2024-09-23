@implementation CarETAInfoSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAInfoSign)initWithDelegate:(id)a3 interruptPresenter:(id)a4 canExpand:(BOOL)a5
{
  id v8;
  id v9;
  double y;
  double width;
  double height;
  CarETAInfoSign *v13;
  CarETAInfoSign *v14;
  CarRouteInfoView *v15;
  CarRouteInfoView *routeInfoView;
  double v17;
  double v18;
  CarFocusableButton *v19;
  CarFocusableButton *expandButton;
  double v21;
  double v22;
  double v23;
  double v24;
  CarFocusableButton *v25;
  void *v26;
  CarFocusableButton *v27;
  void *v28;
  CarFocusableButton *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CarShareETAInfoView *v36;
  CarShareETAInfoView *shareETAInfoView;
  void *v38;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *routeInfoViewToExpandButtonConstraint;
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
  uint64_t v64;
  NSArray *showingShareTripButtonConstraints;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSArray *hidingShareTripButtonConstraints;
  uint64_t v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  objc_super v85;
  void *v86;
  void *v87;
  _QWORD v88[5];
  void *v89;
  _QWORD v90[4];
  _QWORD v91[2];

  v8 = a3;
  v9 = a4;
  v85.receiver = self;
  v85.super_class = (Class)CarETAInfoSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[CarETAInfoSign initWithFrame:](&v85, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v83 = v8;
    objc_storeWeak((id *)&v13->_delegate, v8);
    v14->_canExpand = a5;
    v15 = -[CarRouteInfoView initWithFrame:]([CarRouteInfoView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    routeInfoView = v14->_routeInfoView;
    v14->_routeInfoView = v15;

    -[CarRouteInfoView setTranslatesAutoresizingMaskIntoConstraints:](v14->_routeInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[CarRouteInfoView setContentCompressionResistancePriority:forAxis:](v14->_routeInfoView, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    -[CarRouteInfoView setContentHuggingPriority:forAxis:](v14->_routeInfoView, "setContentHuggingPriority:forAxis:", 1, v18);
    -[CarETAInfoSign addSubview:](v14, "addSubview:", v14->_routeInfoView);
    if (v14->_canExpand)
    {
      v19 = -[CarFocusableButton initWithFrame:]([CarFocusableButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      expandButton = v14->_expandButton;
      v14->_expandButton = v19;

      -[CarFocusableButton setAccessibilityIdentifier:](v14->_expandButton, "setAccessibilityIdentifier:", CFSTR("ExpandButton"));
      -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](v14->_expandButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v21) = 1148846080;
      -[CarFocusableButton setContentCompressionResistancePriority:forAxis:](v14->_expandButton, "setContentCompressionResistancePriority:forAxis:", 0, v21);
      LODWORD(v22) = 1148846080;
      -[CarFocusableButton setContentCompressionResistancePriority:forAxis:](v14->_expandButton, "setContentCompressionResistancePriority:forAxis:", 1, v22);
      LODWORD(v23) = 1148846080;
      -[CarFocusableButton setContentHuggingPriority:forAxis:](v14->_expandButton, "setContentHuggingPriority:forAxis:", 0, v23);
      LODWORD(v24) = 1148846080;
      -[CarFocusableButton setContentHuggingPriority:forAxis:](v14->_expandButton, "setContentHuggingPriority:forAxis:", 1, v24);
      -[CarFocusableButton addTarget:action:forControlEvents:](v14->_expandButton, "addTarget:action:forControlEvents:", v14, "_onExpandTapped:", 64);
      v25 = v14->_expandButton;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("chevron.up.circle.fill"), UIFontTextStyleTitle3, 6));
      -[CarFocusableButton setImage:forState:](v25, "setImage:forState:", v26, 0);

      v27 = v14->_expandButton;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
      -[CarFocusableButton setFocusedTintColor:](v27, "setFocusedTintColor:", v28);

      v29 = v14->_expandButton;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
      -[CarFocusableButton setNonFocusedTintColor:](v29, "setNonFocusedTintColor:", v30);

      -[MapsLargerHitTargetButton setTouchInsets:](v14->_expandButton, "setTouchInsets:", -10.0, -130.0, -10.0, -10.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CarPlay_Expand"), CFSTR("localized string not found"), 0));
      v91[0] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CarPlay_Up"), CFSTR("localized string not found"), 0));
      v91[1] = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 2));
      -[CarFocusableButton setAccessibilityUserInputLabels:](v14->_expandButton, "setAccessibilityUserInputLabels:", v35);

      -[CarETAInfoSign addSubview:](v14, "addSubview:", v14->_expandButton);
    }
    v82 = v9;
    v36 = -[CarShareETAInfoView initWithDelegate:interruptPresenter:]([CarShareETAInfoView alloc], "initWithDelegate:interruptPresenter:", v14, v9);
    shareETAInfoView = v14->_shareETAInfoView;
    v14->_shareETAInfoView = v36;

    -[CarShareETAInfoView setTranslatesAutoresizingMaskIntoConstraints:](v14->_shareETAInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarETAInfoSign addSubview:](v14, "addSubview:", v14->_shareETAInfoView);
    v84 = objc_alloc_init((Class)NSMutableArray);
    if (v14->_canExpand)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](v14->_expandButton, "leadingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView trailingAnchor](v14->_routeInfoView, "trailingAnchor"));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 8.5));
      routeInfoViewToExpandButtonConstraint = v14->_routeInfoViewToExpandButtonConstraint;
      v14->_routeInfoViewToExpandButtonConstraint = (NSLayoutConstraint *)v40;

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton firstBaselineAnchor](v14->_expandButton, "firstBaselineAnchor"));
      v78 = objc_claimAutoreleasedReturnValue(-[CarETAInfoSign topAnchor](v14, "topAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v78, 29.0));
      v90[0] = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton firstBaselineAnchor](v14->_expandButton, "firstBaselineAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView topAnchor](v14->_shareETAInfoView, "topAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -15.0));
      v90[1] = v45;
      v90[2] = v14->_routeInfoViewToExpandButtonConstraint;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign trailingAnchor](v14, "trailingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](v14->_expandButton, "trailingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 8.5));
      v90[3] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 4));
      objc_msgSend(v84, "addObjectsFromArray:", v49);

      v50 = (void *)v78;
      v51 = v80;

    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign trailingAnchor](v14, "trailingAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView trailingAnchor](v14->_routeInfoView, "trailingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 10.0));
      v89 = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
      objc_msgSend(v84, "addObjectsFromArray:", v43);
    }

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView firstBaselineAnchor](v14->_routeInfoView, "firstBaselineAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign topAnchor](v14, "topAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v79, 20.0));
    v88[0] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView leadingAnchor](v14->_routeInfoView, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign leadingAnchor](v14, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 10.0));
    v88[1] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView topAnchor](v14->_shareETAInfoView, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView lastBaselineAnchor](v14->_routeInfoView, "lastBaselineAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v52, 11.0));
    v88[2] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView leadingAnchor](v14->_shareETAInfoView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign leadingAnchor](v14, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
    v88[3] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign trailingAnchor](v14, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView trailingAnchor](v14->_shareETAInfoView, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
    v88[4] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 5));
    objc_msgSend(v84, "addObjectsFromArray:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView bottomAnchor](v14->_shareETAInfoView, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign bottomAnchor](v14, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
    v87 = v63;
    v64 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
    showingShareTripButtonConstraints = v14->_showingShareTripButtonConstraints;
    v14->_showingShareTripButtonConstraints = (NSArray *)v64;

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView topAnchor](v14->_shareETAInfoView, "topAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign bottomAnchor](v14, "bottomAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
    v86 = v68;
    v69 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
    hidingShareTripButtonConstraints = v14->_hidingShareTripButtonConstraints;
    v14->_hidingShareTripButtonConstraints = (NSArray *)v69;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v84);
    if (v14->_shareButtonHidden)
      v71 = 40;
    else
      v71 = 32;
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&v14->super.super.super.isa + v71), 24);

    v9 = v82;
    v8 = v83;
  }

  return v14;
}

- (BOOL)isShowingShareETASuggestion
{
  return -[CarShareETAInfoView isShowingShareETASuggestion](self->_shareETAInfoView, "isShowingShareETASuggestion");
}

- (void)updateContent
{
  -[CarShareETAInfoView updateContent](self->_shareETAInfoView, "updateContent");
}

- (void)setTitleForShareTripButton:(id)a3
{
  -[CarShareETAInfoView setTitleForShareTripButton:](self->_shareETAInfoView, "setTitleForShareTripButton:", a3);
}

- (void)setContactSharingSuggestion:(id)a3
{
  -[CarShareETAInfoView setContactSharingSuggestion:](self->_shareETAInfoView, "setContactSharingSuggestion:", a3);
}

- (void)setShareButtonHidden:(BOOL)a3
{
  -[CarETAInfoSign setShareButtonHidden:animated:](self, "setShareButtonHidden:animated:", a3, 0);
}

- (void)setShareButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD *v11;
  _QWORD v12[5];

  if (self->_shareButtonHidden != a3)
  {
    v4 = a4;
    self->_shareButtonHidden = a3;
    if (a3)
      v6 = 6;
    else
      v6 = 7;
    if (a3)
      v7 = 7;
    else
      v7 = 6;
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAInfoSign__delegate[v6]));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAInfoSign__delegate[v7]));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A19E74;
    v12[3] = &unk_1011AC860;
    v12[4] = self;
    v8 = objc_retainBlock(v12);
    v9 = v8;
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100A19EA4;
      v10[3] = &unk_1011ACAD0;
      v10[4] = self;
      v11 = v8;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.3);

    }
    else
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }

  }
}

- (void)_onExpandTapped:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign delegate](self, "delegate", a3));
  objc_msgSend(v4, "etaCardSign:didSelectAction:", self, 0);

  v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A19F7C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setLatestETA:(id)a3
{
  GuidanceETA *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *routeInfoViewToExpandButtonConstraint;
  GuidanceETA *v11;

  v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    -[CarRouteInfoView setLatestETA:](self->_routeInfoView, "setLatestETA:", v11);
    v6 = -[NSLayoutConstraint isActive](self->_routeInfoViewToExpandButtonConstraint, "isActive");
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      -[NSLayoutConstraint setActive:](self->_routeInfoViewToExpandButtonConstraint, "setActive:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](self->_expandButton, "leadingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView trailingAnchor](self->_routeInfoView, "trailingAnchor"));
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 8.5));
      routeInfoViewToExpandButtonConstraint = self->_routeInfoViewToExpandButtonConstraint;
      self->_routeInfoViewToExpandButtonConstraint = v9;

      -[NSLayoutConstraint setActive:](self->_routeInfoViewToExpandButtonConstraint, "setActive:", 1);
      v5 = v11;
    }
  }

}

- (void)infoViewDidTapShareTripButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarETAInfoSign delegate](self, "delegate", a3));
  objc_msgSend(v4, "etaCardSign:didSelectAction:", self, 6);

}

- (NSArray)focusOrderSubItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  if (self->_canExpand)
    objc_msgSend(v3, "addObject:", self->_expandButton);
  if (!-[CarETAInfoSign isShareButtonHidden](self, "isShareButtonHidden"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView focusOrderSubItems](self->_shareETAInfoView, "focusOrderSubItems"));
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
  v6 = objc_msgSend(v4, "copy");

  return (NSArray *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  if (self->_canExpand)
    objc_msgSend(v3, "addObject:", self->_expandButton);
  if (!-[CarETAInfoSign isShareButtonHidden](self, "isShareButtonHidden"))
    objc_msgSend(v4, "addObject:", self->_shareETAInfoView);
  v5 = objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (CarETACardSignDelegate)delegate
{
  return (CarETACardSignDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShareButtonHidden
{
  return self->_shareButtonHidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_routeInfoViewToExpandButtonConstraint, 0);
  objc_storeStrong((id *)&self->_hidingShareTripButtonConstraints, 0);
  objc_storeStrong((id *)&self->_showingShareTripButtonConstraints, 0);
  objc_storeStrong((id *)&self->_shareETAInfoView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_routeInfoView, 0);
}

@end
