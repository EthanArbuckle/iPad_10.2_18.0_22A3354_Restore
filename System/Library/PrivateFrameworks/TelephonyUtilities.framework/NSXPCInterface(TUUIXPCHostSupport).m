@implementation NSXPCInterface(TUUIXPCHostSupport)

+ (id)hostConnectionInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3AF130);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAllowedClassesForHostProtocol");
  return v0;
}

+ (id)remoteObjectInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B6C18);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAllowedClassesForClientInterface");
  return v0;
}

- (void)setAllowedClassesForHostProtocol
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_shouldHostHandleMRCommand_completion_, 1, 1);

}

@end
