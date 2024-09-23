@implementation MCGmailAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCGmailAccountPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCGmailAccountPayloadHandler initWithPayload:profileHandler:]([MCGmailAccountPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
