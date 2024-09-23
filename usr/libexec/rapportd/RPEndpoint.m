@implementation RPEndpoint

+ (id)nullEndpoint
{
  if (qword_100131FE0 != -1)
    dispatch_once(&qword_100131FE0, &stru_100112810);
  return (id)qword_100131FD8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPEndpoint)initWithCoder:(id)a3
{
  id v4;
  RPEndpoint *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  RPEndpoint *v87;
  objc_super v89;
  uint64_t v90;

  v4 = a3;
  v89.receiver = self;
  v89.super_class = (Class)RPEndpoint;
  v5 = -[RPEndpoint init](&v89, "init");
  if (v5)
  {
    v6 = v4;
    v9 = objc_opt_class(NSString, v7, v8);
    NSDecodeObjectIfPresent(v6, CFSTR("altDSID"), v9, &v5->_accountAltDSID);

    v10 = v6;
    v13 = objc_opt_class(NSString, v11, v12);
    NSDecodeObjectIfPresent(v10, CFSTR("aID"), v13, &v5->_accountID);

    v90 = 0;
    if (NSDecodeSInt64RangedIfPresent(v10, CFSTR("acl"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v90))
      v5->_activityLevel = v90;
    v14 = v10;
    v17 = objc_opt_class(NSDate, v15, v16);
    NSDecodeObjectIfPresent(v14, CFSTR("aclTS"), v17, &v5->_activityLevelTimeStamp);

    v18 = v14;
    v21 = objc_opt_class(NSData, v19, v20);
    NSDecodeObjectIfPresent(v18, CFSTR("bleTD"), v21, &v5->_encodedBLETargetData);

    v90 = 0;
    if (NSDecodeSInt64RangedIfPresent(v18, CFSTR("cst"), 0, 255, &v90))
      v5->_cameraState = v90;
    v24 = objc_opt_class(NSUUID, v22, v23);
    NSDecodeNSArrayOfClassIfPresent(v18, CFSTR("hkUI"), v24, &v5->_homeKitUserIdentifiers);
    v90 = 0;
    if (NSDecodeSInt64RangedIfPresent(v18, CFSTR("hsI"), 0, 0xFFFFFFFFLL, &v90))
      v5->_hotspotInfo = v90;
    v25 = v18;
    v28 = objc_opt_class(NSString, v26, v27);
    NSDecodeObjectIfPresent(v25, CFSTR("id"), v28, &v5->_identifier);

    v29 = v25;
    v32 = objc_opt_class(NSString, v30, v31);
    NSDecodeObjectIfPresent(v29, CFSTR("idsD"), v32, &v5->_idsDeviceIdentifier);

    v33 = v29;
    v36 = objc_opt_class(NSString, v34, v35);
    NSDecodeObjectIfPresent(v33, CFSTR("cnID"), v36, &v5->_contactID);

    v37 = v33;
    if (objc_msgSend(v37, "containsValueForKey:", CFSTR("iLagS")))
      v5->_inDiscoverySession = objc_msgSend(v37, "decodeBoolForKey:", CFSTR("iLagS"));

    v38 = v37;
    v41 = objc_opt_class(NSString, v39, v40);
    NSDecodeObjectIfPresent(v38, CFSTR("ipAdd"), v41, &v5->_ipAddress);

    v42 = v38;
    v45 = objc_opt_class(NSString, v43, v44);
    NSDecodeObjectIfPresent(v42, CFSTR("MRI"), v45, &v5->_mediaRemoteIdentifier);

    v46 = v42;
    v49 = objc_opt_class(NSString, v47, v48);
    NSDecodeObjectIfPresent(v46, CFSTR("MRtI"), v49, &v5->_mediaRouteIdentifier);

    v50 = v46;
    v53 = objc_opt_class(NSString, v51, v52);
    NSDecodeObjectIfPresent(v50, CFSTR("md"), v53, &v5->_model);

    v54 = v50;
    v57 = objc_opt_class(NSString, v55, v56);
    NSDecodeObjectIfPresent(v54, CFSTR("nm"), v57, &v5->_name);

    v58 = v54;
    if (objc_msgSend(v58, "containsValueForKey:", CFSTR("osma")))
      v5->_operatingSystemVersion.majorVersion = (int64_t)objc_msgSend(v58, "decodeIntegerForKey:", CFSTR("osma"));

    v59 = v58;
    if (objc_msgSend(v59, "containsValueForKey:", CFSTR("osmi")))
      v5->_operatingSystemVersion.minorVersion = (int64_t)objc_msgSend(v59, "decodeIntegerForKey:", CFSTR("osmi"));

    v60 = v59;
    if (objc_msgSend(v60, "containsValueForKey:", CFSTR("osp")))
      v5->_operatingSystemVersion.patchVersion = (int64_t)objc_msgSend(v60, "decodeIntegerForKey:", CFSTR("osp"));

    v90 = 0;
    if (NSDecodeSInt64RangedIfPresent(v60, CFSTR("px"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v90))
      v5->_proximity = v90;
    v61 = v60;
    v64 = objc_opt_class(NSDictionary, v62, v63);
    NSDecodeStandardContainerIfPresent(v61, CFSTR("si"), v64, &v5->_serviceInfo);

    v65 = v61;
    v68 = objc_opt_class(NSString, v66, v67);
    NSDecodeObjectIfPresent(v65, CFSTR("st"), v68, &v5->_serviceType);

    v71 = objc_opt_class(NSString, v69, v70);
    NSDecodeNSArrayOfClassIfPresent(v65, CFSTR("stA"), v71, &v5->_serviceTypes);
    v72 = v65;
    if (objc_msgSend(v72, "containsValueForKey:", CFSTR("sf")))
      v5->_statusFlags = (unint64_t)objc_msgSend(v72, "decodeInt64ForKey:", CFSTR("sf"));

    v73 = v72;
    v76 = objc_opt_class(NSString, v74, v75);
    NSDecodeObjectIfPresent(v73, CFSTR("sv"), v76, &v5->_sourceVersion);

    v77 = v73;
    v80 = objc_opt_class(NSString, v78, v79);
    NSDecodeObjectIfPresent(v77, CFSTR("vi"), v80, &v5->_verifiedIdentity);

    v83 = objc_opt_class(NSString, v81, v82);
    v86 = objc_opt_class(NSNumber, v84, v85);
    NSDecodeNSDictionaryOfClassesIfPresent(v77, CFSTR("vAcl"), v83, v86, &v5->_verifiedAcl);
    v87 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountAltDSID;
  NSString *accountID;
  uint64_t activityLevel;
  NSDate *activityLevelTimeStamp;
  NSArray *homeKitUserIdentifiers;
  uint64_t hotspotInfo;
  NSString *identifier;
  NSString *idsDeviceIdentifier;
  NSString *contactID;
  NSString *ipAddress;
  NSString *mediaRemoteIdentifier;
  NSString *mediaRouteIdentifier;
  NSString *model;
  NSString *name;
  int64_t majorVersion;
  int64_t minorVersion;
  int64_t patchVersion;
  uint64_t proximity;
  NSDictionary *serviceInfo;
  NSString *serviceType;
  NSArray *serviceTypes;
  unint64_t statusFlags;
  NSString *sourceVersion;
  NSString *verifiedIdentity;
  NSDictionary *verifiedAcl;
  void *v29;
  id v30;

  v30 = a3;
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
    objc_msgSend(v30, "encodeObject:forKey:", accountAltDSID, CFSTR("altDSID"));
  accountID = self->_accountID;
  if (accountID)
    objc_msgSend(v30, "encodeObject:forKey:", accountID, CFSTR("aID"));
  activityLevel = self->_activityLevel;
  if ((_DWORD)activityLevel)
    objc_msgSend(v30, "encodeInteger:forKey:", activityLevel, CFSTR("acl"));
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp)
    objc_msgSend(v30, "encodeObject:forKey:", activityLevelTimeStamp, CFSTR("aclTS"));
  if (self->_cameraState)
    objc_msgSend(v30, "encodeInteger:forKey:");
  homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
  if (homeKitUserIdentifiers)
    objc_msgSend(v30, "encodeObject:forKey:", homeKitUserIdentifiers, CFSTR("hkUI"));
  hotspotInfo = self->_hotspotInfo;
  if ((_DWORD)hotspotInfo)
    objc_msgSend(v30, "encodeInt64:forKey:", hotspotInfo, CFSTR("hsI"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v30, "encodeObject:forKey:", identifier, CFSTR("id"));
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier)
    objc_msgSend(v30, "encodeObject:forKey:", idsDeviceIdentifier, CFSTR("idsD"));
  contactID = self->_contactID;
  if (contactID)
    objc_msgSend(v30, "encodeObject:forKey:", contactID, CFSTR("cnID"));
  if (self->_inDiscoverySession)
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("iLagS"));
  ipAddress = self->_ipAddress;
  if (ipAddress)
    objc_msgSend(v30, "encodeObject:forKey:", ipAddress, CFSTR("ipAdd"));
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
    objc_msgSend(v30, "encodeObject:forKey:", mediaRemoteIdentifier, CFSTR("MRI"));
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier)
    objc_msgSend(v30, "encodeObject:forKey:", mediaRouteIdentifier, CFSTR("MRtI"));
  model = self->_model;
  if (model)
    objc_msgSend(v30, "encodeObject:forKey:", model, CFSTR("md"));
  name = self->_name;
  if (name)
    objc_msgSend(v30, "encodeObject:forKey:", name, CFSTR("nm"));
  majorVersion = self->_operatingSystemVersion.majorVersion;
  if (majorVersion)
    objc_msgSend(v30, "encodeInteger:forKey:", majorVersion, CFSTR("osma"));
  minorVersion = self->_operatingSystemVersion.minorVersion;
  if (minorVersion)
    objc_msgSend(v30, "encodeInteger:forKey:", minorVersion, CFSTR("osmi"));
  patchVersion = self->_operatingSystemVersion.patchVersion;
  if (patchVersion)
    objc_msgSend(v30, "encodeInteger:forKey:", patchVersion, CFSTR("osp"));
  proximity = self->_proximity;
  if ((_DWORD)proximity)
    objc_msgSend(v30, "encodeInteger:forKey:", proximity, CFSTR("px"));
  serviceInfo = self->_serviceInfo;
  if (serviceInfo)
    objc_msgSend(v30, "encodeObject:forKey:", serviceInfo, CFSTR("si"));
  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v30, "encodeObject:forKey:", serviceType, CFSTR("st"));
  serviceTypes = self->_serviceTypes;
  if (serviceTypes)
    objc_msgSend(v30, "encodeObject:forKey:", serviceTypes, CFSTR("stA"));
  statusFlags = self->_statusFlags;
  if (statusFlags)
    objc_msgSend(v30, "encodeInt64:forKey:", statusFlags, CFSTR("sf"));
  sourceVersion = self->_sourceVersion;
  if (sourceVersion)
    objc_msgSend(v30, "encodeObject:forKey:", sourceVersion, CFSTR("sv"));
  verifiedIdentity = self->_verifiedIdentity;
  if (verifiedIdentity)
    objc_msgSend(v30, "encodeObject:forKey:", verifiedIdentity, CFSTR("vi"));
  verifiedAcl = self->_verifiedAcl;
  if (verifiedAcl)
    objc_msgSend(v30, "encodeObject:forKey:", verifiedAcl, CFSTR("vAcl"));
  if (self->_encodeSensitiveProperties)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint bleTargetData](self, "bleTargetData"));
    if (v29)
      objc_msgSend(v30, "encodeObject:forKey:", v29, CFSTR("bleTD"));

  }
}

- (id)description
{
  return -[RPEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  void *v6;
  NSString *identifier;
  NSString *v8;
  id v9;
  uint64_t v10;
  NSString *name;
  NSString *v12;
  id v13;
  NSString *model;
  NSString *v15;
  id v16;
  NSString *accountAltDSID;
  NSString *v18;
  id v19;
  NSString *accountID;
  NSString *v21;
  id v22;
  unsigned int activityLevel;
  const char *v24;
  id v25;
  int cameraState;
  const char *v27;
  const char *v28;
  id v29;
  NSArray *homeKitUserIdentifiers;
  NSArray *v31;
  id v32;
  NSString *idsDeviceIdentifier;
  NSString *v34;
  id v35;
  NSString *contactID;
  NSString *v37;
  id v38;
  NSString *mediaRemoteIdentifier;
  NSString *v40;
  id v41;
  NSString *mediaRouteIdentifier;
  NSString *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  NSString *verifiedIdentity;
  NSString *v49;
  id v50;
  NSString *sourceVersion;
  NSString *v52;
  id v53;
  int proximity;
  const char *v55;
  id v56;
  NSString *serviceType;
  NSString *v58;
  id v59;
  unint64_t statusFlags;
  id v61;
  NSDate *activityLevelTimeStamp;
  NSDate *v63;
  id v64;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  int64_t patchVersion;
  id v74;
  id v75;
  id v76;
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
  id v87;

  v87 = 0;
  NSAppendPrintF(&v87, "RPEndpoint");
  v5 = v87;
  v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    v86 = v5;
    v8 = identifier;
    NSAppendPrintF(&v86, ", ID %@", v8);
    v9 = v86;

    v6 = v9;
  }
  if (a3 <= 49)
    v10 = 100;
  else
    v10 = 8;
  if (sub_100018154())
  {
    name = self->_name;
    if (name)
    {
      v85 = v6;
      v12 = name;
      NSAppendPrintF(&v85, ", Nm '%@'", v12);
      v13 = v85;

      v6 = v13;
    }
    model = self->_model;
    if (model)
    {
      v84 = v6;
      v15 = model;
      NSAppendPrintF(&v84, ", Md '%@'", v15);
      v16 = v84;

      v6 = v16;
    }
    accountAltDSID = self->_accountAltDSID;
    if (accountAltDSID)
    {
      v83 = v6;
      v18 = accountAltDSID;
      NSAppendPrintF(&v83, ", AccountAltDSID '%.*@'", v10, v18);
      v19 = v83;

      v6 = v19;
    }
    accountID = self->_accountID;
    if (accountID)
    {
      v82 = v6;
      v21 = accountID;
      NSAppendPrintF(&v82, ", AID '%.*@'", v10, v21);
      v22 = v82;

      v6 = v22;
    }
    activityLevel = self->_activityLevel;
    if (activityLevel)
    {
      v81 = v6;
      if (activityLevel > 0xE)
        v24 = "?";
      else
        v24 = (&off_100112830)[activityLevel - 1];
      NSAppendPrintF(&v81, ", AcLv '%s'", v24);
      v25 = v81;

      v6 = v25;
    }
    cameraState = self->_cameraState;
    if (self->_cameraState)
    {
      v27 = "?";
      if (cameraState == 1)
        v27 = "Usable";
      if (cameraState == 2)
        v28 = "Magic";
      else
        v28 = v27;
      v80 = v6;
      NSAppendPrintF(&v80, ", CS '%s'", v28);
      v29 = v80;

      v6 = v29;
    }
    homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
    if (homeKitUserIdentifiers)
    {
      v79 = v6;
      v31 = homeKitUserIdentifiers;
      NSAppendPrintF(&v79, ", HKUID '%.*@'", v10, v31);
      v32 = v79;

      v6 = v32;
    }
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    if (idsDeviceIdentifier)
    {
      v78 = v6;
      v34 = idsDeviceIdentifier;
      NSAppendPrintF(&v78, ", IDS '%.*@'", v10, v34);
      v35 = v78;

      v6 = v35;
    }
    contactID = self->_contactID;
    if (contactID)
    {
      v77 = v6;
      v37 = contactID;
      NSAppendPrintF(&v77, ", CNID '%.*@'", v10, v37);
      v38 = v77;

      v6 = v38;
    }
    mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
    if (mediaRemoteIdentifier)
    {
      v76 = v6;
      v40 = mediaRemoteIdentifier;
      NSAppendPrintF(&v76, ", MRI '%.*@'", v10, v40);
      v41 = v76;

      v6 = v41;
    }
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      v75 = v6;
      v43 = mediaRouteIdentifier;
      NSAppendPrintF(&v75, ", MRtI '%.*@'", v10, v43);
      v44 = v75;

      v6 = v44;
    }
    if (self->_operatingSystemVersion.majorVersion)
    {
      v74 = v6;
      v72 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
      patchVersion = self->_operatingSystemVersion.patchVersion;
      v45 = sub_100017F40((uint64_t *)&v72);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      NSAppendPrintF(&v74, ", OSV %@", v46);
      v47 = v74;

      v6 = v47;
    }
    verifiedIdentity = self->_verifiedIdentity;
    if (verifiedIdentity)
    {
      v71 = v6;
      v49 = verifiedIdentity;
      NSAppendPrintF(&v71, ", VI %@", v49);
      v50 = v71;

      v6 = v50;
    }
    sourceVersion = self->_sourceVersion;
    if (sourceVersion)
    {
      v70 = v6;
      v52 = sourceVersion;
      NSAppendPrintF(&v70, ", SV %@", v52);
      v53 = v70;

      v6 = v53;
    }
    proximity = self->_proximity;
    if (proximity)
    {
      v69 = v6;
      switch(proximity)
      {
        case 10:
          v55 = "Immed";
          break;
        case 30:
          v55 = "Far";
          break;
        case 20:
          v55 = "Near";
          break;
        default:
          v55 = "?";
          break;
      }
      NSAppendPrintF(&v69, ", Px %s", v55);
      v56 = v69;

      v6 = v56;
    }
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v68 = v6;
    v58 = serviceType;
    NSAppendPrintF(&v68, ", ST %@", v58);
    v59 = v68;

    v6 = v59;
  }
  statusFlags = self->_statusFlags;
  if (statusFlags)
  {
    v67 = v6;
    NSAppendPrintF(&v67, ", SF %#ll{flags}", statusFlags, &algn_10010A0AF);
    v61 = v67;

    v6 = v61;
  }
  if (a3 >= 20)
  {
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v66 = v6;
      v63 = activityLevelTimeStamp;
      NSAppendPrintF(&v66, ", ACLTS %@", v63);
      v64 = v66;

      v6 = v64;
    }
  }
  return v6;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t Int64Ranged;
  IDSDevice *v9;
  NSString *v10;
  NSString *v11;
  unsigned int v12;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v15;
  void *v16;
  NSString *name;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  unsigned __int8 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  NSString *v30;
  void *v31;
  CFTypeID v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t Int64;
  unint64_t statusFlags;
  unsigned int v38;
  uint64_t v39;
  uint64x2_t v40;
  int8x16_t v41;
  unint64_t v42;
  uint64_t v44;
  char v45;
  void *v46;
  unsigned int v47[6];
  uint64_t v48[3];
  __int128 v49;
  int64_t patchVersion;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "txtDictionary"));
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceInfo"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v7, CFSTR("TrTy"), 0, 0xFFFFFFFFLL, 0);

  v9 = self->_idsDevice;
  v10 = self->_model;
  v44 = Int64Ranged;
  if (v10)
  {
    v11 = v10;
LABEL_3:
    v12 = 0;
    goto LABEL_7;
  }
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("rpMd"), TypeID, 0);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v11)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](v9, "modelIdentifier"));
    if (!v11)
      goto LABEL_3;
  }
  objc_storeStrong((id *)&self->_model, v11);
  v12 = 2;
LABEL_7:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name", v44));
  v16 = v15;
  v46 = (void *)v6;
  if (!v15)
    goto LABEL_16;
  name = self->_name;
  v18 = v15;
  v19 = name;
  if (v18 == v19)
  {

  }
  else
  {
    v20 = v19;
    if (v19)
    {
      v21 = -[NSString isEqual:](v18, "isEqual:", v19);

      if ((v21 & 1) != 0)
        goto LABEL_15;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_name, v16);
    v12 |= 0x10u;
  }
LABEL_15:
  v6 = (uint64_t)v46;
LABEL_16:
  v49 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  v22 = sub_100017F40((uint64_t *)&v49);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (!v9)
    goto LABEL_25;
  -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
  v24 = sub_100017F40(v48);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = v23;
  v27 = v25;
  if (v26 == v27)
  {

  }
  else
  {
    v28 = v27;
    if ((v26 == 0) == (v27 != 0))
    {

    }
    else
    {
      v29 = objc_msgSend(v26, "isEqual:", v27);

      if ((v29 & 1) != 0)
        goto LABEL_24;
    }
    -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v49;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v12 |= 2u;
  }
LABEL_24:
  v6 = (uint64_t)v46;
LABEL_25:
  v30 = self->_sourceVersion;
  if (v30)
  {
    v31 = v30;
  }
  else
  {
    v32 = CFStringGetTypeID();
    v33 = CFDictionaryGetTypedValue(v6, CFSTR("rpVr"), v32, 0);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v31 = (void *)v34;
    if (v9 && !v34)
    {
      -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
      v35 = sub_100017740((uint64_t)v11, v47);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v35);
    }
    if (v31)
    {
      objc_storeStrong((id *)&self->_sourceVersion, v31);
      v12 |= 2u;
    }
  }
  Int64 = CFDictionaryGetInt64(v6, CFSTR("rpFl"), 0);
  statusFlags = self->_statusFlags;
  v38 = -[IDSDevice supportsApplePay](v9, "supportsApplePay");
  v39 = 4;
  if (v38)
    v39 = 8388612;
  v40 = (uint64x2_t)vdupq_n_s64(Int64);
  v41 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v40, (uint64x2_t)xmmword_10010A060), (int8x16_t)xmmword_10010A090), vandq_s8((int8x16_t)vshlq_u64(v40, (uint64x2_t)xmmword_10010A070), (int8x16_t)xmmword_10010A080));
  v42 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v41.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL)) | statusFlags & 0xFFFFFFF27EBAF7FBLL | (Int64 >> 2) & 0x800 | (4 * (_DWORD)Int64) & 0x50000 | (Int64 << 11) & 0x400000000 | ((unint64_t)((v45 & 0x18) != 0) << 24) | v39;
  if (v42 != statusFlags)
  {
    self->_statusFlags = v42;
    v12 |= 2u;
  }

  return v12;
}

- (BOOL)removeBonjourDevice:(id)a3
{
  CUBonjourDevice *bonjourDevice;
  id v5;
  void *v6;
  unint64_t statusFlags;

  bonjourDevice = self->_bonjourDevice;
  self->_bonjourDevice = 0;
  v5 = a3;

  self->_statusFlags &= ~4uLL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceInfo"));

  LOBYTE(v5) = CFDictionaryGetInt64Ranged(v6, CFSTR("TrTy"), 0, 0xFFFFFFFFLL, 0);
  statusFlags = self->_statusFlags;
  if ((v5 & 0x18) != 0)
  {
    statusFlags &= ~0x1000000uLL;
    self->_statusFlags = statusFlags;
  }
  return (statusFlags & 0x10001F) == 0;
}

- (unsigned)updateWithFamilyEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *idsDeviceIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  unsigned __int8 v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSString *name;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  NSString *model;
  void *v29;
  id v30;
  void *v31;
  NSString **p_sourceVersion;
  NSString *sourceVersion;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  unsigned __int8 v37;
  unsigned int v39[6];
  __int128 v40;
  int64_t patchVersion;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceUniqueID"));
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  v8 = v5;
  v9 = idsDeviceIdentifier;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (v9)
  {
    v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v6);
  v12 = 2;
LABEL_10:

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
  v14 = v13;
  if (!v13)
    goto LABEL_18;
  name = self->_name;
  v16 = v13;
  v17 = name;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_name, v14);
    v12 |= 0x10u;
  }
LABEL_18:

  v40 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  v20 = sub_100017F40((uint64_t *)&v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productVersion"));
  v23 = v21;
  v24 = v22;
  if (v23 == v24)
  {

    goto LABEL_25;
  }
  v25 = v24;
  if ((v23 == 0) == (v24 != 0))
  {

    goto LABEL_24;
  }
  v26 = objc_msgSend(v23, "isEqual:", v24);

  if ((v26 & 1) == 0)
  {
LABEL_24:
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productVersion"));
    sub_10001807C(v27, &v40);
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v40;
    self->_operatingSystemVersion.patchVersion = patchVersion;

    v12 |= 2u;
  }
LABEL_25:
  model = self->_model;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productVersion"));
  sub_10001807C(v29, v39);
  v30 = sub_100017740((uint64_t)model, v39);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  if (v31)
  {
    sourceVersion = self->_sourceVersion;
    p_sourceVersion = &self->_sourceVersion;
    v34 = v31;
    v35 = sourceVersion;
    if (v34 == v35)
    {

    }
    else
    {
      v36 = v35;
      if (v35)
      {
        v37 = -[NSString isEqual:](v34, "isEqual:", v35);

        if ((v37 & 1) != 0)
          goto LABEL_33;
      }
      else
      {

      }
      objc_storeStrong((id *)p_sourceVersion, v31);
      v12 |= 2u;
    }
  }
LABEL_33:

  return v12;
}

- (unsigned)updateWithIDSDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSString *idsDeviceIdentifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  unsigned __int8 v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  NSString *model;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  NSString *name;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  unsigned __int8 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  id v37;
  NSString *v38;
  NSString *sourceVersion;
  unint64_t statusFlags;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  int64_t patchVersion;

  v5 = a3;
  objc_storeStrong((id *)&self->_idsDevice, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIDOverride"));
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  v9 = v6;
  v10 = idsDeviceIdentifier;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if (v10)
  {
    v12 = -[NSString isEqual:](v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v7);
  v13 = 2;
LABEL_10:

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelIdentifier"));
  v15 = v14;
  v16 = v15;
  if (!v14)
    goto LABEL_18;
  model = self->_model;
  v18 = (NSString *)v15;
  v19 = model;
  if (v18 == v19)
  {

    goto LABEL_18;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }
  v21 = -[NSString isEqual:](v18, "isEqual:", v19);

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_model, v14);
    v13 = 2;
  }
LABEL_18:

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v23 = v22;
  if (!v22)
    goto LABEL_26;
  name = self->_name;
  v25 = v22;
  v26 = name;
  if (v25 == v26)
  {

    goto LABEL_26;
  }
  v27 = v26;
  if (!v26)
  {

    goto LABEL_25;
  }
  v28 = -[NSString isEqual:](v25, "isEqual:", v26);

  if ((v28 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_name, v23);
    v13 |= 0x10u;
  }
LABEL_26:

  v51 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  v29 = sub_100017F40((uint64_t *)&v51);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (v5)
  {
    objc_msgSend(v5, "operatingSystemVersion");
  }
  else
  {
    v48 = 0;
    v49 = 0;
    v50 = 0;
  }
  v31 = sub_100017F40(&v48);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = v30;
  v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_39;
  }
  v35 = v34;
  if ((v33 == 0) != (v34 != 0))
  {
    v36 = objc_msgSend(v33, "isEqual:", v34);

    if ((v36 & 1) != 0)
      goto LABEL_39;
  }
  else
  {

  }
  if (v5)
  {
    objc_msgSend(v5, "operatingSystemVersion");
  }
  else
  {
    v51 = 0uLL;
    patchVersion = 0;
  }
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v51;
  self->_operatingSystemVersion.patchVersion = patchVersion;
  v13 |= 2u;
LABEL_39:
  if (!self->_sourceVersion && v16)
  {
    if (v5)
    {
      objc_msgSend(v5, "operatingSystemVersion");
    }
    else
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
    }
    v37 = sub_100017740((uint64_t)v16, (unsigned int *)&v45);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue(v37);
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v38;

    if (self->_sourceVersion)
      v13 |= 2u;
  }
  statusFlags = self->_statusFlags;
  v41 = objc_msgSend(v5, "supportsApplePay", v45, v46, v47, v48, v49, v50);
  v42 = 1572864;
  if (v41)
    v42 = 9961472;
  v43 = v42 | statusFlags;
  if (v43 != statusFlags)
  {
    self->_statusFlags = v43;
    v13 |= 2u;
  }

  return v13;
}

- (unsigned)removeIDSDevice
{
  IDSDevice *idsDevice;
  unint64_t statusFlags;
  unsigned int v5;

  idsDevice = self->_idsDevice;
  self->_idsDevice = 0;

  statusFlags = self->_statusFlags;
  if ((statusFlags & 0xFFFFFFFFFFEFFFFFLL) == statusFlags)
  {
    v5 = 0;
  }
  else
  {
    self->_statusFlags = statusFlags & 0xFFFFFFFFFFEFFFFFLL;
    v5 = 2;
    LODWORD(statusFlags) = statusFlags & 0xFFEFFFFF;
  }
  if ((statusFlags & 0x10001F) != 0)
    return v5;
  else
    return v5 | 0x200;
}

- (unsigned)updateWithSFDevice:(id)a3
{
  id v5;
  SFDevice *v6;
  unsigned int v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSString *accountAltDSID;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  NSString *accountID;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  unsigned __int8 v23;
  int v24;
  NSDate *v25;
  NSDate *activityLevelTimeStamp;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unsigned int v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  unsigned __int8 Int64Ranged;
  unsigned int hotspotInfo;
  void *v51;
  void *v52;
  NSString *idsDeviceIdentifier;
  NSString *v54;
  NSString *v55;
  NSString *v56;
  unsigned __int8 v57;
  unsigned int v58;
  void *v59;
  void *v60;
  NSString *contactID;
  NSString *v62;
  NSString *v63;
  NSString *v64;
  unsigned __int8 v65;
  IDSDevice *v66;
  void *v67;
  void *v68;
  void *v69;
  NSString *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  NSString *name;
  NSString *v75;
  NSString *v76;
  NSString *v77;
  unsigned __int8 v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  unsigned __int8 v87;
  id v88;
  NSString *v89;
  NSString *sourceVersion;
  unint64_t statusFlags;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  char v103;
  unint64_t v104;
  __CFString *v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  void *v110;
  void *v111;
  uint64_t Int64;
  unint64_t v113;
  SFDevice *v114;
  int v115;
  uint64_t v116;
  int v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  unsigned int v123;
  _BOOL4 v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  SFDevice *v130;
  unsigned int v131;
  IDSDevice *v132;
  unsigned int v133[6];
  uint64_t v134[3];
  __int128 v135;
  int64_t patchVersion;
  int v137[3];

  v5 = a3;
  v137[0] = 0;
  v6 = self->_bleDevice;
  objc_storeStrong((id *)&self->_bleDevice, a3);
  v132 = self->_idsDevice;
  v7 = objc_msgSend(v5, "deviceFlags");
  v8 = 0;
  if ((objc_opt_respondsToSelector(v5, "accountAltDSID") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAltDSID"));
    v10 = v9;
    if (!v9)
    {
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = v7;
    accountAltDSID = self->_accountAltDSID;
    v13 = v9;
    v14 = accountAltDSID;
    if (v13 == v14)
    {

    }
    else
    {
      v15 = v14;
      if (!v14)
      {

LABEL_11:
        objc_storeStrong((id *)&self->_accountAltDSID, v10);
        v8 = 2;
        goto LABEL_12;
      }
      v16 = -[NSString isEqual:](v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_11;
    }
    v8 = 0;
LABEL_12:
    v7 = v11;
    goto LABEL_13;
  }
LABEL_14:
  v131 = v7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountID"));
  v18 = v17;
  if (v17)
  {
    accountID = self->_accountID;
    v20 = v17;
    v21 = accountID;
    if (v20 == v21)
    {

    }
    else
    {
      v22 = v21;
      if (v21)
      {
        v23 = -[NSString isEqual:](v20, "isEqual:", v21);

        if ((v23 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_accountID, v18);
      v8 = 2;
    }
  }
LABEL_22:

  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v24 = objc_msgSend(v129, "decryptedActivityLevel");
  if (v24 != 16 && self->_activityLevel != v24)
  {
    self->_activityLevel = v24;
    v25 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v25;

    v8 = 2;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "advertisementData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](v6, "bleDevice"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "advertisementData"));
  v31 = v28;
  v32 = v30;
  v33 = v32;
  if (v31 == v32)
  {
    v34 = 1;
  }
  else if ((v31 == 0) == (v32 != 0))
  {
    v34 = 0;
  }
  else
  {
    v34 = objc_msgSend(v31, "isEqual:", v32);
  }

  v35 = v8 | 1;
  if (v34)
    v36 = v8;
  else
    v36 = v8 | 1;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "advertisementFields"));
  v39 = objc_msgSend(v38, "mutableCopy");

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](v6, "bleDevice"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "advertisementFields"));
  v42 = objc_msgSend(v41, "mutableCopy");

  objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, CFSTR("ch"));
  objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, CFSTR("ch"));
  v43 = v39;
  v44 = v42;
  v127 = v44;
  v128 = v43;
  if (v43 == v44)
  {

    goto LABEL_38;
  }
  v45 = v44;
  if ((v43 == 0) == (v44 != 0))
  {

    goto LABEL_40;
  }
  v46 = objc_msgSend(v43, "isEqual:", v44);

  if (v46)
LABEL_38:
    v35 = v36;
LABEL_40:
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "advertisementFields"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v48, CFSTR("camS"), 0, 255, 0);

  if (self->_cameraState != Int64Ranged)
  {
    self->_cameraState = Int64Ranged;
    v35 |= 2u;
  }
  hotspotInfo = self->_hotspotInfo;
  if (hotspotInfo != objc_msgSend(v5, "hotspotInfo"))
  {
    self->_hotspotInfo = objc_msgSend(v5, "hotspotInfo");
    v35 |= 1u;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsIdentifier"));
  v52 = v51;
  if (v51)
  {
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    v54 = v51;
    v55 = idsDeviceIdentifier;
    if (v54 == v55)
    {

      goto LABEL_52;
    }
    v56 = v55;
    if (v55)
    {
      v57 = -[NSString isEqual:](v54, "isEqual:", v55);

      if ((v57 & 1) != 0)
        goto LABEL_52;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v52);
    v35 |= 2u;
  }
LABEL_52:

  v58 = objc_msgSend(v5, "inDiscoverySession");
  if (self->_inDiscoverySession != v58)
  {
    self->_inDiscoverySession = v58;
    v35 |= 0x400u;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
  v60 = v59;
  if (v59)
  {
    contactID = self->_contactID;
    v62 = v59;
    v63 = contactID;
    if (v62 == v63)
    {

      goto LABEL_62;
    }
    v64 = v63;
    if (v63)
    {
      v65 = -[NSString isEqual:](v62, "isEqual:", v63);

      if ((v65 & 1) != 0)
        goto LABEL_62;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_contactID, v60);
    v35 |= 2u;
  }
LABEL_62:

  if (self->_mediaRemoteIdentifier)
  {
    v66 = v132;
  }
  else
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRemoteID"));
    if (v67)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v67);
      v35 |= 2u;
    }
    v66 = v132;

  }
  if (self->_mediaRouteIdentifier)
  {
    v125 = (v131 & 0x400) == 0;
  }
  else
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRouteID"));
    if (v68)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v68);
      v35 |= 2u;
    }

    if (self->_mediaRouteIdentifier || (v131 & 0x400) == 0)
    {
      v125 = (v131 & 0x400) == 0;
    }
    else
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rapportIdentifier"));
      if (v69)
      {
        objc_storeStrong((id *)&self->_mediaRouteIdentifier, v69);
        v35 |= 2u;
      }

      v125 = 0;
    }
  }
  v70 = self->_model;
  if (v70)
  {
    v71 = (__CFString *)v70;
    goto LABEL_82;
  }
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  if (v71)
    goto LABEL_81;
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](v66, "modelIdentifier"));
  if (v71)
    goto LABEL_81;
  if (objc_msgSend(v5, "deviceClassCode") == 4)
  {
    if (objc_msgSend(v5, "deviceModelCode") == 5)
    {
      v71 = CFSTR("AudioAccessory5,1");
    }
    else if (objc_msgSend(v5, "deviceModelCode") == 6)
    {
      v71 = CFSTR("AudioAccessory6,1");
    }
    else
    {
      v71 = CFSTR("AudioAccessory1,1");
    }
LABEL_81:
    objc_storeStrong((id *)&self->_model, v71);
    v35 |= 2u;
    goto LABEL_82;
  }
  v71 = 0;
LABEL_82:
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v73 = v72;
  if (!v72)
    goto LABEL_90;
  name = self->_name;
  v75 = v72;
  v76 = name;
  if (v75 == v76)
  {

    v66 = v132;
    goto LABEL_90;
  }
  v77 = v76;
  if (!v76)
  {

    v66 = v132;
    goto LABEL_89;
  }
  v78 = -[NSString isEqual:](v75, "isEqual:", v76);

  v66 = v132;
  if ((v78 & 1) == 0)
  {
LABEL_89:
    objc_storeStrong((id *)&self->_name, v73);
    v35 |= 0x10u;
  }
LABEL_90:

  v135 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  v79 = sub_100017F40((uint64_t *)&v135);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  v130 = v6;
  v126 = (void *)v80;
  if (!v66)
    goto LABEL_101;
  v81 = (void *)v80;
  -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
  v82 = sub_100017F40(v134);
  v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
  v84 = v81;
  v85 = v83;
  if (v84 == v85)
  {

    goto LABEL_98;
  }
  v86 = v85;
  if ((v84 == 0) == (v85 != 0))
  {

    goto LABEL_97;
  }
  v87 = objc_msgSend(v84, "isEqual:", v85);

  if ((v87 & 1) == 0)
  {
LABEL_97:
    v66 = v132;
    -[IDSDevice operatingSystemVersion](v132, "operatingSystemVersion");
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v135;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v35 |= 2u;
    goto LABEL_98;
  }
  v66 = v132;
LABEL_98:
  if (!self->_sourceVersion)
  {
    -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
    v88 = sub_100017740((uint64_t)v71, v133);
    v89 = (NSString *)objc_claimAutoreleasedReturnValue(v88);
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v89;

    if (self->_sourceVersion)
      v35 |= 2u;
  }
LABEL_101:
  statusFlags = self->_statusFlags;
  v92 = objc_msgSend(v5, "deviceActionType");
  v93 = -[IDSDevice supportsApplePay](v66, "supportsApplePay");
  v94 = 2;
  if (v93)
    v94 = 8388610;
  v95 = statusFlags & 0xFFFFFF7FF7DFFEFDLL | v94 & 0xFFFFFF7FFFFFFFFFLL | ((((unint64_t)(v131 & 0x80) >> 7) & 1) << 39);
  if ((v131 & 8) != 0 && v92 == 28)
    v97 = 0x200000;
  else
    v97 = 0;
  v98 = objc_msgSend(v5, "duetSync");
  v99 = 256;
  if (!v98)
    v99 = 0;
  v100 = v95 | v97 | v99 | ((unint64_t)(v92 == 29) << 27);
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "advertisementFields"));
  v103 = CFDictionaryGetInt64Ranged(v102, CFSTR("wp"), 0, 255, v137);

  if (!v137[0])
    v100 = v100 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v103 != 0) << 9);
  v104 = v100 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(v92 == 34) << 30);
  v105 = v71;
  v106 = -[__CFString hasPrefix:](v105, "hasPrefix:", CFSTR("AppleTV"));

  v107 = v104 | 0x50800;
  if (!v106)
    v107 = v104;
  if ((v131 & 8) != 0)
    v107 |= 0x80000uLL;
  v108 = v107 | (v131 << 13) & 0x4000 | (((v131 >> 2) & 1) << 17);
  if (!v125)
    v108 |= 0x8000uLL;
  v109 = (v131 << 7) & 0x2000 | ((unint64_t)(((unsigned __int16)(v131 & 0xC000) >> 8) >> 6) << 36) | v108;
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "advertisementFields"));
  Int64 = CFDictionaryGetInt64(v111, CFSTR("meD"), 0);

  v113 = v109 | 0x80;
  if (!Int64)
    v113 = v109;
  if (v113 == statusFlags)
  {
    v114 = v130;
    v115 = v35;
  }
  else
  {
    self->_statusFlags = v113;
    v115 = v35 | 2;
    v114 = v130;
  }
  v116 = (uint64_t)objc_msgSend(v5, "distance");
  if (v116 >= 21)
    v117 = 30;
  else
    v117 = 20;
  if (v116 < 11)
    v117 = 10;
  if (v117 != self->_proximity)
  {
    self->_proximity = v117;
    v115 |= 0x80u;
  }
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v119 = objc_msgSend(v118, "rssi");

  v120 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](v114, "bleDevice"));
  v121 = objc_msgSend(v120, "rssi");

  if (v119 == v121 || v119 == 0)
    v123 = v115;
  else
    v123 = v115 | 0x20;

  return v123;
}

- (BOOL)removeSFDevice:(id)a3
{
  SFDevice *bleDevice;
  NSDate *activityLevelTimeStamp;
  unint64_t statusFlags;

  bleDevice = self->_bleDevice;
  self->_bleDevice = 0;

  self->_activityLevel = 0;
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  self->_activityLevelTimeStamp = 0;

  statusFlags = self->_statusFlags;
  self->_statusFlags = statusFlags & 0xFFFFFFFFBFDFFCFDLL;
  return (statusFlags & 0x10001D) == 0;
}

- (unsigned)updateTrustStatusFlagsWithIdentity:(id)a3
{
  unint64_t statusFlags;
  unsigned int v5;
  unint64_t v6;

  statusFlags = self->_statusFlags;
  v5 = objc_msgSend(a3, "type") - 1;
  if (v5 > 0xE)
    return 0;
  if (((0x59ABu >> v5) & 1) == 0)
    return 0;
  v6 = statusFlags | qword_10010A270[v5];
  if (v6 == statusFlags)
    return 0;
  self->_statusFlags = v6;
  return 2;
}

- (unsigned)updateWithIdentity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t statusFlags;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString **p_name;
  NSString *name;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  unsigned __int8 v28;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    if (v7)
    {
      objc_storeStrong((id *)&self->_identifier, v7);
      v6 = 2;
    }
    else
    {
      v6 = 0;
    }

  }
  if (!self->_idsDeviceIdentifier)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    if (v8)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v8);
      v6 = 2;
    }

  }
  if (!self->_accountAltDSID)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountAltDSID"));
    if (v9)
    {
      objc_storeStrong((id *)&self->_accountAltDSID, v9);
      v6 |= 2u;
    }

  }
  if (!self->_accountID)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountID"));
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v6 |= 2u;
    }

  }
  if (!self->_contactID)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactID"));
    if (v11)
    {
      objc_storeStrong((id *)&self->_contactID, v11);
      v6 |= 2u;
    }

  }
  if (!self->_model)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
    if (v12)
    {
      objc_storeStrong((id *)&self->_model, v12);
      v6 |= 2u;
    }

  }
  statusFlags = self->_statusFlags;
  v14 = statusFlags | 2;
  switch(objc_msgSend(v5, "type"))
  {
    case 1u:
    case 2u:
      v15 = 524290;
      goto LABEL_36;
    case 3u:
    case 4u:
      v15 = 16386;
      goto LABEL_36;
    case 5u:
    case 6u:
      v15 = 131074;
      goto LABEL_36;
    case 7u:
    case 8u:
      v15 = 32770;
      goto LABEL_36;
    case 9u:
      v15 = 8194;
      goto LABEL_36;
    case 0xCu:
      v15 = 0x1000000002;
      goto LABEL_36;
    case 0xDu:
      v15 = 0x2000000002;
      goto LABEL_36;
    case 0xFu:
      v15 = 0x4000000002;
LABEL_36:
      v14 = statusFlags | v15;
      break;
    default:
      break;
  }
  v16 = -[NSString hasPrefix:](self->_model, "hasPrefix:", CFSTR("AppleTV"));
  v17 = v14 | 0x50800;
  if (!v16)
    v17 = v14;
  if (v17 != statusFlags)
  {
    self->_statusFlags = v17;
    v6 |= 2u;
  }
  if (!self->_idsDeviceIdentifier)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    if (v18)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v18);
      v6 |= 2u;
    }

  }
  if (!self->_mediaRemoteIdentifier)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRemoteID"));
    if (v19)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v19);
      v6 |= 2u;
    }

  }
  if (!self->_mediaRouteIdentifier)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaRouteID"));
    if (v20)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v20);
      v6 |= 2u;
    }

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v22 = v21;
  if (v21)
  {
    name = self->_name;
    p_name = &self->_name;
    v25 = v21;
    v26 = name;
    if (v25 == v26)
    {

    }
    else
    {
      v27 = v26;
      if (v26)
      {
        v28 = -[NSString isEqual:](v25, "isEqual:", v26);

        if ((v28 & 1) != 0)
          goto LABEL_61;
      }
      else
      {

      }
      objc_storeStrong((id *)p_name, v22);
      v6 |= 0x10u;
    }
  }
LABEL_61:

  return v6;
}

- (unsigned)updateWithCBDevice:(id)a3
{
  id v5;
  CBDevice *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v15;

  v5 = a3;
  v6 = self->_cbDevice;
  objc_storeStrong((id *)&self->_cbDevice, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleAdvertisementData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice bleAdvertisementData](v6, "bleAdvertisementData"));
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 0;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    v12 = 1;
  }
  else
  {
    v12 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
  }

  v13 = objc_msgSend(v5, "rssi");
  if (v13 == -[CBDevice rssi](v6, "rssi") || v13 == 0)
    v15 = v12;
  else
    v15 = v12 | 0x20;

  return v15;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *accountAltDSID;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  void *v14;
  NSString *identifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  NSString *idsDeviceIdentifier;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *model;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *name;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  unsigned int v43;
  id v44;
  unsigned __int8 v46;
  int v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountAltDSID"));
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  accountAltDSID = self->_accountAltDSID;
  v8 = v5;
  v9 = accountAltDSID;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (v9)
  {
    v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accountAltDSID, v6);
  v12 = 2;
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v14 = v13;
  v47 = v12;
  if (!v13)
    goto LABEL_18;
  identifier = self->_identifier;
  v16 = v13;
  v17 = identifier;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_identifier, v14);
    v47 = 2;
  }
LABEL_18:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
  v21 = v20;
  if (!v20)
    goto LABEL_26;
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  v23 = v20;
  v24 = idsDeviceIdentifier;
  if (v23 == v24)
  {

    goto LABEL_26;
  }
  v25 = v24;
  if (!v24)
  {

    goto LABEL_25;
  }
  v26 = -[NSString isEqual:](v23, "isEqual:", v24);

  if ((v26 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v21);
    v47 = 2;
  }
LABEL_26:
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v28 = v27;
  if (!v27)
    goto LABEL_34;
  v29 = v6;
  model = self->_model;
  v31 = v27;
  v32 = model;
  if (v31 == v32)
  {

    goto LABEL_34;
  }
  v33 = v32;
  if (!v32)
  {

    v6 = v29;
    goto LABEL_33;
  }
  v34 = -[NSString isEqual:](v31, "isEqual:", v32);

  v6 = v29;
  if ((v34 & 1) == 0)
  {
LABEL_33:
    objc_storeStrong((id *)&self->_model, v28);
    v47 = 2;
  }
LABEL_34:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v36 = v35;
  if (!v35)
  {
LABEL_41:
    v43 = v47;
    goto LABEL_44;
  }
  v37 = v14;
  v38 = v6;
  name = self->_name;
  v40 = v35;
  v41 = name;
  if (v40 == v41)
  {

LABEL_40:
    v6 = v38;
    v14 = v37;
    goto LABEL_41;
  }
  v42 = v41;
  if (v41)
  {
    v46 = -[NSString isEqual:](v40, "isEqual:", v41);

    if ((v46 & 1) == 0)
      goto LABEL_43;
    goto LABEL_40;
  }

LABEL_43:
  objc_storeStrong((id *)&self->_name, v36);
  v43 = v47 | 0x10;
  v6 = v38;
  v14 = v37;
LABEL_44:
  v44 = objc_msgSend(v4, "statusFlags");
  if (v44 != (id)self->_statusFlags)
  {
    self->_statusFlags = (unint64_t)v44;
    v43 |= 2u;
  }

  return v43;
}

- (BOOL)removeCBDevice:(id)a3
{
  CBDevice *cbDevice;
  unint64_t statusFlags;

  cbDevice = self->_cbDevice;
  self->_cbDevice = 0;

  statusFlags = self->_statusFlags;
  self->_statusFlags = statusFlags & 0xFFFFFFFFFFFFFFFDLL;
  return (statusFlags & 0x10001D) == 0;
}

- (BOOL)compareWithDeviceIdentifier:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  NSString *v11;
  NSString *idsDeviceIdentifier;
  NSString *v13;
  NSString *v14;
  unsigned __int8 v15;
  NSString *verifiedIdentity;
  NSString *v17;
  NSString *v18;
  unsigned __int8 v19;
  void *v20;
  NSString *v21;
  NSString *v22;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4;
  v7 = identifier;
  if (v7 == v6)
  {
    v10 = 1;
    v11 = v6;
LABEL_24:

    goto LABEL_25;
  }
  v8 = v7;
  if ((v6 == 0) != (v7 != 0))
  {
    v9 = -[NSString isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  v11 = v6;
  v13 = idsDeviceIdentifier;
  if (v13 == v11)
    goto LABEL_16;
  v14 = v13;
  if ((v6 == 0) != (v13 != 0))
  {
    v15 = -[NSString isEqual:](v11, "isEqual:", v13);

    if ((v15 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  verifiedIdentity = self->_verifiedIdentity;
  v11 = v11;
  v17 = verifiedIdentity;
  if (v17 == v11)
  {
LABEL_16:
    v10 = 1;
    goto LABEL_24;
  }
  v18 = v17;
  if ((v6 == 0) == (v17 != 0))
  {

    goto LABEL_18;
  }
  v19 = -[NSString isEqual:](v11, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_18:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice rapportIdentifier](self->_bleDevice, "rapportIdentifier"));
    v21 = v11;
    v22 = v20;
    v11 = v22;
    if (v22 == v21)
    {
      v10 = 1;
    }
    else if ((v6 == 0) == (v22 != 0))
    {
      v10 = 0;
    }
    else
    {
      v10 = -[NSString isEqual:](v21, "isEqual:", v22);
    }

    goto LABEL_24;
  }
LABEL_15:
  v10 = 1;
LABEL_25:

  return v10;
}

- (id)bleTargetData
{
  NSData *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;

  v3 = self->_encodedBLETargetData;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint bleDevice](self, "bleDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPEndpoint cbDevice](self, "cbDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));
    TypeID = CFDataGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("at"), TypeID, 0);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (!v3 && v6)
      v3 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nearbyInfoV2TempAuthTagData"));

  }
  return v3;
}

- (void)setActivityLevel:(int)a3
{
  self->_activityLevel = a3;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (NSArray)homeKitUserIdentifiers
{
  return self->_homeKitUserIdentifiers;
}

- (void)setHomeKitUserIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (void)setInDiscoverySession:(BOOL)a3
{
  self->_inDiscoverySession = a3;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (void)setMediaRemoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 128);
  return self;
}

- (void)setOperatingSystemVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v3;
}

- (int)proximity
{
  return self->_proximity;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_statusFlags = a3;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)verifiedIdentity
{
  return self->_verifiedIdentity;
}

- (void)setVerifiedIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSData)encodedBLETargetData
{
  return self->_encodedBLETargetData;
}

- (void)setEncodedBLETargetData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
  objc_storeStrong((id *)&self->_cbDevice, a3);
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
}

- (BOOL)cameraCapabilityRequestIsActive
{
  return self->_cameraCapabilityRequestIsActive;
}

- (void)setCameraCapabilityRequestIsActive:(BOOL)a3
{
  self->_cameraCapabilityRequestIsActive = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_idsDevice, a3);
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_nearbyActionV2Type = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (NSDictionary)verifiedAcl
{
  return self->_verifiedAcl;
}

- (void)setVerifiedAcl:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedAcl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDevice, 0);
  objc_storeStrong((id *)&self->_encodedBLETargetData, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_activityLevelTimeStamp, 0);
  objc_storeStrong((id *)&self->_verifiedAcl, 0);
  objc_storeStrong((id *)&self->_verifiedIdentity, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_cbDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
}

@end
