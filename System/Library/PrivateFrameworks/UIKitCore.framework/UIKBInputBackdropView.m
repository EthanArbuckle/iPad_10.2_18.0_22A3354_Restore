@implementation UIKBInputBackdropView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[UIKBInputBackdropView setFullWidthConstraints:](self, "setFullWidthConstraints:", 0);
  -[UIKBInputBackdropView setSplitConstraints:](self, "setSplitConstraints:", 0);
  -[UIKBInputBackdropView setLeftWidthConstraint:](self, "setLeftWidthConstraint:", 0);
  -[UIKBInputBackdropView setRightWidthConstraint:](self, "setRightWidthConstraint:", 0);
  -[UIKBInputBackdropView setHeightConstraint:](self, "setHeightConstraint:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIKBInputBackdropView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setSplitConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_splitConstraints, a3);
}

- (void)setRightWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightWidthConstraint, a3);
}

- (void)setLeftWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftWidthConstraint, a3);
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (UIKBInputBackdropView)initWithFrame:(CGRect)a3
{
  UIKBInputBackdropView *v3;
  UIKBInputBackdropView *v4;
  void *v5;
  UIKBBackdropView *v6;
  uint64_t v7;
  UIKBBackdropView *inputBackdropFullView;
  _UIVisualEffectBackdropView *v9;
  uint64_t v10;
  _UIVisualEffectBackdropView *captureView;
  UIKBBackdropView *v12;
  uint64_t v13;
  UIKBBackdropView *inputBackdropLeftView;
  UIKBBackdropView *v15;
  uint64_t v16;
  UIKBBackdropView *inputBackdropRightView;
  void *v18;
  objc_super v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)UIKBInputBackdropView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v20.receiver = v3;
    v20.super_class = (Class)UIKBInputBackdropView;
    -[UIView _inheritedRenderConfig](&v20, sel__inheritedRenderConfig);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_style = objc_msgSend(v5, "backdropStyle");

    v6 = [UIKBBackdropView alloc];
    -[UIView bounds](v4, "bounds");
    v7 = -[UIKBBackdropView initWithFrame:style:](v6, "initWithFrame:style:", v4->_style);
    inputBackdropFullView = v4->_inputBackdropFullView;
    v4->_inputBackdropFullView = (UIKBBackdropView *)v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_inputBackdropFullView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 && UIKeyboardDeviceSupportsSplit())
    {
      v9 = [_UIVisualEffectBackdropView alloc];
      -[UIView bounds](v4, "bounds");
      v10 = -[_UIVisualEffectSubview initWithFrame:](v9, "initWithFrame:");
      captureView = v4->_captureView;
      v4->_captureView = (_UIVisualEffectBackdropView *)v10;

      -[UIView setAutoresizingMask:](v4->_captureView, "setAutoresizingMask:", 20);
      -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_captureView, 0);
      -[UIVisualEffectView _setCaptureView:](v4->_inputBackdropFullView, "_setCaptureView:", v4->_captureView);
      v12 = [UIKBBackdropView alloc];
      -[UIView bounds](v4, "bounds");
      v13 = -[UIKBBackdropView initWithFrame:style:](v12, "initWithFrame:style:", v4->_style);
      inputBackdropLeftView = v4->_inputBackdropLeftView;
      v4->_inputBackdropLeftView = (UIKBBackdropView *)v13;

      v15 = [UIKBBackdropView alloc];
      -[UIView bounds](v4, "bounds");
      v16 = -[UIKBBackdropView initWithFrame:style:](v15, "initWithFrame:style:", v4->_style);
      inputBackdropRightView = v4->_inputBackdropRightView;
      v4->_inputBackdropRightView = (UIKBBackdropView *)v16;

      v22[0] = v4->_inputBackdropLeftView;
      v22[1] = v4->_inputBackdropRightView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setCaptureDependents:](v4->_inputBackdropFullView, "_setCaptureDependents:", v18);

    }
    -[UIView bounds](v4, "bounds");
    -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](v4, "layoutInputBackdropToFullWithRect:");
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_style = objc_msgSend(v4, "backdropStyle");
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRenderConfig:", v4);

}

- (void)layoutInputBackdropToFullWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  char v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
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
  _QWORD v50[5];
  CGRect v51;
  CGRect v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v50[4] = *MEMORY[0x1E0C80C00];
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_5;
  }
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

LABEL_5:
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, self->_captureView != 0);

  -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leftAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v46;
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v42;
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v19;
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setFullWidthConstraints:](self, "setFullWidthConstraints:", v24);

  }
  -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isActive");

  if ((v27 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v29);

  }
  -[UIView bounds](self, "bounds");
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  if (!CGRectEqualToRect(v51, v52))
  {
    -[UIView bounds](self, "bounds");
    v31 = width - v30;
    -[UIView bounds](self, "bounds");
    v33 = height - v32;
    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndex:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", x);

    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndex:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setConstant:", y);

    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndex:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setConstant:", fmax(v31, 0.0));

    -[UIKBInputBackdropView fullWidthConstraints](self, "fullWidthConstraints");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndex:", 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setConstant:", fmax(v33, 0.0));

    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (UIKBBackdropView)inputBackdropFullView
{
  return self->_inputBackdropFullView;
}

- (NSArray)fullWidthConstraints
{
  return self->_fullWidthConstraints;
}

- (UIKBBackdropView)inputBackdropRightView
{
  return self->_inputBackdropRightView;
}

- (UIKBBackdropView)inputBackdropLeftView
{
  return self->_inputBackdropLeftView;
}

- (void)setFullWidthConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_fullWidthConstraints, a3);
}

- (BOOL)_isTransitioning
{
  return self->_isTransitioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_rightWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leftWidthConstraint, 0);
  objc_storeStrong((id *)&self->_fullWidthConstraints, 0);
  objc_storeStrong((id *)&self->_splitConstraints, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_inputBackdropRightView, 0);
  objc_storeStrong((id *)&self->_inputBackdropLeftView, 0);
  objc_storeStrong((id *)&self->_inputBackdropFullView, 0);
}

- (int)textEffectsVisibilityLevel
{
  return 9;
}

- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4
{
  void *v5;
  id v6;

  self->_style = a3;
  _UIKBEffectsForStyle(a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundEffects:", v6);

}

- (void)prepareForSnapshotting
{
  void *v3;
  id v4;

  _UIKBEffectsForStyle(self->_style, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundEffects:", v4);

}

- (void)restoreFromSnapshotting
{
  void *v3;
  id v4;

  _UIKBEffectsForStyle(self->_style, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundEffects:", v4);

}

- (void)createSplitBackdropIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIVisualEffectBackdropView *captureView;
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
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[7];

  v59[5] = *MEMORY[0x1E0C80C00];
  -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBInputBackdropView inputBackdropFullView](self, "inputBackdropFullView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  captureView = self->_captureView;
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v11, captureView != 0);

  }
  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, captureView != 0);

  }
  -[UIKBInputBackdropView transitionToStyle:isSplit:](self, "transitionToStyle:isSplit:", self->_style, 1);
  -[UIKBInputBackdropView splitConstraints](self, "splitConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leftAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v55;
    -[UIView rightAnchor](self, "rightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "rightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v51;
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v47;
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v18;
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setSplitConstraints:](self, "setSplitConstraints:", v24);

  }
  -[UIKBInputBackdropView splitConstraints](self, "splitConstraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isActive");

  if ((v27 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBInputBackdropView splitConstraints](self, "splitConstraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v29);

  }
  -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v32, "constraintEqualToConstant:", v33 * 0.6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setLeftWidthConstraint:](self, "setLeftWidthConstraint:", v34);

  }
  -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v37, "constraintEqualToConstant:", v38 * 0.6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setRightWidthConstraint:](self, "setRightWidthConstraint:", v39);

  }
  -[UIKBInputBackdropView heightConstraint](self, "heightConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", self->_tallHeight);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView setHeightConstraint:](self, "setHeightConstraint:", v43);

    -[UIKBInputBackdropView heightConstraint](self, "heightConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

  }
}

- (void)layoutInputBackdropToSplitWithLeftViewRect:(CGRect)a3 andRightViewRect:(CGRect)a4 innerCorners:(unint64_t)a5
{
  double width;
  double height;
  double v8;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  width = a4.size.width;
  height = a3.size.height;
  v8 = a3.size.width;
  -[UIKBInputBackdropView createSplitBackdropIfNeeded](self, "createSplitBackdropIfNeeded", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[UIKBInputBackdropView heightConstraint](self, "heightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", height);

  -[UIKBInputBackdropView _updateForLeftOffset:rightOffset:](self, "_updateForLeftOffset:rightOffset:", v8, width);
  -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isActive");

  if ((v12 & 1) == 0)
  {
    -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

  }
  -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v8);

  -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isActive");

  if ((v16 & 1) == 0)
  {
    -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

  }
  -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", width);

  self->_innerCorners = a5;
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateCorners:", a5 & 0xA);

  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateCorners:", a5 & 5);

}

- (void)layoutInputBackdropToSplitWithHeight:(double)a3 innerCorners:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  -[UIKBInputBackdropView createSplitBackdropIfNeeded](self, "createSplitBackdropIfNeeded");
  -[UIKBInputBackdropView heightConstraint](self, "heightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", a3);

  self->_innerCorners = a4;
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCorners:", a4 & 0xA);

  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCorners:", a4 & 5);

}

- (void)_setProgress:(double)a3 withFrame:(CGRect)a4
{
  -[UIKBInputBackdropView setProgress:withFrame:innerCorners:](self, "setProgress:withFrame:innerCorners:", -1, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)setProgress:(double)a3 withFrame:(CGRect)a4 innerCorners:(unint64_t)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int *v12;
  BOOL *p_hasStartRect;
  CGFloat *v14;
  CGFloat *p_height;
  CGFloat v16;
  double v17;
  BOOL v18;

  if (a3 >= 0.0)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    if (!CGRectIsEmpty(a4))
    {
      if (a3 == 0.0
        && (v12 = &OBJC_IVAR___UIKBInputBackdropView__savedStartRect,
            p_hasStartRect = &self->_hasStartRect,
            !self->_hasStartRect)
        || a3 == 1.0
        && (v12 = &OBJC_IVAR___UIKBInputBackdropView__savedEndRect,
            p_hasStartRect = &self->_hasEndRect,
            !self->_hasEndRect))
      {
        *p_hasStartRect = 1;
        v14 = (CGFloat *)((char *)self + *v12);
        *v14 = x;
        v14[1] = y;
        v14[2] = width;
        v14[3] = height;
      }
      p_height = &self->_savedEndRect.size.height;
      v16 = self->_savedEndRect.size.height;
      v17 = self->_savedStartRect.size.height;
      v18 = v16 <= v17;
      if (v16 <= v17)
        v16 = self->_savedStartRect.size.height;
      self->_tallHeight = v16;
      if (!v18)
        p_height = &self->_savedStartRect.size.height;
      self->_heightDiff = v16 - *p_height;
      if (a3 == 0.0)
      {
        if (!self->_isTransitioning)
          -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
      }
      else
      {
        -[UIKBInputBackdropView _prepareWithLeftOffset:gapWidth:](self, "_prepareWithLeftOffset:gapWidth:", round(self->_transitionLeftOffset + (1.0 - a3) * (ceil(width * 0.5) - self->_transitionLeftOffset)), round(self->_transitionGap * a3));
        -[UIKBInputBackdropView layoutInputBackdropToSplitWithHeight:innerCorners:](self, "layoutInputBackdropToSplitWithHeight:innerCorners:", a5, height);
        -[UIKBInputBackdropView setGestureProgressForSplit:](self, "setGestureProgressForSplit:", a3);
      }
    }
  }
}

- (void)_prepareWithLeftOffset:(double)a3 gapWidth:(double)a4
{
  double v7;

  self->_transitionGap = a4;
  -[UIView bounds](self, "bounds");
  -[UIKBInputBackdropView _updateForLeftOffset:rightOffset:](self, "_updateForLeftOffset:rightOffset:", a3, v7 - (a3 + a4));
  -[UIKBInputBackdropView createSplitBackdropIfNeeded](self, "createSplitBackdropIfNeeded");
}

- (void)_updateForLeftOffset:(double)a3 rightOffset:(double)a4
{
  double v6;
  double v7;
  double v8;

  self->_transitionLeftOffset = a3;
  self->_transitionRightOffset = a4;
  -[UIView bounds](self, "bounds");
  v7 = (v6 + self->_transitionLeftOffset - self->_transitionRightOffset) * 0.5;
  self->_leftWidthDiff = v7 - a3;
  -[UIView bounds](self, "bounds");
  self->_rightWidthDiff = v8
                        - v7
                        - (self->_transitionLeftOffset
                         - self->_transitionRightOffset)
                        - self->_transitionRightOffset;
}

- (void)setGestureProgressForSplit:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  id v26;

  if (a3 <= 0.0)
  {
    -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", self->_savedStartRect.origin.x, self->_savedStartRect.origin.y, self->_savedStartRect.size.width, self->_savedStartRect.size.height);
    return;
  }
  -[UIKBInputBackdropView inputBackdropRightView](self, "inputBackdropRightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_7:
    -[UIKBInputBackdropView createSplitBackdropIfNeeded](self, "createSplitBackdropIfNeeded");
    goto LABEL_8;
  }
  v7 = (void *)v6;
  -[UIKBInputBackdropView inputBackdropLeftView](self, "inputBackdropLeftView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
LABEL_8:
  -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isActive");

  if ((v11 & 1) == 0)
  {
    -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

  }
  -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isActive");

  if ((v14 & 1) == 0)
  {
    -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

  }
  v16 = self->_tallHeight - self->_heightDiff * a3;
  -[UIKBInputBackdropView heightConstraint](self, "heightConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v16);

  if (self->_transitionGap <= 0.0)
  {
    -[UIView bounds](self, "bounds");
    v23 = v22 * 0.6;
    -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", v23);

    -[UIView bounds](self, "bounds");
    v21 = v25 * 0.6;
  }
  else
  {
    if (a3 >= 0.055)
      v18 = 1.0 - (a3 * 1.05820106 + -1.05820106 + 1.0);
    else
      v18 = 1.0;
    v19 = self->_transitionLeftOffset + round(v18 * self->_leftWidthDiff);
    -[UIKBInputBackdropView leftWidthConstraint](self, "leftWidthConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConstant:", v19);

    v21 = self->_transitionRightOffset + round(v18 * self->_rightWidthDiff);
  }
  -[UIKBInputBackdropView rightWidthConstraint](self, "rightWidthConstraint");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", v21);

}

- (void)_setInitialProgressWithFrame:(CGRect)a3
{
  double v3;

  v3 = floor(a3.size.width * 0.555);
  -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", -1, 0.0, 0.0, v3, a3.size.height, a3.size.width - v3, 0.0, v3, a3.size.height);
}

- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4
{
  if (!self->_isTransitioning)
  {
    -[UIKBInputBackdropView _prepareWithLeftOffset:gapWidth:](self, "_prepareWithLeftOffset:gapWidth:", a3, a4);
    self->_isTransitioning = 1;
    self->_hasStartRect = 0;
    self->_hasEndRect = 0;
  }
}

- (void)_endSplitTransitionIfNeeded:(BOOL)a3
{
  double height;
  double x;
  double y;
  double width;
  double v8;
  double v9;

  if (self->_isTransitioning)
  {
    self->_isTransitioning = 0;
    if (a3)
    {
      -[UIKBInputBackdropView setGestureProgressForSplit:](self, "setGestureProgressForSplit:", 1.0);
      if (self->_hasEndRect)
      {
        height = self->_savedEndRect.size.height;
      }
      else
      {
        -[UIView frame](self, "frame");
        height = v9;
      }
      -[UIKBInputBackdropView layoutInputBackdropToSplitWithHeight:innerCorners:](self, "layoutInputBackdropToSplitWithHeight:innerCorners:", -[UIView _clipCornersOfView:](self, "_clipCornersOfView:", self), height);
    }
    else
    {
      if (self->_hasStartRect)
      {
        x = self->_savedStartRect.origin.x;
        y = self->_savedStartRect.origin.y;
        width = self->_savedStartRect.size.width;
        v8 = self->_savedStartRect.size.height;
      }
      else
      {
        -[UIView frame](self, "frame");
      }
      if (self->_transitionGap == 0.0)
        v8 = self->_savedEndRect.size.height;
      -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", x, y, width, v8);
    }
    -[UIView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  }
}

- (int64_t)style
{
  return self->_style;
}

- (void)setInputBackdropFullView:(id)a3
{
  objc_storeStrong((id *)&self->_inputBackdropFullView, a3);
}

- (void)setInputBackdropLeftView:(id)a3
{
  objc_storeStrong((id *)&self->_inputBackdropLeftView, a3);
}

- (void)setInputBackdropRightView:(id)a3
{
  objc_storeStrong((id *)&self->_inputBackdropRightView, a3);
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->_captureView, a3);
}

- (NSArray)splitConstraints
{
  return self->_splitConstraints;
}

- (NSLayoutConstraint)leftWidthConstraint
{
  return self->_leftWidthConstraint;
}

- (NSLayoutConstraint)rightWidthConstraint
{
  return self->_rightWidthConstraint;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (double)leftWidthDiff
{
  return self->_leftWidthDiff;
}

- (void)setLeftWidthDiff:(double)a3
{
  self->_leftWidthDiff = a3;
}

- (double)rightWidthDiff
{
  return self->_rightWidthDiff;
}

- (void)setRightWidthDiff:(double)a3
{
  self->_rightWidthDiff = a3;
}

- (double)tallHeight
{
  return self->_tallHeight;
}

- (void)setTallHeight:(double)a3
{
  self->_tallHeight = a3;
}

- (double)heightDiff
{
  return self->_heightDiff;
}

- (void)setHeightDiff:(double)a3
{
  self->_heightDiff = a3;
}

@end
