@implementation MCEASAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewEASAccountPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCNewEASAccountPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
