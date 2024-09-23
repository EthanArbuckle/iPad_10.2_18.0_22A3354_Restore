@implementation MDAgent

+ (id)sharedAgent
{
  if (sharedAgent_onceToken != -1)
    dispatch_once(&sharedAgent_onceToken, &__block_literal_global_1);
  return (id)sharedAgent_sMDAgent;
}

void __22__MDAgent_sharedAgent__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedAgent_sMDAgent;
  sharedAgent_sMDAgent = v0;

}

- (void)handleLogOut
{
  raise(15);
}

- (MDAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MDAgent;
  return -[MDAgent init](&v3, sel_init);
}

@end
