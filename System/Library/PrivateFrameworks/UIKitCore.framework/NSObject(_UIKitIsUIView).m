@implementation NSObject(_UIKitIsUIView)

- (uint64_t)__isKindOfUIView
{
  return 0;
}

- (uint64_t)__isKindOfUIWindow
{
  return 0;
}

@end
