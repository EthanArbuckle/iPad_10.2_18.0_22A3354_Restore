@implementation NSMutableArray(RemoteUIAdditions)

- (void)_remoteUI_addObjectIfNotNil:()RemoteUIAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
