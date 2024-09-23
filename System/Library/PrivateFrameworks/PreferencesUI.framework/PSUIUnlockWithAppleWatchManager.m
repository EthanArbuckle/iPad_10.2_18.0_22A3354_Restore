@implementation PSUIUnlockWithAppleWatchManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PSUIUnlockWithAppleWatchManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sharedInstance_2;
}

void __49__PSUIUnlockWithAppleWatchManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (void)canUseWatchToUnlockWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  _Unwind_Exception *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v4 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v25 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getNRPairedDeviceRegistryClass_block_invoke;
    v20 = &unk_24F9E3C20;
    v21 = &v22;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)&v17);
    v4 = (void *)v23[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPaired");

  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v8 = (void *)getSFUnlockManagerClass_softClass;
    v25 = getSFUnlockManagerClass_softClass;
    v9 = MEMORY[0x24BDAC760];
    if (!getSFUnlockManagerClass_softClass)
    {
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __getSFUnlockManagerClass_block_invoke;
      v20 = &unk_24F9E3C20;
      v21 = &v22;
      __getSFUnlockManagerClass_block_invoke((uint64_t)&v17);
      v8 = (void *)v23[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v10, "sharedUnlockManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v12 = (uint64_t *)getIDSDefaultPairedDeviceSymbolLoc_ptr;
    v25 = getIDSDefaultPairedDeviceSymbolLoc_ptr;
    if (!getIDSDefaultPairedDeviceSymbolLoc_ptr)
    {
      v17 = v9;
      v18 = 3221225472;
      v19 = __getIDSDefaultPairedDeviceSymbolLoc_block_invoke;
      v20 = &unk_24F9E3C20;
      v21 = &v22;
      __getIDSDefaultPairedDeviceSymbolLoc_block_invoke((uint64_t)&v17);
      v12 = (uint64_t *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v12)
    {
      v14 = (_Unwind_Exception *)-[PSUITouchIDPasscodeController enrollResult:bkIdentity:].cold.1();
      _Block_object_dispose(&v22, 8);
      _Unwind_Resume(v14);
    }
    v13 = *v12;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __76__PSUIUnlockWithAppleWatchManager_canUseWatchToUnlockWithCompletionHandler___block_invoke;
    v15[3] = &unk_24F9E40F0;
    v16 = v3;
    objc_msgSend(v11, "unlockEnabledWithDevice:completionHandler:", v13, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

uint64_t __76__PSUIUnlockWithAppleWatchManager_canUseWatchToUnlockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a3;
    objc_msgSend(v5, "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unlock using watch: %@ %@"), v7, v6);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
