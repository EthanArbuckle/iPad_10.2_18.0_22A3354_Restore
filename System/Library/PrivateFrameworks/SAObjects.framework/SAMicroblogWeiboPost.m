@implementation SAMicroblogWeiboPost

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("WeiboPost");
}

+ (id)weiboPost
{
  return objc_alloc_init((Class)a1);
}

@end
