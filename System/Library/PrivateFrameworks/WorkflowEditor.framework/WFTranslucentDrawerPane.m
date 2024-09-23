@implementation WFTranslucentDrawerPane

- (WFTranslucentDrawerPane)initWithViewController:(id)a3
{
  id v5;
  WFTranslucentDrawerPane *v6;
  WFTranslucentDrawerPane *v7;
  WFTranslucentDrawerPane *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFTranslucentDrawerPane;
  v6 = -[WFTranslucentDrawerPane init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_translucent = 1;
    v6->_roundsTopCorners = 1;
    v6->_candidateForContentCapture = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  WFDrawerGrabberView *v53;
  void *v54;
  void *v55;
  UIView *v56;
  double v57;
  double v58;
  UIView *contentView;
  void *v60;
  void *v61;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)WFTranslucentDrawerPane;
  -[WFTranslucentDrawerPane loadView](&v62, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[WFTranslucentDrawerPane view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.0599999987);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", v6);

  objc_msgSend(v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, -2.0);

  objc_msgSend(v3, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowRadius:", 5.0);

  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1.0;
  objc_msgSend(v10, "setShadowOpacity:", v11);

  objc_msgSend(v3, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaskedCorners:", 3);

  -[WFTranslucentDrawerPane topCornerRadius](self, "topCornerRadius");
  -[WFTranslucentDrawerPane topCornerRadius](self, "topCornerRadius");
  v13 = (void *)MEMORY[0x24BEBD420];
  -[WFTranslucentDrawerPane shadowView](self, "shadowView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v13, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v15, "CGPath");
  -[WFTranslucentDrawerPane shadowView](self, "shadowView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShadowPath:", v16);

  -[WFTranslucentDrawerPane topCornerRadius](self, "topCornerRadius");
  v20 = v19;
  -[WFTranslucentDrawerPane shadowView](self, "shadowView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v20);

  -[WFTranslucentDrawerPane view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v3);

  objc_storeWeak((id *)&self->_shadowView, v3);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  v26 = 1.0 / v25;

  v27 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[WFTranslucentDrawerPane view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v29 + v26 * 2.0;
  -[WFTranslucentDrawerPane view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  objc_msgSend(v27, "setFrame:", -v26, -v26, v30, v32 + v26 * 2.0);

  objc_msgSend(v27, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.075);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34 = objc_msgSend(v33, "CGColor");
  objc_msgSend(v27, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBorderColor:", v34);

  objc_msgSend(v27, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBorderWidth:", v26);

  -[WFTranslucentDrawerPane topCornerRadius](self, "topCornerRadius");
  v38 = v37 + 0.5;
  objc_msgSend(v27, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCornerRadius:", v38);

  v40 = *MEMORY[0x24BDE58E8];
  objc_msgSend(v27, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setCornerCurve:", v40);

  objc_msgSend(v3, "addSubview:", v27);
  objc_storeWeak((id *)&self->_borderView, v27);
  v42 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[WFTranslucentDrawerPane view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  v45 = v44;
  -[WFTranslucentDrawerPane view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  objc_msgSend(v42, "setFrame:", 0.0, 0.0, v45, v47 + 175.0);

  objc_msgSend(v42, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_actionDrawerBackgroundColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBackgroundColor:", v48);

  -[WFTranslucentDrawerPane topCornerRadius](self, "topCornerRadius");
  v50 = v49;
  objc_msgSend(v42, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setCornerRadius:", v50);

  objc_msgSend(v42, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCornerCurve:", v40);

  objc_msgSend(v3, "addSubview:", v42);
  objc_storeWeak((id *)&self->_backgroundView, v42);
  v53 = objc_alloc_init(WFDrawerGrabberView);
  -[WFDrawerGrabberView setLayoutMargins:](v53, "setLayoutMargins:", 6.0, 0.0, 6.0, 0.0);
  -[WFTranslucentDrawerPane wf_drawerController](self, "wf_drawerController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerGrabberView setDrawerController:](v53, "setDrawerController:", v54);

  -[WFTranslucentDrawerPane view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bounds");
  -[WFDrawerGrabberView setFrame:](v53, "setFrame:", 0.0, 0.0);

  -[WFDrawerGrabberView setAutoresizingMask:](v53, "setAutoresizingMask:", 2);
  objc_msgSend(v42, "addSubview:", v53);
  objc_storeWeak((id *)&self->_grabberView, v53);
  v56 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v42, "bounds");
  v58 = v57;
  objc_msgSend(v42, "bounds");
  -[UIView setFrame:](v56, "setFrame:", 0.0, 0.0, v58);
  -[UIView setAutoresizingMask:](v56, "setAutoresizingMask:", 18);
  objc_msgSend(v42, "addSubview:", v56);
  contentView = self->_contentView;
  self->_contentView = v56;

  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTranslucentDrawerPane installChildViewController:](self, "installChildViewController:", v60);

  -[WFTranslucentDrawerPane updateHeaderView](self, "updateHeaderView");
  -[WFTranslucentDrawerPane view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layoutIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTranslucentDrawerPane;
  -[WFTranslucentDrawerPane viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFTranslucentDrawerPane setCandidateForContentCapture:](self, "setCandidateForContentCapture:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTranslucentDrawerPane;
  -[WFTranslucentDrawerPane viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[WFTranslucentDrawerPane setCandidateForContentCapture:](self, "setCandidateForContentCapture:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTranslucentDrawerPane;
  -[WFTranslucentDrawerPane viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[WFTranslucentDrawerPane grabberView](self, "grabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutMargins:", v5, 0.0, 0.0, 0.0);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTranslucentDrawerPane;
  -[WFTranslucentDrawerPane traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[WFTranslucentDrawerPane traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle") == 2;

  WeakRetained = objc_loadWeakRetained((id *)&self->_borderView);
  objc_msgSend(WeakRetained, "setHidden:", v5);

}

- (CGRect)grabberAreaBounds
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double MaxY;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[WFTranslucentDrawerPane view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[WFTranslucentDrawerPane grabberView](self, "grabberView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v14);

  -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = CGRectGetMaxY(v15);

  if (MaxY < v9)
    MaxY = v9;

  v10 = 0.0;
  v11 = 0.0;
  v12 = v5;
  v13 = MaxY;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)topCornerRadius
{
  _BOOL4 v2;
  double result;

  v2 = -[WFTranslucentDrawerPane roundsTopCorners](self, "roundsTopCorners");
  result = *MEMORY[0x24BEBEB78];
  if (!v2)
    return 0.0;
  return result;
}

- (void)updateHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFDrawerPaneSearchHeaderView *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFDrawerPaneCustomTitleHeaderView *v13;
  void *v14;
  uint64_t v15;
  WFDrawerPaneTitleHeaderView *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UIAccessibilityNotifications v40;
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
  _QWORD v51[5];

  v51[4] = *MEMORY[0x24BDAC8D0];
  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTranslucentDrawerPane contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
    return;
  -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[WFTranslucentDrawerPane searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [WFDrawerPaneSearchHeaderView alloc];
    -[WFTranslucentDrawerPane searchBar](self, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFDrawerPaneSearchHeaderView initWithSearchBar:](v9, "initWithSearchBar:", v10);
  }
  else
  {
    -[WFTranslucentDrawerPane titleView](self, "titleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [WFDrawerPaneCustomTitleHeaderView alloc];
      -[WFTranslucentDrawerPane titleView](self, "titleView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[WFDrawerPaneCustomTitleHeaderView initWithTitleView:](v13, "initWithTitleView:", v10);
    }
    else
    {
      -[WFTranslucentDrawerPane title](self, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (!v15)
      {
        v17 = 0;
        goto LABEL_9;
      }
      v16 = [WFDrawerPaneTitleHeaderView alloc];
      -[WFTranslucentDrawerPane title](self, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[WFDrawerPaneTitleHeaderView initWithTitle:](v16, "initWithTitle:", v10);
    }
  }
  v17 = (void *)v11;

LABEL_9:
  -[WFTranslucentDrawerPane contentViewTopConstraint](self, "contentViewTopConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 0);

  if (v17)
  {
    objc_msgSend(v17, "setDelegate:", self);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFTranslucentDrawerPane backgroundView](self, "backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v17);

    -[WFTranslucentDrawerPane setActiveHeaderView:](self, "setActiveHeaderView:", v17);
    -[WFTranslucentDrawerPane contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane setContentViewTopConstraint:](self, "setContentViewTopConstraint:", v23);

    v43 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v17, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane backgroundView](self, "backgroundView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v47;
    objc_msgSend(v17, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane backgroundView](self, "backgroundView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "safeAreaLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v24;
    objc_msgSend(v17, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane backgroundView](self, "backgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v29;
    -[WFTranslucentDrawerPane contentViewTopConstraint](self, "contentViewTopConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v31);

  }
  else
  {
    -[WFTranslucentDrawerPane contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane backgroundView](self, "backgroundView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane setContentViewTopConstraint:](self, "setContentViewTopConstraint:", v36);

    -[WFTranslucentDrawerPane contentViewTopConstraint](self, "contentViewTopConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

  }
  -[WFTranslucentDrawerPane container](self, "container");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutDrawerViewController");

  -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = *MEMORY[0x24BEBDE88];
    -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v40, v41);

  }
}

- (id)wf_drawerItem
{
  void *v2;
  void *v3;

  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_drawerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)wf_setDrawerItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_setDrawerItem:", v4);

}

- (id)wf_drawerController
{
  void *v2;
  void *v3;

  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)wf_setDrawerController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_setDrawerController:", v4);

}

- (void)installChildViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  -[WFTranslucentDrawerPane viewController](self, "viewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFTranslucentDrawerPane viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[WFTranslucentDrawerPane viewController](self, "viewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "willMoveToParentViewController:", 0);

      -[WFTranslucentDrawerPane viewController](self, "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[WFTranslucentDrawerPane viewController](self, "viewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromParentViewController");

    }
  }
  -[WFTranslucentDrawerPane contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v27, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  objc_msgSend(v27, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAutoresizingMask:", 18);

  -[WFTranslucentDrawerPane addChildViewController:](self, "addChildViewController:", v27);
  -[WFTranslucentDrawerPane contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  objc_msgSend(v27, "didMoveToParentViewController:", self);
}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_title;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[WFTranslucentDrawerPane updateHeaderView](self, "updateHeaderView");
  }
LABEL_9:

}

- (void)setSearchBar:(id)a3
{
  UISearchBar *v5;
  UISearchBar *v6;

  v5 = (UISearchBar *)a3;
  if (self->_searchBar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchBar, a3);
    -[WFTranslucentDrawerPane updateHeaderView](self, "updateHeaderView");
    v5 = v6;
  }

}

- (void)setTitleView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_titleView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleView, a3);
    -[WFTranslucentDrawerPane updateHeaderView](self, "updateHeaderView");
    v5 = v6;
  }

}

- (void)setFauxHeaderHeight:(double)a3
{
  if (self->_fauxHeaderHeight != a3)
  {
    self->_fauxHeaderHeight = a3;
    -[WFTranslucentDrawerPane updateHeaderView](self, "updateHeaderView");
  }
}

- (void)willTransitionToVisibility:(unint64_t)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  if (a3 != 3)
  {
    -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchBar");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "resignFirstResponder");
      objc_msgSend(v7, "setShowsCancelButton:animated:", 0, 1);

    }
  }
}

- (void)didDismissHeaderView:(id)a3
{
  id v3;

  -[WFTranslucentDrawerPane wf_drawerController](self, "wf_drawerController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  char isKindOfClass;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIAccessibilityNotifications v12;
  void *v13;

  -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WFTranslucentDrawerPane activeHeaderView](self, "activeHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTranslucentDrawerPane didDismissHeaderView:](self, "didDismissHeaderView:", v5);

    UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], 0);
    return 1;
  }
  else
  {
    -[WFTranslucentDrawerPane wf_drawerController](self, "wf_drawerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "visibility");

    if (v8 == 2)
    {
      -[WFTranslucentDrawerPane wf_drawerController](self, "wf_drawerController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v6 = 1;
      v11 = 1;
    }
    else
    {
      if (v8 != 3)
        return 0;
      -[WFTranslucentDrawerPane wf_drawerController](self, "wf_drawerController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v6 = 1;
      v11 = 2;
    }
    objc_msgSend(v9, "transitionToVisibility:withDimming:animated:", v11, 3, 1);

    v12 = *MEMORY[0x24BEBDE88];
    -[WFTranslucentDrawerPane grabberView](self, "grabberView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v12, v13);

  }
  return v6;
}

- (WFDrawerPaneContainer)container
{
  return (WFDrawerPaneContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (void)setBottomContentInset:(double)a3
{
  self->_bottomContentInset = a3;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (WFDrawerPaneHeaderView)activeHeaderView
{
  return (WFDrawerPaneHeaderView *)objc_loadWeakRetained((id *)&self->_activeHeaderView);
}

- (void)setActiveHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_activeHeaderView, a3);
}

- (double)fauxHeaderHeight
{
  return self->_fauxHeaderHeight;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
}

- (BOOL)roundsTopCorners
{
  return self->_roundsTopCorners;
}

- (void)setRoundsTopCorners:(BOOL)a3
{
  self->_roundsTopCorners = a3;
}

- (NSString)drawerGroup
{
  return self->_drawerGroup;
}

- (void)setDrawerGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (UIView)shadowView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_shadowView);
}

- (void)setShadowView:(id)a3
{
  objc_storeWeak((id *)&self->_shadowView, a3);
}

- (UIView)borderView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_borderView);
}

- (void)setBorderView:(id)a3
{
  objc_storeWeak((id *)&self->_borderView, a3);
}

- (WFDrawerGrabberView)grabberView
{
  return (WFDrawerGrabberView *)objc_loadWeakRetained((id *)&self->_grabberView);
}

- (void)setGrabberView:(id)a3
{
  objc_storeWeak((id *)&self->_grabberView, a3);
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (BOOL)isCandidateForContentCapture
{
  return self->_candidateForContentCapture;
}

- (void)setCandidateForContentCapture:(BOOL)a3
{
  self->_candidateForContentCapture = a3;
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_destroyWeak((id *)&self->_grabberView);
  objc_destroyWeak((id *)&self->_borderView);
  objc_destroyWeak((id *)&self->_shadowView);
  objc_storeStrong((id *)&self->_drawerGroup, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_activeHeaderView);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
