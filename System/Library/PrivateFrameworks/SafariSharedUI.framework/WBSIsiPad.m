@implementation WBSIsiPad

void __WBSIsiPad_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D8A108], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  WBSIsiPad::isiPad = objc_msgSend(v0, "deviceClass") == 3;

}

@end
