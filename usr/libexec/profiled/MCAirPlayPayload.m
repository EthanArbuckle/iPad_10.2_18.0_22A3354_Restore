@implementation MCAirPlayPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCAirPlayPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCAirPlayPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
