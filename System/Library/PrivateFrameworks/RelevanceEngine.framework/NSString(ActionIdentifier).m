@implementation NSString(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  return REHashString(a1);
}

@end
