@implementation MCChaperonePayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewChaperonePayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCNewChaperonePayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
