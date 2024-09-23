@implementation NSMutableArray(PSAdditions)

- (void)ps_addPossibleObject:()PSAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
