@implementation LoadSetupAssistantUI

void *__LoadSetupAssistantUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistantUI.framework/SetupAssistantUI", 2);
  LoadSetupAssistantUI_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
