@implementation NSString(ContentRanking)

- (id)contentEncodedString
{
  return (id)objc_msgSend(a1, "copy");
}

@end
