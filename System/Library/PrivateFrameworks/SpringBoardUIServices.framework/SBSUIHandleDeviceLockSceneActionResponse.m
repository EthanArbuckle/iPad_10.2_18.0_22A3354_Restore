@implementation SBSUIHandleDeviceLockSceneActionResponse

- (SBSUIHandleDeviceLockSceneActionResponse)initWithDeviceLockHandlingResult:(int64_t)a3 error:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  SBSUIHandleDeviceLockSceneActionResponse *v10;
  objc_super v12;

  v6 = (objc_class *)MEMORY[0x1E0D017D0];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 2);

  v12.receiver = self;
  v12.super_class = (Class)SBSUIHandleDeviceLockSceneActionResponse;
  v10 = -[BSActionResponse initWithInfo:error:](&v12, sel_initWithInfo_error_, v8, v7);

  return v10;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2)
    return CFSTR("deviceLockHandlingResult");
  else
    return 0;
}

- (int64_t)deviceLockHandlingResult
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
