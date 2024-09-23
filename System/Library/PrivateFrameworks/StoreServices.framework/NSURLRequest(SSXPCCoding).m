@implementation NSURLRequest(SSXPCCoding)

- (id)initWithXPCEncoding:()SSXPCCoding
{
  uint64_t v5;
  id NSSecureCodingObjectForXPCObject;

  v5 = objc_opt_class();
  NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v5);

  return NSSecureCodingObjectForXPCObject;
}

@end
