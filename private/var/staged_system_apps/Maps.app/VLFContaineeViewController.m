@implementation VLFContaineeViewController

- (VLFContaineeViewController)init
{
  VLFContaineeViewController *result;

  result = (VLFContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  VLFContaineeViewController *result;

  v5 = a3;
  v6 = a4;
  result = (VLFContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithCoder:(id)a3
{
  id v3;
  VLFContaineeViewController *result;

  v3 = a3;
  result = (VLFContaineeViewController *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("MethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (VLFContaineeViewController)initWithEntryPoint:(int64_t)a3
{
  VLFContaineeViewController *v4;
  ContainerHeaderView *v5;
  ContainerHeaderView *titleHeaderView;
  id v7;
  double y;
  double width;
  double height;
  UIView *v11;
  UIView *scanningContainerView;
  VLFScanningInstructionView *v13;
  VLFScanningInstructionView *instructionView;
  VLFScanningAnimationView *v15;
  VLFScanningAnimationView *scanningAnimationView;
  VLFFailureView *v17;
  VLFFailureView *failureView;
  void *v19;
  void *v20;
  VLFSession *v21;
  VLFSession *vlfSession;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VLFContaineeViewController;
  v4 = -[VLFContaineeViewController initWithNibName:bundle:](&v24, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
    titleHeaderView = v4->_titleHeaderView;
    v4->_titleHeaderView = v5;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setPreservesSuperviewLayoutMargins:](v4->_titleHeaderView, "setPreservesSuperviewLayoutMargins:", 1);
    -[ContainerHeaderView setHairLineAlpha:](v4->_titleHeaderView, "setHairLineAlpha:", 0.0);
    -[ContainerHeaderView setHeaderSize:](v4->_titleHeaderView, "setHeaderSize:", 0);
    -[ContainerHeaderView setDelegate:](v4->_titleHeaderView, "setDelegate:", v4);
    v7 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UIView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    scanningContainerView = v4->_scanningContainerView;
    v4->_scanningContainerView = v11;

    -[UIView setUserInteractionEnabled:](v4->_scanningContainerView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_scanningContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = -[VLFScanningInstructionView initWithLayout:]([VLFScanningInstructionView alloc], "initWithLayout:", 2);
    instructionView = v4->_instructionView;
    v4->_instructionView = v13;

    -[VLFScanningInstructionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_instructionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = -[VLFScanningAnimationView initWithFrame:]([VLFScanningAnimationView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    scanningAnimationView = v4->_scanningAnimationView;
    v4->_scanningAnimationView = v15;

    -[VLFScanningAnimationView setTranslatesAutoresizingMaskIntoConstraints:](v4->_scanningAnimationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = -[VLFFailureView initWithFrame:]([VLFFailureView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    failureView = v4->_failureView;
    v4->_failureView = v17;

    -[VLFFailureView setTranslatesAutoresizingMaskIntoConstraints:](v4->_failureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VLFFailureView setAlpha:](v4->_failureView, "setAlpha:", 0.0);
    -[VLFFailureView setDelegate:](v4->_failureView, "setDelegate:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v19, "setHideGrabber:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v20, "setAllowsSwipeToDismiss:", 0);

    v21 = -[VLFSession initWithMode:]([VLFSession alloc], "initWithMode:", 1);
    vlfSession = v4->_vlfSession;
    v4->_vlfSession = v21;

    -[VLFSession setEntryPoint:](v4->_vlfSession, "setEntryPoint:", a3);
    -[VLFSession setDelegate:](v4->_vlfSession, "setDelegate:", v4);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  objc_msgSend(v3, "stop");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", off_1014BB950, self);

  v5.receiver = self;
  v5.super_class = (Class)VLFContaineeViewController;
  -[VLFContaineeViewController dealloc](&v5, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
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
  void *v14;
  void *v15;
  void *v16;
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
  NSLayoutConstraint *v28;
  NSLayoutConstraint *instructionViewLeadingConstraint;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *instructionViewTrailingConstraint;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *instructionViewFirstBaselineConstraint;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *instructionViewTopConstraint;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *scanningAnimationViewTopConstraintPortrait;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *scanningAnimationViewFlexibleTopConstraintPortrait;
  void *v52;
  void *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *scanningAnimationViewBottomConstraint;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSLayoutConstraint *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSLayoutConstraint *v70;
  NSLayoutConstraint *failureViewBottomConstraint;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
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
  objc_super v103;
  _QWORD v104[4];
  _QWORD v105[5];
  _QWORD v106[3];
  _QWORD v107[4];
  _QWORD v108[3];

  v103.receiver = self;
  v103.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v103, "viewDidLoad");
  -[VLFContaineeViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setMaskedCorners:", 3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setMasksToBounds:", 1);

  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_titleHeaderView);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v93));
  v108[0] = v90;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v108[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v108[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 3));
  objc_msgSend(v102, "addObjectsFromArray:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  objc_msgSend(v17, "addSubview:", self->_scanningContainerView);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_scanningContainerView, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v94));
  v107[0] = v91;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_scanningContainerView, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v84));
  v107[1] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_scanningContainerView, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v19));
  v107[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_scanningContainerView, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v107[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 4));
  objc_msgSend(v102, "addObjectsFromArray:", v25);

  -[UIView addSubview:](self->_scanningContainerView, "addSubview:", self->_instructionView);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView leadingAnchor](self->_instructionView, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_scanningContainerView, "leadingAnchor"));
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 28.0));
  instructionViewLeadingConstraint = self->_instructionViewLeadingConstraint;
  self->_instructionViewLeadingConstraint = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView trailingAnchor](self->_instructionView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_scanningContainerView, "trailingAnchor"));
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -52.0));
  instructionViewTrailingConstraint = self->_instructionViewTrailingConstraint;
  self->_instructionViewTrailingConstraint = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView firstBaselineAnchor](self->_instructionView, "firstBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_scanningContainerView, "topAnchor"));
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 48.0));
  instructionViewFirstBaselineConstraint = self->_instructionViewFirstBaselineConstraint;
  self->_instructionViewFirstBaselineConstraint = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView topAnchor](self->_instructionView, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_scanningContainerView, "topAnchor"));
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 21.0));
  instructionViewTopConstraint = self->_instructionViewTopConstraint;
  self->_instructionViewTopConstraint = v40;

  v42 = self->_instructionViewTrailingConstraint;
  v106[0] = self->_instructionViewLeadingConstraint;
  v106[1] = v42;
  v106[2] = self->_instructionViewFirstBaselineConstraint;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 3));
  objc_msgSend(v102, "addObjectsFromArray:", v43);

  -[UIView addSubview:](self->_scanningContainerView, "addSubview:", self->_scanningAnimationView);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView topAnchor](self->_scanningAnimationView, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView lastBaselineAnchor](self->_instructionView, "lastBaselineAnchor"));
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  scanningAnimationViewTopConstraintPortrait = self->_scanningAnimationViewTopConstraintPortrait;
  self->_scanningAnimationViewTopConstraintPortrait = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView topAnchor](self->_scanningAnimationView, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView lastBaselineAnchor](self->_instructionView, "lastBaselineAnchor"));
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49));
  scanningAnimationViewFlexibleTopConstraintPortrait = self->_scanningAnimationViewFlexibleTopConstraintPortrait;
  self->_scanningAnimationViewFlexibleTopConstraintPortrait = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView bottomAnchor](self->_scanningAnimationView, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_scanningContainerView, "bottomAnchor"));
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  scanningAnimationViewBottomConstraint = self->_scanningAnimationViewBottomConstraint;
  self->_scanningAnimationViewBottomConstraint = v54;

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView leadingAnchor](self->_scanningAnimationView, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_scanningContainerView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v56));
  v105[0] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView trailingAnchor](self->_scanningAnimationView, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_scanningContainerView, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  v61 = self->_scanningAnimationViewTopConstraintPortrait;
  v105[1] = v60;
  v105[2] = v61;
  v105[3] = self->_scanningAnimationViewBottomConstraint;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView heightAnchor](self->_scanningAnimationView, "heightAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView widthAnchor](self->_scanningAnimationView, "widthAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:multiplier:constant:", v63, 0.565333307, 0.0));
  v105[4] = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 5));
  objc_msgSend(v102, "addObjectsFromArray:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  objc_msgSend(v66, "addSubview:", self->_failureView);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView bottomAnchor](self->_failureView, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bottomAnchor"));
  v70 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v69));
  failureViewBottomConstraint = self->_failureViewBottomConstraint;
  self->_failureViewBottomConstraint = v70;

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView leadingAnchor](self->_failureView, "leadingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v92));
  v104[0] = v89;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView trailingAnchor](self->_failureView, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v72));
  v104[1] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[VLFFailureView topAnchor](self->_failureView, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v76));
  v78 = self->_failureViewBottomConstraint;
  v104[2] = v77;
  v104[3] = v78;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 4));
  objc_msgSend(v102, "addObjectsFromArray:", v79);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v102);
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView fontProvider](self->_instructionView, "fontProvider"));
  objc_msgSend(v80, "addFontObserver:", self->_failureView);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  objc_msgSend(v81, "layoutIfNeeded");

}

- (void)willResignCurrent:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController willResignCurrent:](&v9, "willResignCurrent:", a3);
  v4 = sub_100BF8E04();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will resign current", v8, 2u);
  }

  -[VLFContaineeViewController setStateManager:](self, "setStateManager:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  objc_msgSend(v6, "stop");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", off_1014BB950, self);

}

- (void)willBecomeCurrent:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController willBecomeCurrent:](&v8, "willBecomeCurrent:", a3);
  v4 = sub_100BF8E04();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will become current", v7, 2u);
  }

  -[VLFContaineeViewController _startVLFSession](self, "_startVLFSession");
  -[VLFContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", off_1014BB958, self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLFContaineeViewController;
  -[VLFContaineeViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionView](self, "instructionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "removeAllAnimations");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationView](self, "scanningAnimationView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "removeAllAnimations");

  -[VLFContaineeViewController _hideFailureWithCompletion:](self, "_hideFailureWithCompletion:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v3, "containeeLayout");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", objc_msgSend(v5, "containeeLayout"));

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VLFContaineeViewController;
  -[MapsThemeViewController traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  -[VLFContaineeViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController traitCollection](self, "traitCollection"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v10 = objc_msgSend(v9, "containeeLayout");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", objc_msgSend(v11, "containeeLayout"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      objc_msgSend(v12, "layoutIfNeeded");

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v13, "updateHeightForCurrentLayout");

    }
  }

}

- (double)heightForLayout:(unint64_t)a3
{
  double v5;
  void *v6;
  double v7;
  unsigned int v8;
  const CGSize *v9;
  double height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = -1.0;
  if (a3 == 4 || a3 == 2)
  {
    -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", a3);
    if (a3 == 2)
    {
      v8 = -[VLFContaineeViewController isFailureVisible](self, "isFailureVisible");
      v9 = &UILayoutFittingCompressedSize;
      if (!v8)
        v9 = &UILayoutFittingExpandedSize;
      height = v9->height;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      objc_msgSend(v11, "frame");
      v13 = v12;
      LODWORD(v12) = 1148846080;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, height, v12, v14);
      v5 = v15;

      goto LABEL_9;
    }
    if (a3 == 4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v6, "availableHeight");
      v5 = v7;
LABEL_9:

    }
  }
  return v5;
}

- (void)didChangeLayout:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  unint64_t v9;

  v7.receiver = self;
  v7.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController didChangeLayout:](&v7, "didChangeLayout:");
  v5 = sub_100BF8E04();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did change layout to: %lu", buf, 0xCu);
  }

  -[VLFContaineeViewController _updateForLayout:](self, "_updateForLayout:", a3);
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", off_1014BB970, self);

  v6.receiver = self;
  v6.super_class = (Class)VLFContaineeViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v4);

}

- (void)handleVLFPuckTapped
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  v4 = objc_msgSend(v3, "isRunning");

  if (v4)
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "-[VLFContaineeViewController handleVLFPuckTapped]";
      v17 = 2080;
      v18 = "VLFContaineeViewController.m";
      v19 = 1024;
      v20 = 313;
      v21 = 2080;
      v22 = "!self.vlfSession.isRunning";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  v6 = objc_msgSend(v5, "isRunning");

  v7 = sub_100BF8E04();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "VLF puck was tapped while a VLF session is running. This should never happen.", (uint8_t *)&v15, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VLF puck was tapped; retrying VLF",
        (uint8_t *)&v15,
        2u);
    }

    -[VLFContaineeViewController _retryVLFSession](self, "_retryVLFSession");
  }
}

- (int64_t)floatingControlsOptions
{
  return 0;
}

- (void)_updateBackgroundColor
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v7 = (id)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)_startVLFSession
{
  id v3;
  NSObject *v4;
  void *v5;
  VLFScanningStateManager *v6;
  void *v7;
  void *v8;
  VLFScanningStateManager *v9;
  uint8_t v10[16];

  v3 = sub_100BF8E04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting VLF session", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  objc_msgSend(v5, "start");

  v6 = [VLFScanningStateManager alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController vlfSession](self, "vlfSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
  v9 = -[VLFScanningStateManager initWithSession:delegate:](v6, "initWithSession:delegate:", v8, self);
  -[VLFContaineeViewController setStateManager:](self, "setStateManager:", v9);

}

- (void)_retryVLFSession
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionView](self, "instructionView"));
  objc_msgSend(v3, "setCurrentScanningState:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationView](self, "scanningAnimationView"));
  objc_msgSend(v4, "setCurrentScanningState:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", off_1014BB968, self);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BF97EC;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  -[VLFContaineeViewController _hideFailureWithCompletion:](self, "_hideFailureWithCompletion:", v6);
}

- (void)_updateForCurrentState
{
  id v3;
  NSObject *v4;
  void *v5;
  char *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const __CFString *v15;

  v3 = sub_100BF8E04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController stateManager](self, "stateManager"));
    v6 = (char *)objc_msgSend(v5, "currentState");
    if ((unint64_t)(v6 - 2) > 3)
      v7 = CFSTR("VLFScanningStateInitializing");
    else
      v7 = off_1011E8E08[(_QWORD)(v6 - 2)];
    v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating for current state: %@", (uint8_t *)&v14, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController stateManager](self, "stateManager"));
  v9 = objc_msgSend(v8, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionView](self, "instructionView"));
  objc_msgSend(v10, "setCurrentScanningState:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController stateManager](self, "stateManager"));
  v12 = objc_msgSend(v11, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationView](self, "scanningAnimationView"));
  objc_msgSend(v13, "setCurrentScanningState:", v12);

}

- (void)_updateForLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  char *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  NSString *v68;
  NSComparisonResult v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  const char *v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  CGRect v95;

  if (a3 == 4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewLeadingConstraint](self, "instructionViewLeadingConstraint"));
    objc_msgSend(v18, "setConstant:", 24.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTrailingConstraint](self, "instructionViewTrailingConstraint"));
    objc_msgSend(v19, "setConstant:", -48.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewFlexibleTopConstraintPortrait](self, "scanningAnimationViewFlexibleTopConstraintPortrait"));
    objc_msgSend(v20, "setActive:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewTopConstraintPortrait](self, "scanningAnimationViewTopConstraintPortrait"));
    objc_msgSend(v21, "setActive:", 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v23 = objc_msgSend(v22, "containerStyle");

    if (v23 == (id)6)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "window"));
      objc_msgSend(v25, "frame");
      v27 = v26 * -0.08;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewBottomConstraint](self, "scanningAnimationViewBottomConstraint"));
      objc_msgSend(v28, "setConstant:", v27);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      objc_msgSend(v30, "bounds");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
      objc_msgSend(v29, "convertRect:toView:", v40, v32, v34, v36, v38);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "window"));
      objc_msgSend(v50, "frame");
      v52 = v51;
      v95.origin.x = v42;
      v95.origin.y = v44;
      v95.size.width = v46;
      v95.size.height = v48;
      v53 = v52 - CGRectGetMaxY(v95);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "window"));
      objc_msgSend(v55, "frame");
      v57 = -(v56 * 0.07 - v53);
    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v74, "bottomSafeOffset");
      v76 = v75;
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "window"));
      objc_msgSend(v78, "frame");
      v80 = -(v76 + v79 * 0.08);
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewBottomConstraint](self, "scanningAnimationViewBottomConstraint"));
      objc_msgSend(v81, "setConstant:", v80);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController view](self, "view"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "window"));
      objc_msgSend(v55, "frame");
      v57 = v82 * -0.07;
    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController failureViewBottomConstraint](self, "failureViewBottomConstraint"));
    objc_msgSend(v83, "setConstant:", v57);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewFirstBaselineConstraint](self, "instructionViewFirstBaselineConstraint"));
    objc_msgSend(v84, "setActive:", 0);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTopConstraint](self, "instructionViewTopConstraint"));
    v72 = v71;
    v73 = 22.0;
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewLeadingConstraint](self, "instructionViewLeadingConstraint"));
    objc_msgSend(v5, "setConstant:", 28.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTrailingConstraint](self, "instructionViewTrailingConstraint"));
    objc_msgSend(v6, "setConstant:", -52.0);

    v7 = -[VLFContaineeViewController isFailureVisible](self, "isFailureVisible") ^ 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewTopConstraintPortrait](self, "scanningAnimationViewTopConstraintPortrait"));
    objc_msgSend(v8, "setActive:", v7);

    v9 = -[VLFContaineeViewController isFailureVisible](self, "isFailureVisible");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewFlexibleTopConstraintPortrait](self, "scanningAnimationViewFlexibleTopConstraintPortrait"));
    objc_msgSend(v10, "setActive:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v11, "bottomSafeOffset");
    v13 = v12;

    if (v13 <= 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewBottomConstraint](self, "scanningAnimationViewBottomConstraint"));
      objc_msgSend(v14, "setConstant:", -10.0);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v14, "bottomSafeOffset");
      v16 = -v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController scanningAnimationViewBottomConstraint](self, "scanningAnimationViewBottomConstraint"));
      objc_msgSend(v17, "setConstant:", v16);

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v63, "bottomSafeOffset");
    v65 = -(v64 + 10.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController failureViewBottomConstraint](self, "failureViewBottomConstraint"));
    objc_msgSend(v66, "setConstant:", v65);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController traitCollection](self, "traitCollection"));
    v68 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "preferredContentSizeCategory"));
    v69 = UIContentSizeCategoryCompareToCategory(v68, UIContentSizeCategoryLarge);

    if (v69 != NSOrderedDescending)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTopConstraint](self, "instructionViewTopConstraint"));
      objc_msgSend(v86, "setActive:", 0);

      v85 = objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewFirstBaselineConstraint](self, "instructionViewFirstBaselineConstraint"));
      goto LABEL_19;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewFirstBaselineConstraint](self, "instructionViewFirstBaselineConstraint"));
    objc_msgSend(v70, "setActive:", 0);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTopConstraint](self, "instructionViewTopConstraint"));
    v72 = v71;
    v73 = 21.0;
LABEL_17:
    objc_msgSend(v71, "setConstant:", v73);

    v85 = objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionViewTopConstraint](self, "instructionViewTopConstraint"));
LABEL_19:
    v61 = v85;
    -[NSObject setActive:](v85, "setActive:", 1);
LABEL_20:

    goto LABEL_21;
  }
  v58 = sub_1004318FC();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    v89 = 136315650;
    v90 = "-[VLFContaineeViewController _updateForLayout:]";
    v91 = 2080;
    v92 = "VLFContaineeViewController.m";
    v93 = 1024;
    v94 = 420;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v89, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v60 = sub_1004318FC();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v89 = 138412290;
      v90 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v89, 0xCu);

    }
    goto LABEL_20;
  }
LABEL_21:
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController instructionView](self, "instructionView"));
  objc_msgSend(v87, "setCurrentLayout:", a3);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[VLFContaineeViewController failureView](self, "failureView"));
  objc_msgSend(v88, "setCurrentLayout:", a3);

}

- (void)_showFailure
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  double v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = sub_100BF8E04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Showing failure UI", buf, 2u);
  }

  -[VLFContaineeViewController setIsFailureVisible:](self, "setIsFailureVisible:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationSlowDownKey"));

  v7 = 0.3;
  if (v6)
    v7 = 5.0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BFA0D0;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v8, 0, v7, 0.0);
}

- (void)_hideFailureWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100BF8E04();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Hiding failure UI", buf, 2u);
  }

  -[VLFContaineeViewController setIsFailureVisible:](self, "setIsFailureVisible:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationSlowDownKey"));

  if (v8)
    v9 = 5.0;
  else
    v9 = 0.3;
  v12 = v4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BFA3E4;
  v13[3] = &unk_1011AC860;
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BFA5AC;
  v11[3] = &unk_1011B1B90;
  v10 = v4;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v13, v11, v9, 0.0);

}

- (void)_presentInternalErrorAlert:(id)a3 onViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", ARErrorDomain);

  if (v8)
    v9 = CFSTR("VLF+ localization failed due to an ARKit error: %@");
  else
    v9 = CFSTR("VLF+ localization failed due to an unknown error: %@");
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Localization failed [Internal Only]"), v12, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
  objc_msgSend(v10, "addAction:", v11);

  objc_msgSend(v5, "presentViewController:animated:completion:", v10, 1, 0);
}

- (BOOL)allowsLongPressToMarkLocation
{
  return 0;
}

- (BOOL)allowsQuickActionMenuInMap
{
  return 0;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = sub_100BF8E04();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Header button tapped; dismissing ourselves",
      v8,
      2u);
  }

  -[VLFContaineeViewController handleDismissAction:](self, "handleDismissAction:", v5);
}

- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  if (a3 > 7)
    return 4;
  else
    return qword_100E3F290[a3];
}

- (void)VLFSessionLocalizationSucceeded
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100BF8E04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Localization succeeded; dismissing ourselves",
      v6,
      2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  objc_msgSend(v5, "registerLocalizationSuccess");

  -[VLFContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (void)VLFSessionLocalizationFailedWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;

  v4 = a3;
  v5 = sub_100BF8E04();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Localization failed with error %@", (uint8_t *)&v19, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Maps.VLFSession"));

  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v14 = objc_msgSend(v13, "isInternalInstall");

    if (v14)
    {
      v15 = sub_100BF8E04();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Showing internal-only failure alert which displays more info about what went wrong", (uint8_t *)&v19, 2u);
      }

      -[VLFContaineeViewController _presentInternalErrorAlert:onViewController:](self, "_presentInternalErrorAlert:onViewController:", v4, self);
    }
    v17 = 130;
    goto LABEL_16;
  }
  v9 = objc_msgSend(v4, "code");
  v10 = sub_100BF8E04();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9 != (id)2)
  {
    if (v12)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Localization timed out; showing failure UI",
        (uint8_t *)&v19,
        2u);
    }

    v17 = 2160;
LABEL_16:
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v17, 669, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "postNotificationName:object:", off_1014BB960, self);

    -[VLFContaineeViewController _showFailure](self, "_showFailure");
    goto LABEL_17;
  }
  if (v12)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "User canceled; dismissing ourselves",
      (uint8_t *)&v19,
      2u);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 131, 669, 0);
  -[VLFContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
LABEL_17:

}

- (void)scanningStateManager:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  v6 = sub_100BF8E04();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 2) > 3)
      v8 = CFSTR("VLFScanningStateInitializing");
    else
      v8 = off_1011E8E08[a4 - 2];
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "State manager updated its state to %@", (uint8_t *)&v9, 0xCu);
  }

  -[VLFContaineeViewController _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)failureViewDismissButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100BF8E04();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Failure view dismiss button tapped; dismissing ourselves",
      v6,
      2u);
  }

  -[VLFContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (void)failureViewRetryButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100BF8E04();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Failure view retry button tapped", v6, 2u);
  }

  -[VLFContaineeViewController _retryVLFSession](self, "_retryVLFSession");
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (VLFSession)vlfSession
{
  return self->_vlfSession;
}

- (void)setVlfSession:(id)a3
{
  objc_storeStrong((id *)&self->_vlfSession, a3);
}

- (VLFScanningStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (BOOL)isFailureVisible
{
  return self->_isFailureVisible;
}

- (void)setIsFailureVisible:(BOOL)a3
{
  self->_isFailureVisible = a3;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UIView)scanningContainerView
{
  return self->_scanningContainerView;
}

- (void)setScanningContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_scanningContainerView, a3);
}

- (VLFScanningInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionView, a3);
}

- (NSLayoutConstraint)instructionViewLeadingConstraint
{
  return self->_instructionViewLeadingConstraint;
}

- (void)setInstructionViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)instructionViewTrailingConstraint
{
  return self->_instructionViewTrailingConstraint;
}

- (void)setInstructionViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)instructionViewFirstBaselineConstraint
{
  return self->_instructionViewFirstBaselineConstraint;
}

- (void)setInstructionViewFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, a3);
}

- (VLFScanningAnimationView)scanningAnimationView
{
  return self->_scanningAnimationView;
}

- (void)setScanningAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_scanningAnimationView, a3);
}

- (NSLayoutConstraint)scanningAnimationViewFlexibleTopConstraintPortrait
{
  return self->_scanningAnimationViewFlexibleTopConstraintPortrait;
}

- (void)setScanningAnimationViewFlexibleTopConstraintPortrait:(id)a3
{
  objc_storeStrong((id *)&self->_scanningAnimationViewFlexibleTopConstraintPortrait, a3);
}

- (NSLayoutConstraint)scanningAnimationViewTopConstraintPortrait
{
  return self->_scanningAnimationViewTopConstraintPortrait;
}

- (void)setScanningAnimationViewTopConstraintPortrait:(id)a3
{
  objc_storeStrong((id *)&self->_scanningAnimationViewTopConstraintPortrait, a3);
}

- (NSLayoutConstraint)scanningAnimationViewBottomConstraint
{
  return self->_scanningAnimationViewBottomConstraint;
}

- (void)setScanningAnimationViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scanningAnimationViewBottomConstraint, a3);
}

- (VLFFailureView)failureView
{
  return self->_failureView;
}

- (void)setFailureView:(id)a3
{
  objc_storeStrong((id *)&self->_failureView, a3);
}

- (NSLayoutConstraint)failureViewBottomConstraint
{
  return self->_failureViewBottomConstraint;
}

- (void)setFailureViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_failureViewBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewTopConstraintPortrait, 0);
  objc_storeStrong((id *)&self->_scanningAnimationViewFlexibleTopConstraintPortrait, 0);
  objc_storeStrong((id *)&self->_scanningAnimationView, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_scanningContainerView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_vlfSession, 0);
}

@end
