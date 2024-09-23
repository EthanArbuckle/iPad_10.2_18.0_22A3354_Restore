@implementation NSUserActivity(UIKitSourceApplication_Private)

- (void)_setSourceApplication:()UIKitSourceApplication_Private
{
  objc_setAssociatedObject(a1, &kNSUserActivitySourceApplicationKey, a3, (void *)1);
}

- (void)_setOriginatingProcess:()UIKitSourceApplication_Private
{
  objc_setAssociatedObject(a1, &kNSUserActivityOriginatingProcessKey, a3, (void *)1);
}

@end
