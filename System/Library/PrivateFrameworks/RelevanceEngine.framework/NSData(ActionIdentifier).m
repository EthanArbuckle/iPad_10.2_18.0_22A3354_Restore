@implementation NSData(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  return REHashDataUInt64(objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"));
}

@end
