@implementation SDAuthenticationRegistrationManager

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)*(id *)&self->queue[3];
}

- (void)handleKeyBagStateChanged
{
  swift_retain(self);
  sub_1002C9C3C();
  swift_release(self);
}

@end
