@implementation PSApplicationSpecifierForAssistantSection

void __PSApplicationSpecifierForAssistantSection_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  PSBundlePathForPreferenceBundle((uint64_t)CFSTR("AssistantSettings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  SFRuntimeAbsoluteFilePathForPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "load");
  PSApplicationSpecifierForAssistantSection_sAssistantCellClass = (uint64_t)NSClassFromString(CFSTR("AssistantCell"));
  PSApplicationSpecifierForAssistantSection_sDetailClass = (uint64_t)NSClassFromString(CFSTR("AssistantDetailController"));

}

@end
