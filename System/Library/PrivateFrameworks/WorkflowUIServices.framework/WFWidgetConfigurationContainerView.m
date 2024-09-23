@implementation WFWidgetConfigurationContainerView

- (WFWidgetConfigurationContainerView)initWithCardView:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  double width;
  id v9;
  WFWidgetConfigurationContainerView *v10;
  WFWidgetConfigurationContainerView *v11;
  void *v12;
  void *v13;
  void *v14;
  WFWidgetConfigurationContainerView *v15;
  void *v17;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWidgetConfigurationContainerView.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cardView"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFWidgetConfigurationContainerView;
  v10 = -[WFWidgetConfigurationContainerView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cardView, a3);
    -[WFWidgetConfigurationCardView setTranslatesAutoresizingMaskIntoConstraints:](v11->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFWidgetConfigurationContainerView addSubview:](v11, "addSubview:", v9);
    -[WFWidgetConfigurationContainerView setupDefaultConstraintsWithPreferredSize:](v11, "setupDefaultConstraintsWithPreferredSize:", width, height);
    -[WFWidgetConfigurationContainerView setupConfiguredCardFrameConstraints](v11, "setupConfiguredCardFrameConstraints");
    -[WFWidgetConfigurationContainerView setupConfiguredSheetFrameConstraints](v11, "setupConfiguredSheetFrameConstraints");
    v12 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationContainerView defaultCardLayoutConstraints](v11, "defaultCardLayoutConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v13);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel_keyboardWillChangeFrame_, *MEMORY[0x24BEBE578], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel_keyboardWillChangeFrame_, *MEMORY[0x24BEBE570], 0);
    v15 = v11;

  }
  return v11;
}

- (void)setupDefaultConstraintsWithPreferredSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *preferredCardWidthLayoutConstraint;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *preferredCardHeightLayoutConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSArray *v22;
  NSArray *defaultCardLayoutConstraints;
  void *v24;
  double v25;
  double v26;
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
  void *v40;
  void *v41;
  _QWORD v42[10];

  height = a3.height;
  width = a3.width;
  v42[8] = *MEMORY[0x24BDAC8D0];
  -[WFWidgetConfigurationCardView widthAnchor](self->_cardView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", width);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  preferredCardWidthLayoutConstraint = self->_preferredCardWidthLayoutConstraint;
  self->_preferredCardWidthLayoutConstraint = v7;

  -[WFWidgetConfigurationCardView heightAnchor](self->_cardView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", height);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  preferredCardHeightLayoutConstraint = self->_preferredCardHeightLayoutConstraint;
  self->_preferredCardHeightLayoutConstraint = v10;

  -[WFWidgetConfigurationCardView centerXAnchor](self->_cardView, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView readableContentGuide](self, "readableContentGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  -[WFWidgetConfigurationCardView centerYAnchor](self->_cardView, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView readableContentGuide](self, "readableContentGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v34;
  -[WFWidgetConfigurationCardView leadingAnchor](self->_cardView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v30;
  -[WFWidgetConfigurationCardView trailingAnchor](self->_cardView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v12;
  -[WFWidgetConfigurationCardView topAnchor](self->_cardView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v16;
  -[WFWidgetConfigurationCardView bottomAnchor](self->_cardView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_preferredCardWidthLayoutConstraint;
  v42[5] = v20;
  v42[6] = v21;
  v42[7] = self->_preferredCardHeightLayoutConstraint;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 8);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultCardLayoutConstraints = self->_defaultCardLayoutConstraints;
  self->_defaultCardLayoutConstraints = v22;

  -[WFWidgetConfigurationContainerView defaultCardLayoutConstraints](self, "defaultCardLayoutConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", &__block_literal_global);

  LODWORD(v25) = 1148010496;
  -[NSLayoutConstraint setPriority:](self->_preferredCardWidthLayoutConstraint, "setPriority:", v25);
  LODWORD(v26) = 1148010496;
  -[NSLayoutConstraint setPriority:](self->_preferredCardHeightLayoutConstraint, "setPriority:", v26);
}

- (void)setupConfiguredCardFrameConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *configuratedCardOriginXConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *configuratedCardOriginYConstraint;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *configuratedCardWidthConstraint;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *configuratedCardHeightConstraint;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *v28;
  NSArray *v29;
  NSArray *configuredCardLayoutConstraints;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  -[WFWidgetConfigurationCardView leftAnchor](self->_cardView, "leftAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView leftAnchor](self, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 0.0);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuratedCardOriginXConstraint = self->_configuratedCardOriginXConstraint;
  self->_configuratedCardOriginXConstraint = v5;

  -[WFWidgetConfigurationCardView topAnchor](self->_cardView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuratedCardOriginYConstraint = self->_configuratedCardOriginYConstraint;
  self->_configuratedCardOriginYConstraint = v9;

  -[WFWidgetConfigurationCardView widthAnchor](self->_cardView, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 0.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuratedCardWidthConstraint = self->_configuratedCardWidthConstraint;
  self->_configuratedCardWidthConstraint = v12;

  -[WFWidgetConfigurationCardView heightAnchor](self->_cardView, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuratedCardHeightConstraint = self->_configuratedCardHeightConstraint;
  self->_configuratedCardHeightConstraint = v15;

  -[WFWidgetConfigurationCardView bottomAnchor](self->_cardView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView keyboardLayoutGuide](self, "keyboardLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:constant:", v19, -24.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = 1148813312;
  objc_msgSend(v20, "setPriority:", v21);
  LODWORD(v22) = 1148682240;
  -[NSLayoutConstraint setPriority:](self->_configuratedCardOriginXConstraint, "setPriority:", v22);
  LODWORD(v23) = 1148682240;
  -[NSLayoutConstraint setPriority:](self->_configuratedCardOriginYConstraint, "setPriority:", v23);
  LODWORD(v24) = 1148764160;
  -[NSLayoutConstraint setPriority:](self->_configuratedCardWidthConstraint, "setPriority:", v24);
  LODWORD(v25) = 1148764160;
  -[NSLayoutConstraint setPriority:](self->_configuratedCardHeightConstraint, "setPriority:", v25);
  v26 = self->_configuratedCardOriginYConstraint;
  v27 = self->_configuratedCardWidthConstraint;
  v28 = self->_configuratedCardHeightConstraint;
  v31[0] = self->_configuratedCardOriginXConstraint;
  v31[1] = v26;
  v31[2] = v27;
  v31[3] = v28;
  v31[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  configuredCardLayoutConstraints = self->_configuredCardLayoutConstraints;
  self->_configuredCardLayoutConstraints = v29;

}

- (void)setupConfiguredSheetFrameConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *configuredSheetOriginXConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *configuredSheetOriginYConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *configuredSheetWidthConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *configuredSheetHeightConstraint;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  NSArray *v21;
  NSArray *configuredSheetLayoutConstraints;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[WFWidgetConfigurationCardView leftAnchor](self->_cardView, "leftAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView leftAnchor](self, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuredSheetOriginXConstraint = self->_configuredSheetOriginXConstraint;
  self->_configuredSheetOriginXConstraint = v5;

  -[WFWidgetConfigurationCardView topAnchor](self->_cardView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuredSheetOriginYConstraint = self->_configuredSheetOriginYConstraint;
  self->_configuredSheetOriginYConstraint = v9;

  -[WFWidgetConfigurationCardView widthAnchor](self->_cardView, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView widthAnchor](self, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuredSheetWidthConstraint = self->_configuredSheetWidthConstraint;
  self->_configuredSheetWidthConstraint = v13;

  -[WFWidgetConfigurationCardView heightAnchor](self->_cardView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView heightAnchor](self, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  configuredSheetHeightConstraint = self->_configuredSheetHeightConstraint;
  self->_configuredSheetHeightConstraint = v17;

  v19 = self->_configuredSheetOriginYConstraint;
  v23[0] = self->_configuredSheetOriginXConstraint;
  v23[1] = v19;
  v20 = self->_configuredSheetHeightConstraint;
  v23[2] = self->_configuredSheetWidthConstraint;
  v23[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  configuredSheetLayoutConstraints = self->_configuredSheetLayoutConstraints;
  self->_configuredSheetLayoutConstraints = v21;

}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
  -[WFWidgetConfigurationContainerView configureConstraints](self, "configureConstraints");
}

- (CGRect)configurationCardViewFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[WFWidgetConfigurationContainerView cardView](self, "cardView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_configurationCardViewFrame = a3;
  if (!CGRectIsNull(a3))
  {
    -[WFWidgetConfigurationContainerView configuratedCardOriginXConstraint](self, "configuratedCardOriginXConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", x);

    -[WFWidgetConfigurationContainerView configuratedCardOriginYConstraint](self, "configuratedCardOriginYConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", y);

    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (CGRectIsEmpty(v19))
    {
      -[WFWidgetConfigurationContainerView preferredCardWidthLayoutConstraint](self, "preferredCardWidthLayoutConstraint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constant");
      v12 = v11;
      -[WFWidgetConfigurationContainerView configuratedCardWidthConstraint](self, "configuratedCardWidthConstraint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setConstant:", v12);

      -[WFWidgetConfigurationContainerView preferredCardHeightLayoutConstraint](self, "preferredCardHeightLayoutConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constant");
      v16 = v15;
      -[WFWidgetConfigurationContainerView configuratedCardHeightConstraint](self, "configuratedCardHeightConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConstant:", v16);

    }
    else
    {
      -[WFWidgetConfigurationContainerView configuratedCardWidthConstraint](self, "configuratedCardWidthConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", width);

      -[WFWidgetConfigurationContainerView configuratedCardHeightConstraint](self, "configuratedCardHeightConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setConstant:", height);
    }

  }
  -[WFWidgetConfigurationContainerView configureConstraints](self, "configureConstraints");
}

- (void)configureConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 IsNull;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (-[WFWidgetConfigurationContainerView widgetConfigurationStyle](self, "widgetConfigurationStyle") == 2)
  {
    v3 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationContainerView configuredCardLayoutConstraints](self, "configuredCardLayoutConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v4);

    v5 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationContainerView defaultCardLayoutConstraints](self, "defaultCardLayoutConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    v7 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationContainerView configuredSheetLayoutConstraints](self, "configuredSheetLayoutConstraints");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IsNull = CGRectIsNull(self->_configurationCardViewFrame);
    v10 = (void *)MEMORY[0x24BDD1628];
    if (IsNull)
    {
      -[WFWidgetConfigurationContainerView configuredCardLayoutConstraints](self, "configuredCardLayoutConstraints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivateConstraints:", v11);

      v12 = (void *)MEMORY[0x24BDD1628];
      -[WFWidgetConfigurationContainerView configuredSheetLayoutConstraints](self, "configuredSheetLayoutConstraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deactivateConstraints:", v13);

      v7 = (void *)MEMORY[0x24BDD1628];
      -[WFWidgetConfigurationContainerView defaultCardLayoutConstraints](self, "defaultCardLayoutConstraints");
    }
    else
    {
      -[WFWidgetConfigurationContainerView defaultCardLayoutConstraints](self, "defaultCardLayoutConstraints");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deactivateConstraints:", v14);

      v15 = (void *)MEMORY[0x24BDD1628];
      -[WFWidgetConfigurationContainerView configuredSheetLayoutConstraints](self, "configuredSheetLayoutConstraints");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deactivateConstraints:", v16);

      v7 = (void *)MEMORY[0x24BDD1628];
      -[WFWidgetConfigurationContainerView configuredCardLayoutConstraints](self, "configuredCardLayoutConstraints");
    }
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (id)v8;
  objc_msgSend(v7, "activateConstraints:");

}

- (void)requestDismissal
{
  void *v3;
  void *v4;
  id v5;

  -[WFWidgetConfigurationContainerView cardView](self, "cardView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerView cardView](self, "cardView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetConfigurationCardViewDidRequestToClose:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFWidgetConfigurationContainerView;
  v4 = a3;
  -[WFWidgetConfigurationContainerView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[WFWidgetConfigurationContainerView traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[WFWidgetConfigurationContainerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    -[WFWidgetConfigurationContainerView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetConfigurationContainerViewUserInterfaceStyleDidChange:", self);
  }

}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEBE400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEBE408]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__WFWidgetConfigurationContainerView_keyboardWillChangeFrame___block_invoke;
  v12[3] = &unk_24C5ABB88;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v7 << 16, v12, 0, v11, 0.0);
}

- (WFWidgetConfigurationContainerViewDelegate)delegate
{
  return (WFWidgetConfigurationContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (NSArray)defaultCardLayoutConstraints
{
  return self->_defaultCardLayoutConstraints;
}

- (NSLayoutConstraint)preferredCardWidthLayoutConstraint
{
  return self->_preferredCardWidthLayoutConstraint;
}

- (NSLayoutConstraint)preferredCardHeightLayoutConstraint
{
  return self->_preferredCardHeightLayoutConstraint;
}

- (NSArray)configuredCardLayoutConstraints
{
  return self->_configuredCardLayoutConstraints;
}

- (NSLayoutConstraint)configuratedCardOriginXConstraint
{
  return self->_configuratedCardOriginXConstraint;
}

- (NSLayoutConstraint)configuratedCardOriginYConstraint
{
  return self->_configuratedCardOriginYConstraint;
}

- (NSLayoutConstraint)configuratedCardWidthConstraint
{
  return self->_configuratedCardWidthConstraint;
}

- (NSLayoutConstraint)configuratedCardHeightConstraint
{
  return self->_configuratedCardHeightConstraint;
}

- (NSArray)configuredSheetLayoutConstraints
{
  return self->_configuredSheetLayoutConstraints;
}

- (NSLayoutConstraint)configuredSheetOriginXConstraint
{
  return self->_configuredSheetOriginXConstraint;
}

- (NSLayoutConstraint)configuredSheetOriginYConstraint
{
  return self->_configuredSheetOriginYConstraint;
}

- (NSLayoutConstraint)configuredSheetWidthConstraint
{
  return self->_configuredSheetWidthConstraint;
}

- (NSLayoutConstraint)configuredSheetHeightConstraint
{
  return self->_configuredSheetHeightConstraint;
}

- (WFWidgetConfigurationCardView)cardView
{
  return self->_cardView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_configuredSheetHeightConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetWidthConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetOriginYConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetOriginXConstraint, 0);
  objc_storeStrong((id *)&self->_configuredSheetLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_configuratedCardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardWidthConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardOriginYConstraint, 0);
  objc_storeStrong((id *)&self->_configuratedCardOriginXConstraint, 0);
  objc_storeStrong((id *)&self->_configuredCardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_preferredCardHeightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_preferredCardWidthLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_defaultCardLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __62__WFWidgetConfigurationContainerView_keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __79__WFWidgetConfigurationContainerView_setupDefaultConstraintsWithPreferredSize___block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 1148026880;
  return objc_msgSend(a3, "setPriority:", a1);
}

@end
