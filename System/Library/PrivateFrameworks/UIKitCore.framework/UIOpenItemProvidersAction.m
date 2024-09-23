@implementation UIOpenItemProvidersAction

- (UIOpenItemProvidersAction)initWithInfo:(id)a3 responder:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIOpenItemProvidersAction;
  return -[UIOpenItemProvidersAction initWithInfo:responder:](&v5, sel_initWithInfo_responder_, a3, a4);
}

- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3 userInfo:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  UIOpenItemProvidersAction *v10;
  objc_super v12;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D017D0];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setObject:forSetting:", &unk_1E1A9A158, 1);
  objc_msgSend(v9, "setObject:forSetting:", v8, 2);

  if (v6)
    objc_msgSend(v9, "setObject:forSetting:", v6, 3);
  v12.receiver = self;
  v12.super_class = (Class)UIOpenItemProvidersAction;
  v10 = -[UIOpenItemProvidersAction initWithInfo:responder:](&v12, sel_initWithInfo_responder_, v9, 0);

  return v10;
}

- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3
{
  return -[UIOpenItemProvidersAction initWithDragContinuationEndpoint:userInfo:](self, "initWithDragContinuationEndpoint:userInfo:", a3, 0);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_1E16E0050[a3 - 1];
}

- (int64_t)UIActionType
{
  return 59;
}

- (unint64_t)providerSource
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIOpenItemProvidersAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)continuationEndpoint
{
  void *v2;
  void *v3;

  -[UIOpenItemProvidersAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userInfo
{
  void *v2;
  void *v3;

  -[UIOpenItemProvidersAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
