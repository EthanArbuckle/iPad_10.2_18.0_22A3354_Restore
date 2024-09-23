@implementation NICarKeyConfiguration

- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3
{
  id v6;
  id *v7;
  NICarKeyConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vehicleIdentifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, "initInternal");
  v8 = (NICarKeyConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, a3);
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (id)initVehicleSimConfiguration:(id)a3
{
  id v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debugOptions"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = CFSTR("VEHICLE SIMULATION CONFIGURATION");

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)2;
  }

  return v8;
}

- (id)initLabTestModeConfiguration:(id)a3
{
  id v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debugOptions"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = CFSTR("TEST MODE CONFIGURATION");

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)3;
  }

  return v8;
}

+ (id)_vehicleSimConfigurationWithOptions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NICarKeyConfiguration initVehicleSimConfiguration:]([NICarKeyConfiguration alloc], "initVehicleSimConfiguration:", v3);

  return v4;
}

+ (id)_labTestModeConfigurationWithOptions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NICarKeyConfiguration initLabTestModeConfiguration:]([NICarKeyConfiguration alloc], "initLabTestModeConfiguration:", v3);

  return v4;
}

- (NICarKeyConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NICarKeyConfiguration *v6;
  uint64_t v7;
  NSString *vehicleIdentifier;
  uint64_t v9;
  NSDictionary *debugOptions;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NICarKeyConfiguration;
  v6 = -[NIConfiguration initInternal](&v13, "initInternal");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleIdentifier"));
    vehicleIdentifier = v6->_vehicleIdentifier;
    v6->_vehicleIdentifier = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugOptions"));
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = (int64_t)objc_msgSend(v5, "configurationType");
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSDictionary *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NICarKeyConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  objc_msgSend(v5, "setVehicleIdentifier:", self->_vehicleIdentifier);
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    v6 = -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugOptions, 1);
    v7 = (void *)v5[6];
    v5[6] = v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleIdentifier, CFSTR("vehicleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugOptions, CFSTR("debugOptions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configurationTypeInternal, CFSTR("configurationType"));

}

- (NICarKeyConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NICarKeyConfiguration *v18;
  NICarKeyConfiguration *v19;
  _QWORD v21[3];
  uint64_t v22;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("vehicleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v22 = objc_opt_class(NSString, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

    v21[0] = objc_opt_class(NSString, v11);
    v21[1] = objc_opt_class(NSNumber, v12);
    v21[2] = objc_opt_class(NSData, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v10, v15, CFSTR("debugOptions")));
    v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
    if (v17 == (id)1)
    {
      v19 = -[NICarKeyConfiguration initWithVehicleIdentifier:]([NICarKeyConfiguration alloc], "initWithVehicleIdentifier:", v8);
      -[NICarKeyConfiguration setDebugOptions:](v19, "setDebugOptions:", v16);
    }
    else
    {
      if (v17 == (id)2)
      {
        v18 = -[NICarKeyConfiguration initVehicleSimConfiguration:]([NICarKeyConfiguration alloc], "initVehicleSimConfiguration:", v16);
      }
      else
      {
        if (v17 != (id)3)
        {
          v19 = 0;
          goto LABEL_11;
        }
        v18 = -[NICarKeyConfiguration initLabTestModeConfiguration:]([NICarKeyConfiguration alloc], "initLabTestModeConfiguration:", v16);
      }
      v19 = v18;
    }
LABEL_11:

    goto LABEL_12;
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NICarKeyConfiguration *v7;
  NICarKeyConfiguration *v8;
  NSString *vehicleIdentifier;
  void *v10;
  unsigned __int8 v11;
  NSDictionary *debugOptions;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NICarKeyConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v14 = 1;
    }
    else
    {
      vehicleIdentifier = self->_vehicleIdentifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](v7, "vehicleIdentifier"));
      v11 = -[NSString isEqualToString:](vehicleIdentifier, "isEqualToString:", v10);

      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        v13 = 0;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v8, "debugOptions"));
        v13 = v15 == 0;

        debugOptions = self->_debugOptions;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v8, "debugOptions"));
      v17 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v16);

      v14 = v11 & (v17 | v13);
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_vehicleIdentifier, "hash");
  return (unint64_t)-[NSDictionary hash](self->_debugOptions, "hash") ^ v3 ^ self->_configurationTypeInternal;
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

  v3 = objc_alloc((Class)NSString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<vehicle identifier: %@, debug options: <%@>>"), self->_vehicleIdentifier, self->_debugOptions);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVehicleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebugOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
}

@end
