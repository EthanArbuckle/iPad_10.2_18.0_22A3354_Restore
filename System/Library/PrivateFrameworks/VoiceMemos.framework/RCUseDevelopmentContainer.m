@implementation RCUseDevelopmentContainer

void __RCUseDevelopmentContainer_block_invoke()
{
  id v0;

  if (RCIsInternalInstall_onceToken != -1)
    dispatch_once(&RCIsInternalInstall_onceToken, &__block_literal_global_142);
  if (RCIsInternalInstall_isInternalInstall)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    RCUseDevelopmentContainer_developmentContainerEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("RCUseDevelopmentContainer"));

  }
  else
  {
    RCUseDevelopmentContainer_developmentContainerEnabled = 0;
  }
}

@end
