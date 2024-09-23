@implementation WFRunWorkflowToolbar

- (id)initShowingDetailsButton:(BOOL)a3
{
  _BOOL4 v3;
  WFRunWorkflowToolbar *v4;
  WFRunWorkflowToolbar *v5;
  id v6;
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
  WFRunWorkflowToolbar *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  objc_super v46;
  _QWORD v47[5];

  v3 = a3;
  v47[4] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)WFRunWorkflowToolbar;
  v4 = -[WFRunWorkflowToolbar initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_showsDetailsButton = v3;
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v3;
    v6 = objc_alloc(MEMORY[0x24BEBDA90]);
    -[WFRunWorkflowToolbar bounds](v5, "bounds");
    v7 = (void *)objc_msgSend(v6, "initWithFrame:");
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setDelegate:", v5);
    -[WFRunWorkflowToolbar addSubview:](v5, "addSubview:", v7);
    -[WFRunWorkflowToolbar setToolbar:](v5, "setToolbar:", v7);
    v37 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v7, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar topAnchor](v5, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v40;
    objc_msgSend(v7, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar leadingAnchor](v5, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v8;
    objc_msgSend(v7, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar safeAreaLayoutGuide](v5, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v12;
    v45 = v7;
    objc_msgSend(v7, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar trailingAnchor](v5, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v16);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("arrow.uturn.backward.circle"), v43);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v17, 0, v5, sel_undoTapped);
    WFLocalizedString(CFSTR("Undo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityLabel:", v19);

    objc_msgSend(v18, "setWidth:", 44.0);
    -[WFRunWorkflowToolbar setUndoItem:](v5, "setUndoItem:", v18);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("arrow.uturn.forward.circle"), v43);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v20, 0, v5, sel_redoTapped);
    WFLocalizedString(CFSTR("Redo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityLabel:", v22);

    objc_msgSend(v21, "setWidth:", 44.0);
    -[WFRunWorkflowToolbar setRedoItem:](v5, "setRedoItem:", v21);

    objc_msgSend(MEMORY[0x24BEC5158], "buttonWithType:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar runButtonPointSizeToWidthRatio](v5, "runButtonPointSizeToWidthRatio");
    objc_msgSend(v23, "setSymbolName:pointSizeToWidthRatio:", CFSTR("play.fill"));
    objc_msgSend(v23, "addTarget:action:forControlEvents:", v5, sel_playTapped, 64);
    WFLocalizedString(CFSTR("Run Shortcut"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityLabel:", v24);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v23);
    -[WFRunWorkflowToolbar setRunItem:](v5, "setRunItem:", v25);

    objc_msgSend(MEMORY[0x24BEC5158], "buttonWithType:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar runButtonPointSizeToWidthRatio](v5, "runButtonPointSizeToWidthRatio");
    objc_msgSend(v26, "setSymbolName:pointSizeToWidthRatio:", CFSTR("square.fill"));
    objc_msgSend(v26, "addTarget:action:forControlEvents:", v5, sel_stopTapped, 64);
    WFLocalizedString(CFSTR("Stop Shortcut"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityLabel:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v26);
    -[WFRunWorkflowToolbar setStopItem:](v5, "setStopItem:", v28);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("square.and.arrow.up"), v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v29, 0, v5, sel_shareTapped);
    objc_msgSend(v30, "setWidth:", 44.0);

    -[WFRunWorkflowToolbar setShareItem:](v5, "setShareItem:", v30);
    if (v44)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("info.circle"), v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v31, 0, v5, sel_settingsTapped);
      objc_msgSend(v32, "setWidth:", 44.0);

      -[WFRunWorkflowToolbar setSettingsItem:](v5, "setSettingsItem:", v32);
    }
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    -[WFRunWorkflowToolbar setFlexibleSpaceItem:](v5, "setFlexibleSpaceItem:", v33);

    -[WFRunWorkflowToolbar updateShadowImage](v5, "updateShadowImage");
    -[WFRunWorkflowToolbar updateBarButtonItems](v5, "updateBarButtonItems");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar setBackgroundColor:](v5, "setBackgroundColor:", v34);

    v35 = v5;
  }

  return v5;
}

- (double)runButtonPointSizeToWidthRatio
{
  void *v2;
  double v3;

  -[WFRunWorkflowToolbar traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
    v3 = 1.7;
  else
    v3 = 2.5;

  return v3;
}

- (void)updateRunningButtonWidthIfNeeded
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[WFRunWorkflowToolbar runButtonPointSizeToWidthRatio](self, "runButtonPointSizeToWidthRatio");
  v4 = v3;
  -[WFRunWorkflowToolbar runItem](self, "runItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSizeToWidthRatio");
  v8 = v7;

  if (v4 != v8)
  {
    -[WFRunWorkflowToolbar runItem](self, "runItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar runButtonPointSizeToWidthRatio](self, "runButtonPointSizeToWidthRatio");
    objc_msgSend(v10, "setSymbolName:pointSizeToWidthRatio:", CFSTR("play.fill"));

    -[WFRunWorkflowToolbar stopItem](self, "stopItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar runButtonPointSizeToWidthRatio](self, "runButtonPointSizeToWidthRatio");
    objc_msgSend(v11, "setSymbolName:pointSizeToWidthRatio:", CFSTR("square.fill"));

  }
}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[WFRunWorkflowToolbar toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)undoRedoItems
{
  return (NSArray *)-[WFRunWorkflowToolbar undoRedoItemsWithSpacer:](self, "undoRedoItemsWithSpacer:", 1);
}

- (NSArray)runItems
{
  return (NSArray *)-[WFRunWorkflowToolbar runItemsWithSpacer:](self, "runItemsWithSpacer:", 1);
}

- (id)undoRedoItemsWithSpacer:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[4];

  v3 = a3;
  v12[3] = *MEMORY[0x24BDAC8D0];
  -[WFRunWorkflowToolbar undoItem](self, "undoItem");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    v12[0] = v5;
    -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    -[WFRunWorkflowToolbar redoItem](self, "redoItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFRunWorkflowToolbar redoItem](self, "redoItem", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)runItemsWithSpacer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  if (-[WFRunWorkflowToolbar isLoading](self, "isLoading"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "startAnimating");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v6);

    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (-[WFRunWorkflowToolbar isRunning](self, "isRunning"))
    -[WFRunWorkflowToolbar stopItem](self, "stopItem");
  else
    -[WFRunWorkflowToolbar runItem](self, "runItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_8:
    -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
LABEL_9:
  -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[WFRunWorkflowToolbar shareItem](self, "shareItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  -[WFRunWorkflowToolbar updateShareButtonVisibility](self, "updateShareButtonVisibility");
  -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(v5, "addObject:", v7);
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFRunWorkflowToolbar;
  -[WFRunWorkflowToolbar layoutSubviews](&v11, sel_layoutSubviews);
  -[WFRunWorkflowToolbar toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shadowRadius");
  v6 = v5;

  objc_msgSend(v3, "frame");
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, v7 - v6);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGPath");
  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPath:", v9);

}

- (void)playTapped
{
  void *v3;
  char v4;
  id v5;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runToolbarPlayTapped:", self);

  }
}

- (void)stopTapped
{
  void *v3;
  char v4;
  id v5;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runToolbarStopTapped:", self);

  }
}

- (void)shareTapped
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WFRunWorkflowToolbar shareItem](self, "shareItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runToolbarShareTapped:sender:", self, v5);

  }
}

- (void)settingsTapped
{
  void *v3;
  char v4;
  id v5;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runToolbarSettingsTapped:", self);

  }
}

- (void)updateBarButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFRunWorkflowToolbar undoRedoItems](self, "undoRedoItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  -[WFRunWorkflowToolbar settingsItem](self, "settingsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[WFRunWorkflowToolbar settingsItem](self, "settingsItem");
  else
    -[WFRunWorkflowToolbar flexibleSpaceItem](self, "flexibleSpaceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[WFRunWorkflowToolbar updateRunningButtonWidthIfNeeded](self, "updateRunningButtonWidthIfNeeded");
  -[WFRunWorkflowToolbar runItemsWithSpacer:](self, "runItemsWithSpacer:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  -[WFRunWorkflowToolbar toolbar](self, "toolbar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItems:animated:", v3, 1);

  -[WFRunWorkflowToolbar updateUndoItems](self, "updateUndoItems");
  -[WFRunWorkflowToolbar updateSettingsButtonVisibility](self, "updateSettingsButtonVisibility");

}

- (void)updateShadowImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGSize v14;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = 1.0 / v4;

  v14.width = v5;
  v14.height = v5;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  -[WFRunWorkflowToolbar traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 == 2)
  {
    v8 = 0.150000006;
    v9 = 1.0;
  }
  else
  {
    v8 = 0.100000001;
    v9 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, 0.0, v5, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fill");

  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[WFRunWorkflowToolbar toolbar](self, "toolbar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowImage:forToolbarPosition:", v13, 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFRunWorkflowToolbar;
  -[WFRunWorkflowToolbar traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[WFRunWorkflowToolbar updateBarButtonItems](self, "updateBarButtonItems");
  -[WFRunWorkflowToolbar updateShadowImage](self, "updateShadowImage");
}

- (BOOL)isNotRunningAndIsEditing
{
  return !-[WFRunWorkflowToolbar isRunning](self, "isRunning") && -[WFRunWorkflowToolbar isEditing](self, "isEditing");
}

- (void)setWorkflowUndoManager:(id)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;

  obj = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD13A8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, WeakRetained);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD13B8];
  v9 = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDD13B0];
  v12 = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  objc_msgSend(v10, "removeObserver:name:object:", self, v11, v12);

  objc_storeWeak((id *)&self->_workflowUndoManager, obj);
  if (obj)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_updateUndoItems, v5, obj);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_updateUndoItems, v8, obj);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_updateUndoItems, v11, obj);

  }
  -[WFRunWorkflowToolbar updateBarButtonItems](self, "updateBarButtonItems");

}

- (void)setRunning:(BOOL)a3
{
  if (self->_running != a3)
  {
    self->_running = a3;
    self->_loading = 0;
    -[WFRunWorkflowToolbar updateBarButtonItems](self, "updateBarButtonItems");
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    -[WFRunWorkflowToolbar updateBarButtonItems](self, "updateBarButtonItems");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[WFRunWorkflowToolbar updateBarButtonItems](self, "updateBarButtonItems");
  }
}

- (void)updateSettingsButtonVisibility
{
  _BOOL8 v3;
  id v4;

  v3 = -[WFRunWorkflowToolbar isNotRunningAndIsEditing](self, "isNotRunningAndIsEditing");
  -[WFRunWorkflowToolbar settingsItem](self, "settingsItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)updateShareButtonVisibility
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[WFRunWorkflowToolbar shareEnabled](self, "shareEnabled")
    && !-[WFRunWorkflowToolbar shareHidden](self, "shareHidden")
    && -[WFRunWorkflowToolbar isNotRunningAndIsEditing](self, "isNotRunningAndIsEditing");
  -[WFRunWorkflowToolbar shareItem](self, "shareItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  if (-[WFRunWorkflowToolbar shareHidden](self, "shareHidden"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  else
    -[WFRunWorkflowToolbar tintColor](self, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRunWorkflowToolbar shareItem](self, "shareItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (void)updatePlayButtonVisibility
{
  _BOOL8 v3;
  id v4;

  v3 = -[WFRunWorkflowToolbar playEnabled](self, "playEnabled");
  -[WFRunWorkflowToolbar runItem](self, "runItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setPlayEnabled:(BOOL)a3
{
  self->_playEnabled = a3;
  -[WFRunWorkflowToolbar updatePlayButtonVisibility](self, "updatePlayButtonVisibility");
}

- (void)setShareEnabled:(BOOL)a3
{
  self->_shareEnabled = a3;
  -[WFRunWorkflowToolbar updateShareButtonVisibility](self, "updateShareButtonVisibility");
}

- (void)setShareHidden:(BOOL)a3
{
  self->_shareHidden = a3;
  -[WFRunWorkflowToolbar updateShareButtonVisibility](self, "updateShareButtonVisibility");
}

- (void)updateUndoItems
{
  void *v2;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = -[WFRunWorkflowToolbar isNotRunningAndIsEditing](self, "isNotRunningAndIsEditing");
  if (v4)
  {
    -[WFRunWorkflowToolbar workflowUndoManager](self, "workflowUndoManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "canUndo");
  }
  else
  {
    v5 = 0;
  }
  -[WFRunWorkflowToolbar undoItem](self, "undoItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  if (v4)
  v7 = -[WFRunWorkflowToolbar isNotRunningAndIsEditing](self, "isNotRunningAndIsEditing");
  if (v7)
  {
    -[WFRunWorkflowToolbar workflowUndoManager](self, "workflowUndoManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "canRedo");
  }
  else
  {
    v8 = 0;
  }
  -[WFRunWorkflowToolbar redoItem](self, "redoItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

  if (v7)
}

- (void)undoTapped
{
  void *v3;
  char v4;
  id v5;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runToolbarUndoTapped:", self);

  }
}

- (void)redoTapped
{
  void *v3;
  char v4;
  id v5;

  -[WFRunWorkflowToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFRunWorkflowToolbar delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runToolbarRedoTapped:", self);

  }
}

- (int64_t)positionForBar:(id)a3
{
  return 1;
}

- (NSUndoManager)workflowUndoManager
{
  return (NSUndoManager *)objc_loadWeakRetained((id *)&self->_workflowUndoManager);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)playEnabled
{
  return self->_playEnabled;
}

- (BOOL)shareEnabled
{
  return self->_shareEnabled;
}

- (BOOL)shareHidden
{
  return self->_shareHidden;
}

- (WFRunWorkflowToolbarDelegate)delegate
{
  return (WFRunWorkflowToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIToolbar)toolbar
{
  return (UIToolbar *)objc_loadWeakRetained((id *)&self->_toolbar);
}

- (void)setToolbar:(id)a3
{
  objc_storeWeak((id *)&self->_toolbar, a3);
}

- (BOOL)showsDetailsButton
{
  return self->_showsDetailsButton;
}

- (void)setShowsDetailsButton:(BOOL)a3
{
  self->_showsDetailsButton = a3;
}

- (UIBarButtonItem)undoItem
{
  return self->_undoItem;
}

- (void)setUndoItem:(id)a3
{
  objc_storeStrong((id *)&self->_undoItem, a3);
}

- (UIBarButtonItem)redoItem
{
  return self->_redoItem;
}

- (void)setRedoItem:(id)a3
{
  objc_storeStrong((id *)&self->_redoItem, a3);
}

- (UIBarButtonItem)runItem
{
  return self->_runItem;
}

- (void)setRunItem:(id)a3
{
  objc_storeStrong((id *)&self->_runItem, a3);
}

- (UIBarButtonItem)stopItem
{
  return self->_stopItem;
}

- (void)setStopItem:(id)a3
{
  objc_storeStrong((id *)&self->_stopItem, a3);
}

- (UIBarButtonItem)settingsItem
{
  return self->_settingsItem;
}

- (void)setSettingsItem:(id)a3
{
  objc_storeStrong((id *)&self->_settingsItem, a3);
}

- (UIBarButtonItem)shareItem
{
  return self->_shareItem;
}

- (void)setShareItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareItem, a3);
}

- (UIBarButtonItem)flexibleSpaceItem
{
  return self->_flexibleSpaceItem;
}

- (void)setFlexibleSpaceItem:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleSpaceItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_settingsItem, 0);
  objc_storeStrong((id *)&self->_stopItem, 0);
  objc_storeStrong((id *)&self->_runItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_destroyWeak((id *)&self->_toolbar);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_workflowUndoManager);
}

id __49__WFRunWorkflowToolbar_initShowingDetailsButton___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
