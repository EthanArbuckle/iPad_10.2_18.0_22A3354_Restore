@implementation MCCertificateWrapperProfile

- (id)createHandler
{
  return -[MCConfigurationProfileHandler initWithProfile:]([MCCertificateWrapperProfileHandler alloc], "initWithProfile:", self);
}

@end
