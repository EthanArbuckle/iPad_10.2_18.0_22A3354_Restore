@implementation NINearbyPeerConfiguration

- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken
{
  NIDiscoveryToken *v6;
  id *v7;
  NINearbyPeerConfiguration *v8;
  NSDictionary *debugParameters;
  void *v11;
  objc_super v12;

  v6 = peerToken;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peerToken"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NINearbyPeerConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (NINearbyPeerConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, peerToken);
    v8->_longRangeEnabled = 1;
    v8->_cameraAssistanceEnabled = 0;
    v8->_backgroundMode = 0;
    debugParameters = v8->_debugParameters;
    v8->_debugParameters = 0;

    v8->_extendedDistanceMeasurementEnabled = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  NSDictionary *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NINearbyPeerConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v10, "copyWithZone:");
  objc_msgSend(v5, "setLongRangeEnabled:", self->_longRangeEnabled);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v5, "setBackgroundMode:", self->_backgroundMode);
  v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v6;

  if (self->_debugParameters)
  {
    v8 = -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    objc_msgSend(v5, "setDebugParameters:", v8);

  }
  *((_BYTE *)v5 + 33) = self->_extendedDistanceMeasurementEnabled;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyPeerConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerDiscoveryToken, CFSTR("peerDiscoveryToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_longRangeEnabled, CFSTR("longRangeEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_backgroundMode, CFSTR("backgroundMode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_extendedDistanceMeasurementEnabled, CFSTR("extendedDistanceMeasurementEnabled"));

}

- (NINearbyPeerConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  NINearbyPeerConfiguration *v18;
  NINearbyPeerConfiguration *v19;
  int64_t v20;
  id obj;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v5), CFSTR("peerDiscoveryToken"));
  obj = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("longRangeEnabled"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundMode"));
  v25 = objc_opt_class(NSString, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

  v24 = objc_opt_class(NSNumber, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v12, v15, CFSTR("debugParameters")));
  v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extendedDistanceMeasurementEnabled"));
  v23.receiver = self;
  v23.super_class = (Class)NINearbyPeerConfiguration;
  v18 = -[NIConfiguration initWithCoder:](&v23, "initWithCoder:", v4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerDiscoveryToken, obj);
    v19->_longRangeEnabled = v7;
    v19->_cameraAssistanceEnabled = v8;
    objc_storeStrong((id *)&v19->_debugParameters, v16);
    if ((unint64_t)v9 >= 3)
      v20 = 0;
    else
      v20 = (int64_t)v9;
    v19->_backgroundMode = v20;
    v19->_extendedDistanceMeasurementEnabled = v17;
  }

  return v19;
}

- (NINearbyPeerConfiguration)init
{
  __assert_rtn("-[NINearbyPeerConfiguration init]", "NIConfiguration.mm", 543, "NO");
}

+ (NINearbyPeerConfiguration)new
{
  __assert_rtn("+[NINearbyPeerConfiguration new]", "NIConfiguration.mm", 548, "NO");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NINearbyPeerConfiguration *v7;
  NINearbyPeerConfiguration *v8;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v10;
  unsigned int v11;
  int longRangeEnabled;
  unsigned int v13;
  int cameraAssistanceEnabled;
  unsigned int v15;
  NSDictionary *debugParameters;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  int extendedDistanceMeasurementEnabled;
  unsigned int v21;
  BOOL v22;
  id v24;
  uint64_t v25;
  int64_t backgroundMode;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NINearbyPeerConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v22 = 1;
LABEL_16:

      goto LABEL_17;
    }
    peerDiscoveryToken = self->_peerDiscoveryToken;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](v7, "peerDiscoveryToken"));
    v11 = -[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v10);

    longRangeEnabled = self->_longRangeEnabled;
    v13 = -[NINearbyPeerConfiguration isLongRangeEnabled](v8, "isLongRangeEnabled");
    cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
    v15 = -[NINearbyPeerConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
    backgroundMode = self->_backgroundMode;
    v24 = -[NINearbyPeerConfiguration backgroundMode](v8, "backgroundMode");
    debugParameters = self->_debugParameters;
    if (!debugParameters)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](v8, "debugParameters"));

      if (!v17)
      {
        v19 = 1;
        goto LABEL_7;
      }
      debugParameters = self->_debugParameters;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](v8, "debugParameters", v24));
    v19 = -[NSDictionary isEqual:](debugParameters, "isEqual:", v18);

LABEL_7:
    extendedDistanceMeasurementEnabled = self->_extendedDistanceMeasurementEnabled;
    v21 = -[NINearbyPeerConfiguration isExtendedDistanceMeasurementEnabled](v8, "isExtendedDistanceMeasurementEnabled", v24);
    v22 = 0;
    if (v11 && longRangeEnabled == v13 && cameraAssistanceEnabled == v15 && backgroundMode == v25)
    {
      if (extendedDistanceMeasurementEnabled == v21)
        v22 = v19;
      else
        v22 = 0;
    }
    goto LABEL_16;
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL8 longRangeEnabled;
  _BOOL8 cameraAssistanceEnabled;
  int64_t backgroundMode;

  v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  longRangeEnabled = self->_longRangeEnabled;
  cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
  backgroundMode = self->_backgroundMode;
  return v3 ^ longRangeEnabled ^ cameraAssistanceEnabled ^ backgroundMode ^ (unint64_t)-[NSDictionary hash](self->_debugParameters, "hash") ^ self->_extendedDistanceMeasurementEnabled ^ 0x1F;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  id v3;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_10081D5E0);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Peer Token: null"));
  }
  if (self->_cameraAssistanceEnabled)
    v6 = "Yes";
  else
    v6 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCameraAssistanceEnabled: %s"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(", backgroundMode: %s"), +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", self->_backgroundMode));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](self->_debugParameters, "description"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", debugParameters:%@"), v7);

  if (self->_longRangeEnabled)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isLongRangeEnabled: %s"), v8);
  if (self->_extendedDistanceMeasurementEnabled)
    v9 = "Yes";
  else
    v9 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isExtendedDistanceMeasurementEnabled: %s"), v9);
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (void)setPeerDiscoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled
{
  self->_extendedDistanceMeasurementEnabled = extendedDistanceMeasurementEnabled;
}

- (BOOL)isLongRangeEnabled
{
  return self->_longRangeEnabled;
}

- (void)setLongRangeEnabled:(BOOL)a3
{
  self->_longRangeEnabled = a3;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end
