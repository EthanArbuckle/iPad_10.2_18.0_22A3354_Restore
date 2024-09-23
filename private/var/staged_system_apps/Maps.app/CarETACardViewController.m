@implementation CarETACardViewController

- (CarETACardViewController)initWithDataSource:(id)a3 delegate:(id)a4 interruptPresenter:(id)a5 canExpand:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  CarETACardViewController *v13;
  CarETACardViewController *v14;
  void *v15;
  double v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CarETACardViewController;
  v13 = -[CarETACardViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_dataSource, v10);
    objc_storeWeak((id *)&v14->_delegate, v11);
    v14->_sharingButtonHidden = 1;
    v14->_canExpand = a6;
    objc_storeWeak((id *)&v14->_interruptPresenter, v12);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](v14, "view"));
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 1, v16);

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarETACardViewController;
  -[CarETACardViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarETACard"));

  if (-[CarETACardViewController hasArrived](self, "hasArrived"))
    v4 = objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaSign](self, "etaSign"));
  v5 = (void *)v4;
  -[CarETACardViewController setCurrentSign:](self, "setCurrentSign:", v4);

}

- (BOOL)isShowingShareETASuggestion
{
  return -[CarETAInfoSign isShowingShareETASuggestion](self->_etaCollapsedSign, "isShowingShareETASuggestion");
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  const __CFString *v17;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_expanded == v6)
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    v10 = v6 && self->_canExpand;
    self->_expanded = v10;
    if (-[CarETACardViewController hasArrived](self, "hasArrived"))
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
    }
    else
    {
      v12 = sub_10043364C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("collapsing");
        if (v6)
          v14 = CFSTR("expanding");
        v16 = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "etaCardVC: %@ tray", (uint8_t *)&v16, 0xCu);
      }

      v11 = objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaSign](self, "etaSign"));
    }
    v15 = (void *)v11;
    -[CarETACardViewController setCurrentSign:animated:completion:](self, "setCurrentSign:animated:completion:", v11, v5, v9);

  }
}

- (void)setCurrentSign:(id)a3
{
  -[CarETACardViewController setCurrentSign:animated:completion:](self, "setCurrentSign:animated:completion:", a3, 0, 0);
}

- (void)setCurrentSign:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  CarETACardSign *v9;
  void (**v10)(id, uint64_t);
  CarETACardSign **p_currentSign;
  void *v12;
  id v13;
  void *v14;
  CarETACardSign *v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  CarETACardSign *v24;
  void *v25;
  CarETACardSign *v26;
  CarETACardSign *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CarETACardSign *v34;
  void *v35;
  NSArray *v36;
  NSArray *currentSignTopAndSideConstraints;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *currentSignBottomConstraint;
  void *v43;
  double v44;
  void *v45;
  CarETACardSign *v46;
  id v47;
  NSObject *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  id obj;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  void *v59;
  void *v60;
  CarETACardSign *v61;
  void (**v62)(id, uint64_t);
  CarETACardSign *v63;
  _QWORD v64[4];
  CarETACardSign *v65;
  CarETACardViewController *v66;
  void (**v67)(id, uint64_t);
  _QWORD v68[4];
  CarETACardSign *v69;
  CarETACardSign *v70;
  CarETACardViewController *v71;
  _QWORD v72[3];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;

  v6 = a4;
  v9 = (CarETACardSign *)a3;
  v10 = (void (**)(id, uint64_t))a5;
  p_currentSign = &self->_currentSign;
  if (self->_currentSign == v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController signAnimationQueue](self, "signAnimationQueue"));
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      if (!v10)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController signAnimationQueue](self, "signAnimationQueue"));
    v15 = (CarETACardSign *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

    if (v15 == v9)
    {
      if (!v10)
        goto LABEL_22;
      v47 = sub_10043364C();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = (objc_class *)objc_opt_class(v9);
        v50 = NSStringFromClass(v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        *(_DWORD *)buf = 138412290;
        v74 = v51;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "etaCardVC: ignoring update to: %@ as it is already queued", buf, 0xCu);

      }
LABEL_21:
      v10[2](v10, 1);
      goto LABEL_22;
    }
  }
  v62 = v10;
  v16 = sub_10043364C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class(v9);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (objc_class *)objc_opt_class(*p_currentSign);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *(_DWORD *)buf = 138412546;
    v74 = v20;
    v75 = 2112;
    v76 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "etaCardVC: setting currentSign with class: %@, previous sign class: %@", buf, 0x16u);

  }
  obj = a3;
  v53 = v6;

  v63 = v9;
  v24 = v9;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController signAnimationQueue](self, "signAnimationQueue"));
  v26 = (CarETACardSign *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));
  v27 = v26;
  if (!v26)
    v27 = *p_currentSign;
  v61 = v27;

  -[CarETACardViewController setIncomingSign:](self, "setIncomingSign:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", v24);

  v58 = self->_currentSignBottomConstraint;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardSign topAnchor](v24, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v57));
  v72[0] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardSign leadingAnchor](v24, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v29));
  v72[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardSign trailingAnchor](v24, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = v24;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  v72[2] = v35;
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 3));
  currentSignTopAndSideConstraints = self->_currentSignTopAndSideConstraints;
  self->_currentSignTopAndSideConstraints = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardSign bottomAnchor](v34, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v40));
  currentSignBottomConstraint = self->_currentSignBottomConstraint;
  self->_currentSignBottomConstraint = v41;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_currentSignTopAndSideConstraints);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController view](self, "view"));
  objc_msgSend(v43, "layoutIfNeeded");

  -[NSLayoutConstraint setActive:](v58, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_currentSignBottomConstraint, "setActive:", 1);
  if (self->_currentSign)
  {
    v44 = 0.0;
    -[CarETACardSign setAlpha:](v34, "setAlpha:", 0.0, obj);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController signAnimationQueue](self, "signAnimationQueue"));
    objc_msgSend(v45, "addObject:", v34);

    if (v53)
      v44 = 0.5;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100A8EEBC;
    v68[3] = &unk_1011AD238;
    v69 = v34;
    v70 = v61;
    v71 = self;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100A8EF30;
    v64[3] = &unk_1011BF400;
    v65 = v70;
    v66 = self;
    v10 = v62;
    v67 = v62;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v68, v64, v44, 0.0, 0.800000012, 0.100000001);

    v46 = v61;
  }
  else
  {
    objc_storeStrong((id *)&self->_currentSign, obj);
    -[CarETACardViewController setIncomingSign:](self, "setIncomingSign:", 0);
    v46 = v61;
    v10 = v62;
    if (v62)
      v62[2](v62, 1);
  }

  v9 = v63;
LABEL_22:

}

- (CarETACardSign)etaSign
{
  void *v3;

  if (-[CarETACardViewController isExpanded](self, "isExpanded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaExpandedSign](self, "etaExpandedSign"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaCollapsedSign](self, "etaCollapsedSign"));
  return (CarETACardSign *)v3;
}

- (CarETAInfoSign)etaCollapsedSign
{
  CarETAInfoSign *etaCollapsedSign;
  CarETAInfoSign *v4;
  id WeakRetained;
  id v6;
  CarETAInfoSign *v7;
  CarETAInfoSign *v8;

  etaCollapsedSign = self->_etaCollapsedSign;
  if (!etaCollapsedSign)
  {
    v4 = [CarETAInfoSign alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_loadWeakRetained((id *)&self->_interruptPresenter);
    v7 = -[CarETAInfoSign initWithDelegate:interruptPresenter:canExpand:](v4, "initWithDelegate:interruptPresenter:canExpand:", WeakRetained, v6, self->_canExpand);
    v8 = self->_etaCollapsedSign;
    self->_etaCollapsedSign = v7;

    -[CarETAInfoSign setTranslatesAutoresizingMaskIntoConstraints:](self->_etaCollapsedSign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarETAInfoSign setLatestETA:](self->_etaCollapsedSign, "setLatestETA:", self->_latestETA);
    -[CarETAInfoSign setShareButtonHidden:](self->_etaCollapsedSign, "setShareButtonHidden:", self->_sharingButtonHidden);
    etaCollapsedSign = self->_etaCollapsedSign;
  }
  return etaCollapsedSign;
}

- (CarETAExpandedSign)etaExpandedSign
{
  CarETAExpandedSign *etaExpandedSign;
  CarETAExpandedSign *v4;
  id WeakRetained;
  id v6;
  CarETAExpandedSign *v7;
  CarETAExpandedSign *v8;

  etaExpandedSign = self->_etaExpandedSign;
  if (!etaExpandedSign)
  {
    v4 = [CarETAExpandedSign alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = -[CarETAExpandedSign initWithDataSource:delegate:](v4, "initWithDataSource:delegate:", WeakRetained, v6);
    v8 = self->_etaExpandedSign;
    self->_etaExpandedSign = v7;

    -[CarETAExpandedSign setTranslatesAutoresizingMaskIntoConstraints:](self->_etaExpandedSign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarETAExpandedSign setLatestETA:](self->_etaExpandedSign, "setLatestETA:", self->_latestETA);
    etaExpandedSign = self->_etaExpandedSign;
  }
  return etaExpandedSign;
}

- (CarETAArrivedSign)arrivedSign
{
  CarETAArrivedSign *arrivedSign;
  CarETAArrivedSign *v4;
  id WeakRetained;
  id v6;
  CarETAArrivedSign *v7;
  CarETAArrivedSign *v8;

  arrivedSign = self->_arrivedSign;
  if (!arrivedSign)
  {
    v4 = [CarETAArrivedSign alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    v7 = -[CarETAArrivedSign initWithDelegate:dataSource:](v4, "initWithDelegate:dataSource:", WeakRetained, v6);
    v8 = self->_arrivedSign;
    self->_arrivedSign = v7;

    -[CarETAArrivedSign setTranslatesAutoresizingMaskIntoConstraints:](self->_arrivedSign, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    arrivedSign = self->_arrivedSign;
  }
  return arrivedSign;
}

- (NSMutableArray)signAnimationQueue
{
  NSMutableArray *signAnimationQueue;
  NSMutableArray *v4;
  NSMutableArray *v5;

  signAnimationQueue = self->_signAnimationQueue;
  if (!signAnimationQueue)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = self->_signAnimationQueue;
    self->_signAnimationQueue = v4;

    signAnimationQueue = self->_signAnimationQueue;
  }
  return signAnimationQueue;
}

- (void)setIncomingSign:(id)a3
{
  CarETACardSign *v5;
  CarETACardSign **p_incomingSign;
  id v7;
  NSObject *v8;
  int v9;
  CarETACardSign *v10;

  v5 = (CarETACardSign *)a3;
  p_incomingSign = &self->_incomingSign;
  if (*p_incomingSign != v5)
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "etaCardVC: incoming sign is now %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)p_incomingSign, a3);
  }

}

- (void)updateContent
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  -[CarETACardViewController updateArrivalState:](self, "updateArrivalState:", objc_msgSend(v3, "arrivalState"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaCollapsedSign](self, "etaCollapsedSign"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharingButtonTitle"));
  objc_msgSend(v4, "setTitleForShareTripButton:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaCollapsedSign](self, "etaCollapsedSign"));
  v8 = objc_loadWeakRetained((id *)&self->_dataSource);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactSharingSuggestion"));
  objc_msgSend(v7, "setContactSharingSuggestion:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaCollapsedSign](self, "etaCollapsedSign"));
  objc_msgSend(v10, "updateContent");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaExpandedSign](self, "etaExpandedSign"));
  objc_msgSend(v11, "updateContent");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
  objc_msgSend(v12, "updateContent");

}

- (void)setSharingButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CarETAInfoSign *etaCollapsedSign;
  CarETAInfoSign *v7;

  if (self->_sharingButtonHidden != a3)
  {
    v4 = a3;
    self->_sharingButtonHidden = a3;
    etaCollapsedSign = self->_etaCollapsedSign;
    if (a4)
    {
      v7 = (CarETAInfoSign *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController currentSign](self, "currentSign"));
      -[CarETAInfoSign setShareButtonHidden:animated:](etaCollapsedSign, "setShareButtonHidden:animated:", v4, v7 == self->_etaCollapsedSign);

    }
    else
    {
      -[CarETAInfoSign setShareButtonHidden:animated:](self->_etaCollapsedSign, "setShareButtonHidden:animated:", a3, 0);
    }
  }
}

- (void)_didArrive
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[CarETACardViewController setArrived:](self, "setArrived:", 1);
  if (-[CarETACardViewController isExpanded](self, "isExpanded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController currentSign](self, "currentSign"));
    objc_msgSend(WeakRetained, "etaCardSign:didSelectAction:", v4, 0);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
  -[CarETACardViewController setCurrentSign:animated:completion:](self, "setCurrentSign:animated:completion:", v5, -[CarETACardViewController isViewLoaded](self, "isViewLoaded"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
  v7 = objc_msgSend(v6, "state");

  if (v7 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = v8;
    v9 = 295;
  }
  else
  {
    if (v7 != (id)1)
      return;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = v8;
    v9 = 296;
  }
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v9, 1001, 0);

}

- (NSArray)focusOrderSubItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController currentSign](self, "currentSign"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "focusOrderSubItems"));

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController currentSign](self, "currentSign"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredFocusEnvironments"));

  return (NSArray *)v3;
}

- (void)setETA:(id)a3
{
  GuidanceETA *v5;
  GuidanceETA **p_latestETA;
  GuidanceETA *v7;

  v5 = (GuidanceETA *)a3;
  p_latestETA = &self->_latestETA;
  if (self->_latestETA != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    -[CarETAInfoSign setLatestETA:](self->_etaCollapsedSign, "setLatestETA:", *p_latestETA);
    -[CarETAExpandedSign setLatestETA:](self->_etaExpandedSign, "setLatestETA:", *p_latestETA);
    v5 = v7;
  }

}

- (void)updateArrivalState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_10064BC50(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v18 = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "etaCardVC: updateArrivalState: %@", (uint8_t *)&v18, 0xCu);

  }
  if (a3 <= 5)
  {
    if (((1 << a3) & 3) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
      objc_msgSend(v15, "setState:", 0);

      -[CarETACardViewController setArrived:](self, "setArrived:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController etaSign](self, "etaSign"));
      -[CarETACardViewController setCurrentSign:animated:completion:](self, "setCurrentSign:animated:completion:", v12, -[CarETACardViewController isViewLoaded](self, "isViewLoaded"), 0);
    }
    else
    {
      if (((1 << a3) & 0x14) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
        objc_msgSend(v16, "setState:", 0);

        -[CarETACardViewController _didArrive](self, "_didArrive");
        return;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v10 = objc_msgSend(v9, "isArrivedAtEVCharger");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrivalChargingStationInfo"));

      if (v10)
      {
        objc_msgSend(v12, "chargingTime");
        if (v13 <= 0.0)
          v14 = 1;
        else
          v14 = 2;
      }
      else
      {
        v14 = 1;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarETACardViewController arrivedSign](self, "arrivedSign"));
      objc_msgSend(v17, "setState:", v14);

      -[CarETACardViewController _didArrive](self, "_didArrive");
    }

  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CarETACardSign)currentSign
{
  return self->_currentSign;
}

- (CarETACardSign)incomingSign
{
  return self->_incomingSign;
}

- (void)setSignAnimationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_signAnimationQueue, a3);
}

- (void)setEtaCollapsedSign:(id)a3
{
  objc_storeStrong((id *)&self->_etaCollapsedSign, a3);
}

- (void)setEtaExpandedSign:(id)a3
{
  objc_storeStrong((id *)&self->_etaExpandedSign, a3);
}

- (void)setArrivedSign:(id)a3
{
  objc_storeStrong((id *)&self->_arrivedSign, a3);
}

- (BOOL)isSharingButtonHidden
{
  return self->_sharingButtonHidden;
}

- (void)setSharingButtonHidden:(BOOL)a3
{
  self->_sharingButtonHidden = a3;
}

- (BOOL)hasArrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  self->_arrived = a3;
}

- (BOOL)canExpand
{
  return self->_canExpand;
}

- (void)setCanExpand:(BOOL)a3
{
  self->_canExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedSign, 0);
  objc_storeStrong((id *)&self->_etaExpandedSign, 0);
  objc_storeStrong((id *)&self->_etaCollapsedSign, 0);
  objc_storeStrong((id *)&self->_signAnimationQueue, 0);
  objc_storeStrong((id *)&self->_incomingSign, 0);
  objc_storeStrong((id *)&self->_currentSign, 0);
  objc_storeStrong((id *)&self->_currentSignBottomConstraint, 0);
  objc_storeStrong((id *)&self->_currentSignTopAndSideConstraints, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_destroyWeak((id *)&self->_interruptPresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
