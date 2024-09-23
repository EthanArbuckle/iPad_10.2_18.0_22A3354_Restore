@implementation ContainerStyleManager

- (ContainerStyleManager)initWithContainer:(id)a3
{
  id v4;
  ContainerStyleManager *v5;
  ContainerStyleManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ContainerStyleManager;
  v5 = -[ContainerStyleManager init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
    v6->_containerStyle = 0;
    v6->_allowOnlyStandardStyle = 1;
  }

  return v6;
}

- (void)createConstraints
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *widthContainerViewConstraint;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *topContainerViewConstraint;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *bottomContainerViewConstraint;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *leadingContainerViewConstraint;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSLayoutConstraint *v39;
  NSLayoutConstraint *trailingContainerViewConstraint;
  id v41;

  if (!self->_widthContainerViewConstraint)
  {
    p_containerViewController = &self->_containerViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "containerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 0.0));
    widthContainerViewConstraint = self->_widthContainerViewConstraint;
    self->_widthContainerViewConstraint = v7;

    v9 = objc_loadWeakRetained((id *)p_containerViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = objc_loadWeakRetained((id *)p_containerViewController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "safeAreaLayoutGuide"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v15));
    topContainerViewConstraint = self->_topContainerViewConstraint;
    self->_topContainerViewConstraint = v16;

    v18 = objc_loadWeakRetained((id *)p_containerViewController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "containerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = objc_loadWeakRetained((id *)p_containerViewController);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
    bottomContainerViewConstraint = self->_bottomContainerViewConstraint;
    self->_bottomContainerViewConstraint = v24;

    v26 = objc_loadWeakRetained((id *)p_containerViewController);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "containerView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v29 = objc_loadWeakRetained((id *)p_containerViewController);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v31));
    leadingContainerViewConstraint = self->_leadingContainerViewConstraint;
    self->_leadingContainerViewConstraint = v32;

    v41 = objc_loadWeakRetained((id *)p_containerViewController);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "containerView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v36 = objc_loadWeakRetained((id *)p_containerViewController);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
    v39 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v38));
    trailingContainerViewConstraint = self->_trailingContainerViewConstraint;
    self->_trailingContainerViewConstraint = v39;

  }
}

- (double)leadingMargin
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double left;
  double v17;
  CGFloat right;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
  v4 = objc_msgSend(v3, "hasMargin");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v8 = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    v12 = (v8 == (id)1) ^ (objc_msgSend(v11, "interfaceOrientation") == (id)3);

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
      objc_msgSend(v14, "safeAreaInsets");
      left = v15;
      right = v17;

    }
    else
    {
      left = UIEdgeInsetsZero.left;
      right = UIEdgeInsetsZero.right;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "leadingEdgePadding");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
    v23 = v22;
    if (v8 == (id)1)
    {
      objc_msgSend(v22, "rightSafeOffset");
      left = right;
    }
    else
    {
      objc_msgSend(v22, "leftSafeOffset");
    }
    if (v21 + v24 > left)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
      objc_msgSend(v25, "leadingEdgePadding");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
      v29 = v28;
      if (v8 == (id)1)
        objc_msgSend(v28, "rightSafeOffset");
      else
        objc_msgSend(v28, "leftSafeOffset");
      v31 = v30;

      left = v27 + v31;
    }

  }
  else
  {
    objc_msgSend(v5, "leadingEdgePadding");
    left = v19;
  }

  return left;
}

- (void)configureStyleLayout
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *widthContainerViewConstraint;
  id WeakRetained;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *topContainerViewConstraint;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSLayoutConstraint *v39;
  NSLayoutConstraint *bottomContainerViewConstraint;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *v57;
  _BOOL4 stackOnOppositeSide;
  id v59;
  double v60;
  NSLayoutConstraint *trailingContainerViewConstraint;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *v77;
  _OWORD v78[3];

  -[ContainerStyleManager createConstraints](self, "createConstraints");
  if (self->_widthContainerViewConstraint)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerStyleManager containerViewController](self, "containerViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v78[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v78[1] = v5;
    v78[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v4, "setTransform:", v78);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSLayoutConstraint setActive:](self->_widthContainerViewConstraint, "setActive:", 0);
    switch(self->_containerStyle)
    {
      case 1uLL:
      case 5uLL:
        if ((id)-[NSLayoutConstraint relation](self->_topContainerViewConstraint, "relation") != (id)1)
        {
          -[NSLayoutConstraint setActive:](self->_topContainerViewConstraint, "setActive:", 0);
          WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "containerView"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
          v28 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
          v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v30));
          topContainerViewConstraint = self->_topContainerViewConstraint;
          self->_topContainerViewConstraint = v31;

        }
        if (-[NSLayoutConstraint relation](self->_bottomContainerViewConstraint, "relation"))
        {
          -[NSLayoutConstraint setActive:](self->_bottomContainerViewConstraint, "setActive:", 0);
          v33 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "containerView"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
          v36 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "view"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
          v39 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v38));
          bottomContainerViewConstraint = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v39;

        }
        -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_bottomContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_trailingContainerViewConstraint, "setConstant:", 0.0);
        objc_msgSend(v6, "addObject:", self->_leadingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_trailingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_bottomContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_topContainerViewConstraint);
        widthContainerViewConstraint = self->_widthContainerViewConstraint;
        v41 = v7;
        goto LABEL_21;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if ((id)-[NSLayoutConstraint relation](self->_topContainerViewConstraint, "relation") != (id)1)
        {
          -[NSLayoutConstraint setActive:](self->_topContainerViewConstraint, "setActive:", 0);
          v8 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerView"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
          v11 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
          v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v13));
          v15 = self->_topContainerViewConstraint;
          self->_topContainerViewConstraint = v14;

        }
        if (-[NSLayoutConstraint relation](self->_bottomContainerViewConstraint, "relation"))
        {
          -[NSLayoutConstraint setActive:](self->_bottomContainerViewConstraint, "setActive:", 0);
          v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "containerView"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
          v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
          v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v21));
          v23 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v22;

        }
        -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_bottomContainerViewConstraint, "setConstant:", 0.0);
        -[ContainerStyleManager leadingMargin](self, "leadingMargin");
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
        -[ContainerStyleManager containerWidth](self, "containerWidth");
        -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
        objc_msgSend(v6, "addObject:", self->_leadingContainerViewConstraint);
        objc_msgSend(v7, "addObject:", self->_trailingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_bottomContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_topContainerViewConstraint);
        widthContainerViewConstraint = self->_widthContainerViewConstraint;
        goto LABEL_20;
      case 6uLL:
        -[NSLayoutConstraint setActive:](self->_topContainerViewConstraint, "setActive:", 0);
        v42 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "containerView"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
        v45 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
        v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v47));
        v49 = self->_topContainerViewConstraint;
        self->_topContainerViewConstraint = v48;

        if (-[NSLayoutConstraint relation](self->_bottomContainerViewConstraint, "relation") != NSLayoutRelationLessThanOrEqual)
        {
          -[NSLayoutConstraint setActive:](self->_bottomContainerViewConstraint, "setActive:", 0);
          v50 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "containerView"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
          v53 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "view"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
          v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v55));
          v57 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v56;

        }
        stackOnOppositeSide = self->_stackOnOppositeSide;
        -[NSLayoutConstraint setConstant:](self->_bottomContainerViewConstraint, "setConstant:", 0.0);
        v59 = objc_loadWeakRetained((id *)&self->_containerViewController);
        objc_msgSend(v59, "topEdgePadding");
        -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:");

        -[ContainerStyleManager leadingMargin](self, "leadingMargin");
        if (stackOnOppositeSide)
        {
          -[NSLayoutConstraint setConstant:](self->_trailingContainerViewConstraint, "setConstant:", -v60);
          -[ContainerStyleManager containerWidth](self, "containerWidth");
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          objc_msgSend(v7, "addObject:", self->_leadingContainerViewConstraint);
          trailingContainerViewConstraint = self->_trailingContainerViewConstraint;
        }
        else
        {
          -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
          -[ContainerStyleManager containerWidth](self, "containerWidth");
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          objc_msgSend(v7, "addObject:", self->_trailingContainerViewConstraint);
          trailingContainerViewConstraint = self->_leadingContainerViewConstraint;
        }
        objc_msgSend(v6, "addObject:", trailingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_bottomContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_topContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_widthContainerViewConstraint);
        -[ContainerStyleManager setBottomConstraint](self, "setBottomConstraint");
        break;
      case 7uLL:
        -[NSLayoutConstraint setActive:](self->_topContainerViewConstraint, "setActive:", 0);
        v62 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "containerView"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
        v65 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "view"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
        v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v67));
        v69 = self->_topContainerViewConstraint;
        self->_topContainerViewConstraint = v68;

        if (-[NSLayoutConstraint relation](self->_bottomContainerViewConstraint, "relation"))
        {
          -[NSLayoutConstraint setActive:](self->_bottomContainerViewConstraint, "setActive:", 0);
          v70 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "containerView"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
          v73 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "view"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bottomAnchor"));
          v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v75));
          v77 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v76;

        }
        -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_bottomContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:", 0.0);
        -[NSLayoutConstraint setConstant:](self->_trailingContainerViewConstraint, "setConstant:", 0.0);
        objc_msgSend(v7, "addObject:", self->_widthContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_trailingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_leadingContainerViewConstraint);
        objc_msgSend(v6, "addObject:", self->_bottomContainerViewConstraint);
        widthContainerViewConstraint = self->_topContainerViewConstraint;
LABEL_20:
        v41 = v6;
LABEL_21:
        objc_msgSend(v41, "addObject:", widthContainerViewConstraint);
        break;
      default:
        break;
    }
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

  }
}

- (void)setBottomConstraint
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  double v5;
  double v6;
  id v7;
  void *v8;
  double Height;
  double v10;
  CGRect v11;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "statusBarHeight");
  v6 = v5;

  v7 = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v11);

  v10 = Height - v6;
  if (Height - v6 < 728.0)
    v10 = 728.0;
  -[NSLayoutConstraint setConstant:](self->_bottomContainerViewConstraint, "setConstant:", v10 - Height);
}

- (double)containerWidth
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  id v6;
  double v7;
  unint64_t containerStyle;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t *v13;
  id v14;
  void *v15;
  double v16;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
    return 282.0;
  containerStyle = self->_containerStyle;
  v7 = 0.0;
  if (containerStyle > 7)
    return v7;
  if (((1 << containerStyle) & 0x5C) == 0)
  {
    if (((1 << containerStyle) & 0xA2) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_containerViewController);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
      objc_msgSend(v15, "bounds");
      v7 = v16;

    }
    return v7;
  }
  v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;

  if (v12 <= 825.0)
  {
    if (v12 < 700.0)
      v13 = &MapsConfig_iPadCardWidthOverrideMinBucket;
    else
      v13 = &MapsConfig_iPadCardWidthOverrideMiddleBucket;
  }
  else
  {
    v13 = &MapsConfig_iPadCardWidthOverrideMaxBucket;
  }
  return GEOConfigGetDouble(*v13, v13[1]);
}

- (unint64_t)layoutStyleForCurrentTraitsCollection
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  id v6;
  unint64_t v7;
  _BOOL4 allowOnlyStandardStyle;
  id v9;
  void *v10;
  id v11;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));

  v6 = objc_loadWeakRetained((id *)p_containerViewController);
  LOBYTE(WeakRetained) = objc_msgSend(v6, "fullscreenMode");

  if ((WeakRetained & 1) == 0)
  {
    allowOnlyStandardStyle = self->_allowOnlyStandardStyle;
    v9 = v5;
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "userInterfaceIdiom") == (id)5)
      {
        v7 = 6;
LABEL_25:

        goto LABEL_26;
      }
      v11 = objc_msgSend(v10, "horizontalSizeClass");
      if (allowOnlyStandardStyle)
      {
        if (v11 == (id)2
          || objc_msgSend(v10, "horizontalSizeClass") == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
        {
          v7 = 2;
        }
        else if (objc_msgSend(v10, "userInterfaceIdiom") == (id)5)
        {
          v7 = 2;
        }
        else
        {
          v7 = 1;
        }
        goto LABEL_25;
      }
      if (v11 == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)2)
      {
        v7 = 1;
        goto LABEL_25;
      }
      if (objc_msgSend(v10, "horizontalSizeClass") == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1
        || objc_msgSend(v10, "horizontalSizeClass") == (id)2 && objc_msgSend(v10, "verticalSizeClass") == (id)1
        || objc_msgSend(v10, "horizontalSizeClass") == (id)2 && objc_msgSend(v10, "verticalSizeClass") == (id)2)
      {
        v7 = 4;
        goto LABEL_25;
      }
    }
    v7 = 0;
    goto LABEL_25;
  }
  v7 = 7;
LABEL_26:

  return v7;
}

- (void)updateLayoutStyle
{
  unint64_t v3;
  id WeakRetained;
  unint64_t containerStyle;
  _BOOL4 stackOnOppositeSide;
  double v7;
  double v8;
  uint64_t v9;

  v3 = -[ContainerStyleManager layoutStyleForCurrentTraitsCollection](self, "layoutStyleForCurrentTraitsCollection");
  if (self->_containerStyle == v3)
  {
    if (v3 != 7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(WeakRetained, "topEdgePadding");
      -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:");

      containerStyle = self->_containerStyle;
      if (containerStyle - 2 >= 3)
      {
        if (containerStyle == 6)
        {
          stackOnOppositeSide = self->_stackOnOppositeSide;
          -[ContainerStyleManager leadingMargin](self, "leadingMargin");
          v8 = -v7;
          v9 = 24;
          if (stackOnOppositeSide)
            v7 = -v7;
          else
            v9 = 16;
          objc_msgSend(*(id *)((char *)&self->super.isa + v9), "setConstant:", v7, v8);
          -[ContainerStyleManager containerWidth](self, "containerWidth");
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          -[ContainerStyleManager setBottomConstraint](self, "setBottomConstraint");
        }
      }
      else
      {
        -[ContainerStyleManager leadingMargin](self, "leadingMargin");
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
        -[ContainerStyleManager containerWidth](self, "containerWidth");
        -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
      }
    }
  }
  else
  {
    -[ContainerStyleManager setContainerStyle:](self, "setContainerStyle:", v3);
  }
}

- (void)setContainerStyle:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  unint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewIfLoaded"));

  if (v6 && self->_containerStyle != a3)
  {
    v7 = sub_100431B2C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ContainerStyleManager configureStyleLayout %lu ", buf, 0xCu);
    }

    self->_containerStyle = a3;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002BD678;
    v9[3] = &unk_1011AD518;
    v9[4] = self;
    v9[5] = a3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
  }
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (BOOL)allowOnlyStandardStyle
{
  return self->_allowOnlyStandardStyle;
}

- (void)setAllowOnlyStandardStyle:(BOOL)a3
{
  self->_allowOnlyStandardStyle = a3;
}

- (BOOL)stackOnOppositeSide
{
  return self->_stackOnOppositeSide;
}

- (void)setStackOnOppositeSide:(BOOL)a3
{
  self->_stackOnOppositeSide = a3;
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_bottomContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_leadingContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_widthContainerViewConstraint, 0);
}

@end
