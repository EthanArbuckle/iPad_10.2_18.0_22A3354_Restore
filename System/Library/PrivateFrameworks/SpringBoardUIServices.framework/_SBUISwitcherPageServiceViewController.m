@implementation _SBUISwitcherPageServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7D2CA8);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B70B0);
}

@end
