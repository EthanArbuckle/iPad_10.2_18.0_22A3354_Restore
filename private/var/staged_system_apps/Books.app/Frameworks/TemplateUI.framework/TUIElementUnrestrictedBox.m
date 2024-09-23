@implementation TUIElementUnrestrictedBox

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIUnrestrictedBox, a2);
}

@end
