@implementation AXUtilsBackBoardServer

void __AXUtilsBackBoardServer_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", AXSAccessibilityUtilitiesPath());
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");

}

@end
