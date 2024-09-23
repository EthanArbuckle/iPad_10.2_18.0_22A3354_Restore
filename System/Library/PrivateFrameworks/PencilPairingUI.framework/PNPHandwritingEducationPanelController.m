@implementation PNPHandwritingEducationPanelController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9;
  PNPHandwritingEducationPanelController *v10;
  void *v11;
  PNPHandwritingEducationPanelController *v12;

  v9 = a6;
  v10 = [PNPHandwritingEducationPanelController alloc];
  +[PencilHandwritingEducationViewController localizedTitle](PencilHandwritingEducationViewController, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PNPHandwritingEducationPanelController initWithTitle:detailText:icon:contentLayout:](v10, "initWithTitle:detailText:icon:contentLayout:", v11, 0, 0, 3);

  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v12, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v9);
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_watchdogTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PNPHandwritingEducationPanelController;
  -[PNPHandwritingEducationPanelController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PencilHandwritingEducationViewController *v7;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PNPHandwritingEducationPanelController;
  -[OBBaseWelcomeController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingEducationPanelController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[PNPHandwritingEducationPanelController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v3);

  v7 = -[PencilHandwritingEducationViewController initWithNibName:bundle:]([PencilHandwritingEducationViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PNPHandwritingEducationPanelController setEducationController:](self, "setEducationController:", v7);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingEducationPanelController addChildViewController:](self, "addChildViewController:", v9);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PNPHandwritingEducationPanelController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);
  objc_msgSend(v11, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v11, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v11, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v11, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingEducationPanelController addChildViewController:](self, "addChildViewController:", v25);

  -[PNPHandwritingEducationPanelController setUpForIsAnimating:](self, "setUpForIsAnimating:", -[PNPHandwritingEducationPanelController isAnimating](self, "isAnimating"));
  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingEducationPanelController buttonTray](self, "buttonTray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateButtonTray:", v27);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PNPHandwritingEducationPanelController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PNPHandwritingEducationPanelController scheduleWatchdogTimer](self, "scheduleWatchdogTimer");
  -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;

  -[PNPHandwritingEducationPanelController cancelWatchdogTimer](self, "cancelWatchdogTimer", a3);
  -[PNPHandwritingEducationPanelController setUpForIsAnimating:](self, "setUpForIsAnimating:", 0);
  -[PNPHandwritingEducationPanelController setDidAdjustHeightForWidth:](self, "setDidAdjustHeightForWidth:", 0);
  -[PNPHandwritingEducationPanelController forcedHeightLayoutConstraint](self, "forcedHeightLayoutConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[PNPHandwritingEducationPanelController setForcedHeightLayoutConstraint:](self, "setForcedHeightLayoutConstraint:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)PNPHandwritingEducationPanelController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v46, sel_viewDidLayoutSubviews);
  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  if (v6 <= 0.0)
  {

  }
  else
  {
    v7 = -[PNPHandwritingEducationPanelController didAdjustHeightForWidth](self, "didAdjustHeightForWidth");

    if (!v7)
    {
      -[PNPHandwritingEducationPanelController setDidAdjustHeightForWidth:](self, "setDidAdjustHeightForWidth:", 1);
      -[PNPHandwritingEducationPanelController educationController](self, "educationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPHandwritingEducationPanelController educationController](self, "educationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v9, "convertRect:toView:", 0);
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[PNPHandwritingEducationPanelController educationController](self, "educationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "calculateFittingHeightByTemporarilyAdjustingFrameForWidth:", v17);
      v20 = v19;

      -[PNPHandwritingEducationPanelController educationController](self, "educationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "heightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPHandwritingEducationPanelController setForcedHeightLayoutConstraint:](self, "setForcedHeightLayoutConstraint:", v24);

      -[PNPHandwritingEducationPanelController forcedHeightLayoutConstraint](self, "forcedHeightLayoutConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      -[PNPHandwritingEducationPanelController buttonTray](self, "buttonTray");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPHandwritingEducationPanelController buttonTray](self, "buttonTray");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      objc_msgSend(v26, "convertRect:toView:", 0);
      v29 = v28;

      v47.origin.x = v13;
      v47.origin.y = v15;
      v47.size.width = v17;
      v47.size.height = v20;
      v30 = CGRectGetMaxY(v47) - v29;
      if (v30 > 0.0)
      {
        -[PNPHandwritingEducationPanelController headerView](self, "headerView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PNPHandwritingEducationPanelController headerView](self, "headerView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bounds");
        objc_msgSend(v31, "convertRect:toView:", 0);
        v34 = v33;

        -[PNPHandwritingEducationPanelController scrollView](self, "scrollView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PNPHandwritingEducationPanelController scrollView](self, "scrollView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "bounds");
        objc_msgSend(v35, "convertRect:toView:", 0);
        v38 = v37;

        if (v34 - v38 >= v30)
          v39 = v30;
        else
          v39 = v34 - v38;
        -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", 0.0, v39);
      }
    }
  }
  -[PNPHandwritingEducationPanelController forcedContentOffset](self, "forcedContentOffset");
  if (v40 > 0.0)
  {
    -[PNPHandwritingEducationPanelController forcedContentOffset](self, "forcedContentOffset");
    v42 = v41;
    v44 = v43;
    -[PNPHandwritingEducationPanelController scrollView](self, "scrollView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setContentOffset:", v42, v44);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;

  -[PNPHandwritingEducationPanelController setForcedContentOffset:](self, "setForcedContentOffset:", a4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[PNPHandwritingEducationPanelController setDidAdjustHeightForWidth:](self, "setDidAdjustHeightForWidth:", 0);
  -[PNPHandwritingEducationPanelController forcedHeightLayoutConstraint](self, "forcedHeightLayoutConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[PNPHandwritingEducationPanelController setForcedHeightLayoutConstraint:](self, "setForcedHeightLayoutConstraint:", 0);
}

- (void)scheduleWatchdogTimer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  -[PNPHandwritingEducationPanelController cancelWatchdogTimer](self, "cancelWatchdogTimer");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDBCF40];
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __63__PNPHandwritingEducationPanelController_scheduleWatchdogTimer__block_invoke;
  v8 = &unk_24F4E5138;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingEducationPanelController setWatchdogTimer:](self, "setWatchdogTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__PNPHandwritingEducationPanelController_scheduleWatchdogTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAnimating:", 0);

}

- (void)cancelWatchdogTimer
{
  id v2;

  -[PNPHandwritingEducationPanelController watchdogTimer](self, "watchdogTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)educationController:(id)a3 didChangeAnimationState:(BOOL)a4
{
  -[PNPHandwritingEducationPanelController setIsAnimating:](self, "setIsAnimating:", a4);
}

- (void)educationControllerRequestedDismissal:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = -[PNPWelcomeController deviceType](self, "deviceType", a3);
  -[PNPWelcomeController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPWelcomeController controllerWithType:buttonType:deviceType:delegate:](PNPWelcomeController, "controllerWithType:buttonType:deviceType:delegate:", 9, 2, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PNPHandwritingEducationPanelController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void)setIsAnimating:(BOOL)a3
{
  -[PNPHandwritingEducationPanelController setIsAnimating:animated:](self, "setIsAnimating:animated:", a3, 1);
}

- (void)setIsAnimating:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __66__PNPHandwritingEducationPanelController_setIsAnimating_animated___block_invoke;
      v4[3] = &unk_24F4E5160;
      v4[4] = self;
      v5 = a3;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.15);
    }
    else
    {
      -[PNPHandwritingEducationPanelController setUpForIsAnimating:](self, "setUpForIsAnimating:");
    }
  }
}

uint64_t __66__PNPHandwritingEducationPanelController_setIsAnimating_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUpForIsAnimating:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setUpForIsAnimating:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  if (a3)
    v5 = 0.4;
  else
    v5 = 1.0;
  -[PNPWelcomeController trayButton](self, "trayButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[PNPHandwritingEducationPanelController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v5);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "segmentedControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v5);

  v11 = !v3;
  -[PNPWelcomeController trayButton](self, "trayButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", v11);

  -[PNPHandwritingEducationPanelController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", v11);

  -[PNPHandwritingEducationPanelController educationController](self, "educationController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "segmentedControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", v11);

}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!-[PNPHandwritingEducationPanelController isAnimating](self, "isAnimating"))
  {
    -[PNPHandwritingEducationPanelController educationController](self, "educationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelScheduledAnimations");

    v6.receiver = self;
    v6.super_class = (Class)PNPHandwritingEducationPanelController;
    -[PNPWelcomeController buttonPressed:](&v6, sel_buttonPressed_, v4);
  }

}

- (PencilHandwritingEducationViewController)educationController
{
  return self->_educationController;
}

- (void)setEducationController:(id)a3
{
  objc_storeStrong((id *)&self->_educationController, a3);
}

- (NSTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogTimer, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)didAdjustHeightForWidth
{
  return self->_didAdjustHeightForWidth;
}

- (void)setDidAdjustHeightForWidth:(BOOL)a3
{
  self->_didAdjustHeightForWidth = a3;
}

- (CGPoint)forcedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_forcedContentOffset.x;
  y = self->_forcedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setForcedContentOffset:(CGPoint)a3
{
  self->_forcedContentOffset = a3;
}

- (NSLayoutConstraint)forcedHeightLayoutConstraint
{
  return self->_forcedHeightLayoutConstraint;
}

- (void)setForcedHeightLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_forcedHeightLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedHeightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_educationController, 0);
}

@end
