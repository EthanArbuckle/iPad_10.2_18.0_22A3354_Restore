@implementation SHAnalytics

+ (void)sendEvent:(id)a3 withPayload:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __37__SHAnalytics_sendEvent_withPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
