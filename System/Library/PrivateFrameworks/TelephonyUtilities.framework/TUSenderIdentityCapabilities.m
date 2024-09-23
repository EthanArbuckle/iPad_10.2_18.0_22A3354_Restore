@implementation TUSenderIdentityCapabilities

- (TUSenderIdentityCapabilities)initWithSenderIdentityUUID:(id)a3 state:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUSenderIdentityCapabilities *v11;
  uint64_t v12;
  NSUUID *senderIdentityUUID;
  uint64_t v14;
  TUSenderIdentityCapabilitiesState *state;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUSenderIdentityCapabilities;
  v11 = -[TUSenderIdentityCapabilities init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    senderIdentityUUID = v11->_senderIdentityUUID;
    v11->_senderIdentityUUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    state = v11->_state;
    v11->_state = (TUSenderIdentityCapabilitiesState *)v14;

    objc_storeStrong((id *)&v11->_client, a5);
  }

  return v11;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  void *v2;
  char v3;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSimultaneousVoiceAndData");

  return v3;
}

- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[TUSenderIdentityCapabilities isWiFiCallingCurrentlyAvailable](self, "isWiFiCallingCurrentlyAvailable"))
    return 1;
  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsPrimaryCalling") & 1) != 0)
  {
    v3 = 0;
  }
  else if (-[TUSenderIdentityCapabilities isThumperCallingCurrentlyAvailable](self, "isThumperCallingCurrentlyAvailable"))
  {
    v3 = 1;
  }
  else
  {
    -[TUSenderIdentityCapabilities client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "areRelayCallingFeaturesEnabled");

  }
  return v3;
}

- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  _BOOL4 v3;

  v3 = -[TUSenderIdentityCapabilities canAttemptTelephonyCallsWithoutCellularConnection](self, "canAttemptTelephonyCallsWithoutCellularConnection");
  if (v3)
    LOBYTE(v3) = -[TUSenderIdentityCapabilities isEmergencyWiFiCallingCurrentlyAvailable](self, "isEmergencyWiFiCallingCurrentlyAvailable");
  return v3;
}

- (BOOL)isCSCallingCurrentlyAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "csCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentlyAvailable");

  return v4;
}

- (BOOL)supportsVoLTECalling
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voLTECallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSupported");

  return v4;
}

- (BOOL)isVoLTECallingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voLTECallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (TUCTCapabilityInfo)voLTECallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voLTECallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isVoLTECallingCurrentlyAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voLTECallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentlyAvailable");

  return v4;
}

- (BOOL)supportsWiFiCalling
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSupported");

  return v4;
}

- (BOOL)isWiFiCallingEnabled
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TUSenderIdentityCapabilities supportsWiFiCalling](self, "supportsWiFiCalling");
  if (v3)
  {
    -[TUSenderIdentityCapabilities state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wiFiCallingCapabilitiesState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnabled");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)supportsWiFiCallingRoaming
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRoamingSupported");

  return v4;
}

- (BOOL)isWiFiCallingRoamingEnabled
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TUSenderIdentityCapabilities supportsWiFiCallingRoaming](self, "supportsWiFiCallingRoaming");
  if (v3)
  {
    -[TUSenderIdentityCapabilities state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wiFiCallingCapabilitiesState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRoamingEnabled");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (TUCTCapabilityInfo)wiFiCallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isWiFiCallingCurrentlyAvailable
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TUSenderIdentityCapabilities isWiFiCallingEnabled](self, "isWiFiCallingEnabled");
  if (v3)
  {
    -[TUSenderIdentityCapabilities state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wiFiCallingCapabilitiesState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCurrentlyAvailable");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)supportsEmergencyWiFiCalling
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TUSenderIdentityCapabilities supportsWiFiCalling](self, "supportsWiFiCalling");
  if (v3)
  {
    -[TUSenderIdentityCapabilities state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wiFiCallingCapabilitiesState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmergencySupported");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isEmergencyWiFiCallingCurrentlyAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmergencyCurrentlyAvailable");

  return v4;
}

- (int)wiFiCallingProvisioningStatus
{
  void *v2;
  void *v3;
  int v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "provisioningStatus");

  return v4;
}

- (NSURL)wiFiCallingProvisioningURL
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (BOOL)isWiFiCallingProvisioningURLInvalid
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProvisioningURLInvalid");

  return v4;
}

- (NSData)wiFiCallingProvisioningPostData
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningPostData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (BOOL)supportsThumperCalling
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSupported");

  return v4;
}

- (BOOL)supportsThumperCallingOverCellularData
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCellularData");

  return v4;
}

- (BOOL)isThumperCallingAllowedForCurrentDevice
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isApproved");

  return v4;
}

- (BOOL)isThumperCallingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (TUCTCapabilityInfo)thumperCallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isThumperCallingCurrentlyAvailable
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TUSenderIdentityCapabilities isThumperCallingEnabled](self, "isThumperCallingEnabled");
  if (v3)
  {
    -[TUSenderIdentityCapabilities state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumperCallingCapabilitiesState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCurrentlyAvailable");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (int)thumperCallingProvisioningStatus
{
  void *v2;
  void *v3;
  int v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "provisioningStatus");

  return v4;
}

- (NSURL)thumperCallingProvisioningURL
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (BOOL)isThumperCallingProvisioningURLInvalid
{
  void *v2;
  void *v3;
  char v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProvisioningURLInvalid");

  return v4;
}

- (NSData)thumperCallingProvisioningPostData
{
  void *v2;
  void *v3;
  void *v4;

  -[TUSenderIdentityCapabilities state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumperCallingCapabilitiesState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningPostData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;

  v5 = a3;
  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsPrimaryCalling");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnSecondaryDeviceWithID:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("** TUAssertion failure: %@"), v9);

    if (_TUAssertShouldCrashApplication())
    {
      -[TUSenderIdentityCapabilities client](self, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "supportsPrimaryCalling");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUSenderIdentityCapabilities.m"), 183, CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnSecondaryDeviceWithID:]");

      }
    }
  }
  -[TUSenderIdentityCapabilities state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thumperCallingCapabilitiesState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "approvedSecondaryDeviceIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v5);

  return v16;
}

- (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;

  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPrimaryCalling");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnDefaultPairedSecondaryDevice]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("** TUAssertion failure: %@"), v7);

    if (_TUAssertShouldCrashApplication())
    {
      -[TUSenderIdentityCapabilities client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "supportsPrimaryCalling");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUSenderIdentityCapabilities.m"), 190, CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnDefaultPairedSecondaryDevice]");

      }
    }
  }
  -[TUSenderIdentityCapabilities state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumperCallingCapabilitiesState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "supportsDefaultPairedDevice"))
  {
    -[TUSenderIdentityCapabilities client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultPairedDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TUSenderIdentityCapabilities isThumperCallingAllowedOnSecondaryDeviceWithID:](self, "isThumperCallingAllowedOnSecondaryDeviceWithID:", v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setVoLTECallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set VoLTE calling enabled to %d", (uint8_t *)v8, 8u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVoLTECallingEnabled:forSenderIdentityWithUUID:", v3, v7);

}

- (void)setWiFiCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set WiFi calling enabled to %d", (uint8_t *)v8, 8u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWiFiCallingEnabled:forSenderIdentityWithUUID:", v3, v7);

}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set WiFi calling roaming enabled to %d", (uint8_t *)v8, 8u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:", v3, v7);

}

- (void)invalidateAndRefreshWiFiCallingProvisioningURL
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate and refresh WiFi calling provisioning URL", v6, 2u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:", v5);

}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling enabled to %d", (uint8_t *)v8, 8u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThumperCallingEnabled:forSenderIdentityWithUUID:", v3, v7);

}

- (void)invalidateAndRefreshThumperCallingProvisioningURL
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate and refresh Thumper calling provisioning URL", v6, 2u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:", v5);

}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[TUSenderIdentityCapabilities client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsPrimaryCalling");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUSenderIdentityCapabilities.m"), 237, CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:]");

  }
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v16 = v4;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling allowed to %d on secondary device with ID %@", buf, 0x12u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:", v4, v7, v13);

}

- (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[TUSenderIdentityCapabilities client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsPrimaryCalling");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUSenderIdentityCapabilities.m"), 244, CFSTR("%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES"), "-[TUSenderIdentityCapabilities setThumperCallingAllowedOnDefaultPairedSecondaryDevice:]");

  }
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v3;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling allowed on paired secondary device to %d", buf, 8u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilities senderIdentityUUID](self, "senderIdentityUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setThumperCallingAllowedOnDefaultPairedDevice:forSenderIdentityWithUUID:", v3, v11);

}

- (void)requestPinFromPrimaryDeviceForThumperCalling
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to request PIN from primary device for Thumper calling", v5, 2u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestPinFromPrimaryDevice");

}

- (void)cancelPinRequestFromPrimaryDeviceForThumperCalling
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to cancel PIN from primary device for Thumper calling", v5, 2u);
  }

  -[TUSenderIdentityCapabilities client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPinRequestFromPrimaryDevice");

}

- (void)_sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  _BOOL4 v50;
  int v51;
  _BOOL4 v52;
  int v53;
  int v54;
  int v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  uint8_t buf[4];
  _BYTE v62[10];
  void *v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  _BOOL4 v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isWiFiCallingEnabled");
  v53 = objc_msgSend(v4, "isVoLTECallingEnabled");
  v55 = objc_msgSend(v4, "supportsThumperCalling");
  v44 = objc_msgSend(v4, "supportsThumperCallingOverCellularData");
  v51 = objc_msgSend(v4, "isThumperCallingEnabled");
  objc_msgSend(v4, "thumperCallingCapabilityInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v6, "provisioningStatus");

  objc_msgSend(v4, "wiFiCallingCapabilityInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provisioningURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "thumperCallingCapabilityInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provisioningURL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumperCallingCapabilitiesState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v10, "isAssociated");

  objc_msgSend(v4, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "thumperCallingCapabilitiesState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v12, "supportsDefaultPairedDevice");

  v13 = -[TUSenderIdentityCapabilities isWiFiCallingEnabled](self, "isWiFiCallingEnabled");
  v14 = -[TUSenderIdentityCapabilities isVoLTECallingEnabled](self, "isVoLTECallingEnabled");
  v54 = -[TUSenderIdentityCapabilities supportsThumperCalling](self, "supportsThumperCalling");
  v52 = -[TUSenderIdentityCapabilities supportsThumperCallingOverCellularData](self, "supportsThumperCallingOverCellularData");
  v50 = -[TUSenderIdentityCapabilities isThumperCallingEnabled](self, "isThumperCallingEnabled");
  -[TUSenderIdentityCapabilities thumperCallingCapabilityInfo](self, "thumperCallingCapabilityInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v15, "provisioningStatus");

  -[TUSenderIdentityCapabilities wiFiCallingCapabilityInfo](self, "wiFiCallingCapabilityInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "provisioningURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUSenderIdentityCapabilities thumperCallingCapabilityInfo](self, "thumperCallingCapabilityInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "provisioningURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUSenderIdentityCapabilities state](self, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "thumperCallingCapabilitiesState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v21, "isAssociated");

  -[TUSenderIdentityCapabilities state](self, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "thumperCallingCapabilitiesState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "supportsDefaultPairedDevice");

  v25 = MEMORY[0x1E0C809B0];
  v26 = 0x1E0CB3000;
  if (v5 != v13)
  {
    TUDefaultLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v62 = v5;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v13;
      _os_log_impl(&dword_19A50D000, v27, OS_LOG_TYPE_DEFAULT, "WiFi capabilities changed from %d to %d", buf, 0xEu);
    }

    -[TUSenderIdentityCapabilities client](self, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v25;
    v60[1] = 3221225472;
    v60[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke;
    v60[3] = &unk_1E38A17B8;
    v60[4] = self;
    objc_msgSend(v28, "performDelegateCallbackBlock:", v60);

    v26 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("TUCallCapabilitiesWiFiCallingChangedNotification"), 0);

  }
  if (v53 != v14)
  {
    TUDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v62 = v53;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v14;
      _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "VoLTE capabilities changed from %d to %d", buf, 0xEu);
    }

    -[TUSenderIdentityCapabilities client](self, "client");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v25;
    v59[1] = 3221225472;
    v59[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_10;
    v59[3] = &unk_1E38A17B8;
    v59[4] = self;
    objc_msgSend(v31, "performDelegateCallbackBlock:", v59);

    objc_msgSend(*(id *)(v26 + 2000), "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:", CFSTR("TUCallCapabilitiesVoLTECallingChangedNotification"), 0);

  }
  if (v55 != v54
    || ((v44 ^ v52) & 1) != 0
    || ((v51 ^ v50) & 1) != 0
    || v49 != v48
    || ((v47 ^ v24) & 1) != 0
    || v43 != v42)
  {
    TUDefaultLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67111936;
      *(_DWORD *)v62 = v55;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v44;
      LOWORD(v63) = 1024;
      *(_DWORD *)((char *)&v63 + 2) = v51;
      HIWORD(v63) = 1024;
      v64 = v49;
      v65 = 1024;
      v66 = v43;
      v67 = 1024;
      v68 = v47;
      v69 = 1024;
      v70 = v54;
      v71 = 1024;
      v72 = v52;
      v73 = 1024;
      v74 = v50;
      v75 = 1024;
      v76 = v48;
      v77 = 1024;
      v78 = v42;
      v79 = 1024;
      v80 = v24;
      _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Thumper capabilities changed from (supported=%d overCellularData=%d enabled=%d provisioningStatus=%d, associated=%d, supportsDefaultPairedDevice=%d) to (supported=%d overCellularData=%d enabled=%d provisioningStatus=%d, associated=%d, supportsDefaultPairedDevice=%d)", buf, 0x4Au);
    }

    -[TUSenderIdentityCapabilities client](self, "client");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v25;
    v58[1] = 3221225472;
    v58[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_13;
    v58[3] = &unk_1E38A17B8;
    v58[4] = self;
    objc_msgSend(v34, "performDelegateCallbackBlock:", v58);

    objc_msgSend(*(id *)(v26 + 2000), "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postNotificationName:object:", CFSTR("TUCallCapabilitiesThumperCallingChangedNotification"), 0);

  }
  if ((TUObjectsAreEqualOrNil((unint64_t)v46, (uint64_t)v17) & 1) == 0)
  {
    TUDefaultLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v62 = v46;
      *(_WORD *)&v62[8] = 2112;
      v63 = v17;
      _os_log_impl(&dword_19A50D000, v36, OS_LOG_TYPE_DEFAULT, "WiFi calling URL changed from %@ to %@", buf, 0x16u);
    }

    -[TUSenderIdentityCapabilities client](self, "client");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v25;
    v57[1] = 3221225472;
    v57[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_16;
    v57[3] = &unk_1E38A17B8;
    v57[4] = self;
    objc_msgSend(v37, "performDelegateCallbackBlock:", v57);

    objc_msgSend(*(id *)(v26 + 2000), "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "postNotificationName:object:", CFSTR("TUCallCapabilitiesWiFiCallingProvisioningURLChangedNotification"), 0);

  }
  if ((TUObjectsAreEqualOrNil((unint64_t)v45, (uint64_t)v19) & 1) == 0)
  {
    TUDefaultLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v62 = v45;
      *(_WORD *)&v62[8] = 2112;
      v63 = v19;
      _os_log_impl(&dword_19A50D000, v39, OS_LOG_TYPE_DEFAULT, "Thumper calling URL changed from %@ to %@", buf, 0x16u);
    }

    -[TUSenderIdentityCapabilities client](self, "client");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v25;
    v56[1] = 3221225472;
    v56[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_19;
    v56[3] = &unk_1E38A17B8;
    v56[4] = self;
    objc_msgSend(v40, "performDelegateCallbackBlock:", v56);

    objc_msgSend(*(id *)(v26 + 2000), "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "postNotificationName:object:", CFSTR("TUCallCapabilitiesThumperCallingProvisioningURLChangedNotification"), 0);

  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderIdentityUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeWiFiCallingCapabilitiesForSenderIdentityWithUUID:", v3);

  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderIdentityUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeVoLTECallingCapabilitiesForSenderIdentityWithUUID:", v3);

  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderIdentityUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:", v3);

  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderIdentityUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeWiFiCallingProvisionalURLForSenderIdentityWithUUID:", v3);

  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderIdentityUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:", v3);

  }
}

- (id)debugDescription
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("== TUSenderIdentityCapabilities ==\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("CDMA:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsSimultaneousVoiceAndData: %d\n"), -[TUSenderIdentityCapabilities supportsSimultaneousVoiceAndData](self, "supportsSimultaneousVoiceAndData"));
  objc_msgSend(v3, "appendString:", CFSTR("Wi-Fi calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsWiFiCalling: %d\n"), -[TUSenderIdentityCapabilities supportsWiFiCalling](self, "supportsWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isWiFiCallingEnabled: %d\n"), -[TUSenderIdentityCapabilities isWiFiCallingEnabled](self, "isWiFiCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isWiFiCallingCurrentlyAvailable: %d\n"), -[TUSenderIdentityCapabilities isWiFiCallingCurrentlyAvailable](self, "isWiFiCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsEmergencyWiFiCalling: %d\n"), -[TUSenderIdentityCapabilities supportsEmergencyWiFiCalling](self, "supportsEmergencyWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isEmergencyWiFiCallingCurrentlyAvailable: %d\n"), -[TUSenderIdentityCapabilities isEmergencyWiFiCallingCurrentlyAvailable](self, "isEmergencyWiFiCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("VoLTE calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsVoLTECalling: %d\n"), -[TUSenderIdentityCapabilities supportsVoLTECalling](self, "supportsVoLTECalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isVoLTECallingEnabled: %d\n"), -[TUSenderIdentityCapabilities isVoLTECallingEnabled](self, "isVoLTECallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isVoLTECallingCurrentlyAvailable: %d\n"), -[TUSenderIdentityCapabilities isVoLTECallingCurrentlyAvailable](self, "isVoLTECallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("Thumper calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsThumperCalling: %d\n"), -[TUSenderIdentityCapabilities supportsThumperCalling](self, "supportsThumperCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingAllowedForCurrentDevice: %d\n"), -[TUSenderIdentityCapabilities isThumperCallingAllowedForCurrentDevice](self, "isThumperCallingAllowedForCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingEnabled: %d\n"), -[TUSenderIdentityCapabilities isThumperCallingEnabled](self, "isThumperCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsThumperCallingOverCellularData: %d\n"), -[TUSenderIdentityCapabilities supportsThumperCallingOverCellularData](self, "supportsThumperCallingOverCellularData"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingCurrentlyAvailable: %d\n"), -[TUSenderIdentityCapabilities isThumperCallingCurrentlyAvailable](self, "isThumperCallingCurrentlyAvailable"));
  return v3;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (NSString)thumperCallingLocalDeviceID
{
  return self->_thumperCallingLocalDeviceID;
}

- (void)setThumperCallingLocalDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUSenderIdentityCapabilitiesState)state
{
  return self->_state;
}

- (TUCallCapabilitiesXPCClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_thumperCallingLocalDeviceID, 0);
  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);
}

@end
