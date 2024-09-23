@implementation SBSRemoteDeviceReceiver

- (SBSRemoteDeviceReceiver)initWithDelegate:(id)a3
{
  id v4;
  SBSRemoteDeviceReceiver *v5;
  SBSRemoteDeviceReceiver *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  RPCompanionLinkClient *v9;
  RPCompanionLinkClient *client;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSRemoteDeviceReceiver;
  v5 = -[SBSRemoteDeviceReceiver init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.soundboardservices.RapportMessageReceivingQueue", v7);
    v9 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    client = v6->_client;
    v6->_client = v9;

    -[RPCompanionLinkClient setDispatchQueue:](v6->_client, "setDispatchQueue:", v8);
    -[RPCompanionLinkClient setControlFlags:](v6->_client, "setControlFlags:", 8196);
    _SBSLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SBSRemoteDeviceReceiver initWithDelegate:]";
      _os_log_impl(&dword_222D7A000, v11, OS_LOG_TYPE_DEFAULT, "%s: companion link client start", buf, 0xCu);
    }

    kdebug_trace();
    -[RPCompanionLinkClient activateWithCompletion:](v6->_client, "activateWithCompletion:", &__block_literal_global_1147);
    -[SBSRemoteDeviceReceiver _registerEverything](v6, "_registerEverything");

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSRemoteDeviceReceiver _deregisterEverything](self, "_deregisterEverything");
  v3.receiver = self;
  v3.super_class = (Class)SBSRemoteDeviceReceiver;
  -[SBSRemoteDeviceReceiver dealloc](&v3, sel_dealloc);
}

- (void)_registerEverything
{
  -[SBSRemoteDeviceReceiver _registerGetAllDebugInfo](self, "_registerGetAllDebugInfo");
  -[SBSRemoteDeviceReceiver _registerGetSelectDebugInfo](self, "_registerGetSelectDebugInfo");
  -[SBSRemoteDeviceReceiver _registerGetLEDInfo](self, "_registerGetLEDInfo");
  -[SBSRemoteDeviceReceiver _registerGetTuningInfo](self, "_registerGetTuningInfo");
  -[SBSRemoteDeviceReceiver _registerSetTuningInfoOnBox](self, "_registerSetTuningInfoOnBox");
  -[SBSRemoteDeviceReceiver _registerPlayTone](self, "_registerPlayTone");
  -[SBSRemoteDeviceReceiver _registerStopTone](self, "_registerStopTone");
  -[SBSRemoteDeviceReceiver _registerGetUserDefaults](self, "_registerGetUserDefaults");
  -[SBSRemoteDeviceReceiver _registerSetUserDefaults](self, "_registerSetUserDefaults");
  -[SBSRemoteDeviceReceiver _registerResetAllUserDefaults](self, "_registerResetAllUserDefaults");
  -[SBSRemoteDeviceReceiver _registerResetUserDefault](self, "_registerResetUserDefault");
  -[SBSRemoteDeviceReceiver _registerSendLEDCommand](self, "_registerSendLEDCommand");
  -[SBSRemoteDeviceReceiver _registerRender](self, "_registerRender");
  -[SBSRemoteDeviceReceiver _registerTriggerWiFiCoreCapture](self, "_registerTriggerWiFiCoreCapture");
  -[SBSRemoteDeviceReceiver _registerSendButtonCommand](self, "_registerSendButtonCommand");
  -[SBSRemoteDeviceReceiver _registerInjectSWUpdateToHome](self, "_registerInjectSWUpdateToHome");
  -[SBSRemoteDeviceReceiver _registerSetHomeUpdateState](self, "_registerSetHomeUpdateState");
  -[SBSRemoteDeviceReceiver _registerClearHomeSWUpdate](self, "_registerClearHomeSWUpdate");
  -[SBSRemoteDeviceReceiver _registerSetBootSpinner](self, "_registerSetBootSpinner");
  -[SBSRemoteDeviceReceiver _registerSetWifiEnabled](self, "_registerSetWifiEnabled");
  -[SBSRemoteDeviceReceiver _registerDisassociateCurrentNetwork](self, "_registerDisassociateCurrentNetwork");
  -[SBSRemoteDeviceReceiver _registerDisassociateNetworkWithName](self, "_registerDisassociateNetworkWithName");
  -[SBSRemoteDeviceReceiver _registerGetFeatureFlags](self, "_registerGetFeatureFlags");
  -[SBSRemoteDeviceReceiver _registerSetFeatureFlags](self, "_registerSetFeatureFlags");
  -[SBSRemoteDeviceReceiver _registerSetLEDContents](self, "_registerSetLEDContents");
  -[SBSRemoteDeviceReceiver _registerSiriSay](self, "_registerSiriSay");
  -[SBSRemoteDeviceReceiver _registerSUScanForSoftwareUpdate](self, "_registerSUScanForSoftwareUpdate");
  -[SBSRemoteDeviceReceiver _registerGetVolume](self, "_registerGetVolume");
  -[SBSRemoteDeviceReceiver _registerSetVolume](self, "_registerSetVolume");
  -[SBSRemoteDeviceReceiver _registerSetDeviceAsStereoLeader](self, "_registerSetDeviceAsStereoLeader");
  -[SBSRemoteDeviceReceiver _registerIsDeviceStereoFollower](self, "_registerIsDeviceStereoFollower");
  -[SBSRemoteDeviceReceiver _registerSysdiagnoseHasStarted](self, "_registerSysdiagnoseHasStarted");
  -[SBSRemoteDeviceReceiver _registerReboot](self, "_registerReboot");
  -[SBSRemoteDeviceReceiver _registerRequestDeferredReboot](self, "_registerRequestDeferredReboot");
  -[SBSRemoteDeviceReceiver _registerObliterate](self, "_registerObliterate");
  -[SBSRemoteDeviceReceiver _registerIdentifyWithOptions](self, "_registerIdentifyWithOptions");
  -[SBSRemoteDeviceReceiver _registerIntercomWithOptions](self, "_registerIntercomWithOptions");
  -[SBSRemoteDeviceReceiver _registerRequestForFetchingAlarmsAndTimers](self, "_registerRequestForFetchingAlarmsAndTimers");
  -[SBSRemoteDeviceReceiver _registerGetPowerEstimateForInterval](self, "_registerGetPowerEstimateForInterval");
  -[SBSRemoteDeviceReceiver _registerGetInstalledProfiles](self, "_registerGetInstalledProfiles");
  -[SBSRemoteDeviceReceiver _registerInstallProfileData](self, "_registerInstallProfileData");
  -[SBSRemoteDeviceReceiver _registerRemoveProfileByIdentifier](self, "_registerRemoveProfileByIdentifier");
  -[SBSRemoteDeviceReceiver _registerHandoffStart](self, "_registerHandoffStart");
  -[SBSRemoteDeviceReceiver _registerHandoffStartWithArtworkColors](self, "_registerHandoffStartWithArtworkColors");
  -[SBSRemoteDeviceReceiver _registerHandoffUpdateIntensity](self, "_registerHandoffUpdateIntensity");
  -[SBSRemoteDeviceReceiver _registerHandoffCancel](self, "_registerHandoffCancel");
  -[SBSRemoteDeviceReceiver _registerHandoffComplete](self, "_registerHandoffComplete");
}

- (void)_deregisterEverything
{
  -[SBSRemoteDeviceReceiver _deregisterGetAllDebugInfo](self, "_deregisterGetAllDebugInfo");
  -[SBSRemoteDeviceReceiver _deregisterGetSelectDebugInfo](self, "_deregisterGetSelectDebugInfo");
  -[SBSRemoteDeviceReceiver _deregisterGetLEDInfo](self, "_deregisterGetLEDInfo");
  -[SBSRemoteDeviceReceiver _deregisterGetTuningInfo](self, "_deregisterGetTuningInfo");
  -[SBSRemoteDeviceReceiver _deregisterSetTuningInfoOnBox](self, "_deregisterSetTuningInfoOnBox");
  -[SBSRemoteDeviceReceiver _deregisterPlayTone](self, "_deregisterPlayTone");
  -[SBSRemoteDeviceReceiver _deregisterStopTone](self, "_deregisterStopTone");
  -[SBSRemoteDeviceReceiver _deregisterGetUserDefaults](self, "_deregisterGetUserDefaults");
  -[SBSRemoteDeviceReceiver _deregisterSetUserDefaults](self, "_deregisterSetUserDefaults");
  -[SBSRemoteDeviceReceiver _deregisterResetAllUserDefaults](self, "_deregisterResetAllUserDefaults");
  -[SBSRemoteDeviceReceiver _deregisterResetUserDefault](self, "_deregisterResetUserDefault");
  -[SBSRemoteDeviceReceiver _deregisterSendLEDCommand](self, "_deregisterSendLEDCommand");
  -[SBSRemoteDeviceReceiver _deregisterRender](self, "_deregisterRender");
  -[SBSRemoteDeviceReceiver _deregisterTriggerWiFiCoreCapture](self, "_deregisterTriggerWiFiCoreCapture");
  -[SBSRemoteDeviceReceiver _deregisterSendButtonCommand](self, "_deregisterSendButtonCommand");
  -[SBSRemoteDeviceReceiver _deregisterInjectSWUpdateToHome](self, "_deregisterInjectSWUpdateToHome");
  -[SBSRemoteDeviceReceiver _deregisterSetHomeUpdateState](self, "_deregisterSetHomeUpdateState");
  -[SBSRemoteDeviceReceiver _deregisterClearHomeSWUpdate](self, "_deregisterClearHomeSWUpdate");
  -[SBSRemoteDeviceReceiver _deregisterSetBootSpinner](self, "_deregisterSetBootSpinner");
  -[SBSRemoteDeviceReceiver _deregisterSetWifiEnabled](self, "_deregisterSetWifiEnabled");
  -[SBSRemoteDeviceReceiver _deregisterDisassociateCurrentNetwork](self, "_deregisterDisassociateCurrentNetwork");
  -[SBSRemoteDeviceReceiver _deregisterDisassociateNetworkWithName](self, "_deregisterDisassociateNetworkWithName");
  -[SBSRemoteDeviceReceiver _deregisterGetFeatureFlags](self, "_deregisterGetFeatureFlags");
  -[SBSRemoteDeviceReceiver _deregisterSetFeatureFlags](self, "_deregisterSetFeatureFlags");
  -[SBSRemoteDeviceReceiver _deregisterSetLEDContents](self, "_deregisterSetLEDContents");
  -[SBSRemoteDeviceReceiver _deregisterSiriSay](self, "_deregisterSiriSay");
  -[SBSRemoteDeviceReceiver _deregisterSUScanForSoftwareUpdate](self, "_deregisterSUScanForSoftwareUpdate");
  -[SBSRemoteDeviceReceiver _deregisterGetVolume](self, "_deregisterGetVolume");
  -[SBSRemoteDeviceReceiver _deregisterSetVolume](self, "_deregisterSetVolume");
  -[SBSRemoteDeviceReceiver _deregisterSetDeviceAsStereoLeader](self, "_deregisterSetDeviceAsStereoLeader");
  -[SBSRemoteDeviceReceiver _deregisterIsDeviceStereoFollower](self, "_deregisterIsDeviceStereoFollower");
  -[SBSRemoteDeviceReceiver _deregisterSysdiagnoseHasStarted](self, "_deregisterSysdiagnoseHasStarted");
  -[SBSRemoteDeviceReceiver _deregisterReboot](self, "_deregisterReboot");
  -[SBSRemoteDeviceReceiver _deregisterRequestDeferredReboot](self, "_deregisterRequestDeferredReboot");
  -[SBSRemoteDeviceReceiver _deregisterObliterate](self, "_deregisterObliterate");
  -[SBSRemoteDeviceReceiver _deregisterIdentifyWithOptions](self, "_deregisterIdentifyWithOptions");
  -[SBSRemoteDeviceReceiver _deregisterIntercomWithOptions](self, "_deregisterIntercomWithOptions");
  -[SBSRemoteDeviceReceiver _deregisterRequestForFetchingAlarmsAndTimers](self, "_deregisterRequestForFetchingAlarmsAndTimers");
  -[SBSRemoteDeviceReceiver _deregisterGetPowerEstimateForInterval](self, "_deregisterGetPowerEstimateForInterval");
  -[SBSRemoteDeviceReceiver _deregisterGetInstalledProfiles](self, "_deregisterGetInstalledProfiles");
  -[SBSRemoteDeviceReceiver _deregisterInstallProfileData](self, "_deregisterInstallProfileData");
  -[SBSRemoteDeviceReceiver _deregisterRemoveProfileByIdentifier](self, "_deregisterRemoveProfileByIdentifier");
  -[SBSRemoteDeviceReceiver _deregisterHandoffStart](self, "_deregisterHandoffStart");
  -[SBSRemoteDeviceReceiver _deregisterHandoffStartWithArtworkColors](self, "_deregisterHandoffStartWithArtworkColors");
  -[SBSRemoteDeviceReceiver _deregisterHandoffUpdateIntensity](self, "_deregisterHandoffUpdateIntensity");
  -[SBSRemoteDeviceReceiver _deregisterHandoffCancel](self, "_deregisterHandoffCancel");
  -[SBSRemoteDeviceReceiver _deregisterHandoffComplete](self, "_deregisterHandoffComplete");
}

- (void)_registerGetAllDebugInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetAllDebugInfo"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetAllDebugInfo
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetAllDebugInfo"));

}

- (void)_registerGetSelectDebugInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetSelectDebugInfo"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetSelectDebugInfo
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetSelectDebugInfo"));

}

- (void)_registerGetLEDInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetLEDInfo"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetLEDInfo
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetLEDInfo"));

}

- (void)_registerGetTuningInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetTuningInfo"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetTuningInfo
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetTuningInfo"));

}

- (void)_registerSetTuningInfoOnBox
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerSetTuningInfoOnBox__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetTuningInfoOnBox"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetTuningInfoOnBox
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetTuningInfoOnBox"));

}

- (void)_registerPlayTone
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SBSRemoteDeviceReceiver__registerPlayTone__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoPlayTone"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterPlayTone
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoPlayTone"));

}

- (void)_registerStopTone
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SBSRemoteDeviceReceiver__registerStopTone__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoStopTone"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterStopTone
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoStopTone"));

}

- (void)_registerGetUserDefaults
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetUserDefaults"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetUserDefaults
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetUserDefaults"));

}

- (void)_registerSetUserDefaults
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerSetUserDefaults__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetUserDefaults"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetUserDefaults
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetUserDefaults"));

}

- (void)_registerResetAllUserDefaults
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerResetAllUserDefaults__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoResetAllUserDefaults"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterResetAllUserDefaults
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoResetAllUserDefaults"));

}

- (void)_registerResetUserDefault
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SBSRemoteDeviceReceiver__registerResetUserDefault__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoResetUserDefault"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterResetUserDefault
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoResetUserDefault"));

}

- (void)_registerSendLEDCommand
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSendLEDCommand__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSendLEDCommand"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSendLEDCommand
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSendLEDCommand"));

}

- (void)_registerRender
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SBSRemoteDeviceReceiver__registerRender__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoRender"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterRender
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoRender"));

}

- (void)_registerTriggerWiFiCoreCapture
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerTriggerWiFiCoreCapture__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.TriggerWiFiCoreCapture"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterTriggerWiFiCoreCapture
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.TriggerWiFiCoreCapture"));

}

- (void)_registerSendButtonCommand
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SBSRemoteDeviceReceiver__registerSendButtonCommand__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSendButtonCommand"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSendButtonCommand
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSendButtonCommand"));

}

- (void)_registerInjectSWUpdateToHome
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerInjectSWUpdateToHome__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoInjectSWUpdateToHome"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterInjectSWUpdateToHome
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoInjectSWUpdateToHome"));

}

- (void)_registerSetHomeUpdateState
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerSetHomeUpdateState__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetHomeUpdateState
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"));

}

- (void)_registerClearHomeSWUpdate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SBSRemoteDeviceReceiver__registerClearHomeSWUpdate__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterClearHomeSWUpdate
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetHomeUpdateState"));

}

- (void)_registerSetBootSpinner
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetBootSpinner__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetBootSpinner"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetBootSpinner
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetBootSpinner"));

}

- (void)_registerSetWifiEnabled
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetWifiEnabled__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetWifiEnabled"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetWifiEnabled
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetWifiEnabled"));

}

- (void)_registerDisassociateCurrentNetwork
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SBSRemoteDeviceReceiver__registerDisassociateCurrentNetwork__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoDisassociateCurrentNetwork"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterDisassociateCurrentNetwork
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoDisassociateCurrentNetwork"));

}

- (void)_registerDisassociateNetworkWithName
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SBSRemoteDeviceReceiver__registerDisassociateNetworkWithName__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoDisassociateNetworkWithName"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterDisassociateNetworkWithName
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoDisassociateNetworkWithName"));

}

- (void)_registerGetFeatureFlags
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetFeatureFlags"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetFeatureFlags
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetFeatureFlags"));

}

- (void)_registerSetFeatureFlags
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerSetFeatureFlags__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetFeatureFlags"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetFeatureFlags
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetFeatureFlags"));

}

- (void)_registerSetLEDContents
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SBSRemoteDeviceReceiver__registerSetLEDContents__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetLEDContents"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetLEDContents
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetLEDContents"));

}

- (void)_registerSiriSay
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SBSRemoteDeviceReceiver__registerSiriSay__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSiriSay"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSiriSay
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSiriSay"));

}

- (void)_registerSUScanForSoftwareUpdate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SBSRemoteDeviceReceiver__registerSUScanForSoftwareUpdate__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSUScanForSoftwareUpdate"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSUScanForSoftwareUpdate
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSUScanForSoftwareUpdate"));

}

- (void)_registerGetVolume
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoGetVolume"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetVolume
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoGetVolume"));

}

- (void)_registerSetVolume
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SBSRemoteDeviceReceiver__registerSetVolume__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.DebugInfoSetVolume"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetVolume
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.DebugInfoSetVolume"));

}

- (void)_registerSetDeviceAsStereoLeader
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SBSRemoteDeviceReceiver__registerSetDeviceAsStereoLeader__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSetDeviceAsStereoLeader
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.StereoLeaderRoleSetDeviceAsStereoLeader"));

}

- (void)_registerIsDeviceStereoFollower
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterIsDeviceStereoFollower
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.StereoLeaderRoleIsDeviceStereoFollower"));

}

- (void)_registerSysdiagnoseHasStarted
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__SBSRemoteDeviceReceiver__registerSysdiagnoseHasStarted__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterSysdiagnoseHasStarted
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.SysdiagnoseSysdiagnoseHasStarted"));

}

- (void)_registerReboot
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SBSRemoteDeviceReceiver__registerReboot__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.SystemReboot"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterReboot
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.SystemReboot"));

}

- (void)_registerRequestDeferredReboot
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__SBSRemoteDeviceReceiver__registerRequestDeferredReboot__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.SystemRequestDeferredReboot"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterRequestDeferredReboot
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.SystemRequestDeferredReboot"));

}

- (void)_registerObliterate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SBSRemoteDeviceReceiver__registerObliterate__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.Obliterate"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterObliterate
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.Obliterate"));

}

- (void)_registerIdentifyWithOptions
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SBSRemoteDeviceReceiver__registerIdentifyWithOptions__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.Identify"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterIdentifyWithOptions
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.Identify"));

}

- (void)_registerIntercomWithOptions
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SBSRemoteDeviceReceiver__registerIntercomWithOptions__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.Intercom"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterIntercomWithOptions
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.Intercom"));

}

- (void)_registerRequestForFetchingAlarmsAndTimers
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.SystemRequestFetchAlarmsAndTimers"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterRequestForFetchingAlarmsAndTimers
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.SystemRequestFetchAlarmsAndTimers"));

}

- (void)_registerGetPowerEstimateForInterval
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.GetPowerEstimateForInterval"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetPowerEstimateForInterval
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.GetPowerEstimateForInterval"));

}

- (void)_registerGetInstalledProfiles
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.GetInstalledProfiles"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterGetInstalledProfiles
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.GetInstalledProfiles"));

}

- (void)_registerInstallProfileData
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.InstallProfileData"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterInstallProfileData
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.InstallProfileData"));

}

- (void)_registerRemoveProfileByIdentifier
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.RemoveProfileByIdentifier"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterRemoveProfileByIdentifier
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.RemoveProfileByIdentifier"));

}

- (void)_registerHandoffStart
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SBSRemoteDeviceReceiver__registerHandoffStart__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartKey"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterHandoffStart
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartKey"));

}

- (void)_registerHandoffStartWithArtworkColors
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__SBSRemoteDeviceReceiver__registerHandoffStartWithArtworkColors__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterHandoffStartWithArtworkColors
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIStartWithArtworkColorsKey"));

}

- (void)_registerHandoffUpdateIntensity
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SBSRemoteDeviceReceiver__registerHandoffUpdateIntensity__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterHandoffUpdateIntensity
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.kSBSProximityHandoffUIUpdateIntensityKey"));

}

- (void)_registerHandoffCancel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SBSRemoteDeviceReceiver__registerHandoffCancel__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICancelKey"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterHandoffCancel
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICancelKey"));

}

- (void)_registerHandoffComplete
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBSRemoteDeviceReceiver client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBSRemoteDeviceReceiver__registerHandoffComplete__block_invoke;
  v4[3] = &unk_24EB7E1A8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICompleteKey"), 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_deregisterHandoffComplete
{
  id v2;

  -[SBSRemoteDeviceReceiver client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.sbs.kSBSProximityHandoffUICompleteKey"));

}

- (SBSImplementerInternal)delegate
{
  return (SBSImplementerInternal *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RPCompanionLinkClient)client
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__SBSRemoteDeviceReceiver__registerHandoffComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoffType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handoffCompleteInternalWithHandoffType:", v9);

  if (v11)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1B8], 0, 0);

}

void __49__SBSRemoteDeviceReceiver__registerHandoffCancel__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoffType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handoffCancelInternalWithHandoffType:", v9);

  if (v11)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1B8], 0, 0);

}

void __58__SBSRemoteDeviceReceiver__registerHandoffUpdateIntensity__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  id v15;

  v15 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoffType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intensity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v12;
  objc_msgSend(v13, "handoffUpdateIntensityInternal:handoffType:", v9, v14);

  if (v15)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x24BDBD1B8], 0, 0);

}

void __65__SBSRemoteDeviceReceiver__registerHandoffStartWithArtworkColors__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artworkColors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoffType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handoffStartWithArtworkColorsInternal:handoffType:", v8, v10);

  if (v12)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1B8], 0, 0);

}

void __48__SBSRemoteDeviceReceiver__registerHandoffStart__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handoffType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handoffStartInternalWithHandoffType:", v9);

  if (v11)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1B8], 0, 0);

}

void __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke_2;
  v12[3] = &unk_24EB7E3B0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "removeProfileByIdentifierInternal:completion:", v10, v12);

}

void __61__SBSRemoteDeviceReceiver__registerRemoveProfileByIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v7 = CFSTR("error");
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v5 + 16))(v5, v6, 0, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0, 0);
    }
  }

}

void __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("profileData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke_2;
  v12[3] = &unk_24EB7E3B0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "installProfileDataInternal:completion:", v10, v12);

}

void __54__SBSRemoteDeviceReceiver__registerInstallProfileData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v7 = CFSTR("error");
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v5 + 16))(v5, v6, 0, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0, 0);
    }
  }

}

void __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke_2;
  v9[3] = &unk_24EB7E280;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getInstalledProfilesInternal:", v9);

}

void __56__SBSRemoteDeviceReceiver__registerGetInstalledProfiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v7 = CFSTR("reply");
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v5 + 16))(v5, v6, 0, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0, 0);
    }
  }

}

void __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  double v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("interval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke_2;
  v15[3] = &unk_24EB7E378;
  v16 = v6;
  v13 = v6;
  LODWORD(v14) = v12;
  objc_msgSend(v9, "getPowerEstimateForIntervalInternal:reply:", v15, v14);

}

void __63__SBSRemoteDeviceReceiver__registerGetPowerEstimateForInterval__block_invoke_2(uint64_t a1, double a2, float a3)
{
  uint64_t v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v9[0] = CFSTR("joulesEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = CFSTR("period");
    v10[0] = v5;
    *(float *)&v6 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v3 + 16))(v3, v8, 0, 0);

  }
}

void __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke_2;
  v9[3] = &unk_24EB7E180;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getAllSyncedAlarmsAndTimersInternal:", v9);

}

void __69__SBSRemoteDeviceReceiver__registerRequestForFetchingAlarmsAndTimers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __55__SBSRemoteDeviceReceiver__registerIntercomWithOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intercomWithOptionsInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __55__SBSRemoteDeviceReceiver__registerIdentifyWithOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifyWithOptionsInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __46__SBSRemoteDeviceReceiver__registerObliterate__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "obliterateInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __57__SBSRemoteDeviceReceiver__registerRequestDeferredReboot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDeferredRebootInternal");

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0);

}

void __42__SBSRemoteDeviceReceiver__registerReboot__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rebootInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __57__SBSRemoteDeviceReceiver__registerSysdiagnoseHasStarted__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("started"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sysdiagnoseHasStartedInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke_2;
  v9[3] = &unk_24EB7E310;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "isDeviceStereoFollowerInternal:", v9);

}

void __58__SBSRemoteDeviceReceiver__registerIsDeviceStereoFollower__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = CFSTR("reply");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v4, 0, 0);

  }
}

void __59__SBSRemoteDeviceReceiver__registerSetDeviceAsStereoLeader__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("withOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDeviceAsStereoLeaderInternal:withOptions:", v10, v11);
  if (v12)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1B8], 0, 0);

}

void __45__SBSRemoteDeviceReceiver__registerSetVolume__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("volume"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "floatValue");
  objc_msgSend(v8, "setVolumeInternal:");

  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke_2;
  v9[3] = &unk_24EB7E2D0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getVolumeInternal:", v9);

}

void __45__SBSRemoteDeviceReceiver__registerGetVolume__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v4 = CFSTR("reply");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v1 + 16))(v1, v3, 0, 0);

  }
}

void __59__SBSRemoteDeviceReceiver__registerSUScanForSoftwareUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suScanForSoftwareUpdateInternal");

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0);

}

void __43__SBSRemoteDeviceReceiver__registerSiriSay__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phrase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "siriSayInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __50__SBSRemoteDeviceReceiver__registerSetLEDContents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LEDContents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLEDContentsInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __51__SBSRemoteDeviceReceiver__registerSetFeatureFlags__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFeatureFlagsInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke_2;
  v9[3] = &unk_24EB7E280;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getFeatureFlagsInternal:", v9);

}

void __51__SBSRemoteDeviceReceiver__registerGetFeatureFlags__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __63__SBSRemoteDeviceReceiver__registerDisassociateNetworkWithName__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disassociateNetworkWithNameInternal:", v10);

  if (v11)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1B8], 0, 0);

}

void __62__SBSRemoteDeviceReceiver__registerDisassociateCurrentNetwork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disassociateCurrentNetworkInternal");

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0);

}

void __50__SBSRemoteDeviceReceiver__registerSetWifiEnabled__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWifiEnabledInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __50__SBSRemoteDeviceReceiver__registerSetBootSpinner__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBootSpinnerInternal:", objc_msgSend(v9, "BOOLValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __53__SBSRemoteDeviceReceiver__registerClearHomeSWUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearHomeSWUpdateInternal");

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0);

}

void __54__SBSRemoteDeviceReceiver__registerSetHomeUpdateState__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHomeUpdateStateInternal:", objc_msgSend(v9, "integerValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __56__SBSRemoteDeviceReceiver__registerInjectSWUpdateToHome__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "injectSWUpdateToHomeInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __53__SBSRemoteDeviceReceiver__registerSendButtonCommand__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sendButtonCommandInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __58__SBSRemoteDeviceReceiver__registerTriggerWiFiCoreCapture__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "triggerWiFiCoreCaptureInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __42__SBSRemoteDeviceReceiver__registerRender__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderInternal:", v6);

  if (v9)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1B8], 0, 0);

}

void __50__SBSRemoteDeviceReceiver__registerSendLEDCommand__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sendLEDCommandInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __52__SBSRemoteDeviceReceiver__registerResetUserDefault__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resetUserDefaultInternal:", v9);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __56__SBSRemoteDeviceReceiver__registerResetAllUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetAllUserDefaultsInternal");

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1B8], 0, 0);

}

void __51__SBSRemoteDeviceReceiver__registerSetUserDefaults__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("withValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setUserDefaultsInternal:withValue:", v9, v10);
  if (v11)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1B8], 0, 0);

}

void __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke_2;
  v9[3] = &unk_24EB7E180;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getUserDefaultsInternal:", v9);

}

void __51__SBSRemoteDeviceReceiver__registerGetUserDefaults__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __44__SBSRemoteDeviceReceiver__registerStopTone__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stopToneInternal:", objc_msgSend(v9, "integerValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __44__SBSRemoteDeviceReceiver__registerPlayTone__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "playToneInternal:", objc_msgSend(v9, "integerValue"));
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0, 0);

}

void __54__SBSRemoteDeviceReceiver__registerSetTuningInfoOnBox__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("box"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("at"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("withValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "floatValue");
  objc_msgSend(v8, "setTuningInfoOnBoxInternal:at:withValue:", v9, v10);

  if (v12)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1B8], 0, 0);

}

void __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke_2;
  v9[3] = &unk_24EB7E180;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getTuningInfoInternal:", v9);

}

void __49__SBSRemoteDeviceReceiver__registerGetTuningInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke_2;
  v9[3] = &unk_24EB7E180;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getLEDInfoInternal:", v9);

}

void __46__SBSRemoteDeviceReceiver__registerGetLEDInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keys"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke_2;
  v12[3] = &unk_24EB7E180;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "getSelectDebugInfoInternal:reply:", v10, v12);

}

void __54__SBSRemoteDeviceReceiver__registerGetSelectDebugInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke_2;
  v9[3] = &unk_24EB7E180;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getAllDebugInfoInternal:", v9);

}

void __51__SBSRemoteDeviceReceiver__registerGetAllDebugInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v6 = CFSTR("reply");
    v7[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v5, 0, 0);

  }
}

void __44__SBSRemoteDeviceReceiver_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  kdebug_trace();
  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SBSRemoteDeviceReceiver initWithDelegate:]_block_invoke";
      v7 = 2112;
      v8 = v2;
      _os_log_error_impl(&dword_222D7A000, v4, OS_LOG_TYPE_ERROR, "%s: Error activating companion link client '%@'", (uint8_t *)&v5, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SBSRemoteDeviceReceiver initWithDelegate:]_block_invoke";
    _os_log_impl(&dword_222D7A000, v4, OS_LOG_TYPE_DEFAULT, "%s: companion link client activated succcessfully", (uint8_t *)&v5, 0xCu);
  }

}

@end
