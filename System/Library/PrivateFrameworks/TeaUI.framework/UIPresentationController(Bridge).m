@implementation UIPresentationController(Bridge)

+ (id)ts_presentationTransitionDidEndNotification
{
  return (id)*MEMORY[0x1E0DC5228];
}

+ (id)ts_dismissalTransitionDidEndNotification
{
  return (id)*MEMORY[0x1E0DC5218];
}

@end
