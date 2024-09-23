@implementation PLPlatformSearchSupported

void __PLPlatformSearchSupported_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PLPlatformSearchSupported_searchSupported = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLSearchIndexDisabled")) ^ 1;

}

@end
