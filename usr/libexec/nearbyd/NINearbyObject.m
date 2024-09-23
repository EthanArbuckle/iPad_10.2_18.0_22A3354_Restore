@implementation NINearbyObject

- (NINearbyObject)initWithToken:(id)a3
{
  id v6;
  NINearbyObject *v7;
  NINearbyObject *v8;
  simd_float3 v9;
  int v10;
  __int128 v11;
  NSString *deviceIdentifier;
  NSString *name;
  float v14;
  NSNumber *spatialScore;
  NSData *bluetoothAdvertisingAddress;
  NSUUID *bluetoothPeerIdentifier;
  uint64_t v18;
  uint64_t v19;
  UWBSignalFeatures *uwbSignalFeatures;
  char v21;
  NSString *debugDisplayInfo;
  void *v24;
  objc_super v25;

  v6 = a3;
  if (!v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NINearbyObject.mm"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v25.receiver = self;
  v25.super_class = (Class)NINearbyObject;
  v7 = -[NINearbyObject init](&v25, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryToken, a3);
    v8->_distance = NINearbyObjectDistanceNotAvailable;
    v9 = NINearbyObjectDirectionNotAvailable;
    v8->_distanceMeasurementQuality = 0;
    v10 = NINearbyObjectElevationNotAvailable;
    LODWORD(v8->_azimuth) = NINearbyObjectAzimuthNotAvailable;
    LODWORD(v8->_elevation) = v10;
    v11 = NINearbyObjectQuaternionNotAvailable;
    *(simd_float3 *)v8->_direction = v9;
    *(_OWORD *)v8->_anon_d0 = v11;
    *(_QWORD *)&v8->_timestamp = qword_10085FC10;
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_relationship = 4;
    v8->_deviceIdentifier = 0;

    name = v8->_name;
    v8->_motionState = 0;
    v8->_name = 0;
    v8->_verticalDirectionEstimate = 0;
    v14 = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngle = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngleAccuracy = v14;

    spatialScore = v8->_spatialScore;
    v8->_spatialScore = 0;

    bluetoothAdvertisingAddress = v8->_bluetoothAdvertisingAddress;
    v8->_bluetoothAdvertisingAddress = 0;

    bluetoothPeerIdentifier = v8->_bluetoothPeerIdentifier;
    v8->_bluetoothPeerIdentifier = 0;

    v18 = NINearbyObjectSignalStrengthNotAvailable;
    v8->_remoteTxAntennaMask = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
    v19 = NINearbyObjectRangeBiasEstimateNotAvailable;
    *(_QWORD *)&v8->_signalStrength = v18;
    *(_QWORD *)&v8->_rangeBiasEstimate = v19;
    *(_QWORD *)&v8->_rangeUncertainty = NINearbyObjectRangeUncertaintyNotAvailable;
    *(_OWORD *)v8->_worldPosition = NINearbyObjectWorldPositionNotAvailable;
    v8->_requiresBiasCorrection = byte_10085FC19;
    uwbSignalFeatures = v8->_uwbSignalFeatures;
    v8->_uwbSignalFeatures = 0;

    v21 = NINearbyObjectRxStatusNotAvailable;
    v8->_nbRxStatus = NINearbyObjectRxStatusNotAvailable;
    v8->_mmsRxStatus = v21;
    *(_QWORD *)&v8->_nbRssi = NINearbyObjectNbRssiNotAvailable;
    *(_WORD *)&v8->_canInteract = 1;
    v8->_revokeFindingExperience = 0;
    LODWORD(v8->_boundedRegionRange) = NINearbyObjectRegionBoundaryRangeNotAvailable;
    debugDisplayInfo = v8->_debugDisplayInfo;
    v8->_algorithmSource = 1;
    v8->_debugDisplayInfo = 0;

  }
  return v8;
}

- (NINearbyObject)initWithNearbyObject:(id)a3
{
  id v5;
  NINearbyObject *v6;
  uint64_t v7;
  NIDiscoveryToken *discoveryToken;
  float v9;
  __int128 v10;
  float v11;
  float v12;
  __int128 v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  double v16;
  uint64_t v17;
  NSString *name;
  float v19;
  float v20;
  uint64_t v21;
  NSNumber *spatialScore;
  uint64_t v23;
  NSData *bluetoothAdvertisingAddress;
  uint64_t v25;
  NSUUID *bluetoothPeerIdentifier;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  uint64_t v31;
  UWBSignalFeatures *uwbSignalFeatures;
  double v33;
  float v34;
  uint64_t v35;
  NSString *debugDisplayInfo;
  void *v38;
  objc_super v39;

  v5 = a3;
  if (!v5)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NINearbyObject.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v39.receiver = self;
  v39.super_class = (Class)NINearbyObject;
  v6 = -[NINearbyObject init](&v39, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoveryToken"));
    discoveryToken = v6->_discoveryToken;
    v6->_discoveryToken = (NIDiscoveryToken *)v7;

    objc_msgSend(v5, "distance");
    v6->_distance = v9;
    objc_msgSend(v5, "direction");
    *(_OWORD *)v6->_direction = v10;
    v6->_distanceMeasurementQuality = (int64_t)objc_msgSend(v5, "distanceMeasurementQuality");
    objc_msgSend(v5, "azimuth");
    v6->_azimuth = v11;
    objc_msgSend(v5, "elevation");
    v6->_elevation = v12;
    objc_msgSend(v5, "quaternion");
    *(_OWORD *)v6->_anon_d0 = v13;
    v6->_relationship = (unint64_t)objc_msgSend(v5, "relationship");
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v14;

    objc_msgSend(v5, "timestamp");
    v6->_timestamp = v16;
    v6->_motionState = (int64_t)objc_msgSend(v5, "motionState");
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    name = v6->_name;
    v6->_name = (NSString *)v17;

    v6->_verticalDirectionEstimate = (int64_t)objc_msgSend(v5, "verticalDirectionEstimate");
    objc_msgSend(v5, "horizontalAngle");
    v6->_horizontalAngle = v19;
    objc_msgSend(v5, "horizontalAngleAccuracy");
    v6->_horizontalAngleAccuracy = v20;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spatialScore"));
    spatialScore = v6->_spatialScore;
    v6->_spatialScore = (NSNumber *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAdvertisingAddress"));
    bluetoothAdvertisingAddress = v6->_bluetoothAdvertisingAddress;
    v6->_bluetoothAdvertisingAddress = (NSData *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothPeerIdentifier"));
    bluetoothPeerIdentifier = v6->_bluetoothPeerIdentifier;
    v6->_bluetoothPeerIdentifier = (NSUUID *)v25;

    objc_msgSend(v5, "signalStrength");
    v6->_signalStrength = v27;
    v6->_remoteTxAntennaMask = objc_msgSend(v5, "remoteTxAntennaMask");
    objc_msgSend(v5, "rangeBiasEstimate");
    v6->_rangeBiasEstimate = v28;
    objc_msgSend(v5, "rangeUncertainty");
    v6->_rangeUncertainty = v29;
    objc_msgSend(v5, "worldPosition");
    *(_OWORD *)v6->_worldPosition = v30;
    v6->_requiresBiasCorrection = objc_msgSend(v5, "requiresBiasCorrection");
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uwbSignalFeatures"));
    uwbSignalFeatures = v6->_uwbSignalFeatures;
    v6->_uwbSignalFeatures = (UWBSignalFeatures *)v31;

    v6->_nbRxStatus = objc_msgSend(v5, "nbRxStatus");
    v6->_mmsRxStatus = objc_msgSend(v5, "mmsRxStatus");
    objc_msgSend(v5, "nbRssi");
    v6->_nbRssi = v33;
    v6->_canInteract = objc_msgSend(v5, "canInteract");
    v6->_resetARSession = objc_msgSend(v5, "resetARSession");
    v6->_revokeFindingExperience = objc_msgSend(v5, "revokeFindingExperience");
    objc_msgSend(v5, "boundedRegionRange");
    v6->_boundedRegionRange = v34;
    v6->_algorithmSource = (int64_t)objc_msgSend(v5, "algorithmSource");
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugDisplayInfo"));
    debugDisplayInfo = v6->_debugDisplayInfo;
    v6->_debugDisplayInfo = (NSString *)v35;

  }
  return v6;
}

- (NINearbyObject)init
{
  __assert_rtn("-[NINearbyObject init]", "NINearbyObject.mm", 199, "NO");
}

+ (NINearbyObject)new
{
  __assert_rtn("+[NINearbyObject new]", "NINearbyObject.mm", 204, "NO");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithNearbyObject:", self);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_discoveryToken, CFSTR("discoveryToken"));
  *(float *)&v4 = self->_distance;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("distance"), v4);
  objc_msgSend(v10, "encodeVector3:forKey:", CFSTR("direction"), *(double *)self->_direction);
  *(float *)&v5 = self->_azimuth;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("azimuth"), v5);
  *(float *)&v6 = self->_elevation;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("elevation"), v6);
  objc_msgSend(v10, "encodeQuat:forKey:", CFSTR("quaternion"), *(double *)self->_anon_d0);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_relationship, CFSTR("relationship"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_distanceMeasurementQuality, CFSTR("measurementQuality"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_motionState, CFSTR("motionState"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_verticalDirectionEstimate, CFSTR("verticalDirectionEstimate"));
  *(float *)&v7 = self->_horizontalAngle;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("horizontalAngle"), v7);
  *(float *)&v8 = self->_horizontalAngleAccuracy;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("horizontalAngleAccuracy"), v8);
  objc_msgSend(v10, "encodeObject:forKey:", self->_spatialScore, CFSTR("spatialScore"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_bluetoothAdvertisingAddress, CFSTR("bluetoothAdvertisingAddress"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_bluetoothPeerIdentifier, CFSTR("bluetoothPeerIdentifier"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("signalStrength"), self->_signalStrength);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_remoteTxAntennaMask, CFSTR("remoteTxAntennaMask"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("rangeBiasEstimate"), self->_rangeBiasEstimate);
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("rangeUncertainty"), self->_rangeUncertainty);
  objc_msgSend(v10, "encodeVector3:forKey:", CFSTR("worldPosition"), *(double *)self->_worldPosition);
  objc_msgSend(v10, "encodeBool:forKey:", self->_requiresBiasCorrection, CFSTR("requiresBiasCorrection"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_uwbSignalFeatures, CFSTR("uwbSignalFeatures"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_nbRxStatus, CFSTR("nbRxStatus"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_mmsRxStatus, CFSTR("mmsRxStatus"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("nbRssi"), self->_nbRssi);
  objc_msgSend(v10, "encodeBool:forKey:", self->_canInteract, CFSTR("canInteract"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_resetARSession, CFSTR("resetARSession"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_revokeFindingExperience, CFSTR("revokeFindingExperience"));
  *(float *)&v9 = self->_boundedRegionRange;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundedRegionRange"), v9);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_algorithmSource, CFSTR("algorithmSource"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_debugDisplayInfo, CFSTR("debugDisplayInfo"));

}

- (NINearbyObject)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  float v10;
  __int128 v11;
  float v12;
  float v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  uint64_t v44;
  id v45;
  double v46;
  double v47;
  float v48;
  float v49;
  uint64_t v50;
  id v51;
  void *v52;
  NINearbyObject *v53;
  NINearbyObject *v54;
  NINearbyObject *v55;
  id v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
  __int128 v64;
  unsigned __int8 v65;
  __int128 v66;
  float v67;
  float v68;
  __int128 v69;
  float v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  objc_super v75;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v5), CFSTR("discoveryToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (v9 = objc_opt_class(NIDiscoveryToken, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distance"));
    v70 = v10;
    objc_msgSend(v4, "decodeVector3ForKey:", CFSTR("direction"));
    v69 = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("azimuth"));
    v68 = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("elevation"));
    v67 = v13;
    objc_msgSend(v4, "decodeQuatForKey:", CFSTR("quaternion"));
    v66 = v14;
    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v15), CFSTR("deviceIdentifier"));
    v74 = (id)objc_claimAutoreleasedReturnValue(v16);
    v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relationship"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v19 = v18;
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("measurementQuality"));
    v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("motionState"));
    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), CFSTR("name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v25), CFSTR("spatialScore"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v27), CFSTR("bluetoothAdvertisingAddress"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v30), CFSTR("bluetoothPeerIdentifier"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verticalDirectionEstimate"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("horizontalAngle"));
    v34 = v33;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("horizontalAngleAccuracy"));
    v36 = v35;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("signalStrength"));
    v38 = v37;
    v65 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("remoteTxAntennaMask"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rangeBiasEstimate"));
    v40 = v39;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rangeUncertainty"));
    v42 = v41;
    objc_msgSend(v4, "decodeVector3ForKey:", CFSTR("worldPosition"));
    v64 = v43;
    v63 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresBiasCorrection"));
    v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(UWBSignalFeatures, v44), CFSTR("uwbSignalFeatures"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v62 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("nbRxStatus"));
    v61 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("mmsRxStatus"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("nbRssi"));
    v47 = v46;
    v60 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canInteract"));
    v59 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resetARSession"));
    v58 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revokeFindingExperience"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundedRegionRange"));
    v49 = v48;
    v57 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("algorithmSource"));
    v51 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v50), CFSTR("debugDisplayInfo"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v75.receiver = self;
    v75.super_class = (Class)NINearbyObject;
    v53 = -[NINearbyObject init](&v75, "init");
    v54 = v53;
    if (v53)
    {
      objc_storeStrong((id *)&v53->_discoveryToken, v8);
      v54->_distance = v70;
      v54->_azimuth = v68;
      v54->_elevation = v67;
      *(_OWORD *)v54->_direction = v69;
      *(_OWORD *)v54->_anon_d0 = v66;
      v54->_relationship = (unint64_t)v17;
      objc_storeStrong((id *)&v54->_deviceIdentifier, v74);
      v54->_timestamp = v19;
      v54->_distanceMeasurementQuality = (int64_t)v20;
      v54->_motionState = (int64_t)v21;
      objc_storeStrong((id *)&v54->_name, v24);
      v54->_verticalDirectionEstimate = (int64_t)v32;
      v54->_horizontalAngle = v34;
      v54->_horizontalAngleAccuracy = v36;
      objc_storeStrong((id *)&v54->_spatialScore, v73);
      objc_storeStrong((id *)&v54->_bluetoothAdvertisingAddress, v29);
      objc_storeStrong((id *)&v54->_bluetoothPeerIdentifier, v72);
      v54->_remoteTxAntennaMask = v65;
      v54->_signalStrength = v38;
      v54->_rangeBiasEstimate = v40;
      v54->_rangeUncertainty = v42;
      *(_OWORD *)v54->_worldPosition = v64;
      v54->_requiresBiasCorrection = v63;
      objc_storeStrong((id *)&v54->_uwbSignalFeatures, v71);
      v54->_nbRxStatus = v62;
      v54->_mmsRxStatus = v61;
      v54->_nbRssi = v47;
      v54->_canInteract = v60;
      v54->_resetARSession = v59;
      v54->_revokeFindingExperience = v58;
      v54->_boundedRegionRange = v49;
      v54->_algorithmSource = (int64_t)v57;
      objc_storeStrong((id *)&v54->_debugDisplayInfo, v52);
    }
    self = v54;

    v55 = self;
  }
  else
  {
    v55 = 0;
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NINearbyObject *v7;
  NINearbyObject *v8;
  NIDiscoveryToken *discoveryToken;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSString *deviceIdentifier;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  float distance;
  float v18;
  float v19;
  float32x4_t v20;
  int64_t distanceMeasurementQuality;
  id v22;
  unint64_t relationship;
  id v24;
  double timestamp;
  double v26;
  double v27;
  int64_t motionState;
  double signalStrength;
  double v30;
  double v31;
  double rangeBiasEstimate;
  double v33;
  double v34;
  double v35;
  NSString *name;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  int64_t verticalDirectionEstimate;
  NINearbyObjectVerticalDirectionEstimate v41;
  float v42;
  float v43;
  NSNumber *spatialScore;
  void *v45;
  void *v46;
  NSData *bluetoothAdvertisingAddress;
  void *v48;
  void *v49;
  NSUUID *bluetoothPeerIdentifier;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  float32x4_t v54;
  UWBSignalFeatures *uwbSignalFeatures;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  int nbRxStatus;
  unsigned int v60;
  int mmsRxStatus;
  double v62;
  _BOOL4 canInteract;
  unsigned __int8 v64;
  unsigned __int8 v65;
  float v66;
  id v67;
  NSString *debugDisplayInfo;
  void *v69;
  void *v70;
  unsigned __int8 v71;
  uint32x4_t v72;
  BOOL v73;
  uint32x4_t v74;
  int v75;
  char v76;
  char v77;
  char v78;
  char v79;
  int64_t algorithmSource;
  float v82;
  float boundedRegionRange;
  unsigned int v84;
  int revokeFindingExperience;
  int v86;
  char v87;
  unsigned int v88;
  int resetARSession;
  unsigned int v90;
  int v91;
  double v92;
  double nbRssi;
  unsigned int v94;
  id v95;
  unsigned int v96;
  int requiresBiasCorrection;
  unsigned __int8 v98;
  float32x4_t v99;
  float32x4_t v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  float v103;
  float horizontalAngleAccuracy;
  int64_t v105;
  int64_t v106;
  unsigned __int8 v107;
  float v108;
  float horizontalAngle;
  double v110;
  double rangeUncertainty;
  id v112;
  id v113;
  unint64_t v114;
  unsigned int v115;
  int remoteTxAntennaMask;
  id v117;
  float32x4_t v118;
  float32x4_t v119;
  id v120;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NINearbyObject *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v79 = 1;
LABEL_60:

      goto LABEL_61;
    }
    discoveryToken = self->_discoveryToken;
    v120 = v4;
    if (!discoveryToken)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject discoveryToken](v7, "discoveryToken"));

      if (!v10)
      {
        v12 = 1;
LABEL_7:
        deviceIdentifier = self->_deviceIdentifier;
        if (!deviceIdentifier)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifier](v8, "deviceIdentifier"));

          if (!v14)
          {
            v16 = 1;
LABEL_11:
            distance = self->_distance;
            -[NINearbyObject distance](v8, "distance");
            v19 = v18;
            v119 = *(float32x4_t *)self->_direction;
            -[NINearbyObject direction](v8, "direction");
            v118 = v20;
            distanceMeasurementQuality = self->_distanceMeasurementQuality;
            v22 = -[NINearbyObject distanceMeasurementQuality](v8, "distanceMeasurementQuality");
            relationship = self->_relationship;
            v24 = -[NINearbyObject relationship](v8, "relationship");
            timestamp = self->_timestamp;
            -[NINearbyObject timestamp](v8, "timestamp");
            v27 = v26;
            motionState = self->_motionState;
            v117 = -[NINearbyObject motionState](v8, "motionState");
            signalStrength = self->_signalStrength;
            -[NINearbyObject signalStrength](v8, "signalStrength");
            v31 = v30;
            remoteTxAntennaMask = self->_remoteTxAntennaMask;
            v115 = -[NINearbyObject remoteTxAntennaMask](v8, "remoteTxAntennaMask");
            rangeBiasEstimate = self->_rangeBiasEstimate;
            -[NINearbyObject rangeBiasEstimate](v8, "rangeBiasEstimate");
            v34 = v33;
            v112 = (id)motionState;
            v113 = v24;
            v114 = relationship;
            rangeUncertainty = self->_rangeUncertainty;
            -[NINearbyObject rangeUncertainty](v8, "rangeUncertainty");
            v110 = v35;
            name = self->_name;
            if (!name)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject name](v8, "name"));

              if (!v37)
              {
                v39 = 1;
LABEL_15:
                verticalDirectionEstimate = self->_verticalDirectionEstimate;
                v41 = -[NINearbyObject verticalDirectionEstimate](v8, "verticalDirectionEstimate");
                horizontalAngle = self->_horizontalAngle;
                -[NINearbyObject horizontalAngle](v8, "horizontalAngle");
                v108 = v42;
                v105 = v41;
                v106 = verticalDirectionEstimate;
                v107 = v39;
                horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
                -[NINearbyObject horizontalAngleAccuracy](v8, "horizontalAngleAccuracy");
                v103 = v43;
                spatialScore = self->_spatialScore;
                if (!spatialScore)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject spatialScore](v8, "spatialScore"));

                  if (!v45)
                  {
                    v102 = 1;
LABEL_19:
                    bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    if (!bluetoothAdvertisingAddress)
                    {
                      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothAdvertisingAddress](v8, "bluetoothAdvertisingAddress"));

                      if (!v48)
                      {
                        v101 = 1;
LABEL_23:
                        bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        if (!bluetoothPeerIdentifier)
                        {
                          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothPeerIdentifier](v8, "bluetoothPeerIdentifier"));

                          if (!v51)
                          {
                            v53 = 1;
LABEL_27:
                            v100 = *(float32x4_t *)self->_worldPosition;
                            -[NINearbyObject worldPosition](v8, "worldPosition");
                            v99 = v54;
                            requiresBiasCorrection = self->_requiresBiasCorrection;
                            v98 = v53;
                            v96 = -[NINearbyObject requiresBiasCorrection](v8, "requiresBiasCorrection");
                            uwbSignalFeatures = self->_uwbSignalFeatures;
                            v95 = v22;
                            if (!uwbSignalFeatures)
                            {
                              v56 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject uwbSignalFeatures](v8, "uwbSignalFeatures"));

                              if (!v56)
                                goto LABEL_31;
                              uwbSignalFeatures = self->_uwbSignalFeatures;
                            }
                            v57 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject uwbSignalFeatures](v8, "uwbSignalFeatures"));
                            v58 = -[UWBSignalFeatures isEqual:](uwbSignalFeatures, "isEqual:", v57);

                            LOBYTE(v56) = v58 ^ 1;
LABEL_31:
                            nbRxStatus = self->_nbRxStatus;
                            v60 = -[NINearbyObject nbRxStatus](v8, "nbRxStatus");
                            mmsRxStatus = self->_mmsRxStatus;
                            v94 = -[NINearbyObject mmsRxStatus](v8, "mmsRxStatus");
                            v91 = mmsRxStatus;
                            nbRssi = self->_nbRssi;
                            -[NINearbyObject nbRssi](v8, "nbRssi");
                            v92 = v62;
                            canInteract = self->_canInteract;
                            v90 = -[NINearbyObject canInteract](v8, "canInteract");
                            resetARSession = self->_resetARSession;
                            v88 = -[NINearbyObject resetARSession](v8, "resetARSession");
                            v86 = canInteract;
                            v87 = (char)v56;
                            revokeFindingExperience = self->_revokeFindingExperience;
                            v84 = -[NINearbyObject revokeFindingExperience](v8, "revokeFindingExperience");
                            v64 = v16;
                            v65 = v12;
                            boundedRegionRange = self->_boundedRegionRange;
                            -[NINearbyObject boundedRegionRange](v8, "boundedRegionRange");
                            v82 = v66;
                            algorithmSource = self->_algorithmSource;
                            v67 = -[NINearbyObject algorithmSource](v8, "algorithmSource");
                            debugDisplayInfo = self->_debugDisplayInfo;
                            if (!debugDisplayInfo)
                            {
                              v69 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject debugDisplayInfo](v8, "debugDisplayInfo"));

                              if (!v69)
                              {
                                v71 = 1;
                                goto LABEL_35;
                              }
                              debugDisplayInfo = self->_debugDisplayInfo;
                            }
                            v70 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject debugDisplayInfo](v8, "debugDisplayInfo"));
                            v71 = -[NSString isEqualToString:](debugDisplayInfo, "isEqualToString:", v70);

LABEL_35:
                            v72 = (uint32x4_t)vceqq_f32(v100, v99);
                            v72.i32[3] = v72.i32[2];
                            v73 = (vminvq_u32(v72) & 0x80000000) == 0;
                            v74 = (uint32x4_t)vceqq_f32(v119, v118);
                            v74.i32[3] = v74.i32[2];
                            v75 = vminvq_u32(v74);
                            v76 = v65 ^ 1;
                            if (distance != v19)
                              v76 = 1;
                            if (v75 >= 0)
                              v76 = 1;
                            if ((id)distanceMeasurementQuality != v95)
                              v76 = 1;
                            v77 = v76 | v64 ^ 1;
                            if ((id)v114 != v113)
                              v77 = 1;
                            v78 = (nbRxStatus == v60) & ~(v77 | (timestamp != v27 || v112 != v117) | v107 ^ 1 | (v106 != v105) | (horizontalAngle != v108) | (horizontalAngleAccuracy != v103) | v102 ^ 1 | v101 ^ 1 | v98 ^ 1 | (signalStrength != v31) | (remoteTxAntennaMask != v115) | v73 | (requiresBiasCorrection != v96) | (rangeUncertainty != v110) | (rangeBiasEstimate != v34) | v87);
                            if (v91 != v94)
                              v78 = 0;
                            if (nbRssi != v92)
                              v78 = 0;
                            if (v86 != v90)
                              v78 = 0;
                            if (resetARSession != v88)
                              v78 = 0;
                            if (revokeFindingExperience != v84)
                              v78 = 0;
                            if (boundedRegionRange != v82)
                              v78 = 0;
                            if ((id)algorithmSource != v67)
                              v78 = 0;
                            v79 = v78 & v71;
                            v4 = v120;
                            goto LABEL_60;
                          }
                          bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        }
                        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothPeerIdentifier](v8, "bluetoothPeerIdentifier"));
                        v53 = -[NSUUID isEqual:](bluetoothPeerIdentifier, "isEqual:", v52);

                        goto LABEL_27;
                      }
                      bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    }
                    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothAdvertisingAddress](v8, "bluetoothAdvertisingAddress"));
                    v101 = -[NSData isEqualToData:](bluetoothAdvertisingAddress, "isEqualToData:", v49);

                    goto LABEL_23;
                  }
                  spatialScore = self->_spatialScore;
                }
                v46 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject spatialScore](v8, "spatialScore"));
                v102 = -[NSNumber isEqualToNumber:](spatialScore, "isEqualToNumber:", v46);

                goto LABEL_19;
              }
              name = self->_name;
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject name](v8, "name"));
            v39 = -[NSString isEqualToString:](name, "isEqualToString:", v38);

            goto LABEL_15;
          }
          deviceIdentifier = self->_deviceIdentifier;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifier](v8, "deviceIdentifier"));
        v16 = -[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v15);

        goto LABEL_11;
      }
      discoveryToken = self->_discoveryToken;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject discoveryToken](v8, "discoveryToken"));
    v12 = -[NIDiscoveryToken isEqual:](discoveryToken, "isEqual:", v11);

    goto LABEL_7;
  }
  v79 = 0;
LABEL_61:

  return v79;
}

- (unint64_t)hash
{
  double v2;
  NIDiscoveryToken *discoveryToken;
  float distance;
  float v6;
  __n128 v7;
  uint32x4_t v8;
  double timestamp;
  double v10;
  double v11;
  float horizontalAngle;
  float v13;
  float v14;
  float horizontalAngleAccuracy;
  __n128 v16;
  uint32x4_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  NSUInteger v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  NSUInteger v54;
  void *v55;
  NSUInteger v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
    v64 = -[NIDiscoveryToken hash](discoveryToken, "hash");
  else
    v64 = 0;
  distance = self->_distance;
  v6 = NINearbyObjectDistanceNotAvailable;
  if (distance == NINearbyObjectDistanceNotAvailable)
  {
    v63 = 0;
  }
  else
  {
    *(float *)&v2 = self->_distance;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2));
    v63 = (unint64_t)objc_msgSend(v33, "hash");
  }
  v7 = *(__n128 *)self->_direction;
  v8 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectDirectionNotAvailable, (float32x4_t)v7);
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) != 0)
    v62 = 0;
  else
    v62 = sub_1001D2020(v7);
  timestamp = self->_timestamp;
  v10 = *(double *)&qword_10085FC10;
  if (timestamp == *(double *)&qword_10085FC10)
  {
    v61 = 0;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
    v61 = (unint64_t)objc_msgSend(v32, "hash");
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_distanceMeasurementQuality));
  v60 = (unint64_t)objc_msgSend(v71, "hash");
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_motionState));
  v58 = (unint64_t)objc_msgSend(v70, "hash");
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_relationship));
  v57 = (unint64_t)objc_msgSend(v69, "hash");
  v56 = -[NSString hash](self->_deviceIdentifier, "hash");
  v54 = -[NSString hash](self->_name, "hash");
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_verticalDirectionEstimate));
  v53 = (unint64_t)objc_msgSend(v68, "hash");
  horizontalAngle = self->_horizontalAngle;
  v13 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
  {
    v52 = 0;
  }
  else
  {
    *(float *)&v11 = self->_horizontalAngle;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v52 = (unint64_t)objc_msgSend(v31, "hash");
  }
  v14 = NINearbyObjectAngleNotAvailable;
  horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    v49 = 0;
  }
  else
  {
    *(float *)&v11 = self->_horizontalAngleAccuracy;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v49 = (unint64_t)objc_msgSend(v30, "hash");
  }
  v50 = (unint64_t)-[NSNumber hash](self->_spatialScore, "hash");
  v48 = (unint64_t)-[NSData hash](self->_bluetoothAdvertisingAddress, "hash");
  v47 = (unint64_t)-[NSUUID hash](self->_bluetoothPeerIdentifier, "hash");
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_signalStrength));
  v46 = (unint64_t)objc_msgSend(v67, "hash");
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_remoteTxAntennaMask));
  v45 = (unint64_t)objc_msgSend(v66, "hash");
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rangeBiasEstimate));
  v44 = (unint64_t)objc_msgSend(v65, "hash");
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rangeUncertainty));
  v43 = (unint64_t)objc_msgSend(v59, "hash");
  v16 = *(__n128 *)self->_worldPosition;
  v17 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectWorldPositionNotAvailable, (float32x4_t)v16);
  v17.i32[3] = v17.i32[2];
  if ((vminvq_u32(v17) & 0x80000000) != 0)
    v42 = 0;
  else
    v42 = sub_1001D2020(v16);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_requiresBiasCorrection));
  v41 = (unint64_t)objc_msgSend(v55, "hash");
  v40 = -[UWBSignalFeatures hash](self->_uwbSignalFeatures, "hash");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nbRxStatus));
  v39 = (unint64_t)objc_msgSend(v51, "hash");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mmsRxStatus));
  v38 = (unint64_t)objc_msgSend(v18, "hash");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_nbRssi));
  v37 = (unint64_t)objc_msgSend(v19, "hash");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_canInteract));
  v36 = (unint64_t)objc_msgSend(v20, "hash");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_resetARSession));
  v35 = (unint64_t)objc_msgSend(v21, "hash");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_revokeFindingExperience));
  v34 = (unint64_t)objc_msgSend(v22, "hash");
  *(float *)&v23 = self->_boundedRegionRange;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  v25 = (unint64_t)objc_msgSend(v24, "hash");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_algorithmSource));
  v27 = (unint64_t)objc_msgSend(v26, "hash");
  v28 = -[NSString hash](self->_debugDisplayInfo, "hash");

  if (horizontalAngleAccuracy != v14)
  if (horizontalAngle != v13)

  if (timestamp != v10)
  if (distance != v6)

  return v63 ^ v64 ^ v62 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v54 ^ v53 ^ v52 ^ v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v25 ^ v27 ^ v28;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  NIDiscoveryToken *discoveryToken;
  void *v10;
  float distance;
  float32x4_t v12;
  uint32x4_t v13;
  float horizontalAngle;
  unint64_t verticalDirectionEstimate;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](discoveryToken, "descriptionInternal"));
    objc_msgSend(v8, "appendFormat:", CFSTR("Token: %@"), v10);

  }
  else
  {
    objc_msgSend(v8, "appendString:", CFSTR("Token: null"));
  }
  distance = self->_distance;
  if (distance == NINearbyObjectDistanceNotAvailable)
    objc_msgSend(v8, "appendString:", CFSTR(", Distance not available"));
  else
    objc_msgSend(v8, "appendFormat:", CFSTR(", Distance: %.2fm"), distance);
  v12 = *(float32x4_t *)self->_direction;
  v13 = (uint32x4_t)vceqq_f32(v12, (float32x4_t)NINearbyObjectDirectionNotAvailable);
  v13.i32[3] = v13.i32[2];
  if ((vminvq_u32(v13) & 0x80000000) != 0)
    objc_msgSend(v8, "appendString:", CFSTR(", Direction not available"));
  else
    objc_msgSend(v8, "appendFormat:", CFSTR(", Direction: (%.3f,%.3f,%.3f)"), v12.f32[0], v12.f32[1], v12.f32[2]);
  horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
    objc_msgSend(v8, "appendFormat:", CFSTR(", Horizontal Angle: %.2frad"), horizontalAngle);
  else
    objc_msgSend(v8, "appendString:", CFSTR(", Horizontal Angle not available"));
  verticalDirectionEstimate = self->_verticalDirectionEstimate;
  if (verticalDirectionEstimate >= 5)
    __assert_rtn("NINearbyObjectVerticalDirectionEstimateToString", "NINearbyObject.mm", 78, "false");
  objc_msgSend(v8, "appendFormat:", CFSTR(", Vertical Direction Estimate: %@ "), off_10080D058[verticalDirectionEstimate]);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (id)descriptionInternal
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  float horizontalAngleAccuracy;
  float v12;
  __CFString *v13;
  unint64_t distanceMeasurementQuality;
  unint64_t motionState;
  double signalStrength;
  double v17;
  __CFString *v18;
  int remoteTxAntennaMask;
  int v20;
  __CFString *v21;
  float32x4_t v22;
  uint32x4_t v23;
  const __CFString *v24;
  double rangeBiasEstimate;
  double v26;
  __CFString *v27;
  double rangeUncertainty;
  double v29;
  __CFString *v30;
  void *v31;
  int nbRxStatus;
  int v33;
  __CFString *v34;
  int mmsRxStatus;
  int v36;
  __CFString *v37;
  double nbRssi;
  double v39;
  __CFString *v40;
  const __CFString *v41;
  int v43;
  const char *v44;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject description](self, "description"));
  objc_msgSend(v8, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifer](self, "deviceIdentifer"));
  objc_msgSend(v8, "appendFormat:", CFSTR(", deviceIdentifier: %@"), v10);

  horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  v12 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
    v13 = CFSTR("-");
  else
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.2frad"), horizontalAngleAccuracy));
  objc_msgSend(v8, "appendFormat:", CFSTR(", HorizAngleAcc: %@"), v13);
  if (horizontalAngleAccuracy != v12)

  distanceMeasurementQuality = self->_distanceMeasurementQuality;
  if (distanceMeasurementQuality > 3)
  {
    v43 = 46;
    v44 = "NIDistanceMeasurementQualityToString";
    goto LABEL_55;
  }
  objc_msgSend(v8, "appendFormat:", CFSTR(", Ranging Quality: %@ "), off_10080D080[distanceMeasurementQuality]);
  motionState = self->_motionState;
  if (motionState >= 3)
  {
    v43 = 60;
    v44 = "NIMotionActivityStateToString";
LABEL_55:
    __assert_rtn(v44, "NINearbyObject.mm", v43, "false");
  }
  objc_msgSend(v8, "appendFormat:", CFSTR(", Motion State: %@"), off_10080D0A0[motionState]);
  signalStrength = self->_signalStrength;
  v17 = *(double *)&NINearbyObjectSignalStrengthNotAvailable;
  if (signalStrength == *(double *)&NINearbyObjectSignalStrengthNotAvailable)
    v18 = CFSTR("-");
  else
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.2f dBm"), *(_QWORD *)&self->_signalStrength));
  objc_msgSend(v8, "appendFormat:", CFSTR(", Signal Strength: %@"), v18);
  if (signalStrength != v17)

  remoteTxAntennaMask = self->_remoteTxAntennaMask;
  v20 = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
  if (remoteTxAntennaMask == NINearbyObjectRemoteTxAntennaMaskNotAvailable)
    v21 = CFSTR("-");
  else
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02x"), self->_remoteTxAntennaMask));
  objc_msgSend(v8, "appendFormat:", CFSTR(", Remote Tx Antenna Mask: %@"), v21);
  if (remoteTxAntennaMask != v20)

  v22 = *(float32x4_t *)self->_worldPosition;
  v23 = (uint32x4_t)vceqq_f32(v22, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) != 0)
    objc_msgSend(v8, "appendString:", CFSTR(", World Position not available"));
  else
    objc_msgSend(v8, "appendFormat:", CFSTR(", World Position: (%.2f,%.2f,%.2f)"), v22.f32[0], v22.f32[1], v22.f32[2]);
  if (self->_requiresBiasCorrection)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v8, "appendFormat:", CFSTR(", Require Bias Correction: %@"), v24);
  rangeBiasEstimate = self->_rangeBiasEstimate;
  v26 = *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable;
  if (rangeBiasEstimate == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
    v27 = CFSTR("-");
  else
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.2f m"), *(_QWORD *)&self->_rangeBiasEstimate));
  objc_msgSend(v8, "appendFormat:", CFSTR(", Range Bias Estimate: %@"), v27);
  if (rangeBiasEstimate != v26)

  rangeUncertainty = self->_rangeUncertainty;
  v29 = *(double *)&NINearbyObjectRangeUncertaintyNotAvailable;
  if (rangeUncertainty == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
    v30 = CFSTR("-");
  else
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.2f m"), *(_QWORD *)&self->_rangeUncertainty));
  objc_msgSend(v8, "appendFormat:", CFSTR(", Range Uncertainty: %@"), v30);
  if (rangeUncertainty != v29)

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UWBSignalFeatures description](self->_uwbSignalFeatures, "description"));
  objc_msgSend(v8, "appendFormat:", CFSTR(", Bias features: %@"), v31);

  nbRxStatus = self->_nbRxStatus;
  v33 = NINearbyObjectRxStatusNotAvailable;
  if (nbRxStatus == NINearbyObjectRxStatusNotAvailable)
    v34 = CFSTR("-");
  else
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_nbRxStatus));
  objc_msgSend(v8, "appendFormat:", CFSTR(", NB Rx status: %@"), v34);
  if (nbRxStatus != v33)

  mmsRxStatus = self->_mmsRxStatus;
  v36 = NINearbyObjectRxStatusNotAvailable;
  if (mmsRxStatus == NINearbyObjectRxStatusNotAvailable)
    v37 = CFSTR("-");
  else
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_mmsRxStatus));
  objc_msgSend(v8, "appendFormat:", CFSTR(", UWB Rx status: %@"), v37);
  if (mmsRxStatus != v36)

  nbRssi = self->_nbRssi;
  v39 = *(double *)&NINearbyObjectNbRssiNotAvailable;
  if (nbRssi == *(double *)&NINearbyObjectNbRssiNotAvailable)
    v40 = CFSTR("-");
  else
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.2f dBm"), *(_QWORD *)&self->_nbRssi));
  objc_msgSend(v8, "appendFormat:", CFSTR(", NB RSSI: %@"), v40);
  if (nbRssi != v39)

  if (self->_canInteract)
    v41 = CFSTR("YES");
  else
    v41 = CFSTR("NO");
  objc_msgSend(v8, "appendFormat:", CFSTR(", Can Interact: %@"), v41);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (id)deviceIdentifer
{
  return self->_deviceIdentifier;
}

+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  NINearbyObject *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v7);
  -[NINearbyObject setName:](v10, "setName:", v8);
  -[NINearbyObject setDeviceIdentifier:](v10, "setDeviceIdentifier:", v9);

  return v10;
}

- (void)overrideDistance:(float)a3
{
  self->_distance = a3;
}

- (void)overrideDirection:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_direction = v2;
}

- (void)overrideRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (void)overrideDistanceMeasurementQuality:(int64_t)a3
{
  self->_distanceMeasurementQuality = a3;
}

- (void)overrideMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (void)overrideTimestamp:(float)a3
{
  self->_timestamp = a3;
}

- (void)overrideSpatialScore:(id)a3
{
  objc_storeStrong((id *)&self->_spatialScore, a3);
}

- (NIDiscoveryToken)discoveryToken
{
  return self->_discoveryToken;
}

- (void)setDiscoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (void)setDirection:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_direction = v2;
}

- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate
{
  return self->_verticalDirectionEstimate;
}

- (void)setVerticalDirectionEstimate:(int64_t)a3
{
  self->_verticalDirectionEstimate = a3;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(float)a3
{
  self->_horizontalAngle = a3;
}

- (__n128)quaternion
{
  return a1[13];
}

- (__n128)setQuaternion:(__n128 *)result
{
  result[13] = a2;
  return result;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)elevation
{
  return self->_elevation;
}

- (void)setElevation:(float)a3
{
  self->_elevation = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)distanceMeasurementQuality
{
  return self->_distanceMeasurementQuality;
}

- (void)setDistanceMeasurementQuality:(int64_t)a3
{
  self->_distanceMeasurementQuality = a3;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)spatialScore
{
  return self->_spatialScore;
}

- (void)setSpatialScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)bluetoothAdvertisingAddress
{
  return self->_bluetoothAdvertisingAddress;
}

- (void)setBluetoothAdvertisingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSUUID)bluetoothPeerIdentifier
{
  return self->_bluetoothPeerIdentifier;
}

- (void)setBluetoothPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (float)horizontalAngleAccuracy
{
  return self->_horizontalAngleAccuracy;
}

- (void)setHorizontalAngleAccuracy:(float)a3
{
  self->_horizontalAngleAccuracy = a3;
}

- (double)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(double)a3
{
  self->_signalStrength = a3;
}

- (double)rangeBiasEstimate
{
  return self->_rangeBiasEstimate;
}

- (void)setRangeBiasEstimate:(double)a3
{
  self->_rangeBiasEstimate = a3;
}

- (double)rangeUncertainty
{
  return self->_rangeUncertainty;
}

- (void)setRangeUncertainty:(double)a3
{
  self->_rangeUncertainty = a3;
}

- (unsigned)remoteTxAntennaMask
{
  return self->_remoteTxAntennaMask;
}

- (void)setRemoteTxAntennaMask:(unsigned __int8)a3
{
  self->_remoteTxAntennaMask = a3;
}

- (__n128)worldPosition
{
  return a1[14];
}

- (void)setWorldPosition:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_worldPosition = v2;
}

- (BOOL)requiresBiasCorrection
{
  return self->_requiresBiasCorrection;
}

- (void)setRequiresBiasCorrection:(BOOL)a3
{
  self->_requiresBiasCorrection = a3;
}

- (UWBSignalFeatures)uwbSignalFeatures
{
  return self->_uwbSignalFeatures;
}

- (void)setUwbSignalFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unsigned)nbRxStatus
{
  return self->_nbRxStatus;
}

- (void)setNbRxStatus:(unsigned __int8)a3
{
  self->_nbRxStatus = a3;
}

- (unsigned)mmsRxStatus
{
  return self->_mmsRxStatus;
}

- (void)setMmsRxStatus:(unsigned __int8)a3
{
  self->_mmsRxStatus = a3;
}

- (double)nbRssi
{
  return self->_nbRssi;
}

- (void)setNbRssi:(double)a3
{
  self->_nbRssi = a3;
}

- (BOOL)canInteract
{
  return self->_canInteract;
}

- (void)setCanInteract:(BOOL)a3
{
  self->_canInteract = a3;
}

- (float)boundedRegionRange
{
  return self->_boundedRegionRange;
}

- (void)setBoundedRegionRange:(float)a3
{
  self->_boundedRegionRange = a3;
}

- (int64_t)algorithmSource
{
  return self->_algorithmSource;
}

- (void)setAlgorithmSource:(int64_t)a3
{
  self->_algorithmSource = a3;
}

- (NSString)debugDisplayInfo
{
  return self->_debugDisplayInfo;
}

- (void)setDebugDisplayInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)resetARSession
{
  return self->_resetARSession;
}

- (void)setResetARSession:(BOOL)a3
{
  self->_resetARSession = a3;
}

- (BOOL)revokeFindingExperience
{
  return self->_revokeFindingExperience;
}

- (void)setRevokeFindingExperience:(BOOL)a3
{
  self->_revokeFindingExperience = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDisplayInfo, 0);
  objc_storeStrong((id *)&self->_uwbSignalFeatures, 0);
  objc_storeStrong((id *)&self->_bluetoothPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_spatialScore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
}

+ (id)objectFromBluetoothDevice:(id)a3
{
  id v3;
  NINearbyObject *v4;
  void *v5;
  NINearbyObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = [NINearbyObject alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "discoveryToken"));
  v6 = -[NINearbyObject initWithToken:](v4, "initWithToken:", v5);

  if (objc_msgSend(v3, "systemKeyRelationship"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceID"));
    -[NINearbyObject setDeviceIdentifier:](v6, "setDeviceIdentifier:", v7);

    -[NINearbyObject setRelationship:](v6, "setRelationship:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    -[NINearbyObject setName:](v6, "setName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cbDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "btAddressData"));
    -[NINearbyObject setBluetoothAdvertisingAddress:](v6, "setBluetoothAdvertisingAddress:", v10);

  }
  return v6;
}

@end
