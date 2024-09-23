@implementation NIFindingConfiguration

+ (id)localDeviceConfiguration
{
  return -[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:]([NIFindingConfiguration alloc], "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:", 2, 0, 0, 0, 3);
}

- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5
{
  return (NIFindingConfiguration *)-[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:](self, "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:", 1, (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0, (a3 & 0xFFFFFFFFFFFFFFFELL) == 2, a4, a5);
}

- (NIDiscoveryToken)sessionDiscoveryToken
{
  return self->_specifiedToken;
}

- (NIDiscoveryToken)findingDiscoveryToken
{
  return self->_specifiedToken;
}

- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7
{
  id v13;
  id *v14;
  id *v15;
  id v16;
  objc_super v18;

  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NIFindingConfiguration;
  v14 = -[NIConfiguration initInternal](&v18, "initInternal");
  v15 = v14;
  if (v14)
  {
    *((_BYTE *)v14 + 34) = a4;
    *((_BYTE *)v14 + 35) = a5;
    v14[6] = (id)a3;
    objc_storeStrong(v14 + 7, a6);
    v15[5] = (id)a7;
    *((_BYTE *)v15 + 32) = 0;
    *((_BYTE *)v15 + 33) = 1;
    v16 = v15[8];
    v15[8] = 0;

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIFindingConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v8, "copyWithZone:", a3);
  objc_msgSend(v4, "setIsFinder:", self->_isFinder);
  objc_msgSend(v4, "setIsObserver:", self->_isObserver);
  objc_msgSend(v4, "setConfigType:", self->_configType);
  v5 = -[NIDiscoveryToken copy](self->_specifiedToken, "copy");
  objc_msgSend(v4, "setSpecifiedToken:", v5);

  objc_msgSend(v4, "setPreferredUpdateRate:", self->_preferredUpdateRate);
  objc_msgSend(v4, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v4, "setCameraAssistanceInClientProcess:", self->_cameraAssistanceInClientProcess);
  v6 = -[NSDictionary copy](self->_debugParameters, "copy");
  objc_msgSend(v4, "setDebugParameters:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIFindingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFinder, CFSTR("isFinder"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isObserver, CFSTR("isObserver"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configType, CFSTR("configType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifiedToken, CFSTR("specifiedToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preferredUpdateRate, CFSTR("preferredUpdateRate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceInClientProcess, CFSTR("cameraAssistanceInClientProcess"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));

}

- (NIFindingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIFindingConfiguration *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NIFindingConfiguration *v22;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NIFindingConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v27, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinder"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isObserver"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configType"));
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v9), CFSTR("specifiedToken"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((!v12
       || (v13 = objc_opt_class(NIDiscoveryToken, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
      && (v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredUpdateRate")),
          +[NIUtils isIntValidNearbyObjectUpdateRate:](NIUtils, "isIntValidNearbyObjectUpdateRate:", v14)))
    {
      v25 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
      v26 = v6;
      v24 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceInClientProcess"));
      v29 = objc_opt_class(NSString, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));

      v28 = objc_opt_class(NSNumber, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v17, v20, CFSTR("debugParameters")));
      v5->_isFinder = v26;
      v5->_isObserver = v7;
      if (v8 == (id)1)
      {
        v5->_configType = 1;
        objc_storeStrong((id *)&v5->_specifiedToken, v12);
        v5->_preferredUpdateRate = (int64_t)v14;
        v5->_cameraAssistanceEnabled = v25;
        v5->_cameraAssistanceInClientProcess = v24;
        objc_storeStrong((id *)&v5->_debugParameters, v21);
        v22 = v5;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  NIFindingConfiguration *v4;
  NIFindingConfiguration *v5;
  unsigned int v6;
  int isFinder;
  unsigned int v8;
  _BOOL4 isObserver;
  int64_t configType;
  unint64_t specifiedToken;
  NIDiscoveryToken *v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int cameraAssistanceEnabled;
  unsigned int v17;
  BOOL v18;
  BOOL v20;
  int v23;
  id v24;

  v4 = (NIFindingConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v18 = 1;
    }
    else
    {
      v6 = -[NIFindingConfiguration isFinder](v4, "isFinder");
      isFinder = self->_isFinder;
      v8 = -[NIFindingConfiguration isObserver](v5, "isObserver");
      isObserver = self->_isObserver;
      v24 = -[NIFindingConfiguration configType](v5, "configType");
      v23 = isObserver;
      configType = self->_configType;
      specifiedToken = (unint64_t)v5->_specifiedToken;
      v12 = self->_specifiedToken;
      v13 = objc_msgSend((id)specifiedToken, "isEqual:", v12);
      if (specifiedToken | (unint64_t)v12)
        v14 = v13;
      else
        v14 = 1;
      v15 = -[NIFindingConfiguration isCameraAssistanceEnabled](v5, "isCameraAssistanceEnabled");
      cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      v17 = -[NIFindingConfiguration isCameraAssistanceInClientProcess](v5, "isCameraAssistanceInClientProcess");
      v18 = 0;
      v20 = isFinder == v6 && v23 == v8 && v24 == (id)configType;
      if (v20 && ((v14 ^ 1) & 1) == 0)
        v18 = cameraAssistanceEnabled == v15 && self->_cameraAssistanceInClientProcess == v17;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIFindingConfiguration *v7;
  id v8;
  int64_t preferredUpdateRate;
  NSDictionary *debugParameters;
  NSDictionary *v11;
  unsigned __int8 v12;
  char v13;
  BOOL v14;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIFindingConfiguration *)v4;
    if (v7 == self)
    {
      v14 = 1;
    }
    else if (-[NIFindingConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v7))
    {
      v8 = -[NIFindingConfiguration preferredUpdateRate](v7, "preferredUpdateRate");
      preferredUpdateRate = self->_preferredUpdateRate;
      debugParameters = v7->_debugParameters;
      v11 = self->_debugParameters;
      v12 = -[NSDictionary isEqualToDictionary:](debugParameters, "isEqualToDictionary:", v11);
      if ((unint64_t)debugParameters | (unint64_t)v11)
        v13 = v12;
      else
        v13 = 1;
      if (v8 == (id)preferredUpdateRate)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t configType;
  unint64_t v5;
  unint64_t v6;

  v3 = self->_isFinder ^ self->_isObserver ^ 0x1Fu;
  configType = self->_configType;
  v5 = configType ^ -[NIDiscoveryToken hash](self->_specifiedToken, "hash") ^ self->_preferredUpdateRate ^ v3;
  v6 = self->_cameraAssistanceEnabled ^ (unint64_t)self->_cameraAssistanceInClientProcess;
  return v5 ^ v6 ^ (unint64_t)-[NSDictionary hash](self->_debugParameters, "hash");
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  _BOOL8 isFinder;
  _BOOL8 isObserver;
  int64_t configType;
  void *v6;
  void *v7;

  isFinder = self->_isFinder;
  isObserver = self->_isObserver;
  configType = self->_configType;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_specifiedToken, "descriptionInternal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<finder: %d [observer %d], cfg-type: %d, ses-token: %@, rate: %s, camera: %d [client %d], debug-params: %@>"), isFinder, isObserver, configType, v6, +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_preferredUpdateRate), self->_cameraAssistanceEnabled, self->_cameraAssistanceInClientProcess, self->_debugParameters));

  return v7;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_preferredUpdateRate = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (BOOL)isCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (void)setCameraAssistanceInClientProcess:(BOOL)a3
{
  self->_cameraAssistanceInClientProcess = a3;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (void)setIsFinder:(BOOL)a3
{
  self->_isFinder = a3;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_isObserver = a3;
}

- (int64_t)configType
{
  return self->_configType;
}

- (void)setConfigType:(int64_t)a3
{
  self->_configType = a3;
}

- (NIDiscoveryToken)specifiedToken
{
  return self->_specifiedToken;
}

- (void)setSpecifiedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)debugParameters
{
  return self->_debugParameters;
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_specifiedToken, 0);
}

@end
