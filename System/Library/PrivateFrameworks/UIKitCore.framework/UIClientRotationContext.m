@implementation UIClientRotationContext

- (void)rotateSnapshots
{
  int64_t toOrientation;
  double v4;
  double duration;
  BOOL v6;
  uint64_t v7;
  double v9;
  double v10;
  double width;
  double height;
  UIView *rotatingSnapshotView;
  UIView *snapshotTargetView;
  UIView *v15;
  UISnapshotView *contentSnapshotViewStart;
  double contentBottomInset;
  _BOOL4 skipSnapshotOfEndState;
  double v19;
  double v20;
  _BOOL8 v21;
  double v22;
  CGFloat a;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;

  toOrientation = self->_toOrientation;
  switch(toOrientation)
  {
    case 1:
      v4 = 0.0;
      break;
    case 3:
      v4 = 1.57079633;
      break;
    case 4:
      v4 = -1.57079633;
      break;
    default:
      v4 = 3.14159265;
      if (toOrientation != 2)
        v4 = 0.0;
      break;
  }
  duration = self->_duration;
  CGAffineTransformMakeRotation(&v41, v4);
  *(float64x2_t *)&v41.a = vrndaq_f64(*(float64x2_t *)&v41.a);
  *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
  *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
  v42 = v41;
  v6 = _UIAppUseModernRotationAndPresentationBehaviors();
  -[UIView bounds](self->_window, "bounds");
  width = v9;
  height = v10;
  if (!v6)
  {
    v40 = v42;
    v43 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v40);
    width = v43.size.width;
    height = v43.size.height;
  }
  self->_headerWasHidden = -[UIView isHidden](self->_headerView, "isHidden");
  self->_footerWasHidden = -[UIView isHidden](self->_footerView, "isHidden");
  self->_contentWasHidden = -[UIView isHidden](self->_contentView, "isHidden");
  self->_snapshotTargetWasHidden = -[UIView isHidden](self->_snapshotTargetView, "isHidden");
  if (duration > 0.0)
  {
    if (!_UIAppUseModernRotationAndPresentationBehaviors())
    {
      rotatingSnapshotView = self->_rotatingSnapshotView;
      v40 = v42;
      -[UIView setTransform:](rotatingSnapshotView, "setTransform:", &v40);
      -[UIView setBounds:](self->_rotatingSnapshotView, "setBounds:", 0.0, 0.0, width, height);
    }
    if (self->_orderKeyboardInAfterRotating)
      -[UIView setHidden:](self->_footerView, "setHidden:", 1);
    if (self->_rotationSettings.animateContentRotation)
    {
      v40.a = 0.0;
      snapshotTargetView = self->_snapshotTargetView;
      if (snapshotTargetView)
      {
        v15 = self->_rotatingSnapshotView;
        contentSnapshotViewStart = self->_contentSnapshotViewStart;
        contentBottomInset = self->contentBottomInset;
        skipSnapshotOfEndState = self->_rotationSettings.skipSnapshotOfEndState;
        -[UIView alpha](self->_snapshotTargetView, "alpha");
        v20 = v19;
        v21 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
        +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
        if (!skipSnapshotOfEndState)
        {
          -[UIView frame](contentSnapshotViewStart, "frame");
          _CreateRotationSnapshot(snapshotTargetView, v15, (UISnapshotView **)&v40, contentSnapshotViewStart, (uint64_t)&self->_rotationSettings, 0, contentBottomInset, v25, v26, v27, v28);
          -[UIView setHidden:](snapshotTargetView, "setHidden:", 1);
          if (self->_rotationSettings.avoidFadingBottomOfContent && self->_rotationSettings.preserveHeight)
          {
            a = v40.a;
            objc_msgSend(*(id *)&v40.a, "_contentSize");
            v30 = v29;
            -[UISnapshotView _contentSize](contentSnapshotViewStart, "_contentSize");
            if (v30 <= v31)
            {
              -[UIView insertSubview:below:](v15, "insertSubview:below:", contentSnapshotViewStart, *(_QWORD *)&a);
              objc_msgSend(*(id *)&a, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
              objc_msgSend(*(id *)&a, "setAlpha:", 0.0);
              v22 = 1.0;
              goto LABEL_20;
            }
            -[UIView setBackgroundColor:](contentSnapshotViewStart, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
          }
        }
        -[UISnapshotView setShadowView:](contentSnapshotViewStart, "setShadowView:", 0, *(_QWORD *)&v40.a);
        v22 = 0.0;
        a = *(double *)&contentSnapshotViewStart;
LABEL_20:
        +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v21, *(_QWORD *)&v40.a);
        if (self->_rotationSettings.preserveHeight)
        {
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
          v24 = v40.a;
          objc_msgSend(*(id *)&v40.a, "_setContentOffset:", 0.0, 0.0);
          objc_msgSend(*(id *)&v24, "layoutBelowIfNeeded");
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v21);
          -[UISnapshotView _setContentOffset:](contentSnapshotViewStart, "_setContentOffset:", 0.0, -0.0);
          objc_msgSend(*(id *)&v24, "_setContentOffset:", 0.0, 0.0);
        }
        else
        {
          v24 = v40.a;
        }
        objc_msgSend(*(id *)&a, "setAlpha:", v22);
        objc_msgSend(0, "setAlpha:", v20);
        -[UIView bounds](snapshotTargetView, "bounds");
        -[UIView convertRect:fromView:](v15, "convertRect:fromView:", snapshotTargetView);
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        -[UISnapshotView setFrame:](contentSnapshotViewStart, "setFrame:");
        objc_msgSend(*(id *)&v24, "setFrame:", v33, v35, v37, v39);
      }
    }
  }
}

- (void)finishFullRotateUsingOnePartAnimation:(BOOL)a3
{
  UIView *snapshotTargetView;

  if (self->_headerSnapshotViewStart)
    -[UIView setHidden:](self->_headerView, "setHidden:", self->_headerWasHidden);
  if (self->_footerSnapshotViewStart || self->_orderKeyboardInAfterRotating)
    -[UIView setHidden:](self->_footerView, "setHidden:", self->_footerWasHidden);
  if (self->_contentSnapshotViewStart)
    -[UIView setHidden:](self->_contentView, "setHidden:", self->_contentWasHidden);
  snapshotTargetView = self->_snapshotTargetView;
  if (snapshotTargetView)
    -[UIView setHidden:](snapshotTargetView, "setHidden:", self->_snapshotTargetWasHidden);
  -[UIView removeFromSuperview](self->_rotatingSnapshotView, "removeFromSuperview", a3);

  -[UIView removeFromSuperview](self->_footerEndSnapshotView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_footerStartSnapshotView, "removeFromSuperview");
}

- (void)setupRotationOrderingKeyboardInAfterRotation:(BOOL)a3
{
  int64_t fromOrientation;
  double v5;
  char v6;
  uint64_t v7;
  double v9;
  double v10;
  double width;
  double height;
  UIView *v13;
  UIView *v14;
  int v15;
  UIView *rotatingSnapshotView;
  void *v17;
  id v18;
  int edgeClip;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  UIView *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;

  self->_orderKeyboardInAfterRotating = a3;
  fromOrientation = self->_fromOrientation;
  switch(fromOrientation)
  {
    case 1:
      v5 = 0.0;
      break;
    case 3:
      v5 = 1.57079633;
      break;
    case 4:
      v5 = -1.57079633;
      break;
    default:
      v5 = 3.14159265;
      if (fromOrientation != 2)
        v5 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v25, v5);
  *(float64x2_t *)&v25.a = vrndaq_f64(*(float64x2_t *)&v25.a);
  *(float64x2_t *)&v25.c = vrndaq_f64(*(float64x2_t *)&v25.c);
  *(float64x2_t *)&v25.tx = vrndaq_f64(*(float64x2_t *)&v25.tx);
  v26 = v25;
  v6 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
  -[UIView bounds](self->_window, "bounds");
  width = v9;
  height = v10;
  if ((v6 & 1) == 0)
  {
    v24 = v26;
    v27 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v24);
    width = v27.size.width;
    height = v27.size.height;
  }
  v13 = [UIView alloc];
  -[UIView bounds](self->_window, "bounds");
  v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
  self->_rotatingSnapshotView = v14;
  -[UIView setBounds:](v14, "setBounds:", 0.0, 0.0, width, height);
  v15 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
  rotatingSnapshotView = self->_rotatingSnapshotView;
  if (v15)
  {
    -[UIView setAutoresizingMask:](rotatingSnapshotView, "setAutoresizingMask:", 18);
  }
  else
  {
    v24 = v26;
    -[UIView setTransform:](rotatingSnapshotView, "setTransform:", &v24);
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  if (-[UIView window](self->_contentView, "window") == self->_window)
    objc_msgSend(v17, "addObject:", self->_contentView);
  if (-[UIView window](self->_headerView, "window") == self->_window)
    objc_msgSend(v17, "addObject:", self->_headerView);
  if (-[UIView window](self->_footerView, "window") == self->_window)
    objc_msgSend(v17, "addObject:", self->_footerView);
  v18 = +[UIView _topMostView:reverse:]((uint64_t)UIView, v17, 0);
  objc_msgSend((id)objc_msgSend(v18, "superview"), "insertSubview:belowSubview:", self->_rotatingSnapshotView, v18);
  if (!self->_rotationSettings.animateContentRotation)
  {
    edgeClip = self->_rotationSettings.edgeClip;
    if ((edgeClip & 1) != 0)
    {
      v21 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", -width, 0.0, width, height);
      -[UIView setBackgroundColor:](v21, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
      -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 20);
      -[UIView addSubview:](self->_rotatingSnapshotView, "addSubview:", v21);

      edgeClip = self->_rotationSettings.edgeClip;
      if ((edgeClip & 2) == 0)
      {
LABEL_25:
        if ((edgeClip & 8) == 0)
          goto LABEL_26;
        goto LABEL_31;
      }
    }
    else if ((edgeClip & 2) == 0)
    {
      goto LABEL_25;
    }
    v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", width, 0.0, width, height);
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setAutoresizingMask:](v22, "setAutoresizingMask:", 17);
    -[UIView addSubview:](self->_rotatingSnapshotView, "addSubview:", v22);

    edgeClip = self->_rotationSettings.edgeClip;
    if ((edgeClip & 8) == 0)
    {
LABEL_26:
      if ((edgeClip & 4) == 0)
        return;
      goto LABEL_27;
    }
LABEL_31:
    v23 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, -height, width, height);
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setAutoresizingMask:](v23, "setAutoresizingMask:", 34);
    -[UIView addSubview:](self->_rotatingSnapshotView, "addSubview:", v23);

    if ((self->_rotationSettings.edgeClip & 4) == 0)
      return;
LABEL_27:
    v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height, width, height);
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setAutoresizingMask:](v20, "setAutoresizingMask:", 10);
    -[UIView addSubview:](self->_rotatingSnapshotView, "addSubview:", v20);

    return;
  }
  if (-[UIView superview](self->_contentView, "superview"))
    _CreateRotationSnapshot(self->_snapshotTargetView, self->_rotatingSnapshotView, &self->_contentSnapshotViewStart, 0, (uint64_t)&self->_rotationSettings, 1, 0.0, *MEMORY[0x1E0C9D648], *(CGFloat *)(MEMORY[0x1E0C9D648] + 8), *(CGFloat *)(MEMORY[0x1E0C9D648] + 16), *(CGFloat *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIClientRotationContext)initWithClient:(id)a3 toOrientation:(int64_t)a4 duration:(double)a5 andWindow:(id)a6
{
  UIClientRotationContext *v10;
  uint64_t v11;
  UIView *v12;
  int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIClientRotationContext;
  v10 = -[UIClientRotationContext init](&v15, sel_init);
  if (!v10 || (objc_opt_respondsToSelector() & 1) == 0)
    return v10;
  v10->_rotatingClient = a3;
  v10->_window = (UIWindow *)a6;
  v10->_fromOrientation = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(a3, "_lastKnownInterfaceOrientation");
    v10->_fromOrientation = v11;
    if (!v11)
      goto LABEL_7;
  }
  else if (!v10->_fromOrientation)
  {
LABEL_7:
    v10->_fromOrientation = -[UIWindow interfaceOrientation](v10->_window, "interfaceOrientation");
  }
  v10->_toOrientation = a4;
  v10->_duration = a5;
  v10->_contentView = (UIView *)(id)objc_msgSend(v10->_rotatingClient, "rotatingContentViewForWindow:", a6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10->_snapshotTargetView = (UIView *)(id)objc_msgSend(v10->_rotatingClient, "rotatingSnapshotViewForWindow:", a6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10->_headerView = (UIView *)(id)objc_msgSend(v10->_rotatingClient, "rotatingHeaderViewForWindow:", a6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = (UIView *)(id)objc_msgSend(v10->_rotatingClient, "rotatingFooterViewForWindow:", a6);
    v10->_footerView = v12;
    v10->_footerWasHidden = -[UIView isHidden](v12, "isHidden");
  }
  v13 = 15;
  if (objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
  {
    if (-[UIWindow _isTextEffectsWindow](v10->_window, "_isTextEffectsWindow"))
      v13 = 0;
    else
      v13 = 15;
  }
  v10->_rotationSettings.edgeClip = v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10->_rotatingClient, "getRotationContentSettings:forWindow:", &v10->_rotationSettings, a6);
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIClientRotationContext;
  -[UIClientRotationContext dealloc](&v3, sel_dealloc);
}

- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  _BOOL4 v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  v7 = a5;
  objc_msgSend(a3, "center");
  v33 = v10;
  v34 = v11;
  objc_msgSend(a4, "center");
  v13 = v12;
  v15 = v14;
  objc_msgSend(a3, "bounds");
  v17 = v16;
  objc_msgSend(a4, "bounds");
  v19 = v18;
  objc_msgSend((id)UIApp, "statusBarFrame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (a3)
    objc_msgSend(a3, "transform");
  else
    memset(&v35, 0, sizeof(v35));
  v36.origin.x = v21;
  v36.origin.y = v23;
  v36.size.width = v25;
  v36.size.height = v27;
  v37 = CGRectApplyAffineTransform(v36, &v35);
  v28 = v17 + v37.size.height;
  v29 = v33;
  switch(a6)
  {
    case 1:
      if (v7)
        v28 = -v28;
      v30 = v34 + v28;
      v31 = -v19;
      if (v7)
        v31 = v19;
      goto LABEL_15;
    case 2:
      if (!v7)
        v28 = -v28;
      v30 = v34 + v28;
      v31 = -v19;
      if (!v7)
        v31 = v19;
LABEL_15:
      v15 = v15 + v31;
      break;
    case 3:
      if (!v7)
        v28 = -v28;
      v29 = v33 + v28;
      v32 = -v19;
      if (!v7)
        v32 = v19;
      goto LABEL_24;
    case 4:
      if (v7)
        v28 = -v28;
      v29 = v33 + v28;
      v32 = -v19;
      if (v7)
        v32 = v19;
LABEL_24:
      v13 = v13 + v32;
      v30 = v34;
      break;
    default:
      v29 = v33;
      v30 = v34;
      break;
  }
  objc_msgSend(a3, "setCenter:", v29, v30);
  objc_msgSend(a4, "setCenter:", v13, v15);
}

- (void)slideHeaderViewAndFooterViewOffScreen:(BOOL)a3 forInterfaceOrientation:(int64_t)a4
{
  -[UIClientRotationContext _slideHeaderView:andFooterView:offScreen:forInterfaceOrientation:](self, "_slideHeaderView:andFooterView:offScreen:forInterfaceOrientation:", self->_headerView, self->_footerView, a3, a4);
}

- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend((id)objc_msgSend(a3, "superview"), "bounds");
  objc_msgSend((id)objc_msgSend(a4, "superview"), "bounds");
  v9 = v8;
  v21 = v10;
  v12 = v11;
  v14 = v13;
  objc_msgSend(a3, "bounds");
  objc_msgSend(a4, "bounds");
  v16 = v15 * 0.5;
  switch(a5)
  {
    case 1:
      v17 = v9 + v12 * 0.5;
      v18 = v21 + v14;
      goto LABEL_8;
    case 2:
      v17 = v9 + v12 * 0.5;
      v19 = v21 - v16;
      break;
    case 3:
      v20 = 0.5;
      v17 = v9 - v16;
      goto LABEL_7;
    case 4:
      v20 = 0.5;
      v17 = v9 + v12 + v16;
LABEL_7:
      v16 = v14 * v20;
      v18 = v21;
LABEL_8:
      v19 = v18 + v16;
      break;
    default:
      v17 = *MEMORY[0x1E0C9D538];
      v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  objc_msgSend(a3, "setPosition:");
  objc_msgSend(a4, "setPosition:", v17, v19);
}

- (BOOL)_isHeaderTranslucent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (-[UIView isTranslucent](self->_headerView, "isTranslucent") & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIView isTranslucent](self->_headerView, "isTranslucent");
  else
    return 0;
}

- (BOOL)_isFooterTranslucent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIView isTranslucent](self->_footerView, "isTranslucent");
  else
    return 0;
}

- (void)finishFirstHalfRotation
{
  int64_t toOrientation;
  double v4;
  UIView *headerView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *footerView;
  CGAffineTransform v14;
  CGAffineTransform v15;

  toOrientation = self->_toOrientation;
  switch(toOrientation)
  {
    case 1:
      v4 = 0.0;
      break;
    case 3:
      v4 = 1.57079633;
      break;
    case 4:
      v4 = -1.57079633;
      break;
    default:
      v4 = 3.14159265;
      if (toOrientation != 2)
        v4 = 0.0;
      break;
  }
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeRotation(&v15, v4);
  *(float64x2_t *)&v15.a = vrndaq_f64(*(float64x2_t *)&v15.a);
  *(float64x2_t *)&v15.c = vrndaq_f64(*(float64x2_t *)&v15.c);
  *(float64x2_t *)&v15.tx = vrndaq_f64(*(float64x2_t *)&v15.tx);
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView bounds](-[UIView superview](headerView, "superview"), "bounds");
    -[UIView bounds](self->_headerView, "bounds");
    -[UIView setBounds:](self->_headerView, "setBounds:");
    -[UIView layoutIfNeeded](self->_headerView, "layoutIfNeeded");
  }
  if (self->_footerView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView bounds](self->_footerView, "bounds");
      v7 = v6;
      v9 = v8;
      +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", self->_toOrientation);
      -[UIView setBounds:](self->_footerView, "setBounds:", v7, v9, v10, v11);
      -[UIView activate](self->_footerView, "activate");
    }
    else
    {
      -[UIView bounds](-[UIView superview](self->_footerView, "superview"), "bounds");
      -[UIView bounds](self->_footerView, "bounds");
      -[UIView setBounds:](self->_footerView, "setBounds:");
    }
    -[UIView layoutIfNeeded](self->_footerView, "layoutIfNeeded");
  }
  v12 = self->_headerView;
  v14 = v15;
  -[UIView setTransform:](v12, "setTransform:", &v14);
  footerView = self->_footerView;
  v14 = v15;
  -[UIView setTransform:](footerView, "setTransform:", &v14);
  -[UIView layoutIfNeeded](self->_headerView, "layoutIfNeeded");
  -[UIView layoutIfNeeded](self->_footerView, "layoutIfNeeded");
  -[UIClientRotationContext _positionHeaderView:andFooterView:outsideContentViewForInterfaceOrientation:](self, "_positionHeaderView:andFooterView:outsideContentViewForInterfaceOrientation:", self->_headerView, self->_footerView, self->_toOrientation);
}

- (id)rotatingClient
{
  return self->_rotatingClient;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (BOOL)skipClientRotationCallbacks
{
  return self->_skipClientRotationCallbacks;
}

- (void)setSkipClientRotationCallbacks:(BOOL)a3
{
  self->_skipClientRotationCallbacks = a3;
}

@end
