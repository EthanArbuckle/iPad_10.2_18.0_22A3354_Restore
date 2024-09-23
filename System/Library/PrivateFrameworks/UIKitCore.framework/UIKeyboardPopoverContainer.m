@implementation UIKeyboardPopoverContainer

+ (double)edgeOffset
{
  double v2;

  objc_msgSend(a1, "contentInsets");
  return -v2;
}

+ (double)extraWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "contentInsets");
  v4 = v3;
  objc_msgSend(a1, "contentInsets");
  return v4 + v5;
}

+ (UIColor)borderColor
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if (v4)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.38, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v6;
}

+ (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = 1.0 / v3;

  return v4;
}

+ (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = 20.0 / v3;

  return v4;
}

+ (double)arrowHeight
{
  double result;

  -[objc_class arrowHeight](+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass"), "arrowHeight");
  return result;
}

+ (UIColor)pillColor
{
  return +[UIColor lightGrayColor](UIColor, "lightGrayColor");
}

+ (double)pillCornerRadius
{
  return 2.0;
}

+ (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)pillDistanceToEdge
{
  double v2;

  +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
  return v2 + 16.0;
}

+ (double)dragAreaHeight
{
  double v2;

  objc_msgSend(a1, "borderWidth");
  return v2 + 33.5;
}

- (UIView)affordance
{
  return -[_UIKeyboardPopoverAffordance dragArea](self->_affordance, "dragArea");
}

+ (UIColor)shadowColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

+ (double)shadowOpacity
{
  return 0.17;
}

+ (double)shadowRadius
{
  void *v2;
  double v3;
  double v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = 30.0 / v3;

  return v4;
}

+ (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = 17.0 / v3;

  v5 = 0.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_popoverContainerView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIKeyboardPopoverContainer)initWithView:(id)a3 usingBackdropStyle:(int64_t)a4
{
  id v6;
  UIKeyboardPopoverContainer *v7;
  _UIPopoverView *v8;
  objc_class *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _UIPopoverView *popover;
  _UIKeyboardPopover *v16;
  _UIKeyboardPopover *popoverContainerView;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  float v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  UIView *v36;
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
  uint64_t v47;
  NSLayoutConstraint *keyboardAreaHeight;
  void *v49;
  void *v50;
  void *v51;
  _UIKeyboardPopoverAffordance *v52;
  _UIKeyboardPopoverAffordance *affordance;
  void *v54;
  _UIKeyboardPopoverAffordance *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v62;

  v6 = a3;
  v62.receiver = self;
  v62.super_class = (Class)UIKeyboardPopoverContainer;
  v7 = -[UIKeyboardPopoverContainer init](&v62, sel_init);
  if (v7)
  {
    v8 = [_UIPopoverView alloc];
    v9 = +[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass");
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = -[_UIPopoverView initWithFrame:backgroundViewClass:](v8, "initWithFrame:backgroundViewClass:", v9, *MEMORY[0x1E0C9D648], v11, v12, v13);
    popover = v7->_popover;
    v7->_popover = (_UIPopoverView *)v14;

    -[_UIPopoverView setBackgroundStyle:](v7->_popover, "setBackgroundStyle:", 6);
    -[_UIPopoverView setArrowDirection:](v7->_popover, "setArrowDirection:", 2);
    v16 = -[_UIKeyboardPopover initWithPopoverView:]([_UIKeyboardPopover alloc], "initWithPopoverView:", v7->_popover);
    popoverContainerView = v7->_popoverContainerView;
    v7->_popoverContainerView = v16;

    +[UIKeyboardPopoverContainer shadowColor](UIKeyboardPopoverContainer, "shadowColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[UIView layer](v7->_popoverContainerView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowColor:", v19);

    +[UIKeyboardPopoverContainer shadowOpacity](UIKeyboardPopoverContainer, "shadowOpacity");
    v22 = v21;
    -[UIView layer](v7->_popoverContainerView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v24 = v22;
    objc_msgSend(v23, "setShadowOpacity:", v24);

    +[UIKeyboardPopoverContainer shadowRadius](UIKeyboardPopoverContainer, "shadowRadius");
    v26 = v25;
    -[UIView layer](v7->_popoverContainerView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowRadius:", v26);

    +[UIKeyboardPopoverContainer shadowOffset](UIKeyboardPopoverContainer, "shadowOffset");
    v29 = v28;
    v31 = v30;
    -[UIView layer](v7->_popoverContainerView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setShadowOffset:", v29, v31);

    objc_msgSend(v6, "insertSubview:atIndex:", v7->_popoverContainerView, 0);
    -[_UIPopoverView contentView](v7->_popover, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "borderColor");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v34, "setBorderColor:", objc_msgSend(v35, "CGColor"));

    objc_msgSend((id)objc_opt_class(), "borderWidth");
    objc_msgSend(v34, "setBorderWidth:");
    -[UIKeyboardPopoverContainer updateBackdropStyle:](v7, "updateBackdropStyle:", a4);
    v36 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
    -[_UIPopoverView contentView](v7->_popover, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v36);

    v38 = (void *)objc_opt_new();
    -[UIView addLayoutGuide:](v36, "addLayoutGuide:", v38);
    objc_msgSend(v38, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v36, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    objc_msgSend(v38, "rightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v36, "rightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    objc_msgSend(v38, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v36, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    keyboardAreaHeight = v7->_keyboardAreaHeight;
    v7->_keyboardAreaHeight = (NSLayoutConstraint *)v47;

    -[NSLayoutConstraint setActive:](v7->_keyboardAreaHeight, "setActive:", 1);
    objc_msgSend(v38, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v36, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    v52 = -[_UIKeyboardPopoverAffordance initWithFrame:]([_UIKeyboardPopoverAffordance alloc], "initWithFrame:", v10, v11, v12, v13);
    affordance = v7->_affordance;
    v7->_affordance = v52;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_affordance, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v36, "addSubview:", v7->_affordance);
    v54 = (void *)MEMORY[0x1E0D156E0];
    v55 = v7->_affordance;
    +[UIKeyboardPopoverContainer dragAreaHeight](UIKeyboardPopoverContainer, "dragAreaHeight");
    objc_msgSend(v54, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 8, 0, 0, 0, 1.0, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v36, "addConstraint:", v57);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_affordance, 1, 0, v36, 1, 1.0, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v36, "addConstraint:", v58);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_affordance, 2, 0, v36, 2, 1.0, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v36, "addConstraint:", v59);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_affordance, 4, 0, v36, 4, 1.0, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v36, "addConstraint:", v60);

  }
  return v7;
}

- (UIView)backdropParent
{
  return (UIView *)-[_UIPopoverView contentView](self->_popover, "contentView");
}

- (void)updateBackdropStyle:(int64_t)a3
{
  UIKBVisualEffectView *backdrop;
  UIKBVisualEffectView *v6;
  UIKBVisualEffectView *v7;
  UIKBVisualEffectView *v8;
  void *v9;

  backdrop = self->_backdrop;
  if (a3 == 3904)
  {
    if (backdrop)
      -[UIView setAlpha:](backdrop, "setAlpha:", 0.0);
  }
  else
  {
    if (!backdrop)
    {
      v6 = [UIKBVisualEffectView alloc];
      v7 = -[UIKBBackdropView initWithFrame:style:](v6, "initWithFrame:style:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_backdrop;
      self->_backdrop = v7;

      -[UIView setAutoresizingMask:](self->_backdrop, "setAutoresizingMask:", 18);
      -[UIView setUserInteractionEnabled:](self->_backdrop, "setUserInteractionEnabled:", 1);
      -[UIKeyboardPopoverContainer backdropParent](self, "backdropParent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:atIndex:", self->_backdrop, 0);

      backdrop = self->_backdrop;
    }
    -[UIView setAlpha:](backdrop, "setAlpha:", 1.0);
    -[UIKBBackdropView transitionToStyle:](self->_backdrop, "transitionToStyle:", a3);
  }
  -[_UIKeyboardPopoverAffordance updateForBackdropStyle:](self->_affordance, "updateForBackdropStyle:", a3);
}

+ (UIEdgeInsets)contentInsets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  UIEdgeInsets result;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "shouldShowCandidateBar") & 1) == 0)
  {

    goto LABEL_5;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forwardingInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
    v7 = v8 + 6.5;
    goto LABEL_6;
  }
  +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
  v7 = v6;
LABEL_6:
  +[UIKeyboardPopoverContainer dragAreaHeight](UIKeyboardPopoverContainer, "dragAreaHeight");
  v10 = v9;
  +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
  v12 = v11 + 6.5;
  +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
  v14 = v13 + 6.5;
  v15 = v7;
  v16 = v12;
  v17 = v10;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

+ (id)propertiesForTargetRect:(CGRect)a3 withHeight:(double)a4 onScreenSize:(CGSize)a5
{
  double width;
  double v7;
  double y;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double height;
  double x;
  double v59;
  double v60;
  double v61;
  _QWORD v62[6];
  _QWORD v63[7];

  height = a5.height;
  x = a3.origin.x;
  width = a5.width;
  v7 = a3.size.height;
  v60 = a3.size.width;
  y = a3.origin.y;
  v63[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  v11 = v10;
  +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
  v13 = v12;
  objc_msgSend(a1, "contentInsets");
  v15 = v14 + a4;
  objc_msgSend(a1, "contentInsets");
  v17 = v15 + v16;
  objc_msgSend(a1, "contentInsets");
  v19 = v18;
  objc_msgSend(a1, "contentInsets");
  v21 = y;
  v22 = v7;
  v23 = v13 + v19 + v20;
  v24 = y + v7;
  v25 = height - (y + v7);
  v26 = v11 + v15;
  if (v25 > v11 + v15)
  {
    v27 = 0;
    if (x + v60 * 0.5 <= width * 0.5)
      v28 = 0.0;
    else
      v28 = width - v13;
    v29 = v24 + v11;
    v30 = v11 + v17;
    v31 = 1;
    v32 = v23;
    v33 = v28;
    v34 = v60;
    v35 = x;
    v36 = v17;
    goto LABEL_14;
  }
  v35 = x;
  v34 = v60;
  if (y > v26)
  {
    if (x + v60 * 0.5 <= width * 0.5)
      v28 = 0.0;
    else
      v28 = width - v13;
    v29 = y - v15 - v11;
    v27 = 1;
    v36 = v17;
    v30 = v11 + v17;
    v31 = 2;
    v32 = v23;
    v24 = v29;
    goto LABEL_13;
  }
  if (x > v11 + v13)
  {
    v27 = 0;
    v28 = 0.0 - v11;
    v31 = 8;
    v32 = v11 + v23;
    v29 = y;
    v36 = v17;
    v30 = v17;
    v24 = y;
LABEL_13:
    v33 = v28;
    goto LABEL_14;
  }
  v36 = v17;
  v27 = 0;
  if (width - (x + v60) <= v11 + v13)
  {
    v31 = 0;
    v24 = height - v26;
    v33 = 0.0;
    v32 = v13 + v19 + v20;
    v30 = v17;
    v29 = height - v26;
    v28 = 0.0;
    goto LABEL_19;
  }
  v33 = width - v13;
  v28 = v11 + width - v13;
  v32 = v11 + v23;
  v31 = 4;
  v29 = y;
  v30 = v17;
  v24 = y;
LABEL_14:
  if (v33 < 0.0)
  {
    v28 = v28 - v33;
    v33 = 0.0;
    goto LABEL_21;
  }
LABEL_19:
  if (v33 > width - v32)
  {
    v28 = v28 - (v33 - (width - v30));
    v33 = width - v13;
  }
LABEL_21:
  if (v24 >= 0.0)
  {
    v37 = height - v30;
    if (v24 >= height - v30)
      v29 = v29 - (v24 - v37);
    else
      v37 = v24;
  }
  else
  {
    v29 = v29 - v24;
    v37 = 0.0;
  }
  v59 = v32;
  v61 = v30;
  v38 = v27 ^ 1;
  if (v25 > v26)
    v38 = 0;
  v39 = v36;
  v40 = v36;
  v41 = v29;
  if ((v38 & 1) == 0)
  {
    v22 = v34;
    v21 = v35;
    v40 = v23;
    v41 = v28;
  }
  v42 = v21 + v22 * 0.5 - (v40 * 0.5 + v41);
  v43 = v23;
  objc_msgSend(a1, "contentInsets", *(_QWORD *)&height);
  v45 = v29 - v44;
  objc_msgSend(a1, "contentInsets");
  v47 = v45 - v46;
  objc_msgSend(a1, "contentInsets");
  v49 = v28 + v48;
  v62[0] = CFSTR("ArrowDirection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v50;
  v62[1] = CFSTR("ArrowOffset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v51;
  v62[2] = _UIKeyboardPopoverKeyboardRect;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v49, v47, v43, v39);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v52;
  v62[3] = CFSTR("PopoverRect");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v33, v37, v59, v61);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v53;
  v63[4] = &unk_1E1A95B50;
  v62[4] = CFSTR("Alpha");
  v62[5] = CFSTR("KeyboardSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v54;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5
{
  double height;
  double width;
  double x;
  CGFloat v9;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a4.height;
  width = a4.width;
  x = a3.x;
  v9 = a5.height - (a4.height - a3.y);
  objc_msgSend(a1, "contentInsets");
  v11 = v9 - v10;
  objc_msgSend(a1, "contentInsets");
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  v15 = height + v13 + v14;
  objc_msgSend(a1, "contentInsets");
  v17 = v15 + v16;
  objc_msgSend(a1, "contentInsets");
  v19 = v18;
  objc_msgSend(a1, "contentInsets");
  v21 = width + v19 + v20;
  objc_msgSend(a1, "contentInsets");
  v23 = x - v22;
  v24 = v11;
  v25 = v21;
  v26 = v17;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (id)propertiesForSpecificKeyboardFrame:(CGRect)a3 onScreenSize:(CGSize)a4
{
  double height;
  double width;
  double x;
  CGFloat v8;
  double v9;
  CGFloat v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[6];
  _QWORD v28[7];

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v28[6] = *MEMORY[0x1E0C80C00];
  v8 = a4.height - (a3.size.height - a3.origin.y);
  objc_msgSend(a1, "contentInsets");
  v10 = v8 - v9;
  objc_msgSend(a1, "contentInsets");
  v12 = v11;
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  v14 = height + v12 + v13;
  objc_msgSend(a1, "contentInsets");
  v16 = v14 + v15;
  objc_msgSend(a1, "contentInsets");
  v18 = v17;
  objc_msgSend(a1, "contentInsets");
  v20 = width + v18 + v19;
  objc_msgSend(a1, "contentInsets");
  v27[0] = CFSTR("ArrowDirection");
  v27[1] = CFSTR("ArrowOffset");
  v28[0] = &unk_1E1A98F28;
  v28[1] = &unk_1E1A98F28;
  v27[2] = CFSTR("PopoverRect");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x - v21, v10, v20, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v22;
  v28[3] = &unk_1E1A95B50;
  v27[3] = CFSTR("Alpha");
  v27[4] = CFSTR("KeyboardSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v23;
  v27[5] = CFSTR("TouchInsets");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", -20.0, -20.0, -20.0, -20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)applyProperties:(id)a3
{
  id v4;
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
  _UIPopoverView *popover;
  _UIPopoverView *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _UIPopoverView *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  _UIPopoverView *v40;
  CGAffineTransform *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[3];
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PopoverRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "rectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    popover = self->_popover;
    if (popover)
      -[UIView transform](popover, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v45 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t2.c = v44;
    v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&t2.tx = v43;
    if (CGAffineTransformEqualToTransform(&t1, &t2))
    {
      -[UIView setFrame:](self->_popoverContainerView, "setFrame:", v8, v10, v12, v14);
    }
    else
    {
      v16 = self->_popover;
      if (v16)
        -[UIView transform](v16, "transform");
      else
        memset(&v48, 0, sizeof(v48));
      *(_OWORD *)&t2.a = v45;
      *(_OWORD *)&t2.c = v44;
      *(_OWORD *)&t2.tx = v43;
      if (!CGAffineTransformEqualToTransform(&v48, &t2))
      {
        -[UIView layer](self->_popoverContainerView, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "anchorPoint");
        v19 = v8 + v12 * v18;

        -[UIView layer](self->_popoverContainerView, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "anchorPoint");
        v22 = v10 + v14 * v21;

        -[UIView setCenter:](self->_popoverContainerView, "setCenter:", v19, v22);
        -[UIView setBounds:](self->_popoverContainerView, "setBounds:", 0.0, 0.0, v12, v14);
      }
    }
    -[UIKeyboardPopoverContainer _updateKeyboardLayoutGuideForPopover:](self, "_updateKeyboardLayoutGuideForPopover:", v8, v10, v12, v14, v43, v44, v45);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ArrowOffset"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "doubleValue");
    -[_UIPopoverView setArrowOffset:](self->_popover, "setArrowOffset:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ArrowDirection"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    v26 = objc_msgSend(v25, "integerValue");
  else
    v26 = 0;
  -[_UIPopoverView setArrowDirection:](self->_popover, "setArrowDirection:", v26);
  objc_msgSend(v4, "objectForKey:", CFSTR("Alpha"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v27, "doubleValue");
    -[UIView setAlpha:](self->_popoverContainerView, "setAlpha:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TouchInsets"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "UIEdgeInsetsValue");
  }
  else
  {
    v31 = 0.0;
    v30 = 0.0;
    v29 = 0.0;
    v32 = 0.0;
  }
  -[UIView _setTouchInsets:](self->_popover, "_setTouchInsets:", v29, v30, v31, v32);
  v33 = self->_popover;
  if (-[_UIPopoverView arrowDirection](v33, "arrowDirection"))
    +[UIPopoverBackgroundView _contentViewCornerRadiusForArrowDirection:](_UIPopoverStandardChromeView, "_contentViewCornerRadiusForArrowDirection:", -[_UIPopoverView arrowDirection](self->_popover, "arrowDirection"));
  else
    objc_msgSend((id)objc_opt_class(), "cornerRadius");
  -[_UIPopoverView _setCornerRadius:](v33, "_setCornerRadius:");
  -[_UIPopoverView contentView](self->_popover, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("KeyboardSize"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v36, "doubleValue");
  }
  else
  {
    -[UIView frame](self->_popoverContainerView, "frame");
    v37 = v38;
  }
  -[NSLayoutConstraint setConstant:](self->_keyboardAreaHeight, "setConstant:", -v37);
  objc_msgSend(v4, "objectForKey:", CFSTR("Transform"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    memset(&t2, 0, sizeof(t2));
    objc_msgSend(v39, "CGAffineTransformValue");
    v47 = t2;
    v40 = self->_popover;
    v41 = &v47;
  }
  else
  {
    v40 = self->_popover;
    v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v46[0] = *MEMORY[0x1E0C9BAA8];
    v46[1] = v42;
    v46[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v41 = (CGAffineTransform *)v46;
  }
  -[UIView setTransform:](v40, "setTransform:", v41);

}

- (void)_updateKeyboardLayoutGuideForPopover:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!+[UIAssistantBarButtonItemProvider _isScribbleButtonsVisible](UIAssistantBarButtonItemProvider, "_isScribbleButtonsVisible"))
  {
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView _rootInputWindowController](self->_popover, "_rootInputWindowController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isTranslating");

      objc_msgSend(v24, "keyboardVisibilityDidChangeWithFrame:visible:tracking:", 1, v9, x, y, width, height);
LABEL_7:

      return;
    }
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v35))
    {
      -[UIView window](self->_popover, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fixedCoordinateSpace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView window](self->_popover, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "coordinateSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView window](self->_popover, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hostedViewReference");
      v20 = v19;
      v22 = v21;

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__UIKeyboardPopoverContainer__updateKeyboardLayoutGuideForPopover___block_invoke;
      v25[3] = &unk_1E16D7780;
      v28 = x;
      v29 = y;
      v30 = width;
      v31 = height;
      v34 = v15 == 0;
      v25[4] = self;
      v26 = v12;
      v27 = v15;
      v32 = v20;
      v33 = v22;
      v23 = v15;
      v24 = v12;
      +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v25);

      goto LABEL_7;
    }
  }
}

void __67__UIKeyboardPopoverContainer__updateKeyboardLayoutGuideForPopover___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  id v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v67 = a2;
  if (objc_msgSend(v67, "isTrackingKeyboard"))
  {
    objc_msgSend(v67, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v78.origin.x = v12;
    v78.origin.y = v13;
    v78.size.width = v14;
    v78.size.height = v15;
    v68.origin.x = v4;
    v68.origin.y = v6;
    v68.size.width = v8;
    v68.size.height = v10;
    if (CGRectEqualToRect(v68, v78) && !objc_msgSend(v67, "_isHostedInAnotherProcess"))
    {

    }
    else
    {
      v16 = *(unsigned __int8 *)(a1 + 104);

      if (!v16)
      {
        objc_msgSend(v67, "coordinateSpace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "frame");
        objc_msgSend(v17, "convertRect:toCoordinateSpace:", *(_QWORD *)(a1 + 40));
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;

        objc_msgSend(*(id *)(a1 + 48), "convertRect:fromCoordinateSpace:", *(_QWORD *)(a1 + 40), v19, v21, v23, v25);
        x = v69.origin.x;
        y = v69.origin.y;
        width = v69.size.width;
        height = v69.size.height;
        v79.size.width = *(CGFloat *)(a1 + 72);
        v79.size.height = *(CGFloat *)(a1 + 80);
        v79.origin.x = *(double *)(a1 + 56) - *(double *)(a1 + 88);
        v79.origin.y = *(double *)(a1 + 64) - *(double *)(a1 + 96);
        v70 = CGRectIntersection(v69, v79);
        MinX = v70.origin.x;
        MaxY = v70.origin.y;
        v32 = v70.size.width;
        v33 = v70.size.height;
        if (CGRectIsEmpty(v70))
        {
          v71.origin.x = x;
          v71.origin.y = y;
          v71.size.width = width;
          v71.size.height = height;
          MinX = CGRectGetMinX(v71);
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          MaxY = CGRectGetMaxY(v72);
          objc_msgSend(v67, "frame");
          v32 = v34;
          objc_msgSend(v67, "insetForDismissedKeyboardGuide");
          v33 = v35;
        }
        objc_msgSend(*(id *)(a1 + 48), "convertRect:toCoordinateSpace:", *(_QWORD *)(a1 + 40), MinX, MaxY, v32, v33);
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;
        objc_msgSend(v67, "coordinateSpace");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "convertRect:fromCoordinateSpace:", *(_QWORD *)(a1 + 40), v37, v39, v41, v43);
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;

        v53 = v67;
        goto LABEL_10;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "window");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "convertRect:fromWindow:", v54, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;

    objc_msgSend(v67, "frame");
    v80.origin.x = v56;
    v80.origin.y = v58;
    v80.size.width = v60;
    v80.size.height = v62;
    v74 = CGRectIntersection(v73, v80);
    v53 = v67;
    v46 = v74.origin.x;
    v48 = v74.origin.y;
    v50 = v74.size.width;
    v52 = v74.size.height;
LABEL_10:
    objc_msgSend(v53, "_primaryKeyboardTrackingGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "changeSizingConstants:", v50, v52);

    objc_msgSend(v67, "_primaryKeyboardTrackingGuide");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v75.origin.x = v46;
    v75.origin.y = v48;
    v75.size.width = v50;
    v75.size.height = v52;
    v65 = CGRectGetMinX(v75);
    objc_msgSend(v67, "frame");
    v66 = CGRectGetMaxY(v76);
    v77.origin.x = v46;
    v77.origin.y = v48;
    v77.size.width = v50;
    v77.size.height = v52;
    objc_msgSend(v64, "changeOffsetConstants:", v65, v66 - CGRectGetMaxY(v77));

  }
}

- (void)invalidate
{
  _UIPopoverView *popover;
  _UIKeyboardPopover *popoverContainerView;

  -[UIView removeFromSuperview](self->_popover, "removeFromSuperview");
  popover = self->_popover;
  self->_popover = 0;

  -[UIView removeFromSuperview](self->_popoverContainerView, "removeFromSuperview");
  popoverContainerView = self->_popoverContainerView;
  self->_popoverContainerView = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardAreaHeight, 0);
  objc_storeStrong((id *)&self->_affordance, 0);
  objc_storeStrong((id *)&self->_popover, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_popoverContainerView, 0);
}

@end
