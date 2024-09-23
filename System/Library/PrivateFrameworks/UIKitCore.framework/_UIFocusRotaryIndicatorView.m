@implementation _UIFocusRotaryIndicatorView

+ (id)createRotaryIndicatorInView:(id)a3
{
  id v3;
  double v4;
  int v5;
  double v6;
  double v7;
  _UIFocusRotaryIndicatorView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v4 = 80.0;
  else
    v4 = *(double *)&qword_1ECD76B50;
  v5 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B98, (uint64_t)CFSTR("RotaryFocusRingInset"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v6 = *(double *)&qword_1ECD76BA0 + *(double *)&qword_1ECD76BA0;
  if (v5)
    v6 = 44.0;
  v7 = v4 + v6;
  v8 = -[_UIFocusRotaryIndicatorView initWithFrame:]([_UIFocusRotaryIndicatorView alloc], "initWithFrame:", 0.0, 0.0, v7, v7);
  -[_UIFocusRotaryIndicatorView toggleVisible:animated:](v8, "toggleVisible:animated:", 0, 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
  -[UIView layer](v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZPosition:", 100.0);

  objc_msgSend(v3, "addSubview:", v8);
  v23 = (void *)MEMORY[0x1E0D156E0];
  -[UIView widthAnchor](v8, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  -[UIView heightAnchor](v8, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  -[UIView topAnchor](v8, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B88, (uint64_t)CFSTR("RotaryFocusRingMargin"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v14 = *(double *)&qword_1ECD76B90;
  if (v13)
    v14 = 40.0;
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v15;
  objc_msgSend(v3, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView trailingAnchor](v8, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B88, (uint64_t)CFSTR("RotaryFocusRingMargin"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v19 = *(double *)&qword_1ECD76B90;
  if (v18)
    v19 = 40.0;
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v21);

  return v8;
}

- (_UIFocusRotaryIndicatorView)initWithFrame:(CGRect)a3
{
  _UIFocusRotaryIndicatorView *v3;
  _UIFocusRotaryIndicatorView *v4;
  void *v5;
  double v6;
  int v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *rotaryScrubCenterPunchout;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *roundPointerView;
  UIView *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  UIView *v24;
  UIView *ringView;
  id v26;
  uint64_t v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  UIView *v34;
  double v35;
  double v36;
  uint64_t v37;
  UIView *fingerPositionContainerView;
  UIView *v39;
  UIView *fingerPositionView;
  UIView *v41;
  void *v42;
  void *v43;
  int v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  _UIFocusRotaryRingArrowView *v49;
  _UIFocusRotaryRingArrowView *upArrow;
  _UIFocusRotaryRingArrowView *v51;
  _UIFocusRotaryRingArrowView *downArrow;
  _UIFocusRotaryRingArrowView *v53;
  _UIFocusRotaryRingArrowView *v54;
  _UIFocusRotaryRingArrowView *leftArrow;
  _UIFocusRotaryRingArrowView *v56;
  _UIFocusRotaryRingArrowView *v57;
  _UIFocusRotaryRingArrowView *rightArrow;
  _UIFocusRotaryRingArrowView *v59;
  void *v60;
  int v61;
  double v62;
  void *v63;
  int v64;
  double v65;
  void *v66;
  int v67;
  double v68;
  void *v69;
  int v70;
  double v71;
  void *v72;
  int v73;
  double v74;
  void *v75;
  int v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  int v85;
  double v86;
  void *v87;
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
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  CGAffineTransform v138;
  CGAffineTransform v139;
  CGAffineTransform v140;
  objc_super v141;
  _QWORD v142[23];

  v142[20] = *MEMORY[0x1E0C80C00];
  v141.receiver = self;
  v141.super_class = (Class)_UIFocusRotaryIndicatorView;
  v3 = -[UIView initWithFrame:](&v141, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_visible = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__updateArrowsForCurrentFocus, CFSTR("UIFocusDidUpdateNotification"), 0);

    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v6 = 80.0;
    else
      v6 = *(double *)&qword_1ECD76B50;
    v7 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B58, (uint64_t)CFSTR("RotaryFocusRingBorderWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v8 = *(double *)&qword_1ECD76B60 + *(double *)&qword_1ECD76B60;
    if (v7)
      v8 = 32.0;
    v9 = v6 - v8;
    v10 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v9, v9);
    rotaryScrubCenterPunchout = v4->_rotaryScrubCenterPunchout;
    v4->_rotaryScrubCenterPunchout = v10;

    v12 = v4->_rotaryScrubCenterPunchout;
    +[UIColor blackColor](UIColor, "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView layer](v4->_rotaryScrubCenterPunchout, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompositingFilter:", v15);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_rotaryScrubCenterPunchout, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_rotaryScrubCenterPunchout);
    v16 = objc_alloc_init(UIView);
    roundPointerView = v4->_roundPointerView;
    v4->_roundPointerView = v16;

    v18 = v4->_roundPointerView;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UIView layer](v4->_roundPointerView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B78, (uint64_t)CFSTR("RotaryFocusRingPointerDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v22 = *(double *)&qword_1ECD76B80 * 0.5;
    if (v21)
      v22 = 12.0;
    objc_msgSend(v20, "setCornerRadius:", v22);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_roundPointerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v4->_roundPointerView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusRotaryRingConfigureShadowForLayer(v23);

    -[UIView addSubview:](v4, "addSubview:", v4->_roundPointerView);
    v24 = objc_alloc_init(UIView);
    ringView = v4->_ringView;
    v4->_ringView = v24;

    +[UIColor whiteColor](UIColor, "whiteColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v26, "CGColor");
    -[UIView layer](v4->_ringView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBorderColor:", v27);

    if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76B58, (uint64_t)CFSTR("RotaryFocusRingBorderWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v29 = 16.0;
    else
      v29 = *(double *)&qword_1ECD76B60;
    -[UIView layer](v4->_ringView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderWidth:", v29);

    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v31 = 40.0;
    else
      v31 = *(double *)&qword_1ECD76B50 * 0.5;
    -[UIView layer](v4->_ringView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", v31);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_ringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v4->_ringView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusRotaryRingConfigureShadowForLayer(v33);

    -[UIView addSubview:](v4, "addSubview:", v4->_ringView);
    v34 = [UIView alloc];
    -[UIView bounds](v4, "bounds");
    v36 = v35;
    -[UIView bounds](v4, "bounds");
    v37 = -[UIView initWithFrame:](v34, "initWithFrame:", 0.0, 0.0, v36);
    fingerPositionContainerView = v4->_fingerPositionContainerView;
    v4->_fingerPositionContainerView = (UIView *)v37;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_fingerPositionContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_fingerPositionContainerView);
    v39 = objc_alloc_init(UIView);
    fingerPositionView = v4->_fingerPositionView;
    v4->_fingerPositionView = v39;

    v41 = v4->_fingerPositionView;
    +[UIColor blackColor](UIColor, "blackColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

    -[UIView layer](v4->_fingerPositionView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B68, (uint64_t)CFSTR("RotaryFocusRingFingerPositionDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v45 = *(double *)&qword_1ECD76B70 * 0.5;
    if (v44)
      v45 = 6.0;
    objc_msgSend(v43, "setCornerRadius:", v45);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_fingerPositionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4->_fingerPositionContainerView, "addSubview:", v4->_fingerPositionView);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v46 = objc_claimAutoreleasedReturnValue();
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76BA8, (uint64_t)CFSTR("RotaryFocusRingArrowWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v47 = 40.0;
    else
      v47 = *(double *)&qword_1ECD76BB0;
    if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD76BB8, (uint64_t)CFSTR("RotaryFocusRingArrowHeight"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v48 = 14.0;
    else
      v48 = *(double *)&qword_1ECD76BC0;
    v49 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    upArrow = v4->_upArrow;
    v4->_upArrow = v49;

    -[UIView addSubview:](v4, "addSubview:", v4->_upArrow);
    v51 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    downArrow = v4->_downArrow;
    v4->_downArrow = v51;

    CGAffineTransformMakeRotation(&v140, 3.14159265);
    v53 = v4->_downArrow;
    v139 = v140;
    -[UIView setTransform:](v53, "setTransform:", &v139);
    -[UIView addSubview:](v4, "addSubview:", v4->_downArrow);
    v133 = (void *)v46;
    v54 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    leftArrow = v4->_leftArrow;
    v4->_leftArrow = v54;

    CGAffineTransformMakeRotation(&v138, 4.71238898);
    v56 = v4->_leftArrow;
    v137 = v138;
    -[UIView setTransform:](v56, "setTransform:", &v137);
    -[UIView addSubview:](v4, "addSubview:", v4->_leftArrow);
    v57 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    rightArrow = v4->_rightArrow;
    v4->_rightArrow = v57;

    CGAffineTransformMakeRotation(&v136, 1.57079633);
    v59 = v4->_rightArrow;
    v135 = v136;
    -[UIView setTransform:](v59, "setTransform:", &v135);
    -[UIView addSubview:](v4, "addSubview:", v4->_rightArrow);
    -[UIView centerXAnchor](v4->_rotaryScrubCenterPunchout, "centerXAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v4, "centerXAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintEqualToAnchor:", v131);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v130;
    -[UIView centerYAnchor](v4->_rotaryScrubCenterPunchout, "centerYAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4, "centerYAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v128);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v127;
    -[UIView widthAnchor](v4->_rotaryScrubCenterPunchout, "widthAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToConstant:", v9);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v142[2] = v124;
    -[UIView heightAnchor](v4->_rotaryScrubCenterPunchout, "heightAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToConstant:", v9);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v142[3] = v122;
    -[UIView widthAnchor](v4->_roundPointerView, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v60;
    v61 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B78, (uint64_t)CFSTR("RotaryFocusRingPointerDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v62 = *(double *)&qword_1ECD76B80;
    if (v61)
      v62 = 24.0;
    objc_msgSend(v60, "constraintEqualToConstant:", v62);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v142[4] = v120;
    -[UIView heightAnchor](v4->_roundPointerView, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v63;
    v64 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B78, (uint64_t)CFSTR("RotaryFocusRingPointerDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v65 = *(double *)&qword_1ECD76B80;
    if (v64)
      v65 = 24.0;
    objc_msgSend(v63, "constraintEqualToConstant:", v65);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v142[5] = v126;
    -[UIView centerXAnchor](v4->_roundPointerView, "centerXAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v4, "centerXAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v117);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v142[6] = v116;
    -[UIView centerYAnchor](v4->_roundPointerView, "centerYAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4, "centerYAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v114);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v142[7] = v113;
    -[UIView widthAnchor](v4->_ringView, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v66;
    v67 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v68 = *(double *)&qword_1ECD76B50;
    if (v67)
      v68 = 80.0;
    objc_msgSend(v66, "constraintEqualToConstant:", v68);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v142[8] = v111;
    -[UIView heightAnchor](v4->_ringView, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v69;
    v70 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v71 = *(double *)&qword_1ECD76B50;
    if (v70)
      v71 = 80.0;
    objc_msgSend(v69, "constraintEqualToConstant:", v71);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v142[9] = v109;
    -[UIView centerXAnchor](v4->_ringView, "centerXAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v4, "centerXAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v107);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v142[10] = v106;
    -[UIView centerYAnchor](v4->_ringView, "centerYAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4, "centerYAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v104);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v142[11] = v103;
    -[UIView widthAnchor](v4->_fingerPositionContainerView, "widthAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v4, "widthAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v142[12] = v100;
    -[UIView heightAnchor](v4->_fingerPositionContainerView, "heightAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v4, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v98);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v142[13] = v97;
    -[UIView centerXAnchor](v4->_fingerPositionContainerView, "centerXAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v4, "centerXAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v142[14] = v94;
    -[UIView centerYAnchor](v4->_fingerPositionContainerView, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4, "centerYAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v142[15] = v91;
    -[UIView widthAnchor](v4->_fingerPositionView, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v72;
    v73 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B68, (uint64_t)CFSTR("RotaryFocusRingFingerPositionDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v74 = *(double *)&qword_1ECD76B70;
    if (v73)
      v74 = 12.0;
    objc_msgSend(v72, "constraintEqualToConstant:", v74);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v142[16] = v89;
    -[UIView heightAnchor](v4->_fingerPositionView, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B68, (uint64_t)CFSTR("RotaryFocusRingFingerPositionDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v77 = *(double *)&qword_1ECD76B70;
    if (v76)
      v77 = 12.0;
    objc_msgSend(v75, "constraintEqualToConstant:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v142[17] = v78;
    -[UIView centerXAnchor](v4->_fingerPositionView, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v4->_fingerPositionContainerView, "centerXAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v142[18] = v81;
    -[UIView centerYAnchor](v4->_fingerPositionView, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4->_fingerPositionContainerView, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, (uint64_t)CFSTR("RotaryFocusRingDiameter"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v84 = 80.0;
    else
      v84 = *(double *)&qword_1ECD76B50;
    v85 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76B58, (uint64_t)CFSTR("RotaryFocusRingBorderWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v86 = *(double *)&qword_1ECD76B60;
    if (v85)
      v86 = 16.0;
    objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, (v84 - v86) * -0.5);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v142[19] = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 20);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v134);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIFocusDidUpdateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusRotaryIndicatorView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusRotaryIndicatorView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_UIFocusRotaryIndicatorView _updateArrowsForCurrentFocus](self, "_updateArrowsForCurrentFocus");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  int v9;
  double v10;
  double MinY;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v12.receiver = self;
  v12.super_class = (Class)_UIFocusRotaryIndicatorView;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidY = CGRectGetMidY(v14);
  _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76BA8, (uint64_t)CFSTR("RotaryFocusRingArrowWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v9 = _UIInternalPreferenceUsesDefault((int *)algn_1ECD76BB8, (uint64_t)CFSTR("RotaryFocusRingArrowHeight"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v10 = *(double *)&qword_1ECD76BC0 * 0.5;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinY = CGRectGetMinY(v15);
  if (v9)
    v10 = 7.0;
  -[UIView setCenter:](self->_upArrow, "setCenter:", MidX, MinY + v10);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  -[UIView setCenter:](self->_downArrow, "setCenter:", MidX, CGRectGetMaxY(v16) - v10);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  -[UIView setCenter:](self->_leftArrow, "setCenter:", v10 + CGRectGetMinX(v17), MidY);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  -[UIView setCenter:](self->_rightArrow, "setCenter:", CGRectGetMaxX(v18) - v10, MidY);
}

- (void)updateFailedMovementHeading:(unint64_t)a3
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RotaryFocusRingHidesArrowsOnFailedMovement, (uint64_t)CFSTR("RotaryFocusRingHidesArrowsOnFailedMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EDDA851C)
  {
    self->_failedMovementHeading = a3;
    -[_UIFocusRotaryIndicatorView _updateArrowDisplay](self, "_updateArrowDisplay");
  }
}

- (void)showArrowsForAxis:(unint64_t)a3
{
  self->_activeAxis = a3;
  -[_UIFocusRotaryIndicatorView _updateArrowDisplay](self, "_updateArrowDisplay");
}

- (void)_updateArrowDisplay
{
  unint64_t activeAxis;
  uint64_t v4;
  uint64_t v5;

  activeAxis = self->_activeAxis;
  if ((activeAxis & 2) != 0)
  {
    -[UIView setHidden:](self->_upArrow, "setHidden:", self->_failedMovementHeading & 1);
    v4 = (LOBYTE(self->_failedMovementHeading) >> 1) & 1;
  }
  else
  {
    v4 = 1;
    -[UIView setHidden:](self->_upArrow, "setHidden:", 1);
  }
  -[UIView setHidden:](self->_downArrow, "setHidden:", v4);
  if ((activeAxis & 1) != 0)
  {
    -[UIView setHidden:](self->_leftArrow, "setHidden:", (self->_failedMovementHeading >> 2) & 1);
    v5 = (LOBYTE(self->_failedMovementHeading) >> 3) & 1;
  }
  else
  {
    v5 = 1;
    -[UIView setHidden:](self->_leftArrow, "setHidden:", 1);
  }
  -[UIView setHidden:](self->_rightArrow, "setHidden:", v5);
}

- (void)toggleVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5;
  double v6;
  double v7;
  UIViewPropertyAnimator *rotaryScrubHideAnimator;
  UIView *fingerPositionContainerView;
  void *v10;
  void *v11;
  UIViewPropertyAnimator *v12;
  UISpringTimingParameters *v13;
  UIViewPropertyAnimator *v14;
  UIViewPropertyAnimator *v15;
  uint64_t v16;
  UIViewPropertyAnimator *v17;
  UIViewPropertyAnimator *v18;
  UIViewPropertyAnimator *rotaryScrubUnhideAnimator;
  UIViewPropertyAnimator *v20;
  UIViewPropertyAnimator *rotaryScrubBackwardsFingerPositionAnimator;
  UIViewPropertyAnimator *v22;
  UIViewPropertyAnimator *v23;
  UIViewPropertyAnimator *v24;
  UIViewPropertyAnimator *v25;
  UIView *v26;
  __int128 v27;
  void *v28;
  void *v29;
  UIViewPropertyAnimator *v30;
  UIViewPropertyAnimator *v31;
  uint64_t v32;
  UIViewPropertyAnimator *v33;
  UIViewPropertyAnimator *v34;
  double v35;
  double v36;
  _BYTE v37[48];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  CGAffineTransform v43;
  _QWORD v44[5];
  _QWORD v45[5];
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;

  if (self->_visible == a3)
  {
    if (self->_rotaryScrubHideAnimator)
    {
      v5 = 0;
      if (a4)
        return;
    }
    else
    {
      v5 = self->_rotaryScrubUnhideAnimator == 0;
      if (a4)
        return;
    }
    if (v5)
      return;
  }
  self->_visible = a3;
  if (a4)
  {
    if (a3)
    {
      memset(&v49, 0, sizeof(v49));
      -[_UIFocusRotaryIndicatorView _transformForWheelPosition:](self, "_transformForWheelPosition:", self->_wheelPosition);
      memset(&v48, 0, sizeof(v48));
      v47 = v49;
      CGAffineTransformRotate(&v48, &v47, -3.92699082);
      memset(&v47, 0, sizeof(v47));
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v6 = 0.1;
      else
        v6 = *(double *)&qword_1EDDA8528;
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v7 = 0.1;
      else
        v7 = *(double *)&qword_1EDDA8528;
      CGAffineTransformMakeScale(&v47, v6, v7);
      rotaryScrubHideAnimator = self->_rotaryScrubHideAnimator;
      if (!rotaryScrubHideAnimator)
      {
        fingerPositionContainerView = self->_fingerPositionContainerView;
        v46 = v48;
        -[UIView setTransform:](fingerPositionContainerView, "setTransform:", &v46);
        v46 = v47;
        -[UIView setTransform:](self, "setTransform:", &v46);
        -[UIView layer](self->_rotaryScrubCenterPunchout, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCompositingFilter:", v11);

        rotaryScrubHideAnimator = self->_rotaryScrubHideAnimator;
      }
      -[UIViewPropertyAnimator stopAnimation:](rotaryScrubHideAnimator, "stopAnimation:", 1);
      v12 = self->_rotaryScrubHideAnimator;
      self->_rotaryScrubHideAnimator = 0;

      v13 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 160.0, 16.0, 0.0, 0.0);
      v14 = [UIViewPropertyAnimator alloc];
      -[UISpringTimingParameters settlingDuration](v13, "settlingDuration");
      v15 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v14, "initWithDuration:timingParameters:", v13);
      v16 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke;
      v45[3] = &unk_1E16B1B28;
      v45[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v15, "addAnimations:", v45);
      v44[0] = v16;
      v44[1] = 3221225472;
      v44[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_3;
      v44[3] = &unk_1E16B42D0;
      v44[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v15, "addCompletion:", v44);
      v17 = [UIViewPropertyAnimator alloc];
      -[UISpringTimingParameters settlingDuration](v13, "settlingDuration");
      v18 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v17, "initWithDuration:timingParameters:", v13);
      v42[0] = v16;
      v42[1] = 3221225472;
      v42[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_4;
      v42[3] = &unk_1E16BF720;
      v42[4] = self;
      v43 = v48;
      -[UIViewPropertyAnimator addAnimations:](v18, "addAnimations:", v42);
      v41[0] = v16;
      v41[1] = 3221225472;
      v41[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_5;
      v41[3] = &unk_1E16B1B28;
      v41[4] = self;
      -[UIViewPropertyAnimator addAnimations:delayFactor:](v18, "addAnimations:delayFactor:", v41, 0.15);
      v40[0] = v16;
      v40[1] = 3221225472;
      v40[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_6;
      v40[3] = &unk_1E16B42D0;
      v40[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v18, "addCompletion:", v40);
      rotaryScrubUnhideAnimator = self->_rotaryScrubUnhideAnimator;
      self->_rotaryScrubUnhideAnimator = v15;
      v20 = v15;

      rotaryScrubBackwardsFingerPositionAnimator = self->_rotaryScrubBackwardsFingerPositionAnimator;
      self->_rotaryScrubBackwardsFingerPositionAnimator = v18;
      v22 = v18;

      -[UIViewPropertyAnimator startAnimation](v20, "startAnimation");
      -[UIViewPropertyAnimator startAnimation](v22, "startAnimation");

    }
    else
    {
      v13 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 160.0, 16.0, 0.0, 0.0);
      v30 = [UIViewPropertyAnimator alloc];
      -[UISpringTimingParameters settlingDuration](v13, "settlingDuration");
      v31 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v30, "initWithDuration:timingParameters:", v13);
      v32 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_7;
      v39[3] = &unk_1E16B1B28;
      v39[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v31, "addAnimations:", v39);
      v38[0] = v32;
      v38[1] = 3221225472;
      v38[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_8;
      v38[3] = &unk_1E16B42D0;
      v38[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v31, "addCompletion:", v38);
      v33 = self->_rotaryScrubHideAnimator;
      self->_rotaryScrubHideAnimator = v31;
      v34 = v31;

      -[UIViewPropertyAnimator startAnimation](v34, "startAnimation");
    }

  }
  else
  {
    -[UIViewPropertyAnimator stopAnimation:](self->_rotaryScrubHideAnimator, "stopAnimation:", 1);
    v23 = self->_rotaryScrubHideAnimator;
    self->_rotaryScrubHideAnimator = 0;

    -[UIViewPropertyAnimator stopAnimation:](self->_rotaryScrubUnhideAnimator, "stopAnimation:", 1);
    v24 = self->_rotaryScrubUnhideAnimator;
    self->_rotaryScrubUnhideAnimator = 0;

    -[UIViewPropertyAnimator stopAnimation:](self->_rotaryScrubBackwardsFingerPositionAnimator, "stopAnimation:", 1);
    v25 = self->_rotaryScrubBackwardsFingerPositionAnimator;
    self->_rotaryScrubBackwardsFingerPositionAnimator = 0;

    if (self->_visible)
    {
      v26 = self->_fingerPositionContainerView;
      -[_UIFocusRotaryIndicatorView _transformForWheelPosition:](self, "_transformForWheelPosition:", self->_wheelPosition);
      -[UIView setTransform:](v26, "setTransform:", v37);
      v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v49.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v49.c = v27;
      *(_OWORD *)&v49.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](self, "setTransform:", &v49);
      -[UIView setAlpha:](self, "setAlpha:", 1.0);
      -[UIView layer](self->_rotaryScrubCenterPunchout, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCompositingFilter:", v29);

    }
    else
    {
      memset(&v49, 0, sizeof(v49));
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v35 = 0.1;
      else
        v35 = *(double *)&qword_1EDDA8528;
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, (uint64_t)CFSTR("RotaryFocusRingHiddenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v36 = 0.1;
      else
        v36 = *(double *)&qword_1EDDA8528;
      CGAffineTransformMakeScale(&v49, v35, v36);
      v48 = v49;
      -[UIView setTransform:](self, "setTransform:", &v48);
      -[UIView setAlpha:](self, "setAlpha:", 0.0);
      -[UIView layer](self->_rotaryScrubCenterPunchout, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCompositingFilter:", 0);
    }

  }
}

- (void)updateWheelPosition:(double)a3
{
  UIViewPropertyAnimator *rotaryScrubBackwardsFingerPositionAnimator;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  if (self->_wheelPosition != a3)
  {
    self->_wheelPosition = a3;
    if (self->_visible)
    {
      rotaryScrubBackwardsFingerPositionAnimator = self->_rotaryScrubBackwardsFingerPositionAnimator;
      if (rotaryScrubBackwardsFingerPositionAnimator)
      {
        -[UIViewPropertyAnimator stopAnimation:](rotaryScrubBackwardsFingerPositionAnimator, "stopAnimation:", 0);
        -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_rotaryScrubBackwardsFingerPositionAnimator, "finishAnimationAtPosition:", 0);
      }
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
      -[_UIFocusRotaryIndicatorView _transformForWheelPosition:](self, "_transformForWheelPosition:", a3);
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      -[UIView setTransform:](self->_fingerPositionContainerView, "setTransform:", v6);
    }
  }
}

- (CGAffineTransform)_transformForWheelPosition:(SEL)a3
{
  return CGAffineTransformMakeRotation(retstr, (a4 + a4) * 3.14159265);
}

- (void)_updateArrowsForCurrentFocus
{
  -[_UIFocusRotaryIndicatorView showArrowsForAxis:](self, "showArrowsForAxis:", -[_UIFocusRotaryIndicatorView _calculateCurrentRotaryAxis](self, "_calculateCurrentRotaryAxis"));
}

- (unint64_t)_calculateCurrentRotaryAxis
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rotaryFocusMovementAxis");
    if ((unint64_t)(v5 - 1) > 2)
      v6 = 0;
    else
      v6 = qword_186685BC0[v5 - 1];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftArrow, 0);
  objc_storeStrong((id *)&self->_downArrow, 0);
  objc_storeStrong((id *)&self->_rightArrow, 0);
  objc_storeStrong((id *)&self->_upArrow, 0);
  objc_storeStrong((id *)&self->_rotaryScrubBackwardsFingerPositionAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubUnhideAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubHideAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubCenterPunchout, 0);
  objc_storeStrong((id *)&self->_roundPointerView, 0);
  objc_storeStrong((id *)&self->_fingerPositionView, 0);
  objc_storeStrong((id *)&self->_fingerPositionContainerView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end
