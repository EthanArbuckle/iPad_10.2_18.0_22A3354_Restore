@implementation UIApplication(PXNotificationSuppressionContextManager)

- (id)notificationSuppressionContextManager
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EEBEB0D8))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

@end
