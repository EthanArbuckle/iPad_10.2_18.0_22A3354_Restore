@implementation NSMutableArray(SpringBoard)

- (void)_sb_safeAddObject:()SpringBoard
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
