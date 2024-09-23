@implementation UIDebuggingZoomViewController

- (UIDebuggingZoomViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingZoomViewController *v4;
  dispatch_group_t v5;
  OS_dispatch_group *group;
  uint64_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingZoomViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = dispatch_group_create();
    group = v4->_group;
    v4->_group = (OS_dispatch_group *)v5;

    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_currentDirection = 0;
  }
  return v4;
}

- (void)setCurrentDirection:(unint64_t)a3
{
  self->_currentDirection = a3;
  -[UIDebuggingZoomLineView setDirection:](self->_lineView, "setDirection:");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIDebuggingZoomLoupeView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UISegmentedControl *v21;
  void *v22;
  UISwitch *v23;
  void *v24;
  UISwitch *v25;
  UILabel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
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
  UISwitch *v53;
  objc_super v54;
  _QWORD v55[6];
  _QWORD v56[8];

  v56[6] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)UIDebuggingZoomViewController;
  -[UIViewController viewDidLoad](&v54, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 50.0);
  +[UIColor blackColor](UIColor, "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v7);

  -[UIDebuggingZoomViewController setLabel:](self, "setLabel:", v5);
  -[UIDebuggingZoomViewController label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(v9, "addSubview:", v5);

  v11 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 50.0);
  +[UIColor blackColor](UIColor, "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v13);

  -[UIDebuggingZoomViewController setDistanceLabel:](self, "setDistanceLabel:", v11);
  -[UIDebuggingZoomViewController distanceLabel](self, "distanceLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v11);

  v16 = objc_alloc_init(UIDebuggingZoomLoupeView);
  -[UIDebuggingZoomViewController setLoupe:](self, "setLoupe:", v16);

  -[UIDebuggingZoomViewController loupe](self, "loupe");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  -[UIDebuggingZoomViewController loupe](self, "loupe");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingZoomViewController loupe](self, "loupe");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = -[UISegmentedControl initWithItems:]([UISegmentedControl alloc], "initWithItems:", &unk_1E1A95078);
  -[UISegmentedControl setSelectedSegmentIndex:](v21, "setSelectedSegmentIndex:", 0);
  -[UIControl addTarget:action:forControlEvents:](v21, "addTarget:action:forControlEvents:", self, sel_toggleDirection_, 4096);
  -[UIDebuggingZoomViewController setDirectionSegmentedControl:](self, "setDirectionSegmentedControl:", v21);
  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

  v23 = objc_alloc_init(UISwitch);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIControl addTarget:action:forControlEvents:](v23, "addTarget:action:forControlEvents:", self, sel_toggleMode_, 4096);
  -[UIViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23;
  v53 = v23;
  objc_msgSend(v24, "addSubview:", v23);

  v26 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 20.0);
  +[UIColor blackColor](UIColor, "blackColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v26, "setTextColor:", v27);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v26, "setFont:", v28);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setText:](v26, "setText:", CFSTR("View Mode"));
  -[UIViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v26);

  v56[0] = v21;
  v55[0] = CFSTR("segment");
  v55[1] = CFSTR("loupe");
  -[UIDebuggingZoomViewController loupe](self, "loupe");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v30;
  v56[2] = v10;
  v31 = v10;
  v55[2] = CFSTR("label");
  v55[3] = CFSTR("distanceLabel");
  v56[3] = v11;
  v56[4] = v25;
  v55[4] = CFSTR("switch");
  v55[5] = CFSTR("modeLabel");
  v56[5] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 9, 0, v21, 9, 1.0, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v36);

  v37 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 3, 0, v38, 3, 1.0, 10.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[segment]-padding-[loupe(>=loupesize)]"), 0, &unk_1E1A9B5E0, v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v40);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[segment]-padding-[switch]"), 0, &unk_1E1A9B5E0, v32);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v41);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-padding-[loupe(>=loupesize)]-padding-[switch]-padding-|"), 0, &unk_1E1A9B5E0, v32);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v42);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[switch]-padding-[modeLabel]"), 0, &unk_1E1A9B5E0, v32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v43);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-padding-[loupe(>=loupesize)]-padding-[modeLabel(>=labelsize)]-padding-|"), 0, &unk_1E1A9B5E0, v32);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v44);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[loupe]-padding-[label]"), 0, &unk_1E1A9B5E0, v32);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v45);

  v46 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 9, 0, v31, 9, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v48);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[label]-5-[distanceLabel]-padding-|"), 0, &unk_1E1A9B5E0, v32);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v49);

  v50 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 9, 0, v11, 9, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v52);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v33);
  -[UIViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[UIViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 0);

}

- (void)toggleMode:(id)a3
{
  id v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  -[UIDebuggingZoomViewController setUseViewForEdges:](self, "setUseViewForEdges:", objc_msgSend(v4, "isOn"));
  v5 = objc_msgSend(v4, "isOn");

  if ((v5 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRect:", v6, v7, v8, v9);

    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsDisplay");

  }
}

- (void)toggleDirection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  UIDebuggingZoomViewController *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "selectedSegmentIndex");
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "touchCaptureEnabled");

    if ((v7 & 1) == 0)
    {
      +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTouchCaptureEnabled:", 1);

      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

    }
    if (objc_msgSend(v13, "selectedSegmentIndex") == 1)
    {
      v10 = self;
      v11 = 0;
    }
    else
    {
      v10 = self;
      v11 = 1;
    }
    -[UIDebuggingZoomViewController setCurrentDirection:](v10, "setCurrentDirection:", v11);
  }
  else
  {
    objc_msgSend(v5, "setTouchCaptureEnabled:", 0);

    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  UIDebuggingZoomLineView *v5;
  void *v6;
  void *v7;
  UIDebuggingZoomLineView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIPanGestureRecognizer *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIDebuggingZoomViewController;
  -[UIViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  -[UIDebuggingZoomViewController lineView](self, "lineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [UIDebuggingZoomLineView alloc];
    -[UIViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = -[UIDebuggingZoomLineView initWithFrame:](v5, "initWithFrame:");
    -[UIDebuggingZoomViewController setLineView:](self, "setLineView:", v8);

    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSubview:atIndex:", v13, 0);

    v14 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_updateGesture_);
    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", v14);

    -[UIDebuggingZoomViewController setPan:](self, "setPan:", v14);
    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", objc_msgSend(v17, "touchCaptureEnabled") ^ 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDebuggingZoomViewController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[UIDebuggingZoomViewController lineView](self, "lineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTouchCaptureEnabled:", 0);

}

- (void)updateGesture:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  v4 = objc_msgSend(v48, "state") == 2;
  v5 = v48;
  if (v4)
  {
    objc_msgSend(v48, "locationInView:", 0);
    v7 = v6;
    v9 = v8;
    -[UIDebuggingZoomViewController loupe](self, "loupe");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentlyInspectedPoint:", v7, v9);

    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inspectedWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hitTest:withEvent:", 0, v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    objc_msgSend(v14, "convertPoint:toView:", 0);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v13, "frame");
    v20 = v19;
    v22 = v21;

    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingZoomViewController label](self, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    if (-[UIDebuggingZoomViewController useViewForEdges](self, "useViewForEdges"))
    {
      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setRect:", v16, v18, v20, v22);

      -[UIDebuggingZoomViewController lastViewSeen](self, "lastViewSeen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[UIDebuggingZoomViewController lastViewSeen](self, "lastViewSeen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDebuggingZoomViewController drawViewLinesAtPoint:forView:](self, "drawViewLinesAtPoint:forView:", v28, v7, v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      -[UIDebuggingZoomViewController drawViewLinesAtPoint:forView:](self, "drawViewLinesAtPoint:forView:", 0, v7, v9);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIDebuggingZoomViewController drawLinesAtPoint:](self, "drawLinesAtPoint:", v7, v9);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v30;
LABEL_9:
    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "CGPointValue");
    objc_msgSend(v31, "setStart:");

    -[UIDebuggingZoomViewController lineView](self, "lineView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "CGPointValue");
    objc_msgSend(v33, "setEnd:");

    v35 = -[UIDebuggingZoomViewController currentDirection](self, "currentDirection");
    if (v35 == 1)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "end");
      v44 = v43;
      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "start");
      v42 = v44 - v45;
    }
    else
    {
      if (v35)
      {
LABEL_14:

        v5 = v48;
        goto LABEL_15;
      }
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "end");
      v39 = v38;
      -[UIDebuggingZoomViewController lineView](self, "lineView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "start");
      v42 = v39 - v41;
    }
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingZoomViewController distanceLabel](self, "distanceLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setText:", v46);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)toggleMeasuring:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "touchCaptureEnabled");

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTouchCaptureEnabled:", v5 ^ 1);

  -[UIDebuggingZoomViewController lineView](self, "lineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5);

}

- (id)drawLinesAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CGImage *image;
  void *v7;
  void *v8;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGDataProvider *DataProvider;
  const UInt8 *BytePtr;
  const UInt8 *v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFData *cf;
  _QWORD v37[13];
  _QWORD block[12];
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;

  y = a3.y;
  x = a3.x;
  image = self->_image;
  if (!image)
  {
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inspectedWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "frame");
    self->_image = -[UIDebuggingZoomViewController newCaptureSnapshotAtRect:window:](self, "newCaptureSnapshotAtRect:window:", v8);

    image = self->_image;
  }
  BitsPerPixel = CGImageGetBitsPerPixel(image);
  BytesPerRow = CGImageGetBytesPerRow(image);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;

  DataProvider = CGImageGetDataProvider(image);
  cf = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(cf);
  if (BytePtr)
  {
    v17 = BytePtr;
    v43 = 0;
    v44 = (double *)&v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = (double *)&v39;
    v41 = 0x2020000000;
    v42 = 0;
    v18 = round(x * v14);
    v19 = round(y * v14);
    if (-[UIDebuggingZoomViewController currentDirection](self, "currentDirection"))
      v20 = v18;
    else
      v20 = v19;
    v40[3] = v20;
    v44[3] = v20;
    -[UIDebuggingZoomViewController group](self, "group");
    v21 = objc_claimAutoreleasedReturnValue();
    -[UIDebuggingZoomViewController queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke;
    block[3] = &unk_1E16E7EF0;
    *(double *)&block[6] = v18;
    *(double *)&block[7] = v19;
    block[8] = BytesPerRow;
    block[9] = BitsPerPixel;
    block[10] = v17;
    block[11] = &v17[(int)(v19 * (double)BytesPerRow + v18 * (double)(BitsPerPixel >> 3))];
    block[4] = self;
    block[5] = &v43;
    dispatch_group_async(v21, v22, block);

    -[UIDebuggingZoomViewController group](self, "group");
    v24 = objc_claimAutoreleasedReturnValue();
    -[UIDebuggingZoomViewController queue](self, "queue");
    v25 = objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke_2;
    v37[3] = &unk_1E16E7F18;
    *(double *)&v37[7] = v18;
    *(double *)&v37[8] = v19;
    v37[9] = BytesPerRow;
    v37[10] = BitsPerPixel;
    v37[11] = v17;
    v37[12] = &v17[(int)(v19 * (double)BytesPerRow + v18 * (double)(BitsPerPixel >> 3))];
    v37[4] = self;
    v37[5] = &v39;
    v37[6] = image;
    dispatch_group_async(v24, v25, v37);

    -[UIDebuggingZoomViewController group](self, "group");
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

    v27 = -[UIDebuggingZoomViewController currentDirection](self, "currentDirection");
    v28 = v40[3] / v14;
    if (v27)
    {
      v29 = v44[3] / v14;
      v30 = v19 / v14;
      v31 = v40[3] / v14;
      v28 = v30;
    }
    else
    {
      v29 = v18 / v14;
      v30 = v44[3] / v14;
      v31 = v18 / v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v31, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v33);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
  }
  CFRelease(cf);
  v34 = (void *)objc_msgSend(v11, "copy");

  return v34;
}

uint64_t __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  float v12;
  uint64_t result;
  double v14;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56) + 1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "currentDirection"))
    v4 = v2;
  else
    v4 = v3;
  if (v4 > 0.0)
  {
    do
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "currentDirection");
      v6 = v3 + -1.0;
      v7 = v2 + -1.0;
      if (v5)
        v2 = v2 + -1.0;
      else
        v3 = v3 + -1.0;
      if (v5)
        v6 = v7;
      v8 = *(_QWORD *)(a1 + 88);
      v9 = 0.0;
      if (*(_BYTE *)(v8 + 3))
      {
        v10 = *(_QWORD *)(a1 + 80)
            + (int)(v3 * (double)*(unint64_t *)(a1 + 64) + v2 * (double)(*(_QWORD *)(a1 + 72) >> 3));
        if (*(_BYTE *)(v10 + 3))
        {
          for (i = 1; i != 4; ++i)
            v9 = v9
               + (double)((*(unsigned __int8 *)(v8 + i) - *(unsigned __int8 *)(v10 + i))
                        * (*(unsigned __int8 *)(v8 + i) - *(unsigned __int8 *)(v10 + i)));
          v12 = v9;
          v9 = sqrtf(v12);
        }
      }
    }
    while (v9 <= 10.0 && v6 > 0.0);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "currentDirection");
  if (result)
    v14 = v2;
  else
    v14 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
  return result;
}

uint64_t __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke_2(uint64_t a1)
{
  size_t Width;
  size_t Height;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  float v15;
  uint64_t result;
  double v17;

  Width = CGImageGetWidth(*(CGImageRef *)(a1 + 48));
  Height = CGImageGetHeight(*(CGImageRef *)(a1 + 48));
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v6 = objc_msgSend(*(id *)(a1 + 32), "currentDirection");
  v7 = -1.0;
  if (v6)
  {
    v4 = v4 + -1.0;
    v8 = (double)(Width - 1);
    if (v4 >= v8)
      goto LABEL_17;
    v9 = (double)(Height - 1);
  }
  else
  {
    v5 = v5 + -1.0;
    v9 = (double)(Height - 1);
    if (v5 >= v9)
      goto LABEL_17;
    v8 = (double)(Width - 1);
  }
  do
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "currentDirection", v7);
    v11 = v5 + 1.0 < v9;
    if (v10)
    {
      v11 = v4 + 1.0 < v8;
      v4 = v4 + 1.0;
    }
    else
    {
      v5 = v5 + 1.0;
    }
    v12 = *(_QWORD *)(a1 + 96);
    v7 = 0.0;
    if (*(_BYTE *)(v12 + 3))
    {
      v13 = *(_QWORD *)(a1 + 88)
          + (int)(v5 * (double)*(unint64_t *)(a1 + 72) + v4 * (double)(*(_QWORD *)(a1 + 80) >> 3));
      if (*(_BYTE *)(v13 + 3))
      {
        for (i = 1; i != 4; ++i)
          v7 = v7
             + (double)((*(unsigned __int8 *)(v12 + i) - *(unsigned __int8 *)(v13 + i))
                      * (*(unsigned __int8 *)(v12 + i) - *(unsigned __int8 *)(v13 + i)));
        v15 = v7;
        v7 = sqrtf(v15);
      }
    }
    if (v7 > 10.0)
      v11 = 0;
  }
  while (v11);
LABEL_17:
  result = objc_msgSend(*(id *)(a1 + 32), "currentDirection");
  if (result == 1)
    v17 = v4;
  else
    v17 = v5;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17;
  return result;
}

- (id)drawViewLinesAtPoint:(CGPoint)a3 forView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _QWORD *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  y = a3.y;
  x = a3.x;
  v28[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toView:", v8, x, y);
    x = v10;
    y = v11;
  }
  else
  {
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inspectedWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "hitTest:withEvent:", 0, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIDebuggingZoomViewController currentDirection](self, "currentDirection");
  objc_msgSend(v12, "bounds");
  objc_msgSend(v12, "convertPoint:toView:", 0);
  if (v13)
  {
    v16 = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v18 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v12, "bounds");
    objc_msgSend(v18, "valueWithCGPoint:", v16 + v19, y);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    v21 = v27;
  }
  else
  {
    v22 = v15;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v23 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v12, "bounds");
    objc_msgSend(v23, "valueWithCGPoint:", x, v22 + v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    v21 = v28;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  image = self->_image;
  if (image)
    CFRelease(image);
  v4.receiver = self;
  v4.super_class = (Class)UIDebuggingZoomViewController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (CGImage)newCaptureSnapshotAtRect:(CGRect)a3 window:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  const void *v49;
  CGImage *v50;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[18];
  CGRect v68;
  CGRect v69;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v67[16] = *MEMORY[0x1E0C80C00];
  v8 = (id *)a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v55 = v11;
  v54 = v9;
  v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v63 != v56)
          objc_enumerationMutation(v55);
        v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        -[UIWindow _fbsScene](v8);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v9;
        v16 = v15;
        if (v14 == v15)
        {

        }
        else
        {
          if (!v9)
            goto LABEL_13;
          if (!v14)
            goto LABEL_13;
          objc_msgSend(v14, "settings");
          v17 = v8;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "frame");
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(v16, "settings");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "frame");
          v69.origin.x = v28;
          v69.origin.y = v29;
          v69.size.width = v30;
          v69.size.height = v31;
          v68.origin.x = v20;
          v68.origin.y = v22;
          v68.size.width = v24;
          v68.size.height = v26;
          v32 = CGRectEqualToRect(v68, v69);

          v9 = v54;
          v8 = v17;
          if (!v32)
          {
LABEL_13:

LABEL_14:
            continue;
          }
          objc_msgSend(v14, "settings");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "interfaceOrientation");
          objc_msgSend(v16, "settings");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "interfaceOrientation");

          v8 = v17;
          v37 = v34 == v36;
          v9 = v54;
          if (!v37)
            goto LABEL_14;
        }
        +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v38)
          objc_msgSend(v53, "addObject:", v13);
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v57);
  }

  v39 = objc_msgSend(v53, "count");
  MEMORY[0x1E0C80A78](v39);
  v41 = (char *)&v52 - v40;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v42 = v53;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v43)
  {
    v44 = v43;
    v45 = 0;
    v46 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v59 != v46)
          objc_enumerationMutation(v42);
        *(_DWORD *)&v41[4 * v45 + 4 * j] = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "_contextId");
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      v45 += j;
    }
    while (v44);
  }
  else
  {
    v45 = 0;
  }

  v48 = +[UIWindow createIOSurfaceWithContextIds:count:frame:](UIWindow, "createIOSurfaceWithContextIds:count:frame:", v41, v45, x, y, width, height);
  if (v48)
  {
    v49 = v48;
    v50 = _UICreateCGImageFromIOSurfaceWithOptions((CGImage *)v48, 0);
    CFRelease(v49);
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (unint64_t)currentDirection
{
  return self->_currentDirection;
}

- (UIDebuggingZoomLoupeView)loupe
{
  return self->_loupe;
}

- (void)setLoupe:(id)a3
{
  objc_storeStrong((id *)&self->_loupe, a3);
}

- (UIDebuggingZoomLineView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (UIPanGestureRecognizer)pan
{
  return self->_pan;
}

- (void)setPan:(id)a3
{
  objc_storeStrong((id *)&self->_pan, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CGImage)image
{
  return self->_image;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UILabel)distanceLabel
{
  return self->_distanceLabel;
}

- (void)setDistanceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_distanceLabel, a3);
}

- (UISegmentedControl)directionSegmentedControl
{
  return self->_directionSegmentedControl;
}

- (void)setDirectionSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_directionSegmentedControl, a3);
}

- (BOOL)useViewForEdges
{
  return self->_useViewForEdges;
}

- (void)setUseViewForEdges:(BOOL)a3
{
  self->_useViewForEdges = a3;
}

- (UIView)lastViewSeen
{
  return self->_lastViewSeen;
}

- (void)setLastViewSeen:(id)a3
{
  objc_storeStrong((id *)&self->_lastViewSeen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewSeen, 0);
  objc_storeStrong((id *)&self->_directionSegmentedControl, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_loupe, 0);
}

@end
