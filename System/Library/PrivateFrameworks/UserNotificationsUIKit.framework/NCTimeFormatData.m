@implementation NCTimeFormatData

void __46___NCTimeFormatData__timeFormatDataAccessLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_timeFormatDataAccessLock_accessLock;
  _timeFormatDataAccessLock_accessLock = (uint64_t)v0;

}

@end
