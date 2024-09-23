@implementation TURoute

- (TURoute)initWithUniqueIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  TURoute *v8;
  uint64_t v9;
  NSString *uniqueIdentifier;
  uint64_t v11;
  NSString *name;
  NSArray *identifiersOfOtherConnectedDevices;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TURoute;
  v8 = -[TURoute init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    identifiersOfOtherConnectedDevices = v8->_identifiersOfOtherConnectedDevices;
    v8->_identifiersOfOtherConnectedDevices = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfOtherConnectedDevices, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (TURoute)initWithRoute:(id)a3
{
  id v4;
  TURoute *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TURoute;
  v5 = -[TURoute init](&v13, sel_init);
  if (v5)
  {
    -[TURoute setA2DPRoute:](v5, "setA2DPRoute:", objc_msgSend(v4, "isA2DPRoute"));
    -[TURoute setAirTunes:](v5, "setAirTunes:", objc_msgSend(v4, "isAirTunes"));
    -[TURoute setBluetooth:](v5, "setBluetooth:", objc_msgSend(v4, "isBluetooth"));
    -[TURoute setBluetoothEndpointType:](v5, "setBluetoothEndpointType:", objc_msgSend(v4, "bluetoothEndpointType"));
    -[TURoute setBluetoothLE:](v5, "setBluetoothLE:", objc_msgSend(v4, "isBluetoothLE"));
    -[TURoute setBluetoothManaged:](v5, "setBluetoothManaged:", objc_msgSend(v4, "isBluetoothManaged"));
    -[TURoute setCarAudio:](v5, "setCarAudio:", objc_msgSend(v4, "isCarAudio"));
    -[TURoute setCurrentlyPicked:](v5, "setCurrentlyPicked:", objc_msgSend(v4, "isCurrentlyPicked"));
    -[TURoute setDefaultRoute:](v5, "setDefaultRoute:", objc_msgSend(v4, "isDefaultRoute"));
    -[TURoute setDeviceType:](v5, "setDeviceType:", objc_msgSend(v4, "deviceType"));
    -[TURoute setGuest:](v5, "setGuest:", objc_msgSend(v4, "isGuest"));
    objc_msgSend(v4, "identifiersOfOtherConnectedDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[TURoute setIdentifiersOfOtherConnectedDevices:](v5, "setIdentifiersOfOtherConnectedDevices:", v7);

    -[TURoute setInTipiWithCompanion:](v5, "setInTipiWithCompanion:", objc_msgSend(v4, "isInTipiWithCompanion"));
    -[TURoute setSmartRoutedTo:](v5, "setSmartRoutedTo:", objc_msgSend(v4, "isSmartRoutedTo"));
    -[TURoute setInEarDetectionEnabled:](v5, "setInEarDetectionEnabled:", objc_msgSend(v4, "isInEarDetectionEnabled"));
    -[TURoute setInEarDetectionSupported:](v5, "setInEarDetectionSupported:", objc_msgSend(v4, "isInEarDetectionSupported"));
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[TURoute setName:](v5, "setName:", v9);

    -[TURoute setPreferred:](v5, "setPreferred:", objc_msgSend(v4, "isPreferred"));
    -[TURoute setPreferredAndActive:](v5, "setPreferredAndActive:", objc_msgSend(v4, "isPreferredAndActive"));
    -[TURoute setReceiver:](v5, "setReceiver:", objc_msgSend(v4, "isReceiver"));
    -[TURoute setSpeaker:](v5, "setSpeaker:", objc_msgSend(v4, "isSpeaker"));
    -[TURoute setSupportsRelay:](v5, "setSupportsRelay:", objc_msgSend(v4, "supportsRelay"));
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[TURoute setUniqueIdentifier:](v5, "setUniqueIdentifier:", v11);

    -[TURoute setWiredHeadphones:](v5, "setWiredHeadphones:", objc_msgSend(v4, "isWiredHeadphones"));
    -[TURoute setWiredHeadset:](v5, "setWiredHeadset:", objc_msgSend(v4, "isWiredHeadset"));
    -[TURoute setWirelessHeadset:](v5, "setWirelessHeadset:", objc_msgSend(v4, "isWirelessHeadset"));
    -[TURoute setPartnerRouteRoutable:](v5, "setPartnerRouteRoutable:", objc_msgSend(v4, "isPartnerRouteRoutable"));
    -[TURoute setSiblingRoutePresent:](v5, "setSiblingRoutePresent:", objc_msgSend(v4, "isSiblingRoutePresent"));
    -[TURoute setSupportsSharePlay:](v5, "setSupportsSharePlay:", objc_msgSend(v4, "supportsSharePlay"));
    -[TURoute setRecommended:](v5, "setRecommended:", objc_msgSend(v4, "isRecommended"));
  }

  return v5;
}

- (id)customDescription
{
  return &stru_1E38A53C8;
}

- (BOOL)isHomePodFamily
{
  unint64_t v2;

  v2 = -[TURoute deviceType](self, "deviceType");
  return (v2 < 0x1D) & (0x18C04040u >> v2);
}

- (BOOL)isAirPodsRoute
{
  unint64_t v2;

  v2 = -[TURoute deviceType](self, "deviceType");
  return (v2 < 0x1E) & (0x24140002u >> v2);
}

- (BOOL)isInEarDetected
{
  _BOOL4 v3;

  v3 = -[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled");
  if (v3)
    LOBYTE(v3) = -[TURoute isPreferredAndActive](self, "isPreferredAndActive");
  return v3;
}

- (BOOL)isTipiParticipant
{
  _BOOL4 v3;

  v3 = -[TURoute isBluetoothManaged](self, "isBluetoothManaged");
  if (v3)
    LOBYTE(v3) = -[TURoute isPreferred](self, "isPreferred");
  return v3;
}

- (BOOL)isTriangleParticipant
{
  void *v3;
  BOOL v4;

  if (-[TURoute isTipiParticipant](self, "isTipiParticipant") || !-[TURoute isPreferred](self, "isPreferred"))
    return 0;
  -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)isAuxiliary
{
  if (-[TURoute isSpeaker](self, "isSpeaker") || -[TURoute isReceiver](self, "isReceiver"))
    return 0;
  else
    return !-[TURoute isDefaultRoute](self, "isDefaultRoute");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TURoute initWithRoute:](+[TURoute allocWithZone:](TURoute, "allocWithZone:", a3), "initWithRoute:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TURoute initWithRoute:](+[TUMutableRoute allocWithZone:](TUMutableRoute, "allocWithZone:", a3), "initWithRoute:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TURoute)initWithCoder:(id)a3
{
  id v4;
  TURoute *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *identifiersOfOtherConnectedDevices;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSString *name;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSString *uniqueIdentifier;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TURoute;
  v5 = -[TURoute init](&v49, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_isA2DPRoute);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_A2DPRoute = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_isAirTunes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_airTunes = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_isBluetooth);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bluetooth = objc_msgSend(v4, "decodeBoolForKey:", v8);

    NSStringFromSelector(sel_bluetoothEndpointType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bluetoothEndpointType = objc_msgSend(v4, "decodeIntegerForKey:", v9);

    NSStringFromSelector(sel_isBluetoothLE);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bluetoothLE = objc_msgSend(v4, "decodeBoolForKey:", v10);

    NSStringFromSelector(sel_isBluetoothManaged);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bluetoothManaged = objc_msgSend(v4, "decodeBoolForKey:", v11);

    NSStringFromSelector(sel_isCarAudio);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_carAudio = objc_msgSend(v4, "decodeBoolForKey:", v12);

    NSStringFromSelector(sel_isCurrentlyPicked);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentlyPicked = objc_msgSend(v4, "decodeBoolForKey:", v13);

    NSStringFromSelector(sel_isDefaultRoute);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_defaultRoute = objc_msgSend(v4, "decodeBoolForKey:", v14);

    NSStringFromSelector(sel_deviceType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", v15);

    NSStringFromSelector(sel_isGuest);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_guest = objc_msgSend(v4, "decodeBoolForKey:", v16);

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_identifiersOfOtherConnectedDevices);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    identifiersOfOtherConnectedDevices = v5->_identifiersOfOtherConnectedDevices;
    v5->_identifiersOfOtherConnectedDevices = (NSArray *)v21;

    NSStringFromSelector(sel_isInTipiWithCompanion);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inTipiWithCompanion = objc_msgSend(v4, "decodeBoolForKey:", v23);

    NSStringFromSelector(sel_isSmartRoutedTo);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_smartRoutedTo = objc_msgSend(v4, "decodeBoolForKey:", v24);

    NSStringFromSelector(sel_isInEarDetectionEnabled);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inEarDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_isInEarDetectionSupported);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inEarDetectionSupported = objc_msgSend(v4, "decodeBoolForKey:", v26);

    v27 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v29;

    NSStringFromSelector(sel_isPreferred);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferred = objc_msgSend(v4, "decodeBoolForKey:", v31);

    NSStringFromSelector(sel_isPreferredAndActive);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferredAndActive = objc_msgSend(v4, "decodeBoolForKey:", v32);

    NSStringFromSelector(sel_isReceiver);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_receiver = objc_msgSend(v4, "decodeBoolForKey:", v33);

    NSStringFromSelector(sel_isSpeaker);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_speaker = objc_msgSend(v4, "decodeBoolForKey:", v34);

    NSStringFromSelector(sel_supportsHighQualityVoiceWithMedia);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsHighQualityVoiceWithMedia = objc_msgSend(v4, "decodeBoolForKey:", v35);

    NSStringFromSelector(sel_supportsRelay);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsRelay = objc_msgSend(v4, "decodeBoolForKey:", v36);

    v37 = objc_opt_class();
    NSStringFromSelector(sel_uniqueIdentifier);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v39;

    NSStringFromSelector(sel_isWiredHeadphones);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wiredHeadphones = objc_msgSend(v4, "decodeBoolForKey:", v41);

    NSStringFromSelector(sel_isWiredHeadset);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wiredHeadset = objc_msgSend(v4, "decodeBoolForKey:", v42);

    NSStringFromSelector(sel_isWirelessHeadset);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wirelessHeadset = objc_msgSend(v4, "decodeBoolForKey:", v43);

    NSStringFromSelector(sel_isPartnerRouteRoutable);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_partnerRouteRoutable = objc_msgSend(v4, "decodeBoolForKey:", v44);

    NSStringFromSelector(sel_isSiblingRoutePresent);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_siblingRoutePresent = objc_msgSend(v4, "decodeBoolForKey:", v45);

    NSStringFromSelector(sel_supportsSharePlay);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsSharePlay = objc_msgSend(v4, "decodeBoolForKey:", v46);

    NSStringFromSelector(sel_isRecommended);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recommended = objc_msgSend(v4, "decodeBoolForKey:", v47);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  int64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  int64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  _BOOL8 v63;
  void *v64;
  _BOOL8 v65;
  id v66;

  v4 = a3;
  v5 = -[TURoute isA2DPRoute](self, "isA2DPRoute");
  NSStringFromSelector(sel_isA2DPRoute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  v7 = -[TURoute isAirTunes](self, "isAirTunes");
  NSStringFromSelector(sel_isAirTunes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TURoute isCarAudio](self, "isCarAudio");
  NSStringFromSelector(sel_isCarAudio);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[TURoute isCurrentlyPicked](self, "isCurrentlyPicked");
  NSStringFromSelector(sel_isCurrentlyPicked);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[TURoute isBluetooth](self, "isBluetooth");
  NSStringFromSelector(sel_isBluetooth);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType");
  NSStringFromSelector(sel_bluetoothEndpointType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v15, v16);

  v17 = -[TURoute isBluetoothLE](self, "isBluetoothLE");
  NSStringFromSelector(sel_isBluetoothLE);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TURoute isBluetoothManaged](self, "isBluetoothManaged");
  NSStringFromSelector(sel_isBluetoothManaged);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TURoute isDefaultRoute](self, "isDefaultRoute");
  NSStringFromSelector(sel_isDefaultRoute);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[TURoute deviceType](self, "deviceType");
  NSStringFromSelector(sel_deviceType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v23, v24);

  v25 = -[TURoute isGuest](self, "isGuest");
  NSStringFromSelector(sel_isGuest);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifiersOfOtherConnectedDevices);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  v29 = -[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion");
  NSStringFromSelector(sel_isInTipiWithCompanion);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

  v31 = -[TURoute isSmartRoutedTo](self, "isSmartRoutedTo");
  NSStringFromSelector(sel_isSmartRoutedTo);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

  v33 = -[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled");
  NSStringFromSelector(sel_isInEarDetectionEnabled);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  v35 = -[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported");
  NSStringFromSelector(sel_isInEarDetectionSupported);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v35, v36);

  v37 = -[TURoute isPreferred](self, "isPreferred");
  NSStringFromSelector(sel_isPreferred);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v37, v38);

  v39 = -[TURoute isPreferredAndActive](self, "isPreferredAndActive");
  NSStringFromSelector(sel_isPreferredAndActive);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v39, v40);

  -[TURoute name](self, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, v42);

  v43 = -[TURoute isReceiver](self, "isReceiver");
  NSStringFromSelector(sel_isReceiver);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v43, v44);

  v45 = -[TURoute isSpeaker](self, "isSpeaker");
  NSStringFromSelector(sel_isSpeaker);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v45, v46);

  v47 = -[TURoute supportsHighQualityVoiceWithMedia](self, "supportsHighQualityVoiceWithMedia");
  NSStringFromSelector(sel_supportsHighQualityVoiceWithMedia);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v47, v48);

  v49 = -[TURoute supportsRelay](self, "supportsRelay");
  NSStringFromSelector(sel_supportsRelay);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v49, v50);

  -[TURoute uniqueIdentifier](self, "uniqueIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uniqueIdentifier);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, v52);

  v53 = -[TURoute isWiredHeadphones](self, "isWiredHeadphones");
  NSStringFromSelector(sel_isWiredHeadphones);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v53, v54);

  v55 = -[TURoute isWiredHeadset](self, "isWiredHeadset");
  NSStringFromSelector(sel_isWiredHeadset);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v55, v56);

  v57 = -[TURoute isWirelessHeadset](self, "isWirelessHeadset");
  NSStringFromSelector(sel_isWirelessHeadset);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v57, v58);

  v59 = -[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable");
  NSStringFromSelector(sel_isPartnerRouteRoutable);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v59, v60);

  v61 = -[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent");
  NSStringFromSelector(sel_isSiblingRoutePresent);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v61, v62);

  v63 = -[TURoute supportsSharePlay](self, "supportsSharePlay");
  NSStringFromSelector(sel_supportsSharePlay);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v63, v64);

  v65 = -[TURoute isRecommended](self, "isRecommended");
  NSStringFromSelector(sel_isRecommended);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v65, v66);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TURoute uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uniqueIdentifier=%@"), v4);

  -[TURoute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" name=%@"), v5);

  if (-[TURoute deviceType](self, "deviceType"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" deviceType=%ld"), -[TURoute deviceType](self, "deviceType"));
  if (-[TURoute isA2DPRoute](self, "isA2DPRoute"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isA2DPRoute=%d"), -[TURoute isA2DPRoute](self, "isA2DPRoute"));
  if (-[TURoute isCurrentlyPicked](self, "isCurrentlyPicked"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isCurrentlyPicked=%d"), -[TURoute isCurrentlyPicked](self, "isCurrentlyPicked"));
  if (-[TURoute isDefaultRoute](self, "isDefaultRoute"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isDefaultRoute=%d"), -[TURoute isDefaultRoute](self, "isDefaultRoute"));
  if (-[TURoute isReceiver](self, "isReceiver"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isReceiver=%d"), -[TURoute isReceiver](self, "isReceiver"));
  if (-[TURoute isSpeaker](self, "isSpeaker"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isSpeaker=%d"), -[TURoute isSpeaker](self, "isSpeaker"));
  if (-[TURoute isWiredHeadphones](self, "isWiredHeadphones"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isWiredHeadphones=%d"), -[TURoute isWiredHeadphones](self, "isWiredHeadphones"));
  if (-[TURoute isWiredHeadset](self, "isWiredHeadset"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isWiredHeadset=%d"), -[TURoute isWiredHeadset](self, "isWiredHeadset"));
  if (-[TURoute isWirelessHeadset](self, "isWirelessHeadset"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isWirelessHeadset=%d"), -[TURoute isWirelessHeadset](self, "isWirelessHeadset"));
  if (-[TURoute isAirTunes](self, "isAirTunes"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isAirTunes=%d"), -[TURoute isAirTunes](self, "isAirTunes"));
  if (-[TURoute isCarAudio](self, "isCarAudio"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isCarAudio=%d"), -[TURoute isCarAudio](self, "isCarAudio"));
  if (-[TURoute isGuest](self, "isGuest"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isGuest=%d"), -[TURoute isGuest](self, "isGuest"));
  if (-[TURoute isBluetooth](self, "isBluetooth"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isBluetooth=%d"), -[TURoute isBluetooth](self, "isBluetooth"));
  if (-[TURoute isBluetoothLE](self, "isBluetoothLE"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isBluetoothLE=%d"), -[TURoute isBluetoothLE](self, "isBluetoothLE"));
  if (-[TURoute isBluetoothManaged](self, "isBluetoothManaged"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isBluetoothManaged=%d"), -[TURoute isBluetoothManaged](self, "isBluetoothManaged"));
  if (-[TURoute bluetoothEndpointType](self, "bluetoothEndpointType"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" bluetoothEndpointType=%ld"), -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType"));
  if (-[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isInEarDetectionEnabled=%d"), -[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled"));
  if (-[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isInEarDetectionSupported=%d"), -[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported"));
  if (-[TURoute isPreferred](self, "isPreferred"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isPreferred=%d"), -[TURoute isPreferred](self, "isPreferred"));
  if (-[TURoute isPreferredAndActive](self, "isPreferredAndActive"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isPreferredAndActive=%d"), -[TURoute isPreferredAndActive](self, "isPreferredAndActive"));
  -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" identifiersOfOtherConnectedDevices=%@"), v9);

  }
  if (-[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isInTipiWithCompanion=%d"), -[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion"));
  if (-[TURoute isSmartRoutedTo](self, "isSmartRoutedTo"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isSmartRoutedTo=%d"), -[TURoute isSmartRoutedTo](self, "isSmartRoutedTo"));
  if (-[TURoute supportsRelay](self, "supportsRelay"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRelay=%d"), -[TURoute supportsRelay](self, "supportsRelay"));
  if (-[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isPartnerRouteRoutable=%d"), -[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable"));
  if (-[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isSiblingRoutePresent=%d"), -[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent"));
  if (-[TURoute supportsSharePlay](self, "supportsSharePlay"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsSharePlay=%d"), -[TURoute supportsSharePlay](self, "supportsSharePlay"));
  if (-[TURoute isTipiParticipant](self, "isTipiParticipant"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isTipiParticipant=%d"), -[TURoute isTipiParticipant](self, "isTipiParticipant"));
  if (-[TURoute isTriangleParticipant](self, "isTriangleParticipant"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isTriangleParticipant=%d"), -[TURoute isTriangleParticipant](self, "isTriangleParticipant"));
  if (-[TURoute isCarKitRoute](self, "isCarKitRoute"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isCarKitRoute=%d"), -[TURoute isCarKitRoute](self, "isCarKitRoute"));
  if (-[TURoute isRecommended](self, "isRecommended"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isRecommended=%d"), -[TURoute isRecommended](self, "isRecommended"));
  -[TURoute customDescription](self, "customDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TURoute *v4;
  BOOL v5;

  v4 = (TURoute *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TURoute isEqualToRoute:](self, "isEqualToRoute:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  if (-[TURoute isA2DPRoute](self, "isA2DPRoute"))
    v3 = 1231;
  else
    v3 = 1237;
  if (-[TURoute isAirTunes](self, "isAirTunes"))
    v4 = 1231;
  else
    v4 = 1237;
  v5 = v4 ^ v3;
  if (-[TURoute isCarAudio](self, "isCarAudio"))
    v6 = 1231;
  else
    v6 = 1237;
  if (-[TURoute isCurrentlyPicked](self, "isCurrentlyPicked"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = v5 ^ v6 ^ v7;
  if (-[TURoute isBluetooth](self, "isBluetooth"))
    v9 = 1231;
  else
    v9 = 1237;
  v10 = v9 ^ -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType");
  if (-[TURoute isBluetoothLE](self, "isBluetoothLE"))
    v11 = 1231;
  else
    v11 = 1237;
  v12 = v8 ^ v10 ^ v11;
  if (-[TURoute isBluetoothManaged](self, "isBluetoothManaged"))
    v13 = 1231;
  else
    v13 = 1237;
  if (-[TURoute isDefaultRoute](self, "isDefaultRoute"))
    v14 = 1231;
  else
    v14 = 1237;
  v15 = v13 ^ v14 ^ -[TURoute deviceType](self, "deviceType");
  if (-[TURoute isGuest](self, "isGuest"))
    v16 = 1231;
  else
    v16 = 1237;
  v17 = v12 ^ v15 ^ v16;
  -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  if (-[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v19 ^ v20;
  if (-[TURoute isSmartRoutedTo](self, "isSmartRoutedTo"))
    v22 = 1231;
  else
    v22 = 1237;
  v23 = v21 ^ v22;
  if (-[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled"))
    v24 = 1231;
  else
    v24 = 1237;
  v25 = v23 ^ v24;
  if (-[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported"))
    v26 = 1231;
  else
    v26 = 1237;
  v27 = v17 ^ v25 ^ v26;
  -[TURoute name](self, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash");
  if (-[TURoute isPreferred](self, "isPreferred"))
    v30 = 1231;
  else
    v30 = 1237;
  v31 = v29 ^ v30;
  if (-[TURoute isPreferredAndActive](self, "isPreferredAndActive"))
    v32 = 1231;
  else
    v32 = 1237;
  v33 = v31 ^ v32;
  if (-[TURoute isReceiver](self, "isReceiver"))
    v34 = 1231;
  else
    v34 = 1237;
  v35 = v33 ^ v34;
  if (-[TURoute isSpeaker](self, "isSpeaker"))
    v36 = 1231;
  else
    v36 = 1237;
  v37 = v35 ^ v36;
  if (-[TURoute supportsRelay](self, "supportsRelay"))
    v38 = 1231;
  else
    v38 = 1237;
  v39 = v27 ^ v37 ^ v38;
  -[TURoute uniqueIdentifier](self, "uniqueIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "hash");
  if (-[TURoute isWiredHeadphones](self, "isWiredHeadphones"))
    v42 = 1231;
  else
    v42 = 1237;
  v43 = v41 ^ v42;
  if (-[TURoute isWiredHeadset](self, "isWiredHeadset"))
    v44 = 1231;
  else
    v44 = 1237;
  v45 = v43 ^ v44;
  if (-[TURoute isWirelessHeadset](self, "isWirelessHeadset"))
    v46 = 1231;
  else
    v46 = 1237;
  v47 = v45 ^ v46;
  if (-[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable"))
    v48 = 1231;
  else
    v48 = 1237;
  v49 = v47 ^ v48;
  if (-[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent"))
    v50 = 1231;
  else
    v50 = 1237;
  v51 = v49 ^ v50;
  if (-[TURoute supportsSharePlay](self, "supportsSharePlay"))
    v52 = 1231;
  else
    v52 = 1237;
  v53 = v39 ^ v51 ^ v52;
  if (-[TURoute isRecommended](self, "isRecommended"))
    v54 = 1231;
  else
    v54 = 1237;
  v55 = v53 ^ v54;

  return v55;
}

- (BOOL)isEqualToRoute:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (-[TURoute isEqualToRouteIgnoringIsRecommended:](self, "isEqualToRouteIgnoringIsRecommended:", v4))
  {
    v5 = -[TURoute isRecommended](self, "isRecommended");
    v6 = v5 ^ objc_msgSend(v4, "isRecommended") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqualToRouteIgnoringIsRecommended:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int64_t v10;
  int v11;
  int v12;
  int v13;
  int64_t v14;
  int v15;
  int v16;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _BOOL4 v38;

  v4 = a3;
  v5 = -[TURoute isA2DPRoute](self, "isA2DPRoute");
  if (v5 != objc_msgSend(v4, "isA2DPRoute"))
    goto LABEL_12;
  v6 = -[TURoute isAirTunes](self, "isAirTunes");
  if (v6 != objc_msgSend(v4, "isAirTunes"))
    goto LABEL_12;
  v7 = -[TURoute isCarAudio](self, "isCarAudio");
  if (v7 != objc_msgSend(v4, "isCarAudio"))
    goto LABEL_12;
  v8 = -[TURoute isCurrentlyPicked](self, "isCurrentlyPicked");
  if (v8 != objc_msgSend(v4, "isCurrentlyPicked"))
    goto LABEL_12;
  v9 = -[TURoute isBluetooth](self, "isBluetooth");
  if (v9 == objc_msgSend(v4, "isBluetooth")
    && (v10 = -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType"),
        v10 == objc_msgSend(v4, "bluetoothEndpointType"))
    && (v11 = -[TURoute isBluetoothLE](self, "isBluetoothLE"), v11 == objc_msgSend(v4, "isBluetoothLE"))
    && (v12 = -[TURoute isBluetoothManaged](self, "isBluetoothManaged"),
        v12 == objc_msgSend(v4, "isBluetoothManaged"))
    && (v13 = -[TURoute isDefaultRoute](self, "isDefaultRoute"), v13 == objc_msgSend(v4, "isDefaultRoute"))
    && (v14 = -[TURoute deviceType](self, "deviceType"), v14 == objc_msgSend(v4, "deviceType"))
    && (v15 = -[TURoute isGuest](self, "isGuest"), v15 == objc_msgSend(v4, "isGuest")))
  {
    -[TURoute identifiersOfOtherConnectedDevices](self, "identifiersOfOtherConnectedDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiersOfOtherConnectedDevices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToArray:", v19)
      && (v20 = -[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion"),
          v20 == objc_msgSend(v4, "isInTipiWithCompanion"))
      && (v21 = -[TURoute isSmartRoutedTo](self, "isSmartRoutedTo"),
          v21 == objc_msgSend(v4, "isSmartRoutedTo"))
      && (v22 = -[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled"),
          v22 == objc_msgSend(v4, "isInEarDetectionEnabled"))
      && (v23 = -[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported"),
          v23 == objc_msgSend(v4, "isInEarDetectionSupported")))
    {
      -[TURoute name](self, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", v25)
        && (v26 = -[TURoute isPreferred](self, "isPreferred"), v26 == objc_msgSend(v4, "isPreferred"))
        && (v27 = -[TURoute isPreferredAndActive](self, "isPreferredAndActive"),
            v27 == objc_msgSend(v4, "isPreferredAndActive"))
        && (v28 = -[TURoute isReceiver](self, "isReceiver"), v28 == objc_msgSend(v4, "isReceiver"))
        && (v29 = -[TURoute isSpeaker](self, "isSpeaker"), v29 == objc_msgSend(v4, "isSpeaker"))
        && (v30 = -[TURoute supportsRelay](self, "supportsRelay"), v30 == objc_msgSend(v4, "supportsRelay")))
      {
        -[TURoute uniqueIdentifier](self, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqualToString:", v32)
          && (v33 = -[TURoute isWiredHeadphones](self, "isWiredHeadphones"),
              v33 == objc_msgSend(v4, "isWiredHeadphones"))
          && (v34 = -[TURoute isWiredHeadset](self, "isWiredHeadset"),
              v34 == objc_msgSend(v4, "isWiredHeadset"))
          && (v35 = -[TURoute isWirelessHeadset](self, "isWirelessHeadset"),
              v35 == objc_msgSend(v4, "isWirelessHeadset"))
          && (v36 = -[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable"),
              v36 == objc_msgSend(v4, "isPartnerRouteRoutable"))
          && (v37 = -[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent"),
              v37 == objc_msgSend(v4, "isSiblingRoutePresent")))
        {
          v38 = -[TURoute supportsSharePlay](self, "supportsSharePlay");
          v16 = v38 ^ objc_msgSend(v4, "supportsSharePlay") ^ 1;
        }
        else
        {
          LOBYTE(v16) = 0;
        }

      }
      else
      {
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
LABEL_12:
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)isCarKitRoute
{
  return -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType") == 2;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)isA2DPRoute
{
  return self->_A2DPRoute;
}

- (void)setA2DPRoute:(BOOL)a3
{
  self->_A2DPRoute = a3;
}

- (BOOL)isCurrentlyPicked
{
  return self->_currentlyPicked;
}

- (void)setCurrentlyPicked:(BOOL)a3
{
  self->_currentlyPicked = a3;
}

- (BOOL)isDefaultRoute
{
  return self->_defaultRoute;
}

- (void)setDefaultRoute:(BOOL)a3
{
  self->_defaultRoute = a3;
}

- (BOOL)isReceiver
{
  return self->_receiver;
}

- (void)setReceiver:(BOOL)a3
{
  self->_receiver = a3;
}

- (BOOL)isSpeaker
{
  return self->_speaker;
}

- (void)setSpeaker:(BOOL)a3
{
  self->_speaker = a3;
}

- (BOOL)isWiredHeadphones
{
  return self->_wiredHeadphones;
}

- (void)setWiredHeadphones:(BOOL)a3
{
  self->_wiredHeadphones = a3;
}

- (BOOL)isWiredHeadset
{
  return self->_wiredHeadset;
}

- (void)setWiredHeadset:(BOOL)a3
{
  self->_wiredHeadset = a3;
}

- (BOOL)isWirelessHeadset
{
  return self->_wirelessHeadset;
}

- (void)setWirelessHeadset:(BOOL)a3
{
  self->_wirelessHeadset = a3;
}

- (BOOL)isAirTunes
{
  return self->_airTunes;
}

- (void)setAirTunes:(BOOL)a3
{
  self->_airTunes = a3;
}

- (BOOL)isCarAudio
{
  return self->_carAudio;
}

- (void)setCarAudio:(BOOL)a3
{
  self->_carAudio = a3;
}

- (BOOL)isGuest
{
  return self->_guest;
}

- (void)setGuest:(BOOL)a3
{
  self->_guest = a3;
}

- (BOOL)isBluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(BOOL)a3
{
  self->_bluetooth = a3;
}

- (BOOL)isBluetoothLE
{
  return self->_bluetoothLE;
}

- (void)setBluetoothLE:(BOOL)a3
{
  self->_bluetoothLE = a3;
}

- (BOOL)isBluetoothManaged
{
  return self->_bluetoothManaged;
}

- (void)setBluetoothManaged:(BOOL)a3
{
  self->_bluetoothManaged = a3;
}

- (int64_t)bluetoothEndpointType
{
  return self->_bluetoothEndpointType;
}

- (void)setBluetoothEndpointType:(int64_t)a3
{
  self->_bluetoothEndpointType = a3;
}

- (BOOL)isInEarDetectionEnabled
{
  return self->_inEarDetectionEnabled;
}

- (void)setInEarDetectionEnabled:(BOOL)a3
{
  self->_inEarDetectionEnabled = a3;
}

- (BOOL)isInEarDetectionSupported
{
  return self->_inEarDetectionSupported;
}

- (void)setInEarDetectionSupported:(BOOL)a3
{
  self->_inEarDetectionSupported = a3;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (BOOL)isPreferredAndActive
{
  return self->_preferredAndActive;
}

- (void)setPreferredAndActive:(BOOL)a3
{
  self->_preferredAndActive = a3;
}

- (BOOL)isPartnerRouteRoutable
{
  return self->_partnerRouteRoutable;
}

- (void)setPartnerRouteRoutable:(BOOL)a3
{
  self->_partnerRouteRoutable = a3;
}

- (BOOL)isSiblingRoutePresent
{
  return self->_siblingRoutePresent;
}

- (void)setSiblingRoutePresent:(BOOL)a3
{
  self->_siblingRoutePresent = a3;
}

- (BOOL)supportsHighQualityVoiceWithMedia
{
  return self->_supportsHighQualityVoiceWithMedia;
}

- (void)setSupportsHighQualityVoiceWithMedia:(BOOL)a3
{
  self->_supportsHighQualityVoiceWithMedia = a3;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  self->_supportsSharePlay = a3;
}

- (NSArray)identifiersOfOtherConnectedDevices
{
  return self->_identifiersOfOtherConnectedDevices;
}

- (void)setIdentifiersOfOtherConnectedDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)supportsRelay
{
  return self->_supportsRelay;
}

- (void)setSupportsRelay:(BOOL)a3
{
  self->_supportsRelay = a3;
}

- (BOOL)isRecommended
{
  return self->_recommended;
}

- (void)setRecommended:(BOOL)a3
{
  self->_recommended = a3;
}

- (BOOL)isInTipiWithCompanion
{
  return self->_inTipiWithCompanion;
}

- (void)setInTipiWithCompanion:(BOOL)a3
{
  self->_inTipiWithCompanion = a3;
}

- (BOOL)isSmartRoutedTo
{
  return self->_smartRoutedTo;
}

- (void)setSmartRoutedTo:(BOOL)a3
{
  self->_smartRoutedTo = a3;
}

+ (id)predicateForInEarAudioRoute
{
  return &__block_literal_global_45;
}

uint64_t __49__TURoute_Predicate__predicateForInEarAudioRoute__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInEarDetected");
}

+ (id)predicateForInEarRouteInTipiWithCompanionWatch
{
  return &__block_literal_global_1;
}

uint64_t __68__TURoute_Predicate__predicateForInEarRouteInTipiWithCompanionWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unsigned int v3;
  int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "isInTipiWithCompanion");
  v4 = objc_msgSend(v2, "isInEarDetected");

  return v4 & v3;
}

+ (id)predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  return &__block_literal_global_2_0;
}

uint64_t __84__TURoute_Predicate__predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isInTipiWithCompanion"))
    v3 = objc_msgSend(v2, "isSmartRoutedTo") ^ 1;
  else
    v3 = 0;
  v4 = objc_msgSend(v2, "isInEarDetected") & v3;

  return v4;
}

+ (id)predicateForPreferredRoute
{
  return &__block_literal_global_3_2;
}

uint64_t __48__TURoute_Predicate__predicateForPreferredRoute__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isInEarDetectionSupported"))
    v3 = objc_msgSend(v2, "isInEarDetected");
  else
    v3 = objc_msgSend(v2, "isPreferred");
  v4 = v3;

  return v4;
}

@end
