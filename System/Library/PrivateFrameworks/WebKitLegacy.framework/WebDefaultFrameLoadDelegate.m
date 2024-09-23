@implementation WebDefaultFrameLoadDelegate

+ (id)sharedFrameLoadDelegate
{
  id result;

  result = (id)sharedFrameLoadDelegate_sharedDelegate;
  if (!sharedFrameLoadDelegate_sharedDelegate)
  {
    result = objc_alloc_init(WebDefaultFrameLoadDelegate);
    sharedFrameLoadDelegate_sharedDelegate = (uint64_t)result;
  }
  return result;
}

@end
