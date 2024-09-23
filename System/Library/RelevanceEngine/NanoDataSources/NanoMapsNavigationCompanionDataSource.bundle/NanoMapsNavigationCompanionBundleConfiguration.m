@implementation NanoMapsNavigationCompanionBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE7D100]))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

@end
