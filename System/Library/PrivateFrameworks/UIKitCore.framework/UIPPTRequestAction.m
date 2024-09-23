@implementation UIPPTRequestAction

- (UIPPTRequestAction)initWithDesiredOrientation:(int64_t)a3
{
  id v5;
  void *v6;
  UIPPTRequestAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)UIPPTRequestAction;
  v7 = -[UIPPTRequestAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);

  return v7;
}

- (int64_t)UIActionType
{
  return 15;
}

- (BOOL)shouldChangeOrientation
{
  void *v2;
  void *v3;

  -[UIPPTRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int64_t)orientationRequested
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIPPTRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

@end
