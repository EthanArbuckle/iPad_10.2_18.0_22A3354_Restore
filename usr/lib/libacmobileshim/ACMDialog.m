@implementation ACMDialog

+ (id)dialog
{
  return (id)objc_opt_new();
}

- (ACMDialog)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  return -[ACMDialog initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[ACMDialog setView:](self, "setView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  -[ACMDialog dealloc](&v3, sel_dealloc);
}

- (int64_t)modalTransitionStyle
{
  objc_super v4;

  if (floor(*MEMORY[0x24BDD0D50]) > 993.0
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)ACMDialog;
  return -[ACMDialog modalTransitionStyle](&v4, sel_modalTransitionStyle);
}

- (void)showWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  dispatch_time_t v10;
  uint64_t v11;
  _QWORD block[7];
  BOOL v13;

  v6 = a4;
  if (-[ACMDialog isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v9 = (id)objc_msgSend(a5, "copy");
    v10 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ACMDialog_showWithParentViewController_animated_completion___block_invoke;
    block[3] = &unk_24FCE4FD0;
    block[4] = self;
    block[5] = a3;
    v13 = v6;
    block[6] = v9;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
  }
  else if (-[ACMDialog presentingViewController](self, "presentingViewController"))
  {
    if ((id)-[ACMDialog presentingViewController](self, "presentingViewController") == a3
      || (v11 = -[ACMDialog presentingViewController](self, "presentingViewController"),
          v11 == objc_msgSend(a3, "navigationController")))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACMDialog showWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 70, 0, "Attempt to show %@ with parent: %@, while it always has a parent: %@", self, a3, -[ACMDialog presentingViewController](self, "presentingViewController"));
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMDialog showWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 74, 0, "Already shown");
    }
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
  else
  {
    objc_msgSend(a3, "presentViewController:animated:completion:", self, v6, a5);
  }
}

uint64_t __62__ACMDialog_showWithParentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showWithParentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)hideWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  dispatch_time_t v10;
  uint64_t v11;
  _QWORD block[7];
  BOOL v13;

  v6 = a4;
  if (-[ACMDialog isBeingPresented](self, "isBeingPresented"))
  {
    v9 = (id)objc_msgSend(a5, "copy");
    v10 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ACMDialog_hideWithParentViewController_animated_completion___block_invoke;
    block[3] = &unk_24FCE4FD0;
    block[4] = self;
    block[5] = a3;
    v13 = v6;
    block[6] = v9;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
  }
  else if (-[ACMDialog presentingViewController](self, "presentingViewController")
         && (-[ACMDialog isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    v11 = objc_msgSend(a3, "navigationController");
    if (v11 != -[ACMDialog presentingViewController](self, "presentingViewController")
      && (id)-[ACMDialog presentingViewController](self, "presentingViewController") != a3
      && ACFLog
      && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMDialog hideWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 103, 0, "Attempt to dismiss %@ with parent: %@, while it has diferent parent: %@", self, a3, -[ACMDialog presentingViewController](self, "presentingViewController"));
    }
    objc_msgSend((id)-[ACMDialog presentingViewController](self, "presentingViewController"), "dismissViewControllerAnimated:completion:", v6, a5);
  }
  else if (a5)
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

uint64_t __62__ACMDialog_hideWithParentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideWithParentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (NSString)backgroundImageName
{
  return 0;
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  NSString *v8;
  void *v9;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v7, "setAutoresizesSubviews:", 1);
  v8 = -[ACMDialog backgroundImageName](self, "backgroundImageName");
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", ACMImageWithName((uint64_t)v8));
    objc_msgSend(v9, "setFrame:", 0.0, -20.0, 320.0, 480.0);
    objc_msgSend(v7, "addSubview:", v9);
    objc_msgSend(v7, "bringSubviewToFront:", v9);
  }
  -[ACMDialog setView:](self, "setView:", v7);
}

- (BOOL)shouldManuallyChangeStatusBarStyle
{
  return 1;
}

- (int64_t)statusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[ACMDialog shouldManuallyChangeStatusBarStyle](self, "shouldManuallyChangeStatusBarStyle"))
  {
    -[ACMDialog setSavedStatusBarStyle:](self, "setSavedStatusBarStyle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarStyle"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setStatusBarStyle:animated:", -[ACMDialog statusBarStyle](self, "statusBarStyle"), v3);
  }
  v5.receiver = self;
  v5.super_class = (Class)ACMDialog;
  -[ACMDialog viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  -[ACMDialog viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ACMDialog;
  -[ACMDialog viewDidDisappear:](&v5, sel_viewDidDisappear_);
  if (-[ACMDialog shouldManuallyChangeStatusBarStyle](self, "shouldManuallyChangeStatusBarStyle"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setStatusBarStyle:animated:", -[ACMDialog savedStatusBarStyle](self, "savedStatusBarStyle"), v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  -[ACMDialog viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (int64_t)savedStatusBarStyle
{
  return self->_savedStatusBarStyle;
}

- (void)setSavedStatusBarStyle:(int64_t)a3
{
  self->_savedStatusBarStyle = a3;
}

@end
