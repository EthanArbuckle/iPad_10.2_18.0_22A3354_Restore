@implementation MCPlainCertificatePayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4;
  MCNewPlainCertificatePayloadHandler *v5;

  v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]([MCNewPlainCertificatePayloadHandler alloc], "initWithPayload:profileHandler:", self, v4);

  return v5;
}

@end
