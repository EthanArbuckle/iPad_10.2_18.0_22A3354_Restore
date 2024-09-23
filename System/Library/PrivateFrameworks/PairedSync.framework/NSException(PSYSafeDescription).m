@implementation NSException(PSYSafeDescription)

- (id)psy_safeDescription
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  if (_IsInternalInstall___onceToken != -1)
    dispatch_once(&_IsInternalInstall___onceToken, &__block_literal_global_3);
  if (_IsInternalInstall___internalInstall)
  {
    objc_msgSend(a1, "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("class=%@ name=%@ reason=%@"), v5, v6, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
