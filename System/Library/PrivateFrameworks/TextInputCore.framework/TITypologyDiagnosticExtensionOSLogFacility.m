@implementation TITypologyDiagnosticExtensionOSLogFacility

void __TITypologyDiagnosticExtensionOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "TITypologyDiagnosticExtension");
  v1 = (void *)TITypologyDiagnosticExtensionOSLogFacility_logFacility;
  TITypologyDiagnosticExtensionOSLogFacility_logFacility = (uint64_t)v0;

}

@end
