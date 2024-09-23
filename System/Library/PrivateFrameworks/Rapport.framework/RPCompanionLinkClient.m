@implementation RPCompanionLinkClient

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (id)description
{
  id v3;
  void *v4;
  NSString *appID;
  id v6;
  id v7;
  id v8;
  NSString *cloudServiceID;
  id v10;
  id v11;
  NSString *serviceType;
  id v13;
  NSArray *allowedMACAddresses;
  NSArray *v15;
  id v16;
  id v17;
  NSData *pairingInfo;
  NSData *v19;
  id v20;
  NSArray *pairSetupACL;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  NSArray *deviceFilter;
  id v29;
  int64_t clientID;
  NSArray *v32;
  NSArray *v33;
  uint64_t flags;
  unint64_t controlFlags;
  void *v36;

  controlFlags = self->_controlFlags;
  flags = self->_flags;
  clientID = self->_clientID;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  appID = self->_appID;
  if (appID)
  {
    v36 = v3;
    clientID = appID;
    NSAppendPrintF();
    v6 = v36;

    v4 = v6;
  }
  if (self->_bleClientUseCase)
  {
    clientID = self->_bleClientUseCase;
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  if (self->_useCase)
  {
    clientID = self->_useCase;
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID)
  {
    clientID = cloudServiceID;
    NSAppendPrintF();
    v10 = v4;

    v4 = v10;
  }
  if (self->_rssiThreshold)
  {
    clientID = self->_rssiThreshold;
    NSAppendPrintF();
    v11 = v4;

    v4 = v11;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    clientID = serviceType;
    NSAppendPrintF();
    v13 = v4;

    v4 = v13;
  }
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
  {
    v15 = allowedMACAddresses;
    -[NSArray count](v15, "count", clientID, flags, &unk_1AF306522, controlFlags, &unk_1AF3065CA);
    NSAppendPrintF();
    v16 = v4;

    v4 = v16;
  }
  if (self->_passwordType)
  {
    NSAppendPrintF();
    v17 = v4;

    v4 = v17;
  }
  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    v19 = pairingInfo;
    -[NSData length](v19, "length");
    NSAppendPrintF();
    v20 = v4;

    v4 = v20;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    v32 = pairSetupACL;
    NSAppendPrintF();
    v22 = v4;

    v4 = v22;
  }
  if (self->_usingOnDemandConnection)
  {
    NSAppendPrintF();
    v23 = v4;

    v4 = v23;
  }
  NSAppendPrintF();
  v24 = v4;

  if (self->_bleScreenOffRescanInterval)
  {
    NSAppendPrintF();
    v25 = v24;

    v24 = v25;
  }
  if (self->_bleScreenOffScanRate)
  {
    NSAppendPrintF();
    v27 = v24;

    v24 = v27;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    v33 = deviceFilter;
    NSAppendPrintF();
    v29 = v24;

    v24 = v29;
  }
  return v24;
}

- (BOOL)shouldReportDevice:(id)a3 toXPCConnectionWithLaunchInstanceID:(id)a4 outReason:(id *)a5
{
  id v8;
  id v9;
  int v10;
  __CFString *v11;
  void *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "flags") & 1) == 0 || (self->_flags & 1) != 0)
  {
    if ((objc_msgSend(v8, "flags") & 0x2000) != 0)
    {
      if ((self->_flags & 0x2000) == 0)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          v11 = CFSTR("deviceFlag.homeHubDevice");
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      objc_msgSend(v8, "launchInstanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "isEqual:", v12);

      if (v13)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          v11 = CFSTR("deviceFlag.homeHubDevice.launchInstanceIDMatches");
          goto LABEL_50;
        }
        goto LABEL_51;
      }
    }
    if (v9)
      v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10) | 0x4000000000;
    else
      v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10);
    v15 = objc_msgSend(v8, "statusFlags");
    v16 = objc_msgSend(v8, "flags");
    v17 = v15 | 0x200080000;
    if ((v16 & 0x40) == 0)
      v17 = v15;
    if (!(v14 & 0x400 | v17 & 0x80000)
      && ((v17 & 0x4000) == 0 || (v14 & 0x1000) == 0)
      && ((v17 & 0x20000) == 0 || (v14 & 0x100000) == 0)
      && ((v17 & 0x8000) == 0 || (v14 & 0x2000) == 0)
      && ((v17 & 0x2000000000) == 0 || (v14 & 0x100000000000) == 0)
      && ((v17 & 0x4000000000) == 0 || (v14 & 0x200000000000) == 0)
      && ((v17 & 0x2000) == 0 || (v14 & 0x800) == 0)
      && ((v17 & 0x1000000000) == 0 || (v14 & 0x80000000000) == 0))
    {
      LOBYTE(v10) = 0;
      if (!a5)
        goto LABEL_51;
      v11 = CFSTR("missingFlag.trustCircle");
      goto LABEL_50;
    }
    if ((v17 & 0x80000000) != 0 || (v14 & 0x1000000000000) == 0)
    {
      if ((v17 & 0x200000) != 0 && (v14 & 0x4000000) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = CFSTR("containsFlag.RPControlFlagsAppSignIn");
          goto LABEL_50;
        }
      }
      else if ((v14 & v17 & 8) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = CFSTR("containsFlag.RPControlFlagsAWDL");
          goto LABEL_50;
        }
      }
      else if ((v14 & v17 & 2) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = CFSTR("containsFlag.RPControlFlagsBLE");
          goto LABEL_50;
        }
      }
      else if ((v17 & 1) != 0 && (v14 & 0x20) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          v11 = CFSTR("containsFlag.RPControlFlagsBTPipe");
          goto LABEL_50;
        }
      }
      else
      {
        if ((v17 & 0x100000) != 0 && (v14 & 0x800000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsCloud");
          goto LABEL_50;
        }
        if ((v17 & 0x8000000) != 0 && (v14 & 0x100000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsFitness");
          goto LABEL_50;
        }
        if ((v17 & 0x10000000) != 0 && (v14 & 0x400000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsHomeHubDevice");
          goto LABEL_50;
        }
        if ((v17 & 0x200000000) != 0 && (v14 & 0x4000000000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsLaunchInstance");
          goto LABEL_50;
        }
        if ((v14 & v17 & 4) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsInfraWiFi");
          goto LABEL_50;
        }
        if ((v14 & v17 & 0x10) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5)
            goto LABEL_51;
          v11 = CFSTR("containsFlag.RPControlFlagsNAN");
          goto LABEL_50;
        }
        v10 = (v14 >> 37) & 1 & (v17 >> 30);
        v11 = CFSTR("statusControlFlagMismatch");
        if (v10)
          v11 = CFSTR("containsFlag.RPControlFlagsCompanionAuthentication");
        if (a5)
LABEL_50:
          *a5 = v11;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
      if (a5)
      {
        v11 = CFSTR("missingFlag.RPStatusFlagsAWDLPairingMode");
        goto LABEL_50;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    if (a5)
    {
      v11 = CFSTR("deviceFlag.unauthenticated");
      goto LABEL_50;
    }
  }
LABEL_51:

  return v10 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *allowedMACAddresses;
  NSString *appID;
  int64_t bleClientUseCase;
  int64_t bleScreenOffRescanInterval;
  uint64_t bleScreenOffScanRate;
  uint64_t clientID;
  NSString *cloudServiceID;
  unint64_t controlFlags;
  void *v12;
  NSArray *deviceFilter;
  void *v14;
  uint64_t flags;
  void *v16;
  uint64_t internalAuthFlags;
  NSData *pairingInfo;
  NSArray *pairSetupACL;
  NSString *password;
  uint64_t passwordType;
  int64_t rssiThreshold;
  NSString *serviceType;
  NSDictionary *siriInfo;
  uint64_t useCase;
  id v26;

  v26 = a3;
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
    objc_msgSend(v26, "encodeObject:forKey:", allowedMACAddresses, CFSTR("MAcAddrs"));
  appID = self->_appID;
  if (appID)
    objc_msgSend(v26, "encodeObject:forKey:", appID, CFSTR("appID"));
  if (self->_awdlGuestDiscoveryTimeout != 0.0)
    objc_msgSend(v26, "encodeDouble:forKey:", CFSTR("agdt"));
  bleClientUseCase = self->_bleClientUseCase;
  if (bleClientUseCase)
    objc_msgSend(v26, "encodeInteger:forKey:", bleClientUseCase, CFSTR("bleCUC"));
  bleScreenOffRescanInterval = self->_bleScreenOffRescanInterval;
  if (bleScreenOffRescanInterval)
    objc_msgSend(v26, "encodeInteger:forKey:", bleScreenOffRescanInterval, CFSTR("bleScnOffIntvl"));
  bleScreenOffScanRate = self->_bleScreenOffScanRate;
  if ((_DWORD)bleScreenOffScanRate)
    objc_msgSend(v26, "encodeInt64:forKey:", bleScreenOffScanRate, CFSTR("bleScnOffScnRt"));
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    objc_msgSend(v26, "encodeInt64:forKey:", clientID, CFSTR("cid"));
  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID)
    objc_msgSend(v26, "encodeObject:forKey:", cloudServiceID, CFSTR("clSI"));
  controlFlags = self->_controlFlags;
  if (controlFlags)
    objc_msgSend(v26, "encodeInt64:forKey:", controlFlags, CFSTR("cFl"));
  -[RPEndpoint identifier](self->_destinationDevice, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[RPCompanionLinkDevice publicIdentifier](self->_destinationDevice, "publicIdentifier"),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v26, "encodeObject:forKey:", v12, CFSTR("ddID"));

  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
    objc_msgSend(v26, "encodeObject:forKey:", deviceFilter, CFSTR("dFtr"));
  -[RPEndpoint ipAddress](self->_destinationDevice, "ipAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v26, "encodeObject:forKey:", v14, CFSTR("ddIP"));

  if (self->_encodeSensitiveProperties)
    objc_msgSend(v26, "encodeBool:forKey:", 1, CFSTR("esp"));
  flags = self->_flags;
  v16 = v26;
  if ((_DWORD)flags)
  {
    objc_msgSend(v26, "encodeInt64:forKey:", flags, CFSTR("flags"));
    v16 = v26;
  }
  internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    objc_msgSend(v26, "encodeInt64:forKey:", internalAuthFlags, CFSTR("iaf"));
    v16 = v26;
  }
  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    objc_msgSend(v26, "encodeObject:forKey:", pairingInfo, CFSTR("pairI"));
    v16 = v26;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    objc_msgSend(v26, "encodeObject:forKey:", pairSetupACL, CFSTR("acl"));
    v16 = v26;
  }
  password = self->_password;
  if (password)
  {
    objc_msgSend(v26, "encodeObject:forKey:", password, CFSTR("pw"));
    v16 = v26;
  }
  passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    objc_msgSend(v26, "encodeInteger:forKey:", passwordType, CFSTR("pwTy"));
    v16 = v26;
  }
  rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    objc_msgSend(v26, "encodeInteger:forKey:", rssiThreshold, CFSTR("rssiTh"));
    v16 = v26;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v26, "encodeObject:forKey:", serviceType, CFSTR("st"));
    v16 = v26;
  }
  siriInfo = self->_siriInfo;
  if (siriInfo)
  {
    objc_msgSend(v26, "encodeObject:forKey:", siriInfo, CFSTR("siriInfo"));
    v16 = v26;
  }
  useCase = self->_useCase;
  if ((_DWORD)useCase)
  {
    objc_msgSend(v26, "encodeInt64:forKey:", useCase, CFSTR("useCase"));
    v16 = v26;
  }
  if (self->_usingOnDemandConnection)
  {
    objc_msgSend(v26, "encodeBool:forKey:", 1, CFSTR("uOnd"));
    v16 = v26;
  }

}

- (void)companionLinkLostDevice:(id)a3
{
  RPCompanionLinkClient *v4;
  void *v5;
  void (**deviceLostHandler)(id, id);
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v8, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v8, "publicIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_sync_exit(v4);

      goto LABEL_6;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_deviceDictionary, "setObject:forKeyedSubscript:", 0, v5);

  objc_sync_exit(v4);
  deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
  v7 = v8;
  if (deviceLostHandler)
  {
    deviceLostHandler[2](deviceLostHandler, v8);
LABEL_6:
    v7 = v8;
  }

}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v18 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_clientError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v19;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11
            || (objc_msgSend(v10, "publicIdentifier"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
            {
              v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v13 = *(_QWORD *)(a1 + 32);
              v14 = *(void **)(v13 + 48);
              *(_QWORD *)(v13 + 48) = v12;

            }
            v15 = (void *)MEMORY[0x1AF45BCB0]();
            if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 254) & 4) == 0)
              objc_msgSend(v10, "setSiriInfo:", 0);
            objc_autoreleasePoolPop(v15);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v10, v11);
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    objc_sync_exit(obj);
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 30 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
        goto LABEL_37;
    }
    else if (gLogCategory_CLinkClient > 30
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_37;
    }
    LogPrintF();
    goto LABEL_37;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
LABEL_26:
      LogPrintF();
  }
  else if (gLogCategory_CLinkClient <= 60
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_26;
  }
LABEL_37:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v5);

}

- (void)companionLinkFoundDevice:(id)a3
{
  RPCompanionLinkClient *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *deviceDictionary;
  void *v8;
  void (**deviceFoundHandler)(id, id);
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v10, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(v10, "publicIdentifier"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!v4->_deviceDictionary)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      deviceDictionary = v4->_deviceDictionary;
      v4->_deviceDictionary = v6;

    }
    v8 = (void *)MEMORY[0x1AF45BCB0]();
    if ((v4->_controlFlags & 0x4000000000000) == 0)
      objc_msgSend(v10, "setSiriInfo:", 0);
    objc_autoreleasePoolPop(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_deviceDictionary, "setObject:forKeyedSubscript:", v10, v5);

    objc_sync_exit(v4);
    deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
    else if (v4->_appID
           && gLogCategory_CLinkClient <= 40
           && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (id)_clientError:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    if (objc_msgSend(v4, "code") == 4099)
    {
      v6 = v5;
      if (self->_invalidateCalled)
      {
        RPErrorF();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (RPCompanionLinkDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (unsigned)flags
{
  return self->_flags;
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_rssiThreshold = a3;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setAwdlGuestDiscoveryTimeout:(double)a3
{
  self->_awdlGuestDiscoveryTimeout = a3;
}

- (unsigned)bleScreenOffScanRate
{
  return self->_bleScreenOffScanRate;
}

- (int64_t)bleScreenOffRescanInterval
{
  return self->_bleScreenOffRescanInterval;
}

- (void)companionLinkLocalDeviceUpdated:(id)a3
{
  void *v4;
  void (**localDeviceUpdatedHandler)(id, id);
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)MEMORY[0x1AF45BCB0](-[RPCompanionLinkClient setLocalDevice:](self, "setLocalDevice:", v7));
  if ((self->_controlFlags & 0x4000000000000) == 0)
    objc_msgSend(v7, "setSiriInfo:", 0);
  objc_autoreleasePoolPop(v4);
  localDeviceUpdatedHandler = (void (**)(id, id))self->_localDeviceUpdatedHandler;
  v6 = v7;
  if (localDeviceUpdatedHandler)
  {
    localDeviceUpdatedHandler[2](localDeviceUpdatedHandler, v7);
    v6 = v7;
  }

}

- (void)setLocalDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void)setServiceType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__RPCompanionLinkClient_setServiceType___block_invoke;
  v6[3] = &unk_1E5F4ECF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

- (void)setControlFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__RPCompanionLinkClient_setControlFlags___block_invoke;
  v3[3] = &unk_1E5F4F428;
  v3[4] = self;
  v3[5] = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  RPCompanionLinkClient *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E5F4F4C8;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

uint64_t __41__RPCompanionLinkClient_setControlFlags___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 248) = *(_QWORD *)(result + 40);
  return result;
}

void __40__RPCompanionLinkClient_setServiceType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  RPCompanionLinkClient *v7;
  void *v8;
  RPDaemonConnection *daemonCnx;
  uint64_t v10;
  void (**v11)(id, void *);
  void *v12;
  RPCompanionLinkClient *v13;
  _QWORD v14[5];
  void (**v15)(id, void *);
  BOOL v16;
  _QWORD v17[5];
  void (**v18)(id, void *);
  BOOL v19;

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      goto LABEL_7;
  }
  else if (gLogCategory_CLinkClient <= 30
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
LABEL_7:
    if (self->_targetUserSession)
      v7 = (RPCompanionLinkClient *)CFSTR("(TargetUserSession)");
    else
      v7 = self;
    v13 = v7;
    LogPrintF();
  }
  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      v6[2](v6, v8);
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke;
    v17[3] = &unk_1E5F4F478;
    v17[4] = self;
    v19 = v4;
    v11 = v6;
    v18 = v11;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2;
    v14[3] = &unk_1E5F4F4A0;
    v14[4] = self;
    v16 = v4;
    v15 = v11;
    objc_msgSend(v12, "companionLinkActivateClient:completion:", self, v14);

  }
}

- (id)_ensureXPCStarted
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  RPDaemonConnection *v9;
  RPDaemonConnection *daemonCnx;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  if (!self->_daemonCnx)
  {
    if (self->_invalidateCalled)
    {
      RPErrorF();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    v4 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke;
    v14[3] = &unk_1E5F4EC60;
    v14[4] = self;
    v5 = (void *)MEMORY[0x1AF45BE48](v14, a2);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_1E5F4EC60;
    v13[4] = self;
    v6 = (void *)MEMORY[0x1AF45BE48](v13);
    if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && self->_targetUserSession)
    {
      v7 = -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID");
      if (!v7)
      {
        if (gLogCategory_CLinkClient <= 50
          && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        RPErrorF();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (gLogCategory_CLinkClient <= 30)
      {
        v8 = v7;
        if (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())
        {
          v12 = v8;
          LogPrintF();
        }
      }
    }
    -[RPCompanionLinkClient _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:](self, "_connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:", self, self->_dispatchQueue, self->_userProvider, v5, v6, v12);
    v9 = (RPDaemonConnection *)objc_claimAutoreleasedReturnValue();
    daemonCnx = self->_daemonCnx;
    self->_daemonCnx = v9;

    if (gLogCategory_CLinkClient <= 10 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v2 = 0;
LABEL_20:

    return v2;
  }
  v2 = 0;
  return v2;
}

- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  RPCompanionLinkClientDaemonConnection_XPC *v28;
  id v30;
  id v31;
  id v32;
  id v34;

  v12 = a5;
  v32 = a7;
  v31 = a6;
  v34 = a4;
  v30 = a3;
  -[RPCompanionLinkClient _XPCConnectionWithMachServiceName:options:](self, "_XPCConnectionWithMachServiceName:options:", CFSTR("com.apple.CompanionLink"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3CEE8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkReceivedEventID_event_options_, 1, 0);
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkReceivedRequestID_request_options_responseHandler_, 1, 0);
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkReceivedRequestID_request_options_responseHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4ABD8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_companionLinkActivateClient_completion_, 0, 1);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkSendEventID_event_destinationID_options_completion_, 1, 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkSendRequestID_request_destinationID_options_responseHandler_, 1, 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_companionLinkSendRequestID_request_destinationID_options_responseHandler_, 0, 1);
  objc_msgSend(v13, "setExportedInterface:", v23);
  objc_msgSend(v13, "setExportedObject:", v30);

  objc_msgSend(v13, "setInterruptionHandler:", v31);
  objc_msgSend(v13, "setInvalidationHandler:", v32);

  objc_msgSend(v13, "setRemoteObjectInterface:", v24);
  objc_msgSend(v13, "_setQueue:", v34);

  if (self->_targetUserSession
    && objc_msgSend(v12, "supportsMultipleUsers")
    && objc_msgSend(v12, "signedInUserID"))
  {
    objc_msgSend(v13, "_setTargetUserIdentifier:", objc_msgSend(v12, "signedInUserID"));
  }
  objc_msgSend(v13, "resume");
  v28 = -[RPCompanionLinkClientDaemonConnection_XPC initWithConnection:]([RPCompanionLinkClientDaemonConnection_XPC alloc], "initWithConnection:", v13);

  return v28;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3B38];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", v6, a4);

  return v7;
}

uint64_t __35__RPCompanionLinkClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    v2 = result;
    *(_BYTE *)(v1 + 64) = 1;
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      v3 = *(_QWORD *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "invalidate", v3);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id authCompletionHandler;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id disconnectHandler;
  id errorFlagsChangedHandler;
  id interruptionHandler;
  id v11;
  id localDeviceUpdatedHandler;
  id showPasswordHandler;
  id hidePasswordHandler;
  id promptForPasswordHandler;
  id stateUpdatedHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_daemonCnx)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler)
        invalidationHandler[2]();
      -[NSMutableSet removeAllObjects](self->_assertions, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_eventRegistrations, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_requestRegistrations, "removeAllObjects");
      authCompletionHandler = self->_authCompletionHandler;
      self->_authCompletionHandler = 0;

      deviceFoundHandler = self->_deviceFoundHandler;
      self->_deviceFoundHandler = 0;

      deviceLostHandler = self->_deviceLostHandler;
      self->_deviceLostHandler = 0;

      deviceChangedHandler = self->_deviceChangedHandler;
      self->_deviceChangedHandler = 0;

      disconnectHandler = self->_disconnectHandler;
      self->_disconnectHandler = 0;

      errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
      self->_errorFlagsChangedHandler = 0;

      interruptionHandler = self->_interruptionHandler;
      self->_interruptionHandler = 0;

      v11 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      localDeviceUpdatedHandler = self->_localDeviceUpdatedHandler;
      self->_localDeviceUpdatedHandler = 0;

      showPasswordHandler = self->_showPasswordHandler;
      self->_showPasswordHandler = 0;

      hidePasswordHandler = self->_hidePasswordHandler;
      self->_hidePasswordHandler = 0;

      promptForPasswordHandler = self->_promptForPasswordHandler;
      self->_promptForPasswordHandler = 0;

      stateUpdatedHandler = self->_stateUpdatedHandler;
      self->_stateUpdatedHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

- (RPCompanionLinkClient)init
{
  RPSignedInUserProvider *v3;
  RPCompanionLinkClient *v4;

  v3 = objc_alloc_init(RPSignedInUserProvider);
  v4 = -[RPCompanionLinkClient initWithUserProvider:](self, "initWithUserProvider:", v3);

  return v4;
}

- (RPCompanionLinkClient)initWithUserProvider:(id)a3
{
  id v5;
  RPCompanionLinkClient *v6;
  unsigned int v7;
  unsigned int v8;
  RPCompanionLinkClient *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPCompanionLinkClient;
  v6 = -[RPCompanionLinkClient init](&v11, sel_init);
  if (v6)
  {
    if (gRPCompanionLinkClientIDOnce != -1)
      dispatch_once(&gRPCompanionLinkClientIDOnce, &__block_literal_global_3);
    do
    {
      v7 = __ldaxr((unsigned int *)&gRPCompanionLinkClientIDNext);
      v8 = v7 + 1;
    }
    while (__stlxr(v8, (unsigned int *)&gRPCompanionLinkClientIDNext));
    v6->_clientID = v8;
    v6->_controlFlags = 36;
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1E0C80D38]);
    objc_storeStrong((id *)&v6->_userProvider, a3);
    v9 = v6;
  }

  return v6;
}

void __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 288));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  RPCompanionLinkClient *v5;
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
  v8[2] = __48__RPCompanionLinkClient_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5F4ED70;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __48__RPCompanionLinkClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 168))
  {
    *(_DWORD *)(v1 + 136) |= 8u;
    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v1 + 184))
  {
    *(_DWORD *)(v1 + 136) |= 1u;
    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v1 + 192))
  {
    *(_DWORD *)(v1 + 136) |= 2u;
    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v1 + 200))
  {
    *(_DWORD *)(v1 + 136) |= 4u;
    v1 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v1, "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)companionLinkUpdateErrorFlags:(unint64_t)a3
{
  NSObject *dispatchQueue;
  RPCompanionLinkClient *obj;
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  if (obj->_errorFlags == a3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_errorFlags = a3;
    objc_sync_exit(obj);

    dispatchQueue = obj->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = obj;
    dispatch_async(dispatchQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_requestIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_siriInfo, 0);
  objc_storeStrong(&self->_localDeviceUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
  objc_storeStrong((id *)&self->_cloudServiceID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_userProvider, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_requestRegistrations, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_eventRegistrations, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_storeStrong((id *)&self->_daemonCnx, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (RPCompanionLinkClient)initWithCoder:(id)a3
{
  id v4;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *v6;
  id v7;
  id v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  RPCompanionLinkClient *v24;
  objc_super v26;
  uint64_t v27;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RPCompanionLinkClient;
  v5 = -[RPCompanionLinkClient init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("agdt")))
    {
      objc_msgSend(v8, "decodeDoubleForKey:", CFSTR("agdt"));
      v6->_awdlGuestDiscoveryTimeout = v9;
    }

    v10 = v8;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("bleCUC")))
      v6->_bleClientUseCase = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("bleCUC"));

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("bleScnOffIntvl")))
      v6->_bleScreenOffRescanInterval = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("bleScnOffIntvl"));

    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_bleScreenOffScanRate = v27;
    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_clientID = v27;
    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v12;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("cFl")))
      v6->_controlFlags = objc_msgSend(v13, "decodeInt64ForKey:", CFSTR("cFl"));

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSDecodeNSArrayOfClassIfPresent();

    v15 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = v16;
    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("esp")))
      v6->_encodeSensitiveProperties = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("esp"));

    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_flags = v27;
    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_internalAuthFlags = v27;
    v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_passwordType = v27;
    v20 = v19;
    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("rssiTh")))
      v6->_rssiThreshold = objc_msgSend(v20, "decodeIntegerForKey:", CFSTR("rssiTh"));

    v21 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v22 = v21;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v27 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_useCase = v27;
    v23 = v22;
    if (objc_msgSend(v23, "containsValueForKey:", CFSTR("uOnd")))
      v6->_usingOnDemandConnection = objc_msgSend(v23, "decodeBoolForKey:", CFSTR("uOnd"));

    v24 = v6;
  }

  return v6;
}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RPCompanionLinkClient_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)companionLinkChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  RPCompanionLinkClient *v6;
  void *v7;
  void *v8;
  void (**deviceChangedHandler)(id, id, _QWORD);
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v11, "publicIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_sync_exit(v6);

      goto LABEL_8;
    }
  }
  v8 = (void *)MEMORY[0x1AF45BCB0](-[NSMutableDictionary setObject:forKeyedSubscript:](v6->_deviceDictionary, "setObject:forKeyedSubscript:", v11, v7));
  if ((v6->_controlFlags & 0x4000000000000) == 0)
    objc_msgSend(v11, "setSiriInfo:", 0);
  objc_autoreleasePoolPop(v8);

  objc_sync_exit(v6);
  deviceChangedHandler = (void (**)(id, id, _QWORD))v6->_deviceChangedHandler;
  v10 = v11;
  if (deviceChangedHandler)
  {
    deviceChangedHandler[2](deviceChangedHandler, v11, v4);
LABEL_8:
    v10 = v11;
  }

}

uint64_t __46__RPCompanionLinkClient_initWithUserProvider___block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  gRPCompanionLinkClientIDNext = (unsigned __int16)word_1ECF9CCEA << 16;
  return result;
}

- (void)setBleScreenOffRescanInterval:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke;
  v3[3] = &unk_1E5F4F428;
  v3[4] = self;
  v3[5] = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setBleScreenOffScanRate:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke;
  v3[3] = &unk_1E5F4F450;
  v3[4] = self;
  v4 = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setDeviceFilter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__RPCompanionLinkClient_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E5F4ECF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

void __41__RPCompanionLinkClient_setDeviceFilter___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (void)setSiriInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__RPCompanionLinkClient_setSiriInfo___block_invoke;
  v6[3] = &unk_1E5F4ECF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

void __37__RPCompanionLinkClient_setSiriInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 360), *(id *)(a1 + 40));
}

- (void)setUseCase:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__RPCompanionLinkClient_setUseCase___block_invoke;
  v3[3] = &unk_1E5F4F450;
  v3[4] = self;
  v4 = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __36__RPCompanionLinkClient_setUseCase___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 104) = *(_DWORD *)(result + 40);
  return result;
}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = v7;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

void __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companionLinkUpdateClient:", *(_QWORD *)(a1 + 32));

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CLinkClient <= 50 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[RPCompanionLinkClient _lostAllDevices](self, "_lostAllDevices");
  if (self->_activateCalled)
    -[RPCompanionLinkClient _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  -[RPCompanionLinkClient _reregisterAssertions](self, "_reregisterAssertions");
  -[RPCompanionLinkClient _reregisterEvents](self, "_reregisterEvents");
  -[RPCompanionLinkClient _reregisterRequests](self, "_reregisterRequests");
  -[RPCompanionLinkClient _reregisterProfileIDs](self, "_reregisterProfileIDs");
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (id)activateAssertionID:(id)a3 destinationID:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  RPCompanionLinkAssertion *v12;
  void *v13;
  void *v14;
  NSObject *dispatchQueue;
  RPCompanionLinkAssertion *v16;
  id v17;
  void *v18;
  RPCompanionLinkAssertion *v19;
  _QWORD block[5];
  RPCompanionLinkAssertion *v22;
  id v23;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(RPCompanionLinkAssertion);
  -[RPCompanionLinkAssertion setAssertionID:](v12, "setAssertionID:", v11);

  -[RPCompanionLinkAssertion setClient:](v12, "setClient:", self);
  -[RPCompanionLinkAssertion setDestinationID:](v12, "setDestinationID:", v10);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkAssertion setIdentifier:](v12, "setIdentifier:", v14);

  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E5F4F4F0;
  block[4] = self;
  v16 = v12;
  v22 = v16;
  v23 = v9;
  v17 = v9;
  dispatch_async(dispatchQueue, block);
  v18 = v23;
  v19 = v16;

  return v19;
}

void __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "companionLinkActivateAssertion:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v9 = v6;
    (*(void (**)(void))(v7 + 16))();
LABEL_7:
    v6 = v9;
  }

}

- (void)_invalidateAssertion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RPCompanionLinkClient__invalidateAssertion___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __46__RPCompanionLinkClient__invalidateAssertion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companionLinkInvalidateAssertion:", *(_QWORD *)(a1 + 40));

}

- (void)_reregisterAssertions
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_assertions, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_assertions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v12 = (void *)v10;
          if (gLogCategory_CLinkClient <= 90
            && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }

          goto LABEL_20;
        }
        -[RPDaemonConnection remoteObjectProxy](self->_daemonCnx, "remoteObjectProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __46__RPCompanionLinkClient__reregisterAssertions__block_invoke;
        v13[3] = &unk_1E5F4EC88;
        v13[4] = self;
        v13[5] = v9;
        objc_msgSend(v11, "companionLinkActivateAssertion:completion:", v9, v13);

      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_20:

}

void __46__RPCompanionLinkClient__reregisterAssertions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    v7 = (void *)v3;
    if (gLogCategory_CLinkClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      objc_msgSend(*(id *)(a1 + 40), "assertionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v7;
    }
  }

}

- (void)tryPassword:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__RPCompanionLinkClient_tryPassword___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __37__RPCompanionLinkClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companionLinkTryPassword:", *(_QWORD *)(a1 + 40));

}

- (void)companionLinkPromptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v9 = MEMORY[0x1AF45BE48](self->_promptForPasswordHandler);
    v10 = (void *)v9;
    if (v9)
    {
      self->_passwordTypeActual = a3;
      v12 = (void *)v9;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v6, v5);
LABEL_4:

      return;
    }
    if (gLogCategory_CLinkClient <= 90)
    {
      v12 = 0;
      if (gLogCategory_CLinkClient != -1 || (v11 = _LogCategory_Initialize(), v10 = 0, v11))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }

  }
}

- (void)companionLinkAuthCompleted:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = MEMORY[0x1AF45BE48](self->_authCompletionHandler);
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  else if (gLogCategory_CLinkClient <= 90
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (NSArray)activeDevices
{
  RPCompanionLinkClient *v2;
  NSMutableDictionary *deviceDictionary;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  deviceDictionary = v2->_deviceDictionary;
  if (deviceDictionary)
  {
    -[NSMutableDictionary allValues](deviceDictionary, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (RPCompanionLinkDevice)activePersonalCompanion
{
  RPCompanionLinkClient *v2;
  NSMutableDictionary *deviceDictionary;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  deviceDictionary = v2->_deviceDictionary;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke;
  v6[3] = &unk_1E5F4F518;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceDictionary, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  objc_sync_exit(v2);
  return (RPCompanionLinkDevice *)v4;
}

void __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isPersonal"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_lostAllDevices
{
  id deviceLostHandler;
  NSMutableDictionary *deviceDictionary;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (**v10)(id, _QWORD);
  RPCompanionLinkClient *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  deviceLostHandler = self->_deviceLostHandler;
  obj = self;
  objc_sync_enter(obj);
  deviceDictionary = obj->_deviceDictionary;
  if (deviceLostHandler)
  {
    -[NSMutableDictionary allValues](deviceDictionary, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_deviceDictionary, "removeAllObjects");
    objc_sync_exit(obj);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = (void (**)(id, _QWORD))self->_deviceLostHandler;
          if (v10)
            v10[2](v10, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](deviceDictionary, "removeAllObjects");
    objc_sync_exit(obj);

  }
}

- (void)companionLinkUpdateClientState:(id)a3
{
  id v4;
  RPCompanionLinkClient *v5;
  int usingOnDemandConnection;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  usingOnDemandConnection = v5->_usingOnDemandConnection;
  if (usingOnDemandConnection == objc_msgSend(v4, "usingOnDemandConnection"))
  {
    objc_sync_exit(v5);

  }
  else
  {
    v5->_usingOnDemandConnection = objc_msgSend(v4, "usingOnDemandConnection");
    objc_sync_exit(v5);

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

}

void __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  RPCompanionLinkClient *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke;
  v15[3] = &unk_1E5F4F540;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  RPEventRegistration *v6;

  v6 = objc_alloc_init(RPEventRegistration);
  -[RPEventRegistration setEventID:](v6, "setEventID:", *(_QWORD *)(a1 + 32));
  -[RPEventRegistration setOptions:](v6, "setOptions:", *(_QWORD *)(a1 + 40));
  -[RPEventRegistration setHandler:](v6, "setHandler:", *(_QWORD *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "_registerEventID:options:reregister:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_registerEventID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  RPDaemonConnection *daemonCnx;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      v15 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke;
    v19[3] = &unk_1E5F4F568;
    v19[4] = self;
    v21 = v5;
    v13 = v8;
    v20 = v13;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2;
    v16[3] = &unk_1E5F4F568;
    v16[4] = self;
    v18 = v5;
    v17 = v13;
    objc_msgSend(v14, "companionLinkRegisterEventID:options:completion:", v17, v9, v16);

  }
}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        v6 = v3;
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1)
      goto LABEL_7;
    v8 = v3;
    v5 = _LogCategory_Initialize();
    v3 = v8;
    if (v5)
      goto LABEL_7;
  }

}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_clientError:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 60 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
        goto LABEL_14;
    }
    else if (gLogCategory_CLinkClient > 60
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }
  if (v4[48])
  {
    v6 = v4[34];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3;
    block[3] = &unk_1E5F4ECF8;
    block[4] = v4;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
LABEL_15:

}

uint64_t __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) + 16))();
}

- (void)_reregisterEvents
{
  NSMutableDictionary *eventRegistrations;
  _QWORD v4[5];

  if (-[NSMutableDictionary count](self->_eventRegistrations, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  eventRegistrations = self->_eventRegistrations;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__RPCompanionLinkClient__reregisterEvents__block_invoke;
  v4[3] = &unk_1E5F4F590;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](eventRegistrations, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __42__RPCompanionLinkClient__reregisterEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "eventID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_registerEventID:options:reregister:", v6, v5, 1);
}

- (void)deregisterEventID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPCompanionLinkClient *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD v12[5];
  id v13;

  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    v8 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v4 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2;
    v12[3] = &unk_1E5F4EC88;
    v12[4] = v4;
    v13 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3;
    v10[3] = &unk_1E5F4EC88;
    v9 = *(int8x16_t *)(a1 + 32);
    v11 = vextq_s8(v9, v9, 8uLL);
    objc_msgSend(v7, "companionLinkDeregisterEventID:completion:", (id)v9.i64[0], v10);

  }
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }

}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (gLogCategory_CLinkClient <= 60)
    {
      v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        v3 = v5;
      }
    }

  }
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  NSObject *dispatchQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v15, "valueForKey:", CFSTR("highPriority"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "BOOLValue");

  if (!CFDictionaryGetInt64())
  {
    v18 = v12;
    if ((objc_msgSend(v18, "isEqual:", CFSTR("HIDRelay")) & 1) != 0
      || (objc_msgSend(v18, "isEqual:", CFSTR("synchSetupStateFromStereoCounterpart")) & 1) != 0
      || (objc_msgSend(v18, "isEqual:", CFSTR("_hidT")) & 1) != 0
      || objc_msgSend(v18, "isEqual:", CFSTR("_laData")))
    {

    }
    else
    {
      v26 = objc_msgSend(v18, "isEqual:", CFSTR("_siA"));

      if (!v26)
      {
        v19 = 30;
        goto LABEL_8;
      }
    }
  }
  v19 = 10;
LABEL_8:
  if (v19 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v13, "count");
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E5F4F5E0;
  block[4] = self;
  v28 = v12;
  v29 = v14;
  v30 = v13;
  v31 = v15;
  v32 = v16;
  v21 = v15;
  v22 = v13;
  v23 = v14;
  v24 = v12;
  v25 = v16;
  dispatch_async(dispatchQueue, block);

}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 72);
    if (v3)
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2;
    v17[3] = &unk_1E5F4F5B8;
    v17[4] = v5;
    v18 = v6;
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 72);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3;
    v13[3] = &unk_1E5F4F5B8;
    v12 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v8, "companionLinkSendEventID:event:destinationID:options:completion:", v14, v9, v10, v11, v13);

  }
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)companionLinkReceivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    ((void (**)(_QWORD, id, id))v11)[2](v11, v8, v9);
LABEL_8:

    goto LABEL_9;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", CFSTR("*"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9)
      v13 = (id)objc_msgSend(v9, "mutableCopy");
    else
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v13;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("eventID"));
    ((void (**)(_QWORD, id, void *))v11)[2](v11, v8, v14);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E5F4F608;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerRequestIDOnQueue:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_registerRequestIDOnQueue:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  RPRequestRegistration *v10;
  NSMutableDictionary *requestRegistrations;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(RPRequestRegistration);
  -[RPRequestRegistration setRequestID:](v10, "setRequestID:", v14);
  -[RPRequestRegistration setOptions:](v10, "setOptions:", v8);
  -[RPRequestRegistration setHandler:](v10, "setHandler:", v9);

  requestRegistrations = self->_requestRegistrations;
  if (!requestRegistrations)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_requestRegistrations;
    self->_requestRegistrations = v12;

    requestRegistrations = self->_requestRegistrations;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestRegistrations, "setObject:forKeyedSubscript:", v10, v14);
  -[RPCompanionLinkClient _registerRequestID:options:reregister:](self, "_registerRequestID:options:reregister:", v14, v8, 0);

}

- (void)_registerRequestID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  RPDaemonConnection *daemonCnx;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      v15 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke;
    v19[3] = &unk_1E5F4F568;
    v19[4] = self;
    v21 = v5;
    v13 = v8;
    v20 = v13;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2;
    v16[3] = &unk_1E5F4F568;
    v16[4] = self;
    v18 = v5;
    v17 = v13;
    objc_msgSend(v14, "companionLinkRegisterRequestID:options:completion:", v17, v9, v16);

  }
}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        v6 = v3;
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1)
      goto LABEL_7;
    v8 = v3;
    v5 = _LogCategory_Initialize();
    v3 = v8;
    if (v5)
      goto LABEL_7;
  }

}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_clientError:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_CLinkClient > 60 || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
        goto LABEL_14;
    }
    else if (gLogCategory_CLinkClient > 60
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }
  if (v4[47])
  {
    v6 = v4[34];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3;
    block[3] = &unk_1E5F4ECF8;
    block[4] = v4;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
LABEL_15:

}

uint64_t __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) + 16))();
}

- (void)_reregisterRequests
{
  NSMutableDictionary *requestRegistrations;
  _QWORD v4[5];

  if (-[NSMutableDictionary count](self->_requestRegistrations, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  requestRegistrations = self->_requestRegistrations;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__RPCompanionLinkClient__reregisterRequests__block_invoke;
  v4[3] = &unk_1E5F4F630;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestRegistrations, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __44__RPCompanionLinkClient__reregisterRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "requestID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_registerRequestID:options:reregister:", v6, v5, 1);
}

- (void)deregisterRequestID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPCompanionLinkClient *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD v12[5];
  id v13;

  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    v8 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v4 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2;
    v12[3] = &unk_1E5F4EC88;
    v12[4] = v4;
    v13 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3;
    v10[3] = &unk_1E5F4EC88;
    v9 = *(int8x16_t *)(a1 + 32);
    v11 = vextq_s8(v9, v9, 8uLL);
    objc_msgSend(v7, "companionLinkDeregisterRequestID:completion:", (id)v9.i64[0], v10);

  }
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }

}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        v3 = v5;
      }
    }
  }

}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  RPCompanionLinkClient *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  v23[3] = &unk_1E5F4F680;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = self;
  v29 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  dispatch_async(dispatchQueue, v23);

}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke(id *a1)
{
  void *v2;
  int v3;
  const char *v4;
  uint64_t Int64;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  const char *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  objc_msgSend(a1[4], "valueForKey:", CFSTR("highPriority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    v4 = "at high priority";
  else
    v4 = "";
  Int64 = CFDictionaryGetInt64();
  v6 = a1[5];
  v7 = v6;
  if (Int64)
  {
    v8 = 10;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("_ftSm")) & 1) != 0)
  {
    v8 = 9;
  }
  else
  {
    v8 = 9;
    if ((objc_msgSend(v7, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
    {
      if (objc_msgSend(v7, "isEqual:", CFSTR("_ftRs")))
        v8 = 9;
      else
        v8 = 30;
    }
  }

  if (v8 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    v9 = a1[5];
    v10 = objc_msgSend(a1[6], "count");
    v22 = a1[7];
    v23 = v4;
    v20 = v9;
    v21 = v10;
    LogPrintF();
  }
  objc_msgSend(a1[8], "_ensureXPCStarted", v20, v21, v22, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    (*((void (**)(void))a1[9] + 2))();
  }
  else
  {
    v12 = a1[8];
    v13 = (void *)v12[5];
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
    v28[3] = &unk_1E5F4F5B8;
    v28[4] = v12;
    v29 = a1[5];
    v30 = a1[7];
    v31 = a1[9];
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[6];
    v17 = a1[7];
    v19 = a1[4];
    v18 = a1[5];
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3;
    v24[3] = &unk_1E5F4F658;
    v24[4] = a1[8];
    v25 = v18;
    v26 = a1[7];
    v27 = a1[9];
    objc_msgSend(v15, "companionLinkSendRequestID:request:destinationID:options:responseHandler:", v25, v16, v17, v19, v24);

  }
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CLinkClient <= 60 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, 0);

}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && gLogCategory_CLinkClient <= 60
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v9, v7);

}

- (void)companionLinkReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t Int64;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFDictionaryGetInt64();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handler");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke;
    v18[3] = &unk_1E5F4F6D0;
    v18[4] = self;
    v19 = v10;
    v21 = Int64 != 0;
    v20 = v13;
    ((void (**)(_QWORD, id, id, _QWORD *))v16)[2](v16, v11, v12, v18);

  }
  else
  {
    RPErrorF();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v17);

  }
}

void __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 272);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2;
  v17[3] = &unk_1E5F4F6A8;
  v12 = v10;
  v23 = *(_BYTE *)(a1 + 56);
  v18 = v12;
  v19 = v7;
  v13 = *(id *)(a1 + 48);
  v21 = v9;
  v22 = v13;
  v20 = v8;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v11, v17);

}

uint64_t __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2)
  {
    v5 = 10;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("_ftSm")) & 1) != 0)
  {
    v5 = 9;
  }
  else
  {
    v5 = 9;
    if ((objc_msgSend(v4, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqual:", CFSTR("_ftRs")))
        v5 = 9;
      else
        v5 = 30;
    }
  }

  if (v5 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 40), "count");
    LogPrintF();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)companionLinkHandleDisconnect
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (void)launchAppWithBundleID:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v16 = CFSTR("_bundleID");
  v17[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke;
  v14[3] = &unk_1E5F4F6F8;
  v15 = v8;
  v13 = v8;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_launchApp"), v12, v10, 0, v14);

}

uint64_t __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)launchAppWithURL:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15 = CFSTR("_urlS");
  v9 = a4;
  objc_msgSend(a3, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke;
  v13[3] = &unk_1E5F4F6F8;
  v14 = v8;
  v12 = v8;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_launchApp"), v11, v9, 0, v13);

}

uint64_t __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 completion:(id)a4
{
  -[RPCompanionLinkClient triggerEnhancedDiscoveryForReason:useCase:completion:](self, "triggerEnhancedDiscoveryForReason:useCase:completion:", a3, 0, a4);
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke;
  v13[3] = &unk_1E5F4EE10;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(dispatchQueue, v13);

}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v2);
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 56);
    if (!(_DWORD)v3)
      v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 104);
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(v6 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2;
    v14[3] = &unk_1E5F4F720;
    v14[4] = v6;
    v15 = v7;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3;
    v11[3] = &unk_1E5F4F720;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v9, "companionLinkTriggerEnhancedDiscovery:useCase:completion:", v12, v3, v11);

  }
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)createDeviceToEndpointMappingForDevice:(id)a3 completion:(id)a4
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
  block[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  objc_msgSend(a1[4], "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v10 = (void (**)(id, _QWORD, void *))a1[6];
    if (v10)
      v10[2](v10, 0, v2);
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = a1[4];
    v5 = a1[5];
    v6 = (void *)v4[5];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2;
    v14[3] = &unk_1E5F4F720;
    v14[4] = v4;
    v15 = v5;
    v16 = a1[6];
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3;
    v11[3] = &unk_1E5F4F748;
    v9 = a1[5];
    v11[4] = a1[4];
    v12 = v9;
    v13 = a1[6];
    objc_msgSend(v7, "companionLinkCreateDeviceToEndpointMappingForDeviceID:completion:", v8, v11);

  }
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
    v3 = v6;
  }

}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && gLogCategory_CLinkClient <= 60
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v7, v5);

}

- (void)setLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "idsDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v13[3] = &unk_1E5F4F3E8;
    v13[4] = v5;
    v14 = v6;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v11[3] = &unk_1E5F4F3E8;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    objc_msgSend(v8, "companionLinkSetLocalDeviceAsContextCollector:", v11);

  }
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)removeLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "idsDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v13[3] = &unk_1E5F4F3E8;
    v13[4] = v5;
    v14 = v6;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v11[3] = &unk_1E5F4F3E8;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    objc_msgSend(v8, "companionLinkRemoveLocalDeviceAsContextCollector:", v11);

  }
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)registerProfileID:(id)a3 completion:(id)a4
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
  block[2] = __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke;
  block[3] = &unk_1E5F4F4F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_registerProfileID:reregister:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)_registerProfileID:(id)a3 reregister:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  RPDaemonConnection *daemonCnx;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      v16 = v8;
      LogPrintF();
    }
  }
  else if (gLogCategory_CLinkClient <= 30
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (gLogCategory_CLinkClient <= 90 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    daemonCnx = self->_daemonCnx;
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke;
    v21[3] = &unk_1E5F4F770;
    v21[4] = self;
    v24 = v6;
    v13 = v8;
    v22 = v13;
    v14 = v9;
    v23 = v14;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2;
    v17[3] = &unk_1E5F4F770;
    v17[4] = self;
    v20 = v6;
    v18 = v13;
    v19 = v14;
    objc_msgSend(v15, "companionLinkRegisterProfileID:completion:", v18, v17);

  }
}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = v7;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (gLogCategory_CLinkClient <= 60)
      {
        if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
        {
LABEL_8:
          LogPrintF();
          v3 = v7;
        }
      }
    }
    else if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1)
        goto LABEL_8;
      v5 = _LogCategory_Initialize();
      v3 = v7;
      if (v5)
        goto LABEL_8;
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

- (void)_reregisterProfileIDs
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableOrderedSet count](self->_registeredProfileIDs, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_registeredProfileIDs;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[RPCompanionLinkClient _registerProfileID:reregister:completion:](self, "_registerProfileID:reregister:completion:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), 1, 0, (_QWORD)v8);
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)deregisterProfileID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  RPCompanionLinkClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke;
  block[3] = &unk_1E5F4F4F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    v8 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObject:", *(_QWORD *)(a1 + 32), v8);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2;
    v13[3] = &unk_1E5F4F720;
    v13[4] = v2;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3;
    v10[3] = &unk_1E5F4F720;
    v9 = *(int8x16_t *)(a1 + 32);
    v6 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "companionLinkDeregisterProfileID:completion:", v6, v10);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientError:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedMACAddresses, a3);
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupACL, a3);
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)awdlGuestDiscoveryTimeout
{
  return self->_awdlGuestDiscoveryTimeout;
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_bleClientUseCase = a3;
}

- (NSString)cloudServiceID
{
  return self->_cloudServiceID;
}

- (void)setCloudServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setDestinationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDevice, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (RPCompanionLinkDevice)localDevice
{
  return (RPCompanionLinkDevice *)objc_getProperty(self, a2, 344, 1);
}

- (id)localDeviceUpdatedHandler
{
  return self->_localDeviceUpdatedHandler;
}

- (void)setLocalDeviceUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (BOOL)usingOnDemandConnection
{
  return self->_usingOnDemandConnection;
}

- (void)setUsingOnDemandConnection:(BOOL)a3
{
  self->_usingOnDemandConnection = a3;
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (id)stateUpdatedHandler
{
  return self->_stateUpdatedHandler;
}

- (void)setStateUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)requestIDRegistrationCompletion
{
  return self->_requestIDRegistrationCompletion;
}

- (void)setRequestIDRegistrationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)eventIDRegistrationCompletion
{
  return self->_eventIDRegistrationCompletion;
}

- (void)setEventIDRegistrationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

@end
