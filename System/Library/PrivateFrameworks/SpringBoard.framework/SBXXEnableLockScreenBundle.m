@implementation SBXXEnableLockScreenBundle

void ___SBXXEnableLockScreenBundle_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 40);
  v8 = v2;
  objc_msgSend(v2, "lockScreenEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "enableLockScreenPluginWithContext:", v7);
  else
    objc_msgSend(v5, "disableLockScreenPluginWithContext:", v7);

}

@end
