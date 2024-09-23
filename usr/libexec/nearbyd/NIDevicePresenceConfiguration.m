@implementation NIDevicePresenceConfiguration

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (NIDiscoveryToken)token
{
  return (NIDiscoveryToken *)objc_getProperty(self, a2, 80, 1);
}

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NIRegionPredicate *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NIDevicePresenceConfiguration *v19;
  id v20;
  objc_super v22;
  _QWORD v23[2];

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NIDevicePresenceConfiguration;
  v10 = -[NIConfiguration initInternal](&v22, "initInternal");
  if (!v10)
    goto LABEL_6;
  v11 = objc_msgSend(v8, "copy");
  v12 = (void *)v10[7];
  v10[7] = v11;

  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)v10[8];
  v10[8] = v13;

  v10[5] = 1;
  v10[6] = 2;
  if (!v9)
  {
    v15 = -[NIRegionPredicate initWithName:devicePresencePreset:]([NIRegionPredicate alloc], "initWithName:devicePresencePreset:", CFSTR("default-max-sensor-region"), 5);
    v16 = (void *)v10[8];
    v10[8] = v15;

  }
  v23[0] = v10[7];
  v23[1] = v10[8];
  v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v18 = (void *)v10[9];
  v10[9] = v17;

  if (+[NIDevicePresenceConfiguration _validateRegionPredicates:outer:](NIDevicePresenceConfiguration, "_validateRegionPredicates:outer:", v10[7], v10[8]))
  {
    *((_BYTE *)v10 + 32) = 0;
LABEL_6:
    v19 = v10;
    goto LABEL_10;
  }
  if (a5)
  {
    v20 = sub_1001B9E88(-10013, 0);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v20);
  }
  else
  {
    v19 = 0;
  }
LABEL_10:

  return v19;
}

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  NIDevicePresenceConfiguration *v15;

  v12 = a3;
  v13 = a4;
  v15 = (NIDevicePresenceConfiguration *)objc_msgSend(objc_alloc((Class)objc_opt_class(self, v14)), "initWithInnerBoundary:outerBoundary:error:", v12, v13, a7);

  if (v15)
  {
    v15->_allowedDevices = a6;
    v15->_monitoringOption = a5;
  }

  return v15;
}

- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NIDevicePresenceConfiguration *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  NSArray *monitoredRegions;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v11 = a3;
  v12 = a4;
  v14 = objc_alloc((Class)objc_opt_class(self, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  v17 = (NIDevicePresenceConfiguration *)objc_msgSend(v14, "initWithInnerBoundary:outerBoundary:error:", v15, v16, a6);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_token, a3);
    v17->_allowedDevices = 2;
    v17->_monitoringOption = 1;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v21), "setPreferredUpdateRate:", a5, (_QWORD)v25);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    v22 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v18, 1);
    monitoredRegions = v17->_monitoredRegions;
    v17->_monitoredRegions = v22;

  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NIDevicePresenceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v15, "copyWithZone:");
  objc_msgSend(v5, "setAllowedDevices:", self->_allowedDevices);
  objc_msgSend(v5, "setMonitoringOption:", self->_monitoringOption);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  v6 = -[NIRegionPredicate copyWithZone:](self->_innerBoundary, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NIRegionPredicate copyWithZone:](self->_outerBoundary, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSArray copyWithZone:](self->_monitoredRegions, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[NIDiscoveryToken copyWithZone:](self->_token, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIDevicePresenceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_innerBoundary, CFSTR("innerboundary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outerBoundary, CFSTR("outerboundary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowedDevices, CFSTR("allowedDevices"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_monitoringOption, CFSTR("monitoringOption"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));

}

- (NIDevicePresenceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NIDevicePresenceConfiguration *v6;
  id v7;
  uint64_t v8;
  NSArray *monitoredRegions;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NIRegionPredicate *innerBoundary;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NIRegionPredicate *outerBoundary;
  id v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NIDiscoveryToken *token;
  NIDevicePresenceConfiguration *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NIDevicePresenceConfiguration;
  v6 = -[NIConfiguration initWithCoder:](&v26, "initWithCoder:", v4);
  if (!v6)
    goto LABEL_5;
  v7 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NIRegionPredicate, v5), CFSTR("monitoredRegions"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  monitoredRegions = v6->_monitoredRegions;
  v6->_monitoredRegions = (NSArray *)v8;

  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIRegionPredicate, v10), CFSTR("innerboundary"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  innerBoundary = v6->_innerBoundary;
  v6->_innerBoundary = (NIRegionPredicate *)v12;

  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIRegionPredicate, v14), CFSTR("outerboundary"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  outerBoundary = v6->_outerBoundary;
  v6->_outerBoundary = (NIRegionPredicate *)v16;

  v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedDevices"));
  if (!+[NIUtils isIntValidRelationshipSpecifier:](NIUtils, "isIntValidRelationshipSpecifier:", v18))
    goto LABEL_5;
  v6->_allowedDevices = (unint64_t)v18;
  v19 = (char *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("monitoringOption"));
  if ((unint64_t)(v19 - 1) < 3)
  {
    v6->_monitoringOption = (unint64_t)v19;
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v20), CFSTR("token"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    token = v6->_token;
    v6->_token = (NIDiscoveryToken *)v22;

    v6->_cameraAssistanceEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
    v24 = v6;
  }
  else
  {
LABEL_5:
    v24 = 0;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIDevicePresenceConfiguration *v7;
  NIDevicePresenceConfiguration *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  unsigned int v17;
  id v18;
  unint64_t monitoringOption;
  NIDiscoveryToken *v20;
  unsigned int v21;
  NIDiscoveryToken *token;
  unsigned int v25;
  id v26;
  unint64_t allowedDevices;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIDevicePresenceConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v15 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration innerBoundary](v7, "innerBoundary"));
      v10 = objc_msgSend(v9, "isEqual:", self->_innerBoundary);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration outerBoundary](v8, "outerBoundary"));
      v12 = objc_msgSend(v11, "isEqual:", self->_outerBoundary);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration outerBoundary](v8, "outerBoundary"));
      if (v13)
        v14 = 0;
      else
        v14 = self->_outerBoundary == 0;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration monitoredRegions](v8, "monitoredRegions"));
      v17 = objc_msgSend(v16, "isEqualToArray:", self->_monitoredRegions);

      v18 = -[NIDevicePresenceConfiguration allowedDevices](v8, "allowedDevices");
      v25 = v17;
      allowedDevices = self->_allowedDevices;
      v26 = -[NIDevicePresenceConfiguration monitoringOption](v8, "monitoringOption");
      monitoringOption = self->_monitoringOption;
      v20 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration token](v8, "token"));
      LODWORD(v16) = v10;
      token = self->_token;

      v21 = -[NIDevicePresenceConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
      v15 = 0;
      if ((v16 & (v12 | v14)) == 1
        && v18 == (id)allowedDevices
        && v26 == (id)monitoringOption
        && ((v25 ^ 1) & 1) == 0)
      {
        v15 = v20 == token && self->_cameraAssistanceEnabled == v21;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NIRegionPredicate hash](self->_innerBoundary, "hash");
  v4 = -[NIRegionPredicate hash](self->_outerBoundary, "hash") ^ v3;
  v5 = self->_allowedDevices ^ self->_monitoringOption;
  v6 = v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_token, "hash");
  return v6 ^ (unint64_t)-[NSArray hash](self->_monitoredRegions, "hash") ^ self->_cameraAssistanceEnabled;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  NIRegionPredicate *innerBoundary;
  NIRegionPredicate *outerBoundary;
  const char *v5;
  const char *v6;
  const char *v7;

  innerBoundary = self->_innerBoundary;
  outerBoundary = self->_outerBoundary;
  v5 = +[NIUtils NIRelationshipSpecifierToString:](NIUtils, "NIRelationshipSpecifierToString:", self->_allowedDevices);
  v6 = +[NIDevicePresenceConfiguration _NIDevicePresenceMonitoringOptionToString:](NIDevicePresenceConfiguration, "_NIDevicePresenceMonitoringOptionToString:", self->_monitoringOption);
  if (self->_cameraAssistanceEnabled)
    v7 = "Yes";
  else
    v7 = "No";
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<innerboundary: %@, outerboundary: %@, allowedDevices: %s, monitoringOption: %s>, isCameraAssistanceEnabled: %s"), innerBoundary, outerBoundary, v5, v6, v7);
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (+[NIDevicePresenceConfiguration _validateRegionIsPreset:](NIDevicePresenceConfiguration, "_validateRegionIsPreset:", v5)&& +[NIDevicePresenceConfiguration _validateRegionIsPreset:](NIDevicePresenceConfiguration, "_validateRegionIsPreset:", v6))
  {
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", objc_msgSend(v6, "devicePresencePreset"));
    v8 = v7;
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", objc_msgSend(v5, "devicePresencePreset"));
    v10 = v8 >= v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateRegionIsPreset:(id)a3
{
  return objc_msgSend(a3, "devicePresencePreset") != 0;
}

+ (float)_radiusFromDevicePresencePreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 3.4028e38;
  else
    return flt_100472D40[a3 - 1];
}

+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return "N/A";
  else
    return (&off_10080F3B8)[a3 - 1];
}

- (unint64_t)monitoringOption
{
  return self->_monitoringOption;
}

- (void)setMonitoringOption:(unint64_t)a3
{
  self->_monitoringOption = a3;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_allowedDevices = a3;
}

- (NIRegionPredicate)innerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 56, 1);
}

- (NIRegionPredicate)outerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_outerBoundary, 0);
  objc_storeStrong((id *)&self->_innerBoundary, 0);
}

@end
