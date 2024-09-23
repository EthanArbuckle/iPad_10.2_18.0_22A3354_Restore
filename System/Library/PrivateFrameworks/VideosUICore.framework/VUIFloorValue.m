@implementation VUIFloorValue

void __VUIFloorValue_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_nativeScale");
  VUIFloorValue_sDisplayScale = v0;

}

@end
