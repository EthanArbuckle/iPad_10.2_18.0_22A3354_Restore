@implementation NRDLocalDevice

- (NRDLocalDevice)init
{
  NRDLocalDevice *v2;

  v2 = (NRDLocalDevice *)sub_10012B894(self);
  sub_10012A944(v2);
  return v2;
}

- (void)setIsEmptyPairing:(BOOL)a3
{
  if (self->_isEmptyPairing != a3)
  {
    self->_isEmptyPairing = a3;
    if (a3)
      sub_10012B68C(self);
    else
      sub_10012A944(self);
  }
}

- (void)dealloc
{
  objc_super v3;

  sub_10012B68C(self);
  v3.receiver = self;
  v3.super_class = (Class)NRDLocalDevice;
  -[NRDLocalDevice dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned __int8 v14;
  id v15;

  v15 = a5;
  v7 = sub_10014CFBC();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {

    v8 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {

    v11 = 0;
  }
  if (v8 != v11)
  {
    v14 = objc_msgSend(v8, "isEqual:", v11);
    if (self)
    {
      if ((v14 & 1) == 0)
        self->_isChanged = 1;
    }
  }

}

- (id)description
{
  id v3;
  void *v4;
  NSUUID *bluetoothUUID;
  void *v6;
  void *v8;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("NRDLD["));
  if (-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"))
    objc_msgSend(v3, "appendString:", CFSTR("empty pairing:"));
  if (self)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_nrUUID, "UUIDString"));
    objc_msgSend(v3, "appendString:", v4);

    if (self->_isRegistered)
      objc_msgSend(v3, "appendString:", CFSTR(", R"));
    if (self->_isEphemeral)
      objc_msgSend(v3, "appendString:", CFSTR(", Epml"));
    if (self->_isEnabled)
      objc_msgSend(v3, "appendString:", CFSTR(", E"));
    if (self->_wasInitiallySetupUsingIDSPairing)
      objc_msgSend(v3, "appendString:", CFSTR(", IDS"));
    bluetoothUUID = self->_bluetoothUUID;
    if (bluetoothUUID)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](bluetoothUUID, "UUIDString"));
      objc_msgSend(v3, "appendFormat:", CFSTR(", BT<%@>"), v6);

    }
    if (self->_idsDeviceID)
      objc_msgSend(v3, "appendFormat:", CFSTR(", IDSDeviceID<%@>"), self->_idsDeviceID);
    if (self->_isAltAccountDevice)
      objc_msgSend(v3, "appendFormat:", CFSTR(", ALT-ACC"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "UUIDString"));
    objc_msgSend(v3, "appendString:", v8);

  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  NSString *idsDeviceID;
  id v11;
  void *v12;
  id v13;
  BOOL isChanged;
  _BOOL8 isEnabled;
  NSString *lastSeenName;
  id v17;
  id v18;
  _BOOL8 lastSeenAlwaysOnWiFiSupported;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NRDDeviceIdentity *remoteIdentity;
  id v26;
  NRDLDDataClassKeychainItems *classDKeychainItems;
  NRDLDDataClassKeychainItems *v28;
  id v29;
  void *v30;
  NRDLDDataClassKeychainItems *v31;
  id v32;
  void *v33;
  NRDLDDataClassKeychainItems *classAKeychainItemsLegacyOnly;
  NRDLDDataClassKeychainItems *v35;
  id v36;
  void *v37;
  NRDLDKeychainItemData *v38;
  id v39;
  void *v40;
  _BOOL8 hasConfirmedClassAKeys;
  NRDeviceOperationalProperties *operationalProp;
  id v43;
  NSData *bluetoothMACAddress;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  BOOL v55;
  id v57;
  int IsLevelEnabled;
  id v59;
  int *v60;
  uint64_t v61;
  id v62;
  id v63;
  unsigned __int8 v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;

  v5 = objc_autoreleasePoolPush();
  v6 = (char *)objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  if (self)
  {
    v7 = sub_10012A18C(v6, self->_nrUUID);
    if (v7)
      goto LABEL_3;
LABEL_31:
    v57 = sub_100128400();
    IsLevelEnabled = _NRLogIsLevelEnabled(v57, 16);

    self = (NRDLocalDevice *)"-[NRDLocalDevice copyWithZone:]";
    if (IsLevelEnabled)
    {
      v59 = sub_100128400();
      _NRLogWithArgs(v59, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (newDevice) != ((void *)0)", ", "-[NRDLocalDevice copyWithZone:]", 1905);

    }
    v5 = (void *)_os_log_pack_size(12);
    v8 = (char *)&v72 - (((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v60 = __error();
    v61 = _os_log_pack_fill(v8, v5, *v60, &_mh_execute_header, "%{public}s Assertion Failed: (newDevice) != ((void *)0)");
    *(_DWORD *)v61 = 136446210;
    *(_QWORD *)(v61 + 4) = "-[NRDLocalDevice copyWithZone:]";
    v62 = sub_100128400();
    _NRLogAbortWithPack(v62, v8);
    goto LABEL_34;
  }
  v7 = sub_10012A18C(v6, 0);
  if (!v7)
    goto LABEL_31;
LABEL_3:
  v8 = v7;
  if (self)
  {
    v9 = -[NSUUID copy](self->_bluetoothUUID, "copy");
    objc_msgSend(v8, "setBluetoothUUID:", v9);

    idsDeviceID = self->_idsDeviceID;
    goto LABEL_5;
  }
LABEL_34:
  v63 = objc_msgSend(0, "copy");
  objc_msgSend(v8, "setBluetoothUUID:", v63);

  idsDeviceID = 0;
LABEL_5:
  v11 = -[NSString copy](idsDeviceID, "copy");
  objc_msgSend(v8, "setIdsDeviceID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateCreated](self, "dateCreated"));
  v13 = objc_msgSend(v12, "copy");
  objc_msgSend(v8, "setDateCreated:", v13);

  objc_msgSend(v8, "setIsEmptyPairing:", -[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"));
  if (self)
  {
    v8[24] = self->_isEphemeral;
    if (objc_msgSend(v8, "isEmptyPairing"))
    {
      isChanged = self->_isChanged;
LABEL_8:
      v8[21] = isChanged;
      goto LABEL_29;
    }
    objc_msgSend(v8, "setIsRegistered:", self->_isRegistered);
    isEnabled = self->_isEnabled;
  }
  else
  {
    v8[24] = 0;
    v64 = objc_msgSend(v8, "isEmptyPairing");
    isChanged = 0;
    if ((v64 & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v8, "setIsRegistered:", 0);
    isEnabled = 0;
  }
  objc_msgSend(v8, "setIsEnabled:", isEnabled);
  objc_msgSend(v8, "setPairingProtocolVersion:", -[NRDLocalDevice pairingProtocolVersion](self, "pairingProtocolVersion"));
  if (self)
  {
    objc_msgSend(v8, "setLastSeenInnerLinkVersionHBO:", self->_lastSeenInnerLinkVersionHBO);
    lastSeenName = self->_lastSeenName;
  }
  else
  {
    objc_msgSend(v8, "setLastSeenInnerLinkVersionHBO:", 0);
    lastSeenName = 0;
  }
  v17 = -[NSString copy](lastSeenName, "copy");
  objc_msgSend(v8, "setLastSeenName:", v17);

  if (self)
  {
    v18 = -[NSString copy](self->_lastSeenBuildVersion, "copy");
    objc_msgSend(v8, "setLastSeenBuildVersion:", v18);

    objc_msgSend(v8, "setWasInitiallySetupUsingIDSPairing:", self->_wasInitiallySetupUsingIDSPairing);
    objc_msgSend(v8, "setIsAltAccountDevice:", self->_isAltAccountDevice);
    lastSeenAlwaysOnWiFiSupported = self->_lastSeenAlwaysOnWiFiSupported;
  }
  else
  {
    v65 = objc_msgSend(0, "copy");
    objc_msgSend(v8, "setLastSeenBuildVersion:", v65);

    objc_msgSend(v8, "setWasInitiallySetupUsingIDSPairing:", 0);
    objc_msgSend(v8, "setIsAltAccountDevice:", 0);
    lastSeenAlwaysOnWiFiSupported = 0;
  }
  objc_msgSend(v8, "setLastSeenAlwaysOnWiFiSupported:", lastSeenAlwaysOnWiFiSupported);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateRegistered](self, "dateRegistered"));
  v21 = objc_msgSend(v20, "copy");
  objc_msgSend(v8, "setDateRegistered:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateEnabled](self, "dateEnabled"));
  v23 = objc_msgSend(v22, "copy");
  objc_msgSend(v8, "setDateEnabled:", v23);

  if (self)
  {
    v24 = -[NSUUID copy](self->_localIdentity, "copy");
    objc_msgSend(v8, "setLocalIdentity:", v24);

    remoteIdentity = self->_remoteIdentity;
  }
  else
  {
    v66 = objc_msgSend(0, "copy");
    objc_msgSend(v8, "setLocalIdentity:", v66);

    remoteIdentity = 0;
  }
  v26 = -[NRDDeviceIdentity copy](remoteIdentity, "copy");
  objc_msgSend(v8, "setRemoteIdentity:", v26);

  if (self)
  {
    objc_msgSend(v8, "setHasAuthenticatedWithIdentity:", self->_hasAuthenticatedWithIdentity);
    classDKeychainItems = self->_classDKeychainItems;
  }
  else
  {
    objc_msgSend(v8, "setHasAuthenticatedWithIdentity:", 0);
    classDKeychainItems = 0;
  }
  v28 = classDKeychainItems;
  v29 = -[NRDLDDataClassKeychainItems copy](v28, "copy");
  v30 = (void *)*((_QWORD *)v8 + 9);
  *((_QWORD *)v8 + 9) = v29;

  if (self)
  {
    v31 = self->_classCKeychainItems;
    v32 = -[NRDLDDataClassKeychainItems copy](v31, "copy");
    v33 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v32;

    classAKeychainItemsLegacyOnly = self->_classAKeychainItemsLegacyOnly;
  }
  else
  {
    v67 = objc_msgSend(0, "copy");
    v68 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v67;

    classAKeychainItemsLegacyOnly = 0;
  }
  v35 = classAKeychainItemsLegacyOnly;
  v36 = -[NRDLDDataClassKeychainItems copy](v35, "copy");
  v37 = (void *)*((_QWORD *)v8 + 11);
  *((_QWORD *)v8 + 11) = v36;

  if (self)
  {
    v38 = self->_outOfBandKeychainItem;
    v39 = -[NRDLDKeychainItemData copy](v38, "copy");
    v40 = (void *)*((_QWORD *)v8 + 19);
    *((_QWORD *)v8 + 19) = v39;

    objc_msgSend(v8, "setHasConfirmedClassDKeys:", self->_hasConfirmedClassDKeys);
    objc_msgSend(v8, "setHasConfirmedClassCKeys:", self->_hasConfirmedClassCKeys);
    hasConfirmedClassAKeys = self->_hasConfirmedClassAKeys;
  }
  else
  {
    v69 = objc_msgSend(0, "copy");
    v70 = (void *)*((_QWORD *)v8 + 19);
    *((_QWORD *)v8 + 19) = v69;

    objc_msgSend(v8, "setHasConfirmedClassDKeys:", 0);
    objc_msgSend(v8, "setHasConfirmedClassCKeys:", 0);
    hasConfirmedClassAKeys = 0;
  }
  objc_msgSend(v8, "setHasConfirmedClassAKeys:", hasConfirmedClassAKeys);
  objc_msgSend(v8, "setHasSavedClassCKeysInKeychain:", -[NRDLocalDevice hasSavedClassCKeysInKeychain](self, "hasSavedClassCKeysInKeychain"));
  if (self)
  {
    objc_msgSend(v8, "setDeviceType:", self->_deviceType);
    operationalProp = self->_operationalProp;
  }
  else
  {
    objc_msgSend(v8, "setDeviceType:", 0);
    operationalProp = 0;
  }
  v43 = -[NRDeviceOperationalProperties copy](operationalProp, "copy");
  objc_msgSend(v8, "setOperationalProp:", v43);

  if (self)
  {
    objc_msgSend(v8, "setLocalFlags:", self->_localFlags);
    objc_msgSend(v8, "setRemoteFlags:", self->_remoteFlags);
    bluetoothMACAddress = self->_bluetoothMACAddress;
  }
  else
  {
    objc_msgSend(v8, "setLocalFlags:", 0);
    objc_msgSend(v8, "setRemoteFlags:", 0);
    bluetoothMACAddress = 0;
  }
  v45 = -[NSData copy](bluetoothMACAddress, "copy");
  objc_msgSend(v8, "setBluetoothMACAddress:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassD](self, "localInnerIPv6AddressBytesClassD"));
  v47 = objc_msgSend(v46, "copy");
  objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassD:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassD](self, "remoteInnerIPv6AddressBytesClassD"));
  v49 = objc_msgSend(v48, "copy");
  objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassD:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassC](self, "localInnerIPv6AddressBytesClassC"));
  v51 = objc_msgSend(v50, "copy");
  objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassC:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassC](self, "remoteInnerIPv6AddressBytesClassC"));
  v53 = objc_msgSend(v52, "copy");
  objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassC:", v53);

  if (self)
  {
    v54 = -[NSData copy](self->_receivedProxyNotifyPayload, "copy");
    objc_msgSend(v8, "setReceivedProxyNotifyPayload:", v54);

    v55 = self->_isChanged;
  }
  else
  {
    v71 = objc_msgSend(0, "copy");
    objc_msgSend(v8, "setReceivedProxyNotifyPayload:", v71);

    v55 = 0;
  }
  v8[21] = v55;
  sub_10012A944(v8);
LABEL_29:
  objc_autoreleasePoolPop(v5);
  return v8;
}

- (NRDLocalDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NRDLocalDevice *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  _QWORD *v74;
  void *v75;
  id v76;
  void *v77;
  char *v78;
  void *v79;
  id v81;
  int IsLevelEnabled;
  id v83;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("nrUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    v81 = sub_100128400();
    IsLevelEnabled = _NRLogIsLevelEnabled(v81, 17);

    if (IsLevelEnabled)
    {
      v83 = sub_100128400();
      _NRLogWithArgs(v83, 17, "%s called with null nrUUID", "-[NRDLocalDevice initWithCoder:]");

    }
    v15 = 0;
    goto LABEL_6;
  }
  v8 = sub_10012A18C((char *)self, v7);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("bluetoothUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setBluetoothUUID:", v10);

  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("idsDeviceID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "setIdsDeviceID:", v12);

  v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("dateCreated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v8, "setDateCreated:", v14);

  objc_msgSend(v8, "setIsEmptyPairing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmptyPairing")));
  if (objc_msgSend(v8, "isEmptyPairing"))
  {
    if (v8)
      v8[21] = 0;
    self = v8;
    v15 = self;
LABEL_6:

    objc_autoreleasePoolPop(v5);
    goto LABEL_62;
  }
  objc_msgSend(v8, "setIsRegistered:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRegistered")));
  objc_msgSend(v8, "setIsEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled")));
  objc_msgSend(v8, "setPairingProtocolVersion:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pairingProtocolVersion")));
  objc_msgSend(v8, "setLastSeenInnerLinkVersionHBO:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lastSeenInnerLinkVersionHBO")));
  v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("lastSeenName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v8, "setLastSeenName:", v17);

  v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("lastSeenBuildVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v8, "setLastSeenBuildVersion:", v19);

  objc_msgSend(v8, "setWasInitiallySetupUsingIDSPairing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasInitiallySetupUsingIDSPairing")));
  objc_msgSend(v8, "setIsAltAccountDevice:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAltAccountDevice")));
  objc_msgSend(v8, "setLastSeenAlwaysOnWiFiSupported:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lastSeenAlwaysOnWiFiSupported")));
  v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("dateRegistered"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v8, "setDateRegistered:", v21);

  v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("dateEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v8, "setDateEnabled:", v23);

  v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("localIdentity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v8, "setLocalIdentity:", v25);

  v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NRDDeviceIdentity), CFSTR("remoteIdentity"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v8, "setRemoteIdentity:", v27);

  objc_msgSend(v8, "setHasAuthenticatedWithIdentity:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAuthenticatedWithIdentity")));
  objc_msgSend(v8, "setHasConfirmedClassDKeys:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmedClassDKeys")));
  objc_msgSend(v8, "setHasConfirmedClassCKeys:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmedClassCKeys")));
  objc_msgSend(v8, "setHasConfirmedClassAKeys:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConfirmedClassAKeys")));
  objc_msgSend(v8, "setHasSavedClassCKeysInKeychain:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSavedClassCKeysInKeychain")));
  objc_msgSend(v8, "setDeviceType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("deviceType")));
  v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NRDeviceOperationalProperties), CFSTR("operationalProp"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v8, "setOperationalProp:", v29);

  objc_msgSend(v8, "setLocalFlags:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("localFlags")));
  objc_msgSend(v8, "setRemoteFlags:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("remoteFlags")));
  v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("bluetoothMACAddress"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = v31;
  if (v31)
  {
    v33 = v31;
    v34 = objc_msgSend(v33, "length");
    if (v34)
      v35 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v33, "bytes"), v34);
    else
      v35 = objc_alloc_init((Class)NSData);
    v36 = v35;

    objc_msgSend(v8, "setBluetoothMACAddress:", v36);
  }
  else
  {
    objc_msgSend(v8, "setBluetoothMACAddress:", 0);
  }

  v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("localInnerIPv6AddressBytesClassD"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = v38;
  if (v38)
  {
    v40 = v38;
    v41 = objc_msgSend(v40, "length");
    if (v41)
      v42 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v40, "bytes"), v41);
    else
      v42 = objc_alloc_init((Class)NSData);
    v43 = v42;

    objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassD:", v43);
  }
  else
  {
    objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassD:", 0);
  }

  v44 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("remoteInnerIPv6AddressBytesClassD"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = v45;
  if (v45)
  {
    v47 = v45;
    v48 = objc_msgSend(v47, "length");
    if (v48)
      v49 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v47, "bytes"), v48);
    else
      v49 = objc_alloc_init((Class)NSData);
    v50 = v49;

    objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassD:", v50);
  }
  else
  {
    objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassD:", 0);
  }

  v51 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("localInnerIPv6AddressBytesClassC"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = v52;
  if (v52)
  {
    v54 = v52;
    v55 = objc_msgSend(v54, "length");
    if (v55)
      v56 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v54, "bytes"), v55);
    else
      v56 = objc_alloc_init((Class)NSData);
    v57 = v56;

    objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassC:", v57);
  }
  else
  {
    objc_msgSend(v8, "setLocalInnerIPv6AddressBytesClassC:", 0);
  }

  v58 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("remoteInnerIPv6AddressBytesClassC"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = v59;
  if (v59)
  {
    v61 = v59;
    v62 = objc_msgSend(v61, "length");
    if (v62)
      v63 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v61, "bytes"), v62);
    else
      v63 = objc_alloc_init((Class)NSData);
    v64 = v63;

    objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassC:", v64);
  }
  else
  {
    objc_msgSend(v8, "setRemoteInnerIPv6AddressBytesClassC:", 0);
  }

  v65 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("receivedProxyNotifyPayload"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  v67 = v66;
  if (v66)
  {
    v68 = v66;
    v69 = objc_msgSend(v68, "length");
    if (v69)
      v70 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v68, "bytes"), v69);
    else
      v70 = objc_alloc_init((Class)NSData);
    v71 = v70;

    objc_msgSend(v8, "setReceivedProxyNotifyPayload:", v71);
  }
  else
  {
    objc_msgSend(v8, "setReceivedProxyNotifyPayload:", 0);
  }

  v72 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NRDLDKeys), CFSTR("classDKeys"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  if (v73)
  {
    if (qword_1001E4A98 != -1)
      dispatch_once(&qword_1001E4A98, &stru_1001B8730);
    if (_NRLogIsLevelEnabled(qword_1001E4A90, 0))
    {
      if (qword_1001E4A98 != -1)
        dispatch_once(&qword_1001E4A98, &stru_1001B8730);
      _NRLogWithArgs(qword_1001E4A90, 0, "%s%.30s:%-4d Migrating legacy ClassD keys for %@", ", "-[NRDLocalDevice initWithCoder:]", 2024, v8);
    }
    v74 = sub_10012A370([NRDLDDataClassKeychainItems alloc], v73);
    if (v8)
    {
      v75 = (void *)*((_QWORD *)v8 + 9);
      *((_QWORD *)v8 + 9) = v74;

      v8[21] = 1;
    }
    else
    {

    }
  }
  v76 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("outOfBandKey"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  if (v77)
  {
    if (qword_1001E4A98 != -1)
      dispatch_once(&qword_1001E4A98, &stru_1001B8730);
    if (_NRLogIsLevelEnabled(qword_1001E4A90, 0))
    {
      if (qword_1001E4A98 != -1)
        dispatch_once(&qword_1001E4A98, &stru_1001B8730);
      _NRLogWithArgs(qword_1001E4A90, 0, "%s%.30s:%-4d Migrating legacy OOBK key for %@", ", "-[NRDLocalDevice initWithCoder:]", 2032, v8);
    }
    v78 = sub_10012A76C((char *)[NRDLDKeychainItemData alloc], v77);
    if (v8)
    {
      v79 = (void *)*((_QWORD *)v8 + 19);
      *((_QWORD *)v8 + 19) = v78;

      v8[21] = 1;
    }
    else
    {

    }
  }
  sub_10012A944(v8);

  objc_autoreleasePoolPop(v5);
  self = v8;
  v15 = self;
LABEL_62:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *idsDeviceID;
  void *v6;
  _BOOL8 isEnabled;
  _BOOL8 lastSeenAlwaysOnWiFiSupported;
  void *v9;
  void *v10;
  _BOOL8 hasConfirmedClassAKeys;
  NSData *bluetoothMACAddress;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSData *receivedProxyNotifyPayload;
  id v18;

  v18 = a3;
  v4 = objc_autoreleasePoolPush();
  if (self)
  {
    objc_msgSend(v18, "encodeObject:forKey:", self->_nrUUID, CFSTR("nrUUID"));
    objc_msgSend(v18, "encodeObject:forKey:", self->_bluetoothUUID, CFSTR("bluetoothUUID"));
    idsDeviceID = self->_idsDeviceID;
  }
  else
  {
    objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("nrUUID"));
    objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("bluetoothUUID"));
    idsDeviceID = 0;
  }
  objc_msgSend(v18, "encodeObject:forKey:", idsDeviceID, CFSTR("idsDeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateCreated](self, "dateCreated"));
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("dateCreated"));

  objc_msgSend(v18, "encodeBool:forKey:", -[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"), CFSTR("isEmptyPairing"));
  if (!-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"))
  {
    if (self)
    {
      objc_msgSend(v18, "encodeBool:forKey:", self->_isRegistered, CFSTR("isRegistered"));
      isEnabled = self->_isEnabled;
    }
    else
    {
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("isRegistered"));
      isEnabled = 0;
    }
    objc_msgSend(v18, "encodeBool:forKey:", isEnabled, CFSTR("isEnabled"));
    objc_msgSend(v18, "encodeInt64:forKey:", -[NRDLocalDevice pairingProtocolVersion](self, "pairingProtocolVersion"), CFSTR("pairingProtocolVersion"));
    if (self)
    {
      objc_msgSend(v18, "encodeInt32:forKey:", self->_lastSeenInnerLinkVersionHBO, CFSTR("lastSeenInnerLinkVersionHBO"));
      objc_msgSend(v18, "encodeObject:forKey:", self->_lastSeenName, CFSTR("lastSeenName"));
      objc_msgSend(v18, "encodeObject:forKey:", self->_lastSeenBuildVersion, CFSTR("lastSeenBuildVersion"));
      objc_msgSend(v18, "encodeBool:forKey:", self->_wasInitiallySetupUsingIDSPairing, CFSTR("wasInitiallySetupUsingIDSPairing"));
      objc_msgSend(v18, "encodeBool:forKey:", self->_isAltAccountDevice, CFSTR("isAltAccountDevice"));
      lastSeenAlwaysOnWiFiSupported = self->_lastSeenAlwaysOnWiFiSupported;
    }
    else
    {
      objc_msgSend(v18, "encodeInt32:forKey:", 0, CFSTR("lastSeenInnerLinkVersionHBO"));
      objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("lastSeenName"));
      objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("lastSeenBuildVersion"));
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("wasInitiallySetupUsingIDSPairing"));
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("isAltAccountDevice"));
      lastSeenAlwaysOnWiFiSupported = 0;
    }
    objc_msgSend(v18, "encodeBool:forKey:", lastSeenAlwaysOnWiFiSupported, CFSTR("lastSeenAlwaysOnWiFiSupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateRegistered](self, "dateRegistered"));
    objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("dateRegistered"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateEnabled](self, "dateEnabled"));
    objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("dateEnabled"));

    if (self)
    {
      objc_msgSend(v18, "encodeObject:forKey:", self->_localIdentity, CFSTR("localIdentity"));
      objc_msgSend(v18, "encodeObject:forKey:", self->_remoteIdentity, CFSTR("remoteIdentity"));
      objc_msgSend(v18, "encodeBool:forKey:", self->_hasAuthenticatedWithIdentity, CFSTR("hasAuthenticatedWithIdentity"));
      objc_msgSend(v18, "encodeBool:forKey:", self->_hasConfirmedClassDKeys, CFSTR("hasConfirmedClassDKeys"));
      objc_msgSend(v18, "encodeBool:forKey:", self->_hasConfirmedClassCKeys, CFSTR("hasConfirmedClassCKeys"));
      hasConfirmedClassAKeys = self->_hasConfirmedClassAKeys;
    }
    else
    {
      objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("localIdentity"));
      objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("remoteIdentity"));
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("hasAuthenticatedWithIdentity"));
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("hasConfirmedClassDKeys"));
      objc_msgSend(v18, "encodeBool:forKey:", 0, CFSTR("hasConfirmedClassCKeys"));
      hasConfirmedClassAKeys = 0;
    }
    objc_msgSend(v18, "encodeBool:forKey:", hasConfirmedClassAKeys, CFSTR("hasConfirmedClassAKeys"));
    objc_msgSend(v18, "encodeBool:forKey:", -[NRDLocalDevice hasSavedClassCKeysInKeychain](self, "hasSavedClassCKeysInKeychain"), CFSTR("hasSavedClassCKeysInKeychain"));
    if (self)
    {
      objc_msgSend(v18, "encodeInt32:forKey:", self->_deviceType, CFSTR("deviceType"));
      objc_msgSend(v18, "encodeObject:forKey:", self->_operationalProp, CFSTR("operationalProp"));
      objc_msgSend(v18, "encodeInt64:forKey:", self->_localFlags, CFSTR("localFlags"));
      objc_msgSend(v18, "encodeInt64:forKey:", self->_remoteFlags, CFSTR("remoteFlags"));
      bluetoothMACAddress = self->_bluetoothMACAddress;
    }
    else
    {
      objc_msgSend(v18, "encodeInt32:forKey:", 0, CFSTR("deviceType"));
      objc_msgSend(v18, "encodeObject:forKey:", 0, CFSTR("operationalProp"));
      objc_msgSend(v18, "encodeInt64:forKey:", 0, CFSTR("localFlags"));
      objc_msgSend(v18, "encodeInt64:forKey:", 0, CFSTR("remoteFlags"));
      bluetoothMACAddress = 0;
    }
    objc_msgSend(v18, "encodeObject:forKey:", bluetoothMACAddress, CFSTR("bluetoothMACAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassD](self, "localInnerIPv6AddressBytesClassD"));
    objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("localInnerIPv6AddressBytesClassD"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassD](self, "remoteInnerIPv6AddressBytesClassD"));
    objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("remoteInnerIPv6AddressBytesClassD"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassC](self, "localInnerIPv6AddressBytesClassC"));
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("localInnerIPv6AddressBytesClassC"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassC](self, "remoteInnerIPv6AddressBytesClassC"));
    objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("remoteInnerIPv6AddressBytesClassC"));

    if (self)
      receivedProxyNotifyPayload = self->_receivedProxyNotifyPayload;
    else
      receivedProxyNotifyPayload = 0;
    objc_msgSend(v18, "encodeObject:forKey:", receivedProxyNotifyPayload, CFSTR("receivedProxyNotifyPayload"));
  }
  objc_autoreleasePoolPop(v4);

}

- (void)setNrUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrUUID, a3);
}

- (void)setBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUID, a3);
}

- (void)setIdsDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_idsDeviceID, a3);
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setHasCompletedBluetoothPairing:(BOOL)a3
{
  self->_hasCompletedBluetoothPairing = a3;
}

- (void)setLocalIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentity, a3);
}

- (void)setRemoteIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_remoteIdentity, a3);
}

- (void)setHasAuthenticatedWithIdentity:(BOOL)a3
{
  self->_hasAuthenticatedWithIdentity = a3;
}

- (void)setHasConfirmedClassDKeys:(BOOL)a3
{
  self->_hasConfirmedClassDKeys = a3;
}

- (void)setHasConfirmedClassCKeys:(BOOL)a3
{
  self->_hasConfirmedClassCKeys = a3;
}

- (void)setHasConfirmedClassAKeys:(BOOL)a3
{
  self->_hasConfirmedClassAKeys = a3;
}

- (void)setReceivedProxyNotifyPayload:(id)a3
{
  objc_storeStrong((id *)&self->_receivedProxyNotifyPayload, a3);
}

- (void)setBluetoothMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothMACAddress, a3);
}

- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3
{
  self->_wasInitiallySetupUsingIDSPairing = a3;
}

- (void)setIsAltAccountDevice:(BOOL)a3
{
  self->_isAltAccountDevice = a3;
}

- (void)setLastSeenInnerLinkVersionHBO:(unsigned __int16)a3
{
  self->_lastSeenInnerLinkVersionHBO = a3;
}

- (void)setLastSeenName:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenName, a3);
}

- (void)setLastSeenBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenBuildVersion, a3);
}

- (void)setLastSeenAlwaysOnWiFiSupported:(BOOL)a3
{
  self->_lastSeenAlwaysOnWiFiSupported = a3;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setOperationalProp:(id)a3
{
  objc_storeStrong((id *)&self->_operationalProp, a3);
}

- (void)setLocalFlags:(unint64_t)a3
{
  self->_localFlags = a3;
}

- (void)setRemoteFlags:(unint64_t)a3
{
  self->_remoteFlags = a3;
}

- (void)setSelfManagedBluetoothPairing:(BOOL)a3
{
  self->_selfManagedBluetoothPairing = a3;
}

- (BOOL)isEmptyPairing
{
  return self->_isEmptyPairing;
}

- (int64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (void)setPairingProtocolVersion:(int64_t)a3
{
  self->_pairingProtocolVersion = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (NSDate)dateRegistered
{
  return self->_dateRegistered;
}

- (void)setDateRegistered:(id)a3
{
  objc_storeStrong((id *)&self->_dateRegistered, a3);
}

- (NSDate)dateEnabled
{
  return self->_dateEnabled;
}

- (void)setDateEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_dateEnabled, a3);
}

- (BOOL)hasSavedClassCKeysInKeychain
{
  return self->_hasSavedClassCKeysInKeychain;
}

- (void)setHasSavedClassCKeysInKeychain:(BOOL)a3
{
  self->_hasSavedClassCKeysInKeychain = a3;
}

- (NSData)localInnerIPv6AddressBytesClassD
{
  return self->_localInnerIPv6AddressBytesClassD;
}

- (void)setLocalInnerIPv6AddressBytesClassD:(id)a3
{
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassD, a3);
}

- (NSData)remoteInnerIPv6AddressBytesClassD
{
  return self->_remoteInnerIPv6AddressBytesClassD;
}

- (void)setRemoteInnerIPv6AddressBytesClassD:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassD, a3);
}

- (NSData)localInnerIPv6AddressBytesClassC
{
  return self->_localInnerIPv6AddressBytesClassC;
}

- (void)setLocalInnerIPv6AddressBytesClassC:(id)a3
{
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassC, a3);
}

- (NSData)remoteInnerIPv6AddressBytesClassC
{
  return self->_remoteInnerIPv6AddressBytesClassC;
}

- (void)setRemoteInnerIPv6AddressBytesClassC:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassC, 0);
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassC, 0);
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassD, 0);
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassD, 0);
  objc_storeStrong((id *)&self->_dateEnabled, 0);
  objc_storeStrong((id *)&self->_dateRegistered, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_outOfBandKeychainItem, 0);
  objc_storeStrong((id *)&self->_operationalProp, 0);
  objc_storeStrong((id *)&self->_lastSeenBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastSeenName, 0);
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_receivedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_classAKeychainItemsLegacyOnly, 0);
  objc_storeStrong((id *)&self->_classCKeychainItems, 0);
  objc_storeStrong((id *)&self->_classDKeychainItems, 0);
  objc_storeStrong((id *)&self->_remoteIdentity, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
