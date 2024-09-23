@implementation SAMicroblogMicroblogSearchResultUser

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("MicroblogSearchResultUser");
}

+ (id)microblogSearchResultUser
{
  return objc_alloc_init((Class)a1);
}

@end
