@implementation UIScreenIsFrontBoard

void ___UIScreenIsFrontBoard_block_invoke()
{
  const __CFAllocator *Default;
  __SecTask *v1;
  __SecTask *v2;
  void *v3;
  id v4;

  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    v4 = (id)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.private.xpc.launchd.app-server"), 0);
    byte_1ECD7992A = objc_msgSend(v4, "BOOLValue");
    if ((byte_1ECD7992A & 1) == 0)
    {
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.assertiond.system-shell"), 0);

      byte_1ECD7992A = objc_msgSend(v3, "BOOLValue");
      v4 = v3;
    }
    CFRelease(v2);

  }
}

@end
