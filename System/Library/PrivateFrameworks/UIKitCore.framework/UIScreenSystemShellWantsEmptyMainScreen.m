@implementation UIScreenSystemShellWantsEmptyMainScreen

void ___UIScreenSystemShellWantsEmptyMainScreen_block_invoke()
{
  const __CFAllocator *Default;
  __SecTask *v1;
  __SecTask *v2;
  id v3;

  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    v3 = (id)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.UIKit.system-shell-wants-empty-main-screen"), 0);
    byte_1ECD7992B = objc_msgSend(v3, "BOOLValue");
    CFRelease(v2);

  }
}

@end
