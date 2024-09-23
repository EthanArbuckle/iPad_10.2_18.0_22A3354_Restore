@implementation InstallPassSettingsChangedObserverIfNecessary

void ___InstallPassSettingsChangedObserverIfNecessary_block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", CFSTR("PKPassSettingsDidChangeNotification"), 0, 0, &__block_literal_global_628);

}

void ___InstallPassSettingsChangedObserverIfNecessary_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PKPassSettingsDidChangeNotification"), 0, v4);
}

@end
