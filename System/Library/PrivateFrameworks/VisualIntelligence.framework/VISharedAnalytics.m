@implementation VISharedAnalytics

void ___VISharedAnalytics_block_invoke()
{
  void *v0;
  VIAFeedbackSubmitter *v1;
  VIAnalytics *v2;
  void *v3;
  id v4;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("com.apple.mediaanalysisd"), CFSTR("VisualIntelligence/1"));
  objc_msgSend(MEMORY[0x1E0D177D8], "sharedPARSessionWithConfiguration:", v0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VIAFeedbackSubmitter initWithPARSession:]([VIAFeedbackSubmitter alloc], "initWithPARSession:", v4);
  v2 = -[VIAnalytics initWithFeedbackSubmitter:]([VIAnalytics alloc], "initWithFeedbackSubmitter:", v1);
  v3 = (void *)_VISharedAnalytics_analytics;
  _VISharedAnalytics_analytics = (uint64_t)v2;

}

@end
