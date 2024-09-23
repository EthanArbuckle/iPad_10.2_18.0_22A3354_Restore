@implementation SBSServerPortHelper

void __SBSServerPortHelper_block_invoke()
{
  void *v0;
  int v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  SBSServerPortHelper_isAppleTV = v1 == 4;
}

@end
