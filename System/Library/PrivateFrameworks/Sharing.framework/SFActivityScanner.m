@implementation SFActivityScanner

- (SFActivityScanner)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s: should never be used."), "-[SFActivityScanner init]");
  return -[SFActivityScanner initWithDelegate:](self, "initWithDelegate:", 0);
}

- (SFActivityScanner)initWithDelegate:(id)a3
{
  SFActivityScannerDelegate *v4;
  SFActivityScanner *v5;
  SFActivityScanner *v6;
  SFActivityScanner *v7;
  void *v8;
  objc_super v10;

  v4 = (SFActivityScannerDelegate *)a3;
  +[SFContinuityScanManager sharedManager](SFContinuityScanManager, "sharedManager");
  v5 = (SFActivityScanner *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SFActivityScanner;
    v6 = -[SFActivityScanner init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_delegate = v4;
      +[SFContinuityScanManager sharedManager](SFContinuityScanManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:", v7);

    }
    self = v7;
    v5 = self;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SFContinuityScanManager sharedManager](SFContinuityScanManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFActivityScanner;
  -[SFActivityScanner dealloc](&v4, sel_dealloc);
}

- (SFActivityScannerDelegate)delegate
{
  SFActivityScanner *v2;
  SFActivityScannerDelegate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_delegate;
  objc_sync_exit(v2);

  return v3;
}

- (void)scanForTypes:(unint64_t)a3
{
  id v4;

  +[SFContinuityScanManager sharedManager](SFContinuityScanManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scanForTypes:", a3);

}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[SFContinuityScanManager sharedManager](SFContinuityScanManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E482F8C0;
  v19 = v11;
  v17 = v11;
  objc_msgSend(v15, "activityPayloadFromDeviceUniqueID:forAdvertisementPayload:command:timeout:withCompletionHandler:", v16, v13, v12, a6, v18);

}

void __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E482F1A0;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __109__SFActivityScanner_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)scanManager:(id)a3 receivedAdvertisement:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFActivityScanner_scanManager_receivedAdvertisement___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __55__SFActivityScanner_scanManager_receivedAdvertisement___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activityScanner:receivedAdvertisement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)scanManager:(id)a3 foundDeviceWithDevice:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFActivityScanner_scanManager_foundDeviceWithDevice___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __55__SFActivityScanner_scanManager_foundDeviceWithDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activityScanner:foundDeviceWithDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)scanManager:(id)a3 lostDeviceWithDevice:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFActivityScanner_scanManager_lostDeviceWithDevice___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __54__SFActivityScanner_scanManager_lostDeviceWithDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activityScanner:lostDeviceWithDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)scanManager:(id)a3 pairedDevicesChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFActivityScanner_scanManager_pairedDevicesChanged___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __54__SFActivityScanner_scanManager_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activityScanner:pairedDevicesChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
