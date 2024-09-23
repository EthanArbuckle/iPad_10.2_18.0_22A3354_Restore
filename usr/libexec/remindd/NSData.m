@implementation NSData

- (id)ic_stringValue
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", self, 4);
}

@end
