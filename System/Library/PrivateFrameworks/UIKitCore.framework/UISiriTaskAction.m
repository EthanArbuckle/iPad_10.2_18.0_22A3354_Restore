@implementation UISiriTaskAction

- (UISiriTaskAction)initWithPayload:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UISiriTaskAction *v7;
  objc_super v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D017D0];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v6, "setObject:forSetting:", v5, 1);

    v9.receiver = self;
    v9.super_class = (Class)UISiriTaskAction;
    self = -[UISiriTaskAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v9, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v6, 0, 0, 0.0);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UISiriTaskAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{

  return 0;
}

- (AFSiriTask)payload
{
  void *v2;
  void *v3;

  -[UISiriTaskAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFSiriTask *)v3;
}

- (int64_t)UIActionType
{
  return 8;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("payload");
  else
    return 0;
}

@end
