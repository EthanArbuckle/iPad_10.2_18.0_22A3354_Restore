@implementation UIWindow(TRAArbiterExtensions)

- (id)sb_traitsParticipant
{
  return objc_getAssociatedObject(a1, sel_sb_traitsParticipant);
}

- (void)sb_setTraitsParticipant:()TRAArbiterExtensions
{
  objc_setAssociatedObject(a1, sel_sb_traitsParticipant, a3, (void *)1);
}

@end
