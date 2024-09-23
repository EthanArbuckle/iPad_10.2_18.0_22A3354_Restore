@implementation UISystemShellAllowsSceneRequests

void ___UISystemShellAllowsSceneRequests_block_invoke()
{
  void *v0;
  id v1;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationInitializationContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  byte_1EDDC801A = objc_msgSend(v1, "supportAppSceneRequests");
}

@end
