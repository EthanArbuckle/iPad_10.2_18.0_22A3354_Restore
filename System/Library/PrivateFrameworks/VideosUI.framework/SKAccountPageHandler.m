@implementation SKAccountPageHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance_sSharedInstance;
}

void __38__SKAccountPageHandler_sharedInstance__block_invoke()
{
  SKAccountPageHandler *v0;
  void *v1;

  v0 = objc_alloc_init(SKAccountPageHandler);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter: SKAccountPageViewController finished", v7, 2u);
  }

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURLHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsFinished:", 1);

  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
