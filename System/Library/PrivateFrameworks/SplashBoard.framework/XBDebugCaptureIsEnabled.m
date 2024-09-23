@implementation XBDebugCaptureIsEnabled

void ___XBDebugCaptureIsEnabled_block_invoke()
{
  char v0;
  id v1;

  CFPreferencesSynchronize(CFSTR("com.apple.splashboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v1 = (id)CFPreferencesCopyAppValue(CFSTR("_XBEncodeGeneratedInterfaces"), CFSTR("com.apple.splashboard"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v0 = objc_msgSend(v1, "BOOLValue");
  else
    v0 = 0;
  _XBDebugCaptureIsEnabled_sEncodingEnabled = v0;

}

@end
