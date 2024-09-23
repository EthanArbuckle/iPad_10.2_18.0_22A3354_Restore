@implementation MobileTimerLibrary

void *__MobileTimerLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib = (uint64_t)result;
  return result;
}

void *__MobileTimerLibrary_block_invoke_127()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_126 = (uint64_t)result;
  return result;
}

void *__MobileTimerLibrary_block_invoke_871()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_870 = (uint64_t)result;
  return result;
}

void *__MobileTimerLibrary_block_invoke_929()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_927 = (uint64_t)result;
  return result;
}

@end
