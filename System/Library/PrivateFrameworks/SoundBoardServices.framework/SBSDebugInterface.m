@implementation SBSDebugInterface

- (SBSDebugInterface)init
{
  return -[SBSDebugInterface initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSDebugInterface)initWithTarget:(id)a3
{
  id v4;
  SBSDebugInterface *v5;
  uint64_t v6;
  SBSDebugInfoImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSDebugInterface;
  v5 = -[SBSDebugInterface init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSDebugInfoImplementer *)v6;

  }
  return v5;
}

- (void)getAllDebugInfo:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSDebugInfoImplementer getAllDebugInfo:](self->_sbProxy, "getAllDebugInfo:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v4, 2u);
    }

  }
}

- (void)getSelectDebugInfo:(id)a3 reply:(id)a4
{
  -[SBSDebugInfoImplementer getSelectDebugInfo:reply:](self->_sbProxy, "getSelectDebugInfo:reply:", a3, a4);
}

- (void)getTuningInfo:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSDebugInfoImplementer getTuningInfo:](self->_sbProxy, "getTuningInfo:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v4, 2u);
    }

  }
}

- (void)setTuningInfoOnBox:(id)a3 at:(id)a4 withValue:(float)a5
{
  -[SBSDebugInfoImplementer setTuningInfoOnBox:at:withValue:](self->_sbProxy, "setTuningInfoOnBox:at:withValue:", a3, a4);
}

- (void)playTone:(unsigned int)a3
{
  -[SBSDebugInfoImplementer playTone:](self->_sbProxy, "playTone:", *(_QWORD *)&a3);
}

- (void)stopTone:(unsigned int)a3
{
  -[SBSDebugInfoImplementer stopTone:](self->_sbProxy, "stopTone:", *(_QWORD *)&a3);
}

- (void)getUserDefaults:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSDebugInfoImplementer getUserDefaults:](self->_sbProxy, "getUserDefaults:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v4, 2u);
    }

  }
}

- (void)setUserDefaults:(id)a3 withValue:(id)a4
{
  -[SBSDebugInfoImplementer setUserDefaults:withValue:](self->_sbProxy, "setUserDefaults:withValue:", a3, a4);
}

- (void)resetAllUserDefaults
{
  -[SBSDebugInfoImplementer resetAllUserDefaults](self->_sbProxy, "resetAllUserDefaults");
}

- (void)resetUserDefault:(id)a3
{
  -[SBSDebugInfoImplementer resetUserDefault:](self->_sbProxy, "resetUserDefault:", a3);
}

- (void)getLEDInfo:(id)a3
{
  -[SBSDebugInfoImplementer getLEDInfo:](self->_sbProxy, "getLEDInfo:", a3);
}

- (void)sendLEDCommand:(id)a3
{
  -[SBSDebugInfoImplementer sendLEDCommand:](self->_sbProxy, "sendLEDCommand:", a3);
}

- (void)render:(id)a3
{
  -[SBSDebugInfoImplementer render:](self->_sbProxy, "render:", a3);
}

- (void)setLEDContents:(id)a3
{
  -[SBSDebugInfoImplementer setLEDContents:](self->_sbProxy, "setLEDContents:", a3);
}

- (void)siriSay:(id)a3
{
  -[SBSDebugInfoImplementer siriSay:](self->_sbProxy, "siriSay:", a3);
}

- (void)triggerWiFiCoreCapture:(id)a3
{
  -[SBSDebugInfoImplementer triggerWiFiCoreCapture:](self->_sbProxy, "triggerWiFiCoreCapture:", a3);
}

- (void)sendButtonCommand:(id)a3
{
  -[SBSDebugInfoImplementer sendButtonCommand:](self->_sbProxy, "sendButtonCommand:", a3);
}

- (void)injectSWUpdateToHome:(id)a3
{
  -[SBSDebugInfoImplementer injectSWUpdateToHome:](self->_sbProxy, "injectSWUpdateToHome:", a3);
}

- (void)setHomeUpdateState:(int64_t)a3
{
  -[SBSDebugInfoImplementer setHomeUpdateState:](self->_sbProxy, "setHomeUpdateState:", a3);
}

- (void)clearHomeSWUpdate
{
  -[SBSDebugInfoImplementer clearHomeSWUpdate](self->_sbProxy, "clearHomeSWUpdate");
}

- (void)setBootSpinner:(BOOL)a3
{
  -[SBSDebugInfoImplementer setBootSpinner:](self->_sbProxy, "setBootSpinner:", a3);
}

- (void)setWifiEnabled:(BOOL)a3
{
  -[SBSDebugInfoImplementer setWifiEnabled:](self->_sbProxy, "setWifiEnabled:", a3);
}

- (void)disassociateCurrentNetwork
{
  -[SBSDebugInfoImplementer disassociateCurrentNetwork](self->_sbProxy, "disassociateCurrentNetwork");
}

- (void)disassociateNetworkWithName:(id)a3
{
  -[SBSDebugInfoImplementer disassociateNetworkWithName:](self->_sbProxy, "disassociateNetworkWithName:", a3);
}

- (void)getFeatureFlags:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSDebugInfoImplementer getFeatureFlags:](self->_sbProxy, "getFeatureFlags:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v4, 2u);
    }

  }
}

- (void)setFeatureFlags:(id)a3
{
  -[SBSDebugInfoImplementer setFeatureFlags:](self->_sbProxy, "setFeatureFlags:", a3);
}

- (void)suScanForSoftwareUpdate
{
  -[SBSDebugInfoImplementer suScanForSoftwareUpdate](self->_sbProxy, "suScanForSoftwareUpdate");
}

- (void)getVolume:(id)a3
{
  -[SBSDebugInfoImplementer getVolume:](self->_sbProxy, "getVolume:", a3);
}

- (void)setVolume:(float)a3
{
  -[SBSDebugInfoImplementer setVolume:](self->_sbProxy, "setVolume:");
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSDebugInterface;
  -[SBSDebugInterface dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
