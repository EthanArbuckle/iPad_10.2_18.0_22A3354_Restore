@implementation RMStoreLocalizable

+ (id)_bundle
{
  if (_bundle_once != -1)
    dispatch_once(&_bundle_once, &__block_literal_global_13);
  return (id)_bundle_bundle;
}

void __29__RMStoreLocalizable__bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundle_bundle;
  _bundle_bundle = v0;

}

+ (id)string:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
