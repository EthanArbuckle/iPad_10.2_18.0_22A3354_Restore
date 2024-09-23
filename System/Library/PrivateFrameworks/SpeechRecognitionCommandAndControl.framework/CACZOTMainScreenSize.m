@implementation CACZOTMainScreenSize

void __CACZOTMainScreenSize_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  CACZOTMainScreenSize_ScreenSize_0 = v0;
  CACZOTMainScreenSize_ScreenSize_1 = v1;

}

@end
