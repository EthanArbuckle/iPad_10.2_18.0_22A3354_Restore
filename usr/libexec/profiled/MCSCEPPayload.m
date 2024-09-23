@implementation MCSCEPPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewSCEPPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCNewSCEPPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
