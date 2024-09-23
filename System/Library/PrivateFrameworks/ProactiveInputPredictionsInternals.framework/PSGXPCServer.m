@implementation PSGXPCServer

+ (void)registerXPCListeners
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BE7A658];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "registerForService:delegate:", CFSTR("com.apple.proactive.input.suggester"), v3);

  v4 = (void *)MEMORY[0x24BE7A658];
  v5 = (id)objc_opt_new();
  objc_msgSend(v4, "registerForService:delegate:", CFSTR("com.apple.private.psg.internal"), v5);

}

@end
