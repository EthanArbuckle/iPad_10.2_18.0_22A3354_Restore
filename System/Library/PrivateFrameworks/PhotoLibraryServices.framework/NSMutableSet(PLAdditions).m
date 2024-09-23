@implementation NSMutableSet(PLAdditions)

- (void)pl_addObjectIfNotNil:()PLAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
