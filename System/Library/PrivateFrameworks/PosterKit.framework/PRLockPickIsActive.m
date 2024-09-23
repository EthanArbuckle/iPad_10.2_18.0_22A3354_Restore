@implementation PRLockPickIsActive

void __PRLockPickIsActive_block_invoke()
{
  uint64_t v0;
  char v1;
  void *v2;
  uint64_t v3;
  char v5;

  v0 = PFCurrentDeviceClass();
  v1 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homeButtonType");

  if (v0 != 1 && v3 == 2)
    v5 = v1;
  else
    v5 = 0;
  PRLockPickIsActive_lockPickIsActive = v5;
}

@end
