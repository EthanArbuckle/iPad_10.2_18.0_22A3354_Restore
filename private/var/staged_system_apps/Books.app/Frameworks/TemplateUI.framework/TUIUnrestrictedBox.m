@implementation TUIUnrestrictedBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIRestrictedLayout, a2);
}

@end
