@implementation UISceneHitTestActionResponse

- (UISceneHitTestActionResponse)initWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  UISceneHitTestActionResponse *v7;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)UISceneHitTestActionResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v5, 0);

  return v7;
}

- (int)processIdentifer
{
  void *v2;
  void *v3;
  int v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

@end
