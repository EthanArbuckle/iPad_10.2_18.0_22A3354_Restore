@implementation NSNumber(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "unsignedLongLongValue");
  return REHashDataUInt64((uint64_t)&v2, 8);
}

@end
