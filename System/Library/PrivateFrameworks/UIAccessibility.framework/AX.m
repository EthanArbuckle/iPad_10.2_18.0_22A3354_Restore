@implementation AX

void __AX_USING_LEGACY_LOADER_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AX_USING_LEGACY_LOADER__UsesLegacyLoader = objc_msgSend(v0, "useNewAXBundleLoader") ^ 1;

}

@end
