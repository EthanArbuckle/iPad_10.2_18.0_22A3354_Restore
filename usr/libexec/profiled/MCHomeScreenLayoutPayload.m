@implementation MCHomeScreenLayoutPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCHomeScreenLayoutPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCHomeScreenLayoutPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
