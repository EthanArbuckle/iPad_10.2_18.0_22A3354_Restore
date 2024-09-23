@implementation UICanExcludeExtensionActivities

void ___UICanExcludeExtensionActivities_block_invoke()
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
    v3 = (id)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.excludes-extensions"), 0);
    CFRelease(v2);
    _UICanExcludeExtensionActivities_hostHasEntitlement = objc_msgSend(v3, "BOOLValue");

  }
}

@end
