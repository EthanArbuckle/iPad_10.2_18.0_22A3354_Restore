@implementation NSData(IMJSONSerializableValueProviding)

- (uint64_t)im_jsonSerializableValue
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
}

@end
