@implementation CRLiOSSheetViewController

- (CRLiOSSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v5 = a3;
  v6 = a4;
  v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233AD8);
  v8 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v17 = v7;
    v18 = 2082;
    v19 = "-[CRLiOSSheetViewController initWithNibName:bundle:]";
    v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m";
    v22 = 1024;
    v23 = 24;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233AF8);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v17 = v7;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController initWithNibName:bundle:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 24, 0, "Do not call method");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSSheetViewController initWithNibName:bundle:]"));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (CRLiOSSheetViewController)initWithCoder:(id)a3
{
  id v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = a3;
  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233B18);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v14 = v4;
    v15 = 2082;
    v16 = "-[CRLiOSSheetViewController initWithCoder:]";
    v17 = 2082;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m";
    v19 = 1024;
    v20 = 29;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101233B38);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v8 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v14 = v4;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController initWithCoder:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 29, 0, "Do not call method");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSSheetViewController initWithCoder:]"));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (CRLiOSSheetViewController)initWithContentViewController:(id)a3
{
  id v5;
  CRLiOSSheetViewController *v6;
  CRLiOSSheetViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  v6 = -[CRLiOSSheetViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    -[CRLiOSSheetViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 4);
    -[CRLiOSSheetViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
    v7->_shouldStretchWidth = 1;
    -[CRLiOSSheetViewController addChildViewController:](v7, "addChildViewController:", v5);
    objc_storeStrong((id *)&v7->_contentViewController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  void *v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *maxWidthConstraint;
  double v18;
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
  double v36;
  double v37;
  void *v38;
  void *v39;
  UILayoutGuide *v40;
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
  UITapGestureRecognizer *v71;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v73;
  void *v74;
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController viewDidLoad](&v75, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v5, "addSubview:", v6);
  objc_storeStrong((id *)&self->_containerView, v5);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  -[CRLiOSSheetViewController inset](self, "inset");
  v8 = v7;
  v9 = objc_opt_new(NSMutableArray);
  if (self->_shouldStretchWidth)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    -[NSMutableArray addObject:](v9, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5, "widthAnchor"));
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
    maxWidthConstraint = self->_maxWidthConstraint;
    self->_maxWidthConstraint = v16;

    LODWORD(v18) = 1145569280;
    -[NSLayoutConstraint setPriority:](self->_maxWidthConstraint, "setPriority:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, v8));
    -[NSMutableArray addObject:](v9, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v23, v8));
    -[NSMutableArray addObject:](v9, "addObject:", v24);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v5, "centerXAnchor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  }
  v25 = (void *)v14;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14, 17));
  -[NSMutableArray addObject:](v9, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  -[NSMutableArray addObject:](v9, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  -[NSMutableArray addObject:](v9, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
  v74 = v3;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  -[NSMutableArray addObject:](v9, "addObject:", v35);

  -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", v37));
  -[NSMutableArray addObject:](v9, "addObject:", v39);

  v40 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v40, "setIdentifier:", CFSTR("containerViewLayoutGuide"));
  -[UIView addLayoutGuide:](v5, "addLayoutGuide:", v40);
  if (self->_cancelButton)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
    -[UIButton setBackgroundColor:](self->_cancelButton, "setBackgroundColor:", v41);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_cancelButton);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_cancelButton, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 8.0));
    -[NSMutableArray addObject:](v9, "addObject:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_cancelButton, "heightAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", 57.0));
    -[NSMutableArray addObject:](v9, "addObject:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_cancelButton, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
    -[NSMutableArray addObject:](v9, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_cancelButton, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
    -[NSMutableArray addObject:](v9, "addObject:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v5, "safeAreaLayoutGuide"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_cancelButton, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, v8));
    -[NSMutableArray addObject:](v9, "addObject:", v56);

  }
  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
    -[NSMutableArray addObject:](v9, "addObject:", v59);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
    -[NSMutableArray addObject:](v9, "addObject:", v55);
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v40, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  -[NSMutableArray addObject:](v9, "addObject:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v40, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
  -[NSMutableArray addObject:](v9, "addObject:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v40, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
  -[NSMutableArray addObject:](v9, "addObject:", v68);

  if (!*((_BYTE *)&self->super.super.super.isa + v73))
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v69, "setCornerRadius:", 14.0);
    objc_msgSend(v69, "setMasksToBounds:", 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_cancelButton, "layer"));
    objc_msgSend(v70, "setCornerRadius:", 14.0);
    objc_msgSend(v70, "setMasksToBounds:", 1);

  }
  if (self->_shouldTouchesOutsideCancel)
  {
    v71 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "didTapUsingGestureRecognizer:");
    -[UITapGestureRecognizer setDelegate:](v71, "setDelegate:", self);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v71, "setCancelsTouchesInView:", 0);
    objc_msgSend(v74, "addGestureRecognizer:", v71);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v71;

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)viewDidDisappear:(BOOL)a3
{
  id cancelHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = 0;

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  if (self->_maxWidthConstraint)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

    if (v4)
    {
      objc_msgSend(v4, "bounds");
      if (v5 >= v6)
        v7 = v6;
      else
        v7 = v5;
      -[CRLiOSSheetViewController inset](self, "inset");
      -[NSLayoutConstraint setConstant:](self->_maxWidthConstraint, "setConstant:", v7 + v8 * -2.0);
    }
    -[NSLayoutConstraint setActive:](self->_maxWidthConstraint, "setActive:", v4 != 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController updateViewConstraints](&v9, "updateViewConstraints");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)setShouldTouchesOutsideCancel:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[CRLiOSSheetViewController isViewLoaded](self, "isViewLoaded"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233B58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3CD8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233B78);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController setShouldTouchesOutsideCancel:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 177, 0, "Can't set shouldTouchesOutsideCancel after loading the view");

  }
  self->_shouldTouchesOutsideCancel = a3;
}

- (void)didTapUsingGestureRecognizer:(id)a3
{
  -[CRLiOSSheetViewController didCancel](self, "didCancel", a3);
}

- (void)setShouldStretchWidth:(BOOL)a3
{
  id v4;

  self->_shouldStretchWidth = a3;
  if (-[CRLiOSSheetViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)addCancelButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *cancelButton;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[CRLiOSSheetViewController isViewLoaded](self, "isViewLoaded"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233B98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3DD8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233BB8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController addCancelButtonWithTitle:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 194, 0, "Can't add a cancel button after loading the view");

  }
  if (self->_cancelButton)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233BD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3D58();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233BF8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController addCancelButtonWithTitle:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 195, 0, "Can't have more than one cancel button");

  }
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  -[UIButton setTitle:forState:](self->_cancelButton, "setTitle:forState:", v4, 0);
  -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "didCancel", 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 21.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_cancelButton, "titleLabel"));
  objc_msgSend(v14, "setFont:", v13);

}

- (void)didCancel
{
  void (**cancelHandler)(id);

  cancelHandler = (void (**)(id))self->_cancelHandler;
  if (cancelHandler)
    cancelHandler[2](self->_cancelHandler);
  else
    -[CRLiOSSheetViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (double)inset
{
  return 10.0;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v6 = a4;
  if (qword_10147E3B0 != -1)
    dispatch_once(&qword_10147E3B0, &stru_101233C18);
  v7 = off_1013D90B0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    sub_100DF3F08(self, v4, v7);

  if (qword_10147E3B0 != -1)
    dispatch_once(&qword_10147E3B0, &stru_101233C38);
  v8 = off_1013D90B0;
  if (os_log_type_enabled((os_log_t)off_1013D90B0, OS_LOG_TYPE_DEBUG))
    sub_100DF3E58((uint64_t)self, v8);
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  -[CRLiOSSheetViewController dismissViewControllerAnimated:completion:](&v9, "dismissViewControllerAnimated:completion:", v4, v6);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  void *v6;
  void *v7;

  if (self->_tapGestureRecognizer != a3)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
  v4 = v6 == v7;

  return v4;
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CRLiOSSheetViewController *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CRLiOSSheetViewController *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSSheetViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(v5, "layoutIfNeeded");
  -[UIView frame](self->_containerView, "frame");
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v11 = CGRectGetHeight(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectOffset(v35, 0.0, v11);
  v12 = v36.origin.x;
  v13 = v36.origin.y;
  v14 = v36.size.width;
  v15 = v36.size.height;
  v16 = (CRLiOSSheetViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));

  if (v16 == self)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v5, "setBackgroundColor:", v18);

    -[UIView setFrame:](self->_containerView, "setFrame:", v12, v13, v14, v15);
    v15 = height;
    v14 = width;
    v13 = y;
    v12 = x;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  -[CRLiOSSheetViewController transitionDuration:](self, "transitionDuration:", v4);
  v20 = v19;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000AD7CC;
  v26[3] = &unk_101233C60;
  v27 = v5;
  v28 = v17;
  v29 = self;
  v30 = v12;
  v31 = v13;
  v32 = v14;
  v33 = v15;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000AD808;
  v24[3] = &unk_10122F780;
  v25 = v4;
  v21 = v4;
  v22 = v17;
  v23 = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, v24, v20);

}

- (BOOL)shouldTouchesOutsideCancel
{
  return self->_shouldTouchesOutsideCancel;
}

- (BOOL)shouldStretchWidth
{
  return self->_shouldStretchWidth;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
}

@end
