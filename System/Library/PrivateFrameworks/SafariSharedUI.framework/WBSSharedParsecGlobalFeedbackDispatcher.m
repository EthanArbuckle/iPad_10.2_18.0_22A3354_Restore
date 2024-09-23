@implementation WBSSharedParsecGlobalFeedbackDispatcher

void __WBSSharedParsecGlobalFeedbackDispatcher_block_invoke()
{
  WBSParsecDSession *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WBSParsecDSession alloc];
  +[WBSParsecDSession sharedPARSession](WBSParsecDSession, "sharedPARSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WBSParsecDSession initWithParsecdSession:skipAutoFillDataUpdates:](v0, "initWithParsecdSession:skipAutoFillDataUpdates:");
  v2 = (void *)WBSSharedParsecGlobalFeedbackDispatcher::feedbackParsecDSession;
  WBSSharedParsecGlobalFeedbackDispatcher::feedbackParsecDSession = v1;

}

@end
