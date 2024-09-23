@implementation MCDefaultsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewDefaultsPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewDefaultsPayloadHandler initWithPayload:profileHandler:]([MCNewDefaultsPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
