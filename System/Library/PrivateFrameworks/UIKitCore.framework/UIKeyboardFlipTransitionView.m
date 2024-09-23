@implementation UIKeyboardFlipTransitionView

- (UIKeyboardFlipTransitionView)initWithFrame:(CGRect)a3
{
  UIKeyboardFlipTransitionView *v3;
  UIKeyboardFlipTransitionView *v4;
  void *v5;
  uint64_t v6;
  CALayer *container;
  void *v8;
  uint64_t v9;
  CALayer *frontFace;
  uint64_t v11;
  CALayer *backFace;
  CALayer *v13;
  void *v14;
  void *v15;
  CALayer *v16;
  void *v17;
  void *v18;
  CALayer *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CALayer *frontDarkening;
  id v24;
  uint64_t v25;
  CALayer *backDarkening;
  id v27;
  uint64_t v28;
  CALayer *backDarkeningLeft;
  id v30;
  uint64_t v31;
  CALayer *backDarkeningRight;
  id v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *controlKeys;
  void *v36;
  UIKeyboardFlipTransitionView *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)UIKeyboardFlipTransitionView;
  v3 = -[UIView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    container = v4->_container;
    v4->_container = (CALayer *)v6;

    -[UIView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anchorPoint");
    -[CALayer setAnchorPoint:](v4->_container, "setAnchorPoint:");

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    frontFace = v4->_frontFace;
    v4->_frontFace = (CALayer *)v9;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    backFace = v4->_backFace;
    v4->_backFace = (CALayer *)v11;

    -[UIKeyboardSplitTransitionView initializeLayers](v4, "initializeLayers");
    v13 = v4->_frontFace;
    -[UIKeyboardSplitTransitionView backgroundLayers](v4, "backgroundLayers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v13, "addSublayer:", v15);

    v16 = v4->_backFace;
    -[UIKeyboardSplitTransitionView backgroundLayers](v4, "backgroundLayers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v16, "addSublayer:", v18);

    v19 = v4->_backFace;
    -[UIKeyboardSplitTransitionView backgroundLayers](v4, "backgroundLayers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v19, "addSublayer:", v21);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v22 = objc_claimAutoreleasedReturnValue();
    frontDarkening = v4->_frontDarkening;
    v4->_frontDarkening = (CALayer *)v22;

    +[UIColor blackColor](UIColor, "blackColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_frontDarkening, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v25 = objc_claimAutoreleasedReturnValue();
    backDarkening = v4->_backDarkening;
    v4->_backDarkening = (CALayer *)v25;

    +[UIColor blackColor](UIColor, "blackColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_backDarkening, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v28 = objc_claimAutoreleasedReturnValue();
    backDarkeningLeft = v4->_backDarkeningLeft;
    v4->_backDarkeningLeft = (CALayer *)v28;

    +[UIColor blackColor](UIColor, "blackColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_backDarkeningLeft, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v31 = objc_claimAutoreleasedReturnValue();
    backDarkeningRight = v4->_backDarkeningRight;
    v4->_backDarkeningRight = (CALayer *)v31;

    +[UIColor blackColor](UIColor, "blackColor");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_backDarkeningRight, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

    -[CALayer addSublayer:](v4->_frontFace, "addSublayer:", v4->_frontDarkening);
    -[CALayer addSublayer:](v4->_backFace, "addSublayer:", v4->_backDarkening);
    -[CALayer addSublayer:](v4->_backFace, "addSublayer:", v4->_backDarkeningLeft);
    -[CALayer addSublayer:](v4->_backFace, "addSublayer:", v4->_backDarkeningRight);
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    controlKeys = v4->_controlKeys;
    v4->_controlKeys = v34;

    -[UIView layer](v4, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSublayer:", v4->_container);

    -[CALayer addSublayer:](v4->_container, "addSublayer:", v4->_frontFace);
    -[CALayer addSublayer:](v4->_container, "addSublayer:", v4->_backFace);
    v37 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardFlipTransitionView;
    -[UIKeyboardSplitTransitionView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[UIView frame](self, "frame");
    -[UIView setCenter:](self, "setCenter:", width * 0.5, v8 * 0.5);
    -[UIView bounds](self, "bounds");
    -[CALayer setBounds:](self->_container, "setBounds:");
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "position");
    -[CALayer setPosition:](self->_container, "setPosition:");

    -[CALayer setPerspectiveDistance:](self->_container, "setPerspectiveDistance:", width);
    -[CALayer sublayers](self->_container, "sublayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__UIKeyboardFlipTransitionView_setFrame___block_invoke;
    v11[3] = &unk_1E16B40F8;
    v11[4] = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  }
}

void __41__UIKeyboardFlipTransitionView_setFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if ((id)v4[74] != v3 && (id)v4[75] != v3 && (id)v4[76] != v3 && (id)v4[77] != v3)
  {
    v5 = v3;
    objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "bounds");
    objc_msgSend(v5, "setBounds:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "position");
    objc_msgSend(v5, "setPosition:");
    v3 = v5;
  }

}

- (void)_flipToFront:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  __int128 v6;
  double v7;
  CATransform3D *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  id *p_backDarkening;
  CALayer *backDarkening;
  const __CFString *v75;
  void *v76;
  unsigned int v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  void *v85;
  __int128 v86;
  void *v87;
  __int128 v88;
  void *v89;
  UIKeyboardFlipTransitionView *v90;
  CATransform3D v91;
  CATransform3D v92;
  CATransform3D v93;
  CATransform3D v94;
  CATransform3D v95;
  CATransform3D v96;
  CATransform3D v97;

  v4 = a3;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v86 = v6;
  v88 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  if (a4)
    v7 = 0.4;
  else
    v7 = 0.0;
  *(_OWORD *)&v97.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v97.m33 = v6;
  v83 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v97.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v84 = *(_OWORD *)&v97.m41;
  *(_OWORD *)&v97.m43 = v83;
  v80 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v97.m11 = *MEMORY[0x1E0CD2610];
  v81 = *(_OWORD *)&v97.m11;
  *(_OWORD *)&v97.m13 = v80;
  v78 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v97.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v79 = *(_OWORD *)&v97.m21;
  *(_OWORD *)&v97.m23 = v78;
  memset(&v96, 0, sizeof(v96));
  CATransform3DMakeRotation(&v96, 1.57079633, 1.0, 0.0, 0.0);
  memset(&v95, 0, sizeof(v95));
  CATransform3DMakeRotation(&v95, 3.14159265, 1.0, 0.0, 0.0);
  *(_OWORD *)&v94.m31 = v88;
  *(_OWORD *)&v94.m33 = v86;
  *(_OWORD *)&v94.m41 = v84;
  *(_OWORD *)&v94.m43 = v83;
  *(_OWORD *)&v94.m11 = v81;
  *(_OWORD *)&v94.m13 = v80;
  *(_OWORD *)&v94.m21 = v79;
  *(_OWORD *)&v94.m23 = v78;
  memset(&v93, 0, sizeof(v93));
  CATransform3DMakeRotation(&v93, -1.57079633, 1.0, 0.0, 0.0);
  memset(&v92, 0, sizeof(v92));
  CATransform3DMakeRotation(&v92, -3.14159265, 1.0, 0.0, 0.0);
  v90 = self;
  v77 = v4;
  if (v4)
  {
    v97 = v95;
    v8 = &v95;
  }
  else
  {
    v94 = v92;
    v8 = &v92;
  }
  *(_OWORD *)&v8->m31 = v88;
  *(_OWORD *)&v8->m33 = v86;
  *(_OWORD *)&v8->m41 = v84;
  *(_OWORD *)&v8->m43 = v83;
  *(_OWORD *)&v8->m11 = v81;
  *(_OWORD *)&v8->m13 = v80;
  *(_OWORD *)&v8->m21 = v79;
  *(_OWORD *)&v8->m23 = v78;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v91 = v97;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v96;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v95;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v10, v11, v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99D20];
  v91 = v94;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v93;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v92;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v91);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObjects:", v15, v16, v17, 0);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRemovedOnCompletion:", 0);
  v20 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v19, "setDuration:", v7);
  objc_msgSend(v19, "setCalculationMode:", CFSTR("cubic"));
  v21 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v22) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v23, v25, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeyTimes:", v28);

  v89 = (void *)v13;
  objc_msgSend(v19, "setValues:", v13);
  -[CALayer addAnimation:forKey:](v90->_frontFace, "addAnimation:forKey:", v19, CFSTR("front flip animation"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(v29, "setFillMode:", v20);
  objc_msgSend(v29, "setDuration:", v7);
  objc_msgSend(v29, "setCalculationMode:", CFSTR("cubic"));
  v85 = v19;
  objc_msgSend(v19, "keyTimes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setKeyTimes:", v30);

  v87 = (void *)v18;
  objc_msgSend(v29, "setValues:", v18);
  v82 = v29;
  -[CALayer addAnimation:forKey:](v90->_backFace, "addAnimation:forKey:", v29, CFSTR("back flip animation"));
  v31 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v32) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = 1056964776;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "arrayWithObjects:", v33, v35, v37, v39, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("hidden"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setRemovedOnCompletion:", 0);
  objc_msgSend(v41, "setFillMode:", v20);
  objc_msgSend(v41, "setDuration:", v7);
  objc_msgSend(v41, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v41, "setKeyTimes:", v40);
  v42 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v77);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v44 = (float)v77;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v46 = (float)(v77 ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v48 = (float)(v77 ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayWithObjects:", v43, v45, v47, v49, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setValues:", v50);

  -[CALayer addAnimation:forKey:](v90->_frontFace, "addAnimation:forKey:", v41, CFSTR("front hidden animation"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("hidden"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRemovedOnCompletion:", 0);
  objc_msgSend(v51, "setFillMode:", v20);
  objc_msgSend(v51, "setDuration:", v7);
  objc_msgSend(v51, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v51, "setKeyTimes:", v40);
  v52 = (void *)MEMORY[0x1E0C99D20];
  *(float *)&v53 = (float)(v77 ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v55 = (float)(v77 ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v57 = (float)v77;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v59 = (float)v77;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "arrayWithObjects:", v54, v56, v58, v60, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setValues:", v61);

  -[CALayer addAnimation:forKey:](v90->_backFace, "addAnimation:forKey:", v51, CFSTR("back hidden animation"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setRemovedOnCompletion:", 0);
  objc_msgSend(v62, "setFillMode:", v20);
  objc_msgSend(v62, "setDuration:", v7);
  objc_msgSend(v62, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v62, "setKeyTimes:", v40);
  v63 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v64) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v66) = 1053609165;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v68) = 1053609165;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "arrayWithObjects:", v65, v67, v69, v71, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setValues:", v72);

  -[CALayer addAnimation:forKey:](v90->_frontDarkening, "addAnimation:forKey:", v62, CFSTR("darkening animation"));
  -[CALayer addAnimation:forKey:](v90->_frontDarkening, "addAnimation:forKey:", v41, CFSTR("front hidden animation"));
  if (v90->super._centerFilled)
  {
    p_backDarkening = (id *)&v90->_backDarkening;
    backDarkening = v90->_backDarkening;
    v75 = CFSTR("darkening animation");
    v76 = v62;
  }
  else
  {
    -[CALayer addAnimation:forKey:](v90->_backDarkeningLeft, "addAnimation:forKey:", v62, CFSTR("darkening animation"));
    p_backDarkening = (id *)&v90->_backDarkeningRight;
    -[CALayer addAnimation:forKey:](v90->_backDarkeningRight, "addAnimation:forKey:", v62, CFSTR("darkening animation"));
    backDarkening = v90->_backDarkeningLeft;
    v75 = CFSTR("back hidden animation");
    v76 = v51;
  }
  -[CALayer addAnimation:forKey:](backDarkening, "addAnimation:forKey:", v76, v75);
  objc_msgSend(*p_backDarkening, "addAnimation:forKey:", v51, CFSTR("back hidden animation"));

}

- (void)setShowingFrontFace:(BOOL)a3
{
  if (self->_showingFrontFace != a3)
  {
    self->_showingFrontFace = a3;
    -[UIKeyboardFlipTransitionView _flipToFront:animated:](self, "_flipToFront:animated:");
  }
}

- (CGImage)defaultKeyboardImage
{
  return 0;
}

- (CGImage)splitKeyboardImage
{
  return 0;
}

- (void)rebuildBackgroundTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CALayer **p_backFace;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _UNKNOWN **v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  void *v44;
  id v45;
  id v46;
  CGRect v47;
  CGRect v48;

  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v46 = (id)objc_claimAutoreleasedReturnValue();

  -[CALayer insertSublayer:atIndex:](self->_frontFace, "insertSublayer:atIndex:", v46, 0);
  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = self->super._centerFilled;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rivenSizeFactor:", 9.0);
  v10 = -v9;
  if ((_DWORD)v4)
  {
    p_backFace = &self->_backFace;
    -[CALayer frame](self->_backFace, "frame");
    v13 = v12;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferencesActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rivenSizeFactor:", 9.0);
    v17 = v13 + v16 + v16;
    -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
    objc_msgSend(v5, "setBounds:", v10, 0.0, v17);

    v18 = &off_1E167A000;
    v19 = v5;
  }
  else
  {
    -[UIKeyboardSliceSet leftWidth](self->super._sliceSet, "leftWidth");
    v21 = v20;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferencesActions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rivenSizeFactor:", 9.0);
    v25 = v21 + v24;
    -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
    objc_msgSend(v5, "setBounds:", v10, 0.0, v25);

    v18 = &off_1E167A000;
    -[UIKeyboardSliceSet rightWidth](self->super._sliceSet, "rightWidth");
    v27 = v26;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferencesActions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rivenSizeFactor:", 9.0);
    v31 = v27 + v30;
    -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
    objc_msgSend(v44, "setBounds:", 0.0, 0.0, v31);

    p_backFace = &self->_backFace;
    -[CALayer insertSublayer:atIndex:](self->_backFace, "insertSublayer:atIndex:", v5, 0);
    v19 = v44;
  }
  -[CALayer insertSublayer:atIndex:](*p_backFace, "insertSublayer:atIndex:", v19, 0, v44);
  -[CALayer frame](self->_frontFace, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  objc_msgSend(v18[482], "sharedPreferencesController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "preferencesActions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rivenSizeFactor:", 9.0);
  v43 = -v42;
  v47.origin.x = v33;
  v47.origin.y = v35;
  v47.size.width = v37;
  v47.size.height = v39;
  v48 = CGRectInset(v47, v43, 0.0);
  -[CALayer setFrame:](self->_frontDarkening, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);

  -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
  -[CALayer setFrame:](self->_backDarkening, "setFrame:");
  objc_msgSend(v5, "frame");
  -[CALayer setFrame:](self->_backDarkeningLeft, "setFrame:");
  objc_msgSend(v45, "frame");
  -[CALayer setFrame:](self->_backDarkeningRight, "setFrame:");
  -[CALayer setHidden:](self->_backDarkening, "setHidden:", !self->super._centerFilled);
  -[CALayer setHidden:](self->_backDarkeningLeft, "setHidden:", self->super._centerFilled);
  -[CALayer setHidden:](self->_backDarkeningRight, "setHidden:", self->super._centerFilled);
  -[CALayer addSublayer:](self->_frontFace, "addSublayer:", self->_frontDarkening);
  -[CALayer addSublayer:](self->_backFace, "addSublayer:", self->_backDarkening);
  -[CALayer addSublayer:](self->_backFace, "addSublayer:", self->_backDarkeningLeft);
  -[CALayer addSublayer:](self->_backFace, "addSublayer:", self->_backDarkeningRight);

}

- (void)rebuildControlSlicesForKeyName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableDictionary *controlKeys;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "endToken", (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(v13, "startToken");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        controlKeys = self->_controlKeys;
        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](controlKeys, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "objectForKeyedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setContents:", -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v17));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)rebuildShiftSlices
{
  -[UIKeyboardFlipTransitionView rebuildControlSlicesForKeyName:](self, "rebuildControlSlicesForKeyName:", CFSTR("Shift-Key"));
  *(_BYTE *)&self->_rebuildFlags &= ~1u;
}

- (void)rebuildReturnSlices
{
  -[UIKeyboardFlipTransitionView rebuildControlSlicesForKeyName:](self, "rebuildControlSlicesForKeyName:", CFSTR("Return-Key"));
  *(_BYTE *)&self->_rebuildFlags &= ~2u;
}

- (void)updateMoreIntlKey:(id)a3 asStart:(BOOL)a4 withRect:(CGRect)a5 showIntl:(BOOL)a6 showDictKey:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a7;
  v8 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v20 = a3;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v16, "startToken");
  else
    objc_msgSend(v16, "endToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_controlKeys, "objectForKeyedSubscript:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setSize:", width, height);
  objc_msgSend(v19, "setFrame:", x, y, width, height);
  objc_msgSend(v16, "setStartRect:", x, y, width, height);
  objc_msgSend(v19, "setContents:", -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v17));
  if (objc_msgSend(v20, "hasSuffix:", CFSTR("International-Key")))
    objc_msgSend(v19, "setHidden:", !v8);
  if (objc_msgSend(v20, "hasSuffix:", CFSTR("Dictation-Key")))
    objc_msgSend(v19, "setHidden:", !v7);

}

- (void)rebuildMoreIntlKeys
{
  _BOOL8 v3;
  int v4;
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIKeyboardFlipTransitionView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = -[UIKeyboardSplitTransitionView showIntlKey](self, "showIntlKey");
  v59 = -[UIKeyboardSplitTransitionView showDictationKey](self, "showDictationKey");
  if (v59)
    v4 = 2;
  else
    v4 = 0;
  v5 = v3;
  v6 = v4 | v3;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MoreIntlStartNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("MoreIntlNames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("MoreIntlStartLeftAligned"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 | (16 * (v11 != 0)) | 4u;

  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("MoreIntlStarts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree shapesForControlKeyShapes:options:](UIKBTree, "shapesForControlKeyShapes:options:", v14, v12);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("MoreIntlEndNames"));
  v16 = objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("MoreIntlNames"));
    v16 = objc_claimAutoreleasedReturnValue();

  }
  v57 = (void *)v16;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("MoreIntlEndLeftAligned"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6 | (16 * (v19 != 0)) | 0xCu;

  v21 = self;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("MoreIntlEnds"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree shapesForControlKeyShapes:options:](UIKBTree, "shapesForControlKeyShapes:options:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v25 = v8;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v65 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "hasSuffix:", CFSTR("Unlabeled-Space-Key")) & 1) == 0)
        {
          objc_msgSend(v58, "objectForKey:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "paddedFrame");
          v34 = v33;
          v36 = v35;
          v38 = v37;
          v40 = v39;

          -[UIKeyboardFlipTransitionView updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:](v21, "updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:", v31, 1, v5, v59, v34, v36, v38, v40);
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v27);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v41 = v57;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v61 != v44)
          objc_enumerationMutation(v41);
        v46 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v41, "objectForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "paddedFrame");
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v56 = v55;

        -[UIKeyboardFlipTransitionView updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:](v21, "updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:", v47, 0, v5, v59, v50, v52, v54, v56);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v43);
  }

  *(_BYTE *)&v21->_rebuildFlags &= ~4u;
}

- (void)_delayedUpdateTransition
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  char rebuildFlags;

  if (-[UIView isHidden](self, "isHidden") && self->super._sliceSet)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    -[UIKeyboardFlipTransitionView setFrame:](self, "setFrame:");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._centerFilled = objc_msgSend(v3, "centerFilled");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsCandidateBar");

    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("Candidate-Selection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

      v9 = self->super._centerFilled && v8;
      if (self->super._centerFilled && !v8)
        v9 = v5 ^ 1;
    }
    else
    {
      v9 = v5 ^ 1;
      if (!self->super._centerFilled)
        v9 = 0;
    }
    self->super._centerFilled = v9;
    -[UIKeyboardFlipTransitionView rebuildTransition](self, "rebuildTransition");
    -[UIKeyboardFlipTransitionView rebuildMoreIntlKeys](self, "rebuildMoreIntlKeys");
    rebuildFlags = (char)self->_rebuildFlags;
    if ((rebuildFlags & 1) != 0)
    {
      -[UIKeyboardFlipTransitionView rebuildShiftSlices](self, "rebuildShiftSlices");
      rebuildFlags = (char)self->_rebuildFlags;
    }
    if ((rebuildFlags & 2) != 0)
      -[UIKeyboardFlipTransitionView rebuildReturnSlices](self, "rebuildReturnSlices");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    self->super._isRebuilding = 0;
  }
}

- (void)rebuildControlKeys:(unint64_t)a3
{
  *(_BYTE *)&self->_rebuildFlags |= 2 * (a3 & 1);
  -[UIKeyboardFlipTransitionView updateTransition](self, "updateTransition");
}

- (BOOL)transitionIsVisible
{
  return 0;
}

- (BOOL)isShowingFrontFace
{
  return self->_showingFrontFace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_endKeyplaneToken, 0);
  objc_storeStrong((id *)&self->_startKeyplaneToken, 0);
  objc_storeStrong((id *)&self->_backDarkeningRight, 0);
  objc_storeStrong((id *)&self->_backDarkeningLeft, 0);
  objc_storeStrong((id *)&self->_backDarkening, 0);
  objc_storeStrong((id *)&self->_frontDarkening, 0);
  objc_storeStrong((id *)&self->_backFace, 0);
  objc_storeStrong((id *)&self->_frontFace, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
