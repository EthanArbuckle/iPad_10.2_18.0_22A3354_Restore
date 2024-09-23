@implementation PF

void __PF_IS_PAD_DEVICE_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PF_IS_PAD_DEVICE_isPad = objc_msgSend(v0, "deviceClass") == 2;

}

@end
