@implementation NSString(Empty)

- (BOOL)isEmpty
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), "length") == 0;
}

@end
