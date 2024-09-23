@implementation SFService

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (BOOL)needsKeyboard
{
  return self->_needsKeyboard;
}

- (unsigned)deviceModelCode
{
  return self->_deviceModelCode;
}

- (unsigned)deviceColorCode
{
  return self->_deviceColorCode;
}

- (unsigned)deviceClassCode
{
  return self->_deviceClassCode;
}

- (NSData)authTagOverride
{
  return self->_authTagOverride;
}

- (int64_t)advertiseRate
{
  return self->_advertiseRate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFService)init
{
  SFService *v2;
  SFService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFService;
  v2 = -[SFService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    v3->_ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
  }
  return v3;
}

- (SFService)initWithCoder:(id)a3
{
  id v4;
  SFService *v5;
  SFService *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  uint64_t v11;
  NSString *identifier;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSUUID *serviceUUID;
  id v23;
  SFService *v24;
  objc_super v26;
  uint64_t v27;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFService;
  v5 = -[SFService init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    SFMainQueue(v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    v6->_ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    v6->_ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("advR")))
      v6->_advertiseRate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("advR"));
    v9 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("auE")))
      v6->_autoUnlockEnabled = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("auE"));
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("auW")))
      v6->_autoUnlockWatch = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("auW"));
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("dat")))
      v6->_deviceActionType = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("dat"));
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("deviceClassCode")))
      v6->_deviceClassCode = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("deviceClassCode"));
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("deviceColorCode")))
      v6->_deviceColorCode = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("deviceColorCode"));
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("deviceModelCode")))
      v6->_deviceModelCode = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("deviceModelCode"));
    v10 = v9;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("ds")))
      v6->_duetSync = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("ds"));

    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("prob")))
      v6->_hasProblem = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("prob"));
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("ident")))
    {
      objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
      v11 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v11;

    }
    v13 = v10;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("awdl")))
      v6->_needsAWDL = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("awdl"));

    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("kb")))
      v6->_needsKeyboard = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("kb"));
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("setup")))
      v6->_needsSetup = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("setup"));
    v14 = v13;
    if (objc_msgSend(v14, "containsValueForKey:", CFSTR("oso")))
      v6->_overrideScreenOff = objc_msgSend(v14, "decodeBoolForKey:", CFSTR("oso"));

    v15 = v14;
    if (objc_msgSend(v15, "containsValueForKey:", CFSTR("pf")))
      v6->_problemFlags = objc_msgSend(v15, "decodeInt64ForKey:", CFSTR("pf"));

    if (objc_msgSend(v15, "containsValueForKey:", CFSTR("st")))
    {
      v16 = objc_msgSend(v15, "decodeIntegerForKey:", CFSTR("st"));
      v6->_serviceType = v16;
      if (v16 >= 0x100)
      {
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "raise:format:", v18, CFSTR("%@: service type out-of-range: %ld"), v19, v16);

      }
    }
    v20 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("svid")))
    {
      objc_msgSend(v20, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("svid"));
      v21 = objc_claimAutoreleasedReturnValue();
      serviceUUID = v6->_serviceUUID;
      v6->_serviceUUID = (NSUUID *)v21;

    }
    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_sessionFlags = v27;
    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("wake")))
      v6->_wakeDevice = objc_msgSend(v20, "decodeBoolForKey:", CFSTR("wake"));
    v23 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (objc_msgSend(v23, "containsValueForKey:", CFSTR("wl")))
      v6->_watchLocked = objc_msgSend(v23, "decodeBoolForKey:", CFSTR("wl"));
    v24 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t advertiseRate;
  NSData *authTagOverride;
  NSString *identifier;
  unint64_t problemFlags;
  NSString *requestSSID;
  NSUUID *serviceUUID;
  uint64_t sessionFlags;
  NSData *targetAuthTag;
  id v13;

  v4 = a3;
  advertiseRate = self->_advertiseRate;
  v13 = v4;
  if (advertiseRate)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", advertiseRate, CFSTR("advR"));
    v4 = v13;
  }
  authTagOverride = self->_authTagOverride;
  if (authTagOverride)
  {
    objc_msgSend(v13, "encodeObject:forKey:", authTagOverride, CFSTR("ato"));
    v4 = v13;
  }
  if (self->_autoUnlockEnabled)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("auE"));
    v4 = v13;
  }
  if (self->_autoUnlockWatch)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("auW"));
    v4 = v13;
  }
  if (self->_deviceActionType)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_deviceClassCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_deviceColorCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_deviceModelCode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_duetSync)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("ds"));
    v4 = v13;
  }
  if (self->_hasProblem)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("prob"));
    v4 = v13;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("ident"));
    v4 = v13;
  }
  if (self->_needsAWDL)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("awdl"));
    v4 = v13;
  }
  if (self->_needsKeyboard)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("kb"));
    v4 = v13;
  }
  if (self->_needsSetup)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("setup"));
    v4 = v13;
  }
  if (self->_overrideScreenOff)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("oso"));
    v4 = v13;
  }
  problemFlags = self->_problemFlags;
  if (problemFlags)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", problemFlags, CFSTR("pf"));
    v4 = v13;
  }
  requestSSID = self->_requestSSID;
  if (requestSSID)
  {
    objc_msgSend(v13, "encodeObject:forKey:", requestSSID, CFSTR("rSSID"));
    v4 = v13;
  }
  if (self->_serviceType)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    objc_msgSend(v13, "encodeObject:forKey:", serviceUUID, CFSTR("svid"));
    v4 = v13;
  }
  sessionFlags = self->_sessionFlags;
  if ((_DWORD)sessionFlags)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", sessionFlags, CFSTR("seFl"));
    v4 = v13;
  }
  targetAuthTag = self->_targetAuthTag;
  if (targetAuthTag)
  {
    objc_msgSend(v13, "encodeObject:forKey:", targetAuthTag, CFSTR("tATag"));
    v4 = v13;
  }
  if (self->_wakeDevice)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("wake"));
    v4 = v13;
  }
  if (self->_watchLocked)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("wl"));
    v4 = v13;
  }

}

- (void)dealloc
{
  LogCategory *ucatCore;
  LogCategory *ucatCrypto;
  SFService *v5;
  SEL v6;
  objc_super v7;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v5 = (SFService *)FatalErrorF();
    -[SFService _cleanup](v5, v6);
  }
  else
  {
    -[SFService _cleanup](self, "_cleanup");
    ucatCore = self->_ucatCore;
    if (ucatCore && (ucatCore->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucatCore = 0;
    }
    ucatCrypto = self->_ucatCrypto;
    if (ucatCrypto)
    {
      if ((ucatCrypto->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucatCrypto = 0;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)SFService;
    -[SFService dealloc](&v7, sel_dealloc);
  }
}

- (void)_cleanup
{
  id errorHandler;
  id eventMessageHandler;
  id interruptionHandler;
  id invalidationHandler;
  id pairSetupCompletionHandler;
  id peerDisconnectedHandler;
  id receivedFramePeerHandler;
  id receivedObjectHandler;
  id requestMessageHandler;
  id responseMessageInternalHandler;
  id sessionStartedHandler;
  id sessionEndedHandler;
  id sessionSecuredHandler;
  id showPINHandler;
  id showPINHandlerEx;
  id hidePINHandler;
  id promptForPINHandler;
  NSXPCConnection *xpcCnx;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  eventMessageHandler = self->_eventMessageHandler;
  self->_eventMessageHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  pairSetupCompletionHandler = self->_pairSetupCompletionHandler;
  self->_pairSetupCompletionHandler = 0;

  peerDisconnectedHandler = self->_peerDisconnectedHandler;
  self->_peerDisconnectedHandler = 0;

  receivedFramePeerHandler = self->_receivedFramePeerHandler;
  self->_receivedFramePeerHandler = 0;

  receivedObjectHandler = self->_receivedObjectHandler;
  self->_receivedObjectHandler = 0;

  requestMessageHandler = self->_requestMessageHandler;
  self->_requestMessageHandler = 0;

  responseMessageInternalHandler = self->_responseMessageInternalHandler;
  self->_responseMessageInternalHandler = 0;

  sessionStartedHandler = self->_sessionStartedHandler;
  self->_sessionStartedHandler = 0;

  sessionEndedHandler = self->_sessionEndedHandler;
  self->_sessionEndedHandler = 0;

  sessionSecuredHandler = self->_sessionSecuredHandler;
  self->_sessionSecuredHandler = 0;

  showPINHandler = self->_showPINHandler;
  self->_showPINHandler = 0;

  showPINHandlerEx = self->_showPINHandlerEx;
  self->_showPINHandlerEx = 0;

  hidePINHandler = self->_hidePINHandler;
  self->_hidePINHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (id)description
{
  id v3;
  int serviceType;
  id *v5;
  id v6;
  id v7;
  id v9;
  NSData *authTagOverride;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSData *targetAuthTag;
  id v23;
  id v24;
  NSData *v26;
  NSData *v27;
  id v28;
  _QWORD v29[2];

  v29[1] = 0;
  NSAppendPrintF();
  v3 = 0;
  serviceType = self->_serviceType;
  if (self->_serviceType)
  {
    v29[0] = v3;
    SFNearbyBLEServiceTypeToString(serviceType);
    v5 = (id *)v29;
  }
  else
  {
    if (!self->_identifier)
      goto LABEL_6;
    v28 = v3;
    v5 = &v28;
  }
  NSAppendPrintF();
  v6 = *v5;

  v3 = v6;
LABEL_6:
  if (self->_invalidateCalled)
  {
    NSAppendPrintF();
    v7 = v3;

    v3 = v7;
  }
  if (self->_advertiseRate)
  {
    NSAppendPrintF();
    v9 = v3;

    v3 = v9;
  }
  authTagOverride = self->_authTagOverride;
  if (authTagOverride)
  {
    v26 = authTagOverride;
    NSAppendPrintF();
    v11 = v3;

    v3 = v11;
  }
  if (self->_autoUnlockEnabled)
  {
    NSAppendPrintF();
    v12 = v3;

    v3 = v12;
  }
  if (self->_autoUnlockWatch)
  {
    NSAppendPrintF();
    v13 = v3;

    v3 = v13;
  }
  if (self->_deviceActionType)
  {
    SFDeviceActionTypeToString(self->_deviceActionType);
    NSAppendPrintF();
    v14 = v3;

    v3 = v14;
  }
  if (self->_duetSync)
  {
    NSAppendPrintF();
    v15 = v3;

    v3 = v15;
  }
  if (self->_needsAWDL)
  {
    NSAppendPrintF();
    v16 = v3;

    v3 = v16;
  }
  if (self->_needsKeyboard)
  {
    NSAppendPrintF();
    v17 = v3;

    v3 = v17;
  }
  if (self->_needsSetup)
  {
    SFDeviceActionTypeToString(self->_deviceActionType);
    NSAppendPrintF();
    v18 = v3;

    v3 = v18;
  }
  if (self->_overrideScreenOff)
  {
    NSAppendPrintF();
    v19 = v3;

    v3 = v19;
  }
  if (self->_requestSSID)
  {
    NSAppendPrintF();
    v20 = v3;

    v3 = v20;
  }
  if (self->_sessionFlags)
  {
    NSAppendPrintF();
    v21 = v3;

    v3 = v21;
  }
  targetAuthTag = self->_targetAuthTag;
  if (targetAuthTag)
  {
    v27 = targetAuthTag;
    NSAppendPrintF();
    v23 = v3;

    v3 = v23;
  }
  if (self->_watchLocked)
  {
    NSAppendPrintF();
    v24 = v3;

    v3 = v24;
  }
  return v3;
}

- (void)setAdvertiseRate:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SFService_setAdvertiseRate___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __30__SFService_setAdvertiseRate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setAutoUnlockEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__SFService_setAutoUnlockEnabled___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __34__SFService_setAutoUnlockEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 99) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setAutoUnlockWatch:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__SFService_setAutoUnlockWatch___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __32__SFService_setAutoUnlockWatch___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 100) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SFService_setDeviceActionType___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __33__SFService_setDeviceActionType___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDuetSync:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__SFService_setDuetSync___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __25__SFService_setDuetSync___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 89) = *(_BYTE *)(result + 40);
  return result;
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6 peer:(id)a7
{
  void *v11;
  void *v12;
  int v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:", a3, a4, a5, a6);
  else
    v13 = -6727;

  return v13;
}

- (void)clearEncryptionInfoForPeer:(id)a3
{
  id v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearEncryptionInfo");

}

- (void)setHasProblem:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setHasProblem___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __27__SFService_setHasProblem___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 95) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

  -[NSString UTF8String](self->_label, "UTF8String");
  ASPrintF();
}

- (void)setNeedsAWDL:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__SFService_setNeedsAWDL___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __26__SFService_setNeedsAWDL___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 90) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setNeedsKeyboard:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SFService_setNeedsKeyboard___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __30__SFService_setNeedsKeyboard___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 91) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setNeedsSetup:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setNeedsSetup___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __27__SFService_setNeedsSetup___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 92) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setProblemFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__SFService_setProblemFlags___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __29__SFService_setProblemFlags___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 352) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setTargetAuthTag:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SFService_setTargetAuthTag___block_invoke;
  v6[3] = &unk_1E482D3A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v6);

}

void __30__SFService_setTargetAuthTag___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), *(id *)(a1 + 40));
}

- (void)setWakeDevice:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SFService_setWakeDevice___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __27__SFService_setWakeDevice___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 97) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setWatchLocked:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__SFService_setWatchLocked___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFService _performActivateSafeChange:](self, "_performActivateSafeChange:", v3);
}

uint64_t __28__SFService_setWatchLocked___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 106) = *(_BYTE *)(result + 40);
  return result;
}

- (void)updateWithService:(id)a3
{
  NSData *v4;
  NSData *targetAuthTag;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "advertiseRate"))
    self->_advertiseRate = objc_msgSend(v6, "advertiseRate");
  self->_autoUnlockEnabled = objc_msgSend(v6, "autoUnlockEnabled");
  self->_autoUnlockWatch = objc_msgSend(v6, "autoUnlockWatch");
  self->_deviceActionType = objc_msgSend(v6, "deviceActionType");
  self->_duetSync = objc_msgSend(v6, "duetSync");
  self->_hasProblem = objc_msgSend(v6, "hasProblem");
  self->_needsAWDL = objc_msgSend(v6, "needsAWDL");
  self->_needsKeyboard = objc_msgSend(v6, "needsKeyboard");
  self->_needsSetup = objc_msgSend(v6, "needsSetup");
  self->_problemFlags = objc_msgSend(v6, "problemFlags");
  self->_wakeDevice = objc_msgSend(v6, "wakeDevice");
  self->_watchLocked = objc_msgSend(v6, "watchLocked");
  objc_msgSend(v6, "targetAuthTag");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  targetAuthTag = self->_targetAuthTag;
  self->_targetAuthTag = v4;

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFService *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SFService_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __36__SFService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  int var0;
  NSString *v9;
  int serviceType;
  NSUUID *v11;
  NSUUID *serviceUUID;
  NSUUID *v13;
  NSUUID *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *requestQueue;
  uint64_t v17;
  NSXPCConnection *xpcCnx;
  id v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  unsigned int v33;
  os_activity_scope_state_s state;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v33 = 0;
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_invalidateCalled)
  {
    v9 = 0;
    v21 = 4294960572;
  }
  else
  {
    v9 = self->_identifier;
    if (v9)
    {
      serviceType = self->_serviceType;
      if (!self->_serviceType)
      {
        serviceType = SFServiceIdentifierToType(v9);
        self->_serviceType = serviceType;
      }
      if (self->_serviceUUID)
        goto LABEL_35;
      SFServiceTypeToUUID(serviceType);
      v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      serviceUUID = self->_serviceUUID;
      self->_serviceUUID = v11;

      if (self->_serviceUUID
        || (SFServiceIdentifierToUUID(v9, (int *)&v33),
            v13 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            v14 = self->_serviceUUID,
            self->_serviceUUID = v13,
            v14,
            self->_serviceUUID))
      {
LABEL_35:
        if (!self->_requestQueue)
        {
          v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          requestQueue = self->_requestQueue;
          self->_requestQueue = v15;

        }
        -[SFService _ensureXPCStarted](self, "_ensureXPCStarted");
        self->_activateInProgress = 1;
        v17 = MEMORY[0x1E0C809B0];
        xpcCnx = self->_xpcCnx;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __37__SFService__activateWithCompletion___block_invoke;
        v31[3] = &unk_1E482EE00;
        v31[4] = self;
        v19 = v6;
        v32 = v19;
        -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v17;
        v29[1] = 3221225472;
        v29[2] = __37__SFService__activateWithCompletion___block_invoke_2;
        v29[3] = &unk_1E482EE00;
        v29[4] = self;
        v30 = v19;
        objc_msgSend(v20, "serviceActivate:completion:", self, v29);

        v33 = 0;
        goto LABEL_15;
      }
      v21 = 4294960588;
    }
    else
    {
      v21 = 4294960551;
    }
  }
  v33 = v21;
  v22 = self->_ucatCore->var0;
  if (v22 <= 60)
  {
    if (v22 != -1)
    {
LABEL_21:
      v28 = v21;
      LogPrintF();
      goto LABEL_23;
    }
    if (_LogCategory_Initialize())
    {
      v21 = v33;
      goto LABEL_21;
    }
  }
LABEL_23:
  if (v6)
  {
    v23 = (int)v33;
    if (v33)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v25 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v25;
      v26 = CFSTR("?");
      if (v25)
        v26 = (const __CFString *)v25;
      v36[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1, v28);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v23, v4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    (*((void (**)(id, void *))v6 + 2))(v6, v27);
    if ((_DWORD)v23)
    {

    }
  }
LABEL_15:

  os_activity_scope_leave(&state);
}

void __37__SFService__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 11))
  {
    v5 = **(_DWORD **)(v4 + 32);
    if (v5 <= 60)
    {
      v8 = v3;
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), v3 = v8, v6))
      {
        LogPrintF();
        v3 = v8;
      }
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v9 = v3;
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    v3 = v9;
  }

}

void __37__SFService__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  if (!v3)
  {
    objc_msgSend((id)v4, "_activated");
    goto LABEL_7;
  }
  if (!*(_BYTE *)(v4 + 11))
  {
    v5 = **(_DWORD **)(v4 + 32);
    if (v5 <= 60)
    {
      if (v5 != -1 || (v7 = _LogCategory_Initialize(), v3 = v8, v7))
      {
        LogPrintF();
LABEL_7:
        v3 = v8;
      }
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    v3 = v8;
  }

}

- (void)_activated
{
  int var0;

  self->_activateCompleted = 1;
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (void)_ensureXPCStarted
{
  NSXPCListenerEndpoint *testListenerEndpoint;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t v8;
  void *v9;
  int var0;
  _QWORD v11[5];
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (testListenerEndpoint)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", self->_testListenerEndpoint);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__SFService__ensureXPCStarted__block_invoke;
    v12[3] = &unk_1E482DF78;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __30__SFService__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_1E482DF78;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DC108);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucatCore->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

uint64_t __30__SFService__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __30__SFService__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  int var0;
  void (**interruptionHandler)(void);
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  os_activity_scope_state_s state;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucatCore->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  *(_WORD *)&self->_activateInProgress = 0;
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  if (self->_activateCalled)
  {
    v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    v6 = self->_ucatCore->var0;
    if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[SFService _ensureXPCStarted](self, "_ensureXPCStarted");
    self->_activateInProgress = 1;
    v7 = MEMORY[0x1E0C809B0];
    xpcCnx = self->_xpcCnx;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __25__SFService__interrupted__block_invoke;
    v11[3] = &unk_1E482DFF0;
    v11[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __25__SFService__interrupted__block_invoke_2;
    v10[3] = &unk_1E482DFF0;
    v10[4] = self;
    objc_msgSend(v9, "serviceActivate:completion:", self, v10);

    os_activity_scope_leave(&state);
  }
}

void __25__SFService__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  if (v3)
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
    if (v4 <= 60)
    {
      v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }

}

void __25__SFService__interrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  v4 = *(_DWORD ***)(a1 + 32);
  if (!v3)
  {
    v7 = 0;
    objc_msgSend(v4, "_activated");
    goto LABEL_6;
  }
  v5 = *v4[4];
  if (v5 <= 60)
  {
    v7 = v3;
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v3 = v7, v6))
    {
      LogPrintF();
LABEL_6:
      v3 = v7;
    }
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SFService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 11))
  {
    *(_BYTE *)(v1 + 11) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    v6 = *(void **)(v3 + 80);
    if (v6)
    {
      objc_msgSend(v6, "invalidate");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = 0;

    }
    else
    {
      objc_msgSend((id)v3, "_invalidated");
    }
  }
}

- (void)_invalidated
{
  int var0;
  NSMutableDictionary *requestQueue;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v6;
  void (**invalidationHandler)(void);
  int v8;
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_requestQueue, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_64);
    -[NSMutableDictionary removeAllObjects](self->_requestQueue, "removeAllObjects");
    requestQueue = self->_requestQueue;
    self->_requestQueue = 0;

    sessions = self->_sessions;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__SFService__invalidated__block_invoke_2;
    v9[3] = &unk_1E48326A8;
    v9[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[NSMutableDictionary removeAllObjects](self->_sessions, "removeAllObjects");
    v6 = self->_sessions;
    self->_sessions = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    -[SFService _cleanup](self, "_cleanup");
    self->_invalidateDone = 1;
    v8 = self->_ucatCore->var0;
    if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

void __25__SFService__invalidated__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "responseHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2F90];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("?");
    if (v8)
      v10 = (const __CFString *)v8;
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -6723, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v12, 0);

  }
  objc_msgSend(v3, "invalidate");

}

void __25__SFService__invalidated__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2F90];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("?");
    if (v8)
      v10 = (const __CFString *)v8;
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -6723, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v4, v12);

  }
  objc_msgSend(v4, "invalidate");

}

- (void)_performActivateSafeChange:(id)a3
{
  void (**v4)(_QWORD);
  SFService *v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  _QWORD v8[5];
  void (**v9)(_QWORD);
  os_activity_scope_state_s state;

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceUpdate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    dispatchQueue = v5->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__SFService__performActivateSafeChange___block_invoke;
    v8[3] = &unk_1E482E0F0;
    v8[4] = v5;
    v9 = v4;
    dispatch_async(dispatchQueue, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

void __40__SFService__performActivateSafeChange___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__SFService_sendEvent___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

}

void __23__SFService_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceSendEvent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSendEvent:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&state);
  }
  else
  {
    v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SFService_sendRequest___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(dispatchQueue, block);

}

void __25__SFService_sendRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = a1[4];
  if (*(_QWORD *)(v2 + 80))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceSendRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(a1[4] + 80), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSendRequest:", a1[5]);

    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[5], a1[6]);
    os_activity_scope_leave(&state);

  }
  else
  {
    v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendResponse:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__SFService_sendResponse___block_invoke;
    block[3] = &unk_1E482D3A0;
    block[4] = self;
    v10 = v4;
    v7 = v4;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    v8 = FatalErrorF();
    __26__SFService_sendResponse___block_invoke(v8);
  }
}

void __26__SFService_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceSendResponse", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSendResponse:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&state);
  }
  else
  {
    v5 = **(_DWORD **)(v2 + 32);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendToPeer:(id)a3 flags:(unsigned int)a4 object:(id)a5
{
  char v6;
  id v8;
  id v9;
  NSObject *dispatchQueue;
  void *v11;
  uint64_t *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  if ((v6 & 1) != 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v11 = __37__SFService_sendToPeer_flags_object___block_invoke;
    v12 = &v16;
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v11 = __37__SFService_sendToPeer_flags_object___block_invoke_2;
    v12 = &v15;
  }
  v12[1] = 3221225472;
  v12[2] = (uint64_t)v11;
  v12[3] = (uint64_t)&unk_1E482EBA0;
  v12[4] = (uint64_t)self;
  v13 = v8;
  v12[5] = (uint64_t)v13;
  v14 = v9;
  v12[6] = (uint64_t)v14;
  dispatch_async(dispatchQueue, v12);

}

void __37__SFService_sendToPeer_flags_object___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendEncryptedObject:", a1[6]);
LABEL_3:
    v3 = v6;
    goto LABEL_4;
  }
  v4 = **(_DWORD **)(a1[4] + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:

}

void __37__SFService_sendToPeer_flags_object___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v2)
    LOBYTE(v3) = objc_msgSend(v2, "sessionFlags");
  else
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if ((v3 & 2) != 0)
    v4 = 29;
  else
    v4 = 5;
  objc_msgSend(*(id *)(a1 + 32), "_sendToPeer:type:unencryptedObject:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48));

}

- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 unencryptedObject:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t DataMutable;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void (**sendFramePeerHandler)(id, _QWORD, void *, id);
  int v17;
  int var0;
  int v19;
  os_activity_scope_state_s state;
  uint64_t v21;
  int v22;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v22 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_24;
  }
  v11 = (void *)DataMutable;
  if ((_DWORD)v6 != 29)
    goto LABEL_5;
  v21 = 0;
  NSDataCompress();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = 0;

  if (!v12)
  {
    v19 = self->_ucatCore->var0;
    if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
      LogPrintF();

LABEL_24:
    v11 = 0;
    goto LABEL_13;
  }

  v11 = (void *)v12;
LABEL_5:
  if (self->_xpcCnx)
  {
    v14 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceSendFrameType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serviceSendFrameType:data:peer:", v6, v11, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    sendFramePeerHandler = (void (**)(id, _QWORD, void *, id))self->_sendFramePeerHandler;
    if (sendFramePeerHandler)
    {
      sendFramePeerHandler[2](sendFramePeerHandler, v6, v11, v8);
    }
    else
    {
      v17 = self->_ucatCore->var0;
      if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
LABEL_13:

}

- (void)sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__SFService_sendToPeer_type_data___block_invoke;
  v13[3] = &unk_1E4832658;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __34__SFService_sendToPeer_type_data___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendToPeer:type:data:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_sendToPeer:(id)a3 type:(unsigned __int8)a4 data:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int var0;
  os_activity_scope_state_s state;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_xpcCnx)
  {
    v10 = _os_activity_create(&dword_1A2830000, "Sharing/SFService/serviceSendFrameType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceSendFrameType:data:peer:", v6, v9, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "length");
      LogPrintF();
    }
  }

}

- (void)pairSetupWithFlags:(unsigned int)a3 peer:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFService_pairSetupWithFlags_peer___block_invoke;
  block[3] = &unk_1E4832158;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __37__SFService_pairSetupWithFlags_peer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "pairSetupWithFlags:", *(unsigned int *)(a1 + 48));
LABEL_3:
    v3 = v6;
    goto LABEL_4;
  }
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)pairSetupTryPIN:(id)a3 peer:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFService_pairSetupTryPIN_peer___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __34__SFService_pairSetupTryPIN_peer___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "tryPIN:", a1[6]);
LABEL_3:
    v3 = v6;
    goto LABEL_4;
  }
  v4 = **(_DWORD **)(a1[4] + 32);
  if (v4 <= 60)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)serviceError:(id)a3
{
  void (**errorHandler)(id, id);
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
    errorHandler[2](errorHandler, v5);

}

- (void)servicePeerDisconnected:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int var0;
  void (**sessionEndedHandler)(id, void *, id);
  id v11;
  const char *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_xpcCnx)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v12 = SFNearbyBLEServiceTypeToString(self->_serviceType);
        v13 = v6;
        v11 = v14;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v14, v11, v12, v13);
      objc_msgSend(v8, "invalidate");
      sessionEndedHandler = (void (**)(id, void *, id))self->_sessionEndedHandler;
      if (sessionEndedHandler)
        sessionEndedHandler[2](sessionEndedHandler, v8, v6);

    }
  }

}

- (void)serviceReceivedEvent:(id)a3
{
  int var0;
  void (**eventMessageHandler)(id, id);
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  eventMessageHandler = (void (**)(id, id))self->_eventMessageHandler;
  v6 = v7;
  if (eventMessageHandler)
  {
    eventMessageHandler[2](eventMessageHandler, v7);
    v6 = v7;
  }

}

- (void)serviceReceivedFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  SFServiceSession *v10;
  BOOL v11;
  SFDevice *v12;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  int var0;
  uint64_t v17;
  void (**sessionStartedHandler)(id, SFServiceSession *);
  SFService *v19;
  id v20;
  uint64_t v21;
  int v22;
  double v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  const char *v28;
  id v29;

  v6 = a3;
  v29 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (SFServiceSession *)v9;
    v11 = 0;
  }
  else
  {
    v12 = objc_alloc_init(SFDevice);
    -[SFDevice setIdentifier:](v12, "setIdentifier:", v8);
    v10 = objc_alloc_init(SFServiceSession);
    -[SFSession setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_label)
      -[SFSession setLabel:](v10, "setLabel:");
    -[SFSession setPeer:](v10, "setPeer:", v8);
    -[SFSession setPeerDevice:](v10, "setPeerDevice:", v12);
    -[SFServiceSession setService:](v10, "setService:", self);
    -[SFSession setServiceType:](v10, "setServiceType:", self->_serviceType);
    -[SFSession setSessionFlags:](v10, "setSessionFlags:", self->_sessionFlags);
    sessions = self->_sessions;
    if (!sessions)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->_sessions;
      self->_sessions = v14;

      sessions = self->_sessions;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v10, v8);
    -[SFServiceSession activate](v10, "activate");
    v11 = (_DWORD)v6 == 23;
    if ((_DWORD)v6 == 23)
      -[SFServiceSession receivedStartRequest:](v10, "receivedStartRequest:", v29);
    var0 = self->_ucatCore->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v17 = -[SFSession sessionID](v10, "sessionID");
      v27 = v8;
      v28 = SFNearbyBLEServiceTypeToString(self->_serviceType);
      v26 = v17;
      LogPrintF();
    }
    sessionStartedHandler = (void (**)(id, SFServiceSession *))self->_sessionStartedHandler;
    if (sessionStartedHandler)
      sessionStartedHandler[2](sessionStartedHandler, v10);

  }
  -[SFSession setHeartbeatLastTicks:](v10, "setHeartbeatLastTicks:", mach_absolute_time());
  switch((int)v6)
  {
    case 20:
      -[SFServiceSession setSendLastTicks:](v10, "setSendLastTicks:", mach_absolute_time());
      v19 = self;
      v20 = v8;
      v21 = 20;
      goto LABEL_26;
    case 21:
      v22 = self->_ucatCore->var0;
      if (v22 <= 50 && (v22 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[SFServiceSession setSendLastTicks:](v10, "setSendLastTicks:", mach_absolute_time());
      v19 = self;
      v20 = v8;
      v21 = 22;
LABEL_26:
      -[SFService _sendToPeer:type:data:](v19, "_sendToPeer:type:data:", v20, v21, v29, v26, v27, v28);
      break;
    case 22:
    case 24:
      break;
    case 23:
      if (!v11)
        -[SFServiceSession receivedStartRequest:](v10, "receivedStartRequest:", v29);
      break;
    default:
      -[SFServiceSession sessionReceivedFrameType:data:](v10, "sessionReceivedFrameType:data:", v6, v29);
      break;
  }
  -[SFServiceSession sendLastTicks](v10, "sendLastTicks", v26, v27, v28);
  UpTicksToSecondsF();
  if (v23 > 15.0)
  {
    NSRandomData();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = self->_ucatCore->var0;
      if (v25 <= 50 && (v25 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[SFServiceSession setSendLastTicks:](v10, "setSendLastTicks:", mach_absolute_time());
      -[SFService _sendToPeer:type:data:](self, "_sendToPeer:type:data:", v8, 30, v24);
    }

  }
}

- (void)serviceReceivedRequest:(id)a3
{
  int var0;
  void (**requestMessageHandler)(id, id);
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  requestMessageHandler = (void (**)(id, id))self->_requestMessageHandler;
  v6 = v7;
  if (requestMessageHandler)
  {
    requestMessageHandler[2](requestMessageHandler, v7);
    v6 = v7;
  }

}

- (void)serviceReceivedResponse:(id)a3
{
  void *v4;
  int var0;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = v12;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_requestQueue, "objectForKeyedSubscript:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "responseHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v12);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_requestQueue, "removeObjectForKey:", v4, v11);

  }
  else
  {
    v10 = self->_ucatCore->var0;
    if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)serviceSessionFailed:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  int var0;
  void (**sessionEndedHandler)(id, id, id);
  void *v10;
  const char *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v13, "peer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = SFNearbyBLEServiceTypeToString(self->_serviceType);
    v12 = v6;
    v10 = v7;
    LogPrintF();
  }
  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v7);
  objc_msgSend(v13, "invalidate", v10, v11, v12);
  sessionEndedHandler = (void (**)(id, id, id))self->_sessionEndedHandler;
  if (sessionEndedHandler)
    sessionEndedHandler[2](sessionEndedHandler, v13, v6);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)duetSync
{
  return self->_duetSync;
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (BOOL)overrideScreenOff
{
  return self->_overrideScreenOff;
}

- (void)setOverrideScreenOff:(BOOL)a3
{
  self->_overrideScreenOff = a3;
}

- (NSDictionary)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)pairSetupDisabled
{
  return self->_pairSetupDisabled;
}

- (void)setPairSetupDisabled:(BOOL)a3
{
  self->_pairSetupDisabled = a3;
}

- (NSDictionary)pairVerifyACL
{
  return self->_pairVerifyACL;
}

- (void)setPairVerifyACL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unsigned)pinType
{
  return self->_pinType;
}

- (void)setPinType:(unsigned int)a3
{
  self->_pinType = a3;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_sessionFlags = a3;
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, a3);
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setPeerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)sessionSecuredHandler
{
  return self->_sessionSecuredHandler;
}

- (void)setSessionSecuredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)peerDisconnectedHandler
{
  return self->_peerDisconnectedHandler;
}

- (void)setPeerDisconnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)pairSetupCompletionHandler
{
  return self->_pairSetupCompletionHandler;
}

- (void)setPairSetupCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSData)targetAuthTag
{
  return self->_targetAuthTag;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)hasProblem
{
  return self->_hasProblem;
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)supportsAirPlayReceiver
{
  return self->_supportsAirPlayReceiver;
}

- (void)setSupportsAirPlayReceiver:(BOOL)a3
{
  self->_supportsAirPlayReceiver = a3;
}

- (BOOL)wakeDevice
{
  return self->_wakeDevice;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPin
{
  return self->_forcedPin;
}

- (void)setForcedPin:(id)a3
{
  self->_forcedPin = (NSString *)a3;
}

- (void)setAuthTagOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)autoUnlockEnabled
{
  return self->_autoUnlockEnabled;
}

- (BOOL)autoUnlockWatch
{
  return self->_autoUnlockWatch;
}

- (void)setDeviceClassCode:(unsigned __int8)a3
{
  self->_deviceClassCode = a3;
}

- (void)setDeviceColorCode:(unsigned __int8)a3
{
  self->_deviceColorCode = a3;
}

- (void)setDeviceModelCode:(unsigned __int8)a3
{
  self->_deviceModelCode = a3;
}

- (id)receivedFramePeerHandler
{
  return self->_receivedFramePeerHandler;
}

- (void)setReceivedFramePeerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setRequestSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)responseMessageInternalHandler
{
  return self->_responseMessageInternalHandler;
}

- (void)setResponseMessageInternalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)sendFramePeerHandler
{
  return self->_sendFramePeerHandler;
}

- (void)setSendFramePeerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned __int8)a3
{
  self->_serviceType = a3;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (BOOL)touchRemoteEnabled
{
  return self->_touchRemoteEnabled;
}

- (void)setTouchRemoteEnabled:(BOOL)a3
{
  self->_touchRemoteEnabled = a3;
}

- (BOOL)watchLocked
{
  return self->_watchLocked;
}

- (BOOL)wifiP2P
{
  return self->_wifiP2P;
}

- (void)setWifiP2P:(BOOL)a3
{
  self->_wifiP2P = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong(&self->_sendFramePeerHandler, 0);
  objc_storeStrong(&self->_responseMessageInternalHandler, 0);
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong(&self->_receivedFramePeerHandler, 0);
  objc_storeStrong((id *)&self->_authTagOverride, 0);
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_targetAuthTag, 0);
  objc_storeStrong(&self->_pairSetupCompletionHandler, 0);
  objc_storeStrong(&self->_peerDisconnectedHandler, 0);
  objc_storeStrong(&self->_sessionSecuredHandler, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_pairVerifyACL, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_pairSetupCompletion, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
