@implementation SVXAssistantSiriAnalyticsProvider

- (id)get
{
  return (id)objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
}

@end
