@implementation AWDLTrafficRegistrationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AWDLTrafficRegistrationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  AWDLTrafficRegistrationConfiguration *v8;
  AWDLTrafficRegistrationConfiguration *v9;
  AWDLTrafficRegistrationConfiguration *v10;
  uint64_t v11;
  NSString *derivedLocalization;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLTrafficRegistrationConfiguration.uniqueIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLTrafficRegistrationConfiguration.peerAddressKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = -[AWDLTrafficRegistrationConfiguration initWithUniqueIdentifier:peerAddress:](self, "initWithUniqueIdentifier:peerAddress:", v5, v6);
    v10 = v9;
    if (v9)
    {
      v9->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AWDLTrafficRegistrationConfiguration.optionsKey"));
      v10->_preferredChannel = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AWDLTrafficRegistrationConfiguration.preferredChannelKey"));
      v10->_secondaryPreferredChannel = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AWDLTrafficRegistrationConfiguration.secondaryPreferredChannelKey"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AWDLTrafficRegistrationConfiguration.localization"));
      v11 = objc_claimAutoreleasedReturnValue();
      derivedLocalization = v10->_derivedLocalization;
      v10->_derivedLocalization = (NSString *)v11;

      if (objc_msgSend(v5, "isEqualToString:", CFSTR("airplay")))
        v10->_legacyUpgradeRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AWDLTrafficRegistrationConfiguration.legacyUpgradeRequired"));
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("AWDLTrafficRegistrationConfiguration.uniqueIdentifierKey"));

  -[AWDLTrafficRegistrationConfiguration peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("AWDLTrafficRegistrationConfiguration.peerAddressKey"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[AWDLTrafficRegistrationConfiguration options](self, "options"), CFSTR("AWDLTrafficRegistrationConfiguration.optionsKey"));
  +[WiFiP2PXPCConnection localization](WiFiP2PXPCConnection, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("AWDLTrafficRegistrationConfiguration.localization"));

  objc_msgSend(v9, "encodeInt32:forKey:", -[AWDLTrafficRegistrationConfiguration preferredChannel](self, "preferredChannel"), CFSTR("AWDLTrafficRegistrationConfiguration.preferredChannelKey"));
  objc_msgSend(v9, "encodeInt32:forKey:", -[AWDLTrafficRegistrationConfiguration secondaryPreferredChannel](self, "secondaryPreferredChannel"), CFSTR("AWDLTrafficRegistrationConfiguration.secondaryPreferredChannelKey"));
  -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("airplay"));

  if (v8)
    objc_msgSend(v9, "encodeBool:forKey:", -[AWDLTrafficRegistrationConfiguration legacyUpgradeRequired](self, "legacyUpgradeRequired"), CFSTR("AWDLTrafficRegistrationConfiguration.legacyUpgradeRequired"));

}

- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerAddress:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AWDLTrafficRegistrationConfiguration;
  v8 = -[AWDLTrafficRegistrationConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v11;

    *((_QWORD *)v8 + 5) = 0;
    *(_DWORD *)(v8 + 18) = 0;
    v13 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = 0;

    v8[17] = 0;
    v8[16] = objc_msgSend(v6, "isEqualToString:", CFSTR("airplay"));
  }

  return (AWDLTrafficRegistrationConfiguration *)v8;
}

- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerIPv6Address:(in6_addr)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  WiFiMACAddress *v8;
  AWDLTrafficRegistrationConfiguration *v9;

  v4 = *(_QWORD *)&a4.__u6_addr32[2];
  v5 = *(_QWORD *)a4.__u6_addr8;
  v7 = a3;
  v8 = -[WiFiMACAddress initWithLinkLocalIPv6Address:]([WiFiMACAddress alloc], "initWithLinkLocalIPv6Address:", v5, v4);
  if (v8)
  {
    self = -[AWDLTrafficRegistrationConfiguration initWithUniqueIdentifier:peerAddress:](self, "initWithUniqueIdentifier:peerAddress:", v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AWDLTrafficRegistrationConfiguration *v4;
  AWDLTrafficRegistrationConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = (AWDLTrafficRegistrationConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      v5 = 0;
      goto LABEL_11;
    }
    v5 = v4;
    -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
    {

LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    -[AWDLTrafficRegistrationConfiguration peerAddress](self, "peerAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDLTrafficRegistrationConfiguration peerAddress](v5, "peerAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_10;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AWDLTrafficRegistrationConfiguration peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)hasSimilarOptionsTo:(id)a3
{
  id v4;
  int64_t v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  v5 = -[AWDLTrafficRegistrationConfiguration options](self, "options");
  if (v5 == objc_msgSend(v4, "options")
    && (v6 = -[AWDLTrafficRegistrationConfiguration preferredChannel](self, "preferredChannel"),
        v6 == objc_msgSend(v4, "preferredChannel")))
  {
    v7 = -[AWDLTrafficRegistrationConfiguration secondaryPreferredChannel](self, "secondaryPreferredChannel");
    v8 = v7 == objc_msgSend(v4, "secondaryPreferredChannel");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)localization
{
  NSString *derivedLocalization;

  derivedLocalization = self->_derivedLocalization;
  if (derivedLocalization)
    return derivedLocalization;
  +[WiFiP2PXPCConnection localization](WiFiP2PXPCConnection, "localization");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  AWDLTrafficRegistrationConfiguration *v4;
  void *v5;
  void *v6;
  AWDLTrafficRegistrationConfiguration *v7;
  void *v8;

  v4 = [AWDLTrafficRegistrationConfiguration alloc];
  -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDLTrafficRegistrationConfiguration peerAddress](self, "peerAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AWDLTrafficRegistrationConfiguration initWithUniqueIdentifier:peerAddress:](v4, "initWithUniqueIdentifier:peerAddress:", v5, v6);

  -[AWDLTrafficRegistrationConfiguration setOptions:](v7, "setOptions:", -[AWDLTrafficRegistrationConfiguration options](self, "options"));
  -[AWDLTrafficRegistrationConfiguration setPreferredChannel:](v7, "setPreferredChannel:", -[AWDLTrafficRegistrationConfiguration preferredChannel](self, "preferredChannel"));
  -[AWDLTrafficRegistrationConfiguration setSecondaryPreferredChannel:](v7, "setSecondaryPreferredChannel:", -[AWDLTrafficRegistrationConfiguration secondaryPreferredChannel](self, "secondaryPreferredChannel"));
  -[AWDLTrafficRegistrationConfiguration setLegacyUpgradeRequired:](v7, "setLegacyUpgradeRequired:", -[AWDLTrafficRegistrationConfiguration legacyUpgradeRequired](self, "legacyUpgradeRequired"));
  -[AWDLTrafficRegistrationConfiguration invalidationHandler](self, "invalidationHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDLTrafficRegistrationConfiguration setInvalidationHandler:](v7, "setInvalidationHandler:", v8);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AWDLTrafficRegistrationConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDLTrafficRegistrationConfiguration peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AWDLTrafficRegistrationConfiguration %@ to %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AWDLTrafficRegistrationConfiguration)initWithDictionary:(__CFDictionary *)a3 isActive:(BOOL *)a4
{
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFTypeID v12;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  CFTypeID v15;
  const __CFData *v16;
  const __CFData *v17;
  CFTypeID v18;
  const UInt8 *BytePtr;
  unint64_t v20;
  const __CFData *v21;
  const __CFData *v22;
  CFTypeID v23;
  const UInt8 *v24;
  const void *v25;
  const void *v26;
  CFTypeID v27;
  WiFiMACAddress *v28;
  AWDLTrafficRegistrationConfiguration *v29;
  CFTypeID v30;
  char v31;
  const __CFNumber *v32;
  const __CFNumber *v33;
  CFTypeID v34;
  const __CFNumber *v35;
  const __CFNumber *v36;
  CFTypeID v37;
  AWDLTrafficRegistrationConfiguration *v38;
  unsigned __int16 v40;
  unsigned __int16 v41;
  int valuePtr;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("TR_ACTIVE"));
  if (!Value)
    goto LABEL_36;
  v8 = Value;
  v9 = CFGetTypeID(Value);
  if (v9 != CFBooleanGetTypeID())
    goto LABEL_36;
  v10 = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("TR_PEER_CONTEXTS"));
  if (v10 && (v11 = v10, v12 = CFGetTypeID(v10), v12 == CFArrayGetTypeID()))
  {
    if (CFArrayGetCount(v11) >= 1
      && (ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, 0)) != 0
      && (v14 = ValueAtIndex, v15 = CFGetTypeID(ValueAtIndex), v15 == CFDictionaryGetTypeID())
      && (v16 = (const __CFData *)CFDictionaryGetValue(v14, CFSTR("TR_PEER_ADDRESS"))) != 0
      && (v17 = v16, v18 = CFGetTypeID(v16), v18 == CFDataGetTypeID())
      && CFDataGetLength(v17) == 6)
    {
      BytePtr = CFDataGetBytePtr(v17);
      v20 = *(unsigned int *)BytePtr | ((unint64_t)*((unsigned __int16 *)BytePtr + 2) << 32);
    }
    else
    {
      v20 = 0;
    }
    v25 = CFDictionaryGetValue(a3, CFSTR("TR_SESSION_FLAGS"));
  }
  else
  {
    v21 = (const __CFData *)CFDictionaryGetValue(a3, CFSTR("AWDL_TR_ADDR"));
    if (v21 && (v22 = v21, v23 = CFGetTypeID(v21), v23 == CFDataGetTypeID()) && CFDataGetLength(v22) == 6)
    {
      v24 = CFDataGetBytePtr(v22);
      v20 = *(unsigned int *)v24 | ((unint64_t)*((unsigned __int16 *)v24 + 2) << 32);
    }
    else
    {
      v20 = 0;
    }
    v25 = CFDictionaryGetValue(a3, CFSTR("AWDL_TR_RT_FLAGS"));
    v26 = CFDictionaryGetValue(a3, CFSTR("AWDL_TR_UID"));
    if (v26)
      goto LABEL_22;
  }
  v26 = CFDictionaryGetValue(a3, CFSTR("TR_SRV_NAME"));
  if (!v26)
  {
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
LABEL_22:
  v27 = CFGetTypeID(v26);
  if (v27 != CFStringGetTypeID())
    goto LABEL_36;
  v28 = -[WiFiMACAddress initWithAddress:]([WiFiMACAddress alloc], "initWithAddress:", v20 & 0xFFFFFFFFFFFFLL);
  v29 = -[AWDLTrafficRegistrationConfiguration initWithUniqueIdentifier:peerAddress:](self, "initWithUniqueIdentifier:peerAddress:", v26, v28);

  if (v25)
  {
    v30 = CFGetTypeID(v25);
    if (v30 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v25, kCFNumberSInt32Type, &valuePtr);
      v31 = valuePtr;
      if ((valuePtr & 2) != 0)
      {
        -[AWDLTrafficRegistrationConfiguration setOptions:](v29, "setOptions:", -[AWDLTrafficRegistrationConfiguration options](v29, "options") | 1);
        v31 = valuePtr;
      }
      if ((v31 & 8) != 0)
        -[AWDLTrafficRegistrationConfiguration setOptions:](v29, "setOptions:", -[AWDLTrafficRegistrationConfiguration options](v29, "options") | 2);
    }
  }
  v32 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("AWDL_TR_CHANNEL"));
  if (v32)
  {
    v33 = v32;
    v34 = CFGetTypeID(v32);
    if (v34 == CFNumberGetTypeID())
    {
      v41 = 0;
      CFNumberGetValue(v33, kCFNumberSInt16Type, &v41);
      -[AWDLTrafficRegistrationConfiguration setPreferredChannel:](v29, "setPreferredChannel:", v41);
    }
  }
  v35 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("AWDL_TR_SEC_CHANNEL"));
  if (v35)
  {
    v36 = v35;
    v37 = CFGetTypeID(v35);
    if (v37 == CFNumberGetTypeID())
    {
      v40 = 0;
      CFNumberGetValue(v36, kCFNumberSInt16Type, &v40);
      -[AWDLTrafficRegistrationConfiguration setSecondaryPreferredChannel:](v29, "setSecondaryPreferredChannel:", v40);
    }
  }
  *a4 = CFBooleanGetValue(v8) != 0;
  self = v29;
  v38 = self;
LABEL_37:

  return v38;
}

+ (id)localizedErrorForConflictBetweenExistingService:(id)a3 withNewService:(id)a4 localDeviceName:(id)a5 localization:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  __CFString *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  _QWORD v67[5];

  v67[4] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[WiFiP2PXPCConnection convertError:](WiFiP2PXPCConnection, "convertError:", 5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  canonicalService(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  canonicalService(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqual:", v13) & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(v13, "isEqual:", CFSTR("airplay")))
  {
    if (objc_msgSend(v13, "isEqual:", CFSTR("sidecar")))
    {
      if (v9)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("%@ is currently using Sidecar.");
        goto LABEL_16;
      }
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v21 = CFSTR("Unable to connect while the other device is running Sidecar.");
    }
    else if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteCamera")))
    {
      if (v9)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("%@ is currently using Continuity Camera.");
        goto LABEL_16;
      }
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v21 = CFSTR("Unable to connect while the other device is running Continuity Camera.");
    }
    else
    {
      if (!objc_msgSend(v13, "isEqual:", CFSTR("RemoteScreen")))
      {
LABEL_2:
        v15 = &stru_1E6E1F318;
        goto LABEL_22;
      }
      if (v9)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("%@ is currently using iPhone Mirroring.");
        goto LABEL_16;
      }
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v21 = CFSTR("Unable to connect while the other device is running iPhone Mirroring.");
    }
LABEL_20:
    objc_msgSend(v20, "localizedStringForKey:value:table:localization:", v21, 0, 0, v10);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v9)
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v21 = CFSTR("Unable to connect while the other device is running AirPlay.");
    goto LABEL_20;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = CFSTR("%@ is currently using AirPlay.");
LABEL_16:
  objc_msgSend(v17, "localizedStringForKey:value:table:localization:", v19, 0, 0, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
  v15 = (__CFString *)objc_msgSend(v16, "initWithFormat:locale:", v22, v23, v9);

LABEL_21:
LABEL_22:
  v65 = v9;
  v62 = v13;
  v63 = v14;
  if (objc_msgSend(v14, "isEqual:", CFSTR("airplay")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:localization:", CFSTR("Unable to Connect to AirPlay"), 0, 0, v10);
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqual:", CFSTR("airplay")))
    {
      if (v9)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:localization:", CFSTR("%@ unable to connect to AirPlay while active with another device."), 0, 0, v10);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
        v30 = objc_msgSend(v26, "initWithFormat:locale:", v28, v29, v9, v13, v63);

        v15 = (__CFString *)v28;
      }
      else
      {
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:localization:", CFSTR("Unable to connect while the other device is active in a different AirPlay session."), 0, 0, v10);
        v30 = objc_claimAutoreleasedReturnValue();
      }

      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v41;
      v42 = CFSTR("To connect AirPlay to another device, disconnect the previous one first.");
LABEL_73:
      v43 = v10;
      objc_msgSend(v41, "localizedStringForKey:value:table:localization:", v42, 0, 0, v10);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = (__CFString *)v30;
      goto LABEL_74;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("sidecar")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use AirPlay, disconnect Sidecar first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteCamera")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use AirPlay, disconnect Continuity Camera first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteScreen")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use AirPlay, disconnect iPhone Mirroring first.");
      goto LABEL_64;
    }
    goto LABEL_68;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("sidecar")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:localization:", CFSTR("Unable to Connect to Sidecar"), 0, 0, v10);
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqual:", CFSTR("airplay")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Sidecar, disconnect AirPlay first.");
LABEL_64:
      v43 = v10;
      objc_msgSend(v32, "localizedStringForKey:value:table:localization:", v34, 0, 0, v10);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_74:

      goto LABEL_75;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("sidecar")))
    {
      if (v9)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:localization:", CFSTR("%@ unable to connect to Sidecar while active with another device."), 0, 0, v10);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
        v30 = objc_msgSend(v36, "initWithFormat:locale:", v38, v39, v9, v13, v63);

        v15 = (__CFString *)v38;
      }
      else
      {
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:localization:", CFSTR("Unable to connect while the other device is active in a different Sidecar session."), 0, 0, v10);
        v30 = objc_claimAutoreleasedReturnValue();
      }

      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v41;
      v42 = CFSTR("To connect Sidecar to another device, disconnect the previous one first.");
      goto LABEL_73;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteCamera")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Sidecar, disconnect Continuity Camera first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteScreen")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Sidecar, disconnect iPhone Mirroring first.");
      goto LABEL_64;
    }
    goto LABEL_68;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("RemoteCamera")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:localization:", CFSTR("Unable to Connect to Continuity Camera"), 0, 0, v10);
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqual:", CFSTR("airplay")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Continuity Camera, disconnect AirPlay first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("sidecar")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Continuity Camera, disconnect Sidecar first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteCamera")))
    {
      if (v9)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:localization:", CFSTR("%@ unable to connect to Continuity Camera while active with another device."), 0, 0, v10);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
        v30 = objc_msgSend(v45, "initWithFormat:locale:", v47, v48, v9, v13, v63);

        v15 = (__CFString *)v47;
      }
      else
      {
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:localization:", CFSTR("Unable to connect while the other device is active in a different Continuity Camera session."), 0, 0, v10);
        v30 = objc_claimAutoreleasedReturnValue();
      }

      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v41;
      v42 = CFSTR("To connect Continuity Camera to another device, disconnect the previous one first.");
      goto LABEL_73;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteScreen")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use Continuity Camera, disconnect iPhone Mirroring first.");
      goto LABEL_64;
    }
    goto LABEL_68;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("RemoteScreen")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:localization:", CFSTR("Unable to Connect to iPhone Mirroring"), 0, 0, v10);
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqual:", CFSTR("airplay")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use iPhone Mirroring, disconnect AirPlay first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("sidecar")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use iPhone Mirroring, disconnect Sidecar first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteCamera")))
    {
      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("To use iPhone Mirroring, disconnect Continuity Camera first.");
      goto LABEL_64;
    }
    if (objc_msgSend(v13, "isEqual:", CFSTR("RemoteScreen")))
    {
      if (v9)
      {
        v49 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:localization:", CFSTR("%@ unable to connect to iPhone Mirroring while active with another device."), 0, 0, v10);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
        v30 = objc_msgSend(v49, "initWithFormat:locale:", v51, v52, v9, v13, v63);

        v15 = (__CFString *)v51;
      }
      else
      {
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:localization:", CFSTR("Unable to connect while the other device is active in a different iPhone Mirroring session."), 0, 0, v10);
        v30 = objc_claimAutoreleasedReturnValue();
      }

      +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v41;
      v42 = CFSTR("To connect iPhone Mirroring to another device, disconnect the previous one first.");
      goto LABEL_73;
    }
LABEL_68:
    v43 = v10;
    v44 = &stru_1E6E1F318;
    goto LABEL_75;
  }
  v43 = v10;
  v25 = &stru_1E6E1F318;
  v44 = &stru_1E6E1F318;
LABEL_75:
  v53 = (void *)MEMORY[0x1E0CB35C8];
  v54 = *MEMORY[0x1E0CB2D68];
  v66[0] = *MEMORY[0x1E0CB2D50];
  v66[1] = v54;
  v67[0] = v25;
  v67[1] = v15;
  v55 = *MEMORY[0x1E0CB2D80];
  v67[2] = v44;
  v56 = *MEMORY[0x1E0CB2938];
  v66[2] = v55;
  v66[3] = v56;
  objc_msgSend(v64, "description");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v57;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
  v58 = (__CFString *)v25;
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifip2pd"), 5, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WiFiMACAddress)peerAddress
{
  return self->_peerAddress;
}

- (void)setPeerAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (BOOL)legacyUpgradeRequired
{
  return self->_legacyUpgradeRequired;
}

- (void)setLegacyUpgradeRequired:(BOOL)a3
{
  self->_legacyUpgradeRequired = a3;
}

- (unsigned)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(unsigned __int16)a3
{
  self->_preferredChannel = a3;
}

- (unsigned)secondaryPreferredChannel
{
  return self->_secondaryPreferredChannel;
}

- (void)setSecondaryPreferredChannel:(unsigned __int16)a3
{
  self->_secondaryPreferredChannel = a3;
}

- (BOOL)activeFlagOverride
{
  return self->_activeFlagOverride;
}

- (void)setActiveFlagOverride:(BOOL)a3
{
  self->_activeFlagOverride = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedLocalization, 0);
}

@end
