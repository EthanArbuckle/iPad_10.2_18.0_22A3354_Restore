@implementation MCWiFiPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewWiFiPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewWiFiPayloadHandler initWithPayload:profileHandler:]([MCNewWiFiPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
