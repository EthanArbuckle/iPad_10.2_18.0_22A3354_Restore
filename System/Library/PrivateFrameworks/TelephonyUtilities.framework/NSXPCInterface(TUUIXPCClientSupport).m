@implementation NSXPCInterface(TUUIXPCClientSupport)

- (void)setAllowedClassesForHostProtocol
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_shouldHostHandleMRCommand_completion_, 1, 1);

}

+ (id)hostInterface
{
  if (hostInterface_onceToken != -1)
    dispatch_once(&hostInterface_onceToken, &__block_literal_global_17);
  return (id)hostInterface_interface;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_57);
  return (id)clientInterface_interface;
}

@end
