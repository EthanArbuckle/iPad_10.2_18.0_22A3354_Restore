@implementation MCRelayPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCRelayPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCRelayPayloadHandler initWithPayload:profileHandler:]([MCRelayPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
