@implementation NSMutableSet(VKFoundationUtility)

+ (CFMutableSetRef)_vk_newWeakSet
{
  CFSetCallBacks v1;

  v1.version = 0;
  v1.retain = (CFSetRetainCallBack)_weakSetRetain;
  v1.release = (CFSetReleaseCallBack)_weakSetRelease;
  v1.copyDescription = (CFSetCopyDescriptionCallBack)_weakSetDescription;
  v1.equal = (CFSetEqualCallBack)_weakSetEqual;
  v1.hash = (CFSetHashCallBack)_weakSetHash;
  return CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v1);
}

@end
