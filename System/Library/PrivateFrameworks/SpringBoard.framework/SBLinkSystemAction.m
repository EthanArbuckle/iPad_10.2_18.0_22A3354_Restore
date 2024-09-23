@implementation SBLinkSystemAction

- (id)newExecutor
{
  return -[SBLinkSystemActionExecutor initWithSystemAction:]([SBLinkSystemActionExecutor alloc], "initWithSystemAction:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBLinkSystemAction;
  if (-[SBSystemAction isEqual:](&v8, sel_isEqual_, v4))
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
