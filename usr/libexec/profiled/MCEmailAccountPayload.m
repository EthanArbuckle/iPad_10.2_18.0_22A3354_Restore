@implementation MCEmailAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewEmailAccountPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewEmailAccountPayloadHandler initWithPayload:profileHandler:]([MCNewEmailAccountPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
