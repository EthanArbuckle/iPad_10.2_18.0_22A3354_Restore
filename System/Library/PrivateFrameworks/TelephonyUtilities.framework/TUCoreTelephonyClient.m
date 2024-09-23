@implementation TUCoreTelephonyClient

+ (Class)RTTSettingsClass
{
  if (RTTSettingsClass_onceToken != -1)
    dispatch_once(&RTTSettingsClass_onceToken, &__block_literal_global_25);
  return (Class)(id)RTTSettingsClass_sRTTSettingsClass;
}

void __46__TUCoreTelephonyClient_TTY__RTTSettingsClass__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  RTTSettingsClass_sRTTSettingsClass = CUTWeakLinkClass();
  if (!RTTSettingsClass_sRTTSettingsClass)
  {
    TUDefaultLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTSettings; RTTUtilities.framework may have failed to link.",
        v1,
        2u);
    }

  }
}

+ (Class)RTTTelephonyUtilitiesClass
{
  if (RTTTelephonyUtilitiesClass_onceToken != -1)
    dispatch_once(&RTTTelephonyUtilitiesClass_onceToken, &__block_literal_global_4_1);
  return (Class)(id)RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass;
}

void __56__TUCoreTelephonyClient_TTY__RTTTelephonyUtilitiesClass__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass = CUTWeakLinkClass();
  if (!RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass)
  {
    TUDefaultLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTTelephonyUtilities; RTTUtilities.framework may have failed to link.",
        v1,
        2u);
    }

  }
}

+ (id)sharedRTTTelephonyUtilities
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TUCoreTelephonyClient_TTY__sharedRTTTelephonyUtilities__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRTTTelephonyUtilities_onceToken != -1)
    dispatch_once(&sharedRTTTelephonyUtilities_onceToken, block);
  return (id)sharedRTTTelephonyUtilities_sRTTTelephonyUtilities;
}

void __57__TUCoreTelephonyClient_TTY__sharedRTTTelephonyUtilities__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "RTTTelephonyUtilitiesClass"), "sharedUtilityProvider");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedRTTTelephonyUtilities_sRTTTelephonyUtilities;
  sharedRTTTelephonyUtilities_sRTTTelephonyUtilities = v1;

}

- (BOOL)isRTTSupportedForSubscription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "RTTTelephonyUtilitiesClass");
  if (v3)
    v5 = objc_msgSend(v4, "isRTTSupportedForContext:", v3);
  else
    v5 = objc_msgSend(v4, "isRTTSupported");
  v6 = v5;

  return v6;
}

- (BOOL)isRTTSupportedForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isRTTSupportedForSubscription:](v3, "isRTTSupportedForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYEnabledForSubscription:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[TUCoreTelephonyClient isTTYSoftwareEnabledForSubscription:](self, "isTTYSoftwareEnabledForSubscription:", v4)
    || -[TUCoreTelephonyClient isTTYHardwareEnabledForSubscription:](self, "isTTYHardwareEnabledForSubscription:", v4);

  return v5;
}

- (BOOL)isTTYEnabledForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYEnabledForSubscription:](v3, "isTTYEnabledForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYSupportedForSubscription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "RTTTelephonyUtilitiesClass");
  if (v3)
    v5 = objc_msgSend(v4, "isTTYSupportedForContext:", v3);
  else
    v5 = objc_msgSend(v4, "isTTYSupported");
  v6 = v5;

  return v6;
}

- (BOOL)isTTYSupportedForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYSupportedForSubscription:](v3, "isTTYSupportedForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYHardwareAvailableForSubscription:(id)a3
{
  return -[TUCoreTelephonyClient preferredTransportMethodForSubscription:](self, "preferredTransportMethodForSubscription:", a3) == 1;
}

- (BOOL)isTTYHardwareAvailableForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYHardwareAvailableForSubscription:](v3, "isTTYHardwareAvailableForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYHardwareEnabledForSubscription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "RTTSettingsClass"), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "TTYHardwareEnabledForContext:", v3);
  else
    v6 = objc_msgSend(v4, "TTYHardwareEnabled");
  v7 = v6;

  return v7;
}

- (BOOL)isTTYHardwareEnabledForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYHardwareEnabledForSubscription:](v3, "isTTYHardwareEnabledForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYHardwareSupportedForSubscription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "RTTTelephonyUtilitiesClass");
  if (v3)
    v5 = objc_msgSend(v4, "hardwareTTYIsSupportedForContext:", v3);
  else
    v5 = objc_msgSend(v4, "hardwareTTYIsSupported");
  v6 = v5;

  return v6;
}

- (BOOL)isTTYHardwareSupportedForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYHardwareSupportedForSubscription:](v3, "isTTYHardwareSupportedForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYSoftwareAvailableForSubscription:(id)a3
{
  return -[TUCoreTelephonyClient preferredTransportMethodForSubscription:](self, "preferredTransportMethodForSubscription:", a3) == 2;
}

- (BOOL)isTTYSoftwareAvailableForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYSoftwareAvailableForSubscription:](v3, "isTTYSoftwareAvailableForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYSoftwareEnabledForSubscription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "RTTSettingsClass"), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "TTYSoftwareEnabledForContext:", v3);
  else
    v6 = objc_msgSend(v4, "TTYSoftwareEnabled");
  v7 = v6;

  return v7;
}

- (BOOL)isTTYSoftwareEnabledForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYSoftwareEnabledForSubscription:](v3, "isTTYSoftwareEnabledForSubscription:", v4);

  return (char)v3;
}

- (BOOL)isTTYSoftwareSupportedForSubscription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "RTTTelephonyUtilitiesClass");
  if (v3)
    v5 = objc_msgSend(v4, "softwareTTYIsSupportedForContext:", v3);
  else
    v5 = objc_msgSend(v4, "softwareTTYIsSupported");
  v6 = v5;

  return v6;
}

- (BOOL)isTTYSoftwareSupportedForSubscriptionUUID:(id)a3
{
  TUCoreTelephonyClient *v3;
  void *v4;

  v3 = self;
  -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TUCoreTelephonyClient isTTYSoftwareSupportedForSubscription:](v3, "isTTYSoftwareSupportedForSubscription:", v4);

  return (char)v3;
}

- (unint64_t)preferredTransportMethodForSubscription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedRTTTelephonyUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "currentPreferredTransportMethodForContext:", v3);
  else
    v6 = objc_msgSend(v4, "currentPreferredTransportMethod");
  v7 = v6;

  return v7;
}

- (TUCoreTelephonyClient)init
{
  -[TUCoreTelephonyClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TUCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5;
  TUCoreTelephonyClient *v6;
  TUCoreTelephonyClient *v7;
  uint64_t v8;
  CoreTelephonyClient *client;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCoreTelephonyClient;
  v6 = -[TUCoreTelephonyClient init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v5);
    client = v7->_client;
    v7->_client = (CoreTelephonyClient *)v8;

  }
  return v7;
}

- (id)subscriptionForLabelIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCoreTelephonyClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "getActiveContexts:", &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  objc_msgSend(v6, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "labelID", (_QWORD)v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v4);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v14, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_19;
    }
    else
    {
LABEL_10:

    }
    TUDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:].cold.2((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_17;
  }
  if (v7)
  {
    TUDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:].cold.1(self);
LABEL_17:

  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)subscriptionForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCoreTelephonyClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "getActiveContexts:", &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  objc_msgSend(v6, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "uuid", (_QWORD)v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v4);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v14, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_19;
    }
    else
    {
LABEL_10:

    }
    TUDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TUCoreTelephonyClient subscriptionForUUID:].cold.2((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_17;
  }
  if (v7)
  {
    TUDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:].cold.1(self);
LABEL_17:

  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isDialAssistSupportedForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[TUCoreTelephonyClient objectForKey:subscriptionLabelIdentifier:error:](self, "objectForKey:subscriptionLabelIdentifier:error:", CFSTR("ShowDialAssist"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)testEmergencyHandleForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[TUCoreTelephonyClient objectForKey:subscriptionLabelIdentifier:error:](self, "objectForKey:subscriptionLabelIdentifier:error:", CFSTR("TestEmergencyNumber"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)objectForKey:(id)a3 subscriptionLabelIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  -[TUCoreTelephonyClient subscriptionForLabelIdentifier:](self, "subscriptionForLabelIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
    -[TUCoreTelephonyClient client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValue:key:bundleType:error:", v9, v8, v10, a5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)inEmergencyMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TUCoreTelephonyClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyEmergencyModeWithError:", 0);

  if (v3)
  {
    objc_msgSend(v3, "mode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "mode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v5, "enabled");

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;

  v8 = a3;
  if (a4)
  {
    -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[TUCoreTelephonyClient isEmergencyNumberForDigits:subscription:error:](self, "isEmergencyNumberForDigits:subscription:error:", v8, a4, a5);

  return v9;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  -[TUCoreTelephonyClient client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TUCoreTelephonyClient client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEmergencyNumberWithWhitelistIncluded:number:error:", v9, v8, a5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;

  v8 = a3;
  if (a4)
  {
    -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[TUCoreTelephonyClient isWhitelistedEmergencyNumberForDigits:subscription:error:](self, "isWhitelistedEmergencyNumberForDigits:subscription:error:", v8, a4, a5);

  return v9;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  -[TUCoreTelephonyClient client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TUCoreTelephonyClient client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEmergencyNumberWithWhitelistIncluded:number:error:", v9, v8, a5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscriptionUUID:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  if (a3)
  {
    -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[TUCoreTelephonyClient shouldShowEmergencyCallbackModeAlertForSubscription:error:](self, "shouldShowEmergencyCallbackModeAlertForSubscription:error:", v6, a4);

  return v7;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TUCoreTelephonyClient client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "shouldShowUserWarningWhenDialingCallOnContext:error:", v6, a4);

  return (char)a4;
}

- (void)subscriptionForLabelIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "client");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_5(&dword_19A50D000, v2, v3, "Retrieving active contexts from client %@ failed with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

- (void)subscriptionForLabelIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Could not find subscription context for the specified label identifier: %@", a5, a6, a7, a8, 2u);
}

- (void)subscriptionForUUID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Could not find subscription context for the specified UUID: %@", a5, a6, a7, a8, 2u);
}

@end
