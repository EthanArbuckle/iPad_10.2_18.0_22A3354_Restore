@implementation SFB332SetupObserver

- (id)machServiceName
{
  return CFSTR("com.apple.sharingd.b332setup");
}

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFB332SetupObserver;
  -[SFXPCClient _activate](&v2, sel__activate);
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFB332SetupObserver;
  -[SFXPCClient _invalidate](&v2, sel__invalidate);
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8F670);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateDeviceInfoWithDeviceType_batteryLevel_batteryLevelKnown_edge_orientation_isCharging_identifier_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_updateDeviceInfoWithDeviceType_batteryLevel_batteryLevelKnown_edge_orientation_isCharging_identifier_, 6, 0);

  return v2;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8F6D0);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(unint64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v12;
  id v16;
  id v17;

  v9 = a8;
  v12 = a5;
  v16 = a9;
  -[SFB332SetupObserver delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateDeviceInfoWithDeviceType:batteryLevel:batteryLevelKnown:edge:orientation:isCharging:identifier:", a3, v12, a6, a7, v9, v16, a4);

}

- (void)showPairingStarted
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showPairingStarted");

}

- (void)showEnableBluetoothPill
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showEnableBluetoothPill");

}

- (void)showPairingSuccess
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showPairingSuccess");

}

- (void)showPairingFailure
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showPairingFailure");

}

- (void)showSubsequentPairSuccess
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showSubsequentPairSuccess");

}

- (void)showChargingStatus
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showChargingStatus");

}

- (void)dismissChargingStatus
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissChargingStatus");

}

- (void)showUnlockPrompt
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showUnlockPrompt");

}

- (void)showPairConsentPrompt
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showPairConsentPrompt");

}

- (void)dismissUnlockPrompt
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissUnlockPrompt");

}

- (void)dismissBTPrompt
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissBTPrompt");

}

- (void)releaseHUDTransaction
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseHUDTransaction");

}

- (void)acquireHUDTransaction
{
  id v2;

  -[SFB332SetupObserver delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acquireHUDTransaction");

}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFB332SetupObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowWhatsNew:", v3);

}

- (void)setDeviceType:(unint64_t)a3
{
  id v4;

  -[SFB332SetupObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceType:", a3);

}

- (void)dismissUIAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFB332SetupObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissUIAnimated:", v3);

}

- (void)enableBluetoothTapped
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_212728000, "Sharing/SFB332SetupXPCConnection/enableBluetoothTapped", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  -[SFXPCClient getRemoteObjectProxyOnQueue:](self, "getRemoteObjectProxyOnQueue:", &__block_literal_global);
  os_activity_scope_leave(&v4);

}

uint64_t __44__SFB332SetupObserver_enableBluetoothTapped__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableBluetoothTapped");
}

- (void)pairTapped
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_212728000, "Sharing/SFB332SetupXPCConnection/pairTapped", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  -[SFXPCClient getRemoteObjectProxyOnQueue:](self, "getRemoteObjectProxyOnQueue:", &__block_literal_global_159);
  os_activity_scope_leave(&v4);

}

uint64_t __33__SFB332SetupObserver_pairTapped__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairTapped");
}

- (SFB332UIProtocol)delegate
{
  return (SFB332UIProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
