@implementation PSApplicationSpecifierForSearchSection

void __PSApplicationSpecifierForSearchSection_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  PSBundlePathForPreferenceBundle((uint64_t)CFSTR("SpotlightSetting"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  SFRuntimeAbsoluteFilePathForPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "load");
  PSApplicationSpecifierForSearchSection_sSearchCellClass = (uint64_t)NSClassFromString(CFSTR("SpotlightCell"));
  PSApplicationSpecifierForSearchSection_sDetailClass = (uint64_t)NSClassFromString(CFSTR("SpotlightDetailController"));

}

@end
