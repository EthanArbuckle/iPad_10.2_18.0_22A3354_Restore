@implementation SBSServer

- (void)getAllDebugInfoInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAllDebugInfo:", v4);

  }
}

- (void)getSelectDebugInfoInternal:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getSelectDebugInfo:reply:", v7, v6);

}

- (void)getLEDInfoInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getLEDInfo:", v4);

  }
}

- (void)getAllSyncedAlarmsAndTimersInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer controlsDelegate](self, "controlsDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAllSyncedAlarmsAndTimers:", v4);

  }
}

- (BOOL)isMediaAlarmInternal:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  -[SBSServer controlsDelegate](self, "controlsDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SBSServer controlsDelegate](self, "controlsDelegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[SBSServer controlsDelegate](self, "controlsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMediaAlarm:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getTuningInfoInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getTuningInfo:", v4);

  }
}

- (void)setTuningInfoOnBoxInternal:(id)a3 at:(id)a4 withValue:(float)a5
{
  id v8;
  id v9;
  double v10;
  id v11;

  v8 = a4;
  v9 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a5;
  objc_msgSend(v11, "setTuningInfoOnBox:at:withValue:", v9, v8, v10);

}

- (void)playToneInternal:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playTone:", v3);

}

- (void)stopToneInternal:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopTone:", v3);

}

- (void)getUserDefaultsInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getUserDefaults:", v4);

  }
}

- (void)setUserDefaultsInternal:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserDefaults:withValue:", v7, v6);

}

- (void)resetAllUserDefaultsInternal
{
  id v2;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAllUserDefaults");

}

- (void)resetUserDefaultInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetUserDefault:", v4);

}

- (void)sendLEDCommandInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendLEDCommand:", v4);

}

- (void)triggerWiFiCoreCaptureInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerWiFiCoreCapture:", v4);

}

- (void)sendButtonCommandInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendButtonCommand:", v4);

}

- (void)injectSWUpdateToHomeInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "injectSWUpdateToHome:", v4);

}

- (void)setHomeUpdateStateInternal:(int64_t)a3
{
  id v4;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeUpdateState:", a3);

}

- (void)clearHomeSWUpdateInternal
{
  id v2;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearHomeSWUpdate");

}

- (void)setBootSpinnerInternal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBootSpinner:", v3);

}

- (void)setWifiEnabledInternal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWifiEnabled:", v3);

}

- (void)disassociateCurrentNetworkInternal
{
  id v2;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disassociateCurrentNetwork");

}

- (void)disassociateNetworkWithNameInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disassociateNetworkWithName:", v4);

}

- (void)getFeatureFlagsInternal:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getFeatureFlags:", v4);

  }
}

- (void)setFeatureFlagsInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeatureFlags:", v4);

}

- (void)setLEDContentsInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLEDContents:", v4);

}

- (void)renderInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "render:", v4);

}

- (void)siriSayInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriSay:", v4);

}

- (void)suScanForSoftwareUpdateInternal
{
  id v2;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suScanForSoftwareUpdate");

}

- (void)setDeviceAsStereoLeaderInternal:(BOOL)a3 withOptions:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBSServer stereoLeaderDelegate](self, "stereoLeaderDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceAsStereoLeader:withOptions:", v4, v6);

}

- (void)isDeviceStereoFollowerInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer stereoLeaderDelegate](self, "stereoLeaderDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isDeviceStereoFollower:", v4);

}

- (void)sysdiagnoseHasStartedInternal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSServer sysdiagnoseDelegate](self, "sysdiagnoseDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sysdiagnoseHasStarted:", v3);

}

- (void)createSysdiagnoseInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBSServer sysdiagnoseDelegate](self, "sysdiagnoseDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SBSServer_Internal__createSysdiagnoseInternal___block_invoke;
  v7[3] = &unk_24EB7DBB8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "createSysdiagnose:", v7);

}

- (void)airDropSysdiagnoseInternal:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBSServer airdropServiceDelegate](self, "airdropServiceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__SBSServer_Internal__airDropSysdiagnoseInternal_airDropID_completionHandler___block_invoke;
  v13[3] = &unk_24EB7DBE0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "airDropSysdiagnose:airDropID:completionHandler:", v10, v9, v13);

}

- (void)cancelSysdiagnoseInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBSServer sysdiagnoseDelegate](self, "sysdiagnoseDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SBSServer_Internal__cancelSysdiagnoseInternal___block_invoke;
  v7[3] = &unk_24EB7E3B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "cancelCurrentSysdiagnose:", v7);

}

- (void)rebootInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer systemDelegate](self, "systemDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reboot:", v4);

}

- (void)requestDeferredRebootInternal
{
  id v2;

  -[SBSServer systemDelegate](self, "systemDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDeferredReboot");

}

- (void)obliterateInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer systemDelegate](self, "systemDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "obliterate:", v4);

}

- (void)identifyWithOptionsInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer systemDelegate](self, "systemDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifyWithOptions:", v4);

}

- (void)intercomWithOptionsInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer systemDelegate](self, "systemDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intercomWithOptions:", v4);

}

- (void)handoffStartInternalWithHandoffType:(unint64_t)a3
{
  id v4;

  -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffStartWithHandoffType:", a3);

}

- (void)handoffStartWithArtworkColorsInternal:(id)a3 handoffType:(unint64_t)a4
{
  id v6;
  void *v7;
  SBSColorGroup *v8;

  v6 = a3;
  v8 = -[SBSColorGroup initWithData:]([SBSColorGroup alloc], "initWithData:", v6);

  -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handoffStartWithArtworkColors:handoffType:", v8, a4);

}

- (void)handoffUpdateIntensityInternal:(float)a3 handoffType:(unint64_t)a4
{
  double v6;
  id v7;

  -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "handoffUpdateIntensity:handoffType:", a4, v6);

}

- (void)handoffCancelInternalWithHandoffType:(unint64_t)a3
{
  id v4;

  -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffCancelWithHandoffType:", a3);

}

- (void)handoffCompleteInternalWithHandoffType:(unint64_t)a3
{
  id v4;

  -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffCompleteWithHandoffType:", a3);

}

- (void)getPowerEstimateForIntervalInternal:(float)a3 reply:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[SBSServer powerMonitorDelegate](self, "powerMonitorDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "getPowerEstimateForInterval:reply:", v6, v7);

}

- (void)getInstalledProfilesInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer profilesDelegate](self, "profilesDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getInstalledProfiles:", v4);

}

- (void)removeProfileByIdentifierInternal:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSServer profilesDelegate](self, "profilesDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeProfileByIdentifier:completion:", v7, v6);

}

- (void)installProfileDataInternal:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSServer profilesDelegate](self, "profilesDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installProfileData:completion:", v7, v6);

}

- (void)getVolumeInternal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getVolume:", v4);

}

- (void)setVolumeInternal:(float)a3
{
  double v4;
  id v5;

  -[SBSServer debugInfoDelegate](self, "debugInfoDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolume:", v4);

}

uint64_t __49__SBSServer_Internal__cancelSysdiagnoseInternal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__SBSServer_Internal__airDropSysdiagnoseInternal_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__SBSServer_Internal__createSysdiagnoseInternal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SBSServer)init
{
  SBSServer *v2;
  uint64_t v3;
  NSXPCListener *serverListener;
  NSMutableArray *v5;
  NSMutableArray *clients;
  NSMutableSet *v7;
  NSMutableSet *delegates;
  SBSRemoteDeviceReceiver *v9;
  SBSRemoteDeviceReceiver *receiver;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSServer;
  v2 = -[SBSServer init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.soundboardservices.server"));
    serverListener = v2->_serverListener;
    v2->_serverListener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_serverListener, "setDelegate:", v2);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    clients = v2->_clients;
    v2->_clients = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    delegates = v2->_delegates;
    v2->_delegates = v7;

    -[NSXPCListener resume](v2->_serverListener, "resume");
    if (+[SBSServer _isInternalBuild](SBSServer, "_isInternalBuild"))
    {
      v9 = -[SBSRemoteDeviceReceiver initWithDelegate:]([SBSRemoteDeviceReceiver alloc], "initWithDelegate:", v2);
      receiver = v2->_receiver;
      v2->_receiver = v9;

    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  SBSClient *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  NSMutableArray *v27;
  void *v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;

  v30 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SBSClient);
  -[SBSClient setConnection:](v7, "setConnection:", v6);
  -[SBSClient setClientType:](v7, "setClientType:", 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25577A238);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSClient connection](v7, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExportedInterface:", v8);

  -[SBSClient connection](v7, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExportedObject:", self);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25577C250);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSClient connection](v7, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v11);

  -[SBSClient connection](v7, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "exportedInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "classesForSelector:argumentIndex:ofReply:", sel_getAllSyncedAlarmsAndTimers_, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setByAddingObjectsFromSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSClient connection](v7, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "exportedInterface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_getAllSyncedAlarmsAndTimers_, 0, 1);

  objc_initWeak(&location, self);
  -[SBSClient connection](v7, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke;
  v34[3] = &unk_24EB7DB88;
  objc_copyWeak(&v36, &location);
  v24 = v6;
  v35 = v24;
  objc_msgSend(v22, "setInterruptionHandler:", v34);

  -[SBSClient connection](v7, "connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v31[3] = &unk_24EB7DB88;
  objc_copyWeak(&v33, &location);
  v26 = v24;
  v32 = v26;
  objc_msgSend(v25, "setInvalidationHandler:", v31);

  v27 = self->_clients;
  objc_sync_enter(v27);
  -[NSMutableArray addObject:](self->_clients, "addObject:", v7);
  objc_sync_exit(v27);

  -[SBSClient connection](v7, "connection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "resume");

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  return 1;
}

- (void)handleClientDisconnection:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _SBSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_222D7A000, v5, OS_LOG_TYPE_DEFAULT, "Client with connection %@ is disconnecting.", buf, 0xCu);
  }

  v6 = self->_clients;
  objc_sync_enter(v6);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_clients;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "connection", (_QWORD)v19);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v4;

        if (v13)
        {
          if (objc_msgSend(v11, "clientType") == 5)
          {
            -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (!v16)
            {
              -[SBSServer proximityHandoffUIDelegate](self, "proximityHandoffUIDelegate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "handoffCancelWithHandoffType:", 0);

            }
          }
          v14 = v11;
          goto LABEL_16;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_16:

  _SBSLoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v14;
    _os_log_impl(&dword_222D7A000, v18, OS_LOG_TYPE_DEFAULT, "Client object found: %@", buf, 0xCu);
  }

  if (v14)
    -[NSMutableArray removeObject:](self->_clients, "removeObject:", v14);
  objc_sync_exit(v6);

}

- (void)getAllDebugInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getAllDebugInfoInternal:](self, "getAllDebugInfoInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getAllDebugInfo without entitlement", v6, 2u);
    }

  }
}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getSelectDebugInfoInternal:reply:](self, "getSelectDebugInfoInternal:reply:", v6, v7);
  }
  else
  {
    _SBSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_222D7A000, v8, OS_LOG_TYPE_ERROR, "Trying to call getSelectDebugInfo without entitlement", v9, 2u);
    }

    v7[2](v7, MEMORY[0x24BDBD1B8]);
  }

}

- (void)getLEDInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getLEDInfoInternal:](self, "getLEDInfoInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getLEDInfo without entitlement", v6, 2u);
    }

  }
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.homepodcontrols")))
  {
    -[SBSServer getAllSyncedAlarmsAndTimersInternal:](self, "getAllSyncedAlarmsAndTimersInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getAllSyncedAlarmsAndTimers without entitlement", v6, 2u);
    }

  }
}

- (BOOL)isMediaAlarm:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  if (!-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.homepodcontrols")))
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Trying to call isMediaAlarm without entitlement", v5, 2u);
    }

  }
  return 0;
}

- (void)getTuningInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getTuningInfoInternal:](self, "getTuningInfoInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getTuningInfo without entitlement", v6, 2u);
    }

  }
}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
  id v8;
  id v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    *(float *)&v10 = a5;
    -[SBSServer setTuningInfoOnBoxInternal:at:withValue:](self, "setTuningInfoOnBoxInternal:at:withValue:", v8, v9, v10);
  }
  else
  {
    _SBSLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_222D7A000, v11, OS_LOG_TYPE_ERROR, "Trying to call setTuningInfoOnBox without entitlement", v12, 2u);
    }

  }
}

- (void)playTone:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer playToneInternal:](self, "playToneInternal:", v3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = CFSTR("com.apple.debuginfo.soundboard");
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call playTone without entitlement %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)stopTone:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer stopToneInternal:](self, "stopToneInternal:", v3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = CFSTR("com.apple.debuginfo.soundboard");
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call stopTone without entitlement %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)getUserDefaults:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getUserDefaultsInternal:](self, "getUserDefaultsInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getUserDefaults without entitlement", v6, 2u);
    }

  }
}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setUserDefaultsInternal:withValue:](self, "setUserDefaultsInternal:withValue:", v6, v7);
  }
  else
  {
    _SBSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_222D7A000, v8, OS_LOG_TYPE_ERROR, "Trying to call setUserDefaults without entitlement", v9, 2u);
    }

  }
}

- (void)resetAllUserDefaults
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer resetAllUserDefaultsInternal](self, "resetAllUserDefaultsInternal");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Trying to call resetAllUserDefaults without entitlement", v4, 2u);
    }

  }
}

- (void)resetUserDefault:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer resetUserDefaultInternal:](self, "resetUserDefaultInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call resetUserDefault without entitlement", v6, 2u);
    }

  }
}

- (void)sendLEDCommand:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer sendLEDCommandInternal:](self, "sendLEDCommandInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendLED without entitlement", v6, 2u);
    }

  }
}

- (void)triggerWiFiCoreCapture:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer triggerWiFiCoreCaptureInternal:](self, "triggerWiFiCoreCaptureInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call triggerWiFiCoreCapture without entitlement", v6, 2u);
    }

  }
}

- (void)sendButtonCommand:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer sendButtonCommandInternal:](self, "sendButtonCommandInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)suScanForSoftwareUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer suScanForSoftwareUpdateInternal](self, "suScanForSoftwareUpdateInternal");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }

  }
}

- (void)injectSWUpdateToHome:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer injectSWUpdateToHomeInternal:](self, "injectSWUpdateToHomeInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)setHomeUpdateState:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setHomeUpdateStateInternal:](self, "setHomeUpdateStateInternal:", a3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)clearHomeSWUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer clearHomeSWUpdateInternal](self, "clearHomeSWUpdateInternal");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }

  }
}

- (void)setBootSpinner:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setBootSpinnerInternal:](self, "setBootSpinnerInternal:", v3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)setWifiEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setWifiEnabledInternal:](self, "setWifiEnabledInternal:", v3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)disassociateCurrentNetwork
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer disassociateCurrentNetworkInternal](self, "disassociateCurrentNetworkInternal");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v4, 2u);
    }

  }
}

- (void)disassociateNetworkWithName:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer disassociateNetworkWithNameInternal:](self, "disassociateNetworkWithNameInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call sendButton without entitlement", v6, 2u);
    }

  }
}

- (void)getFeatureFlags:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getFeatureFlagsInternal:](self, "getFeatureFlagsInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call getFeatureFlags without entitlement", v6, 2u);
    }

  }
}

- (void)setFeatureFlags:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setFeatureFlagsInternal:](self, "setFeatureFlagsInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call setFeatureFlags without entitlement", v6, 2u);
    }

  }
}

- (void)setLEDContents:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer setLEDContentsInternal:](self, "setLEDContentsInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v6, 2u);
    }

  }
}

- (void)siriSay:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer siriSayInternal:](self, "siriSayInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call siriSay without entitlement", v6, 2u);
    }

  }
}

- (void)getVolume:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer getVolumeInternal:](self, "getVolumeInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v6, 2u);
    }

  }
}

- (void)setVolume:(float)a3
{
  double v5;
  NSObject *v6;
  uint8_t v7[16];

  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    *(float *)&v5 = a3;
    -[SBSServer setVolumeInternal:](self, "setVolumeInternal:", v5);
  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Trying to call setLEDContents without entitlement", v7, 2u);
    }

  }
}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.stereoleader.soundboard")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 1);
    -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    _SBSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_222D7A000, v8, OS_LOG_TYPE_DEFAULT, "Received setDeviceAsStereoLeader process info - %@", (uint8_t *)&v9, 0xCu);
    }

    -[SBSServer setDeviceAsStereoLeaderInternal:withOptions:](self, "setDeviceAsStereoLeaderInternal:withOptions:", v4, v7);
  }
  else
  {
    _SBSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_222D7A000, v7, OS_LOG_TYPE_ERROR, "Trying to call setDeviceAsStereoLeader without entitlement", (uint8_t *)&v9, 2u);
    }
  }

}

- (void)isDeviceStereoFollower:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.stereoleader.soundboard")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 1);
    -[SBSServer isDeviceStereoFollowerInternal:](self, "isDeviceStereoFollowerInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call isDeviceStereoFollower without entitlement", v6, 2u);
    }

  }
}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.sysdiagnose")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 2);
    -[SBSServer sysdiagnoseHasStartedInternal:](self, "sysdiagnoseHasStartedInternal:", v3);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Missing Entitlement for sysdiagnose", v6, 2u);
    }

  }
}

- (void)createSysdiagnose:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.sysdiagnose")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 2);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __31__SBSServer_createSysdiagnose___block_invoke;
    v7[3] = &unk_24EB7DBB8;
    v8 = v4;
    -[SBSServer createSysdiagnoseInternal:](self, "createSysdiagnoseInternal:", v7);
    v5 = v8;
  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing Entitlement for starting sysdiagnose", buf, 2u);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.soundboardservices"), 1001, 0);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
  }

}

- (void)cancelCurrentSysdiagnose:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.sysdiagnose")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 2);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SBSServer_cancelCurrentSysdiagnose___block_invoke;
    v7[3] = &unk_24EB7E3B0;
    v8 = v4;
    -[SBSServer cancelSysdiagnoseInternal:](self, "cancelSysdiagnoseInternal:", v7);
    v5 = v8;
  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing Entitlement for cancelling sysdiagnose", buf, 2u);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.soundboardservices"), 1001, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v5);
  }

}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.sysdiagnose")))
  {
    -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 2);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__SBSServer_airDropSysdiagnose_airDropID_completionHandler___block_invoke;
    v13[3] = &unk_24EB7DBE0;
    v14 = v10;
    -[SBSServer airDropSysdiagnoseInternal:airDropID:completionHandler:](self, "airDropSysdiagnoseInternal:airDropID:completionHandler:", v8, v9, v13);
    v11 = v14;
  }
  else
  {
    _SBSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_222D7A000, v12, OS_LOG_TYPE_ERROR, "Missing Entitlement for starting sysdiagnose", buf, 2u);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.soundboardservices"), 1001, 0);
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v11);
  }

}

- (void)reboot:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system")))
  {
    -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSServer rebootInternal:](self, "rebootInternal:", v5);

  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for reboot", v7, 2u);
    }

  }
}

- (void)requestDeferredReboot
{
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system"));
  _SBSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[SBSServer requestDeferredReboot]";
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_222D7A000, v5, OS_LOG_TYPE_DEFAULT, "In %s Client Info..%@", (uint8_t *)&v7, 0x16u);

    }
    -[SBSServer requestDeferredRebootInternal](self, "requestDeferredRebootInternal");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Missing required entitlement for requestDeferredReboot", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)obliterate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system")))
  {
    -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSServer obliterateInternal:](self, "obliterateInternal:", v5);

  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for obliterate", v7, 2u);
    }

  }
}

- (void)identifyWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system")))
  {
    -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSServer identifyWithOptionsInternal:](self, "identifyWithOptionsInternal:", v5);

  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for identify", v7, 2u);
    }

  }
}

- (void)intercomWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system")))
  {
    -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSServer intercomWithOptionsInternal:](self, "intercomWithOptionsInternal:", v5);

  }
  else
  {
    _SBSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_222D7A000, v6, OS_LOG_TYPE_ERROR, "Missing required entitlement for intercom", v7, 2u);
    }

  }
}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "setTurnOffBrightnessFactor not supported.", v4, 2u);
  }

}

- (void)render:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer renderInternal:](self, "renderInternal:", v4);
  }
  else
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_222D7A000, v5, OS_LOG_TYPE_ERROR, "Trying to call render without entitlement", v6, 2u);
    }

  }
}

- (void)fetchLatestEvents:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.debuginfo.soundboard")))
  {
    -[SBSServer volumeEventMonitorDelegate](self, "volumeEventMonitorDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchLatestEvents:completionHandler:", a3, v6);

  }
  else
  {
    _SBSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[SBSServer fetchLatestEvents:completionHandler:]";
      _os_log_error_impl(&dword_222D7A000, v8, OS_LOG_TYPE_ERROR, "Trying to call %s without entitlement", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)handoffStartWithHandoffType:(unint64_t)a3
{
  -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 5);
  -[SBSServer handoffStartInternalWithHandoffType:](self, "handoffStartInternalWithHandoffType:", a3);
}

- (void)handoffStartWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[SBSServer _findConnectionAndSetClientType:](self, "_findConnectionAndSetClientType:", 5);
  objc_msgSend(v6, "data");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSServer handoffStartWithArtworkColorsInternal:handoffType:](self, "handoffStartWithArtworkColorsInternal:handoffType:", v7, a4);
}

- (void)handoffSetDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SBSServer _gatherXPCClientInfo:](self, "_gatherXPCClientInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SBSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_222D7A000, v8, OS_LOG_TYPE_DEFAULT, "handoffSetDeviceAsStereoLeader = [%@] options received from external process info - %@", (uint8_t *)&v10, 0x16u);

  }
  -[SBSServer setDeviceAsStereoLeaderInternal:withOptions:](self, "setDeviceAsStereoLeaderInternal:withOptions:", v4, v6);

}

- (void)proximityHandoffCancelled
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_clients;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (_QWORD)v11) == 5)
        {
          objc_msgSend(v8, "connection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handoffCancelled");

          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffCompleted
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_clients;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (_QWORD)v11) == 5)
        {
          objc_msgSend(v8, "connection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handoffCompleted");

          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffInactive
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_clients;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (_QWORD)v11) == 5)
        {
          objc_msgSend(v8, "connection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handoffInactive");

          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffStarted
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_clients;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (_QWORD)v11) == 5)
        {
          objc_msgSend(v8, "connection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handoffStarted");

          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)proximityHandoffUpdating
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_clients;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "clientType", (_QWORD)v11) == 5)
        {
          objc_msgSend(v8, "connection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handoffUpdating");

          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
}

- (void)getPowerEstimateForInterval:(float)a3 reply:(id)a4
{
  id v6;
  double v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  if (-[SBSServer _hasEntitlement:](self, "_hasEntitlement:", CFSTR("com.apple.soundboard.system")))
  {
    *(float *)&v7 = a3;
    -[SBSServer getPowerEstimateForIntervalInternal:reply:](self, "getPowerEstimateForIntervalInternal:reply:", v6, v7);
  }
  else
  {
    _SBSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_222D7A000, v8, OS_LOG_TYPE_ERROR, "Missing required entitlement for identify", v9, 2u);
    }

  }
}

- (void)_findConnectionAndSetClientType:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_clients;
  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_clients;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "connection", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v5;

        if (v13)
          objc_msgSend(v11, "setClientType:", a3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (BOOL)_hasEntitlement:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1988];
  v4 = a3;
  objc_msgSend(v3, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(MEMORY[0x24BDBD1C8], "isEqual:", v6);
  return (char)v4;
}

- (id)_processNameForPID:(int)a3
{
  void *v3;
  size_t v5;
  int v6[2];
  int v7;
  int v8;
  _OWORD v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, 512);
  v5 = 648;
  *(_QWORD *)v6 = 0xE00000001;
  v7 = 1;
  v8 = a3;
  if (sysctl(v6, 4u, v9, &v5, 0, 0) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)&v9[15] + 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_gatherXPCClientInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");
  -[SBSServer _processNameForPID:](self, "_processNameForPID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("pid"));

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("process-name"));
  v11 = (void *)objc_msgSend(v9, "copy");

  return v11;
}

- (SBSStereoLeaderRoleImplementer)stereoLeaderDelegate
{
  return (SBSStereoLeaderRoleImplementer *)objc_loadWeakRetained((id *)&self->_stereoLeaderDelegate);
}

- (void)setStereoLeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stereoLeaderDelegate, a3);
}

- (SBSDebugInfoImplementer)debugInfoDelegate
{
  return (SBSDebugInfoImplementer *)objc_loadWeakRetained((id *)&self->_debugInfoDelegate);
}

- (void)setDebugInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_debugInfoDelegate, a3);
}

- (SBSSystemImplementer)systemDelegate
{
  return (SBSSystemImplementer *)objc_loadWeakRetained((id *)&self->_systemDelegate);
}

- (void)setSystemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemDelegate, a3);
}

- (SBSSysdiagnoseImplementer)sysdiagnoseDelegate
{
  return (SBSSysdiagnoseImplementer *)objc_loadWeakRetained((id *)&self->_sysdiagnoseDelegate);
}

- (void)setSysdiagnoseDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sysdiagnoseDelegate, a3);
}

- (SBSAirDropServiceImplementer)airdropServiceDelegate
{
  return (SBSAirDropServiceImplementer *)objc_loadWeakRetained((id *)&self->_airdropServiceDelegate);
}

- (void)setAirdropServiceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_airdropServiceDelegate, a3);
}

- (SBSHomePodControlsImplementer)controlsDelegate
{
  return (SBSHomePodControlsImplementer *)objc_loadWeakRetained((id *)&self->_controlsDelegate);
}

- (void)setControlsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controlsDelegate, a3);
}

- (SBSPowerMonitorImplementer)powerMonitorDelegate
{
  return (SBSPowerMonitorImplementer *)objc_loadWeakRetained((id *)&self->_powerMonitorDelegate);
}

- (void)setPowerMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_powerMonitorDelegate, a3);
}

- (SBSProfilesImplementer)profilesDelegate
{
  return (SBSProfilesImplementer *)objc_loadWeakRetained((id *)&self->_profilesDelegate);
}

- (void)setProfilesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_profilesDelegate, a3);
}

- (SBSVolumeEventMonitorImplementer)volumeEventMonitorDelegate
{
  return (SBSVolumeEventMonitorImplementer *)objc_loadWeakRetained((id *)&self->_volumeEventMonitorDelegate);
}

- (void)setVolumeEventMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_volumeEventMonitorDelegate, a3);
}

- (SBSProximityHandoffUIImplementer)proximityHandoffUIDelegate
{
  return (SBSProximityHandoffUIImplementer *)objc_loadWeakRetained((id *)&self->_proximityHandoffUIDelegate);
}

- (void)setProximityHandoffUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_proximityHandoffUIDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximityHandoffUIDelegate);
  objc_destroyWeak((id *)&self->_volumeEventMonitorDelegate);
  objc_destroyWeak((id *)&self->_profilesDelegate);
  objc_destroyWeak((id *)&self->_powerMonitorDelegate);
  objc_destroyWeak((id *)&self->_controlsDelegate);
  objc_destroyWeak((id *)&self->_airdropServiceDelegate);
  objc_destroyWeak((id *)&self->_sysdiagnoseDelegate);
  objc_destroyWeak((id *)&self->_systemDelegate);
  objc_destroyWeak((id *)&self->_debugInfoDelegate);
  objc_destroyWeak((id *)&self->_stereoLeaderDelegate);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_serverListener, 0);
}

uint64_t __60__SBSServer_airDropSysdiagnose_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__SBSServer_cancelCurrentSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__SBSServer_createSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleClientDisconnection:", *(_QWORD *)(a1 + 32));

}

void __48__SBSServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleClientDisconnection:", *(_QWORD *)(a1 + 32));

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SBSServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sSharedInstance;
}

+ (BOOL)_isInternalBuild
{
  if (_isInternalBuild_onceToken != -1)
    dispatch_once(&_isInternalBuild_onceToken, &__block_literal_global);
  return _isInternalBuild_isInternal;
}

uint64_t __29__SBSServer__isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  _isInternalBuild_isInternal = result;
  return result;
}

void __27__SBSServer_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

}

@end
