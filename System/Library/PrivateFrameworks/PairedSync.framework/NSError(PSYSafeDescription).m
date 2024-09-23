@implementation NSError(PSYSafeDescription)

- (id)psy_safeDescription
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
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
    v6 = objc_msgSend(a1, "code");
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("class=%@ code=%lld domain=%@"), v5, v6, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
