@implementation VTUIEnrollmentSetupIntroViewControllerGM

- (void)viewDidLoad
{
  _TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *v3;
  _TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *buddyFlowViewWrapper;
  _TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *v5;
  id WeakRetained;
  UIViewController *v7;
  UIViewController *introViewController;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  -[VTUIEnrollmentSetupIntroViewControllerGM viewDidLoad](&v21, sel_viewDidLoad);
  v3 = (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *)objc_opt_new();
  buddyFlowViewWrapper = self->_buddyFlowViewWrapper;
  self->_buddyFlowViewWrapper = v3;

  v5 = self->_buddyFlowViewWrapper;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[GMEnrollmentSetupIntroViewManager createViewControllerWithIntroViewControllerDelegate:](v5, "createViewControllerWithIntroViewControllerDelegate:", WeakRetained);
  v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  introViewController = self->_introViewController;
  self->_introViewController = v7;

  -[VTUIEnrollmentSetupIntroViewControllerGM addChildViewController:](self, "addChildViewController:", self->_introViewController);
  -[VTUIEnrollmentSetupIntroViewControllerGM navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  -[VTUIEnrollmentSetupIntroViewControllerGM view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  -[UIViewController view](self->_introViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, -v12, v15, v12 + v17);

  -[VTUIEnrollmentSetupIntroViewControllerGM view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_introViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[UIViewController didMoveToParentViewController:](self->_introViewController, "didMoveToParentViewController:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  UIViewController *introViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  -[VTUIEnrollmentSetupIntroViewControllerGM viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[UIViewController willMoveToParentViewController:](self->_introViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_introViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_introViewController, "removeFromParentViewController");
  introViewController = self->_introViewController;
  self->_introViewController = 0;

}

- (void)loadView
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  -[VTUIEnrollmentSetupIntroViewControllerGM setView:](self, "setView:", v3);

}

- (VTUIEnrollmentSetupIntroViewControllerGM)initWithDelegate:(id)a3
{
  id v4;
  VTUIEnrollmentSetupIntroViewControllerGM *v5;
  VTUIEnrollmentSetupIntroViewControllerGM *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  v5 = -[VTUIEnrollmentSetupIntroViewControllerGM init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)isLaterButtonAvailable
{
  return 1;
}

- (BOOL)shouldCleanupForEnrollment
{
  return 0;
}

- (void)enrollmentWillAppear
{
  -[VTUIEnrollmentSetupIntroViewControllerGM _animateVisibility:](self, "_animateVisibility:", 0);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VTUIEnrollmentSetupIntroViewControllerGM view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)fadeIn
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[VTUIEnrollmentSetupIntroViewControllerGM _animateVisibility:](self, "_animateVisibility:", 1);
  v3 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__VTUIEnrollmentSetupIntroViewControllerGM_fadeIn__block_invoke;
  block[3] = &unk_24F33DA28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

void __50__VTUIEnrollmentSetupIntroViewControllerGM_fadeIn__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "buddyFlowViewWrapper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "proceedToReady");

}

- (BOOL)isSuccessViewReady
{
  return 1;
}

- (VTUIEnrollmentSetupIntroViewControllerGM)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  VTUIEnrollmentSetupIntroViewControllerGM *v10;
  VTUIEnrollmentSetupIntroViewControllerGM *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  v10 = -[VTUIEnrollmentSetupIntroViewControllerGM init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.x = x;
    v10->_frame.origin.y = y;
    v10->_frame.size.width = width;
    v10->_frame.size.height = height;
    objc_storeWeak((id *)&v10->_delegate, v9);
  }

  return v11;
}

- (void)_animateVisibility:(BOOL)a3
{
  double v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[VTUIEnrollmentSetupIntroViewControllerGM view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[VTUIEnrollmentSetupIntroViewControllerGM setHidden:](self, "setHidden:", 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__VTUIEnrollmentSetupIntroViewControllerGM__animateVisibility___block_invoke;
  v7[3] = &unk_24F33E070;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, 0, 0.400000006);
}

void __63__VTUIEnrollmentSetupIntroViewControllerGM__animateVisibility___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)buddyFlowViewWrapper
{
  return self->_buddyFlowViewWrapper;
}

- (void)setBuddyFlowViewWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_buddyFlowViewWrapper, a3);
}

- (UIViewController)introViewController
{
  return self->_introViewController;
}

- (void)setIntroViewController:(id)a3
{
  objc_storeStrong((id *)&self->_introViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introViewController, 0);
  objc_storeStrong((id *)&self->_buddyFlowViewWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
