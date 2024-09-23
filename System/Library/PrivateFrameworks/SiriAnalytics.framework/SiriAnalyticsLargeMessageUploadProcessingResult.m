@implementation SiriAnalyticsLargeMessageUploadProcessingResult

- (BOOL)determinationMade
{
  return LargeMessageUploadProcessingResult.determinationMade.getter() & 1;
}

- (BOOL)suppressed
{
  return LargeMessageUploadProcessingResult.suppressed.getter() & 1;
}

- (SiriAnalyticsLargeMessageUploadProcessingResult)init
{
  LargeMessageUploadProcessingResult.init()();
}

@end
