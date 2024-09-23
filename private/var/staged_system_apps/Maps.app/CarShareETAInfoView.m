@implementation CarShareETAInfoView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarShareETAInfoView)initWithDelegate:(id)a3 interruptPresenter:(id)a4
{
  CarFocusableButton *v6;
  double y;
  double width;
  double height;
  CarFocusableButton *v10;
  CarFocusableButton *shareTripButton;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *shareTripButtonBottomConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CarContentSizedTableView *v29;
  CarContentSizedTableView *shareETASuggestionTableView;
  void *v31;
  double v32;
  CarContentSizedTableView *v33;
  uint64_t v34;
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
  CarShareTripFooterView *v45;
  CarShareTripFooterView *shareETASuggestionFooterView;
  double v47;
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
  uint64_t v60;
  NSLayoutConstraint *shareTripContactSuggestionBottomConstraint;
  void *v62;
  void *v63;
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
  id obj;
  id v81;
  void *v82;
  void *v83;
  CarShareETAInfoView *val;
  _QWORD v85[4];
  id v86;
  id location;
  objc_super v88;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[8];

  obj = a3;
  v81 = a4;
  v88.receiver = self;
  v88.super_class = (Class)CarShareETAInfoView;
  val = -[CarShareETAInfoView init](&v88, "init");
  if (val)
  {
    objc_storeWeak((id *)&val->_delegate, obj);
    objc_storeWeak((id *)&val->_interruptPresenter, v81);
    -[CarShareETAInfoView setAccessibilityIdentifier:](val, "setAccessibilityIdentifier:", CFSTR("CarShareETAInfoView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = [CarFocusableButton alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = -[CarFocusableButton initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shareTripButton = val->_shareTripButton;
    val->_shareTripButton = v10;

    -[CarFocusableButton setAccessibilityIdentifier:](val->_shareTripButton, "setAccessibilityIdentifier:", CFSTR("ShareTripButton"));
    -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](val->_shareTripButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarFocusableButton setModifiesBackgroundColor:](val->_shareTripButton, "setModifiesBackgroundColor:", 1);
    -[CarFocusableButton setAlpha:](val->_shareTripButton, "setAlpha:", 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleLabel](val->_shareTripButton, "titleLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    objc_msgSend(v12, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleLabel](val->_shareTripButton, "titleLabel"));
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton titleLabel](val->_shareTripButton, "titleLabel"));
    objc_msgSend(v15, "setMinimumScaleFactor:", 0.833333333);

    v83 = (void *)objc_claimAutoreleasedReturnValue(+[CarHairlineView hairlineViewAlongAxis:](CarHairlineView, "hairlineViewAlongAxis:", 0));
    -[CarFocusableButton setContentEdgeInsets:](val->_shareTripButton, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
    -[CarFocusableButton addSubview:](val->_shareTripButton, "addSubview:", v83);
    -[CarFocusableButton addTarget:action:forControlEvents:](val->_shareTripButton, "addTarget:action:forControlEvents:", val, "shareTripButtonTapped:", 64);
    -[CarShareETAInfoView addSubview:](val, "addSubview:", val->_shareTripButton);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton bottomAnchor](val->_shareTripButton, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView bottomAnchor](val, "bottomAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    shareTripButtonBottomConstraint = val->_shareTripButtonBottomConstraint;
    val->_shareTripButtonBottomConstraint = (NSLayoutConstraint *)v18;

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton topAnchor](val->_shareTripButton, "topAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v75));
    v91[0] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](val->_shareTripButton, "leadingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
    v91[1] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](val->_shareTripButton, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v91[2] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](val->_shareTripButton, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView leadingAnchor](val, "leadingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v91[3] = v65;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](val->_shareTripButton, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView trailingAnchor](val, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v91[4] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton topAnchor](val->_shareTripButton, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView topAnchor](val, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v91[5] = v25;
    v91[6] = val->_shareTripButtonBottomConstraint;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton heightAnchor](val->_shareTripButton, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 28.0));
    v91[7] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 8));
    objc_msgSend(v82, "addObjectsFromArray:", v28);

    v29 = -[CarContentSizedTableView initWithFrame:style:]([CarContentSizedTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
    shareETASuggestionTableView = val->_shareETASuggestionTableView;
    val->_shareETASuggestionTableView = v29;

    -[CarContentSizedTableView setAccessibilityIdentifier:](val->_shareETASuggestionTableView, "setAccessibilityIdentifier:", CFSTR("ShareETASuggestionTableView"));
    -[CarContentSizedTableView setTranslatesAutoresizingMaskIntoConstraints:](val->_shareETASuggestionTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarContentSizedTableView setDataSource:](val->_shareETASuggestionTableView, "setDataSource:", val);
    -[CarContentSizedTableView setDelegate:](val->_shareETASuggestionTableView, "setDelegate:", val);
    -[CarContentSizedTableView setAlpha:](val->_shareETASuggestionTableView, "setAlpha:", 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarContentSizedTableView setBackgroundColor:](val->_shareETASuggestionTableView, "setBackgroundColor:", v31);

    -[CarContentSizedTableView setRowHeight:](val->_shareETASuggestionTableView, "setRowHeight:", UITableViewAutomaticDimension);
    LODWORD(v32) = 1148846080;
    -[CarContentSizedTableView setContentCompressionResistancePriority:forAxis:](val->_shareETASuggestionTableView, "setContentCompressionResistancePriority:forAxis:", 1, v32);
    v33 = val->_shareETASuggestionTableView;
    v34 = objc_opt_class(CarShareTripContactCell);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CarShareTripContactCell reuseIdentifier](CarShareTripContactCell, "reuseIdentifier"));
    -[CarContentSizedTableView registerClass:forCellReuseIdentifier:](v33, "registerClass:forCellReuseIdentifier:", v34, v35);

    -[CarShareETAInfoView addSubview:](val, "addSubview:", val->_shareETASuggestionTableView);
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView leadingAnchor](val->_shareETASuggestionTableView, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView leadingAnchor](val, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v36));
    v90[0] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView trailingAnchor](val->_shareETASuggestionTableView, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView trailingAnchor](val, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
    v90[1] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView topAnchor](val->_shareETASuggestionTableView, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView topAnchor](val, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
    v90[2] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 3));
    objc_msgSend(v82, "addObjectsFromArray:", v44);

    v45 = -[CarShareTripFooterView initWithFrame:]([CarShareTripFooterView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shareETASuggestionFooterView = val->_shareETASuggestionFooterView;
    val->_shareETASuggestionFooterView = v45;

    -[CarShareTripFooterView setTranslatesAutoresizingMaskIntoConstraints:](val->_shareETASuggestionFooterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v47) = 1148846080;
    -[CarShareTripFooterView setContentCompressionResistancePriority:forAxis:](val->_shareETASuggestionFooterView, "setContentCompressionResistancePriority:forAxis:", 1, v47);
    -[CarShareTripFooterView setAlpha:](val->_shareETASuggestionFooterView, "setAlpha:", 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "sharingIdentity"));
    -[CarShareETAInfoView _updateFooterContentWithSharingIdentity:](val, "_updateFooterContentWithSharingIdentity:", v49);

    -[CarShareETAInfoView addSubview:](val, "addSubview:", val->_shareETASuggestionFooterView);
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripFooterView topAnchor](val->_shareETASuggestionFooterView, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView bottomAnchor](val->_shareETASuggestionTableView, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v76));
    v89[0] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripFooterView leadingAnchor](val->_shareETASuggestionFooterView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView leadingAnchor](val->_shareETASuggestionTableView, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    v89[1] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripFooterView trailingAnchor](val->_shareETASuggestionFooterView, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarContentSizedTableView trailingAnchor](val->_shareETASuggestionTableView, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
    v89[2] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 3));
    objc_msgSend(v82, "addObjectsFromArray:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareTripFooterView bottomAnchor](val->_shareETASuggestionFooterView, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView bottomAnchor](val, "bottomAnchor"));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, -10.0));
    shareTripContactSuggestionBottomConstraint = val->_shareTripContactSuggestionBottomConstraint;
    val->_shareTripContactSuggestionBottomConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v62, "addSendingObserver:", val);

    objc_initWeak(&location, val);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100B80364;
    v85[3] = &unk_1011B3220;
    objc_copyWeak(&v86, &location);
    objc_msgSend(v63, "refreshSharingIdentityWithCompletion:", v85);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v82);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&location);

  }
  return val;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v3, "removeSendingObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarShareETAInfoView;
  -[CarShareETAInfoView dealloc](&v4, "dealloc");
}

- (id)viewForFirstBaselineLayout
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion");
  v4 = 2;
  if (v3)
    v4 = 4;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___CarShareETAInfoView__delegate[v4]));
}

- (id)viewForLastBaselineLayout
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion");
  v4 = 2;
  if (v3)
    v4 = 5;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___CarShareETAInfoView__delegate[v4]));
}

- (void)hideShareETASuggestion
{
  -[CarShareETAInfoView _stopCompletionTimer](self, "_stopCompletionTimer");
  self->_shareETACompleted = 1;
  -[CarShareETAInfoView updateContent](self, "updateContent");
  -[CarContentSizedTableView reloadData](self->_shareETASuggestionTableView, "reloadData");
}

- (void)updateContent
{
  _BOOL8 v3;
  double v4;
  double v5;

  v3 = -[CarShareETAInfoView isShowingShareETASuggestion](self, "isShowingShareETASuggestion");
  if (v3)
    v4 = 1.0;
  else
    v4 = 0.0;
  if (v3)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[CarContentSizedTableView setAlpha:](self->_shareETASuggestionTableView, "setAlpha:", v4);
  -[CarShareTripFooterView setAlpha:](self->_shareETASuggestionFooterView, "setAlpha:", v4);
  -[CarFocusableButton setAlpha:](self->_shareTripButton, "setAlpha:", v5);
  -[NSLayoutConstraint setActive:](self->_shareTripButtonBottomConstraint, "setActive:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_shareTripContactSuggestionBottomConstraint, "setActive:", v3);
}

- (BOOL)_shouldShowETASuggestion
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_contact)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receivers"));
  v5 = (!objc_msgSend(v4, "count") || self->_completionTimer) && !self->_shareETACompleted;

  return v5;
}

- (void)_updateFooterContentWithSharingIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[CarShareTripFooterView setNameText:](self->_shareETASuggestionFooterView, "setNameText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("(%@)"), v6));
    -[CarShareTripFooterView setHandleText:](self->_shareETASuggestionFooterView, "setHandleText:", v7);

  }
  else
  {
    -[CarShareTripFooterView setNameText:](self->_shareETASuggestionFooterView, "setNameText:", 0);
    -[CarShareTripFooterView setHandleText:](self->_shareETASuggestionFooterView, "setHandleText:", 0);
  }

}

- (void)_startCompletionTimer
{
  double Double;
  id v4;
  GCDTimer *v5;
  GCDTimer *completionTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_ShareETASmartSuggestionCompletionDismissInterval, off_1014B50E8);
  v4 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B807EC;
  v7[3] = &unk_1011AE190;
  objc_copyWeak(&v8, &location);
  v5 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v7, Double));
  completionTimer = self->_completionTimer;
  self->_completionTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopCompletionTimer
{
  GCDTimer *completionTimer;

  -[GCDTimer invalidate](self->_completionTimer, "invalidate");
  completionTimer = self->_completionTimer;
  self->_completionTimer = 0;

}

- (void)setContactSharingSuggestion:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v5 = a3;
  v6 = self->_contact;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v12 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v12;
    if ((v8 & 1) == 0)
    {
      v9 = -[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion");
      objc_storeStrong((id *)&self->_contact, a3);
      v10 = -[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion");
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100B80A08;
      v13[3] = &unk_1011AC860;
      v13[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
      -[CarShareETAInfoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v11, "postNotificationName:object:", CarShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification, self);

        if (v10)
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, 126, 0);
      }
      v7 = (unint64_t)v12;
    }
  }

}

- (void)setTitleForShareTripButton:(id)a3
{
  -[CarFocusableButton setTitle:forState:](self->_shareTripButton, "setTitle:forState:", a3, 0);
}

- (void)shareTripButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarShareETAInfoView delegate](self, "delegate", a3));
  objc_msgSend(v4, "infoViewDidTapShareTripButton:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_contact != 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  CarShareETAInfoView *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100B80BD4;
  v21 = sub_100B80BE4;
  v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100B80BEC;
  v12[3] = &unk_1011BC5A8;
  v16 = &v17;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  MSPSharedTripContact *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  MSPSharedTripContact *contact;
  void *v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
  v9 = objc_msgSend(v8, "sharingState");
  if (v9 == (id)1)
  {
    objc_msgSend(v8, "setSharingState:animated:", 0, 0);
  }
  else if (v9)
  {
    objc_initWeak(&location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    contact = self->_contact;
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100B80F38;
    v20 = &unk_1011E73E8;
    v21 = v8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v14, "stopSharingWithContact:completion:", contact, &v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = self->_contact;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharingIdentity"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_interruptPresenter);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100B80F28;
    v24[3] = &unk_1011AC860;
    v25 = v8;
    +[CarNavigationShareTripModeController attemptToStartShareWithContact:sharingIdentity:interruptPresenter:completion:](CarNavigationShareTripModeController, "attemptToStartShareWithContact:sharingIdentity:interruptPresenter:completion:", v10, v12, WeakRetained, v24);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v17, v18, v19, v20));
  objc_msgSend(v16, "postNotificationName:object:", CarShareETAInfoViewDidInteractWithShareETASuggestionNotification, self);

}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  id v4;
  MSPSharedTripContact *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id *v9;
  void *v10;
  MSPSharedTripContact *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  MSPSharedTripContact *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v4 = a3;
  v5 = self->_contact;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v7 = objc_msgSend(v6, "isSharingWithContact:", v5);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100B81180;
    v20[3] = &unk_1011E73E8;
    v21 = v4;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v8, "stopSharingWithContact:completion:", v5, v20);
    v9 = &v21;

    objc_destroyWeak(&v22);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100B811D4;
    v16 = &unk_1011E7410;
    v11 = v5;
    v17 = v11;
    v18 = v4;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v10, "startSharingWithContact:completion:", v11, &v13);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance", v13, v14, v15, v16, v17));
    objc_msgSend(v12, "provideFeedbackForContact:", v11);
    v9 = (id *)&v17;

    objc_destroyWeak(&v19);
  }

  objc_destroyWeak(&location);
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  -[CarShareETAInfoView _updateFooterContentWithSharingIdentity:](self, "_updateFooterContentWithSharingIdentity:", a4);
}

- (NSArray)preferredFocusEnvironments
{
  CarContentSizedTableView **p_shareETASuggestionTableView;
  CarFocusableButton *shareTripButton;
  CarContentSizedTableView *shareETASuggestionTableView;

  if (-[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion"))
  {
    shareETASuggestionTableView = self->_shareETASuggestionTableView;
    p_shareETASuggestionTableView = &shareETASuggestionTableView;
  }
  else
  {
    shareTripButton = self->_shareTripButton;
    p_shareETASuggestionTableView = (CarContentSizedTableView **)&shareTripButton;
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_shareETASuggestionTableView, 1));
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  CarFocusableButton *shareTripButton;

  if (-[CarShareETAInfoView _shouldShowETASuggestion](self, "_shouldShowETASuggestion"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_shareETASuggestionTableView, "_car_visibleCells"));
  }
  else
  {
    shareTripButton = self->_shareTripButton;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &shareTripButton, 1));
  }
  return (NSArray *)v3;
}

- (CarShareETAInfoViewDelegate)delegate
{
  return (CarShareETAInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapsInterruptionDisplay)interruptPresenter
{
  return (MapsInterruptionDisplay *)objc_loadWeakRetained((id *)&self->_interruptPresenter);
}

- (void)setInterruptPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_interruptPresenter, a3);
}

- (MSPSharedTripContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CarFocusableButton)shareTripButton
{
  return self->_shareTripButton;
}

- (void)setShareTripButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareTripButton, a3);
}

- (CarContentSizedTableView)shareETASuggestionTableView
{
  return self->_shareETASuggestionTableView;
}

- (void)setShareETASuggestionTableView:(id)a3
{
  objc_storeStrong((id *)&self->_shareETASuggestionTableView, a3);
}

- (CarShareTripFooterView)shareETASuggestionFooterView
{
  return self->_shareETASuggestionFooterView;
}

- (void)setShareETASuggestionFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_shareETASuggestionFooterView, a3);
}

- (NSLayoutConstraint)shareTripButtonBottomConstraint
{
  return self->_shareTripButtonBottomConstraint;
}

- (void)setShareTripButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shareTripButtonBottomConstraint, a3);
}

- (NSLayoutConstraint)shareTripContactSuggestionBottomConstraint
{
  return self->_shareTripContactSuggestionBottomConstraint;
}

- (void)setShareTripContactSuggestionBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_shareTripContactSuggestionBottomConstraint, a3);
}

- (GCDTimer)completionTimer
{
  return self->_completionTimer;
}

- (void)setCompletionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_completionTimer, a3);
}

- (BOOL)shareETACompleted
{
  return self->_shareETACompleted;
}

- (void)setShareETACompleted:(BOOL)a3
{
  self->_shareETACompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionTimer, 0);
  objc_storeStrong((id *)&self->_shareTripContactSuggestionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_shareTripButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_shareETASuggestionFooterView, 0);
  objc_storeStrong((id *)&self->_shareETASuggestionTableView, 0);
  objc_storeStrong((id *)&self->_shareTripButton, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_interruptPresenter);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
