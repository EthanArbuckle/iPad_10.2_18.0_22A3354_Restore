@implementation UIViewControllerDefinesBarBackgroundGroupName

void ___UIViewControllerDefinesBarBackgroundGroupName_block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.hulu.plus"), CFSTR("com.chipotle.Chipotle"), CFSTR("photo.glass.ios"), CFSTR("com.apple.RealityComposer"), CFSTR("com.yinzcam.49ersGamedayLive"), CFSTR("com.barclaycardus.iphonesvc"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v0))
  {
    v1 = dyld_program_sdk_at_least();

    v2 = v3;
    if ((v1 & 1) == 0)
      byte_1EDDB0F7B = 1;
  }
  else
  {

    v2 = v3;
  }

}

@end
