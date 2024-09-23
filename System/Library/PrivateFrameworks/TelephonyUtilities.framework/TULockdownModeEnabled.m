@implementation TULockdownModeEnabled

void __TULockdownModeEnabled_block_invoke()
{
  id v0;

  if (getLockdownModeManagerClass())
  {
    objc_msgSend(getLockdownModeManagerClass(), "shared");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    TULockdownModeEnabled_lockdownModeEnabled = objc_msgSend(v0, "enabled");

  }
}

@end
