@implementation NSData

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "copy");
}

- (id)serializeWithError:(id *)a3
{
  return -[NSData copy](self, "copy", a3);
}

@end
