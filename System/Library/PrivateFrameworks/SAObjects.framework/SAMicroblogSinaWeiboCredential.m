@implementation SAMicroblogSinaWeiboCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("SinaWeiboCredential");
}

+ (id)sinaWeiboCredential
{
  return objc_alloc_init((Class)a1);
}

@end
