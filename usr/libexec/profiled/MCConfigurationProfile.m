@implementation MCConfigurationProfile

- (id)createHandler
{
  return -[MCConfigurationProfileHandler initWithProfile:]([MCConfigurationProfileHandler alloc], "initWithProfile:", self);
}

@end
