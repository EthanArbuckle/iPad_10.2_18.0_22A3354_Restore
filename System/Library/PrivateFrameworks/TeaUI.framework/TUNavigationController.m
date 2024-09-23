@implementation TUNavigationController

- (int64_t)preferredLeadingStatusBarStyle
{
  return -[TUNavigationController convert:](self, "convert:", -[TUNavigationController ts_preferredLeadingStatusBarStyle](self, "ts_preferredLeadingStatusBarStyle"));
}

- (int64_t)preferredCenterStatusBarStyle
{
  return -[TUNavigationController convert:](self, "convert:", -[TUNavigationController ts_preferredCenterStatusBarStyle](self, "ts_preferredCenterStatusBarStyle"));
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return -[TUNavigationController convert:](self, "convert:", -[TUNavigationController ts_preferredTrailingStatusBarStyle](self, "ts_preferredTrailingStatusBarStyle"));
}

- (TUNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  id v6;
  uint64_t v7;
  TUNavigationController *v8;
  TUNavigationController *v9;
  void *v10;
  _QWORD v12[4];
  TUNavigationController *v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)TUNavigationController;
  v8 = -[TUNavigationController initWithNavigationBarClass:toolbarClass:](&v15, sel_initWithNavigationBarClass_toolbarClass_, a4, v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__TUNavigationController_initWithRootViewController_navigationBarClass___block_invoke;
    v12[3] = &unk_1E63094F0;
    v13 = v8;
    v14 = v6;
    objc_msgSend(v10, "performWithoutAnimation:", v12);

  }
  return v9;
}

uint64_t __72__TUNavigationController_initWithRootViewController_navigationBarClass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (int64_t)convert:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 3);
}

- (TUNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  uint64_t v5;
  TUNavigationController *v6;
  TUNavigationController *v7;
  void *v8;
  _QWORD v10[4];
  TUNavigationController *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v5 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)TUNavigationController;
  v6 = -[TUNavigationController initWithNavigationBarClass:toolbarClass:](&v13, sel_initWithNavigationBarClass_toolbarClass_, 0, v5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__TUNavigationController_initWithRootViewController___block_invoke;
    v10[3] = &unk_1E63094F0;
    v11 = v6;
    v12 = v4;
    objc_msgSend(v8, "performWithoutAnimation:", v10);

  }
  return v7;
}

uint64_t __53__TUNavigationController_initWithRootViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (int64_t)ts_preferredLeadingStatusBarStyle
{
  return 0;
}

- (int64_t)ts_preferredCenterStatusBarStyle
{
  return 0;
}

- (int64_t)ts_preferredTrailingStatusBarStyle
{
  return 0;
}

@end
