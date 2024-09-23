@implementation PSUIPasscodeAndBiometrics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSUIPasscodeAndBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance_1;
}

void __43__PSUIPasscodeAndBiometrics_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (BOOL)isUnlockEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isFingerprintUnlockAllowed"))
  {
    +[PSUIPasscode sharedInstance](PSUIPasscode, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isPasscodeSet"))
    {
      +[PSUIBiometrics identities](PSUIBiometrics, "identities");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isTouchIDUnlockRestricted") ^ 1;

      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end
