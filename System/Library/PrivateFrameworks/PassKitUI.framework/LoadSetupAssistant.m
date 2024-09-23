@implementation LoadSetupAssistant

void *__LoadSetupAssistant_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  qword_1EE4F9058 = (uint64_t)result;
  return result;
}

void *__LoadSetupAssistant_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  qword_1EE4F91F8 = (uint64_t)result;
  return result;
}

@end
