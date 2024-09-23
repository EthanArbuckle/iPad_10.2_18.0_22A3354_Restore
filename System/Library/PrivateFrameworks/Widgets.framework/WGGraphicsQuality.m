@implementation WGGraphicsQuality

void ___WGGraphicsQuality_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _WGGraphicsQuality___graphicsQuality = objc_msgSend(v0, "_graphicsQuality");

  if (_WGGraphicsQuality___graphicsQuality == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_UIDeviceGraphicsQuality _WGGraphicsQuality(void)_block_invoke");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WGUtilities.m"), 28, CFSTR("Failed to initialized graphics quality!"));

  }
}

@end
