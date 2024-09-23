@implementation SBLockScreenBatteryChargingViewController

- (id)initForDisplayOfBattery:(BOOL)a3
{
  SBLockScreenBatteryChargingViewController *v4;
  id *p_isa;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBLockScreenBatteryChargingViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  p_isa = (id *)&v4->super.super.super.super.isa;
  if (v4)
  {
    v4->_shouldDisplayBattery = a3;
    v6 = objc_alloc_init(MEMORY[0x1E0D01B20]);
    v7 = p_isa[134];
    p_isa[134] = v6;

    objc_msgSend(p_isa[134], "connectedDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    v10 = p_isa[133];
    p_isa[133] = (id)v9;

    objc_msgSend(p_isa[133], "indexesOfObjectsPassingTest:", &__block_literal_global_250);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[133], "removeObjectsAtIndexes:", v11);

  }
  return p_isa;
}

uint64_t __69__SBLockScreenBatteryChargingViewController_initForDisplayOfBattery___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPowerSource") ^ 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenBatteryChargingViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  int v4;
  int v5;

  if (self->_shouldDisplayBattery && (unint64_t)-[NSMutableArray count](self->_connectedDevices, "count") > 1)
  {
    objc_msgSend(MEMORY[0x1E0D1BB68], "batteryChargingViewWithDoubleBattery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1BB68], "batteryChargingViewWithSingleBattery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = 1;
  }
  objc_storeStrong((id *)&self->_chargingView, v3);
  if (v4)

  if (v5)
  -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](self->_batteryDeviceController, "addBatteryDeviceObserver:queue:", self, MEMORY[0x1E0C80D38]);
  -[SBLockScreenBatteryChargingViewController setView:](self, "setView:", self->_chargingView);
}

- (void)presentWithAnimation:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;

  -[SBLockScreenBatteryChargingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke;
  v8[3] = &unk_1E8EB6268;
  v8[4] = self;
  v9 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_2;
  v6[3] = &unk_1E8EA52B0;
  v7 = a3;
  v6[4] = self;
  -[CSCoverSheetViewControllerBase updateAppearance:completion:](self, "updateAppearance:completion:", v8, v6);
}

id __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "setComponents:", 0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "batteryVisible"))
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "statusBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "priority:", 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hidden:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addComponent:", v6);

    objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "priority:", 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hidden:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string:", &stru_1E8EC7EC0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addComponent:", v10);

    objc_msgSend(MEMORY[0x1E0D1BB88], "backgroundContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "priority:", 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hidden:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addComponent:", v13);

    objc_msgSend(MEMORY[0x1E0D1BB88], "pageContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "priority:", 40);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hidden:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "priority:", 40);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string:", &stru_1E8EC7EC0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v16);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

void __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[5];

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v4[1] = 3221225472;
  v4[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_3;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v2, v4, v2);

}

void __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_clearVisibilityTimer
{
  NSTimer *visibilityTimer;

  -[NSTimer invalidate](self->_visibilityTimer, "invalidate");
  visibilityTimer = self->_visibilityTimer;
  self->_visibilityTimer = 0;

}

- (BOOL)batteryVisible
{
  return -[CSBatteryChargingView batteryVisible](self->_chargingView, "batteryVisible");
}

- (id)chargingView
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBLockScreenBatteryChargingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)showChargeLevelWithBatteryVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSTimer *v6;
  NSTimer *visibilityTimer;
  id v8;

  v3 = a3;
  -[SBLockScreenBatteryChargingViewController _clearVisibilityTimer](self, "_clearVisibilityTimer");
  -[CSBatteryChargingView setAlpha:](self->_chargingView, "setAlpha:", 1.0);
  -[CSBatteryChargingView setBatteryVisible:](self->_chargingView, "setBatteryVisible:", v3);
  v5 = (void *)MEMORY[0x1E0C99E88];
  -[CSBatteryChargingView desiredVisibilityDuration](self->_chargingView, "desiredVisibilityDuration");
  objc_msgSend(v5, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__visibilityTimerFired_, 0, 0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  visibilityTimer = self->_visibilityTimer;
  self->_visibilityTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_visibilityTimer, *MEMORY[0x1E0C99860]);

}

- (void)_visibilityTimerFired:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  -[SBLockScreenBatteryChargingViewController _clearVisibilityTimer](self, "_clearVisibilityTimer", a3);
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke_2;
  v4[3] = &unk_1E8E9E980;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v5, v4, 0.25);
}

uint64_t __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", 0.0);
}

void __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1080));
  objc_msgSend(WeakRetained, "chargingViewControllerFadedOutContent:", *(_QWORD *)(a1 + 32));

}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  void *v11;
  CSBatteryChargingView *chargingView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  CSBatteryChargingView *v21;
  CSBatteryChargingView *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = *MEMORY[0x1E0D01B28];
    v9 = &OBJC_IVAR___SBCaptureButtonSuppressionManager__observers;
    v24 = v4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        if (*((_BYTE *)&self->super.super.super.super.isa + v9[329])
          && (unint64_t)-[NSMutableArray count](self->_connectedDevices, "count") > 1)
        {
          if (objc_msgSend(v11, "isInternal"))
          {
LABEL_11:
            chargingView = self->_chargingView;
            SBLockScreenChargePercentageLabelForBattery(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSBatteryChargingView setPrimaryBatteryText:forBattery:](chargingView, "setPrimaryBatteryText:forBattery:", v13, v11);
LABEL_12:

            goto LABEL_13;
          }
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndex:](self->_connectedDevices, "objectAtIndex:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v8;
          v18 = objc_msgSend(v14, "isEqualToString:", v16);

          v19 = objc_msgSend(v11, "productIdentifier");
          v20 = v18 == 0;
          v8 = v17;
          v20 = v20 || v19 == v17;
          if (!v20)
          {
            v22 = self->_chargingView;
            SBLockScreenChargePercentageLabelForBattery(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSBatteryChargingView setSecondaryBatteryText:forBattery:](v22, "setSecondaryBatteryText:forBattery:", v13, v11);
            v4 = v24;
            v9 = &OBJC_IVAR___SBCaptureButtonSuppressionManager__observers;
            goto LABEL_12;
          }
          v4 = v24;
          v9 = &OBJC_IVAR___SBCaptureButtonSuppressionManager__observers;
          if (v19 == v8)
          {
            v21 = self->_chargingView;
            SBLockScreenSimpleChargePercentageLabelForBattery(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSBatteryChargingView setSecondaryBatteryText:forBattery:](v21, "setSecondaryBatteryText:forBattery:", v13, v11);
            goto LABEL_12;
          }
        }
        else if (objc_msgSend(v11, "isInternal"))
        {
          goto LABEL_11;
        }
LABEL_13:
        ++v10;
      }
      while (v6 != v10);
      v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v6 = v23;
    }
    while (v23);
  }

}

- (SBLockScreenBatteryChargingViewControllerDelegate)delegate
{
  return (SBLockScreenBatteryChargingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
}

@end
