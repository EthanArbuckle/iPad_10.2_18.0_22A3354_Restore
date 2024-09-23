@implementation MCCertificateTransparencyPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCCertificateTransparencyPayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCCertificateTransparencyPayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
