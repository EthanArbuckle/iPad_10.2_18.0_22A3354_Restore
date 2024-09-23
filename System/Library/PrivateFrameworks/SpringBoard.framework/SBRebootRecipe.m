@implementation SBRebootRecipe

- (id)title
{
  return CFSTR("Reboot");
}

- (void)handleVolumeIncrease
{
  void *v2;
  SBRebootContext *v3;

  v3 = -[SBRebootContext initWithReason:]([SBRebootContext alloc], "initWithReason:", CFSTR("TestRecipe"));
  -[SBRebootContext setDark:](v3, "setDark:", 1);
  objc_msgSend((id)SBApp, "restartManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootWithContext:", v3);

}

- (void)handleVolumeDecrease
{
  id v2;

  objc_msgSend((id)SBApp, "restartManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootForReason:", CFSTR("TestRecipe"));

}

@end
