@implementation UISDeviceContext(ForPreviewsOnly)

+ (id)_loadedInitialContext
{
  void *v0;
  void *v1;
  void *v2;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationInitializationContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deviceContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
