@implementation HODataSyncingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  HODataSyncingTextView *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HODataSyncingViewController;
  -[HODataSyncingViewController viewDidLoad](&v12, "viewDidLoad");
  -[HODataSyncingViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init(HODataSyncingTextView);
  -[HODataSyncingViewController setTextView:](self, "setTextView:", v5);

  v6 = -[HODataSyncingViewController dataSyncState](self, "dataSyncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  objc_msgSend(v7, "setDataSyncState:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  objc_msgSend(v8, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createConstraintForTextView](self, "_createConstraintForTextView"));
  -[HODataSyncingViewController setTextViewConstraints:](self, "setTextViewConstraints:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textViewConstraints](self, "textViewConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  const __CFAllocator *Default;
  objc_super v10;
  SCNetworkReachabilityContext buf;

  v10.receiver = self;
  v10.super_class = (Class)HODataSyncingViewController;
  -[HODataSyncingViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = HFLogForCategory(70);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    LODWORD(buf.version) = 138412290;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", (uint8_t *)&buf, 0xCu);

  }
  if (!-[HODataSyncingViewController reachability](self, "reachability"))
  {
    Default = CFAllocatorGetDefault();
    self->_reachability = SCNetworkReachabilityCreateWithName(Default, "www.icloud.com");
    buf.version = 0;
    buf.info = self;
    buf.retain = (const void *(__cdecl *)(const void *))&CFRetain;
    buf.release = (void (__cdecl *)(const void *))&_CFRelease;
    buf.copyDescription = 0;
    SCNetworkReachabilitySetCallback(-[HODataSyncingViewController reachability](self, "reachability"), (SCNetworkReachabilityCallBack)sub_1000449FC, &buf);
    SCNetworkReachabilitySetDispatchQueue(-[HODataSyncingViewController reachability](self, "reachability"), (dispatch_queue_t)&_dispatch_main_q);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v9.receiver = self;
  v9.super_class = (Class)HODataSyncingViewController;
  -[HODataSyncingViewController viewWillDisappear:](&v9, "viewWillDisappear:", a3);
  v4 = HFLogForCategory(70);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);

  }
  if (-[HODataSyncingViewController reachability](self, "reachability"))
    CFRelease(-[HODataSyncingViewController reachability](self, "reachability"));
}

- (double)insetSize
{
  void *v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v4 = objc_msgSend(v3, "frame");
  v7 = HUViewSizeSubclassForViewSize(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  +[HOUtilities viewMarginInsetForViewSizeSubclass:withViewWidth:](HOUtilities, "viewMarginInsetForViewSizeSubclass:withViewWidth:", v7, CGRectGetWidth(v12));
  v10 = v9;

  return v10;
}

- (double)bottomPadding
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v3 = objc_msgSend(v2, "frame");
  +[HOUtilities buttonPaddingToViewBottomForViewSizeSubclass:](HOUtilities, "buttonPaddingToViewBottomForViewSizeSubclass:", HUViewSizeSubclassForViewSize(v3, v4, v5));
  v7 = v6;

  return v7;
}

- (void)setDataSyncState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
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
  uint64_t v36;
  NSObject *v37;
  __CFString *v38;
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

  if (self->_dataSyncState != a3)
  {
    self->_dataSyncState = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
    objc_msgSend(v5, "setDataSyncState:", a3);

    -[HODataSyncingViewController _removeLowerSectionControlsAndLabels](self, "_removeLowerSectionControlsAndLabels");
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
        -[HODataSyncingViewController _createAndAddResetLabelsIfNeeded](self, "_createAndAddResetLabelsIfNeeded");
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetSectionConstraints](self, "resetSectionConstraints"));

        if (!v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createResetSectionConstraints](self, "_createResetSectionConstraints"));
          -[HODataSyncingViewController setResetSectionConstraints:](self, "setResetSectionConstraints:", v7);

        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetSectionConstraints](self, "resetSectionConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
        v10 = v9;
        v11 = 1;
        goto LABEL_17;
      case 1uLL:
        goto LABEL_19;
      case 2uLL:
      case 6uLL:
        v12 = sub_10000D410(CFSTR("HODataSyncingButtonEnableKeychain"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createButtonWithString:](self, "_createButtonWithString:", v13));
        -[HODataSyncingViewController setEnableButton:](self, "setEnableButton:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
        objc_msgSend(v15, "addSubview:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createConstraintsForButton:includeBottomConstraint:](self, "_createConstraintsForButton:includeBottomConstraint:", v17, +[HFUtilities isAMac](HFUtilities, "isAMac") ^ 1));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

        if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
        {
          v19 = objc_alloc_init((Class)UIButton);
          -[HODataSyncingViewController setCancelButton:](self, "setCancelButton:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          objc_msgSend(v20, "addTarget:action:forControlEvents:", self, "_quit", 64);

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          v22 = sub_10000D410(CFSTR("HODataSyncingButtonQuit"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          objc_msgSend(v21, "setTitle:forState:", v23, 0);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          objc_msgSend(v24, "setTitleColor:forState:", v25, 0);

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          objc_msgSend(v26, "addSubview:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createConstraintsForButton:includeBottomConstraint:](self, "_createConstraintsForButton:includeBottomConstraint:", v28, 1));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController cancelButton](self, "cancelButton"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
          -[HODataSyncingViewController bottomPadding](self, "bottomPadding");
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33));
          v49 = v34;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

        }
        if (a3 == 6)
          -[HODataSyncingViewController startCDPRepair](self, "startCDPRepair");
        goto LABEL_19;
      case 3uLL:
        v38 = sub_10000D410(CFSTR("HODataSyncingButtonEnableiCloud"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createButtonWithString:](self, "_createButtonWithString:", v39));
        -[HODataSyncingViewController setEnableButton:](self, "setEnableButton:", v40);

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
        objc_msgSend(v41, "addSubview:", v42);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createConstraintsForButton:includeBottomConstraint:](self, "_createConstraintsForButton:includeBottomConstraint:", v43, 1));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

        goto LABEL_19;
      case 5uLL:
        -[HODataSyncingViewController _createAndAddResetLabelsIfNeeded](self, "_createAndAddResetLabelsIfNeeded");
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetSectionConstraints](self, "resetSectionConstraints"));

        if (!v45)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _createResetSectionConstraints](self, "_createResetSectionConstraints"));
          -[HODataSyncingViewController setResetSectionConstraints:](self, "setResetSectionConstraints:", v46);

        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetSectionConstraints](self, "resetSectionConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
        v10 = v9;
        v11 = 0;
LABEL_17:
        objc_msgSend(v9, "setHidden:", v11);
        goto LABEL_18;
      default:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unhandled dataSyncState %lu"), a3));
        v36 = HFLogForCategory(36);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_100078970((uint64_t)v10, v37);

        NSLog(CFSTR("%@"), v10);
LABEL_18:

LABEL_19:
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
        objc_msgSend(v48, "setNeedsLayout");

        break;
    }
  }
}

- (void)_removeLowerSectionControlsAndLabels
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController enableButton](self, "enableButton"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  objc_msgSend(v4, "removeFromSuperview");

}

- (id)_createConstraintForTextView
{
  void *v3;
  NSMutableArray *v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  -[NSMutableArray addObject:](v4, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  -[HODataSyncingViewController insetSize](self, "insetSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v13));
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  -[HODataSyncingViewController insetSize](self, "insetSize");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v18));
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController textView](self, "textView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 0, v21, 10, 0.4, 0.0));
  -[NSMutableArray addObject:](v4, "addObject:", v22);

  return v4;
}

- (id)_createButtonWithString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)HUColoredButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_enableButtonPressed:", 64);
  return v5;
}

- (id)_createConstraintsForButton:(id)a3 includeBottomConstraint:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  -[NSMutableArray addObject:](v7, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 288.0));
  -[NSMutableArray addObject:](v7, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 50.0));
  -[NSMutableArray addObject:](v7, "addObject:", v15);

  if (v4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _bottomPaddingConstraintForLowestView:](self, "_bottomPaddingConstraintForLowestView:", v6));
    -[NSMutableArray addObject:](v7, "addObject:", v16);

  }
  return v7;
}

- (id)_bottomPaddingConstraintForLowestView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  -[HODataSyncingViewController bottomPadding](self, "bottomPadding");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7, -v8));

  return v9;
}

- (id)_createResetSectionConstraints
{
  void *v3;
  NSMutableArray *v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  -[HODataSyncingViewController insetSize](self, "insetSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:constant:", v8));
  -[NSMutableArray addObject:](v4, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  -[HODataSyncingViewController insetSize](self, "insetSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v13));
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController _bottomPaddingConstraintForLowestView:](self, "_bottomPaddingConstraintForLowestView:", v20));
  -[NSMutableArray addObject:](v4, "addObject:", v21);

  return v4;
}

- (void)_createAndAddResetLabelsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[HODataSyncingViewController setResetNukeButton:](self, "setResetNukeButton:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleLabel"));
    objc_msgSend(v7, "setFont:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
    v9 = sub_10000D410(CFSTR("HODataSyncingButtonReset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setTitle:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleLabel"));
    objc_msgSend(v12, "setNumberOfLines:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleLabel"));
    objc_msgSend(v14, "setTextAlignment:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_resetButtonPressed:", 64);

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HODataSyncingViewController resetNukeButton](self, "resetNukeButton"));
  objc_msgSend(v17, "addSubview:", v16);

}

- (void)_enableButtonPressed:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = -[HODataSyncingViewController dataSyncState](self, "dataSyncState", a3);
  switch(v4)
  {
    case 2uLL:
      if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) != 0)
        v5 = objc_claimAutoreleasedReturnValue(+[NSURL hf_openiCloudPreferencesURL](NSURL, "hf_openiCloudPreferencesURL"));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[NSURL hf_openiCloudKeychainPreferences](NSURL, "hf_openiCloudKeychainPreferences"));
      v8 = (id)v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
      v7 = objc_msgSend(v6, "openURL:", v8);

      break;
    case 6uLL:
      -[HODataSyncingViewController startCDPRepair](self, "startCDPRepair");
      break;
    case 3uLL:
      -[HODataSyncingViewController _enableICloud](self, "_enableICloud");
      break;
  }
}

- (void)_enableICloud
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeManager"));

  objc_msgSend(v3, "updateiCloudSwitchState:completionHandler:", 1, &stru_1000B7EE0);
}

- (void)_quit
{
  -[HODataSyncingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &stru_1000B7F00);
}

- (void)_resetButtonPressed:(id)a3
{
  unsigned __int8 v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];

  v4 = -[HODataSyncingViewController iCloudURLIsReachable](self, "iCloudURLIsReachable", a3);
  v5 = sub_10000D410(CFSTR("HODataSyncingAlertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((v4 & 1) != 0)
  {
    v7 = sub_10000D410(CFSTR("HODataSyncingResetWithiCloud"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

    v10 = sub_10000D410(CFSTR("HODataSyncingButtonResetConfirmation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100045EE8;
    v22[3] = &unk_1000B6140;
    v22[4] = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 2, v22));
    objc_msgSend(v9, "addAction:", v12);

    v13 = sub_10000D410(CFSTR("HODataSyncingButtonAlertCancel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));
    objc_msgSend(v9, "addAction:", v15);

    -[HODataSyncingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    v16 = sub_10000D410(CFSTR("HODataSyncingResetBodyNetworkFailure"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v21 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v17, 1));

    v18 = sub_10000D410(CFSTR("HODataSyncingAlertOKButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, 0));
    objc_msgSend(v21, "addAction:", v20);

    -[HODataSyncingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
  }
}

- (void)_resetButtonConfirmed
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045F7C;
  v5[3] = &unk_1000B5C88;
  v5[4] = self;
  objc_msgSend(v4, "eraseHomeDataWithCompletionHandler:", v5);

}

- (void)startCDPRepair
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HODataSyncingViewController *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDPAccount sharedInstance](CDPAccount, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryAccountAltDSID"));

  v5 = objc_msgSend(objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext), "initWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName")));
  objc_msgSend(v5, "setFeatureName:", v8);

  objc_msgSend(v5, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
  objc_msgSend(v5, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  objc_msgSend(v5, "setPresentingViewController:", self);
  objc_msgSend(v5, "setSecurityUpgradeContext:", AKSecurityUpgradeContextGeneric);
  v9 = objc_msgSend(objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper), "initWithContext:", v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100046214;
  v11[3] = &unk_1000B7F28;
  v12 = v4;
  v13 = self;
  v10 = v4;
  objc_msgSend(v9, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v11);

}

- (void)_internalCyclePressed:(id)a3
{
  uint64_t v4;

  if (-[HODataSyncingViewController dataSyncState](self, "dataSyncState", a3) > 4)
    v4 = 2;
  else
    v4 = (uint64_t)-[HODataSyncingViewController dataSyncState](self, "dataSyncState") + 1;
  -[HODataSyncingViewController setDataSyncState:](self, "setDataSyncState:", v4);
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (HODataSyncingTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)iCloudURLIsReachable
{
  return self->_iCloudURLIsReachable;
}

- (void)setICloudURLIsReachable:(BOOL)a3
{
  self->_iCloudURLIsReachable = a3;
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  self->_reachability = a3;
}

- (UIButton)resetNukeButton
{
  return self->_resetNukeButton;
}

- (void)setResetNukeButton:(id)a3
{
  objc_storeStrong((id *)&self->_resetNukeButton, a3);
}

- (HUColoredButton)enableButton
{
  return self->_enableButton;
}

- (void)setEnableButton:(id)a3
{
  objc_storeStrong((id *)&self->_enableButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)internalTestCycleUI
{
  return self->_internalTestCycleUI;
}

- (void)setInternalTestCycleUI:(id)a3
{
  objc_storeStrong((id *)&self->_internalTestCycleUI, a3);
}

- (NSArray)textViewConstraints
{
  return self->_textViewConstraints;
}

- (void)setTextViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_textViewConstraints, a3);
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (NSArray)resetSectionConstraints
{
  return self->_resetSectionConstraints;
}

- (void)setResetSectionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_resetSectionConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetSectionConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_internalTestCycleUI, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_resetNukeButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
