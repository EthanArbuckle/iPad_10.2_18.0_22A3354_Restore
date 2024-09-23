@implementation TUCallCapabilities

+ (BOOL)supportsTelephonyCalls
{
  return (int)objc_msgSend(a1, "telephonyCallSupport") > 1;
}

+ (int)telephonyCallSupport
{
  int result;

  result = objc_msgSend(a1, "supportsDisplayingTelephonyCalls");
  if (result)
  {
    if ((objc_msgSend(a1, "isDirectTelephonyCallingCurrentlyAvailable") & 1) != 0)
    {
      return 3;
    }
    else
    {
      result = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
      if (result)
      {
        if (objc_msgSend(a1, "supportsTelephonyRelayCalling"))
          return 2;
        else
          return 0;
      }
    }
  }
  return result;
}

+ (BOOL)isDirectTelephonyCallingCurrentlyAvailable
{
  if ((objc_msgSend(a1, "supportsPrimaryCalling") & 1) != 0
    || (objc_msgSend(a1, "isWiFiCallingCurrentlyAvailable") & 1) != 0
    || (objc_msgSend(a1, "isThumperCallingCurrentlyAvailable") & 1) != 0
    || (objc_msgSend(a1, "isVoLTECallingCurrentlyAvailable") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isCSCallingCurrentlyAvailable");
  }
}

+ (BOOL)supportsDisplayingTelephonyCalls
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsDisplayingTelephonyCalls");

  return v4;
}

+ (BOOL)supportsPrimaryCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPrimaryCalling");

  return v4;
}

+ (id)client
{
  if (client_onceToken != -1)
    dispatch_once(&client_onceToken, &__block_literal_global_41);
  return (id)client_client;
}

+ (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsDisplayingFaceTimeVideoCalls");

  return v4;
}

+ (BOOL)supportsFaceTimeAudioCalls
{
  return (int)objc_msgSend(a1, "faceTimeAudioCallSupport") > 1;
}

+ (int)faceTimeAudioCallSupport
{
  int result;

  result = objc_msgSend(a1, "supportsDisplayingFaceTimeAudioCalls");
  if (result)
  {
    if ((objc_msgSend(a1, "isDirectFaceTimeAudioCallingCurrentlyAvailable") & 1) != 0)
    {
      return 3;
    }
    else
    {
      result = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
      if (result)
      {
        if (objc_msgSend(a1, "supportsFaceTimeAudioRelayCalling"))
          return 2;
        else
          return 0;
      }
    }
  }
  return result;
}

+ (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFaceTimeAudioAvailable");

  return v4;
}

+ (BOOL)areRelayCallingFeaturesEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areRelayCallingFeaturesEnabled");

  return v4;
}

+ (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsDisplayingFaceTimeAudioCalls");

  return v4;
}

+ (void)initializeCachedValues
{
  objc_msgSend(a1, "client");

}

void __28__TUCallCapabilities_client__block_invoke()
{
  TUCallCapabilitiesXPCClient *v0;
  void *v1;

  v0 = objc_alloc_init(TUCallCapabilitiesXPCClient);
  v1 = (void *)client_client;
  client_client = (uint64_t)v0;

}

+ (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", v7, v6);

}

+ (BOOL)supportsFaceTimeVideoCalls
{
  return (int)objc_msgSend(a1, "faceTimeVideoCallSupport") > 1;
}

+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  if ((objc_msgSend(a1, "isWiFiCallingCurrentlyAvailable") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "supportsPrimaryCalling") & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isThumperCallingCurrentlyAvailable") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
}

+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnectionWithSenderIdentityCapabilities:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isWiFiCallingCurrentlyAvailable") & 1) != 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(a1, "supportsPrimaryCalling") & 1) == 0)
  {
    if ((objc_msgSend(v4, "isThumperCallingCurrentlyAvailable") & 1) == 0)
    {
      v5 = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_msgSend(a1, "canAttemptTelephonyCallsWithoutCellularConnection");
  if (v3)
  {
    objc_msgSend(a1, "senderIdentityCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmergencyWiFiCallingCurrentlyAvailable");

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a1, "senderIdentityCapabilitiesWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(a1, "canAttemptTelephonyCallsWithoutCellularConnectionWithSenderIdentityCapabilities:", v4))
  {
    v5 = objc_msgSend(v4, "isEmergencyWiFiCallingCurrentlyAvailable");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsBasebandCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsBasebandCalling");

  return v4;
}

+ (int)faceTimeVideoCallSupport
{
  int result;

  result = objc_msgSend(a1, "supportsDisplayingFaceTimeVideoCalls");
  if (result)
  {
    if ((objc_msgSend(a1, "isDirectFaceTimeVideoCallingCurrentlyAvailable") & 1) != 0)
    {
      return 3;
    }
    else
    {
      result = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
      if (result)
        return objc_msgSend(a1, "supportsFaceTimeVideoRelayCalling");
    }
  }
  return result;
}

+ (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFaceTimeVideoAvailable");

  return v4;
}

+ (BOOL)supportsSimultaneousVoiceAndData
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSimultaneousVoiceAndData");

  return v4;
}

+ (BOOL)isSimultaneousVoiceAndDataSupportedForSIMWithUUID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilitiesWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSimultaneousVoiceAndData");

  return v4;
}

+ (BOOL)areCTCapabilitiesValid
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areCTCapabilitiesValid");

  return v4;
}

+ (BOOL)isCSCallingCurrentlyAvailable
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_11);

  return v3;
}

uint64_t __51__TUCallCapabilities_isCSCallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCSCallingCurrentlyAvailable");
  *a3 = result;
  return result;
}

+ (BOOL)supportsWiFiCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsWiFiCalling");

  return v4;
}

+ (BOOL)isWiFiCallingEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWiFiCallingEnabled");

  return v4;
}

+ (void)setWiFiCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "senderIdentityCapabilities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWiFiCallingEnabled:", v3);

}

+ (BOOL)isWiFiCallingRoamingEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWiFiCallingRoamingEnabled");

  return v4;
}

+ (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = objc_msgSend(a1, "isWiFiCallingRoamingEnabled");
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to change wiFiCallingRoamingEnabled from %d to %d", (uint8_t *)v8, 0xEu);
  }

  objc_msgSend(a1, "senderIdentityCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWiFiCallingRoamingEnabled:", v3);

}

+ (TUCTCapabilityInfo)wiFiCallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wiFiCallingCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isWiFiCallingCurrentlyAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "senderIdentityCapabilities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isWiFiCallingCurrentlyAvailable") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)supportsWiFiEmergencyCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsEmergencyWiFiCalling");

  return v4;
}

+ (BOOL)supportsVoLTECalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsVoLTECalling");

  return v4;
}

+ (BOOL)isVoLTECallingEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVoLTECallingEnabled");

  return v4;
}

+ (void)setVoLTECallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "senderIdentityCapabilities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoLTECallingEnabled:", v3);

}

+ (TUCTCapabilityInfo)voLTECallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voLTECallingCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isVoLTECallingCurrentlyAvailable
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_32);

  return v3;
}

uint64_t __54__TUCallCapabilities_isVoLTECallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isVoLTECallingCurrentlyAvailable");
  *a3 = result;
  return result;
}

+ (BOOL)accountsMatchForSecondaryCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountsMatchForSecondaryCalling");

  return v4;
}

+ (BOOL)accountsSupportSecondaryCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountsSupportSecondaryCalling");

  return v4;
}

+ (NSArray)cloudCallingDevices
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudCallingDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (BOOL)supportsThumperCalling
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_33);

  return v3;
}

uint64_t __44__TUCallCapabilities_supportsThumperCalling__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "supportsThumperCalling");
  *a3 = result;
  return result;
}

+ (BOOL)supportsThumperCallingOverCellularData
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCellularData");

  return v4;
}

+ (BOOL)isThumperCallingAllowedForCurrentDevice
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_34_0);

  return v3;
}

uint64_t __61__TUCallCapabilities_isThumperCallingAllowedForCurrentDevice__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isThumperCallingAllowedForCurrentDevice");
  *a3 = result;
  return result;
}

+ (BOOL)isThumperCallingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_35);

  return v3;
}

uint64_t __45__TUCallCapabilities_isThumperCallingEnabled__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isThumperCallingEnabled");
  *a3 = result;
  return result;
}

+ (TUCTCapabilityInfo)thumperCallingCapabilityInfo
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumperCallingCapabilityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isThumperCallingCurrentlyAvailable
{
  void *v2;
  char v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_36);

  return v3;
}

uint64_t __56__TUCallCapabilities_isThumperCallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isThumperCallingCurrentlyAvailable");
  *a3 = result;
  return result;
}

+ (void)setThumperCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "senderIdentityCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setThumperCallingEnabled:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "senderIdentityCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__TUCallCapabilities_isThumperCallingAllowedOnSecondaryDeviceWithID___block_invoke;
  v10[3] = &unk_1E38A1ED8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "tu_anyObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

uint64_t __69__TUCallCapabilities_isThumperCallingAllowedOnSecondaryDeviceWithID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isThumperCallingAllowedOnSecondaryDeviceWithID:", *(_QWORD *)(a1 + 32));
  *a3 = result;
  return result;
}

+ (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tu_anyObjectPassingTest:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __75__TUCallCapabilities_isThumperCallingAllowedOnDefaultPairedSecondaryDevice__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isThumperCallingAllowedOnDefaultPairedSecondaryDevice");
  *a3 = result;
  return result;
}

+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "senderIdentityCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setThumperCallingAllowed:onSecondaryDeviceWithID:", v4, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "client");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:", v6, v9, v8);

}

+ (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "senderIdentityCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setThumperCallingAllowedOnDefaultPairedSecondaryDevice:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)invalidateAndRefreshWiFiCallingProvisioningURL
{
  void *v2;
  id v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndRefreshWiFiCallingProvisioningURL");

}

+ (void)invalidateAndRefreshThumperCallingProvisioningURL
{
  void *v2;
  id v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndRefreshThumperCallingProvisioningURL");

}

+ (BOOL)supportsRelayCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsRelayCalling");

  return v4;
}

+ (BOOL)isRelayCallingEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!objc_msgSend(a1, "supportsRelayCalling")
    || !objc_msgSend(a1, "accountsSupportSecondaryCalling"))
  {
    return 0;
  }
  objc_msgSend(a1, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRelayCallingEnabled");

  return v5;
}

+ (void)setRelayCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = objc_msgSend(a1, "isRelayCallingEnabled");
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to change relayCallingEnabled from %d to %d", (uint8_t *)v7, 0xEu);
  }

  objc_msgSend(a1, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelayCallingEnabled:", v3);

}

+ (BOOL)isRelayCallingEnabledForDeviceWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relayCallingDisabledForDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "BOOLValue") ^ 1;
  return (char)v4;
}

+ (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109634;
    v9[1] = objc_msgSend(a1, "isRelayCallingEnabledForDeviceWithID:", v6);
    v10 = 1024;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to change relayCallingEnabled from %d to %d for %@", (uint8_t *)v9, 0x18u);
  }

  objc_msgSend(a1, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelayCallingEnabled:forDeviceWithID:", v4, v6);

}

+ (NSString)outgoingRelayCallerID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outgoingRelayCallerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (int)relayCallingAvailability
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "relayCallingAvailability");

  return v4;
}

+ (BOOL)supportsTelephonyRelayCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsTelephonyRelayCalling");

  return v4;
}

+ (BOOL)supportsFaceTimeAudioRelayCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsFaceTimeAudioRelayCalling");

  return v4;
}

+ (BOOL)supportsFaceTimeVideoRelayCalling
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsFaceTimeVideoRelayCalling");

  return v4;
}

+ (void)requestPinFromPrimaryDevice
{
  void *v2;
  id v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPinFromPrimaryDeviceForThumperCalling");

}

+ (void)cancelPinRequestFromPrimaryDevice
{
  void *v2;
  id v3;

  objc_msgSend(a1, "senderIdentityCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPinRequestFromPrimaryDeviceForThumperCalling");

}

+ (BOOL)isEmergencyCallbackModeEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmergencyCallbackModeEnabled");

  return v4;
}

+ (void)endEmergencyCallbackMode
{
  id v2;

  objc_msgSend(a1, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEmergencyCallbackMode");

}

+ (BOOL)isEmergencyCallbackPossible
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmergencyCallbackPossible");

  return v4;
}

+ (NSSet)senderIdentityCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  TUSenderIdentityCapabilities *v14;
  void *v15;
  TUSenderIdentityCapabilities *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderIdentityCapabilitiesStateByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [TUSenderIdentityCapabilities alloc];
        objc_msgSend(a1, "client");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TUSenderIdentityCapabilities initWithSenderIdentityUUID:state:client:](v14, "initWithSenderIdentityUUID:state:client:", v12, v13, v15);

        objc_msgSend(v6, "addObject:", v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  return (NSSet *)v17;
}

+ (id)senderIdentityCapabilitiesWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TUSenderIdentityCapabilities *v9;
  void *v10;
  TUSenderIdentityCapabilities *v11;

  v4 = a3;
  objc_msgSend(a1, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderIdentityCapabilitiesStateByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [TUSenderIdentityCapabilities alloc];
  objc_msgSend(a1, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TUSenderIdentityCapabilities initWithSenderIdentityUUID:state:client:](v9, "initWithSenderIdentityUUID:state:client:", v4, v8, v10);

  return v11;
}

+ (id)_senderIdentityCapabilitiesByUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  TUSenderIdentityCapabilities *v14;
  void *v15;
  TUSenderIdentityCapabilities *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderIdentityCapabilitiesStateByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [TUSenderIdentityCapabilities alloc];
        objc_msgSend(a1, "client");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TUSenderIdentityCapabilities initWithSenderIdentityUUID:state:client:](v14, "initWithSenderIdentityUUID:state:client:", v12, v13, v15);

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  return v17;
}

+ (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

+ (void)_sendNotificationsAndCallbacksAfterRunningBlock:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  uint64_t v61;
  void *v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  _BYTE v99[10];
  void *v100;
  int v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "supportsTelephonyCalls");
  v6 = objc_msgSend(a1, "supportsFaceTimeAudioCalls");
  v63 = objc_msgSend(a1, "supportsFaceTimeVideoCalls");
  v73 = objc_msgSend(a1, "isDirectFaceTimeAudioCallingCurrentlyAvailable");
  v65 = objc_msgSend(a1, "isDirectFaceTimeVideoCallingCurrentlyAvailable");
  v76 = objc_msgSend(a1, "supportsRelayCalling");
  v67 = objc_msgSend(a1, "isRelayCallingEnabled");
  v79 = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
  objc_msgSend(a1, "cloudCallingDevices");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outgoingRelayCallerID");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(a1, "relayCallingAvailability");
  v7 = objc_msgSend(a1, "isEmergencyCallbackModeEnabled");
  v69 = objc_msgSend(a1, "isEmergencyCallbackPossible");
  objc_msgSend(a1, "_senderIdentityCapabilitiesByUUID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v4;
  (*((void (**)(id))v4 + 2))(v4);
  v8 = objc_msgSend(a1, "supportsTelephonyCalls");
  v9 = objc_msgSend(a1, "supportsFaceTimeAudioCalls");
  v10 = objc_msgSend(a1, "supportsFaceTimeVideoCalls");
  v72 = objc_msgSend(a1, "isDirectFaceTimeAudioCallingCurrentlyAvailable");
  v64 = objc_msgSend(a1, "isDirectFaceTimeVideoCallingCurrentlyAvailable");
  v74 = objc_msgSend(a1, "supportsRelayCalling");
  v66 = objc_msgSend(a1, "isRelayCallingEnabled");
  v78 = objc_msgSend(a1, "areRelayCallingFeaturesEnabled");
  objc_msgSend(a1, "cloudCallingDevices");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outgoingRelayCallerID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(a1, "relayCallingAvailability");
  v68 = objc_msgSend(a1, "isEmergencyCallbackModeEnabled");
  v12 = objc_msgSend(a1, "isEmergencyCallbackPossible");
  v85 = a1;
  objc_msgSend(a1, "_senderIdentityCapabilitiesByUUID");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v8)
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v5;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v8;
      _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Telephony support changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performDelegateCallbackBlock:", &__block_literal_global_44);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("TUCallCapabilitiesSupportsTelephonyCallsChangedNotification"), 0);

  }
  v16 = v84;
  if (v6 != v9)
  {
    TUDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v6;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v9;
      _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "FaceTime Audio support changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "performDelegateCallbackBlock:", &__block_literal_global_47);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("TUCallCapabilitiesSupportsFaceTimeAudioCallsChangedNotification"), 0);

  }
  if (v63 != v10)
  {
    TUDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v63;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v10;
      _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "FaceTime Video support changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "performDelegateCallbackBlock:", &__block_literal_global_51);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("TUCallCapabilitiesSupportsFaceTimeVideoCallsChangedNotification"), 0);

  }
  if (v73 != v72 || v65 != v64)
  {
    TUDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v99 = v73;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v65;
      LOWORD(v100) = 1024;
      *(_DWORD *)((char *)&v100 + 2) = v72;
      HIWORD(v100) = 1024;
      v101 = v64;
      _os_log_impl(&dword_19A50D000, v23, OS_LOG_TYPE_DEFAULT, "FaceTime availability changed from (audio=%d video=%d) to (audio=%d video=%d)", buf, 0x1Au);
    }

    objc_msgSend(v85, "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "performDelegateCallbackBlock:", &__block_literal_global_55);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:", CFSTR("TUCallCapabilitiesFaceTimeAvailabilityChangedNotification"), 0);

  }
  if (v76 != v74 || v67 != v66)
  {
    TUDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v99 = v76;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v67;
      LOWORD(v100) = 1024;
      *(_DWORD *)((char *)&v100 + 2) = v74;
      HIWORD(v100) = 1024;
      v101 = v66;
      _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "Relay capabilities changed from (supported=%d enabled=%d) to (supported=%d enabled=%d)", buf, 0x1Au);
    }

    objc_msgSend(v85, "client");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "performDelegateCallbackBlock:", &__block_literal_global_59);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:", CFSTR("TUCallCapabilitiesRelayCallingChangedNotification"), 0);

  }
  if (v77 != v75)
  {
    TUDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v77;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v75;
      _os_log_impl(&dword_19A50D000, v29, OS_LOG_TYPE_DEFAULT, "Relay calling availability changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "performDelegateCallbackBlock:", &__block_literal_global_63);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "postNotificationName:object:", CFSTR("TUCallCapabilitiesRelayCallingAvailabilityChangedNotification"), 0);

  }
  if (v79 != v78)
  {
    TUDefaultLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v79;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v78;
      _os_log_impl(&dword_19A50D000, v32, OS_LOG_TYPE_DEFAULT, "Relay calling features changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "performDelegateCallbackBlock:", &__block_literal_global_67_0);

  }
  if ((objc_msgSend(v81, "isEqualToArray:", v11) & 1) == 0)
  {
    TUDefaultLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v34, OS_LOG_TYPE_DEFAULT, "Cloud calling devices changed", buf, 2u);
    }

    objc_msgSend(v85, "client");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "performDelegateCallbackBlock:", &__block_literal_global_71);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:", CFSTR("TUCallCapabilitiesCloudCallingDevicesChangedNotification"), 0);

  }
  if ((TUStringsAreEqualOrNil((unint64_t)v83, (uint64_t)v82) & 1) == 0)
  {
    TUDefaultLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v99 = v83;
      *(_WORD *)&v99[8] = 2112;
      v100 = v82;
      _os_log_impl(&dword_19A50D000, v37, OS_LOG_TYPE_DEFAULT, "Outgoing relay caller ID changed from %@ to %@", buf, 0x16u);
    }

    objc_msgSend(v85, "client");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "performDelegateCallbackBlock:", &__block_literal_global_75);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "postNotificationName:object:", CFSTR("TUCallCapabilitiesOutgoingRelayCallerIDChangedNotification"), 0);

  }
  if (v7 != v68)
  {
    TUDefaultLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v7;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v68;
      _os_log_impl(&dword_19A50D000, v40, OS_LOG_TYPE_DEFAULT, "Emergency Callback Mode changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "performDelegateCallbackBlock:", &__block_literal_global_79);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "postNotificationName:object:", CFSTR("TUCallCapabilitiesEmergencyCallbackModeChangedNotification"), 0);

  }
  v80 = (void *)v11;
  if (v69 != v12)
  {
    TUDefaultLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v69;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v12;
      _os_log_impl(&dword_19A50D000, v43, OS_LOG_TYPE_DEFAULT, "Emergency Callback Possible changed from %d to %d", buf, 0xEu);
    }

    objc_msgSend(v85, "client");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "performDelegateCallbackBlock:", &__block_literal_global_83);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "postNotificationName:object:", CFSTR("TUCallCapabilitiesEmergencyCallbackPossibleChangedNotification"), 0);

  }
  v46 = (void *)objc_msgSend(v84, "mutableCopy");
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v47 = v70;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v93 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v47, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          objc_msgSend(v46, "setObject:forKeyedSubscript:", 0, v52);
          objc_msgSend(v54, "_sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities:", v53);
        }
        else
        {
          objc_msgSend(v85, "client");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_2;
          v91[3] = &unk_1E38A17B8;
          v91[4] = v52;
          objc_msgSend(v55, "performDelegateCallbackBlock:", v91);

          v16 = v84;
        }

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    }
    while (v49);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v56 = v46;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v88 != v59)
          objc_enumerationMutation(v56);
        v61 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v85, "client");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_3;
        v86[3] = &unk_1E38A17B8;
        v86[4] = v61;
        objc_msgSend(v62, "performDelegateCallbackBlock:", v86);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    }
    while (v58);
  }

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeTelephonyCallingSupport");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_46(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeFaceTimeAudioCallingSupport");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_50(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeFaceTimeVideoCallingSupport");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_54(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeFaceTimeCallingAvailability");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_58(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeRelayCallingCapabilities");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_62(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeRelayCallingAvailability");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_66(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeRelayCallingFeatures");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_70(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeCloudCallingDevices");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_74(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeOutgoingRelayCallerID");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_78(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeEmergencyCallbackMode");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_82(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeEmergencyCallbackPossible");

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveCapabilitiesForSenderIdentityWithUUID:", *(_QWORD *)(a1 + 32));

}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didAddCapabilitiesForSenderIdentityWithUUID:", *(_QWORD *)(a1 + 32));

}

+ (id)debugDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("== TUCallCapabilities ==\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("General Support:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsTelephonyCalls: %d\n"), objc_msgSend(a1, "supportsTelephonyCalls"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeAudioCalls: %d\n"), objc_msgSend(a1, "supportsFaceTimeAudioCalls"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeVideoCalls: %d\n"), objc_msgSend(a1, "supportsFaceTimeVideoCalls"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    canAttemptTelephonyCallsWithoutCellularConnection: %d\n"), objc_msgSend(a1, "canAttemptTelephonyCallsWithoutCellularConnection"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    canAttemptEmergencyCallsWithoutCellularConnection: %d\n"), objc_msgSend(a1, "canAttemptEmergencyCallsWithoutCellularConnection"));
  objc_msgSend(v3, "appendString:", CFSTR("Primary/Secondary Device:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsPrimaryCalling: %d\n"), objc_msgSend(a1, "supportsPrimaryCalling"));
  objc_msgSend(v3, "appendString:", CFSTR("Call support:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    telephonyCallSupport: %d\n"), objc_msgSend(a1, "telephonyCallSupport"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    faceTimeAudioCallSupport: %d\n"), objc_msgSend(a1, "faceTimeAudioCallSupport"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    faceTimeVideoCallSupport: %d\n"), objc_msgSend(a1, "faceTimeVideoCallSupport"));
  objc_msgSend(v3, "appendString:", CFSTR("Displaying support:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingTelephonyCalls: %d\n"), objc_msgSend(a1, "supportsDisplayingTelephonyCalls"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingFaceTimeAudioCalls: %d\n"), objc_msgSend(a1, "supportsDisplayingFaceTimeAudioCalls"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingFaceTimeVideoCalls: %d\n"), objc_msgSend(a1, "supportsDisplayingFaceTimeVideoCalls"));
  objc_msgSend(v3, "appendString:", CFSTR("Call Availability:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isDirectTelephonyCallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isDirectTelephonyCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isDirectFaceTimeAudioCallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isDirectFaceTimeAudioCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isDirectFaceTimeVideoCallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isDirectFaceTimeVideoCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("System capabilities:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsSimultaneousVoiceAndData: %d\n"), objc_msgSend(a1, "supportsSimultaneousVoiceAndData"));
  objc_msgSend(v3, "appendString:", CFSTR("Wi-Fi calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsWiFiCalling: %d\n"), objc_msgSend(a1, "supportsWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isWiFiCallingEnabled: %d\n"), objc_msgSend(a1, "isWiFiCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isWiFiCallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isWiFiCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("VoLTE calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsVoLTECalling: %d\n"), objc_msgSend(a1, "supportsVoLTECalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isVoLTECallingEnabled: %d\n"), objc_msgSend(a1, "isVoLTECallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isVoLTECallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isVoLTECallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("Secondary calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    accountsMatchForSecondaryCalling: %d\n"), objc_msgSend(a1, "accountsMatchForSecondaryCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    accountsSupportSecondaryCalling: %d\n"), objc_msgSend(a1, "accountsSupportSecondaryCalling"));
  objc_msgSend(v3, "appendString:", CFSTR("Thumper calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsThumperCalling: %d\n"), objc_msgSend(a1, "supportsThumperCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingAllowedForCurrentDevice: %d\n"), objc_msgSend(a1, "isThumperCallingAllowedForCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingEnabled: %d\n"), objc_msgSend(a1, "isThumperCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsThumperCallingOverCellularData: %d\n"), objc_msgSend(a1, "supportsThumperCallingOverCellularData"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isThumperCallingCurrentlyAvailable: %d\n"), objc_msgSend(a1, "isThumperCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR("Relay calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsRelayingToOtherDevices: %d\n"), objc_msgSend(a1, "supportsRelayingToOtherDevices"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsRelayCalling: %d\n"), objc_msgSend(a1, "supportsRelayCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isRelayCallingEnabled: %d\n"), objc_msgSend(a1, "isRelayCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isRelayCallingGuaranteed: %d\n"), objc_msgSend(a1, "relayCallingAvailability") == 2);
  objc_msgSend(v3, "appendFormat:", CFSTR("    areRelayCallingFeaturesEnabled: %d\n"), objc_msgSend(a1, "areRelayCallingFeaturesEnabled"));
  objc_msgSend(v3, "appendString:", CFSTR("Outgoing relay calling:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsTelephonyRelayCalling: %d\n"), objc_msgSend(a1, "supportsTelephonyRelayCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeAudioRelayCalling: %d\n"), objc_msgSend(a1, "supportsFaceTimeAudioRelayCalling"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeVideoRelayCalling: %d\n"), objc_msgSend(a1, "supportsFaceTimeVideoRelayCalling"));
  objc_msgSend(a1, "outgoingRelayCallerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    outgoingRelayCallerID: %@\n"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("Emergency callback mode:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isEmergencyCallbackModeEnabled: %d\n"), objc_msgSend(a1, "isEmergencyCallbackModeEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    isEmergencyCallbackPossible: %d\n"), objc_msgSend(a1, "isEmergencyCallbackPossible"));
  return v3;
}

@end
