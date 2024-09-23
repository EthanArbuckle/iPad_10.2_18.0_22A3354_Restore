@implementation MCDNSSettingsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCDNSSettingsPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCDNSSettingsPayloadHandler initWithPayload:profileHandler:]([MCDNSSettingsPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
