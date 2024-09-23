@implementation UISceneKeyboardProxyLayerForwardingManager

void __61___UISceneKeyboardProxyLayerForwardingManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)qword_1ECD7CE18;
  qword_1ECD7CE18 = v0;

}

void __71___UISceneKeyboardProxyLayerForwardingManager_isRootSystemShellProcess__block_invoke()
{
  id v0;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_971 = objc_msgSend(v0, "usesLocalInitializationContext");

}

@end
