@implementation LoadSetupAssistant

void *__LoadSetupAssistant_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  qword_1EE1DB710 = (uint64_t)result;
  return result;
}

@end
