@implementation RemoteUILibraryCore

uint64_t __RemoteUILibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  RemoteUILibraryCore_frameworkLibrary = result;
  return result;
}

@end
