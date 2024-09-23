@implementation WBSUnifiedFieldInputTypeForString

uint64_t __WBSUnifiedFieldInputTypeForString_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&WBSUnifiedFieldInputTypeForString::cacheKey, (void (__cdecl *)(void *))WBSUnifiedFieldInputTypeForString::Cache::destroy);
}

@end
