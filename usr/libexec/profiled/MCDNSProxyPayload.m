@implementation MCDNSProxyPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCDNSProxyPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCDNSProxyPayloadHandler initWithPayload:profileHandler:]([MCDNSProxyPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
