@implementation _UIViewControllerControlMessageDeputyXPCInterface

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE054320);
}

- (id)hostObjectInterface
{
  return 0;
}

- (id)connectionProtocol
{
  return &unk_1EE0CF488;
}

- (SEL)connectionSelector
{
  return sel___connectToViewControllerControlMessageDeputyFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:](_UIViewServiceDeputyXPCInterfaceInvocationFactory, "invocationForConnectionSelector:", self);
}

@end
