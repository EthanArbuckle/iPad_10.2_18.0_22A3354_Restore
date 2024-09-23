@implementation MCGlobalEthernetPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCGlobalEthernetPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCGlobalEthernetPayloadHandler initWithPayload:profileHandler:]([MCGlobalEthernetPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
