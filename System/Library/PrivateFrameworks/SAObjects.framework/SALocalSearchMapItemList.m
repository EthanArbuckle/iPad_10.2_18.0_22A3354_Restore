@implementation SALocalSearchMapItemList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("MapItemList");
}

+ (id)mapItemList
{
  return objc_alloc_init((Class)a1);
}

@end
