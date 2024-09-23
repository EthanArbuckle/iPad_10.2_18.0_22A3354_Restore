@implementation PencilHandwritingEducationViewController

+ (id)localizedTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_EDUCATION_PANEL_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
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
  -[PencilHandwritingEducationViewController viewControllers](self, "viewControllers", 0);
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

  -[PencilHandwritingEducationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  -[PencilHandwritingEducationViewController containerView](self, "containerView");
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

  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationViewController;
  -[PencilHandwritingEducationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PencilHandwritingEducationViewController;
  -[PencilHandwritingEducationViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!-[PencilHandwritingEducationViewController didRunInitialAppearActions](self, "didRunInitialAppearActions")
    || -[PencilHandwritingEducationViewController didDisappear](self, "didDisappear"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationViewController setAppearDate:](self, "setAppearDate:", v4);

    -[PencilHandwritingEducationViewController setDidRunInitialAppearActions:](self, "setDidRunInitialAppearActions:", 1);
    -[PencilHandwritingEducationViewController setDidDisappear:](self, "setDidDisappear:", 0);
    -[PencilHandwritingEducationViewController displayedController](self, "displayedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationViewController beginAnimationIfNecessaryForElementController:delay:](self, "beginAnimationIfNecessaryForElementController:delay:", v5, 0.5);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PencilHandwritingEducationViewController;
  -[PencilHandwritingEducationViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  -[PencilHandwritingEducationViewController appearDate](self, "appearDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PencilHandwritingEducationViewController appearDate](self, "appearDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    +[PencilSettingsStatisticsManager sharedInstance](PencilSettingsStatisticsManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordEducationPencilDidShow:", v8);

  }
  -[PencilHandwritingEducationViewController setDidDisappear:](self, "setDidDisappear:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PencilHandwritingEducationViewController;
  -[PencilHandwritingEducationViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[PencilHandwritingEducationViewController _configureViewControllersIfNecessary](self, "_configureViewControllersIfNecessary");
  -[PencilHandwritingEducationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 448.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v6, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(v6, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  objc_msgSend(v3, "addSubview:", v6);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v5);
  -[PencilHandwritingEducationViewController setContainerView:](self, "setContainerView:", v6);
  -[PencilHandwritingEducationViewController viewControllers](self, "viewControllers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PencilHandwritingEducationViewController setDisplayedController:](self, "setDisplayedController:", v21);

  -[PencilHandwritingEducationViewController setSetupComplete:](self, "setSetupComplete:", 1);
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
  v9.super_class = (Class)PencilHandwritingEducationViewController;
  -[PencilHandwritingEducationViewController traitCollection](&v9, sel_traitCollection);
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

- (void)doneButtonPressed:(id)a3
{
  -[PencilHandwritingEducationViewController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 7);
}

- (void)setDisplayedController:(id)a3
{
  PencilHandwritingEducationElementViewController *v5;
  PencilHandwritingEducationElementViewController *displayedController;
  PencilHandwritingEducationElementViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PencilHandwritingEducationElementViewController *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  PencilHandwritingEducationElementViewController *v18;
  PencilHandwritingEducationViewController *v19;
  _QWORD v20[4];
  PencilHandwritingEducationElementViewController *v21;
  PencilHandwritingEducationElementViewController *v22;

  v5 = (PencilHandwritingEducationElementViewController *)a3;
  displayedController = self->_displayedController;
  if (displayedController != v5)
  {
    if (displayedController)
    {
      v7 = displayedController;
      objc_storeStrong((id *)&self->_displayedController, a3);
      -[PencilHandwritingEducationElementViewController view](v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 0.0);

      -[PencilHandwritingEducationViewController displayedController](self, "displayedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PencilHandwritingEducationViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "educationControllerButtonTray:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateButtonTray:", v11);

      -[PencilHandwritingEducationViewController addControllerToContainer:](self, "addControllerToContainer:", v5);
      v12 = (void *)MEMORY[0x24BDF6F90];
      v13 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke;
      v20[3] = &unk_24F4E5270;
      v21 = v7;
      v22 = v5;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke_2;
      v17[3] = &unk_24F4E5298;
      v18 = v21;
      v19 = self;
      v14 = v21;
      objc_msgSend(v12, "animateWithDuration:animations:completion:", v20, v17, 0.25);

    }
    else
    {
      objc_storeStrong((id *)&self->_displayedController, a3);
      -[PencilHandwritingEducationViewController addControllerToContainer:](self, "addControllerToContainer:", self->_displayedController);
      -[PencilHandwritingEducationViewController displayedController](self, "displayedController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PencilHandwritingEducationViewController beginAnimationIfNecessaryForElementController:delay:](self, "beginAnimationIfNecessaryForElementController:delay:", v15, 0.5);

      -[PencilHandwritingEducationViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "educationControllerDidChangePanel:", self);

    }
  }

}

void __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke(uint64_t a1)
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

void __67__PencilHandwritingEducationViewController_setDisplayedController___block_invoke_2(uint64_t a1)
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
  -[PencilHandwritingEducationViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PencilHandwritingEducationViewController containerView](self, "containerView");
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

- (void)updateButtonTray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PencilHandwritingEducationViewController displayedController](self, "displayedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateButtonTray:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[PencilHandwritingEducationViewController displayedController](self, "displayedController");
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
  PencilHandwritingEducationElementViewController *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[PencilHandwritingEducationViewController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PencilHandwritingEducationViewController setViewControllers:](self, "setViewControllers:", v5);

    objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recognitionLocaleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(&unk_24F4F63B8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
            objc_enumerationMutation(&unk_24F4F63B8);
          +[PencilHandwritingEducationElementData elementDataForType:languageID:](PencilHandwritingEducationElementData, "elementDataForType:languageID:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "integerValue"), v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PencilHandwritingEducationElementViewController initWithElementData:]([PencilHandwritingEducationElementViewController alloc], "initWithElementData:", v12);
          -[PencilHandwritingEducationElementViewController setDelegate:](v13, "setDelegate:", self);
          -[PencilHandwritingEducationViewController viewControllers](self, "viewControllers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(&unk_24F4F63B8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)shouldBeginAnimationForElementController:(id)a3
{
  return 0;
}

- (void)elementControllerShouldDismiss:(id)a3
{
  id v4;

  -[PencilHandwritingEducationViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "educationControllerRequestedDismissal:", self);

}

- (PencilHandwritingEducationViewControllerDelegate)delegate
{
  return (PencilHandwritingEducationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (PencilHandwritingEducationElementViewController)displayedController
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
