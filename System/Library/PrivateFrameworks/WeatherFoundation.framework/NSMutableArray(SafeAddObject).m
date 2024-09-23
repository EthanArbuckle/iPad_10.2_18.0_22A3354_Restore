@implementation NSMutableArray(SafeAddObject)

- (void)wf_safelyAddObject:()SafeAddObject
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
