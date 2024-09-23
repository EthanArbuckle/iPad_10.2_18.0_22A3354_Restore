@implementation NSLocalizedStringResource

id __76___NSLocalizedStringResource_SHSNavigationComponents__shs_rootPaneComponent__block_invoke()
{
  if (_block_invoke_na_once_token_6 != -1)
    dispatch_once(&_block_invoke_na_once_token_6, &__block_literal_global_2);
  return (id)_block_invoke_na_once_object_6;
}

void __76___NSLocalizedStringResource_SHSNavigationComponents__shs_rootPaneComponent__block_invoke_2()
{
  id v0;
  const __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x24BDD19B8]);
  if (MGGetBoolAnswer())
    v1 = CFSTR("SOUNDS_AND_HAPTICS");
  else
    v1 = CFSTR("Sounds");
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithKey:table:locale:bundleURL:", v1, CFSTR("Sounds"), v6, v3);
  v5 = (void *)_block_invoke_na_once_object_6;
  _block_invoke_na_once_object_6 = v4;

}

@end
