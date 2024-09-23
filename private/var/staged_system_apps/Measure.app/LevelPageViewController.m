@implementation LevelPageViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _UNKNOWN **v5;

  if ((id)objc_opt_class(LevelPageViewController) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = CFSTR("0.5");
    v5 = &off_1004559F8;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

- (LevelPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LevelPageViewController *v4;
  LevelPageViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LevelPageViewController;
  v4 = -[LevelPageViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[LevelPageViewController configure](v4, "configure");
  return v5;
}

- (LevelPageViewController)initWithCoder:(id)a3
{
  LevelPageViewController *v3;
  LevelPageViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LevelPageViewController;
  v3 = -[LevelPageViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LevelPageViewController configure](v3, "configure");
  return v4;
}

- (LevelPageViewController)init
{
  return -[LevelPageViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (void)configure
{
  CMMotionManager *v3;
  CMMotionManager *manager;
  float v5;
  id v6;

  v3 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
  manager = self->_manager;
  self->_manager = v3;

  -[CMMotionManager setShowsDeviceMovementDisplay:](self->_manager, "setShowsDeviceMovementDisplay:", 1);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_manager, "setDeviceMotionUpdateInterval:", 0.00999999978);
  -[CMMotionManager startDeviceMotionUpdatesUsingReferenceFrame:](self->_manager, "startDeviceMotionUpdatesUsingReferenceFrame:", 1);
  self->_orientation = 1;
  self->_previousOrientation = 1;
  self->_lastLevelChange = 1.79769313e308;
  self->_lastDisplayDegrees = 0x7FFFFFFFFFFFFFFFLL;
  self->_previousRotation = 1.79769313e308;
  self->_previousShift = 1.79769313e308;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "floatForKey:", CFSTR("0.5"));
  self->_zeroRange = v5;

}

- (void)dealloc
{
  NSTimer *levelIdleTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_levelIdleTimer, "invalidate");
  levelIdleTimer = self->_levelIdleTimer;
  self->_levelIdleTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)LevelPageViewController;
  -[LevelPageViewController dealloc](&v4, "dealloc");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  UIView *v16;
  UIView *filterContainer;
  UIView *v18;
  void *v19;
  UIView *v20;
  UIView *levelContainer;
  UIView *v22;
  void *v23;
  UIView *v24;
  UIView *levelHoldContainer;
  UIView *v26;
  void *v27;
  UIView *v28;
  UIView *bubbleContainer;
  UIView *v30;
  void *v31;
  UIView *v32;
  UIView *ticContainer;
  UIView *v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  double Width;
  CGFloat Height;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  CALayer *v46;
  CALayer *heldLevelBottomBacking;
  CALayer *v48;
  id v49;
  void *v50;
  CALayer *v51;
  CALayer *heldLevelBottom;
  CALayer *v53;
  id v54;
  CALayer *v55;
  void *v56;
  void *v57;
  CALayer *v58;
  CALayer *divergenceLevelBottom;
  CALayer *v60;
  id v61;
  CALayer *v62;
  void *v63;
  void *v64;
  CALayer *v65;
  CALayer *levelBottom;
  CALayer *v67;
  id v68;
  void *v69;
  CAShapeLayer *v70;
  CAShapeLayer *topOuterCircle;
  CAShapeLayer *v72;
  id v73;
  CAShapeLayer *v74;
  id v75;
  CAShapeLayer *v76;
  void *v77;
  CAShapeLayer *v78;
  CAShapeLayer *topInnerCircle;
  CAShapeLayer *v80;
  id v81;
  CAShapeLayer *v82;
  id v83;
  CAShapeLayer *v84;
  void *v85;
  CAShapeLayer *v86;
  CAShapeLayer *bottomOuterCircle;
  CAShapeLayer *v88;
  id v89;
  CAShapeLayer *v90;
  id v91;
  CAShapeLayer *v92;
  void *v93;
  CAShapeLayer *v94;
  CAShapeLayer *bottomInnerCircle;
  CAShapeLayer *v96;
  id v97;
  CAShapeLayer *v98;
  id v99;
  CAShapeLayer *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  UILabel *v106;
  UILabel *degreesLabel;
  UILabel *v108;
  void *v109;
  void *v110;
  void *v111;
  CALayer *v112;
  CALayer *rightLevelTic;
  CALayer *v114;
  id v115;
  void *v116;
  CALayer *v117;
  CALayer *leftLevelTic;
  CALayer *v119;
  id v120;
  void *v121;
  void *v122;
  UITapGestureRecognizer *v123;
  UITapGestureRecognizer *holdRecognizer;
  void *v125;
  uint64_t v126;
  objc_super v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  v127.receiver = self;
  v127.super_class = (Class)LevelPageViewController;
  -[LevelPageViewController viewDidLoad](&v127, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  filterContainer = self->_filterContainer;
  self->_filterContainer = v16;

  v18 = self->_filterContainer;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

  -[UIView setClipsToBounds:](self->_filterContainer, "setClipsToBounds:", 1);
  -[UIView setAutoresizingMask:](self->_filterContainer, "setAutoresizingMask:", 18);
  v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  levelContainer = self->_levelContainer;
  self->_levelContainer = v20;

  v22 = self->_levelContainer;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[UIView setAutoresizingMask:](self->_levelContainer, "setAutoresizingMask:", 18);
  v24 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  levelHoldContainer = self->_levelHoldContainer;
  self->_levelHoldContainer = v24;

  v26 = self->_levelHoldContainer;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

  -[UIView setAutoresizingMask:](self->_levelHoldContainer, "setAutoresizingMask:", 18);
  v28 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v28;

  v30 = self->_bubbleContainer;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v31);

  -[UIView setAutoresizingMask:](self->_bubbleContainer, "setAutoresizingMask:", 18);
  v32 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  ticContainer = self->_ticContainer;
  self->_ticContainer = v32;

  v34 = self->_ticContainer;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v34, "setBackgroundColor:", v35);

  -[UIView setAutoresizingMask:](self->_ticContainer, "setAutoresizingMask:", 18);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_ticContainer, "layer"));
  v126 = kCAFilterXor;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:"));
  objc_msgSend(v36, "setCompositingFilter:", v37);

  v128.origin.x = v8;
  v128.origin.y = v10;
  v128.size.width = v12;
  v128.size.height = v14;
  v38 = v10 + CGRectGetHeight(v128) * 0.5;
  v129.origin.x = v8;
  v129.origin.y = v38;
  v129.size.width = v12;
  v129.size.height = v14;
  Width = CGRectGetWidth(v129);
  v130.origin.x = v8;
  v130.origin.y = v38;
  v130.size.width = v12;
  v130.size.height = v14;
  Height = CGRectGetHeight(v130);
  v41 = Height + Height;
  v131.origin.x = v8;
  v131.origin.y = v38;
  v131.size.width = v12;
  v131.size.height = v14;
  v42 = v8 - Width;
  v43 = v38 + 0.0;
  v44 = v12 - (-CGRectGetWidth(v131) - Width);
  v45 = v14 - (0.0 - v41);
  v46 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  self->_heldLevelBottomBacking = v46;

  -[CALayer setAnchorPoint:](self->_heldLevelBottomBacking, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_heldLevelBottomBacking, "setFrame:", v42, v43, v44, v45);
  v48 = self->_heldLevelBottomBacking;
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
  -[CALayer setBackgroundColor:](v48, "setBackgroundColor:", objc_msgSend(v49, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_heldLevelBottomBacking, "setAllowsEdgeAntialiasing:", 1);
  -[CALayer setHidden:](self->_heldLevelBottomBacking, "setHidden:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_levelContainer, "layer"));
  objc_msgSend(v50, "addSublayer:", self->_heldLevelBottomBacking);

  v51 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  heldLevelBottom = self->_heldLevelBottom;
  self->_heldLevelBottom = v51;

  -[CALayer setAnchorPoint:](self->_heldLevelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_heldLevelBottom, "setFrame:", v42, v43, v44, v45);
  v53 = self->_heldLevelBottom;
  v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
  -[CALayer setBackgroundColor:](v53, "setBackgroundColor:", objc_msgSend(v54, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_heldLevelBottom, "setAllowsEdgeAntialiasing:", 1);
  -[CALayer setHidden:](self->_heldLevelBottom, "setHidden:", 1);
  v55 = self->_heldLevelBottom;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CALayer setCompositingFilter:](v55, "setCompositingFilter:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_levelHoldContainer, "layer"));
  objc_msgSend(v57, "addSublayer:", self->_heldLevelBottom);

  v58 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  divergenceLevelBottom = self->_divergenceLevelBottom;
  self->_divergenceLevelBottom = v58;

  -[CALayer setAnchorPoint:](self->_divergenceLevelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_divergenceLevelBottom, "setFrame:", v42, v43, v44, v45);
  v60 = self->_divergenceLevelBottom;
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
  -[CALayer setBackgroundColor:](v60, "setBackgroundColor:", objc_msgSend(v61, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_divergenceLevelBottom, "setAllowsEdgeAntialiasing:", 1);
  -[CALayer setHidden:](self->_divergenceLevelBottom, "setHidden:", 1);
  v62 = self->_divergenceLevelBottom;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CALayer setCompositingFilter:](v62, "setCompositingFilter:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_levelHoldContainer, "layer"));
  objc_msgSend(v64, "addSublayer:", self->_divergenceLevelBottom);

  v65 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  levelBottom = self->_levelBottom;
  self->_levelBottom = v65;

  -[CALayer setAnchorPoint:](self->_levelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_levelBottom, "setFrame:", v42, v43, v44, v45);
  v67 = self->_levelBottom;
  v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CALayer setBackgroundColor:](v67, "setBackgroundColor:", objc_msgSend(v68, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_levelBottom, "setAllowsEdgeAntialiasing:", 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_levelContainer, "layer"));
  objc_msgSend(v69, "addSublayer:", self->_levelBottom);

  -[UIView addSubview:](self->_filterContainer, "addSubview:", self->_levelContainer);
  -[UIView addSubview:](self->_levelContainer, "addSubview:", self->_levelHoldContainer);
  v70 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  topOuterCircle = self->_topOuterCircle;
  self->_topOuterCircle = v70;

  -[CAShapeLayer setFrame:](self->_topOuterCircle, "setFrame:", 0.0, 0.0, 200.0, 200.0);
  v72 = self->_topOuterCircle;
  v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 200.0, 200.0)));
  -[CAShapeLayer setPath:](v72, "setPath:", objc_msgSend(v73, "CGPath"));

  v74 = self->_topOuterCircle;
  v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CAShapeLayer setFillColor:](v74, "setFillColor:", objc_msgSend(v75, "CGColor"));

  v76 = self->_topOuterCircle;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CAShapeLayer setCompositingFilter:](v76, "setCompositingFilter:", v77);

  v78 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  topInnerCircle = self->_topInnerCircle;
  self->_topInnerCircle = v78;

  -[CAShapeLayer setFrame:](self->_topInnerCircle, "setFrame:", 0.0, 0.0, 195.0, 195.0);
  v80 = self->_topInnerCircle;
  v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 195.0, 195.0)));
  -[CAShapeLayer setPath:](v80, "setPath:", objc_msgSend(v81, "CGPath"));

  v82 = self->_topInnerCircle;
  v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CAShapeLayer setFillColor:](v82, "setFillColor:", objc_msgSend(v83, "CGColor"));

  v84 = self->_topInnerCircle;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CAShapeLayer setCompositingFilter:](v84, "setCompositingFilter:", v85);

  v86 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  bottomOuterCircle = self->_bottomOuterCircle;
  self->_bottomOuterCircle = v86;

  -[CAShapeLayer setFrame:](self->_bottomOuterCircle, "setFrame:", 0.0, 0.0, 200.0, 200.0);
  v88 = self->_bottomOuterCircle;
  v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 200.0, 200.0)));
  -[CAShapeLayer setPath:](v88, "setPath:", objc_msgSend(v89, "CGPath"));

  v90 = self->_bottomOuterCircle;
  v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CAShapeLayer setFillColor:](v90, "setFillColor:", objc_msgSend(v91, "CGColor"));

  v92 = self->_bottomOuterCircle;
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CAShapeLayer setCompositingFilter:](v92, "setCompositingFilter:", v93);

  v94 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  bottomInnerCircle = self->_bottomInnerCircle;
  self->_bottomInnerCircle = v94;

  -[CAShapeLayer setFrame:](self->_bottomInnerCircle, "setFrame:", 0.0, 0.0, 195.0, 195.0);
  v96 = self->_bottomInnerCircle;
  v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 195.0, 195.0)));
  -[CAShapeLayer setPath:](v96, "setPath:", objc_msgSend(v97, "CGPath"));

  v98 = self->_bottomInnerCircle;
  v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CAShapeLayer setFillColor:](v98, "setFillColor:", objc_msgSend(v99, "CGColor"));

  v100 = self->_bottomInnerCircle;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  -[CAShapeLayer setCompositingFilter:](v100, "setCompositingFilter:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_filterContainer, "layer"));
  objc_msgSend(v102, "addSublayer:", self->_topOuterCircle);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_filterContainer, "layer"));
  objc_msgSend(v103, "addSublayer:", self->_topInnerCircle);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_filterContainer, "layer"));
  objc_msgSend(v104, "addSublayer:", self->_bottomOuterCircle);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_filterContainer, "layer"));
  objc_msgSend(v105, "addSublayer:", self->_bottomInnerCircle);

  v106 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  degreesLabel = self->_degreesLabel;
  self->_degreesLabel = v106;

  v108 = self->_degreesLabel;
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setTextColor:](v108, "setTextColor:", v109);

  -[LevelPageViewController updateDegreesLabel](self, "updateDegreesLabel");
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_degreesLabel, "layer"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v126));
  objc_msgSend(v110, "setCompositingFilter:", v111);

  -[UIView addSubview:](self->_filterContainer, "addSubview:", self->_degreesLabel);
  v112 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  rightLevelTic = self->_rightLevelTic;
  self->_rightLevelTic = v112;

  -[CALayer setFrame:](self->_rightLevelTic, "setFrame:", 0.0, 0.0, 40.5, 1.5);
  v114 = self->_rightLevelTic;
  v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CALayer setBackgroundColor:](v114, "setBackgroundColor:", objc_msgSend(v115, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_rightLevelTic, "setAllowsEdgeAntialiasing:", 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_ticContainer, "layer"));
  objc_msgSend(v116, "addSublayer:", self->_rightLevelTic);

  v117 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  leftLevelTic = self->_leftLevelTic;
  self->_leftLevelTic = v117;

  -[CALayer setFrame:](self->_leftLevelTic, "setFrame:", 0.0, 0.0, 40.5, 1.5);
  v119 = self->_leftLevelTic;
  v120 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  -[CALayer setBackgroundColor:](v119, "setBackgroundColor:", objc_msgSend(v120, "CGColor"));

  -[CALayer setAllowsEdgeAntialiasing:](self->_leftLevelTic, "setAllowsEdgeAntialiasing:", 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_ticContainer, "layer"));
  objc_msgSend(v121, "addSublayer:", self->_leftLevelTic);

  -[UIView addSubview:](self->_filterContainer, "addSubview:", self->_ticContainer);
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v122, "addSubview:", self->_filterContainer);

  v123 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleHold:");
  holdRecognizer = self->_holdRecognizer;
  self->_holdRecognizer = v123;

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v125, "addGestureRecognizer:", self->_holdRecognizer);

}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  double v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  int64_t orientation;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double holdAngle;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t framesLevel;
  _BOOL4 v23;
  void *v24;
  _UIImpactFeedbackGeneratorConfiguration *v25;
  _UIImpactFeedbackGeneratorConfiguration *impactConfig;
  UIImpactFeedbackGenerator *impactGenerator;
  id v28;
  _UIImpactFeedbackGeneratorConfiguration *v29;
  void *v30;
  UIImpactFeedbackGenerator *v31;
  UIImpactFeedbackGenerator *v32;
  double v33;
  _QWORD v35[5];

  self->_currentShift = a4;
  self->_currentRotation = a3;
  v7 = a3 * 180.0 / 3.14159265;
  if (self->_isHeld)
  {
    v8 = 216;
LABEL_3:
    v9 = *(int64_t *)((char *)&self->super.super.super.isa + v8);
    goto LABEL_18;
  }
  if (fabs(a4 * 180.0 / 3.14159265) <= 40.0)
  {
    v10 = fabs(v7);
    if (v10 >= 20.0)
    {
      if (v10 <= 160.0)
      {
        if (v7 <= 70.0 || v7 >= 110.0)
        {
          if (v7 >= -70.0 || v7 <= -110.0)
          {
            v8 = 200;
            goto LABEL_3;
          }
          v9 = 4;
        }
        else
        {
          v9 = 3;
        }
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {
      v9 = 1;
    }
  }
  else if (a4 <= 0.0)
  {
    v9 = 6;
  }
  else
  {
    v9 = 5;
  }
LABEL_18:
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  orientation = self->_orientation;
  v12 = v9 != orientation;
  if (v9 != orientation)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController traitCollection](self, "traitCollection"));
    v14 = objc_msgSend(v13, "verticalSizeClass");

    if (v14 == (id)2)
    {
      self->_previousOrientation = v9;
      -[LevelPageViewController updateTicsForOrientation:](self, "updateTicsForOrientation:", v9);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController traitCollection](self, "traitCollection"));
      v16 = objc_msgSend(v15, "verticalSizeClass");

      if (v16 == (id)1)
        self->_previousOrientation = v9;
    }
    -[LevelPageViewController updateTicsForOrientation:](self, "updateTicsForOrientation:", v9);
  }
  self->_orientation = v9;
  if (self->_isHeld)
  {
    if (v9 == 5)
    {
LABEL_30:
      v21 = -1.57079633;
    }
    else
    {
      if (v9 != 6)
      {
        holdAngle = self->_holdAngle;
        v18 = holdAngle - sub_10000388C(holdAngle, self->_currentRotation);
LABEL_33:
        v7 = v18 * 180.0 / 3.14159265;
        goto LABEL_34;
      }
LABEL_31:
      v21 = 1.57079633;
    }
    v18 = a4 + v21;
    goto LABEL_33;
  }
  switch(v9)
  {
    case 1:
      break;
    case 2:
      v19 = sub_10000388C(3.14159265, a3) * 180.0 / 3.14159265;
      v20 = -180.0;
      goto LABEL_57;
    case 3:
      v19 = sub_10000388C(1.57079633, a3) * 180.0 / 3.14159265;
      v20 = -90.0;
      goto LABEL_57;
    case 4:
      v19 = sub_10000388C(-2.35619449, a3) * 180.0 / 3.14159265;
      v20 = 90.0;
LABEL_57:
      v7 = v19 + v20;
      break;
    case 5:
      goto LABEL_30;
    case 6:
      goto LABEL_31;
    default:
      v7 = 0.0;
      break;
  }
LABEL_34:
  +[CATransaction commit](CATransaction, "commit");
  if (fabs(v7) >= self->_zeroRange)
  {
    framesLevel = 0;
  }
  else
  {
    framesLevel = self->_framesLevel;
    if (framesLevel > 29)
      goto LABEL_39;
    ++framesLevel;
    v12 = 1;
  }
  self->_framesLevel = framesLevel;
LABEL_39:
  v23 = framesLevel > 29;
  if (self->_isLevel != v23)
  {
    if (self->_isLevel && vabdd_f64(self->_lastLevelChange, v7) <= 0.5)
    {
      v12 = 0;
      self->_framesLevel = 30;
      return v12;
    }
    self->_isLevel = v23;
    if (framesLevel >= 30)
    {
      if (!self->_impactConfig)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[_UIImpactFeedbackGeneratorConfiguration defaultConfiguration](_UIImpactFeedbackGeneratorConfiguration, "defaultConfiguration"));
        v25 = (_UIImpactFeedbackGeneratorConfiguration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tweakedConfigurationForCaller:usage:", self, CFSTR("levelDetent")));
        impactConfig = self->_impactConfig;
        self->_impactConfig = v25;

      }
      -[UIImpactFeedbackGenerator deactivate](self->_impactGenerator, "deactivate");
      impactGenerator = self->_impactGenerator;
      if (!impactGenerator)
      {
        v28 = objc_alloc((Class)UIImpactFeedbackGenerator);
        v29 = self->_impactConfig;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
        v31 = (UIImpactFeedbackGenerator *)objc_msgSend(v28, "initWithConfiguration:view:", v29, v30);
        v32 = self->_impactGenerator;
        self->_impactGenerator = v31;

        impactGenerator = self->_impactGenerator;
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100004F78;
      v35[3] = &unk_10043BB38;
      v35[4] = self;
      -[UIImpactFeedbackGenerator activateWithCompletionBlock:](impactGenerator, "activateWithCompletionBlock:", v35);
    }
    self->_lastLevelChange = v7;
    -[LevelPageViewController updateColors](self, "updateColors");
    v12 = 1;
  }
  v33 = 0.0;
  if (framesLevel <= 29)
    v33 = v7;
  -[LevelPageViewController _updateOffsetLabel:](self, "_updateOffsetLabel:", v33);
  return v12;
}

- (void)updateDegreesLabel
{
  UILabel *degreesLabel;
  void *v4;
  UILabel *v5;
  id v6;

  degreesLabel = self->_degreesLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController labelFont](self, "labelFont"));
  -[UILabel setFont:](degreesLabel, "setFont:", v4);

  -[UILabel sizeToFit](self->_degreesLabel, "sizeToFit");
  v5 = self->_degreesLabel;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v6, "center");
  -[UILabel setCenter:](v5, "setCenter:");

}

- (void)updateColors
{
  _BOOL4 v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CALayer *heldLevelBottom;
  id v10;
  CALayer *heldLevelBottomBacking;
  id v12;
  CALayer *divergenceLevelBottom;
  id v14;
  void *v15;
  int *v16;
  int *v17;
  id v18;
  CAShapeLayer *topInnerCircle;
  id v20;
  CAShapeLayer *topOuterCircle;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  CALayer *leftLevelTic;
  id v28;
  id v29;

  v3 = self->_isHeld && (unint64_t)(self->_heldOrientation - 5) < 2;
  v4 = !self->_isHeld || v3;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  if (v3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v8 = v7;
  heldLevelBottom = self->_heldLevelBottom;
  if (self->_isLevel)
  {
    v10 = objc_retainAutorelease(v29);
    -[CALayer setBackgroundColor:](heldLevelBottom, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));
    heldLevelBottomBacking = self->_heldLevelBottomBacking;
    v12 = objc_retainAutorelease(v10);
    -[CALayer setBackgroundColor:](heldLevelBottomBacking, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));
    divergenceLevelBottom = self->_divergenceLevelBottom;
    v14 = objc_retainAutorelease(v12);
    -[CALayer setBackgroundColor:](divergenceLevelBottom, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));
    if (v4)
      v15 = v14;
    else
      v15 = v6;
    v16 = &OBJC_IVAR___LevelPageViewController__bottomOuterCircle;
    v17 = &OBJC_IVAR___LevelPageViewController__bottomInnerCircle;
  }
  else
  {
    v18 = objc_retainAutorelease(v7);
    -[CALayer setBackgroundColor:](heldLevelBottom, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));
    -[CALayer setBackgroundColor:](self->_heldLevelBottomBacking, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v29), "CGColor"));
    -[CALayer setBackgroundColor:](self->_divergenceLevelBottom, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v18), "CGColor"));
    v16 = &OBJC_IVAR___LevelPageViewController__bottomInnerCircle;
    v15 = v6;
    v14 = v6;
    v17 = &OBJC_IVAR___LevelPageViewController__bottomOuterCircle;
  }
  -[CALayer setBackgroundColor:](self->_levelBottom, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v15), "CGColor"));
  topInnerCircle = self->_topInnerCircle;
  v20 = objc_retainAutorelease(v14);
  -[CAShapeLayer setFillColor:](topInnerCircle, "setFillColor:", objc_msgSend(v20, "CGColor"));
  topOuterCircle = self->_topOuterCircle;
  v22 = objc_retainAutorelease(v20);
  -[CAShapeLayer setFillColor:](topOuterCircle, "setFillColor:", objc_msgSend(v22, "CGColor"));
  v23 = *(Class *)((char *)&self->super.super.super.isa + *v17);
  v24 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "setFillColor:", objc_msgSend(v24, "CGColor"));
  v25 = *(Class *)((char *)&self->super.super.super.isa + *v16);
  v26 = objc_retainAutorelease(v24);
  objc_msgSend(v25, "setFillColor:", objc_msgSend(v26, "CGColor"));
  -[UILabel setTextColor:](self->_degreesLabel, "setTextColor:", v26);
  leftLevelTic = self->_leftLevelTic;
  v28 = objc_retainAutorelease(v26);
  -[CALayer setBackgroundColor:](leftLevelTic, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));
  -[CALayer setBackgroundColor:](self->_rightLevelTic, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v28), "CGColor"));

}

- (void)_enableIdleTimer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "setIdleTimerDisabled:", 0);

}

- (void)_updateOffsetLabel:(double)a3
{
  int64_t v4;
  double v5;
  int64_t lastDisplayDegrees;
  NSTimer *levelIdleTimer;
  NSTimer *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *degreesLabel;
  void *v13;
  NSTimer *v14;
  NSTimer *v15;
  uint64_t v16;

  v4 = (uint64_t)a3;
  v5 = fabs(a3);
  if (v5 < 1.0 && v5 > self->_zeroRange)
    v4 = (*(uint64_t *)&a3 >> 63) | 1;
  lastDisplayDegrees = self->_lastDisplayDegrees;
  levelIdleTimer = self->_levelIdleTimer;
  if (lastDisplayDegrees != v4)
  {
    -[NSTimer invalidate](levelIdleTimer, "invalidate");
    v8 = self->_levelIdleTimer;
    self->_levelIdleTimer = 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v9, "setIdleTimerDisabled:", 1);

    self->_lastDisplayDegrees = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COMPASS_DEGREES"), &stru_100455110, 0));
    v16 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4));

    -[UILabel setText:](self->_degreesLabel, "setText:", v16);
    -[UILabel sizeToFit](self->_degreesLabel, "sizeToFit");
    degreesLabel = self->_degreesLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
    objc_msgSend(v13, "center");
    -[UILabel setCenter:](degreesLabel, "setCenter:");

    v14 = (NSTimer *)v16;
LABEL_9:

    return;
  }
  if (!levelIdleTimer)
  {
    v15 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_enableIdleTimer", 0, 0, 60.0));
    v14 = self->_levelIdleTimer;
    self->_levelIdleTimer = v15;
    goto LABEL_9;
  }
}

- (void)updateDisplay:(id)a3
{
  -[LevelPageViewController updateLevelWithForcedInterfaceUpdate:](self, "updateLevelWithForcedInterfaceUpdate:", 0);
}

- (void)updateLevelWithForcedInterfaceUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  double holdAngle;
  unsigned int v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  int v27;
  double v28;
  int64_t framesLevel;
  double v30;
  int64_t orientation;
  double v32;
  void *v33;
  CGFloat v34;
  double v35;
  float v36;
  CGFloat v37;
  CALayer *levelBottom;
  CALayer *heldLevelBottom;
  CALayer *heldLevelBottomBacking;
  CALayer *divergenceLevelBottom;
  void *v42;
  CAShapeLayer *bottomOuterCircle;
  CAShapeLayer *bottomInnerCircle;
  CAShapeLayer *topOuterCircle;
  CAShapeLayer *topInnerCircle;
  _BOOL4 isHeld;
  void *v48;
  CATransform3D *v49;
  CATransform3D v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;
  CATransform3D v57;
  CATransform3D v58;
  CATransform3D v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  CGRect v65;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMMotionManager deviceMotion](self->_manager, "deviceMotion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));

  if (self->_holdAttitude)
    objc_msgSend(v6, "multiplyByInverseOfAttitude:");
  v64 = 0.0;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (v6)
  {
    objc_msgSend(v6, "rotationMatrix", 0.0, 0.0);
    v9 = *(double *)&v61;
    v8 = *((double *)&v62 + 1);
    v7 = v64;
  }
  v10 = -v9;
  v11 = -v7;
  v12 = v8 * v8 + v9 * v9;
  v13 = sqrt(v12);
  if (v12 <= 0.0)
    v14 = 0.0;
  else
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v16 = atan2(v10, v8);
  v17 = acos(v11);
  v18 = -1.57079633;
  v19 = v17 + -1.57079633;
  holdAngle = self->_holdAngle;
  v21 = -[LevelPageViewController _updateForRotation:shiftAngle:](self, "_updateForRotation:shiftAngle:", (double)v16, (double)(v17 + -1.57079633));
  if (v14 <= 0.100000001)
  {
    v24 = self->_rotationOrientation - 2;
    v25 = 0.0;
    if (v24 <= 2)
      v25 = dbl_1003AE738[v24];
    v18 = sub_10000388C(v16, v25);
    v26 = 1.0;
    if (v14 >= 0.0250000004)
      v26 = (v14 + -0.0250000004) / -0.0750000011 + 1.0;
    v16 = sub_100003910(v16, v18, v26);
  }
  else
  {
    v22 = v16 * 180.0 / 3.14159265;
    v23 = fabs(v22);
    if (v23 >= 45.0)
    {
      if (v23 <= 135.0)
      {
        if (v22 <= 45.0 || v22 >= 135.0)
        {
          self->_rotationOrientation = 4;
        }
        else
        {
          self->_rotationOrientation = 3;
          v18 = 1.57079633;
        }
      }
      else
      {
        self->_rotationOrientation = 2;
        v18 = -3.14159265;
      }
    }
    else
    {
      self->_rotationOrientation = 1;
      v18 = 0.0;
    }
  }
  if (vabdd_f64(v19, self->_previousShift) <= 0.0000999999975
    && vabdd_f64(v16, self->_previousRotation) <= 0.0000999999975)
  {
    v27 = v21 | v3;
  }
  else
  {
    v27 = 1;
  }
  v28 = v19 / 1.57079633;
  framesLevel = self->_framesLevel;
  if (framesLevel < 1)
  {
LABEL_30:
    if (!v27)
      goto LABEL_37;
    goto LABEL_31;
  }
  v30 = (double)framesLevel / 30.0;
  orientation = self->_orientation;
  if (orientation != 5)
  {
    if (orientation == 6)
      v28 = v28 * (1.0 - v30) - v30;
    goto LABEL_30;
  }
  v28 = v30 + v28 * (1.0 - v30);
  if (!v27)
    goto LABEL_37;
LABEL_31:
  v32 = self->_holdShift / 1.57079633;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v33, "bounds");
  v34 = CGRectGetHeight(v65) * 1.29999995;

  *(float *)&v35 = v14;
  objc_msgSend(v15, "_solveForInput:", v35);
  v37 = v34 * (v36 * 0.399999976 + 0.600000024);
  memset(&v59, 0, sizeof(v59));
  CATransform3DMakeRotation(&v59, v16, 0.0, 0.0, -1.0);
  memset(&v58, 0, sizeof(v58));
  CATransform3DMakeRotation(&v58, holdAngle, 0.0, 0.0, -1.0);
  memset(&v57, 0, sizeof(v57));
  v56 = v59;
  CATransform3DTranslate(&v57, &v56, 0.0, -(v34 * v28), 0.0);
  memset(&v56, 0, sizeof(v56));
  v55 = v58;
  CATransform3DTranslate(&v56, &v55, 0.0, -(v34 * v32), 0.0);
  memset(&v55, 0, sizeof(v55));
  v54 = v59;
  CATransform3DTranslate(&v55, &v54, 0.0, -(v37 * (v28 + -1.0)), 0.0);
  memset(&v54, 0, sizeof(v54));
  v53 = v59;
  CATransform3DTranslate(&v54, &v53, 0.0, (v28 + -1.0) * v37, 0.0);
  memset(&v53, 0, sizeof(v53));
  v52 = v59;
  CATransform3DTranslate(&v53, &v52, 0.0, -(v37 * (v28 + 1.0)), 0.0);
  memset(&v52, 0, sizeof(v52));
  v51 = v59;
  CATransform3DTranslate(&v52, &v51, 0.0, (v28 + 1.0) * v37, 0.0);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  levelBottom = self->_levelBottom;
  v51 = v57;
  -[CALayer setTransform:](levelBottom, "setTransform:", &v51);
  heldLevelBottom = self->_heldLevelBottom;
  v51 = v56;
  -[CALayer setTransform:](heldLevelBottom, "setTransform:", &v51);
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  v51 = v56;
  -[CALayer setTransform:](heldLevelBottomBacking, "setTransform:", &v51);
  divergenceLevelBottom = self->_divergenceLevelBottom;
  v51 = v57;
  -[CALayer setTransform:](divergenceLevelBottom, "setTransform:", &v51);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_degreesLabel, "layer"));
  v51 = v59;
  objc_msgSend(v42, "setTransform:", &v51);

  bottomOuterCircle = self->_bottomOuterCircle;
  v51 = v55;
  -[CAShapeLayer setTransform:](bottomOuterCircle, "setTransform:", &v51);
  bottomInnerCircle = self->_bottomInnerCircle;
  v51 = v54;
  -[CAShapeLayer setTransform:](bottomInnerCircle, "setTransform:", &v51);
  topOuterCircle = self->_topOuterCircle;
  v51 = v53;
  -[CAShapeLayer setTransform:](topOuterCircle, "setTransform:", &v51);
  topInnerCircle = self->_topInnerCircle;
  v51 = v52;
  -[CAShapeLayer setTransform:](topInnerCircle, "setTransform:", &v51);
  isHeld = self->_isHeld;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_ticContainer, "layer"));
  if (isHeld)
  {
    v51 = v58;
    v49 = &v51;
  }
  else
  {
    CATransform3DMakeRotation(&v50, v18, 0.0, 0.0, 1.0);
    v49 = &v50;
  }
  objc_msgSend(v48, "setTransform:", v49);

  +[CATransaction commit](CATransaction, "commit");
LABEL_37:
  self->_previousShift = v19;
  self->_previousRotation = v16;

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  UILabel *degreesLabel;
  void *v4;
  CAShapeLayer *bottomOuterCircle;
  void *v6;
  CAShapeLayer *bottomInnerCircle;
  void *v8;
  CAShapeLayer *topOuterCircle;
  void *v10;
  CAShapeLayer *topInnerCircle;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CALayer *leftLevelTic;
  double MidX;
  double v24;
  double v25;
  CALayer *rightLevelTic;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CALayer *heldLevelBottom;
  double v32;
  CALayer *heldLevelBottomBacking;
  double v34;
  CALayer *divergenceLevelBottom;
  double v36;
  CALayer *levelBottom;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v39.receiver = self;
  v39.super_class = (Class)LevelPageViewController;
  -[LevelPageViewController viewWillLayoutSubviews](&v39, "viewWillLayoutSubviews");
  degreesLabel = self->_degreesLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v4, "center");
  -[UILabel setCenter:](degreesLabel, "setCenter:");

  bottomOuterCircle = self->_bottomOuterCircle;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v6, "center");
  -[CAShapeLayer setPosition:](bottomOuterCircle, "setPosition:");

  bottomInnerCircle = self->_bottomInnerCircle;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v8, "center");
  -[CAShapeLayer setPosition:](bottomInnerCircle, "setPosition:");

  topOuterCircle = self->_topOuterCircle;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v10, "center");
  -[CAShapeLayer setPosition:](topOuterCircle, "setPosition:");

  topInnerCircle = self->_topInnerCircle;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v12, "center");
  -[CAShapeLayer setPosition:](topInnerCircle, "setPosition:");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LevelPageViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  leftLevelTic = self->_leftLevelTic;
  v40.origin.x = v15;
  v40.origin.y = v17;
  v40.size.width = v19;
  v40.size.height = v21;
  MidX = CGRectGetMidX(v40);
  v41.origin.x = v15;
  v41.origin.y = v17;
  v41.size.width = v19;
  v41.size.height = v21;
  v24 = MidX - CGRectGetWidth(v41) * 0.5;
  -[CALayer bounds](self->_leftLevelTic, "bounds");
  v25 = v24 + CGRectGetWidth(v42) * 0.5;
  v43.origin.x = v15;
  v43.origin.y = v17;
  v43.size.width = v19;
  v43.size.height = v21;
  -[CALayer setPosition:](leftLevelTic, "setPosition:", v25, CGRectGetMidY(v43));
  rightLevelTic = self->_rightLevelTic;
  v44.origin.x = v15;
  v44.origin.y = v17;
  v44.size.width = v19;
  v44.size.height = v21;
  v27 = CGRectGetMidX(v44);
  v45.origin.x = v15;
  v45.origin.y = v17;
  v45.size.width = v19;
  v45.size.height = v21;
  v28 = v27 + CGRectGetWidth(v45) * 0.5;
  -[CALayer bounds](self->_rightLevelTic, "bounds");
  v29 = v28 - CGRectGetWidth(v46) * 0.5;
  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  -[CALayer setPosition:](rightLevelTic, "setPosition:", v29, CGRectGetMidY(v47));
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v30 = v17 + CGRectGetHeight(v48) * 0.5;
  heldLevelBottom = self->_heldLevelBottom;
  v49.origin.x = v15;
  v49.origin.y = v30;
  v49.size.width = v19;
  v49.size.height = v21;
  v32 = CGRectGetMidX(v49);
  v50.origin.x = v15;
  v50.origin.y = v30;
  v50.size.width = v19;
  v50.size.height = v21;
  -[CALayer setPosition:](heldLevelBottom, "setPosition:", v32, CGRectGetMinY(v50));
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  v51.origin.x = v15;
  v51.origin.y = v30;
  v51.size.width = v19;
  v51.size.height = v21;
  v34 = CGRectGetMidX(v51);
  v52.origin.x = v15;
  v52.origin.y = v30;
  v52.size.width = v19;
  v52.size.height = v21;
  -[CALayer setPosition:](heldLevelBottomBacking, "setPosition:", v34, CGRectGetMinY(v52));
  divergenceLevelBottom = self->_divergenceLevelBottom;
  v53.origin.x = v15;
  v53.origin.y = v30;
  v53.size.width = v19;
  v53.size.height = v21;
  v36 = CGRectGetMidX(v53);
  v54.origin.x = v15;
  v54.origin.y = v30;
  v54.size.width = v19;
  v54.size.height = v21;
  -[CALayer setPosition:](divergenceLevelBottom, "setPosition:", v36, CGRectGetMinY(v54));
  levelBottom = self->_levelBottom;
  v55.origin.x = v15;
  v55.origin.y = v30;
  v55.size.width = v19;
  v55.size.height = v21;
  v38 = CGRectGetMidX(v55);
  v56.origin.x = v15;
  v56.origin.y = v30;
  v56.size.width = v19;
  v56.size.height = v21;
  -[CALayer setPosition:](levelBottom, "setPosition:", v38, CGRectGetMinY(v56));
  -[LevelPageViewController updateLevelWithForcedInterfaceUpdate:](self, "updateLevelWithForcedInterfaceUpdate:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LevelPageViewController;
  -[LevelPageViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "userDefaultsChanged:", NSUserDefaultsDidChangeNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "updateDisplay:"));
  displayLink = self->_displayLink;
  self->_displayLink = v6;

  v8 = self->_displayLink;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, NSDefaultRunLoopMode);

  -[LevelPageViewController notifyViewShown](self, "notifyViewShown");
}

- (void)viewDidDisappear:(BOOL)a3
{
  UIImpactFeedbackGenerator *impactGenerator;
  void *v5;
  void *v6;
  CADisplayLink *displayLink;
  void *v8;
  CADisplayLink *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LevelPageViewController;
  -[LevelPageViewController viewDidDisappear:](&v10, "viewDidDisappear:", a3);
  -[UIImpactFeedbackGenerator deactivate](self->_impactGenerator, "deactivate");
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "setIdleTimerDisabled:", 0);

  displayLink = self->_displayLink;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v8, NSDefaultRunLoopMode);

  v9 = self->_displayLink;
  self->_displayLink = 0;

  -[LevelPageViewController notifyViewHidden](self, "notifyViewHidden");
}

- (void)updateTicsForOrientation:(int64_t)a3
{
  _BOOL8 v4;

  v4 = (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFCLL;
  -[CALayer setHidden:](self->_leftLevelTic, "setHidden:", v4);
  -[CALayer setHidden:](self->_rightLevelTic, "setHidden:", v4);
}

- (void)userDefaultsChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  self->_zeroRange = (double)objc_msgSend(v4, "BOOLForKey:", CFSTR("0.5"));

}

- (void)toggleHold:(id)a3
{
  int64_t orientation;
  void *v5;
  void *v6;

  +[CATransaction begin](CATransaction, "begin", a3);
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->_isHeld)
  {
    self->_isHeld = 0;
    -[CALayer setHidden:](self->_heldLevelBottom, "setHidden:", 1);
    -[CALayer setHidden:](self->_heldLevelBottomBacking, "setHidden:", 1);
    -[CALayer setHidden:](self->_divergenceLevelBottom, "setHidden:", 1);
    -[CAShapeLayer setHidden:](self->_topInnerCircle, "setHidden:", 0);
    -[CAShapeLayer setHidden:](self->_bottomInnerCircle, "setHidden:", 0);
    -[CAShapeLayer setHidden:](self->_topOuterCircle, "setHidden:", 0);
    -[CAShapeLayer setHidden:](self->_bottomOuterCircle, "setHidden:", 0);
    -[LevelPageViewController setHoldAttitude:](self, "setHoldAttitude:", 0);
    -[LevelPageViewController updateTicsForOrientation:](self, "updateTicsForOrientation:", self->_orientation);
  }
  else
  {
    self->_isHeld = 1;
    orientation = self->_orientation;
    self->_heldOrientation = orientation;
    if ((unint64_t)(orientation - 5) > 1)
    {
      self->_holdAngle = self->_currentRotation;
      self->_holdShift = self->_currentShift;
      -[CALayer setHidden:](self->_heldLevelBottom, "setHidden:", 0);
      -[CALayer setHidden:](self->_heldLevelBottomBacking, "setHidden:", 0);
      -[CALayer setHidden:](self->_divergenceLevelBottom, "setHidden:", 0);
      -[CAShapeLayer setHidden:](self->_topInnerCircle, "setHidden:", 1);
      -[CAShapeLayer setHidden:](self->_bottomInnerCircle, "setHidden:", 1);
      -[CAShapeLayer setHidden:](self->_topOuterCircle, "setHidden:", 1);
      -[CAShapeLayer setHidden:](self->_bottomOuterCircle, "setHidden:", 1);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMMotionManager deviceMotion](self->_manager, "deviceMotion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));
      -[LevelPageViewController setHoldAttitude:](self, "setHoldAttitude:", v6);

    }
  }
  -[LevelPageViewController updateLevelWithForcedInterfaceUpdate:](self, "updateLevelWithForcedInterfaceUpdate:", 1);
  -[LevelPageViewController updateColors](self, "updateColors");
  +[CATransaction commit](CATransaction, "commit");
}

- (CMAttitude)holdAttitude
{
  return self->_holdAttitude;
}

- (void)setHoldAttitude:(id)a3
{
  objc_storeStrong((id *)&self->_holdAttitude, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactConfig, 0);
  objc_storeStrong((id *)&self->_impactGenerator, 0);
  objc_storeStrong((id *)&self->_levelIdleTimer, 0);
  objc_storeStrong((id *)&self->_holdRecognizer, 0);
  objc_storeStrong((id *)&self->_holdAttitude, 0);
  objc_storeStrong((id *)&self->_rightLevelTic, 0);
  objc_storeStrong((id *)&self->_leftLevelTic, 0);
  objc_storeStrong((id *)&self->_topInnerCircle, 0);
  objc_storeStrong((id *)&self->_topOuterCircle, 0);
  objc_storeStrong((id *)&self->_bottomInnerCircle, 0);
  objc_storeStrong((id *)&self->_bottomOuterCircle, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_degreesLabel, 0);
  objc_storeStrong((id *)&self->_ticContainer, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_levelHoldContainer, 0);
  objc_storeStrong((id *)&self->_levelContainer, 0);
  objc_storeStrong((id *)&self->_filterContainer, 0);
  objc_storeStrong((id *)&self->_heldLevelBottomBacking, 0);
  objc_storeStrong((id *)&self->_divergenceLevelBottom, 0);
  objc_storeStrong((id *)&self->_heldLevelBottom, 0);
  objc_storeStrong((id *)&self->_levelBottom, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)notifyViewShown
{
  uint64_t v2;
  LevelPageViewController *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v2 = qword_10047AB68;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047AB68, sub_10011E814);
  v4 = qword_1004AF6B8;
  *(_BYTE *)(qword_1004AF6B8 + 16) = 1;
  v5 = v4 + OBJC_IVAR____TtC7Measure14MetricsManager_measurementState;
  swift_beginAccess(v4 + OBJC_IVAR____TtC7Measure14MetricsManager_measurementState, v6, 1, 0);
  *(_BYTE *)(v5 + 72) = 1;

}

- (void)notifyViewHidden
{
  uint64_t v2;
  LevelPageViewController *v3;
  LevelPageViewController *v4;

  v2 = qword_10047AB68;
  v3 = self;
  if (v2 != -1)
  {
    v4 = v3;
    swift_once(&qword_10047AB68, sub_10011E814);
    v3 = v4;
  }
  *(_BYTE *)(qword_1004AF6B8 + 16) = 0;

}

- (id)labelFont
{
  return sub_1001980C8();
}

@end
