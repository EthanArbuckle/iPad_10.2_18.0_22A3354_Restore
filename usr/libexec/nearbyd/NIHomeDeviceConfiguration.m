@implementation NIHomeDeviceConfiguration

- (NIHomeDeviceConfiguration)init
{
  NIHomeDeviceConfiguration *v2;
  NIHomeDeviceConfiguration *v3;
  NSData *sessionKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NIHomeDeviceConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, "initInternal");
  v3 = v2;
  if (v2)
  {
    v2->_allowedDevices = 4;
    sessionKey = v2->_sessionKey;
    v2->_sessionKey = 0;

    v3->_anchor = 0;
    v3->_minimumPreferredUpdatedRate = 3;
    v3->_antennaDiversityOverride = 0;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v3, "setMonitoredRegions:", &__NSArray0__struct);
  }
  return v3;
}

+ (NIHomeDeviceConfiguration)new
{
  return objc_alloc_init(NIHomeDeviceConfiguration);
}

- (NIHomeDeviceConfiguration)initWithRegions:(id)a3
{
  id v4;
  uint64_t v5;
  NIHomeDeviceConfiguration *v6;

  v4 = a3;
  v6 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class(self, v5));

  -[NIHomeDeviceConfiguration setMonitoredRegions:](v6, "setMonitoredRegions:", v4);
  return v6;
}

- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6
{
  id v11;
  id v12;
  uint64_t v13;
  NIHomeDeviceConfiguration *v14;

  v11 = a4;
  v12 = a6;
  v14 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class(self, v13));

  if (v14)
  {
    v14->_allowedDevices = a3;
    objc_storeStrong((id *)&v14->_sessionKey, a4);
    v14->_anchor = a5;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v14, "setMonitoredRegions:", v12);
  }

  return v14;
}

- (void)setMonitoredRegions:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredRegions, a3);
  -[NIHomeDeviceConfiguration _updateRegionDescription](self, "_updateRegionDescription");
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", self->_monitoredRegions, 1);
}

- (void)_updateRegionDescription
{
  NSMutableString *v3;
  NSArray *monitoredRegions;
  NSMutableString *v5;
  NSString *regionDescription;
  NSString *v7;
  NSMutableString *v8;
  _QWORD v9[4];
  NSMutableString *v10;

  if (-[NSArray count](self->_monitoredRegions, "count"))
  {
    v3 = objc_opt_new(NSMutableString);
    monitoredRegions = self->_monitoredRegions;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002A3724;
    v9[3] = &unk_1008120E8;
    v5 = v3;
    v10 = v5;
    -[NSArray enumerateObjectsUsingBlock:](monitoredRegions, "enumerateObjectsUsingBlock:", v9);
    regionDescription = self->_regionDescription;
    self->_regionDescription = &v5->super;
    v8 = v5;

  }
  else
  {
    v7 = self->_regionDescription;
    self->_regionDescription = (NSString *)CFSTR("[none]");

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSArray *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NIHomeDeviceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  objc_msgSend(v5, "setAllowedDevices:", self->_allowedDevices);
  objc_msgSend(v5, "setSessionKey:", self->_sessionKey);
  objc_msgSend(v5, "setAnchor:", self->_anchor);
  objc_msgSend(v5, "setAntennaDiversityOverride:", self->_antennaDiversityOverride);
  objc_msgSend(v5, "setMinimumPreferredUpdatedRate:", self->_minimumPreferredUpdatedRate);
  if (self->_monitoredRegions)
  {
    v6 = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->_monitoredRegions, 1);
    v7 = v5[4];
    v5[4] = v6;

  }
  objc_storeStrong(v5 + 5, self->_regionDescription);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIHomeDeviceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_allowedDevices, CFSTR("allowedDevices"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionKey, CFSTR("sessionKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_anchor, CFSTR("anchor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_antennaDiversityOverride, CFSTR("antennaDiversityOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumPreferredUpdatedRate, CFSTR("minimumPreferredUpdatedRate"));

}

- (NIHomeDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIHomeDeviceConfiguration *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NIHomeDeviceConfiguration *v20;
  objc_super v22;
  _QWORD v23[2];

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NIHomeDeviceConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v22, "initWithCoder:", v4);
  if (v5
    && (v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedDevices")),
        +[NIUtils isIntValidRelationshipSpecifier:](NIUtils, "isIntValidRelationshipSpecifier:", v6)))
  {
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v7), CFSTR("sessionKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("anchor"));
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("antennaDiversityOverride"));
    if (+[NIUtils isIntValidAntennaDiversityOverride:](NIUtils, "isIntValidAntennaDiversityOverride:", v11))
    {
      v23[0] = objc_opt_class(NSArray, v12);
      v23[1] = objc_opt_class(NIRegionPredicate, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("monitoredRegions")));

      v18 = objc_opt_class(NSArray, v17);
      if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0
        && (v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumPreferredUpdatedRate")),
            +[NIUtils isIntValidNearbyObjectUpdateRate:](NIUtils, "isIntValidNearbyObjectUpdateRate:", v19)))
      {
        v5->_allowedDevices = (unint64_t)v6;
        objc_storeStrong((id *)&v5->_sessionKey, v9);
        v5->_anchor = v10;
        v5->_antennaDiversityOverride = (int64_t)v11;
        objc_storeStrong((id *)&v5->_monitoredRegions, v16);
        -[NIHomeDeviceConfiguration _updateRegionDescription](v5, "_updateRegionDescription");
        v5->_minimumPreferredUpdatedRate = (int64_t)v19;
        v20 = v5;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  NIHomeDeviceConfiguration *v4;
  NIHomeDeviceConfiguration *v5;
  unint64_t v6;
  unint64_t allowedDevices;
  unsigned int v8;
  int anchor;
  id v10;
  int64_t antennaDiversityOverride;
  id v12;
  void *v13;
  char v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  BOOL v23;
  id v25;
  int64_t minimumPreferredUpdatedRate;
  _BOOL4 v27;
  id v28;
  int64_t v29;

  v4 = (NIHomeDeviceConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v14 = 1;
    }
    else
    {
      v6 = -[NIHomeDeviceConfiguration allowedDevices](v4, "allowedDevices");
      allowedDevices = self->_allowedDevices;
      v8 = -[NIHomeDeviceConfiguration isAnchor](v5, "isAnchor");
      anchor = self->_anchor;
      v10 = -[NIHomeDeviceConfiguration antennaDiversityOverride](v5, "antennaDiversityOverride");
      antennaDiversityOverride = self->_antennaDiversityOverride;
      v12 = -[NIHomeDeviceConfiguration minimumPreferredUpdatedRate](v5, "minimumPreferredUpdatedRate");
      v29 = antennaDiversityOverride;
      minimumPreferredUpdatedRate = self->_minimumPreferredUpdatedRate;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey"));
      v25 = v12;
      if (v13)
        v27 = 0;
      else
        v27 = self->_sessionKey == 0;
      v28 = v10;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey"));
      v16 = v8;
      v17 = objc_msgSend(v15, "isEqualToData:", self->_sessionKey);
      v18 = allowedDevices;
      v19 = v6;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions"));
      v21 = objc_msgSend(v20, "isEqualToArray:", self->_monitoredRegions);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions"));
      if (v22)
        v23 = 0;
      else
        v23 = self->_monitoredRegions == 0;

      v14 = 0;
      if (v19 == v18 && anchor == v16 && v28 == (id)v29 && (((v27 | v17) ^ 1) & 1) == 0)
      {
        if (v25 == (id)minimumPreferredUpdatedRate)
          v14 = v21 | v23;
        else
          v14 = 0;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIHomeDeviceConfiguration *v7;
  id v8;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIHomeDeviceConfiguration *)v4;
    if (v7 == self)
    {
      v9 = 1;
    }
    else if (-[NIHomeDeviceConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v7))
    {
      v8 = -[NIConfiguration enabledGestures](self, "enabledGestures");
      v9 = v8 == (id)-[NIConfiguration enabledGestures](v7, "enabledGestures");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t antennaDiversityOverride;

  v3 = self->_allowedDevices ^ self->_anchor ^ (unint64_t)-[NSData hash](self->_sessionKey, "hash");
  antennaDiversityOverride = self->_antennaDiversityOverride;
  return v3 ^ antennaDiversityOverride ^ (unint64_t)-[NSArray hash](self->_monitoredRegions, "hash") ^ self->_minimumPreferredUpdatedRate;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  const char *v3;
  const char *v4;

  v3 = +[NIUtils NIRelationshipSpecifierToString:](NIUtils, "NIRelationshipSpecifierToString:", self->_allowedDevices);
  if (self->_anchor)
    v4 = "Yes";
  else
    v4 = "No";
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<devices: [%s], ses-key: %@, anchor: %s, ant-div: %s, min-rate: %s, gestures: %d, regions: %@>"), v3, self->_sessionKey, v4, +[NIUtils AntennaDiversityOverrideToString:](NIUtils, "AntennaDiversityOverrideToString:", self->_antennaDiversityOverride), +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_minimumPreferredUpdatedRate), -[NIConfiguration enabledGestures](self, "enabledGestures"), self->_regionDescription);
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_allowedDevices = a3;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)isAnchor
{
  return self->_anchor;
}

- (void)setAnchor:(BOOL)a3
{
  self->_anchor = a3;
}

- (int64_t)minimumPreferredUpdatedRate
{
  return self->_minimumPreferredUpdatedRate;
}

- (void)setMinimumPreferredUpdatedRate:(int64_t)a3
{
  self->_minimumPreferredUpdatedRate = a3;
}

- (int64_t)antennaDiversityOverride
{
  return self->_antennaDiversityOverride;
}

- (void)setAntennaDiversityOverride:(int64_t)a3
{
  self->_antennaDiversityOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_regionDescription, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
}

@end
