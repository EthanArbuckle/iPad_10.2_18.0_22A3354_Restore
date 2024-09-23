@implementation UIResponderCrossSceneResponderChainEnabled

void ___UIResponderCrossSceneResponderChainEnabled_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.goodnotesapp.x"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", v0))
    v1 = dyld_program_sdk_at_least();
  else
    v1 = 1;

  byte_1ECD7F859 = _os_feature_enabled_impl() & v1;
}

@end
