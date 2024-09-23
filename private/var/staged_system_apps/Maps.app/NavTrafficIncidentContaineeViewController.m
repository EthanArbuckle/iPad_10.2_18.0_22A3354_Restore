@implementation NavTrafficIncidentContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setIncidentAlert:(id)a3
{
  VKTrafficIncidentFeature *incident;
  MNTrafficIncidentAlert *v6;

  v6 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v6)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    incident = self->_incident;
    self->_incident = 0;

  }
  -[NavTrafficIncidentContaineeViewController _updateViewsFromContent](self, "_updateViewsFromContent");

}

- (void)setIncident:(id)a3
{
  id v5;
  MNTrafficIncidentAlert *incidentAlert;
  id v7;

  v7 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_incident, a3);
    incidentAlert = self->_incidentAlert;
    self->_incidentAlert = 0;

    -[NavTrafficIncidentContaineeViewController _updateViewsFromContent](self, "_updateViewsFromContent");
  }

}

- (void)_updateViewsFromContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BackgroundColorButton *cancelButton;
  void *v13;
  void *v14;
  MapsProgressButton *confirmButton;
  void *v16;
  void *v17;
  unsigned int v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  if (-[NavTrafficIncidentContaineeViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController titleView](self, "titleView"));
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
      +[NavTrafficIncidentViewComposer configureHeaderView:withTrafficIncidentAlert:](NavTrafficIncidentViewComposer, "configureHeaderView:withTrafficIncidentAlert:", v4, v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
      +[NavTrafficIncidentViewComposer configureDetailsView:withTrafficIncidentAlert:](NavTrafficIncidentViewComposer, "configureDetailsView:withTrafficIncidentAlert:", v6, v7);

      -[MapsProgressButton setProgressBarHidden:](self->_confirmButton, "setProgressBarHidden:", -[MNTrafficIncidentAlert shouldShowTimer](self->_incidentAlert, "shouldShowTimer") ^ 1);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));
      +[NavTrafficIncidentViewComposer configureHeaderView:withTrafficIncidentFeature:](NavTrafficIncidentViewComposer, "configureHeaderView:withTrafficIncidentFeature:", v4, v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));
      +[NavTrafficIncidentViewComposer configureDetailsView:withTrafficIncidentFeature:](NavTrafficIncidentViewComposer, "configureDetailsView:withTrafficIncidentFeature:", v9, v10);

    }
    v11 = -[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons");
    if (v11)
    {
      cancelButton = self->_cancelButton;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dismissButtonTitle"));
      -[BackgroundColorButton setTitle:forState:](cancelButton, "setTitle:forState:", v14, 0);

      confirmButton = self->_confirmButton;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "acceptButtonTitle"));
      -[MapsProgressButton setTitle:forState:](confirmButton, "setTitle:forState:", v17, 0);

    }
    -[UIStackView setHidden:](self->_buttonsStackView, "setHidden:", v11 ^ 1);
    v18 = -[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent");
    if (v18)
      v19 = 1.0;
    else
      v19 = 0.0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v20, "setHairLineAlpha:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
    objc_msgSend(v21, "setHidden:", v18 ^ 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v23 = objc_msgSend(v22, "containeeLayout");

    if ((v18 & 1) != 0
      || -[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons")
      || v23 != (id)2)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v24, "updateHeightForCurrentLayout");
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v24, "wantsLayout:", 1);
    }

    -[NavTrafficIncidentContaineeViewController _updateGrabberVisibility](self, "_updateGrabberVisibility");
  }
}

- (void)_updateGrabberVisibility
{
  uint64_t v3;
  id v4;

  v3 = -[NavTrafficIncidentContaineeViewController _allowsCardDrag](self, "_allowsCardDrag") ^ 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setHideGrabber:", v3);

}

- (BOOL)_hasIncidentDetailsContent
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incident"));
    v6 = objc_msgSend(v5, "type");

    if (v6 == 14)
    {
LABEL_3:
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));
    v9 = objc_msgSend(v8, "type");

    if (v9 == (id)14)
      goto LABEL_3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incident"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "info"));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "info"));
  }

  if (objc_msgSend(v13, "length"))
    v7 = !-[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons");
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)_hasActionButtons
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "acceptButtonTitle"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (BOOL)_displayActionButtonsForSmallLayout
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
  v3 = objc_msgSend(v2, "acceptButtonDisplay") == 1;

  return v3;
}

- (BOOL)_allowsCardDrag
{
  void *v3;
  char *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = (char *)objc_msgSend(v3, "containeeLayout");

  if ((unint64_t)(v4 - 3) < 3 || v4 == 0)
    return 0;
  if (v4 == (char *)1
    && !-[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent"))
  {
    return -[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons");
  }
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  ContainerHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NavTrafficIncidentHeaderView *v10;
  double y;
  double width;
  double height;
  NavTrafficIncidentHeaderView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NavTrafficIncidentDetailsView *v19;
  void *v20;
  void *v21;
  BackgroundColorButton *v22;
  BackgroundColorButton *cancelButton;
  MapsProgressButton *v24;
  MapsProgressButton *confirmButton;
  id v26;
  MapsProgressButton *v27;
  void *v28;
  UIStackView *v29;
  UIStackView *buttonsStackView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *actionButtonsBottomConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
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
  objc_super v84;
  _QWORD v85[10];
  _QWORD v86[2];

  v84.receiver = self;
  v84.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v84, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setEdgeAttachedRegularHeightDimmingBehavior:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("NavTrafficIncidentView"));
  v5 = -[ContainerHeaderView initWithHairlineMargin:]([ContainerHeaderView alloc], "initWithHairlineMargin:", 16.0);
  -[NavTrafficIncidentContaineeViewController setHeaderView:](self, "setHeaderView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v7, "setHeaderSize:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v4, "addSubview:", v9);

  v10 = [NavTrafficIncidentHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v14 = -[NavTrafficIncidentHeaderView initWithFrame:](v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[NavTrafficIncidentContaineeViewController setTitleView:](self, "setTitleView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController titleView](self, "titleView"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController titleView](self, "titleView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v17, "setTitleView:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v18, "setTitleViewInsets:", 0.0, 16.0, 0.0, 0.0);

  v19 = -[NavTrafficIncidentDetailsView initWithFrame:]([NavTrafficIncidentDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[NavTrafficIncidentContaineeViewController setIncidentDetailsView:](self, "setIncidentDetailsView:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
  v83 = v4;
  objc_msgSend(v4, "addSubview:", v21);

  v22 = (BackgroundColorButton *)objc_claimAutoreleasedReturnValue(+[NavUserDecisionButtonFactory cancelButton](NavUserDecisionButtonFactory, "cancelButton"));
  cancelButton = self->_cancelButton;
  self->_cancelButton = v22;

  -[BackgroundColorButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "_didTapCancelButton:", 64);
  v24 = (MapsProgressButton *)objc_claimAutoreleasedReturnValue(+[NavUserDecisionButtonFactory confirmButton](NavUserDecisionButtonFactory, "confirmButton"));
  confirmButton = self->_confirmButton;
  self->_confirmButton = v24;

  -[MapsProgressButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, "_didTapActionButton:", 64);
  -[MapsProgressButton setProgressBarHidden:](self->_confirmButton, "setProgressBarHidden:", self->_progressBarHidden);
  -[MapsProgressButton setProgress:](self->_confirmButton, "setProgress:", self->_rerouteTimerProgress);
  v26 = objc_alloc((Class)UIStackView);
  v27 = self->_confirmButton;
  v86[0] = self->_cancelButton;
  v86[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 2));
  v29 = (UIStackView *)objc_msgSend(v26, "initWithArrangedSubviews:", v28);
  buttonsStackView = self->_buttonsStackView;
  self->_buttonsStackView = v29;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_buttonsStackView, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_buttonsStackView, "setDistribution:", 1);
  -[UIStackView setAlignment:](self->_buttonsStackView, "setAlignment:", 0);
  -[UIStackView setSpacing:](self->_buttonsStackView, "setSpacing:", 16.0);
  -[UIStackView setAccessibilityIdentifier:](self->_buttonsStackView, "setAccessibilityIdentifier:", CFSTR("ButtonStack"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v4, "addSubview:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController buttonsStackView](self, "buttonsStackView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  actionButtonsBottomConstraint = self->_actionButtonsBottomConstraint;
  self->_actionButtonsBottomConstraint = v36;

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
  v85[0] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v85[1] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v85[2] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v85[3] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v85[4] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v85[5] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController buttonsStackView](self, "buttonsStackView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 16.0));
  v85[6] = v48;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController buttonsStackView](self, "buttonsStackView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, -16.0));
  v85[7] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController buttonsStackView](self, "buttonsStackView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 65.0));
  v46 = self->_actionButtonsBottomConstraint;
  v85[8] = v45;
  v85[9] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

  -[NavTrafficIncidentContaineeViewController _updateViewsFromContent](self, "_updateViewsFromContent");
}

- (void)viewDidLayoutSubviews
{
  double previousWidth;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  previousWidth = self->_previousWidth;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;

  if (previousWidth != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController view](self, "view"));
    objc_msgSend(v7, "bounds");
    self->_previousWidth = v8;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v9, "updateHeightForCurrentLayout");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_didReceiveIncidentUpdate:", CFSTR("SiriTrafficIncidentUpdateNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
    v8 = v6;
    v9 = 248;
    v10 = 401;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController _incidentTypeAsString](self, "_incidentTypeAsString"));
    v8 = v6;
    v9 = 110;
    v10 = 0;
  }
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v9, v10, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[NavTrafficIncidentContaineeViewController _updateActionButtonsPaddingForLayout:](self, "_updateActionButtonsPaddingForLayout:", objc_msgSend(v11, "containeeLayout"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SiriTrafficIncidentUpdateNotification"), 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavTrafficIncidentContaineeViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v11.receiver, v11.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController titleView](self, "titleView"));
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentAlert](self, "incidentAlert"));
      +[NavTrafficIncidentViewComposer configureHeaderView:withTrafficIncidentAlert:](NavTrafficIncidentViewComposer, "configureHeaderView:withTrafficIncidentAlert:", v9, v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incident](self, "incident"));
      +[NavTrafficIncidentViewComposer configureHeaderView:withTrafficIncidentFeature:](NavTrafficIncidentViewComposer, "configureHeaderView:withTrafficIncidentFeature:", v9, v10);
    }

  }
}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  if (!-[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent"))
    a3 = 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v5, "setHairLineAlpha:", a3);

}

- (void)handleDismissAction:(id)a3
{
  MNTrafficIncidentAlert *incidentAlert;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(void);
  objc_super v14;

  incidentAlert = self->_incidentAlert;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](incidentAlert, "analyticsMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = -[NavTrafficIncidentContaineeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
    v10 = v7;
    v11 = 4;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController _incidentTypeAsString](self, "_incidentTypeAsString"));
    v10 = v7;
    v11 = 108;
  }
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", v11, v8, v9);

  v14.receiver = self;
  v14.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController handleDismissAction:](&v14, "handleDismissAction:", v5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController dismissHandler](self, "dismissHandler"));
  if (v12)
  {
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController dismissHandler](self, "dismissHandler"));
    v13[2]();

  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController willChangeLayout:](&v5, "willChangeLayout:");
  -[NavTrafficIncidentContaineeViewController _updateActionButtonsPaddingForLayout:](self, "_updateActionButtonsPaddingForLayout:", a3);
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavTrafficIncidentContaineeViewController;
  -[ContaineeViewController didChangeLayout:](&v4, "didChangeLayout:", a3);
  -[NavTrafficIncidentContaineeViewController _updateGrabberVisibility](self, "_updateGrabberVisibility");
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "bottomSafeOffset");
    v8 = v7;
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v10 = v8 + v9;
    -[NavTrafficIncidentContaineeViewController actionButtonsHeightForLayout:](self, "actionButtonsHeightForLayout:", 1);
    goto LABEL_9;
  }
  v4 = -1.0;
  if (a3 == 2)
  {
    if (!-[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent")
      && !-[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons"))
    {
      return v4;
    }
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v13 = v12;
    -[NavTrafficIncidentContaineeViewController detailsHeight](self, "detailsHeight");
    v15 = v13 + v14;
    -[NavTrafficIncidentContaineeViewController actionButtonsHeightForLayout:](self, "actionButtonsHeightForLayout:", 2);
    v10 = v15 + v16;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "bottomSafeOffset");
LABEL_9:
    v4 = v10 + v11;
    goto LABEL_10;
  }
  if (a3 == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "availableHeight");
    v4 = v6;
LABEL_10:

  }
  return v4;
}

- (void)_updateActionButtonsPaddingForLayout:(unint64_t)a3
{
  id v4;

  if (a3 == 1
    && !-[NavTrafficIncidentContaineeViewController _displayActionButtonsForSmallLayout](self, "_displayActionButtonsForSmallLayout"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "bottomSafeOffset");
    -[NSLayoutConstraint setConstant:](self->_actionButtonsBottomConstraint, "setConstant:");

  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_actionButtonsBottomConstraint, "setConstant:", 0.0);
  }
}

- (double)detailsHeight
{
  double v3;
  void *v4;
  double v5;

  v3 = 0.0;
  if (-[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController incidentDetailsView](self, "incidentDetailsView"));
    objc_msgSend(v4, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v3 = v5;

  }
  return v3;
}

- (double)actionButtonsHeightForLayout:(unint64_t)a3
{
  unsigned int v5;
  double result;

  v5 = -[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons");
  if (a3 == 1)
  {
    result = 0.0;
    if (!v5)
      return result;
    v5 = -[NavTrafficIncidentContaineeViewController _displayActionButtonsForSmallLayout](self, "_displayActionButtonsForSmallLayout", 0.0);
  }
  result = 80.0;
  if (!v5)
    return 0.0;
  return result;
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  v5 = -[NavTrafficIncidentContaineeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 3, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = objc_msgSend(v7, "containeeLayout");

  if (v8 == (id)2)
    goto LABEL_8;
  if (v8 != (id)1)
    return;
  if (-[NavTrafficIncidentContaineeViewController _hasIncidentDetailsContent](self, "_hasIncidentDetailsContent")
    || -[NavTrafficIncidentContaineeViewController _hasActionButtons](self, "_hasActionButtons"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v10 = objc_msgSend(v9, "containerStyle");

    if (v10 == (id)5)
      v11 = 3;
    else
      v11 = 2;
  }
  else
  {
LABEL_8:
    v11 = 1;
  }
  if ((id)v11 != v8)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v12, "wantsLayout:", v11);

  }
}

- (void)setRerouteTimerProgress:(double)a3
{
  self->_rerouteTimerProgress = a3;
  -[MapsProgressButton setProgress:](self->_confirmButton, "setProgress:");
}

- (double)rerouteTimerProgress
{
  return self->_rerouteTimerProgress;
}

- (void)setProgressBarHidden:(BOOL)a3
{
  self->_progressBarHidden = a3;
  -[MapsProgressButton setProgressBarHidden:](self->_confirmButton, "setProgressBarHidden:");
}

- (BOOL)progressBarHidden
{
  return self->_progressBarHidden;
}

- (void)_didTapCancelButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:", 739);

}

- (void)_didTapActionButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:", 739);

}

- (int)currentUITargetForAnalytics
{
  return 615;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (id)_incidentTypeAsString
{
  void *v2;
  id v3;
  __CFString *v4;

  if (self->_incidentAlert)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert incident](self->_incidentAlert, "incident"));
    v3 = objc_msgSend(v2, "type");
    v4 = CFSTR("ACCIDENT");
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        v4 = CFSTR("CONSTRUCTION");
        break;
      case 2:
        v4 = CFSTR("ROAD_CLOSURE");
        break;
      case 3:
        v4 = CFSTR("EVENT");
        break;
      case 4:
        v4 = CFSTR("HAZARD");
        break;
      case 5:
        v4 = CFSTR("LANE_CLOSURE");
        break;
      case 6:
        v4 = CFSTR("RAMP_CLOSURE");
        break;
      case 7:
        v4 = CFSTR("TRAFFIC");
        break;
      case 8:
        v4 = CFSTR("WALKING_CLOSURE");
        break;
      case 9:
        v4 = CFSTR("CONGESTION_ZONE_RESTRICTION");
        break;
      case 10:
        v4 = CFSTR("LICENSE_PLATE_RESTRICTION");
        break;
      case 11:
      case 12:
        goto LABEL_7;
      case 13:
        v4 = CFSTR("SPEED_TRAP");
        break;
      case 14:
        v4 = CFSTR("AREA_INCIDENT");
        break;
      default:
        if ((_DWORD)v3 == 100)
          v4 = CFSTR("TIME_BASED_RESTRICTION");
        else
LABEL_7:
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v3));
        break;
    }

  }
  else
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[VKTrafficIncidentFeature stringForIncidentType:](VKTrafficIncidentFeature, "stringForIncidentType:", -[VKTrafficIncidentFeature type](self->_incident, "type")));
  }
  return v4;
}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SiriTrafficIncidentIsClearKey")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentContaineeViewController delegate](self, "delegate"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:", 0);
  else
    objc_msgSend(v7, "didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:", 0);

}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NavTrafficIncidentAlertViewControllerDelegate)delegate
{
  return (NavTrafficIncidentAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NavTrafficIncidentHeaderView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (NavTrafficIncidentDetailsView)incidentDetailsView
{
  return self->_incidentDetailsView;
}

- (void)setIncidentDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_incidentDetailsView, a3);
}

- (BackgroundColorButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (MapsProgressButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_incidentDetailsView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_incidentAlert, 0);
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_actionButtonsBottomConstraint, 0);
}

@end
