@implementation OBSetupAssistantDynamicLayoutController

- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  return -[OBSetupAssistantDynamicLayoutController initWithTitle:detailText:icon:contentLayout:](self, "initWithTitle:detailText:icon:contentLayout:", a3, a4, a5, 2);
}

- (OBSetupAssistantDynamicLayoutController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  OBSetupAssistantDynamicLayoutController *v14;
  OBWelcomeController *v15;
  OBWelcomeController *backingController;
  id v17;
  uint64_t v18;
  UIView *outerContentView;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  v14 = -[OBSetupAssistantDynamicLayoutController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    v15 = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:]([OBWelcomeController alloc], "initWithTitle:detailText:icon:contentLayout:", v11, v12, v13, a6);
    backingController = v14->_backingController;
    v14->_backingController = v15;

    objc_storeStrong((id *)&v14->_localImage, a5);
    objc_storeStrong((id *)&v14->_localTitle, a3);
    objc_storeStrong((id *)&v14->_localDetailText, a4);
    v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    outerContentView = v14->_outerContentView;
    v14->_outerContentView = (UIView *)v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14->_outerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  -[OBSetupAssistantDynamicLayoutController viewDidLoad](&v18, sel_viewDidLoad);
  -[OBSetupAssistantDynamicLayoutController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[OBSetupAssistantDynamicLayoutController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBSetupAssistantDynamicLayoutController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantDynamicLayoutController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ob_pinToEdges:", v10);

  -[OBSetupAssistantDynamicLayoutController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bleedView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bleedView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeFromSuperview");

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTemplateType:", 2);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[OBSetupAssistantDynamicLayoutController _updateScrollUnderLayout](self, "_updateScrollUnderLayout");
  -[OBSetupAssistantDynamicLayoutController _relayoutContentSubviewIfNeeded](self, "_relayoutContentSubviewIfNeeded");
  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantDynamicLayoutController;
  -[OBSetupAssistantDynamicLayoutController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
}

- (id)headerView
{
  void *v2;
  void *v3;

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentView
{
  void *v2;
  void *v3;

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)contentViewLayout
{
  void *v2;
  int64_t v3;

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentViewLayout");

  return v3;
}

- (id)buttonTray
{
  void *v2;
  void *v3;

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addContentSubView:(id)a3 heightConstraintForLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBSetupAssistantDynamicLayoutController setMainContentSubview:](self, "setMainContentSubview:", v7);
  -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[OBSetupAssistantDynamicLayoutController setConstraintForLayoutFactory:](self, "setConstraintForLayoutFactory:", v6);
  -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ob_pinToEdges:", v9);

  -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)setEnableStickyHeader:(BOOL)a3
{
  self->_enableStickyHeader = a3;
  -[OBSetupAssistantDynamicLayoutController _updateScrollUnderLayout](self, "_updateScrollUnderLayout");
}

- (void)resetLayoutTo:(int64_t)a3
{
  OBWelcomeController *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OBWelcomeController *v26;

  if (-[OBSetupAssistantDynamicLayoutController contentViewLayout](self, "contentViewLayout") != a3)
  {
    v5 = [OBWelcomeController alloc];
    -[OBSetupAssistantDynamicLayoutController localTitle](self, "localTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController localDetailText](self, "localDetailText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController localImage](self, "localImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](v5, "initWithTitle:detailText:icon:contentLayout:", v6, v7, v8, a3);

    -[OBWelcomeController view](v26, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBWelcomeController contentView](v26, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", 0);

    -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTemplateType:", 2);

    -[OBSetupAssistantDynamicLayoutController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController view](v26, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSubview:belowSubview:", v13, v15);

    -[OBWelcomeController view](v26, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ob_pinToEdges:", v17);

    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeFromSuperview");

    -[OBWelcomeController contentView](v26, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](v26, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ob_pinToEdges:", v22);

    -[OBSetupAssistantDynamicLayoutController _updateScrollUnderLayout](self, "_updateScrollUnderLayout");
    -[OBSetupAssistantDynamicLayoutController backingController](self, "backingController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeFromSuperview");

    -[OBSetupAssistantDynamicLayoutController setBackingController:](self, "setBackingController:", v26);
    -[OBSetupAssistantDynamicLayoutController _relayoutContentSubviewIfNeeded](self, "_relayoutContentSubviewIfNeeded");
    -[OBSetupAssistantDynamicLayoutController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeedsLayout");

  }
}

- (void)_updateScrollUnderLayout
{
  double v3;
  int64_t v4;
  _BOOL4 v5;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  if (v3 >= 1.0)
  {
    v4 = -[OBSetupAssistantDynamicLayoutController contentViewLayout](self, "contentViewLayout");

    if (v4 == 1)
    {
      v5 = -[OBSetupAssistantDynamicLayoutController enableStickyHeader](self, "enableStickyHeader");
      -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (v7 != v8)
        {
          v35 = (void *)MEMORY[0x1E0CB3718];
          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v45 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "topAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController view](self, "view");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "topAnchor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintEqualToAnchor:", v41);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v40;
          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "leadingAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController view](self, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "leadingAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "constraintEqualToAnchor:", v36);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v47[1] = v34;
          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "trailingAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController view](self, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "trailingAnchor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "constraintEqualToAnchor:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v47[2] = v11;
          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "heightAnchor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "heightAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "constraintEqualToAnchor:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v47[3] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "activateConstraints:", v17);

          -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "subviews");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[OBSetupAssistantDynamicLayoutController setMainContentSubview:](self, "setMainContentSubview:", v21);

            -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          }
          -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeFromSuperview");

          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addSubview:", v25);

          -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBSetupAssistantDynamicLayoutController outerContentView](self, "outerContentView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "ob_pinToEdges:", v27);

        }
      }
      else if (v7 == v8)
      {
        -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeFromSuperview");

        -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addSubview:", v30);

        -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "ob_pinToEdges:", v31);

      }
    }
  }
  else
  {

  }
}

- (void)_relayoutContentSubviewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void (**v11)(id, int64_t, void *);

  if (-[OBSetupAssistantDynamicLayoutController contentViewLayout](self, "contentViewLayout") != 1)
  {
    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantDynamicLayoutController mainContentSubview](self, "mainContentSubview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ob_pinToEdges:", v7);

    -[OBSetupAssistantDynamicLayoutController constraintForLayoutFactory](self, "constraintForLayoutFactory");
    v11 = (void (**)(id, int64_t, void *))objc_claimAutoreleasedReturnValue();
    v8 = -[OBSetupAssistantDynamicLayoutController contentViewLayout](self, "contentViewLayout");
    -[OBSetupAssistantDynamicLayoutController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

  }
}

- (BOOL)enableStickyHeader
{
  return self->_enableStickyHeader;
}

- (OBWelcomeController)backingController
{
  return self->_backingController;
}

- (void)setBackingController:(id)a3
{
  objc_storeStrong((id *)&self->_backingController, a3);
}

- (id)constraintForLayoutFactory
{
  return self->_constraintForLayoutFactory;
}

- (void)setConstraintForLayoutFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (UIView)mainContentSubview
{
  return self->_mainContentSubview;
}

- (void)setMainContentSubview:(id)a3
{
  objc_storeStrong((id *)&self->_mainContentSubview, a3);
}

- (UIView)outerContentView
{
  return self->_outerContentView;
}

- (void)setOuterContentView:(id)a3
{
  objc_storeStrong((id *)&self->_outerContentView, a3);
}

- (NSString)localTitle
{
  return self->_localTitle;
}

- (void)setLocalTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSString)localDetailText
{
  return self->_localDetailText;
}

- (void)setLocalDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (UIImage)localImage
{
  return self->_localImage;
}

- (void)setLocalImage:(id)a3
{
  objc_storeStrong((id *)&self->_localImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localImage, 0);
  objc_storeStrong((id *)&self->_localDetailText, 0);
  objc_storeStrong((id *)&self->_localTitle, 0);
  objc_storeStrong((id *)&self->_outerContentView, 0);
  objc_storeStrong((id *)&self->_mainContentSubview, 0);
  objc_storeStrong(&self->_constraintForLayoutFactory, 0);
  objc_storeStrong((id *)&self->_backingController, 0);
}

@end
