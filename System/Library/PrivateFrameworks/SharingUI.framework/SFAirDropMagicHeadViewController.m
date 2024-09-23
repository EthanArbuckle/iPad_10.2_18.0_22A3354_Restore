@implementation SFAirDropMagicHeadViewController

- (SFAirDropMagicHeadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SFAirDropMagicHeadViewController *v8;
  uint64_t v9;
  CMMotionManager *motionManager;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFAirDropMagicHeadViewController;
  v8 = -[SFAirDropMagicHeadViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    if (IsAppleInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BE901B8], "rootSettings");

    }
    v8->_initialAngleDegrees = 999.0;
    v8->_currentOrientation = 0;
    getCMMotionManagerClass();
    v9 = objc_opt_new();
    motionManager = v8->_motionManager;
    v8->_motionManager = (CMMotionManager *)v9;

    -[CMMotionManager setAccelerometerUpdateInterval:](v8->_motionManager, "setAccelerometerUpdateInterval:", 0.1);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SFMagicHeadWheelView invalidate](self->_wheelView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropMagicHeadViewController;
  -[SFAirDropMagicHeadViewController dealloc](&v3, sel_dealloc);
}

- (void)update
{
  if (-[SFAirDropMagicHeadViewController viewVisible](self, "viewVisible")
    && -[SFAirDropMagicHeadViewController enabled](self, "enabled"))
  {
    -[SFAirDropMagicHeadViewController start](self, "start");
  }
  else
  {
    -[SFAirDropMagicHeadViewController stop](self, "stop");
  }
}

- (void)start
{
  void *v3;
  CMMotionManager *motionManager;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!-[SFAirDropMagicHeadViewController motionUpdatesStarted](self, "motionUpdatesStarted"))
  {
    -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 1);

    -[SFAirDropMagicHeadViewController setMotionUpdatesStarted:](self, "setMotionUpdatesStarted:", 1);
    location = 0;
    objc_initWeak(&location, self);
    motionManager = self->_motionManager;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__SFAirDropMagicHeadViewController_start__block_invoke;
    v6[3] = &unk_24CE0F180;
    objc_copyWeak(&v7, &location);
    -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __41__SFAirDropMagicHeadViewController_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "handleDeviceMotion:", v5);

    v3 = v5;
  }

}

- (void)stop
{
  void *v3;

  if (-[SFAirDropMagicHeadViewController motionUpdatesStarted](self, "motionUpdatesStarted"))
  {
    -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 0);

    -[SFAirDropMagicHeadViewController setMotionUpdatesStarted:](self, "setMotionUpdatesStarted:", 0);
    -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
    -[CMMotionManager stopAccelerometerUpdates](self->_motionManager, "stopAccelerometerUpdates");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[SFAirDropMagicHeadViewController update](self, "update");
  }
}

- (BOOL)shouldBeHidden
{
  return objc_msgSend((id)*MEMORY[0x24BEBDF78], "activeInterfaceOrientation") != 1;
}

- (void)viewDidLoad
{
  void *v3;
  SFMagicHeadWheelView *v4;
  unint64_t v5;
  double v6;
  id v7;
  double *v8;
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
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
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
  SFMagicHeadWheelView *v76;
  void *v77;
  void *v78;
  objc_super v79;
  _QWORD v80[6];

  v80[4] = *MEMORY[0x24BDAC8D0];
  v79.receiver = self;
  v79.super_class = (Class)SFAirDropMagicHeadViewController;
  -[SFAirDropMagicHeadViewController viewDidLoad](&v79, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropMagicHeadViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v77);

  -[SFAirDropMagicHeadViewController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SFMagicHeadWheelView alloc];
  v5 = -[SFAirDropMagicHeadViewController numberOfDots](self, "numberOfDots");
  -[SFAirDropMagicHeadViewController dotsRadius](self, "dotsRadius");
  v76 = -[SFMagicHeadWheelView initWithNumberOfDots:dotsRadius:isMagicHead:](v4, "initWithNumberOfDots:dotsRadius:isMagicHead:", v5, -[SFAirDropMagicHeadViewController isMagicHead](self, "isMagicHead"), v6);
  -[SFMagicHeadWheelView setDelegate:](v76, "setDelegate:", self);
  -[SFMagicHeadWheelView setEnabled:](v76, "setEnabled:", -[SFAirDropMagicHeadViewController enabled](self, "enabled"));
  objc_msgSend(v78, "addSubview:", v76);
  if (!-[SFAirDropMagicHeadViewController isMagicHead](self, "isMagicHead"))
  {
    v7 = objc_alloc(MEMORY[0x24BEBD708]);
    v8 = (double *)MEMORY[0x24BDBF090];
    v75 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    SFFontForTextStyleWithAdditionalSymbolicTraits((void *)*MEMORY[0x24BEBE1D0], 0x8000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFont:", v9);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTextColor:", v10);

    objc_msgSend(v75, "setAlpha:", 0.0);
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    objc_msgSend(v75, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFont:", v11);

    objc_msgSend(v75, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTextColor:", v12);

    objc_msgSend(v75, "alpha");
    objc_msgSend(v74, "setAlpha:");
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v70);
    objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v78, "addSubview:", v73);
    objc_msgSend(v73, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v75);

    objc_msgSend(v73, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v74);

    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v73, "leftAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leftAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v68;
    objc_msgSend(v73, "rightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "rightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v66;
    objc_msgSend(v73, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v18;
    objc_msgSend(v73, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v22);

    objc_msgSend(v78, "addSubview:", v73);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    SFFontForTextStyleWithAdditionalSymbolicTraits((void *)*MEMORY[0x24BEBE1F0], 0x8000);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v24);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextColor:", v25);

    objc_msgSend(v78, "addSubview:", v23);
    objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v26) = 1148846080;
    objc_msgSend(v75, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    objc_msgSend(v75, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    objc_msgSend(v75, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView bottomAnchor](v76, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -14.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    objc_msgSend(v75, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView centerXAnchor](v76, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v34) = 1148846080;
    objc_msgSend(v74, "setContentCompressionResistancePriority:forAxis:", 1, v34);
    LODWORD(v35) = 1148846080;
    objc_msgSend(v74, "setContentCompressionResistancePriority:forAxis:", 0, v35);
    objc_msgSend(v74, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView bottomAnchor](v76, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -14.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    objc_msgSend(v74, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView centerXAnchor](v76, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v42) = 1148846080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 1, v42);
    LODWORD(v43) = 1148846080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v43);
    objc_msgSend(v23, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 3.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    objc_msgSend(v23, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView centerXAnchor](v76, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    objc_msgSend(v23, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[SFAirDropMagicHeadViewController setNameLabel:](self, "setNameLabel:", v75);
    -[SFAirDropMagicHeadViewController setNameLabel2:](self, "setNameLabel2:", v74);
    -[SFAirDropMagicHeadViewController setSecondLabel:](self, "setSecondLabel:", v23);
    -[SFAirDropMagicHeadViewController resetSecondLabel](self, "resetSecondLabel");
    objc_msgSend(v23, "setAlpha:", 0.0);

  }
  -[SFMagicHeadWheelView setTranslatesAutoresizingMaskIntoConstraints:](v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFMagicHeadWheelView topAnchor](v76, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[SFMagicHeadWheelView rightAnchor](v76, "rightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  -[SFMagicHeadWheelView leftAnchor](v76, "leftAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leftAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  if (-[SFAirDropMagicHeadViewController isMagicHead](self, "isMagicHead"))
  {
    -[SFMagicHeadWheelView bottomAnchor](v76, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

  }
  else
  {
    -[SFMagicHeadWheelView heightAnchor](v76, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", 189.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setActive:", 1);
  }

  -[SFAirDropMagicHeadViewController setWheelView:](self, "setWheelView:", v76);
}

- (void)resetSecondLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  SFLocalizedStringForKeyInStringsFileNamed();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAirDropMagicHeadViewController;
  -[SFAirDropMagicHeadViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  magic_head_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_212728000, v4, OS_LOG_TYPE_DEFAULT, "AirDrop magic head will appear", v5, 2u);
  }

  -[SFAirDropMagicHeadViewController setViewVisible:](self, "setViewVisible:", 1);
  -[SFAirDropMagicHeadViewController update](self, "update");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAirDropMagicHeadViewController;
  -[SFAirDropMagicHeadViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[SFAirDropMagicHeadViewController setViewVisible:](self, "setViewVisible:", 0);
  -[SFAirDropMagicHeadViewController update](self, "update");
  magic_head_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_212728000, v4, OS_LOG_TYPE_DEFAULT, "AirDrop magic head did disappear", v5, 2u);
  }

}

- (void)calculatePreferredSize
{
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;

  -[SFAirDropMagicHeadViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v4 = v3;
  v5 = *(double *)(MEMORY[0x24BEBE588] + 8);

  -[SFAirDropMagicHeadViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v4, v5);
  -[SFAirDropMagicHeadViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAirDropMagicHeadViewController;
  -[SFAirDropMagicHeadViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SFAirDropMagicHeadViewController calculatePreferredSize](self, "calculatePreferredSize");
}

- (void)updateNodes:(id)a3 withPersonToProgress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  SFAirDropMagicHeadViewController *v26;
  void *v27;
  id obj;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v25 = a4;
  v26 = self;
  -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isMagicHead") & 1) == 0)
  {
    -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedHead");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v24, "containsObject:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_5;
    -[SFAirDropMagicHeadViewController wheelView](v26, "wheelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lostSelectedNode");

    -[SFAirDropMagicHeadViewController secondLabel](v26, "secondLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);
  }

LABEL_5:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v24;
  v12 = 0;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    LODWORD(v15) = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        magic_head_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v17, "rangingMeasurement");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v27, "timestampTicks");
          objc_msgSend(v17, "rangingMeasurement");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timestampTicks");
          SFUpTicksDiffFromNowToString();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v35 = v17;
          v36 = 2048;
          v37 = v19;
          v38 = 2112;
          v39 = v21;
          _os_log_debug_impl(&dword_212728000, v18, OS_LOG_TYPE_DEBUG, "Inspecting if selection has changed for %@ %llu (%@)", buf, 0x20u);

        }
        if (!v12)
        {
          if (objc_msgSend(v17, "selectionReason"))
            v12 = v17;
          else
            v12 = 0;
        }
        v15 = (objc_msgSend(v17, "isUltraWideBindCapable") ^ 1) & v15;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 1;
  }

  -[SFAirDropMagicHeadViewController wheelView](v26, "wheelView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateSelectedNode:", v12);

  -[SFAirDropMagicHeadViewController wheelView](v26, "wheelView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNoUWBCapableDevices:", v15);

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __69__SFAirDropMagicHeadViewController_updateNodes_withPersonToProgress___block_invoke;
  v29[3] = &unk_24CE0F1A8;
  v29[4] = v26;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v29);

}

uint64_t __69__SFAirDropMagicHeadViewController_updateNodes_withPersonToProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscribedProgress:forPersonWithRealName:", a3, a2);
}

- (void)updateLabels
{
  uint64_t v3;
  void *v4;
  void (**v5)(void *, void *);
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, double);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD aBlock[5];
  CGAffineTransform v37;
  CGAffineTransform v38;

  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeScale(&v38, 0.85, 0.85);
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke;
  aBlock[3] = &unk_24CE0F1D0;
  v37 = v38;
  aBlock[4] = self;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_2;
  v34[3] = &unk_24CE0F1F8;
  v4 = _Block_copy(aBlock);
  v35 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(v34);
  v30[0] = v3;
  v30[1] = 3221225472;
  v30[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_3;
  v30[3] = &unk_24CE0F248;
  v32 = 0x3FD0000000000000;
  v33 = 608;
  v6 = v4;
  v31 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(v30);
  -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  if (v9 == 0.0)
    -[SFAirDropMagicHeadViewController nameLabel](self, "nameLabel");
  else
    -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedHead");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v27 = v6;
    v29[0] = v3;
    v29[1] = 3221225472;
    v29[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_5;
    v29[3] = &__block_descriptor_48_e20_v24__0__UILabel_8d16l;
    v29[4] = 0x3FD0000000000000;
    v29[5] = 608;
    v13 = (void (**)(_QWORD, _QWORD, double))_Block_copy(v29);
    -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedHead");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "node");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayNameForLocale:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v27;
    objc_msgSend(v10, "alpha");
    if (v19 == 0.0)
    {
      objc_msgSend(v10, "setText:", v18);
      v5[2](v5, v10);
      ((void (**)(_QWORD, void *, double))v13)[2](v13, v10, 0.0);
      -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, double))v13)[2](v13, v20, 0.0);
LABEL_17:

      goto LABEL_18;
    }
    v7[2](v7, v10);
    -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = v21;
    v24 = v23;
    if (v22 == v23)
    {

    }
    else
    {
      if ((v22 == 0) == (v23 != 0))
      {

LABEL_15:
        -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2", v27);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v25 = objc_msgSend(v22, "isEqual:", v23);

      if (!v25)
        goto LABEL_15;
    }
    -[SFAirDropMagicHeadViewController nameLabel](self, "nameLabel", v27);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v20 = (void *)v26;

    objc_msgSend(v20, "setText:", v18);
    v5[2](v5, v20);
    ((void (**)(_QWORD, void *, double))v13)[2](v13, v20, 0.15);
    v6 = v28;
    goto LABEL_17;
  }
  v7[2](v7, v10);
  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v13 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v13);
LABEL_18:

}

void __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _OWORD v5[3];

  v3 = a2;
  v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "setTransform:", v5);
  objc_msgSend(v3, "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "resetSecondLabel");

}

void __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

void __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BEBDB00];
  v5 = *(double *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_4;
  v9[3] = &unk_24CE0F220;
  v7 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", v6, v9, 0, v5, 0.0);

}

uint64_t __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_5(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = (void *)MEMORY[0x24BEBDB00];
  v7 = *(double *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_6;
  v10[3] = &unk_24CE0F270;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", v8, v10, 0, v7, a3);

}

uint64_t __48__SFAirDropMagicHeadViewController_updateLabels__block_invoke_6(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (id)headForRealName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;

  v4 = a3;
  -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedHead");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "realName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_6;
  }
  if ((v9 != 0) == (v8 == 0))
  {

    v12 = 0;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v8, "isEqual:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_6:
    -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedHead");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[SFAirDropMagicHeadViewController headForRealName:](self, "headForRealName:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProgress:", v7);

}

- (void)resetTransferStateWithRealName:(id)a3
{
  id v3;

  -[SFAirDropMagicHeadViewController headForRealName:](self, "headForRealName:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetTransferState");

}

- (void)userSelectedWithRealName:(id)a3
{
  id v3;

  -[SFAirDropMagicHeadViewController headForRealName:](self, "headForRealName:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidSelect");

}

- (void)transferCancelledToPerson:(id)a3
{
  id v3;

  -[SFAirDropMagicHeadViewController headForRealName:](self, "headForRealName:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidCancel");

}

- (void)magicHeadChangedFacingDegree:(double)a3
{
  char v5;
  id v6;
  id v7;

  -[SFAirDropMagicHeadViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SFAirDropMagicHeadViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "magicHeadViewControllerChangedFacingDegree:", a3);

  }
}

- (void)magicHeadChangedSelectionToNode:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  magic_head_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "Switched selected head to %@", (uint8_t *)&v6, 0xCu);
  }

  -[SFAirDropMagicHeadViewController updateLabels](self, "updateLabels");
}

- (void)magicHeadSelectedNodeTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  magic_head_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "Head tapped %@", (uint8_t *)&v7, 0xCu);
  }

  -[SFAirDropMagicHeadViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "magicHeadViewControllerToggleSelectionForNode:", v4);

}

- (void)magicHeadSelectedHeadRequestingDisabledState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = a3;
  -[SFMagicHeadWheelView selectedHead](self->_wheelView, "selectedHead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alpha");
    if (v7 == 0.0)
      -[SFAirDropMagicHeadViewController nameLabel](self, "nameLabel");
    else
      -[SFAirDropMagicHeadViewController nameLabel2](self, "nameLabel2");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0.2;
    if (!v3)
      v8 = 1.0;
    objc_msgSend(v12, "setAlpha:", v8);
    -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1.0;
    if (v3)
      v11 = 0.0;
    objc_msgSend(v9, "setAlpha:", v11);

  }
}

- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a6;
  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllAnimations");

  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 1.0);

  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v9);

  if (v10)
    v10[2](v10, 1);

}

- (void)magicHeadSelectedHeadRequestingSubtitleTextChangeForState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  switch(a3)
  {
    case 0:
      -[SFAirDropMagicHeadViewController resetSecondLabel](self, "resetSecondLabel");
      return;
    case 1:
      location = 0;
      -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v4);

      SFLocalizedStringForKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke;
      v13[3] = &unk_24CE0F2E0;
      v7 = &v14;
      objc_copyWeak(&v14, &location);
      -[SFAirDropMagicHeadViewController setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v5, v6, 1, v13);
      goto LABEL_5;
    case 2:
      location = 0;
      -[SFAirDropMagicHeadViewController secondLabel](self, "secondLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v8);

      SFLocalizedStringForKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_3;
      v11[3] = &unk_24CE0F2E0;
      v7 = &v12;
      objc_copyWeak(&v12, &location);
      -[SFAirDropMagicHeadViewController setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v5, v6, 1, v11);
LABEL_5:

      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
      return;
    case 3:
      SFLocalizedStringForKey();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropMagicHeadViewController setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v10, v9, 1, 0);
      goto LABEL_9;
    case 4:
      SFLocalizedStringForKey();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropMagicHeadViewController setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v10, v9, 1, 0);
      goto LABEL_9;
    case 5:
    case 6:
      SFLocalizedStringForKey();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropMagicHeadViewController setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v10, v9, 1, 0);
LABEL_9:

      break;
    default:
      return;
  }
}

void __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_2;
  v2[3] = &unk_24CE0F2B8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 24, v2, 0, 0.75, 0.0);
  objc_destroyWeak(&v3);
}

void __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.2);

}

void __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_4;
  v2[3] = &unk_24CE0F2B8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 24, v2, 0, 0.75, 0.0);
  objc_destroyWeak(&v3);
}

void __94__SFAirDropMagicHeadViewController_magicHeadSelectedHeadRequestingSubtitleTextChangeForState___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.2);

}

- (void)magicHeadDidStartTransferForNode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFAirDropMagicHeadViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicHeadViewControllerDidStartTransferForNode:", v5);

}

- (void)magicHeadDidTerminateTransferForNode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFAirDropMagicHeadViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicHeadViewControllerDidTerminateTransferForNode:", v5);

}

- (void)magicHeadDidFinishTransferForNode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFAirDropMagicHeadViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicHeadViewControllerDidFinishTransferForNode:", v5);

}

- (void)handleDeviceMotion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  float32x4_t v24;

  v4 = a3;
  objc_msgSend(v4, "attitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quaternion");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  *(float *)&v14 = v7;
  *(float *)&v15 = v9;
  *(float *)&v16 = v11;
  v24.i64[0] = __PAIR64__(v15, v14);
  *(float *)&v17 = v13;
  v24.i64[1] = __PAIR64__(LODWORD(v17), v16);
  CMOQuaternion::normalize(&v24, v17);
  LODWORD(v13) = CMOQuaternion::heading((CMOQuaternion *)&v24);
  -[SFAirDropMagicHeadViewController wheelView](self, "wheelView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attitude");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pitch");
  v21 = v20;
  objc_msgSend(v4, "attitude");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "roll");
  objc_msgSend(v18, "deviceRotatedToDegrees:withPitch:andRoll:", 360.0 - *(float *)&v13, v21, v23);

}

- (SFAirDropMagicHeadViewControllerDelegate)delegate
{
  return (SFAirDropMagicHeadViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfDots
{
  return self->_numberOfDots;
}

- (void)setNumberOfDots:(unint64_t)a3
{
  self->_numberOfDots = a3;
}

- (double)dotsRadius
{
  return self->_dotsRadius;
}

- (void)setDotsRadius:(double)a3
{
  self->_dotsRadius = a3;
}

- (BOOL)isMagicHead
{
  return self->_magicHead;
}

- (void)setMagicHead:(BOOL)a3
{
  self->_magicHead = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)nameLabel2
{
  return self->_nameLabel2;
}

- (void)setNameLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel2, a3);
}

- (UILabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabel, a3);
}

- (BOOL)viewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)motionUpdatesStarted
{
  return self->_motionUpdatesStarted;
}

- (void)setMotionUpdatesStarted:(BOOL)a3
{
  self->_motionUpdatesStarted = a3;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (double)initialAngleDegrees
{
  return self->_initialAngleDegrees;
}

- (void)setInitialAngleDegrees:(double)a3
{
  self->_initialAngleDegrees = a3;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (SFMagicHeadWheelView)wheelView
{
  return self->_wheelView;
}

- (void)setWheelView:(id)a3
{
  objc_storeStrong((id *)&self->_wheelView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelView, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel2, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
