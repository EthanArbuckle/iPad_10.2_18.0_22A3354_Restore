@implementation MCVPNPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewVPNPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCVPNPayloadHandlerBase initWithPayload:profileHandler:]([MCNewVPNPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
