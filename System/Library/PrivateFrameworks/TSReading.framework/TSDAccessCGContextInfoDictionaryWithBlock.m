@implementation TSDAccessCGContextInfoDictionaryWithBlock

uint64_t __TSDAccessCGContextInfoDictionaryWithBlock_block_invoke()
{
  return pthread_rwlock_init(&TSDAccessCGContextInfoDictionaryWithBlock_rwlock, 0);
}

@end
