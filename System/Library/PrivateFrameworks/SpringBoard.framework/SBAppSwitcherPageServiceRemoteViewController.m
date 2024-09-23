@implementation SBAppSwitcherPageServiceRemoteViewController

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCB46B0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEB4BF8);
}

@end
