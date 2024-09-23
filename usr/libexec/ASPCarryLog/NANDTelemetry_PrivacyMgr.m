@implementation NANDTelemetry_PrivacyMgr

- (BOOL)allowTelemetry
{
  if ((os_variant_has_factory_content("com.apple.ASPCarryLog", a2) & 1) != 0)
    return 0;
  if ((os_variant_is_darwinos("com.apple.ASPCarryLog") & 1) != 0)
    return 1;
  return DiagnosticLogSubmissionEnabled();
}

@end
