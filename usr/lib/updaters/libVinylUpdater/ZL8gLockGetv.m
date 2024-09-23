@implementation ZL8gLockGetv

pthread_mutex_t *___ZL8gLockGetv_block_invoke()
{
  pthread_mutex_t *v0;
  pthread_mutex_t *result;

  v0 = (pthread_mutex_t *)operator new(0x40uLL);
  result = BBUpdaterCommon::BBUMutex::BBUMutex(v0, "logging");
  gLockGet(void)::_gLock = (uint64_t)v0;
  return result;
}

@end
