@implementation UISTouchAuthenticationTelemetryShouldReportBundleID

void ___UISTouchAuthenticationTelemetryShouldReportBundleID_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deviceIdentifierForVendor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getUUIDBytes:", &unk_1ECDA5910);

}

@end
