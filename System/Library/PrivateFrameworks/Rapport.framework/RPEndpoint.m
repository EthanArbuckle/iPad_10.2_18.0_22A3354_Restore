@implementation RPEndpoint

- (SFDevice)bleDevice
{
  return self->_bleDevice;
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

- (unint64_t)statusFlags
{
  return self->_statusFlags;
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
    -[RPEndpoint bleTargetData](self, "bleTargetData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v30, "encodeObject:forKey:", v29, CFSTR("bleTD"));

  }
}

- (NSString)identifier
{
  return self->_identifier;
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
  char v16;
  void *v17;
  void *v18;
  NSString *accountID;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  char v23;
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
  int v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  int v46;
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
  char v57;
  int v58;
  void *v59;
  void *v60;
  NSString *contactID;
  NSString *v62;
  NSString *v63;
  NSString *v64;
  char v65;
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
  char v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  char v85;
  NSString *v86;
  NSString *sourceVersion;
  unint64_t statusFlags;
  int v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  void *v98;
  void *v99;
  char v100;
  unint64_t v101;
  __CFString *v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  void *v107;
  void *v108;
  uint64_t Int64;
  unint64_t v110;
  SFDevice *v111;
  int v112;
  uint64_t v113;
  int v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  unsigned int v120;
  _BOOL4 v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  SFDevice *v127;
  unsigned int v128;
  IDSDevice *v129;
  uint64_t v130[3];
  __int128 v131;
  int64_t patchVersion;
  int v133;

  v5 = a3;
  v133 = 0;
  v6 = self->_bleDevice;
  objc_storeStrong((id *)&self->_bleDevice, a3);
  v129 = self->_idsDevice;
  v7 = objc_msgSend(v5, "deviceFlags");
  v8 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "accountAltDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  v128 = v7;
  objc_msgSend(v5, "accountID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
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

  objc_msgSend(v5, "bleDevice");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v126, "decryptedActivityLevel");
  if (v24 != 16 && self->_activityLevel != v24)
  {
    self->_activityLevel = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v25;

    v8 = 2;
  }
  objc_msgSend(v5, "bleDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "advertisementData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDevice bleDevice](v6, "bleDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "advertisementData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v5, "bleDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "advertisementFields");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");

  -[SFDevice bleDevice](v6, "bleDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "advertisementFields");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");

  objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, CFSTR("ch"));
  objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, CFSTR("ch"));
  v43 = v39;
  v44 = v42;
  v124 = v44;
  v125 = v43;
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
  objc_msgSend(v5, "bleDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "advertisementFields");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

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
  objc_msgSend(v5, "idsIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v5, "contactIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
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
    v66 = v129;
  }
  else
  {
    objc_msgSend(v5, "mediaRemoteID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v67);
      v35 |= 2u;
    }
    v66 = v129;

  }
  if (self->_mediaRouteIdentifier)
  {
    v122 = (v128 & 0x400) == 0;
  }
  else
  {
    objc_msgSend(v5, "mediaRouteID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v68);
      v35 |= 2u;
    }

    if (self->_mediaRouteIdentifier || (v128 & 0x400) == 0)
    {
      v122 = (v128 & 0x400) == 0;
    }
    else
    {
      objc_msgSend(v5, "rapportIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        objc_storeStrong((id *)&self->_mediaRouteIdentifier, v69);
        v35 |= 2u;
      }

      v122 = 0;
    }
  }
  v70 = self->_model;
  if (v70)
  {
    v71 = (__CFString *)v70;
    goto LABEL_82;
  }
  objc_msgSend(v5, "model");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v71)
    goto LABEL_81;
  -[IDSDevice modelIdentifier](v66, "modelIdentifier");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v5, "name");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (!v72)
    goto LABEL_90;
  name = self->_name;
  v75 = v72;
  v76 = name;
  if (v75 == v76)
  {

    v66 = v129;
    goto LABEL_90;
  }
  v77 = v76;
  if (!v76)
  {

    v66 = v129;
    goto LABEL_89;
  }
  v78 = -[NSString isEqual:](v75, "isEqual:", v76);

  v66 = v129;
  if ((v78 & 1) == 0)
  {
LABEL_89:
    objc_storeStrong((id *)&self->_name, v73);
    v35 |= 0x10u;
  }
LABEL_90:

  v131 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v131);
  v79 = objc_claimAutoreleasedReturnValue();
  v127 = v6;
  v123 = (void *)v79;
  if (!v66)
    goto LABEL_101;
  v80 = (void *)v79;
  -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
  RPNSOperatingSystemVersionToString(v130);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v80;
  v83 = v81;
  if (v82 == v83)
  {

    goto LABEL_98;
  }
  v84 = v83;
  if ((v82 == 0) == (v83 != 0))
  {

    goto LABEL_97;
  }
  v85 = objc_msgSend(v82, "isEqual:", v83);

  if ((v85 & 1) == 0)
  {
LABEL_97:
    v66 = v129;
    -[IDSDevice operatingSystemVersion](v129, "operatingSystemVersion");
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v131;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v35 |= 2u;
    goto LABEL_98;
  }
  v66 = v129;
LABEL_98:
  if (!self->_sourceVersion)
  {
    -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
    RPModelOSVersionToSourceVersionString();
    v86 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v86;

    if (self->_sourceVersion)
      v35 |= 2u;
  }
LABEL_101:
  statusFlags = self->_statusFlags;
  v89 = objc_msgSend(v5, "deviceActionType");
  v90 = -[IDSDevice supportsApplePay](v66, "supportsApplePay");
  v91 = 2;
  if (v90)
    v91 = 8388610;
  v92 = statusFlags & 0xFFFFFF7FF7DFFEFDLL | v91 & 0xFFFFFF7FFFFFFFFFLL | ((((unint64_t)(v128 & 0x80) >> 7) & 1) << 39);
  if ((v128 & 8) != 0 && v89 == 28)
    v94 = 0x200000;
  else
    v94 = 0;
  v95 = objc_msgSend(v5, "duetSync");
  v96 = 256;
  if (!v95)
    v96 = 0;
  v97 = v92 | v94 | v96 | ((unint64_t)(v89 == 29) << 27);
  objc_msgSend(v5, "bleDevice");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "advertisementFields");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = CFDictionaryGetInt64Ranged();

  if (!v133)
    v97 = v97 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v100 != 0) << 9);
  v101 = v97 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(v89 == 34) << 30);
  v102 = v71;
  v103 = -[__CFString hasPrefix:](v102, "hasPrefix:", CFSTR("AppleTV"));

  v104 = v101 | 0x50800;
  if (!v103)
    v104 = v101;
  if ((v128 & 8) != 0)
    v104 |= 0x80000uLL;
  v105 = v104 | (v128 << 13) & 0x4000 | (((v128 >> 2) & 1) << 17);
  if (!v122)
    v105 |= 0x8000uLL;
  v106 = (v128 << 7) & 0x2000 | ((unint64_t)(((unsigned __int16)(v128 & 0xC000) >> 8) >> 6) << 36) | v105;
  objc_msgSend(v5, "bleDevice");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "advertisementFields");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  Int64 = CFDictionaryGetInt64();

  v110 = v106 | 0x80;
  if (!Int64)
    v110 = v106;
  if (v110 == statusFlags)
  {
    v111 = v127;
    v112 = v35;
  }
  else
  {
    self->_statusFlags = v110;
    v112 = v35 | 2;
    v111 = v127;
  }
  v113 = objc_msgSend(v5, "distance");
  if (v113 >= 21)
    v114 = 30;
  else
    v114 = 20;
  if (v113 < 11)
    v114 = 10;
  if (v114 != self->_proximity)
  {
    self->_proximity = v114;
    v112 |= 0x80u;
  }
  objc_msgSend(v5, "bleDevice");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "rssi");

  -[SFDevice bleDevice](v111, "bleDevice");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v117, "rssi");

  if (v116 == v118 || v116 == 0)
    v120 = v112;
  else
    v120 = v112 | 0x20;

  return v120;
}

- (int)activityLevel
{
  return self->_activityLevel;
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

- (RPEndpoint)initWithCoder:(id)a3
{
  id v4;
  RPEndpoint *v5;
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
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  RPEndpoint *v27;
  objc_super v29;
  uint64_t v30;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RPEndpoint;
  v5 = -[RPEndpoint init](&v29, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v30 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_activityLevel = v30;
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v30 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_cameraState = v30;
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v30 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_hotspotInfo = v30;
    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v12;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("iLagS")))
      v5->_inDiscoverySession = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("iLagS"));

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
    NSDecodeObjectIfPresent();

    v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v19 = v18;
    if (objc_msgSend(v19, "containsValueForKey:", CFSTR("osma")))
      v5->_operatingSystemVersion.majorVersion = objc_msgSend(v19, "decodeIntegerForKey:", CFSTR("osma"));

    v20 = v19;
    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("osmi")))
      v5->_operatingSystemVersion.minorVersion = objc_msgSend(v20, "decodeIntegerForKey:", CFSTR("osmi"));

    v21 = v20;
    if (objc_msgSend(v21, "containsValueForKey:", CFSTR("osp")))
      v5->_operatingSystemVersion.patchVersion = objc_msgSend(v21, "decodeIntegerForKey:", CFSTR("osp"));

    v30 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_proximity = v30;
    v22 = v21;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v23 = v22;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v24 = v23;
    if (objc_msgSend(v24, "containsValueForKey:", CFSTR("sf")))
      v5->_statusFlags = objc_msgSend(v24, "decodeInt64ForKey:", CFSTR("sf"));

    v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v26 = v25;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    objc_opt_class();
    NSDecodeNSDictionaryOfClassesIfPresent();
    v27 = v5;
  }

  return v5;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setIdsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_idsDevice, a3);
}

- (NSString)model
{
  return self->_model;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (NSArray)homeKitUserIdentifiers
{
  return self->_homeKitUserIdentifiers;
}

- (NSString)accountID
{
  return self->_accountID;
}

+ (id)nullEndpoint
{
  if (nullEndpoint_sOnce != -1)
    dispatch_once(&nullEndpoint_sOnce, &__block_literal_global_5);
  return (id)nullEndpoint_sObj;
}

void __26__RPEndpoint_nullEndpoint__block_invoke()
{
  RPEndpoint *v0;
  void *v1;

  v0 = objc_alloc_init(RPEndpoint);
  v1 = (void *)nullEndpoint_sObj;
  nullEndpoint_sObj = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v8;
  NSString *name;
  id v10;
  NSString *model;
  id v12;
  NSString *accountAltDSID;
  id v14;
  NSString *accountID;
  id v16;
  id v17;
  id v18;
  NSArray *homeKitUserIdentifiers;
  id v20;
  NSString *idsDeviceIdentifier;
  id v22;
  NSString *contactID;
  id v24;
  NSString *mediaRemoteIdentifier;
  id v26;
  NSString *mediaRouteIdentifier;
  id v28;
  id v29;
  NSString *verifiedIdentity;
  id v31;
  NSString *sourceVersion;
  id v33;
  id v35;
  NSString *serviceType;
  id v37;
  id v38;
  NSDate *activityLevelTimeStamp;
  id v40;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  void *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  NSDate *v49;
  NSString *v50;
  NSString *v51;
  NSArray *v52;
  NSString *v53;
  NSString *v54;
  NSString *v55;
  NSString *v56;
  __int128 v57;
  int64_t patchVersion;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;

  v72 = 0;
  NSAppendPrintF();
  v5 = 0;
  v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    v71 = v5;
    v42 = identifier;
    NSAppendPrintF();
    v8 = v71;

    v6 = v8;
  }
  if (shouldPrintSensitiveData())
  {
    name = self->_name;
    if (name)
    {
      v70 = v6;
      v43 = name;
      NSAppendPrintF();
      v10 = v6;

      v6 = v10;
    }
    model = self->_model;
    if (model)
    {
      v69 = v6;
      v44 = model;
      NSAppendPrintF();
      v12 = v6;

      v6 = v12;
    }
    accountAltDSID = self->_accountAltDSID;
    if (accountAltDSID)
    {
      v68 = v6;
      v50 = accountAltDSID;
      NSAppendPrintF();
      v14 = v6;

      v6 = v14;
    }
    accountID = self->_accountID;
    if (accountID)
    {
      v67 = v6;
      v51 = accountID;
      NSAppendPrintF();
      v16 = v6;

      v6 = v16;
    }
    if (self->_activityLevel)
    {
      v66 = v6;
      NSAppendPrintF();
      v17 = v6;

      v6 = v17;
    }
    if (self->_cameraState)
    {
      v65 = v6;
      NSAppendPrintF();
      v18 = v6;

      v6 = v18;
    }
    homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
    if (homeKitUserIdentifiers)
    {
      v64 = v6;
      v52 = homeKitUserIdentifiers;
      NSAppendPrintF();
      v20 = v6;

      v6 = v20;
    }
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    if (idsDeviceIdentifier)
    {
      v63 = v6;
      v53 = idsDeviceIdentifier;
      NSAppendPrintF();
      v22 = v6;

      v6 = v22;
    }
    contactID = self->_contactID;
    if (contactID)
    {
      v62 = v6;
      v54 = contactID;
      NSAppendPrintF();
      v24 = v6;

      v6 = v24;
    }
    mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
    if (mediaRemoteIdentifier)
    {
      v61 = v6;
      v55 = mediaRemoteIdentifier;
      NSAppendPrintF();
      v26 = v6;

      v6 = v26;
    }
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      v60 = v6;
      v56 = mediaRouteIdentifier;
      NSAppendPrintF();
      v28 = v6;

      v6 = v28;
    }
    if (self->_operatingSystemVersion.majorVersion)
    {
      v59 = v6;
      v57 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
      patchVersion = self->_operatingSystemVersion.patchVersion;
      RPNSOperatingSystemVersionToString((uint64_t *)&v57);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF();
      v29 = v59;

      v6 = v29;
    }
    verifiedIdentity = self->_verifiedIdentity;
    if (verifiedIdentity)
    {
      v46 = verifiedIdentity;
      NSAppendPrintF();
      v31 = v6;

      v6 = v31;
    }
    sourceVersion = self->_sourceVersion;
    if (sourceVersion)
    {
      v47 = sourceVersion;
      NSAppendPrintF();
      v33 = v6;

      v6 = v33;
    }
    if (self->_proximity)
    {
      NSAppendPrintF();
      v35 = v6;

      v6 = v35;
    }
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v48 = serviceType;
    NSAppendPrintF();
    v37 = v6;

    v6 = v37;
  }
  if (self->_statusFlags)
  {
    NSAppendPrintF();
    v38 = v6;

    v6 = v38;
  }
  if (a3 >= 20)
  {
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v49 = activityLevelTimeStamp;
      NSAppendPrintF();
      v40 = v6;

      v6 = v40;
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
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSString *name;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  unint64_t Int64;
  unint64_t statusFlags;
  int v31;
  uint64_t v32;
  uint64x2_t v33;
  int8x16_t v34;
  unint64_t v35;
  uint64_t v37;
  char v38;
  void *v39;
  uint64_t v40[3];
  __int128 v41;
  int64_t patchVersion;

  v5 = a3;
  objc_msgSend(v5, "txtDictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
  objc_msgSend(v5, "deviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  v9 = self->_idsDevice;
  v10 = self->_model;
  v37 = Int64Ranged;
  if (v10)
  {
    v11 = v10;
LABEL_3:
    v12 = 0;
    goto LABEL_7;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[IDSDevice modelIdentifier](v9, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_3;
  }
  objc_storeStrong((id *)&self->_model, v11);
  v12 = 2;
LABEL_7:
  objc_msgSend(v5, "name", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v39 = (void *)v6;
  if (!v13)
    goto LABEL_15;
  name = self->_name;
  v16 = v13;
  v17 = name;
  if (v16 == v17)
  {

    goto LABEL_15;
  }
  v18 = v17;
  if (!v17)
  {

    goto LABEL_14;
  }
  v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_14:
    objc_storeStrong((id *)&self->_name, v14);
    v12 |= 0x10u;
  }
LABEL_15:
  v41 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_23;
  -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
  RPNSOperatingSystemVersionToString(v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  if (v22 == v23)
  {

    goto LABEL_23;
  }
  v24 = v23;
  if ((v22 == 0) == (v23 != 0))
  {

    goto LABEL_22;
  }
  v25 = objc_msgSend(v22, "isEqual:", v23);

  if ((v25 & 1) == 0)
  {
LABEL_22:
    -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v41;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v12 |= 2u;
  }
LABEL_23:
  v26 = self->_sourceVersion;
  if (v26)
  {
    v27 = v26;
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v28 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v28;
    if (v9 && !v28)
    {
      -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
      RPModelOSVersionToSourceVersionString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v27)
    {
      objc_storeStrong((id *)&self->_sourceVersion, v27);
      v12 |= 2u;
    }
  }
  Int64 = CFDictionaryGetInt64();
  statusFlags = self->_statusFlags;
  v31 = -[IDSDevice supportsApplePay](v9, "supportsApplePay");
  v32 = 4;
  if (v31)
    v32 = 8388612;
  v33 = (uint64x2_t)vdupq_n_s64(Int64);
  v34 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1AF307470), (int8x16_t)xmmword_1AF3074A0), vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1AF307480), (int8x16_t)xmmword_1AF307490));
  v35 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v34.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL)) | statusFlags & 0xFFFFFFF27EBAF7FBLL | (Int64 >> 2) & 0x800 | (4 * (_DWORD)Int64) & 0x50000 | (Int64 << 11) & 0x400000000 | ((unint64_t)((v38 & 0x18) != 0) << 24) | v32;
  if (v35 != statusFlags)
  {
    self->_statusFlags = v35;
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
  objc_msgSend(v5, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = CFDictionaryGetInt64Ranged();
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
  char v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSString *name;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  NSString **p_sourceVersion;
  NSString *sourceVersion;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  uint64_t v36[3];
  __int128 v37;
  int64_t patchVersion;

  v4 = a3;
  objc_msgSend(v4, "deviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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

  objc_msgSend(v4, "deviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
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

  v37 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  if (v22 == v23)
  {

    goto LABEL_25;
  }
  v24 = v23;
  if ((v22 == 0) == (v23 != 0))
  {

    goto LABEL_24;
  }
  v25 = objc_msgSend(v22, "isEqual:", v23);

  if ((v25 & 1) == 0)
  {
LABEL_24:
    objc_msgSend(v4, "productVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    RPStringToOperatingSystemVersion(v26, &v37);
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v37;
    self->_operatingSystemVersion.patchVersion = patchVersion;

    v12 |= 2u;
  }
LABEL_25:
  objc_msgSend(v4, "productVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  RPStringToOperatingSystemVersion(v27, v36);
  RPModelOSVersionToSourceVersionString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    sourceVersion = self->_sourceVersion;
    p_sourceVersion = &self->_sourceVersion;
    v31 = v28;
    v32 = sourceVersion;
    if (v31 == v32)
    {

    }
    else
    {
      v33 = v32;
      if (v32)
      {
        v34 = -[NSString isEqual:](v31, "isEqual:", v32);

        if ((v34 & 1) != 0)
          goto LABEL_33;
      }
      else
      {

      }
      objc_storeStrong((id *)p_sourceVersion, v28);
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
  char v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  NSString *model;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  void *v22;
  void *v23;
  NSString *name;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  NSString *v35;
  NSString *sourceVersion;
  unint64_t statusFlags;
  int v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  int64_t patchVersion;

  v5 = a3;
  objc_storeStrong((id *)&self->_idsDevice, a3);
  objc_msgSend(v5, "uniqueIDOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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

  objc_msgSend(v5, "modelIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
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

  objc_msgSend(v5, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
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

  v48 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v48);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
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
  RPNSOperatingSystemVersionToString(&v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29;
  v32 = v30;
  if (v31 == v32)
  {

    goto LABEL_39;
  }
  v33 = v32;
  if ((v31 == 0) != (v32 != 0))
  {
    v34 = objc_msgSend(v31, "isEqual:", v32);

    if ((v34 & 1) != 0)
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
    v48 = 0uLL;
    patchVersion = 0;
  }
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v48;
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
      v42 = 0;
      v43 = 0;
      v44 = 0;
    }
    RPModelOSVersionToSourceVersionString();
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v35;

    if (self->_sourceVersion)
      v13 |= 2u;
  }
  statusFlags = self->_statusFlags;
  v38 = objc_msgSend(v5, "supportsApplePay", v42, v43, v44, v45, v46, v47);
  v39 = 1572864;
  if (v38)
    v39 = 9961472;
  v40 = v39 | statusFlags;
  if (v40 != statusFlags)
  {
    self->_statusFlags = v40;
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
  v6 = statusFlags | qword_1AF307680[v5];
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
  _BOOL4 v16;
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
  char v28;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v5, "idsDeviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v8);
      v6 = 2;
    }

  }
  if (!self->_accountAltDSID)
  {
    objc_msgSend(v5, "accountAltDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&self->_accountAltDSID, v9);
      v6 |= 2u;
    }

  }
  if (!self->_accountID)
  {
    objc_msgSend(v5, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v6 |= 2u;
    }

  }
  if (!self->_contactID)
  {
    objc_msgSend(v5, "contactID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_storeStrong((id *)&self->_contactID, v11);
      v6 |= 2u;
    }

  }
  if (!self->_model)
  {
    objc_msgSend(v5, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v5, "idsDeviceID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v18);
      v6 |= 2u;
    }

  }
  if (!self->_mediaRemoteIdentifier)
  {
    objc_msgSend(v5, "mediaRemoteID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v19);
      v6 |= 2u;
    }

  }
  if (!self->_mediaRouteIdentifier)
  {
    objc_msgSend(v5, "mediaRouteID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v20);
      v6 |= 2u;
    }

  }
  objc_msgSend(v5, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v12;
  int v13;
  unsigned int v15;

  v5 = a3;
  v6 = self->_cbDevice;
  objc_storeStrong((id *)&self->_cbDevice, a3);
  objc_msgSend(v5, "bleAdvertisementData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDevice bleAdvertisementData](v6, "bleAdvertisementData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v11;
  int v12;
  void *v13;
  void *v14;
  NSString *identifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  void *v20;
  void *v21;
  NSString *idsDeviceIdentifier;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *model;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *name;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  unsigned int v43;
  unint64_t v44;
  char v46;
  int v47;

  v4 = a3;
  objc_msgSend(v4, "accountAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v4, "idsDeviceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v4, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v4, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
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
  if (v44 != self->_statusFlags)
  {
    self->_statusFlags = v44;
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
  char v9;
  char v10;
  NSString *v11;
  NSString *idsDeviceIdentifier;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *verifiedIdentity;
  NSString *v17;
  NSString *v18;
  char v19;
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
    -[SFDevice rapportIdentifier](self->_bleDevice, "rapportIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
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

  v3 = self->_encodedBLETargetData;
  if (!v3)
  {
    -[RPEndpoint bleDevice](self, "bleDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bleDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPEndpoint cbDevice](self, "cbDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "advertisementFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

    if (!v3 && v6)
    {
      objc_msgSend(v6, "nearbyInfoV2TempAuthTagData");
      v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }

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

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (void)setHomeKitUserIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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

- (void)setMediaRemoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setMediaRouteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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

@end
