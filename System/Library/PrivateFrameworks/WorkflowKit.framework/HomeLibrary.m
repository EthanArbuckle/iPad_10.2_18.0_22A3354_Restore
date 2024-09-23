@implementation HomeLibrary

void *__HomeLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib = (uint64_t)result;
  return result;
}

void *__HomeLibrary_block_invoke_25032()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_25034 = (uint64_t)result;
  return result;
}

void *__HomeLibrary_block_invoke_31078()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_31080 = (uint64_t)result;
  return result;
}

void *__HomeLibrary_block_invoke_33846()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_33848 = (uint64_t)result;
  return result;
}

@end
