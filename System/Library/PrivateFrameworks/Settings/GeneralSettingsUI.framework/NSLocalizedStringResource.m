@implementation NSLocalizedStringResource

id __84___NSLocalizedStringResource_GeneralNavigationComponents__general_rootPaneComponent__block_invoke()
{
  if (_block_invoke_na_once_token_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0, &__block_literal_global_2);
  return (id)_block_invoke_na_once_object_0;
}

void __84___NSLocalizedStringResource_GeneralNavigationComponents__general_rootPaneComponent__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithKey:table:locale:bundleURL:", CFSTR("General"), CFSTR("General"), v5, v2);
  v4 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = v3;

}

id __85___NSLocalizedStringResource_GeneralNavigationComponents__general_aboutPaneComponent__block_invoke()
{
  if (_block_invoke_2_na_once_token_1 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_1, &__block_literal_global_6);
  return (id)_block_invoke_2_na_once_object_1;
}

void __85___NSLocalizedStringResource_GeneralNavigationComponents__general_aboutPaneComponent__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithKey:table:locale:bundleURL:", CFSTR("About"), CFSTR("General"), v5, v2);
  v4 = (void *)_block_invoke_2_na_once_object_1;
  _block_invoke_2_na_once_object_1 = v3;

}

@end
