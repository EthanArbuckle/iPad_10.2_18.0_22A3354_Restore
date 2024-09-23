@implementation SBXXPresentPowerDownUI

void ___SBXXPresentPowerDownUI_block_invoke()
{
  id v0;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "presentPowerDownTransientOverlay");

}

@end
