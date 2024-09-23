@implementation SoftwareUpdateSSOlogFault

void __SoftwareUpdateSSOlogFault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SoftwareUpdateSSO", "Fault");
  v1 = (void *)SoftwareUpdateSSOlogFault_infoFault;
  SoftwareUpdateSSOlogFault_infoFault = (uint64_t)v0;

}

@end
