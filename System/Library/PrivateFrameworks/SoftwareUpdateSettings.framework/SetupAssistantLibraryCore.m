@implementation SetupAssistantLibraryCore

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

@end
