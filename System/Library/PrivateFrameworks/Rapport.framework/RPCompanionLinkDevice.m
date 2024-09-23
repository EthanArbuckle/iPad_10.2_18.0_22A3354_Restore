@implementation RPCompanionLinkDevice

- (id)description
{
  return -[RPCompanionLinkDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned __int8)a3
{
  self->_deviceFlags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *activeUserAltDSID;
  uint64_t deviceCapabilityFlags;
  NSString *deviceColor;
  uint64_t flags;
  NSUUID *homeKitIdentifier;
  NSString *idsCorrelationIdentifier;
  NSString *idsPersonalDeviceIdentifier;
  uint64_t listeningPort;
  uint64_t mediaAccessControlSetting;
  NSUUID *mediaSystemIdentifier;
  NSString *mediaSystemName;
  uint64_t mediaSystemRole;
  uint64_t mediaSystemState;
  uint64_t personalDeviceState;
  uint64_t personalRequestsState;
  NSString *publicIdentifier;
  NSString *role;
  NSString *roomName;
  NSDictionary *siriInfo;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RPCompanionLinkDevice;
  -[RPEndpoint encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  activeUserAltDSID = self->_activeUserAltDSID;
  if (activeUserAltDSID)
    objc_msgSend(v4, "encodeObject:forKey:", activeUserAltDSID, CFSTR("altDSID"));
  deviceCapabilityFlags = self->_deviceCapabilityFlags;
  if ((_DWORD)deviceCapabilityFlags)
    objc_msgSend(v4, "encodeInt64:forKey:", deviceCapabilityFlags, CFSTR("dCapF"));
  deviceColor = self->_deviceColor;
  if (deviceColor)
    objc_msgSend(v4, "encodeObject:forKey:", deviceColor, CFSTR("dCl"));
  if (self->_deviceFlags)
    objc_msgSend(v4, "encodeInteger:forKey:");
  flags = self->_flags;
  if ((_DWORD)flags)
    objc_msgSend(v4, "encodeInt64:forKey:", flags, CFSTR("flags"));
  homeKitIdentifier = self->_homeKitIdentifier;
  if (homeKitIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", homeKitIdentifier, CFSTR("hkID"));
  idsCorrelationIdentifier = self->super._idsCorrelationIdentifier;
  if (idsCorrelationIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", idsCorrelationIdentifier, CFSTR("idsCID"));
  idsPersonalDeviceIdentifier = self->_idsPersonalDeviceIdentifier;
  if (idsPersonalDeviceIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", idsPersonalDeviceIdentifier, CFSTR("idsP"));
  listeningPort = self->_listeningPort;
  if ((_DWORD)listeningPort)
    objc_msgSend(v4, "encodeInteger:forKey:", listeningPort, CFSTR("lP"));
  mediaAccessControlSetting = self->_mediaAccessControlSetting;
  if ((_DWORD)mediaAccessControlSetting)
    objc_msgSend(v4, "encodeInteger:forKey:", mediaAccessControlSetting, CFSTR("MAc"));
  mediaSystemIdentifier = self->_mediaSystemIdentifier;
  if (mediaSystemIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", mediaSystemIdentifier, CFSTR("MSi"));
  mediaSystemName = self->_mediaSystemName;
  if (mediaSystemName)
    objc_msgSend(v4, "encodeObject:forKey:", mediaSystemName, CFSTR("MSn"));
  mediaSystemRole = self->_mediaSystemRole;
  if ((_DWORD)mediaSystemRole)
    objc_msgSend(v4, "encodeInteger:forKey:", mediaSystemRole, CFSTR("MSr"));
  mediaSystemState = self->_mediaSystemState;
  if ((_DWORD)mediaSystemState)
    objc_msgSend(v4, "encodeInteger:forKey:", mediaSystemState, CFSTR("MSs"));
  if (self->_personal)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("pers"));
  personalDeviceState = self->_personalDeviceState;
  if ((_DWORD)personalDeviceState)
    objc_msgSend(v4, "encodeInteger:forKey:", personalDeviceState, CFSTR("pds"));
  personalRequestsState = self->_personalRequestsState;
  if ((_DWORD)personalRequestsState)
    objc_msgSend(v4, "encodeInteger:forKey:", personalRequestsState, CFSTR("prs"));
  publicIdentifier = self->_publicIdentifier;
  if (publicIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", publicIdentifier, CFSTR("pubID"));
  role = self->_role;
  if (role)
    objc_msgSend(v4, "encodeObject:forKey:", role, CFSTR("role"));
  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v4, "encodeObject:forKey:", roomName, CFSTR("rn"));
  siriInfo = self->_siriInfo;
  if (siriInfo)
    objc_msgSend(v4, "encodeObject:forKey:", siriInfo, CFSTR("siriInfo"));
  if (self->_standaloneWatch)
    objc_msgSend(v4, "encodeInteger:forKey:");

}

- (unsigned)updateWithSFDevice:(id)a3
{
  unsigned int v4;
  unsigned int flags;
  NSString *v6;
  unsigned int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RPCompanionLinkDevice;
  v4 = -[RPEndpoint updateWithSFDevice:](&v9, sel_updateWithSFDevice_, a3);
  flags = self->_flags;
  v6 = self->super._model;
  if (-[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("AudioAccessory1,"))
    || -[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("AudioAccessory5,"))
    || -[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("AudioAccessory6,"))
    || -[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("HomePod")))
  {

    v7 = flags | 2;
  }
  else
  {

    v7 = flags;
  }
  if ((self->super._statusFlags & 0x10000) != 0)
    v7 |= 0x1D00u;
  if (v7 != flags)
  {
    self->_flags = v7;
    v4 |= 2u;
  }
  return v4;
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v5;
  _BOOL4 v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  id v15;
  NSString *v16;
  id v17;
  id v18;
  NSString *v19;
  id v20;
  NSString *v21;
  id v22;
  NSString *v23;
  id v24;
  NSString *v25;
  id v26;
  NSUUID *v27;
  id v28;
  id v29;
  NSString *v30;
  id v31;
  NSString *v32;
  id v33;
  NSString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSUUID *v43;
  NSUUID *v44;
  id v45;
  id v46;
  NSString *v47;
  id v48;
  NSString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  NSDictionary *v56;
  NSDictionary *v57;
  id v58;
  void *v59;
  NSArray *v60;
  id v61;
  NSString *v62;
  id v63;
  int standaloneWatch;
  id v65;
  id v66;
  void *v68;
  void *v69;
  NSUUID *mediaSystemIdentifier;
  uint64_t v71;
  objc_super v72;
  uint64_t v73[3];
  id v74;
  uint64_t v75;
  objc_super v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  objc_super v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  _BYTE v93[16];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (a3 <= 49)
    v5 = 100;
  else
    v5 = 8;
  v6 = shouldPrintSensitiveData();
  if (v6)
    v7 = v5;
  else
    v7 = 8;
  v71 = v7;
  v8 = self->super._identifier;
  v9 = self->super._idsDeviceIdentifier;
  if (-[NSString isEqual:](v9, "isEqual:", v8))
  {

    v8 = 0;
  }
  v10 = self->_publicIdentifier;
  if (-[NSString isEqual:](v10, "isEqual:", v8))
  {

    v8 = 0;
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    v11 = 0;
    if (!v9)
      goto LABEL_16;
    goto LABEL_15;
  }
  v92 = 0;
  formatSensitiveData((uint64_t)"%sID ", v6);
  objc_msgSend(0, "length");
  NSAppendPrintF();
  v11 = 0;
  if (v9)
  {
LABEL_15:
    v91 = v11;
    formatSensitiveData((uint64_t)"%sIDS ", v6);
    objc_msgSend(v11, "length");
    NSAppendPrintF();
    v12 = v11;

    v11 = v12;
  }
LABEL_16:
  if (v10)
  {
    v90 = v11;
    formatSensitiveData((uint64_t)"%sPI ", v6);
    objc_msgSend(v11, "length");
    NSAppendPrintF();
    v13 = v11;

    v11 = v13;
  }
  v14 = self->super._name;
  if (v14)
  {
    v89 = v11;
    formatSensitiveData((uint64_t)", Nm ", v6);
    NSAppendPrintF();
    v15 = v11;

    v11 = v15;
  }

  v16 = self->super._model;
  if (v16)
  {
    v88 = v11;
    formatSensitiveData((uint64_t)", Md ", v6);
    NSAppendPrintF();
    v17 = v11;

    v11 = v17;
  }

  v87.receiver = self;
  v87.super_class = (Class)RPCompanionLinkDevice;
  if (-[RPEndpoint activityLevel](&v87, sel_activityLevel))
  {
    v86 = v11;
    NSAppendPrintF();
    v18 = v11;

    v11 = v18;
  }
  if (a3 <= 20)
  {
    v19 = self->super._accountID;
    if (v19)
    {
      v85 = v11;
      formatSensitiveData((uint64_t)", AID ", v6);
      NSAppendPrintF();
      v20 = v11;

      v11 = v20;
    }

    v21 = self->super._idsCorrelationIdentifier;
    if (v21)
    {
      v84 = v11;
      formatSensitiveData((uint64_t)", CID ", v6);
      NSAppendPrintF();
      v22 = v11;

      v11 = v22;
    }

    v23 = self->_deviceColor;
    if (v23)
    {
      v83 = v11;
      formatSensitiveData((uint64_t)", Cl ", v6);
      NSAppendPrintF();
      v24 = v11;

      v11 = v24;
    }

    v25 = self->_roomName;
    if (v25)
    {
      v82 = v11;
      formatSensitiveData((uint64_t)", Rm ", v6);
      NSAppendPrintF();
      v26 = v11;

      v11 = v26;
    }

    v27 = self->_homeKitIdentifier;
    if (v27)
    {
      v81 = v11;
      formatSensitiveData((uint64_t)", HKI ", v6);
      NSAppendPrintF();
      v28 = v11;

      v11 = v28;
    }

    if (self->super._hotspotInfo)
    {
      v80 = v11;
      NSAppendPrintF();
      v29 = v11;

      v11 = v29;
    }
    v30 = self->_idsPersonalDeviceIdentifier;
    if (v30)
    {
      v79 = v11;
      formatSensitiveData((uint64_t)", IDP ", v6);
      NSAppendPrintF();
      v31 = v11;

      v11 = v31;
    }

  }
  v32 = self->_activeUserAltDSID;
  if (v32)
  {
    v78 = v11;
    formatSensitiveData((uint64_t)", ADSID ", v6);
    NSAppendPrintF();
    v33 = v11;

    v11 = v33;
  }

  v34 = self->super._sourceVersion;
  if (v34)
  {
    v77 = v11;
    formatSensitiveData((uint64_t)", SV ", v6);
    NSAppendPrintF();
    v35 = v11;

    v11 = v35;
  }

  v76.receiver = self;
  v76.super_class = (Class)RPCompanionLinkDevice;
  -[RPEndpoint operatingSystemVersion](&v76, sel_operatingSystemVersion);
  if (v75)
  {
    v74 = v11;
    formatSensitiveData((uint64_t)", OSV ", v6);
    v72.receiver = self;
    v72.super_class = (Class)RPCompanionLinkDevice;
    -[RPEndpoint operatingSystemVersion](&v72, sel_operatingSystemVersion);
    RPNSOperatingSystemVersionToString(v73);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v36 = v74;

    v11 = v36;
  }
  if (self->super._linkType)
  {
    NSAppendPrintF();
    v37 = v11;

    v11 = v37;
  }
  if (self->_uiTriggered)
  {
    NSAppendPrintF();
    v38 = v11;

    v11 = v38;
  }
  if (self->super._statusFlags)
  {
    NSAppendPrintF();
    v39 = v11;

    v11 = v39;
  }
  if (self->_deviceFlags)
  {
    NSAppendPrintF();
    v40 = v11;

    v11 = v40;
  }
  if (a3 <= 20)
  {
    if (self->super._hotspotInfo)
    {
      NSAppendPrintF();
      v41 = v11;

      v11 = v41;
    }
    if (self->_listeningPort)
    {
      NSAppendPrintF();
      v42 = v11;

      v11 = v42;
    }
    v43 = self->_launchInstanceID;
    v44 = v43;
    if (v43)
    {
      -[NSUUID UUIDString](v43, "UUIDString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF();
      v45 = v11;

      v11 = v45;
    }

    if (self->_mediaAccessControlSetting)
    {
      NSAppendPrintF();
      v46 = v11;

      v11 = v46;
    }
    v47 = self->super._mediaRemoteIdentifier;
    if (v47)
    {
      NSAppendPrintF();
      v48 = v11;

      v11 = v48;
    }

    v49 = self->super._mediaRouteIdentifier;
    if (v49)
    {
      NSAppendPrintF();
      v50 = v11;

      v11 = v50;
    }

    if (self->_mediaSystemIdentifier)
    {
      mediaSystemIdentifier = self->_mediaSystemIdentifier;
      NSAppendPrintF();
      v51 = v11;

      if (self->_daemon)
      {
        -[NSUUID isEqual:](self->_mediaSystemIdentifierEffective, "isEqual:", self->_mediaSystemIdentifier, v71, mediaSystemIdentifier);
        NSAppendPrintF();
        v11 = v51;

      }
      else
      {
        v11 = v51;
      }
    }
    if (self->_mediaSystemName)
    {
      NSAppendPrintF();
      v52 = v11;

      v11 = v52;
    }
    if (self->_mediaSystemRole)
    {
      NSAppendPrintF();
      v53 = v11;

      if (self->_daemon)
      {
        NSAppendPrintF();
        v11 = v53;

      }
      else
      {
        v11 = v53;
      }
    }
    if (self->_mediaSystemState >= 2u)
    {
      NSAppendPrintF();
      v54 = v11;

      v11 = v54;
    }
    if ((self->_flags & 0x40) != 0)
    {
      NSAppendPrintF();
      v55 = v11;

      NSAppendPrintF();
      v11 = v55;

    }
    v56 = self->_siriInfo;
    v57 = v56;
    if (v56)
    {
      -[NSDictionary count](v56, "count");
      NSAppendPrintF();
      v58 = v11;

      v11 = v58;
    }
    v59 = v11;

    RPCompanionLinkFlagsToShortString(self->_flags, (uint64_t)v93);
    NSAppendPrintF();
    v11 = v11;

    v60 = self->super._serviceTypes;
    if (v60)
    {
      NSAppendPrintF();
      v61 = v11;

      v11 = v61;
    }

    v62 = self->_activeUserAltDSID;
    if (v62)
    {
      NSAppendPrintF();
      v63 = v11;

      v11 = v63;
    }

    standaloneWatch = self->_standaloneWatch;
    if ((standaloneWatch & 0x80000000) == 0)
    {
      NSAppendPrintF();
      v65 = v11;

      v11 = v65;
    }
  }
  v66 = v11;

  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifierEffective, 0);
  objc_storeStrong((id *)&self->_launchInstanceID, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_activeUserAltDSID, 0);
  objc_storeStrong((id *)&self->_siriInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_publicIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemName, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_idsPersonalDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
}

- (RPCompanionLinkDevice)initWithCoder:(id)a3
{
  id v4;
  RPCompanionLinkDevice *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RPCompanionLinkDevice *v18;
  objc_super v20;
  uint64_t v21;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RPCompanionLinkDevice;
  v5 = -[RPEndpoint initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceCapabilityFlags = v21;
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceFlags = v21;
    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v21;
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningPort = v21;
    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_mediaAccessControlSetting = v21;
    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_mediaSystemRole = v21;
    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_mediaSystemState = v21;
    v13 = v12;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("pers")))
      v5->_personal = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("pers"));

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_personalDeviceState = v21;
    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_personalRequestsState = v21;
    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = v16;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_standaloneWatch = v21;
    v18 = v5;
  }

  return v5;
}

- (NSString)effectiveIdentifier
{
  __CFString *identifier;

  identifier = (__CFString *)self->super._identifier;
  if (!identifier)
  {
    identifier = (__CFString *)self->_publicIdentifier;
    if (!identifier)
      identifier = &stru_1E5F528E0;
  }
  return (NSString *)identifier;
}

- (void)setChanged:(BOOL)a3
{
  self->_changed = a3;
}

- (int)serversChangedState
{
  return self->_serversChangedState;
}

- (int)personalDeviceState
{
  return self->_personalDeviceState;
}

- (int)listeningPort
{
  return self->_listeningPort;
}

- (NSString)idsPersonalDeviceIdentifier
{
  return self->_idsPersonalDeviceIdentifier;
}

- (NSUUID)homeKitIdentifier
{
  return self->_homeKitIdentifier;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (BOOL)changed
{
  return self->_changed;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkDevice)init
{
  RPCompanionLinkDevice *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RPCompanionLinkDevice;
  v2 = -[RPCompanionLinkDevice init](&v4, sel_init);
  if (v2 && GestaltGetDeviceClass() != 6)
    v2->_standaloneWatch = -1;
  return v2;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int Int64;
  void *v8;
  void *v9;
  NSString *publicIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  int Int64Ranged;
  void *v16;
  unsigned int flags;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RPCompanionLinkDevice;
  v4 = a3;
  v5 = -[RPEndpoint updateWithBonjourDevice:](&v19, sel_updateWithBonjourDevice_, v4);
  objc_msgSend(v4, "txtDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  Int64 = CFDictionaryGetInt64();
  flags = self->_flags;
  RPCompanionLinkFlagsWithUpdateBonjourFlags(&flags, Int64);
  if (flags != self->_flags)
  {
    self->_flags = flags;
    v5 |= 2u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    publicIdentifier = self->_publicIdentifier;
    v11 = v8;
    v12 = publicIdentifier;
    if (v11 == v12)
    {

      goto LABEL_11;
    }
    v13 = v12;
    if (v12)
    {
      v14 = -[NSString isEqual:](v11, "isEqual:", v12);

      if ((v14 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_publicIdentifier, v9);
    v5 |= 2u;
  }
LABEL_11:
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (self->_mediaAccessControlSetting != Int64Ranged)
  {
    self->_mediaAccessControlSetting = Int64Ranged;
    v5 |= 2u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_storeStrong((id *)&self->super._mediaRouteIdentifier, v16);
    v5 |= 2u;
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  objc_super v28;
  objc_super v29;
  objc_super v30;
  objc_super v31;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31.receiver = self;
    v31.super_class = (Class)RPCompanionLinkDevice;
    v8 = -[RPEndpoint compareWithDeviceIdentifier:](&v31, sel_compareWithDeviceIdentifier_, v7);

    if ((v8 & 1) != 0)
      goto LABEL_11;
  }
  objc_msgSend(v4, "idsDeviceIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "idsDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30.receiver = self;
    v30.super_class = (Class)RPCompanionLinkDevice;
    v12 = -[RPEndpoint compareWithDeviceIdentifier:](&v30, sel_compareWithDeviceIdentifier_, v11);

    if ((v12 & 1) != 0)
      goto LABEL_11;
  }
  if ((objc_msgSend(v4, "statusFlags") & 0x2000) == 0 && (self->super._statusFlags & 0x2000) == 0)
  {
    objc_msgSend(v4, "verifiedIdentity");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v4, "verifiedIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29.receiver = self;
      v29.super_class = (Class)RPCompanionLinkDevice;
      v16 = -[RPEndpoint compareWithDeviceIdentifier:](&v29, sel_compareWithDeviceIdentifier_, v15);

      if ((v16 & 1) != 0)
        goto LABEL_11;
    }
  }
  objc_msgSend(v4, "publicIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_12;
  v18 = (void *)v17;
  objc_msgSend(v4, "publicIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)RPCompanionLinkDevice;
  v20 = -[RPEndpoint compareWithDeviceIdentifier:](&v28, sel_compareWithDeviceIdentifier_, v19);

  if ((v20 & 1) != 0)
  {
LABEL_11:
    v21 = 1;
  }
  else
  {
LABEL_12:
    objc_msgSend(v4, "bleDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rapportIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v4, "bleDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rapportIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27.receiver = self;
      v27.super_class = (Class)RPCompanionLinkDevice;
      v21 = -[RPEndpoint compareWithDeviceIdentifier:](&v27, sel_compareWithDeviceIdentifier_, v25);

    }
    else
    {
      v21 = 0;
    }

  }
  return v21;
}

- (BOOL)isEqualToDeviceBasic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *idsDeviceIdentifier;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (self->super._idsDeviceIdentifier
    && (objc_msgSend(v4, "idsDeviceIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    idsDeviceIdentifier = self->super._idsDeviceIdentifier;
    objc_msgSend(v5, "idsDeviceIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->super._identifier
         && (objc_msgSend(v5, "identifier"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    idsDeviceIdentifier = self->super._identifier;
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    idsDeviceIdentifier = self->_publicIdentifier;
    objc_msgSend(v5, "publicIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
  v11 = idsDeviceIdentifier;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    v14 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    v14 = 0;
  }
  else
  {
    v14 = -[NSString isEqual:](v11, "isEqual:", v12);
  }

  return v14;
}

- (void)setDeviceColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void)setHomeKitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setIdsPersonalDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setListeningPort:(int)a3
{
  self->_listeningPort = a3;
}

- (int)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)setMediaAccessControlSetting:(int)a3
{
  self->_mediaAccessControlSetting = a3;
}

- (NSUUID)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (void)setMediaSystemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)mediaSystemName
{
  return self->_mediaSystemName;
}

- (void)setMediaSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (int)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (void)setMediaSystemRole:(int)a3
{
  self->_mediaSystemRole = a3;
}

- (int)mediaSystemState
{
  return self->_mediaSystemState;
}

- (void)setMediaSystemState:(int)a3
{
  self->_mediaSystemState = a3;
}

- (BOOL)isPersonal
{
  return self->_personal;
}

- (void)setPersonal:(BOOL)a3
{
  self->_personal = a3;
}

- (void)setPersonalDeviceState:(int)a3
{
  self->_personalDeviceState = a3;
}

- (int)personalRequestsState
{
  return self->_personalRequestsState;
}

- (void)setPersonalRequestsState:(int)a3
{
  self->_personalRequestsState = a3;
}

- (NSString)publicIdentifier
{
  return self->_publicIdentifier;
}

- (void)setPublicIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (void)setSiriInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (unsigned)deviceCapabilityFlags
{
  return self->_deviceCapabilityFlags;
}

- (void)setDeviceCapabilityFlags:(unsigned int)a3
{
  self->_deviceCapabilityFlags = a3;
}

- (NSString)activeUserAltDSID
{
  return self->_activeUserAltDSID;
}

- (void)setActiveUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (char)standaloneWatch
{
  return self->_standaloneWatch;
}

- (void)setStandaloneWatch:(char)a3
{
  self->_standaloneWatch = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(BOOL)a3
{
  self->_daemon = a3;
}

- (NSUUID)launchInstanceID
{
  return self->_launchInstanceID;
}

- (void)setLaunchInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSUUID)mediaSystemIdentifierEffective
{
  return self->_mediaSystemIdentifierEffective;
}

- (void)setMediaSystemIdentifierEffective:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (int)mediaSystemRoleEffective
{
  return self->_mediaSystemRoleEffective;
}

- (void)setMediaSystemRoleEffective:(int)a3
{
  self->_mediaSystemRoleEffective = a3;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void)setServersChangedState:(int)a3
{
  self->_serversChangedState = a3;
}

- (BOOL)uiTriggered
{
  return self->_uiTriggered;
}

- (void)setUiTriggered:(BOOL)a3
{
  self->_uiTriggered = a3;
}

@end
