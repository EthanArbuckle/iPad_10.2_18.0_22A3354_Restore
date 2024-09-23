@implementation GameControllerDaemonAnalytics

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  AnalyticsSendEvent(a3, a4);
}

- (void)sendEvent:(id)a3 withXPCPayload:(id)a4
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  analytics_send_event(objc_msgSend(v5, "UTF8String"), v6);

}

- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  return AnalyticsSendEventLazy(a3, a4);
}

- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  LOBYTE(v5) = analytics_send_event_lazy(objc_msgSend(v5, "UTF8String"), v6);

  return (char)v5;
}

@end
