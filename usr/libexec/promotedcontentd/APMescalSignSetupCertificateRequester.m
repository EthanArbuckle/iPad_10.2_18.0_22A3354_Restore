@implementation APMescalSignSetupCertificateRequester

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBMescalSignSAPSetupCertificateResponse, a2);
}

- (id)protoBuffer
{
  return objc_alloc_init(APPBMescalSignSAPSetupCertificateRequest);
}

@end
