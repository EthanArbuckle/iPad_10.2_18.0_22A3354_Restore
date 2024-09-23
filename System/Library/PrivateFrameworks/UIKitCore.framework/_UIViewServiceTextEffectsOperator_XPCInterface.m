@implementation _UIViewServiceTextEffectsOperator_XPCInterface

- (id)exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE054598);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel___setHostAllowedNotifications_, 0, 0);

  return v2;
}

- (id)hostObjectInterface
{
  return 0;
}

- (id)connectionProtocol
{
  return &unk_1EE0CF308;
}

- (SEL)connectionSelector
{
  return sel___connectToTextEffectsOperatorFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:](_UIViewServiceDeputyXPCInterfaceInvocationFactory, "invocationForConnectionSelector:", self);
}

@end
