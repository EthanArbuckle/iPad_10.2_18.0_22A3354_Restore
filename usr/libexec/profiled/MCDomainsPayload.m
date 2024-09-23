@implementation MCDomainsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCDomainsPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCDomainsPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
