@implementation SBAlertItemTestRecipe

- (id)title
{
  return CFSTR("SBAlertItem Test");
}

- (void)handleVolumeIncrease
{
  void *v2;
  id v3;

  ++handleVolumeIncrease_count;
  +[SBTestAlertItem alertItemWithShowInLockScreen:forcesModal:superModal:](SBTestAlertItem, "alertItemWithShowInLockScreen:forcesModal:superModal:", 1, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Modal %d"), handleVolumeIncrease_count);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v2);

  objc_msgSend(v3, "setReappearsAfterLock:", 1);
  objc_msgSend(v3, "setReappearsAfterUnlock:", 1);
  objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", v3);

}

- (void)handleVolumeDecrease
{
  void *v2;
  id v3;

  ++handleVolumeDecrease_count;
  +[SBTestAlertItem alertItemWithShowInLockScreen:forcesModal:superModal:](SBTestAlertItem, "alertItemWithShowInLockScreen:forcesModal:superModal:", 1, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReappearsAfterLock:", 1);
  objc_msgSend(v3, "setReappearsAfterUnlock:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Normal %d"), handleVolumeDecrease_count);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v2);

  objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", v3);
}

@end
