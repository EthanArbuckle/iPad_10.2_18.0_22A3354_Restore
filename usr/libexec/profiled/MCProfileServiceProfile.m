@implementation MCProfileServiceProfile

- (id)createHandler
{
  return -[MCProfileServiceProfileHandler initWithProfile:]([MCProfileServiceProfileHandler alloc], "initWithProfile:", self);
}

@end
