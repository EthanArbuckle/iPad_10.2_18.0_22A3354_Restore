@implementation PRXFeatureTourContentView

- (PRXFeatureTourContentView)init
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = PRXCardPreferredSizeClassForContainerBounds(v4, v5, v6, v7);

  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = PRXCardPreferredSize(0, v8);
  return -[PRXFeatureTourContentView initWithFrame:](self, "initWithFrame:", v9, v10, v11, v12);
}

- (PRXFeatureTourContentView)initWithFrame:(CGRect)a3
{
  PRXFeatureTourContentView *v3;
  UILayoutGuide *v4;
  UILayoutGuide *mainContentGuide;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  double v22;
  void *v23;
  PRXFeatureTourContentView *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)PRXFeatureTourContentView;
  v3 = -[PRXFeatureTourContentView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    mainContentGuide = v3->_mainContentGuide;
    v3->_mainContentGuide = v4;

    -[PRXFeatureTourContentView addLayoutGuide:](v3, "addLayoutGuide:", v3->_mainContentGuide);
    -[PRXFeatureTourContentView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UILayoutGuide topAnchor](v3->_mainContentGuide, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    -[UILayoutGuide leadingAnchor](v3->_mainContentGuide, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v6;
    objc_msgSend(v6, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v11;
    -[UILayoutGuide trailingAnchor](v3->_mainContentGuide, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v15);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v21 = PRXCardPreferredSizeClassForContainerBounds(v17, v18, v19, v20);
    v22 = 40.0;
    if (v21 == 1)
      v22 = 20.0;
    -[PRXFeatureTourContentView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", v22, v22, v22, v22);

    -[PRXFeatureTourContentView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTourContentView setBackgroundColor:](v3, "setBackgroundColor:", v23);

    v24 = v3;
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PRXFeatureTourContentView;
  v4 = a3;
  -[PRXFeatureTourContentView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[PRXFeatureTourContentView traitCollection](self, "traitCollection", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prx_cardSizeClass");

  v7 = objc_msgSend(v4, "prx_cardSizeClass");
  if (v6 != v7)
  {
    v8 = 40.0;
    if (v6)
      v8 = 20.0;
    -[PRXFeatureTourContentView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v8, v8, v8, v8);
  }
  -[PRXFeatureTourContentView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PRXFeatureTourContentView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTourContentView setBackgroundColor:](self, "setBackgroundColor:", v12);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PRXFeatureTourContentView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PRXCardPreferredSize(0, objc_msgSend(v2, "prx_cardSizeClass"));
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  PRXTextContainer *titleView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRXTextContainer *bodyView;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *titleViewConstraints;
  PRXTextContainer *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *bodyViewConstraints;
  PRXButton *dismissButton;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  NSArray *v35;
  NSArray *dismissButtonConstraints;
  PRXTextContainer *v37;
  PRXTextContainer *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSArray *v43;
  NSArray *mainContentGuideConstraints;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)PRXFeatureTourContentView;
  -[PRXFeatureTourContentView updateConstraints](&v51, sel_updateConstraints);
  -[PRXFeatureTourContentView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  titleView = self->_titleView;
  if (titleView && !self->_titleViewConstraints)
  {
    -[PRXTextContainer leadingAnchor](titleView, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v5;
    objc_msgSend(v5, "constraintEqualToAnchor:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v6;
    -[PRXTextContainer trailingAnchor](self->_titleView, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v9;
    bodyView = self->_bodyView;
    v50 = v3;
    if (bodyView)
    {
      -[PRXTextContainer topAnchor](bodyView, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXTextContainer bottomAnchor](self->_titleView, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 4.0);
    }
    else
    {
      -[PRXTextContainer bottomAnchor](self->_titleView, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 3);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = v14;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_titleViewConstraints);
    v3 = v50;
  }
  v16 = self->_bodyView;
  if (v16 && !self->_bodyViewConstraints)
  {
    -[PRXTextContainer leadingAnchor](v16, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v45;
    -[PRXTextContainer trailingAnchor](self->_bodyView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v19;
    -[PRXTextContainer bottomAnchor](self->_bodyView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v21 = v3;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bodyViewConstraints = self->_bodyViewConstraints;
    self->_bodyViewConstraints = v24;

    v3 = v21;
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_bodyViewConstraints);
  }
  dismissButton = self->_dismissButton;
  if (dismissButton && !self->_dismissButtonConstraints)
  {
    -[PRXButton centerXAnchor](dismissButton, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTourContentView trailingAnchor](self, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (PRXIsEdgeToEdgePhone())
      v29 = 32.0;
    else
      v29 = 24.0;
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v30;
    -[PRXButton centerYAnchor](self->_dismissButton, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXFeatureTourContentView topAnchor](self, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (PRXIsEdgeToEdgePhone())
      v33 = 32.0;
    else
      v33 = 24.0;
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dismissButtonConstraints = self->_dismissButtonConstraints;
    self->_dismissButtonConstraints = v35;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_dismissButtonConstraints);
  }
  if (self->_mainContentGuide && !self->_mainContentGuideConstraints)
  {
    v37 = self->_titleView;
    if (v37)
    {
      v38 = v37;
    }
    else
    {
      v38 = self->_bodyView;
      if (!v38)
      {
        -[UILayoutGuide bottomAnchor](self->_mainContentGuide, "bottomAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bottomAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "constraintEqualToAnchor:", v40);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    -[PRXTextContainer topAnchor](v38, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_mainContentGuide, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 20.0);
    v41 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v42 = (void *)v41;

    v52 = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
    v43 = (NSArray *)objc_claimAutoreleasedReturnValue();

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = v43;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_mainContentGuideConstraints);
  }

}

- (void)setTitleView:(id)a3
{
  PRXTextContainer *v5;
  PRXTextContainer **p_titleView;
  PRXTextContainer *titleView;
  NSArray *titleViewConstraints;
  NSArray *mainContentGuideConstraints;
  PRXTextContainer *v10;

  v5 = (PRXTextContainer *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  if (titleView != v5)
  {
    v10 = v5;
    -[PRXTextContainer removeFromSuperview](titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    -[PRXTextContainer setTranslatesAutoresizingMaskIntoConstraints:](*p_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXFeatureTourContentView addSubview:](self, "addSubview:", *p_titleView);
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = 0;

    -[PRXFeatureTourContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v10;
  }

}

- (void)setBodyView:(id)a3
{
  PRXTextContainer *v5;
  PRXTextContainer **p_bodyView;
  PRXTextContainer *bodyView;
  NSArray *bodyViewConstraints;
  NSArray *mainContentGuideConstraints;
  PRXTextContainer *v10;

  v5 = (PRXTextContainer *)a3;
  p_bodyView = &self->_bodyView;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    v10 = v5;
    -[PRXTextContainer removeFromSuperview](bodyView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bodyView, a3);
    -[PRXTextContainer setTranslatesAutoresizingMaskIntoConstraints:](*p_bodyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXFeatureTourContentView addSubview:](self, "addSubview:", *p_bodyView);
    bodyViewConstraints = self->_bodyViewConstraints;
    self->_bodyViewConstraints = 0;

    mainContentGuideConstraints = self->_mainContentGuideConstraints;
    self->_mainContentGuideConstraints = 0;

    -[PRXFeatureTourContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v10;
  }

}

- (void)setDismissButton:(id)a3
{
  PRXButton *v5;
  PRXButton **p_dismissButton;
  PRXButton *dismissButton;
  NSArray *dismissButtonConstraints;
  PRXButton *v9;

  v5 = (PRXButton *)a3;
  p_dismissButton = &self->_dismissButton;
  dismissButton = self->_dismissButton;
  if (dismissButton != v5)
  {
    v9 = v5;
    -[PRXButton removeFromSuperview](dismissButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_dismissButton, a3);
    -[PRXButton setTranslatesAutoresizingMaskIntoConstraints:](*p_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXFeatureTourContentView addSubview:](self, "addSubview:", *p_dismissButton);
    dismissButtonConstraints = self->_dismissButtonConstraints;
    self->_dismissButtonConstraints = 0;

    -[PRXFeatureTourContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v9;
  }

}

- (PRXTextContainer)titleView
{
  return self->_titleView;
}

- (PRXTextContainer)bodyView
{
  return self->_bodyView;
}

- (PRXButton)dismissButton
{
  return self->_dismissButton;
}

- (UILayoutGuide)mainContentGuide
{
  return self->_mainContentGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainContentGuide, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_mainContentGuideConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButtonConstraints, 0);
  objc_storeStrong((id *)&self->_bodyViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
}

@end
