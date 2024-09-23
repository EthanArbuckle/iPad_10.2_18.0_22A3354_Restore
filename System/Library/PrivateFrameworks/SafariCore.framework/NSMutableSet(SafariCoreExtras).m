@implementation NSMutableSet(SafariCoreExtras)

- (void)safari_setObject:()SafariCoreExtras
{
  CFSetSetValue(a1, value);
}

- (void)safari_addObjectUnlessNil:()SafariCoreExtras
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
