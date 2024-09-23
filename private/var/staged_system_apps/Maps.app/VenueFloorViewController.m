@implementation VenueFloorViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VenueFloorViewController)initWithCoder:(id)a3
{

  return 0;
}

- (VenueFloorViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (VenueFloorViewController)initWithDelegate:(id)a3 venuesManager:(id)a4 visualEffectDisabled:(BOOL)a5
{
  id v8;
  id v9;
  VenueFloorViewController *v10;
  VenueFloorViewController *v11;
  NSArray *openConstraints;
  NSArray *closedConstraints;
  NSMutableArray *v14;
  NSMutableArray *updateHiddenAnimationCompletionBlocks;
  NSArray *floorOrdinals;
  NSDictionary *shortFloorNames;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VenueFloorViewController;
  v10 = -[VenueFloorViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_venuesManager, v9);
    v11->_visualEffectDisabled = a5;
    openConstraints = v11->_openConstraints;
    v11->_openConstraints = (NSArray *)&__NSArray0__struct;

    closedConstraints = v11->_closedConstraints;
    v11->_closedConstraints = (NSArray *)&__NSArray0__struct;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateHiddenAnimationCompletionBlocks = v11->_updateHiddenAnimationCompletionBlocks;
    v11->_updateHiddenAnimationCompletionBlocks = v14;

    floorOrdinals = v11->_floorOrdinals;
    v11->_floorOrdinals = (NSArray *)&__NSArray0__struct;

    shortFloorNames = v11->_shortFloorNames;
    v11->_shortFloorNames = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v11;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "handleCloseButtonTap"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (UIView)closedPlaceholderView
{
  UIView *closedPlaceholderView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  closedPlaceholderView = self->_closedPlaceholderView;
  if (!closedPlaceholderView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_closedPlaceholderView;
    self->_closedPlaceholderView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_closedPlaceholderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_closedPlaceholderView, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_closedPlaceholderView, "widthAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v9, "setActive:", 1);

    closedPlaceholderView = self->_closedPlaceholderView;
  }
  return closedPlaceholderView;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  VenueFloorViewController *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _QWORD v95[4];
  void *v96;
  _QWORD v97[7];

  v3 = objc_alloc_init((Class)UIStackView);
  -[VenueFloorViewController setStackView:](self, "setStackView:", v3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAxis:", 1);
  -[VenueFloorViewController setView:](self, "setView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("VenueCloseBackgroundColor")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  objc_msgSend(v5, "setTintColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("LevelSwitcherCloseButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
  objc_msgSend(v6, "setImage:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 25.0));
  objc_msgSend(v6, "setPreferredSymbolConfiguration:forImageInState:", v8, 0);

  -[VenueFloorViewController setCloseButton:](self, "setCloseButton:", v6);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "handleCloseButtonTap", 64);
  objc_msgSend(v3, "addArrangedSubview:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("VenueCloseBackgroundColor")));
  v94 = v6;
  objc_msgSend(v6, "setTintColor:", v9);

  v10 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", -[VenueFloorViewController visualEffectDisabled](self, "visualEffectDisabled") ^ 1);
  -[VenueFloorViewController setCardView:](self, "setCardView:", v10);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setLayoutStyle:", 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController blurGroupName](self, "blurGroupName"));
  objc_msgSend(v10, "setBlurGroupName:", v11);

  objc_msgSend(v3, "addArrangedSubview:", v10);
  +[VenueFloorPickerCell cellHeight](VenueFloorPickerCell, "cellHeight");
  v13 = fmax(v12, 44.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "screen"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
    objc_msgSend(v18, "nativeScale");
    v20 = v19;

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v17, "nativeScale");
    v20 = v21;
  }

  v22 = 1.0;
  if (v20 > 0.0)
    v22 = 1.0 / v20;
  v23 = v13 + v22;

  v24 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v24, "setItemSize:", 44.0, v23);
  objc_msgSend(v24, "setMinimumLineSpacing:", 0.0);
  v90 = v24;
  v25 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v24, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[VenueFloorViewController setFloorCollectionView:](self, "setFloorCollectionView:", v25);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "setShowsVerticalScrollIndicator:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v25, "setBackgroundColor:", v26);

  objc_msgSend(v25, "setDataSource:", self);
  objc_msgSend(v25, "setDelegate:", self);
  v27 = objc_opt_class(VenueFloorPickerCell);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[VenueFloorPickerCell reuseIdentifier](VenueFloorPickerCell, "reuseIdentifier"));
  objc_msgSend(v25, "registerClass:forCellWithReuseIdentifier:", v27, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  objc_msgSend(v29, "addSubview:", v25);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
  LODWORD(v31) = 1144750080;
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:priority:", 0.0, v31));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
  LODWORD(v33) = 1148829696;
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:priority:", 0.0, v33));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  LODWORD(v35) = 1148829696;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintGreaterThanOrEqualToConstant:priority:", 44.0, v35));
  v97[0] = v82;
  v97[1] = v34;
  v89 = (void *)v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v80 = v36;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v78));
  v97[2] = v76;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "screen"));
  v91 = v3;
  v88 = self;
  v74 = v39;
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "screen"));
    objc_msgSend(v43, "nativeScale");
    v45 = v44;

  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v42, "nativeScale");
    v45 = v46;
  }

  v47 = 1.0;
  if (v45 > 0.0)
    v47 = 1.0 / v45;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v47));
  v97[3] = v48;
  v72 = (void *)v38;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  v97[4] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v92 = v10;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  v97[5] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "heightAnchor"));
  LODWORD(v56) = 1148829696;
  v87 = v25;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:priority:", 44.0, v56));
  v97[6] = v57;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 7));

  v96 = v93;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
  v85 = objc_msgSend(v58, "mutableCopy");

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](v88, "delegate"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "venueFloorViewControllerConstraintsForViewWhenOpen:", v88));
  objc_msgSend(v85, "addObjectsFromArray:", v60);

  -[VenueFloorViewController setOpenConstraints:](v88, "setOpenConstraints:", v85);
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](v88, "closedPlaceholderView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v79));
  v95[0] = v77;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](v88, "closedPlaceholderView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v71));
  v95[1] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](v88, "closedPlaceholderView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v64));
  v95[2] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](v88, "closedPlaceholderView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v68));
  v95[3] = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 4));

  -[VenueFloorViewController setClosedConstraints:](v88, "setClosedConstraints:", v70);
  -[VenueFloorViewController setFloorOptimalOpenHeightConstraint:](v88, "setFloorOptimalOpenHeightConstraint:", v93);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v86);
  -[VenueFloorViewController setupGestures](v88, "setupGestures");
  -[MapsThemeViewController updateTheme](v88, "updateTheme");

}

- (void)delayConstraintSetupWhileExecuting:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[VenueFloorViewController delayConstraintSetup](self, "delayConstraintSetup"))
  {
    v4[2]();
  }
  else
  {
    -[VenueFloorViewController setDelayConstraintSetup:](self, "setDelayConstraintSetup:", 1);
    v4[2]();
    -[VenueFloorViewController setDelayConstraintSetup:](self, "setDelayConstraintSetup:", 0);
    -[VenueFloorViewController updateForOpenChangedAnimated:](self, "updateForOpenChangedAnimated:", 0);
  }

}

- (void)setupGestures
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  -[VenueFloorViewController setOpenGestureRecognizer:](self, "setOpenGestureRecognizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openGestureRecognizer](self, "openGestureRecognizer"));
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  v6 = -[VenueFloorViewController isOpen](self, "isOpen") ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openGestureRecognizer](self, "openGestureRecognizer"));
  objc_msgSend(v7, "setEnabled:", v6);

  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  -[VenueFloorViewController setPressGestureRecognizer:](self, "setPressGestureRecognizer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController pressGestureRecognizer](self, "pressGestureRecognizer"));
  objc_msgSend(v9, "setAllowedPressTypes:", &off_101273C20);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController pressGestureRecognizer](self, "pressGestureRecognizer"));
  objc_msgSend(v10, "setAllowedTouchTypes:", &__NSArray0__struct);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController pressGestureRecognizer](self, "pressGestureRecognizer"));
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  v13 = -[VenueFloorViewController isOpen](self, "isOpen") ^ 1;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController pressGestureRecognizer](self, "pressGestureRecognizer"));
  objc_msgSend(v14, "setEnabled:", v13);

}

- (void)setBlurGroupName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *blurGroupName;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
  objc_msgSend(v7, "setBlurGroupName:", v4);

}

- (void)setOpen:(BOOL)a3
{
  -[VenueFloorViewController setOpen:animated:](self, "setOpen:animated:", a3, 1);
}

- (void)setOpen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v6;
  void *v7;
  void *v8;

  if (self->_open != a3)
  {
    v4 = a4;
    self->_open = a3;
    v6 = !a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openGestureRecognizer](self, "openGestureRecognizer"));
    objc_msgSend(v7, "setEnabled:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController pressGestureRecognizer](self, "pressGestureRecognizer"));
    objc_msgSend(v8, "setEnabled:", v6);

    -[VenueFloorViewController updateForOpenChangedAnimated:](self, "updateForOpenChangedAnimated:", v4);
    if (v6)
      -[VenueFloorViewController didClose](self, "didClose");
    else
      -[VenueFloorViewController didOpen](self, "didOpen");
  }
}

- (BOOL)isHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setForceHidden:(BOOL)a3
{
  -[VenueFloorViewController setForceHidden:animated:completion:](self, "setForceHidden:animated:completion:", a3, 0, 0);
}

- (void)setForceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_forceHidden != v6)
  {
    self->_forceHidden = v6;
    v10 = v8;
    -[VenueFloorViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", v5, v8);
    goto LABEL_5;
  }
  if (v8)
  {
    v10 = v8;
    (*((void (**)(id))v8 + 2))(v8);
LABEL_5:
    v9 = v10;
  }

}

- (void)setUserLocationFloorOrdinal:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  if (!+[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", self->_userLocationFloorOrdinal, v5))
  {
    objc_storeStrong((id *)&self->_userLocationFloorOrdinal, a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preparedCells"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v13 = objc_opt_class(VenueFloorPickerCell);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "floorOrdinal"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController userLocationFloorOrdinal](self, "userLocationFloorOrdinal"));
            v16 = +[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", v14, v15);

            objc_msgSend(v12, "setIsUserLocation:", v16);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)lacksSearchResultsForFloorOrdinal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
  v7 = objc_msgSend(v4, "shortValue");

  LOBYTE(v4) = objc_msgSend(v5, "lacksSearchResultsInVenue:forFloorOrdinal:", v6, v7);
  return (char)v4;
}

- (void)didChangeSearchResultsInVenue
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preparedCells"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(VenueFloorPickerCell);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "floorOrdinal"));
          objc_msgSend(v9, "setLacksSearchResults:", -[VenueFloorViewController lacksSearchResultsForFloorOrdinal:](self, "lacksSearchResultsForFloorOrdinal:", v11));

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  uint64_t v5;

  v5 = a5;
  -[VenueFloorViewController setVenue:focusedBuilding:animated:forceUpdate:](self, "setVenue:focusedBuilding:animated:forceUpdate:", a3, a4, 1, 0);
  if (a3)
    -[VenueFloorViewController setDisplayedFloorOrdinal:animated:](self, "setDisplayedFloorOrdinal:animated:", v5, 1);
}

- (BOOL)isFocusedOnVenue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
  v6 = objc_msgSend(v5, "venueID");
  v7 = objc_msgSend(v4, "venueID");

  v8 = v6 == v7;
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[VenueFloorViewController setVisible:](self, "setVisible:", 1);
  -[VenueFloorViewController updateForOpenChangedAnimated:](self, "updateForOpenChangedAnimated:", 0);
  -[VenueFloorViewController updateVenueAndBuildingsAnimated:forced:](self, "updateVenueAndBuildingsAnimated:forced:", 0, 1);
  v5.receiver = self;
  v5.super_class = (Class)VenueFloorViewController;
  -[VenueFloorViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[VenueFloorViewController setVisible:](self, "setVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)VenueFloorViewController;
  -[VenueFloorViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleCloseButtonTap
{
  -[VenueFloorViewController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", 32, 644, 0);
  -[VenueFloorViewController setOpen:animated:](self, "setOpen:animated:", 0, 1);
}

- (void)handleTap:(id)a3
{
  if (!-[VenueFloorViewController isOpen](self, "isOpen", a3))
  {
    -[VenueFloorViewController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", 31, 644, 0);
    -[VenueFloorViewController setOpen:animated:](self, "setOpen:animated:", 1, 1);
  }
}

- (BOOL)shouldBeHidden
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[VenueFloorViewController forceHidden](self, "forceHidden"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
    v3 = (unint64_t)objc_msgSend(v5, "count") < 2;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
    objc_msgSend(v7, "setHidden:", v3);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](self, "closedPlaceholderView"));
    objc_msgSend(v8, "setHidden:", v3);

  }
}

- (void)updateHiddenAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(_QWORD);
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
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
  _QWORD v55[5];
  void (**v56)(_QWORD);
  char v57;
  _QWORD v58[5];
  char v59;
  _QWORD v60[4];
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v6 = (void (**)(_QWORD))a4;
  if (-[VenueFloorViewController updateHiddenAnimationActive](self, "updateHiddenAnimationActive"))
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController updateHiddenAnimationCompletionBlocks](self, "updateHiddenAnimationCompletionBlocks"));
      v8 = objc_retainBlock(v6);
      objc_msgSend(v7, "addObject:", v8);

    }
    goto LABEL_15;
  }
  v9 = -[VenueFloorViewController shouldBeHidden](self, "shouldBeHidden");
  if (v9 == -[VenueFloorViewController isHidden](self, "isHidden"))
    goto LABEL_11;
  if (!a3)
  {
    if (!v9)
    {
      -[VenueFloorViewController didStartShowing](self, "didStartShowing");
      -[VenueFloorViewController setHidden:](self, "setHidden:", 0);
      -[VenueFloorViewController didFinishShowing](self, "didFinishShowing");
      if (!v6)
        goto LABEL_15;
      goto LABEL_12;
    }
    -[VenueFloorViewController didStartHiding](self, "didStartHiding");
    -[VenueFloorViewController setHidden:](self, "setHidden:", 1);
    -[VenueFloorViewController setOpen:animated:](self, "setOpen:animated:", 0, 0);
    -[VenueFloorViewController didFinishHiding](self, "didFinishHiding");
LABEL_11:
    if (!v6)
      goto LABEL_15;
LABEL_12:
    v6[2](v6);
    goto LABEL_15;
  }
  -[VenueFloorViewController setUpdateHiddenAnimationActive:](self, "setUpdateHiddenAnimationActive:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](self, "closedPlaceholderView"));
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedPlaceholderView](self, "closedPlaceholderView"));
      objc_msgSend(v12, "convertRect:fromView:", v22, v15, v17, v19, v21);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leftAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leftAnchor"));
      v61.origin.x = v24;
      v61.origin.y = v26;
      v61.size.width = v28;
      v61.size.height = v30;
      v31 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, CGRectGetMinX(v61));
      v51 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v60[0] = v51;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "rightAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leftAnchor"));
      v62.origin.x = v24;
      v62.origin.y = v26;
      v62.size.width = v28;
      v62.size.height = v30;
      v32 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, CGRectGetMaxX(v62));
      v47 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v60[1] = v47;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
      v63.origin.x = v24;
      v63.origin.y = v26;
      v63.size.width = v28;
      v63.size.height = v30;
      v34 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v33, CGRectGetMinY(v63));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v60[2] = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController cardView](self, "cardView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
      v64.origin.x = v24;
      v64.origin.y = v26;
      v64.size.width = v28;
      v64.size.height = v30;
      v39 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, CGRectGetMaxY(v64));
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v60[3] = v40;
      v41 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 4));
      v42 = (void *)qword_1014D31F8;
      qword_1014D31F8 = v41;

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedConstraints](self, "closedConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openConstraints](self, "openConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v44);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", qword_1014D31F8);
    }
  }
  else
  {
    objc_msgSend(v10, "setAlpha:", 0.0);

    -[VenueFloorViewController setHidden:](self, "setHidden:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController view](self, "view"));
    objc_msgSend(v12, "layoutIfNeeded");
  }

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100775D44;
  v58[3] = &unk_1011ACE58;
  v59 = v9;
  v58[4] = self;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100775DE0;
  v55[3] = &unk_1011C60D8;
  v55[4] = self;
  v57 = v9;
  v56 = v6;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v58, v55);

LABEL_15:
}

- (void)updateForOpenChangedAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD *v15;
  _QWORD v16[5];

  v3 = a3;
  if (-[VenueFloorViewController isVisible](self, "isVisible")
    && !-[VenueFloorViewController delayConstraintSetup](self, "delayConstraintSetup"))
  {
    if (-[VenueFloorViewController isOpen](self, "isOpen"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedConstraints](self, "closedConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openConstraints](self, "openConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

      -[VenueFloorViewController updateFloorOptimalOpenHeightConstraint](self, "updateFloorOptimalOpenHeightConstraint");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController openConstraints](self, "openConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closedConstraints](self, "closedConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

    }
    v9 = -[VenueFloorViewController isOpen](self, "isOpen");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
    objc_msgSend(v10, "setScrollEnabled:", v9);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100776298;
    v16[3] = &unk_1011AC860;
    v16[4] = self;
    v11 = objc_retainBlock(v16);
    v12 = v11;
    if (v3)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1007762E4;
      v14[3] = &unk_1011ACAD0;
      v14[4] = self;
      v15 = v11;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100776314;
      v13[3] = &unk_1011AE8F8;
      v13[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v14, v13);

    }
    else
    {
      ((void (*)(_QWORD *))v11[2])(v11);
      -[VenueFloorViewController updateShowSelection](self, "updateShowSelection");
    }

  }
}

- (void)updateCloseButtonVisibility
{
  double v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[VenueFloorViewController isOpen](self, "isOpen"))
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closeButton](self, "closeButton"));
  objc_msgSend(v4, "setAlpha:", v3);

  v5 = -[VenueFloorViewController isOpen](self, "isOpen") ^ 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController closeButton](self, "closeButton"));
  objc_msgSend(v6, "setHidden:", v5);

}

- (void)updateFloorOptimalOpenHeightConstraint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "collectionViewContentSize");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOptimalOpenHeightConstraint](self, "floorOptimalOpenHeightConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)updateShowSelection
{
  -[VenueFloorViewController updateShowSelectionWithForceClipCorners:](self, "updateShowSelectionWithForceClipCorners:", 0);
}

- (void)updateShowSelectionWithForceClipCorners:(BOOL)a3
{
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = -[VenueFloorViewController isOpen](self, "isOpen") | a3;
  if ((_DWORD)v4)
    v5 = 10.0;
  else
    v5 = 0.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
  objc_msgSend(v6, "_setContinuousCornerRadius:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
  objc_msgSend(v7, "setClipsToBounds:", v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preparedCells"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v15 = objc_opt_class(VenueFloorPickerCell);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          objc_msgSend(v14, "setShowSelection:", -[VenueFloorViewController isOpen](self, "isOpen"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)updateVenueAndBuildingsAnimated:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueWithFocus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueBuildingWithFocus"));
  -[VenueFloorViewController setVenue:focusedBuilding:animated:forceUpdate:](self, "setVenue:focusedBuilding:animated:forceUpdate:", v7, v9, v5, v4);

}

- (void)setVenue:(id)a3 focusedBuilding:(id)a4 animated:(BOOL)a5 forceUpdate:(BOOL)a6
{
  _BOOL8 v7;
  VKVenueFeatureMarker *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  VenueFloorViewController *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  NSMutableSet *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  _QWORD *v35;
  _QWORD *v36;
  unsigned int v37;
  _BOOL4 v38;
  id v39;
  VKVenueFeatureMarker *v40;
  _QWORD v41[4];
  _QWORD *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  BOOL v50;
  _BYTE v51[128];

  v7 = a5;
  v10 = (VKVenueFeatureMarker *)a3;
  v11 = objc_claimAutoreleasedReturnValue(-[VKVenueFeatureMarker buildings](v10, "buildings"));
  v12 = (void *)v11;
  v13 = &__NSArray0__struct;
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  if (!-[VenueFloorViewController floorsDirty](self, "floorsDirty") && !a6 && self->_venue == v10)
  {
    v16 = self;
    v17 = v7;
    v15 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_venue, a3);
  -[VenueFloorViewController setFloorsDirty:](self, "setFloorsDirty:", 1);
  if (-[VenueFloorViewController isHidden](self, "isHidden")
    || !-[VenueFloorViewController shouldBeHidden](self, "shouldBeHidden")
    || !v7)
  {
    v38 = v7;
    v40 = v10;
    v18 = objc_opt_new(NSMutableDictionary);
    v19 = objc_opt_new(NSMutableSet);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v14;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "floorOrdinals"));
          -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "shortFloorNames"));
          -[NSMutableDictionary addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v19, "allObjects"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "sortedArrayUsingSelector:", "compare:"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reverseObjectEnumerator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));

    if (!a6)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
      if (+[NSArray array:isEqualToArray:](NSArray, "array:isEqualToArray:", v31, v32))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController shortFloorNames](self, "shortFloorNames"));
        v34 = +[NSDictionary dictionary:isEqualToDictionary:](NSDictionary, "dictionary:isEqualToDictionary:", v18, v33);

        if (v34)
        {
          -[VenueFloorViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", v38, 0);
          v10 = v40;
LABEL_32:
          v14 = v39;

          goto LABEL_33;
        }
      }
      else
      {

      }
    }
    objc_storeStrong((id *)&self->_floorOrdinals, v31);
    objc_storeStrong((id *)&self->_shortFloorNames, v18);
    -[VenueFloorViewController setFloorsDirty:](self, "setFloorsDirty:", 0);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100776B3C;
    v44[3] = &unk_1011AC860;
    v44[4] = self;
    v35 = objc_retainBlock(v44);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100776B74;
    v43[3] = &unk_1011AC860;
    v43[4] = self;
    v36 = objc_retainBlock(v43);
    if (v38)
    {
      v10 = v40;
      if (-[VenueFloorViewController shouldBeHidden](self, "shouldBeHidden"))
      {
        ((void (*)(_QWORD *))v35[2])(v35);
        ((void (*)(_QWORD *))v36[2])(v36);
      }
      else
      {
        v37 = -[VenueFloorViewController isHidden](self, "isHidden");
        ((void (*)(_QWORD *))v35[2])(v35);
        if (v37)
        {
          ((void (*)(_QWORD *))v36[2])(v36);
          -[VenueFloorViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", 1, 0);
        }
        else
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100776BB0;
          v41[3] = &unk_1011ADA00;
          v42 = v36;
          +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v41, 0);

        }
      }
    }
    else
    {
      ((void (*)(_QWORD *))v35[2])(v35);
      ((void (*)(_QWORD *))v36[2])(v36);
      -[VenueFloorViewController updateHiddenAnimated:completion:](self, "updateHiddenAnimated:completion:", 0, 0);
      v10 = v40;
    }

    goto LABEL_32;
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100776B28;
  v49[3] = &unk_1011ACE58;
  v49[4] = self;
  v50 = a6;
  v15 = v49;
  v16 = self;
  v17 = 1;
LABEL_22:
  -[VenueFloorViewController updateHiddenAnimated:completion:](v16, "updateHiddenAnimated:completion:", v17, v15);
LABEL_33:

}

- (void)updateDisplayedFloorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
    -[VenueFloorViewController setDisplayedFloorOrdinal:animated:](self, "setDisplayedFloorOrdinal:animated:", objc_msgSend(v7, "displayedFloorOrdinalForBuildingsInVenue:", v6), v3);

  }
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v5));
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v9, 0));
    if (v10)
    {
      v15 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathsForSelectedItems"));
      v13 = objc_msgSend(v12, "containsObject:", v15);

      if ((v13 & 1) == 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
        objc_msgSend(v14, "selectItemAtIndexPath:animated:scrollPosition:", v15, v4, 2);

      }
      v10 = v15;
    }
  }

}

- (void)scrollToDisplayedFloorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
    -[VenueFloorViewController scrollToFloorOrdinal:animated:](self, "scrollToFloorOrdinal:animated:", objc_msgSend(v7, "displayedFloorOrdinalForBuildingsInVenue:", v6), v3);

  }
}

- (void)scrollToFloorOrdinal:(signed __int16)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v5));
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v9, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorCollectionView](self, "floorCollectionView"));
    objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 2, v4);

  }
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12 = objc_alloc_init((Class)GEOPlaceActionDetails);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
  v10 = objc_msgSend(v9, "businessID");

  if (v10)
    objc_msgSend(v12, "setBusinessID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:placeActionDetails:", v6, v5, v8, v12);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UICollectionViewCell *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (((unint64_t)objc_msgSend(v7, "row") & 0x8000000000000000) != 0
    || (v8 = objc_msgSend(v7, "item"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals")),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 >= v10))
  {
    v14 = objc_opt_new(UICollectionViewCell);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "item")));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[VenueFloorPickerCell reuseIdentifier](VenueFloorPickerCell, "reuseIdentifier"));
      v14 = (UICollectionViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v7));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController shortFloorNames](self, "shortFloorNames"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v12));

      -[UICollectionViewCell setFloorOrdinal:](v14, "setFloorOrdinal:", v12);
      -[UICollectionViewCell setFloorName:](v14, "setFloorName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController userLocationFloorOrdinal](self, "userLocationFloorOrdinal"));
      -[UICollectionViewCell setIsUserLocation:](v14, "setIsUserLocation:", +[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", v12, v17));

      -[UICollectionViewCell setShowSelection:](v14, "setShowSelection:", -[VenueFloorViewController isOpen](self, "isOpen"));
      -[UICollectionViewCell setLacksSearchResults:](v14, "setLacksSearchResults:", -[VenueFloorViewController lacksSearchResultsForFloorOrdinal:](self, "lacksSearchResultsForFloorOrdinal:", v12));

    }
    else
    {
      v14 = objc_opt_new(UICollectionViewCell);
    }

  }
  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController floorOrdinals](self, "floorOrdinals"));
  v7 = objc_msgSend(v5, "item");

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController shortFloorNames](self, "shortFloorNames"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v15));

  -[VenueFloorViewController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", 4006, 644, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
  v11 = objc_msgSend(v15, "shortValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venue](self, "venue"));
  objc_msgSend(v10, "setDisplayedFloorOrdinal:forBuildingsInVenue:", v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController venuesManager](self, "venuesManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));
  objc_msgSend(v14, "setUserTrackingMode:", 0);

}

- (void)didChangeConstraints
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidChangeConstraints:", self);

}

- (void)didStartHiding
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidStartHiding:", self);

}

- (void)didFinishHiding
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidFinishHiding:", self);

}

- (void)didStartShowing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidStartShowing:", self);

}

- (void)didFinishShowing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidFinishShowing:", self);

}

- (void)didOpen
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidOpen:", self);

}

- (void)didClose
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "venueFloorViewControllerDidClose:", self);

}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (NSNumber)userLocationFloorOrdinal
{
  return self->_userLocationFloorOrdinal;
}

- (VenueFloorViewControllerDelegate)delegate
{
  return (VenueFloorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VenuesManager)venuesManager
{
  return (VenuesManager *)objc_loadWeakRetained((id *)&self->_venuesManager);
}

- (void)setVenuesManager:(id)a3
{
  objc_storeWeak((id *)&self->_venuesManager, a3);
}

- (BOOL)delayConstraintSetup
{
  return self->_delayConstraintSetup;
}

- (void)setDelayConstraintSetup:(BOOL)a3
{
  self->_delayConstraintSetup = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)visualEffectDisabled
{
  return self->_visualEffectDisabled;
}

- (void)setVisualEffectDisabled:(BOOL)a3
{
  self->_visualEffectDisabled = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (CardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (UICollectionView)floorCollectionView
{
  return self->_floorCollectionView;
}

- (void)setFloorCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_floorCollectionView, a3);
}

- (NSArray)openConstraints
{
  return self->_openConstraints;
}

- (void)setOpenConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)closedConstraints
{
  return self->_closedConstraints;
}

- (void)setClosedConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSLayoutConstraint)floorOptimalOpenHeightConstraint
{
  return self->_floorOptimalOpenHeightConstraint;
}

- (void)setFloorOptimalOpenHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_floorOptimalOpenHeightConstraint, a3);
}

- (NSLayoutConstraint)floorWidthConstraint
{
  return self->_floorWidthConstraint;
}

- (void)setFloorWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_floorWidthConstraint, a3);
}

- (BOOL)updateHiddenAnimationActive
{
  return self->_updateHiddenAnimationActive;
}

- (void)setUpdateHiddenAnimationActive:(BOOL)a3
{
  self->_updateHiddenAnimationActive = a3;
}

- (NSMutableArray)updateHiddenAnimationCompletionBlocks
{
  return self->_updateHiddenAnimationCompletionBlocks;
}

- (void)setUpdateHiddenAnimationCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateHiddenAnimationCompletionBlocks, a3);
}

- (UITapGestureRecognizer)openGestureRecognizer
{
  return self->_openGestureRecognizer;
}

- (void)setOpenGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_openGestureRecognizer, a3);
}

- (UITapGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, a3);
}

- (VKVenueFeatureMarker)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
  objc_storeStrong((id *)&self->_venue, a3);
}

- (NSArray)floorOrdinals
{
  return self->_floorOrdinals;
}

- (void)setFloorOrdinals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)shortFloorNames
{
  return self->_shortFloorNames;
}

- (void)setShortFloorNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)floorsDirty
{
  return self->_floorsDirty;
}

- (void)setFloorsDirty:(BOOL)a3
{
  self->_floorsDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortFloorNames, 0);
  objc_storeStrong((id *)&self->_floorOrdinals, 0);
  objc_storeStrong((id *)&self->_venue, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_updateHiddenAnimationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_floorWidthConstraint, 0);
  objc_storeStrong((id *)&self->_floorOptimalOpenHeightConstraint, 0);
  objc_storeStrong((id *)&self->_closedConstraints, 0);
  objc_storeStrong((id *)&self->_openConstraints, 0);
  objc_storeStrong((id *)&self->_floorCollectionView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userLocationFloorOrdinal, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_closedPlaceholderView, 0);
}

@end
