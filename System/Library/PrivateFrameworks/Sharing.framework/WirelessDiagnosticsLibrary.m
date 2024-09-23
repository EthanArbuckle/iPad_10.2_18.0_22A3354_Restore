@implementation WirelessDiagnosticsLibrary

void *__WirelessDiagnosticsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WirelessDiagnostics.framework/WirelessDiagnostics", 2);
  WirelessDiagnosticsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
