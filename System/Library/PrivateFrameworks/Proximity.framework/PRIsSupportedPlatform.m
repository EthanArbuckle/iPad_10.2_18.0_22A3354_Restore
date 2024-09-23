@implementation PRIsSupportedPlatform

void __PRIsSupportedPlatform_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  PRIsSupportedPlatform::supported = objc_msgSend(v0, "BOOLValue");

}

@end
