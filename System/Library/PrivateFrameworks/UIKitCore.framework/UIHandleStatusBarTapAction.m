@implementation UIHandleStatusBarTapAction

- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3
{
  id v5;
  void *v6;
  UIHandleStatusBarTapAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)UIHandleStatusBarTapAction;
  v7 = -[UIHandleStatusBarTapAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);

  return v7;
}

- (UIHandleStatusBarTapAction)initWithStatusBarStyleOverride:(unint64_t)a3
{
  id v5;
  void *v6;
  UIHandleStatusBarTapAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 2);

  v9.receiver = self;
  v9.super_class = (Class)UIHandleStatusBarTapAction;
  v7 = -[UIHandleStatusBarTapAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v5, 0, 0, 0.0);

  return v7;
}

- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3 andStatusBarStyleOverride:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  UIHandleStatusBarTapAction *v10;
  objc_super v12;

  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v9, 2);

  v12.receiver = self;
  v12.super_class = (Class)UIHandleStatusBarTapAction;
  v10 = -[UIHandleStatusBarTapAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v12, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v7, 0, 0, 0.0);

  return v10;
}

- (UIHandleStatusBarTapAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UIHandleStatusBarTapAction initWithStatusBarStyle:](self, "initWithStatusBarStyle:", -1, a5, a6, a4);
}

- (int64_t)statusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIHandleStatusBarTapAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)statusBarStyleOverride
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIHandleStatusBarTapAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)UIActionType
{
  return 7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("statusBarStyleOverride");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("statusBarStyle");
  else
    return (id)v3;
}

@end
