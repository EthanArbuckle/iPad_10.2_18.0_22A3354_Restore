@implementation REDeviceScreenScale

void __REDeviceScreenScale_block_invoke()
{
  int v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  objc_msgSend(v1, "floatValue");
  REDeviceScreenScale_ScreenScale = v0;

}

@end
