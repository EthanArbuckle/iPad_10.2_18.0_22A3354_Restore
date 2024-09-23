@implementation SASettingSetUIGuidedAccess(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return objc_msgSend(a1, "dryRun") ^ 1;
}

@end
