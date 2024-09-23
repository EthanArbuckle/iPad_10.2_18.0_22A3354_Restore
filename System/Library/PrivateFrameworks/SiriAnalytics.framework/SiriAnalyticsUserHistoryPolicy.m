@implementation SiriAnalyticsUserHistoryPolicy

- (SiriAnalyticsUserHistoryPolicy)initWithMessageStaging:(id)a3 queue:(id)a4
{
  return (SiriAnalyticsUserHistoryPolicy *)UserHistoryPolicyShim.init(messageStaging:queue:)((char *)a3, a4);
}

- (void)startObserving
{
  SiriAnalyticsUserHistoryPolicy *v2;

  v2 = self;
  sub_1A02BB1F0();

}

- (SiriAnalyticsUserHistoryPolicy)init
{
  UserHistoryPolicyShim.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
