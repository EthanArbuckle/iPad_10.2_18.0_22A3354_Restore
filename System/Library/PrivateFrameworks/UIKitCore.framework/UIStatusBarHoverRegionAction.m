@implementation UIStatusBarHoverRegionAction

- (UIStatusBarHoverRegionAction)initWithRegion:(int64_t)a3
{
  id v5;
  void *v6;
  UIStatusBarHoverRegionAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarHoverRegionAction;
  v7 = -[UIStatusBarHoverRegionAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);

  return v7;
}

- (int64_t)region
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIStatusBarHoverRegionAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)UIActionType
{
  return 38;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("statusBarRegion");
  else
    return 0;
}

uint64_t __55___UIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  UIStatusBarHoverRegionAction *v4;
  id *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend((id)UIApp, "handleStatusBarHoverActionForRegion:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v4 = -[UIStatusBarHoverRegionAction initWithRegion:]([UIStatusBarHoverRegionAction alloc], "initWithRegion:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "window");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _fbsScene](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendActions:", v7);

  }
  return 1;
}

@end
