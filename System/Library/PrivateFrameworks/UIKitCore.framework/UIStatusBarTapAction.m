@implementation UIStatusBarTapAction

- (int64_t)UIActionType
{
  return 36;
}

- (UIStatusBarTapAction)initWithType:(int64_t)a3 xPosition:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  UIStatusBarTapAction *v10;
  objc_super v12;

  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v9, 2);

  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarTapAction;
  v10 = -[UIStatusBarTapAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v12, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v7, 0, 0, 0.0);

  return v10;
}

- (int64_t)type
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIStatusBarTapAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (double)xPosition
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIStatusBarTapAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("xPosition");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("type");
  else
    return (id)v3;
}

@end
