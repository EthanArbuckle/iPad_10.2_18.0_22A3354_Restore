@implementation SALCMContentList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentList");
}

+ (id)contentList
{
  return objc_alloc_init((Class)a1);
}

@end
