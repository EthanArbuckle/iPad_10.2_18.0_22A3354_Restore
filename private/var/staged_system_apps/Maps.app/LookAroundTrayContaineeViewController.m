@implementation LookAroundTrayContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LookAroundTrayContaineeViewController)initWithLookAroundView:(id)a3
{
  id v5;
  LookAroundTrayContaineeViewController *v6;
  LookAroundTrayContaineeViewController *v7;
  void *v8;
  void *v9;
  NSDateFormatter *v10;
  NSDateFormatter *dateFormatter;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LookAroundTrayContaineeViewController;
  v6 = -[LookAroundTrayContaineeViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setAllowResizeInFloatingStyle:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v9, "setEdgeAttachedRegularHeightDimmingBehavior:", 1);

    v10 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v10;

    objc_storeStrong((id *)&v7->_lookAroundView, a3);
    v7->_visible = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v7;
}

- (void)updateLocation
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  LookAroundTrayContaineeViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003F461C;
  v5[3] = &unk_1011AC8B0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController lookAroundView](self, "lookAroundView"));
  v7 = self;
  v4 = v6;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "updateHeightForCurrentLayout");

}

- (BOOL)supportsLookAroundPIP
{
  return 0;
}

- (void)setVisible:(BOOL)a3
{
  -[LookAroundTrayContaineeViewController setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_visible != a3)
  {
    v4 = a4;
    self->_visible = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003F48FC;
    v8[3] = &unk_1011ACE58;
    v8[4] = self;
    v9 = a3;
    v6 = objc_retainBlock(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "wantsLayout:", 1);

    -[LookAroundTrayContaineeViewController updateLocation](self, "updateLocation");
    -[LookAroundTrayContaineeViewController _updateLabelsButton](self, "_updateLabelsButton");
    if (v4)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25);
    else
      ((void (*)(_QWORD *))v6[2])(v6);

  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LookAroundTrayContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setHidden:", 1);

  -[LookAroundTrayContaineeViewController _setupViews](self, "_setupViews");
  -[LookAroundTrayContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundTrayContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "grabberSafeAreaHeight");
  -[NSLayoutConstraint setConstant:](self->_grabberSafeAreaHeightConstraint, "setConstant:");

}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (double)headerHeight
{
  double height;
  void *v4;
  double Width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;

  height = UILayoutFittingCompressedSize.height;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, height, v7, v8);
  v10 = v9;

  return v10;
}

- (id)headerView
{
  return -[LookAroundTrayHeaderViewController view](self->_headerViewController, "view");
}

- (id)contentView
{
  return self->_scrollView;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  double height;
  CGFloat Width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGRect v16;

  if (a3 == 1)
  {
    v10 = 0.0;
    goto LABEL_5;
  }
  v4 = -1.0;
  if (a3 == 3)
  {
    height = UILayoutFittingCompressedSize.height;
    -[UIView frame](self->_containerView, "frame");
    Width = CGRectGetWidth(v16);
    LODWORD(v7) = 1148846080;
    LODWORD(v8) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_containerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, height, v7, v8);
    v10 = v9 + 0.0;
LABEL_5:
    -[LookAroundTrayContaineeViewController headerHeight](self, "headerHeight");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v13, "bottomSafeOffset");
    v4 = v10 + v12 + v14;

  }
  return v4;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LookAroundTrayContaineeViewController;
  -[ContaineeViewController willChangeLayout:](&v10, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if (a3 == 2 && v6 == (id)1)
  {
    v7 = 1;
LABEL_7:
    -[LookAroundTrayContaineeViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", v7, 1701, 0);
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = objc_msgSend(v8, "containeeLayout");

  if (a3 == 1 && v9 == (id)2)
  {
    v7 = 2;
    goto LABEL_7;
  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LookAroundTrayContaineeViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v8, "willChangeContainerStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));

  if (v4)
  {
    v5 = !self->_visible;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "setHidden:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v7, "grabberSafeAreaHeight");
  -[NSLayoutConstraint setConstant:](self->_grabberSafeAreaHeightConstraint, "setConstant:");

}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  MKLookAroundView *v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  id v18;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v18 = a5;
  v8 = self->_lookAroundView;
  -[MKLookAroundView centerCoordinate](v8, "centerCoordinate");
  v11 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v9, v10);
  -[MKLookAroundView presentationYaw](v8, "presentationYaw");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView visiblePlaceMUIDs](v8, "visiblePlaceMUIDs"));
  v15 = objc_msgSend(v14, "count");
  if ((-[MKLookAroundView showsRoadLabels](v8, "showsRoadLabels") & 1) != 0)
    v16 = 1;
  else
    v16 = -[MKLookAroundView showsPointLabels](v8, "showsPointLabels");
  LOBYTE(v17) = v16;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v6, v5, v18, v11, v13, v15, 0.0, v17);

}

- (void)trayHeaderDidReceiveTap
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containeeLayout");

  if (v4 == (id)1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "wantsExpandLayout");
  }
  else
  {
    if (v4 != (id)2)
      return;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "wantsMinimizeLayout");
  }

}

- (void)toggleLabelsButtonTapped:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "lookAroundTrayContaineeViewController:didTapToggleLabelsButton:", self, v4);

  -[LookAroundTrayContaineeViewController _updateLabelsButton](self, "_updateLabelsButton");
}

- (void)shareButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "lookAroundTrayContaineeViewController:didTapShareButton:", self, v4);

}

- (void)reportAnIssueButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "lookAroundTrayContaineeViewController:didTapReportAnIssueButton:", self, v4);

}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *grabberSafeAreaHeightConstraint;
  NSLayoutConstraint *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  LookAroundVibrantBackgroundButton *reportAnIssueButton;
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
  void *v70;
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
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[29];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline heightAnchor](self->_grabberSafeAreaView, "heightAnchor"));
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToConstant:", 0.0));
  grabberSafeAreaHeightConstraint = self->_grabberSafeAreaHeightConstraint;
  self->_grabberSafeAreaHeightConstraint = v4;

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "topAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "topAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
  v112[0] = v107;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v112[1] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
  v112[2] = v97;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline leadingAnchor](self->_grabberSafeAreaView, "leadingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v94));
  v112[3] = v93;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline trailingAnchor](self->_grabberSafeAreaView, "trailingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "trailingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
  v112[4] = v89;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline bottomAnchor](self->_grabberSafeAreaView, "bottomAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v6 = self->_grabberSafeAreaHeightConstraint;
  v112[5] = v85;
  v112[6] = v6;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bottomAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
  v112[7] = v81;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v112[8] = v77;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v112[9] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "widthAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v112[10] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MKViewWithHairline topAnchor](self->_grabberSafeAreaView, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v112[11] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v112[12] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v112[13] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v112[14] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v112[15] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_containerLayoutGuide, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 15.0));
  v112[16] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 16.0));
  v112[17] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -16.0));
  v112[18] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_containerLayoutGuide, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -15.0));
  v112[19] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_buttonStackView, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_containerLayoutGuide, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v112[20] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_buttonStackView, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v112[21] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_buttonStackView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v112[22] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton heightAnchor](self->_toggleLabelsButton, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:", 52.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v30, &stru_1011B51D0, 52.0));
  v112[23] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton heightAnchor](self->_shareButton, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton heightAnchor](self->_toggleLabelsButton, "heightAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v112[24] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_lastUpdatedLabel, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_containerLayoutGuide, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v112[25] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_lastUpdatedLabel, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_containerLayoutGuide, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v112[26] = v20;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_lastUpdatedLabel, "firstBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_buttonStackView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v9, &stru_1011B51D0, 32.0));
  v112[27] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_lastUpdatedLabel, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_containerLayoutGuide, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v112[28] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 29));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v14));

  reportAnIssueButton = self->_reportAnIssueButton;
  if (reportAnIssueButton)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton heightAnchor](reportAnIssueButton, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton heightAnchor](self->_shareButton, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    objc_msgSend(v15, "addObject:", v19);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)_setupViews
{
  void *v3;
  LookAroundTrayHeaderViewController *v4;
  LookAroundTrayHeaderViewController *headerViewController;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  UIScrollView *v13;
  UIScrollView *scrollView;
  void *v15;
  void *v16;
  MKViewWithHairline *v17;
  MKViewWithHairline *grabberSafeAreaView;
  void *v19;
  void *v20;
  UIView *v21;
  UIView *containerView;
  UILayoutGuide *v23;
  UILayoutGuide *containerLayoutGuide;
  UIStackView *v25;
  UIStackView *buttonStackView;
  LookAroundVibrantBackgroundButton *v27;
  LookAroundVibrantBackgroundButton *toggleLabelsButton;
  void *v29;
  void *v30;
  void *v31;
  LookAroundVibrantBackgroundButton *v32;
  LookAroundVibrantBackgroundButton *shareButton;
  void *v34;
  void *v35;
  void *v36;
  LookAroundVibrantBackgroundButton *v37;
  LookAroundVibrantBackgroundButton *reportAnIssueButton;
  UILabel *v39;
  UILabel *lastUpdatedLabel;
  void *v41;
  double v42;
  double v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = objc_alloc_init(LookAroundTrayHeaderViewController);
  headerViewController = self->_headerViewController;
  self->_headerViewController = v4;

  -[LookAroundTrayHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[LookAroundTrayHeaderViewController setAccessibilityIdentifier:](self->_headerViewController, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayHeader"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self->_headerViewController, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = objc_alloc((Class)UIScrollView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = (UIScrollView *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  scrollView = self->_scrollView;
  self->_scrollView = v13;

  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView layer](self->_scrollView, "layer"));
  objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_scrollView);

  v17 = (MKViewWithHairline *)objc_msgSend(objc_alloc((Class)MKViewWithHairline), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  grabberSafeAreaView = self->_grabberSafeAreaView;
  self->_grabberSafeAreaView = v17;

  -[MKViewWithHairline setBottomHairlineHidden:](self->_grabberSafeAreaView, "setBottomHairlineHidden:", 1);
  -[MKViewWithHairline setTopHairlineHidden:](self->_grabberSafeAreaView, "setTopHairlineHidden:", 0);
  -[MKViewWithHairline setTranslatesAutoresizingMaskIntoConstraints:](self->_grabberSafeAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MKViewWithHairline setBackgroundColor:](self->_grabberSafeAreaView, "setBackgroundColor:", v19);

  -[MKViewWithHairline setPreservesSuperviewLayoutMargins:](self->_grabberSafeAreaView, "setPreservesSuperviewLayoutMargins:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayContaineeViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_grabberSafeAreaView);

  v21 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerView = self->_containerView;
  self->_containerView = v21;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_containerView, "setAccessibilityIdentifier:", CFSTR("LookAroundTray"));
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_containerView);
  v23 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  containerLayoutGuide = self->_containerLayoutGuide;
  self->_containerLayoutGuide = v23;

  -[UIView addLayoutGuide:](self->_containerView, "addLayoutGuide:", self->_containerLayoutGuide);
  v25 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v25;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_buttonStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_buttonStackView, "setSpacing:", 15.0);
  -[UIStackView setAccessibilityIdentifier:](self->_buttonStackView, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayButtonsStack"));
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_buttonStackView);
  v27 = (LookAroundVibrantBackgroundButton *)objc_claimAutoreleasedReturnValue(+[LookAroundVibrantBackgroundButton customButtonWithImage:title:target:action:](LookAroundVibrantBackgroundButton, "customButtonWithImage:title:target:action:", 0, 0, self, "toggleLabelsButtonTapped:"));
  toggleLabelsButton = self->_toggleLabelsButton;
  self->_toggleLabelsButton = v27;

  -[LookAroundVibrantBackgroundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_toggleLabelsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LookAroundVibrantBackgroundButton setAccessibilityIdentifier:](self->_toggleLabelsButton, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayToggleLabelsButton"));
  -[LookAroundTrayContaineeViewController _updateLabelsButton](self, "_updateLabelsButton");
  -[UIStackView addArrangedSubview:](self->_buttonStackView, "addArrangedSubview:", self->_toggleLabelsButton);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Share [LookAround]"), CFSTR("localized string not found"), 0));
  v32 = (LookAroundVibrantBackgroundButton *)objc_claimAutoreleasedReturnValue(+[LookAroundVibrantBackgroundButton customButtonWithImage:title:target:action:](LookAroundVibrantBackgroundButton, "customButtonWithImage:title:target:action:", v29, v31, self, "shareButtonTapped:"));
  shareButton = self->_shareButton;
  self->_shareButton = v32;

  -[LookAroundVibrantBackgroundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LookAroundVibrantBackgroundButton setAccessibilityIdentifier:](self->_shareButton, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayShareButton"));
  if (_MKRAPIsAvailable(-[UIStackView addArrangedSubview:](self->_buttonStackView, "addArrangedSubview:", self->_shareButton))&& (sub_1003DDB84() & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.bubble")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Report an Issue"), CFSTR("localized string not found"), 0));
    v37 = (LookAroundVibrantBackgroundButton *)objc_claimAutoreleasedReturnValue(+[LookAroundVibrantBackgroundButton customButtonWithImage:title:target:action:](LookAroundVibrantBackgroundButton, "customButtonWithImage:title:target:action:", v34, v36, self, "reportAnIssueButtonTapped:"));
    reportAnIssueButton = self->_reportAnIssueButton;
    self->_reportAnIssueButton = v37;

    -[LookAroundVibrantBackgroundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_reportAnIssueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LookAroundVibrantBackgroundButton setAccessibilityIdentifier:](self->_reportAnIssueButton, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayReportAnIssueButton"));
    -[UIStackView addArrangedSubview:](self->_buttonStackView, "addArrangedSubview:", self->_reportAnIssueButton);
  }
  v39 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  lastUpdatedLabel = self->_lastUpdatedLabel;
  self->_lastUpdatedLabel = v39;

  -[UILabel setNumberOfLines:](self->_lastUpdatedLabel, "setNumberOfLines:", 2);
  -[UILabel setTextAlignment:](self->_lastUpdatedLabel, "setTextAlignment:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_lastUpdatedLabel, "setTextColor:", v41);

  LODWORD(v42) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_lastUpdatedLabel, "setContentCompressionResistancePriority:forAxis:", 0, v42);
  LODWORD(v43) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_lastUpdatedLabel, "setContentCompressionResistancePriority:forAxis:", 1, v43);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_lastUpdatedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_lastUpdatedLabel, &stru_1011B51D0);
  -[UILabel setAccessibilityIdentifier:](self->_lastUpdatedLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayLastUpdatedLabel"));
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_lastUpdatedLabel);
}

- (void)_updateLabelsButton
{
  LookAroundVibrantBackgroundButton *toggleLabelsButton;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  if (-[MKLookAroundView showsPointLabels](self->_lookAroundView, "showsPointLabels")
    && -[MKLookAroundView showsRoadLabels](self->_lookAroundView, "showsRoadLabels"))
  {
    toggleLabelsButton = self->_toggleLabelsButton;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("eye.slash")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Hide Labels [LookAround]");
  }
  else
  {
    toggleLabelsButton = self->_toggleLabelsButton;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("eye")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Show Labels [LookAround]");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));
  -[LookAroundVibrantBackgroundButton setImage:title:](toggleLabelsButton, "setImage:title:", v8, v7);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "updateHeightForCurrentLayout");

}

- (LookAroundActionCoordination)actionCoordinator
{
  return (LookAroundActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_actionCoordinator, a3);
}

- (LookAroundTrayContaineeViewControllerDelegate)delegate
{
  return (LookAroundTrayContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (LookAroundTrayHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILayoutGuide)containerLayoutGuide
{
  return self->_containerLayoutGuide;
}

- (void)setContainerLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_containerLayoutGuide, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (LookAroundVibrantBackgroundButton)toggleLabelsButton
{
  return self->_toggleLabelsButton;
}

- (void)setToggleLabelsButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleLabelsButton, a3);
}

- (LookAroundVibrantBackgroundButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareButton, a3);
}

- (LookAroundVibrantBackgroundButton)reportAnIssueButton
{
  return self->_reportAnIssueButton;
}

- (void)setReportAnIssueButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportAnIssueButton, a3);
}

- (UILabel)lastUpdatedLabel
{
  return self->_lastUpdatedLabel;
}

- (void)setLastUpdatedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedLabel, a3);
}

- (MKViewWithHairline)grabberSafeAreaView
{
  return self->_grabberSafeAreaView;
}

- (void)setGrabberSafeAreaView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberSafeAreaView, a3);
}

- (NSLayoutConstraint)grabberSafeAreaHeightConstraint
{
  return self->_grabberSafeAreaHeightConstraint;
}

- (void)setGrabberSafeAreaHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_grabberSafeAreaHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSafeAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_grabberSafeAreaView, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_reportAnIssueButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_toggleLabelsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_containerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_actionCoordinator);
}

@end
