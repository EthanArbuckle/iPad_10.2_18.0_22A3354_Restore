@implementation MCAppLayerVPNPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCAppLayerVPNHandler *v5;

  v4 = a3;
  v5 = -[MCVPNPayloadHandlerBase initWithPayload:profileHandler:]([MCAppLayerVPNHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
