@implementation PencilEducationViewController

+ (id)localizedTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDUCATION_PANEL_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PencilEducationViewController viewControllers](self, "viewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "calculateFittingHeightByTemporarilyAdjustingFrameForWidth:", a3);
        if (v9 < v11)
          v9 = v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  -[PencilEducationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  -[PencilEducationViewController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;

  return v9 + v14 - v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PencilEducationViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("displayedController.animationInProgress"));
  v4.receiver = self;
  v4.super_class = (Class)PencilEducationViewController;
  -[PencilEducationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PencilEducationViewController;
  -[PencilEducationViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (!-[PencilEducationViewController didRunInitialAppearActions](self, "didRunInitialAppearActions")
    || -[PencilEducationViewController didDisappear](self, "didDisappear"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationViewController setAppearDate:](self, "setAppearDate:", v4);

    -[PencilEducationViewController setDidRunInitialAppearActions:](self, "setDidRunInitialAppearActions:", 1);
    -[PencilEducationViewController setDidDisappear:](self, "setDidDisappear:", 0);
    -[PencilEducationViewController displayedController](self, "displayedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationViewController beginAnimationIfNecessaryForElementController:delay:](self, "beginAnimationIfNecessaryForElementController:delay:", v5, 0.5);

  }
  objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForceUserTextInputSettingEnabled:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PencilEducationViewController;
  -[PencilEducationViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  -[PencilEducationViewController appearDate](self, "appearDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilEducationViewController appearDate](self, "appearDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    +[PencilSettingsStatisticsManager sharedInstance](PencilSettingsStatisticsManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordEducationPencilDidShow:", v8);

  }
  -[PencilEducationViewController setDidDisappear:](self, "setDidDisappear:", 1);
  objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setForceUserTextInputSettingEnabled:", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  id v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PencilEducationViewController;
  -[PencilEducationViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[PencilEducationViewController _configureViewControllersIfNecessary](self, "_configureViewControllersIfNecessary");
  -[PencilEducationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDF6D78]);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HANDWRITE_SEGMENT_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSegmentWithTitle:", v6);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETE_SEGMENT_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSegmentWithTitle:", v7);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SELECT_SEGMENT_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSegmentWithTitle:", v8);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INSERT_SEGMENT_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSegmentWithTitle:", v9);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("JOIN_SEGMENT_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSegmentWithTitle:", v10);

  objc_msgSend(v5, "setApportionsSegmentWidthsByContent:", 1);
  objc_msgSend(v5, "_setAutosizeText:", 1);
  objc_msgSend(v5, "selectSegment:", 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_segmentedControlDidChange_, 4096);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v14);

  objc_msgSend(v5, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v18);

  objc_msgSend(v5, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 448.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v20);

  v21 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 448.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v23);

  objc_msgSend(v21, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v26);

  objc_msgSend(v21, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v29);

  objc_msgSend(v21, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v33);

  objc_msgSend(v3, "addSubview:", v21);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v11);
  -[PencilEducationViewController setContainerView:](self, "setContainerView:", v21);
  -[PencilEducationViewController setSegmentedControl:](self, "setSegmentedControl:", v5);
  -[PencilEducationViewController segmentedControl](self, "segmentedControl");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSelectedSegment:", 0);

  -[PencilEducationViewController segmentedControl](self, "segmentedControl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationViewController segmentedControlDidChange:](self, "segmentedControlDidChange:", v35);

  v36 = objc_alloc_init(MEMORY[0x24BDE33D0]);
  objc_msgSend(v36, "setDelegate:", self);
  -[PencilEducationViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addInteraction:", v36);

  -[PencilEducationViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("displayedController.animationInProgress"), 0, 0);
  -[PencilEducationViewController setSetupComplete:](self, "setSetupComplete:", 1);

}

- (id)traitCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)PencilEducationViewController;
  -[PencilEducationViewController traitCollection](&v9, sel_traitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7658]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7650]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7648]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7640]))
  {
    v4 = (void *)MEMORY[0x24BDF6F30];
    v10[0] = v2;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BDF7680]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollectionWithTraitsFromCollections:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("displayedController.animationInProgress"), a4, a5, a6))
  {
    -[PencilEducationViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "educationController:didChangeAnimationState:", self, -[PencilEducationViewController isAnimating](self, "isAnimating"));

  }
}

- (void)segmentedControlDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "selectedSegment");
  -[PencilEducationViewController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilEducationViewController setDisplayedController:](self, "setDisplayedController:", v6);

  if (-[PencilEducationViewController setupComplete](self, "setupComplete"))
  {
    +[PencilSettingsStatisticsManager sharedInstance](PencilSettingsStatisticsManager, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordEducationPanelChanged:", v4);

  }
}

- (void)doneButtonPressed:(id)a3
{
  -[PencilEducationViewController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 7);
}

- (void)setDisplayedController:(id)a3
{
  PencilEducationElementViewController *v5;
  PencilEducationElementViewController *displayedController;
  PencilEducationElementViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PencilEducationElementViewController *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  PencilEducationElementViewController *v15;
  PencilEducationViewController *v16;
  _QWORD v17[4];
  PencilEducationElementViewController *v18;
  PencilEducationElementViewController *v19;

  v5 = (PencilEducationElementViewController *)a3;
  displayedController = self->_displayedController;
  if (displayedController != v5)
  {
    if (displayedController)
    {
      v7 = displayedController;
      objc_storeStrong((id *)&self->_displayedController, a3);
      -[PencilEducationElementViewController view](v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 0.0);

      -[PencilEducationViewController addControllerToContainer:](self, "addControllerToContainer:", v5);
      v9 = (void *)MEMORY[0x24BDF6F90];
      v10 = MEMORY[0x24BDAC760];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __56__PencilEducationViewController_setDisplayedController___block_invoke;
      v17[3] = &unk_24F4E5270;
      v18 = v7;
      v19 = v5;
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __56__PencilEducationViewController_setDisplayedController___block_invoke_2;
      v14[3] = &unk_24F4E5298;
      v15 = v18;
      v16 = self;
      v11 = v18;
      objc_msgSend(v9, "animateWithDuration:animations:completion:", v17, v14, 0.25);

    }
    else
    {
      objc_storeStrong((id *)&self->_displayedController, a3);
      -[PencilEducationViewController addControllerToContainer:](self, "addControllerToContainer:", self->_displayedController);
      -[PencilEducationViewController displayedController](self, "displayedController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PencilEducationViewController beginAnimationIfNecessaryForElementController:delay:](self, "beginAnimationIfNecessaryForElementController:delay:", v12, 0.5);

      -[PencilEducationViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "educationControllerDidChangePanel:", self);

    }
  }

}

void __56__PencilEducationViewController_setDisplayedController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __56__PencilEducationViewController_setDisplayedController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 40), "removeChildViewController:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "displayedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginAnimationIfNecessaryForElementController:delay:", v4, 0.5);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "educationControllerDidChangePanel:", *(_QWORD *)(a1 + 40));

}

- (void)addControllerToContainer:(id)a3
{
  id v4;
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
  id v18;

  v4 = a3;
  -[PencilEducationViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PencilEducationViewController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v18);
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v5, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v5, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v5, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[PencilEducationViewController displayedController](self, "displayedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "animationInProgress");

  return v3;
}

- (void)_configureViewControllersIfNecessary
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PencilEducationElementViewController *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[PencilEducationViewController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PencilEducationViewController setViewControllers:](self, "setViewControllers:", v5);

    objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recognitionLocaleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(&unk_24F4F6490, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(&unk_24F4F6490);
          +[PencilEducationElementData elementDataForType:languageID:](PencilEducationElementData, "elementDataForType:languageID:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "integerValue"), v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PencilEducationElementViewController initWithElementData:]([PencilEducationElementViewController alloc], "initWithElementData:", v12);
          -[PencilEducationElementViewController setDelegate:](v13, "setDelegate:", self);
          -[PencilEducationViewController viewControllers](self, "viewControllers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(&unk_24F4F6490, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)beginAnimationIfNecessaryForElementController:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v6 = a3;
  v7 = (void *)(-[PencilEducationViewController animationBeginRequestIndex](self, "animationBeginRequestIndex") + 1);
  -[PencilEducationViewController setAnimationBeginRequestIndex:](self, "setAnimationBeginRequestIndex:", v7);
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__PencilEducationViewController_beginAnimationIfNecessaryForElementController_delay___block_invoke;
  v10[3] = &unk_24F4E5480;
  objc_copyWeak(v12, &location);
  v12[1] = v7;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __85__PencilEducationViewController_beginAnimationIfNecessaryForElementController_delay___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "animationBeginRequestIndex");
  v5 = *(_QWORD *)(a1 + 48);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    v7 = objc_msgSend(v6, "shouldBeginAnimationForElementController:", *(_QWORD *)(a1 + 32));

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "beginAnimation");
  }
}

- (BOOL)shouldBeginAnimationForElementController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  BOOL v16;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  -[PencilEducationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && !-[PencilEducationViewController isAnimating](self, "isAnimating")
    && objc_msgSend(v4, "hasRemainingAnimation"))
  {
    v7 = objc_msgSend(v4, "_appearState");

    if (v7 != 2)
    {
      v16 = 0;
      goto LABEL_8;
    }
    -[PencilEducationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "convertRect:toView:", 0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v19.origin.x = v9;
    v19.origin.y = v11;
    v19.size.width = v13;
    v19.size.height = v15;
    v16 = CGRectContainsRect(v18, v19);
  }
  else
  {
    v16 = 0;
  }

LABEL_8:
  return v16;
}

- (void)cancelScheduledAnimations
{
  id v2;

  -[PencilEducationViewController displayedController](self, "displayedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelScheduledAnimations");

}

- (void)elementControllerWillReplay:(id)a3
{
  id v4;

  -[PencilEducationViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "educationControllerWillReplay:", self);

}

- (void)elementControllerDidAppear:(id)a3
{
  id v4;

  -[PencilEducationViewController displayedController](self, "displayedController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PencilEducationViewController beginAnimationIfNecessaryForElementController:delay:](self, "beginAnimationIfNecessaryForElementController:delay:", v4, 0.5);

}

- (PencilEducationViewControllerDelegate)delegate
{
  return (PencilEducationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (PencilEducationElementViewController)displayedController
{
  return self->_displayedController;
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (unint64_t)pendingTransitionIndex
{
  return self->_pendingTransitionIndex;
}

- (void)setPendingTransitionIndex:(unint64_t)a3
{
  self->_pendingTransitionIndex = a3;
}

- (unint64_t)animationBeginRequestIndex
{
  return self->_animationBeginRequestIndex;
}

- (void)setAnimationBeginRequestIndex:(unint64_t)a3
{
  self->_animationBeginRequestIndex = a3;
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (NSDate)appearDate
{
  return self->_appearDate;
}

- (void)setAppearDate:(id)a3
{
  objc_storeStrong((id *)&self->_appearDate, a3);
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (BOOL)didRunInitialAppearActions
{
  return self->_didRunInitialAppearActions;
}

- (void)setDidRunInitialAppearActions:(BOOL)a3
{
  self->_didRunInitialAppearActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearDate, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_displayedController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
