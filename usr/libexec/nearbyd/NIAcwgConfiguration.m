@implementation NIAcwgConfiguration

- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3
{
  id v6;
  id *v7;
  NIAcwgConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIAcwgConfiguration.mm"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lockIdentifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)NIAcwgConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, "initInternal");
  v8 = (NIAcwgConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v8->_lockBtConnHandle = -1;
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (NIAcwgConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NIAcwgConfiguration *v6;
  uint64_t v7;
  NSString *lockIdentifier;
  uint64_t v9;
  NSDictionary *debugOptions;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIAcwgConfiguration.mm"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIAcwgConfiguration;
  v6 = -[NIConfiguration initInternal](&v13, "initInternal");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lockIdentifier"));
    lockIdentifier = v6->_lockIdentifier;
    v6->_lockIdentifier = (NSString *)v7;

    v6->_lockBtConnHandle = (unsigned __int16)objc_msgSend(v5, "lockBtConnHandle");
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

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSDictionary *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NIAcwgConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  objc_msgSend(v5, "setLockIdentifier:", self->_lockIdentifier);
  objc_msgSend(v5, "setLockBtConnHandle:", self->_lockBtConnHandle);
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    v6 = -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugOptions, 1);
    v7 = (void *)v5[7];
    v5[7] = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_lockIdentifier, CFSTR("lockIdentifier"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_lockBtConnHandle, CFSTR("lockBtConnHandle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugOptions, CFSTR("debugOptions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configurationTypeInternal, CFSTR("configurationType"));

}

- (NIAcwgConfiguration)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  NIAcwgConfiguration *v7;
  unsigned __int16 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NIAcwgConfiguration *v18;
  NIAcwgConfiguration *v19;
  _QWORD v21[3];
  uint64_t v22;

  v5 = a3;
  if (!self)
  {
    v19 = 0;
LABEL_9:
    self = v19;
    v7 = self;
    goto LABEL_10;
  }
  v6 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), CFSTR("lockIdentifier"));
  v7 = (NIAcwgConfiguration *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = (unsigned __int16)objc_msgSend(v5, "decodeIntForKey:", CFSTR("lockBtConnHandle"));
    v22 = objc_opt_class(NSString, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

    v21[0] = objc_opt_class(NSString, v12);
    v21[1] = objc_opt_class(NSNumber, v13);
    v21[2] = objc_opt_class(NSData, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v11, v16, CFSTR("debugOptions")));
    if (objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("configurationType")) == (id)1)
    {
      v18 = -[NIAcwgConfiguration initWithLockIdentifier:](self, "initWithLockIdentifier:", v7);
      v19 = v18;
      if (v18)
      {
        -[NIAcwgConfiguration setLockBtConnHandle:](v18, "setLockBtConnHandle:", v8);
        -[NIAcwgConfiguration setDebugOptions:](v19, "setDebugOptions:", v17);
      }
    }
    else
    {

      v19 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIAcwgConfiguration *v7;
  NIAcwgConfiguration *v8;
  NSString *lockIdentifier;
  void *v10;
  unsigned int v11;
  int lockBtConnHandle;
  unsigned int v13;
  NSDictionary *debugOptions;
  BOOL v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  int64_t configurationTypeInternal;
  id v21;
  char v22;
  unsigned int v23;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIAcwgConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v16 = 1;
    }
    else
    {
      lockIdentifier = self->_lockIdentifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](v7, "lockIdentifier"));
      v11 = -[NSString isEqualToString:](lockIdentifier, "isEqualToString:", v10);

      lockBtConnHandle = self->_lockBtConnHandle;
      v13 = -[NIAcwgConfiguration lockBtConnHandle](v8, "lockBtConnHandle");
      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        v15 = 0;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v8, "debugOptions"));
        v15 = v17 == 0;

        debugOptions = self->_debugOptions;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v8, "debugOptions"));
      v19 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v18);

      configurationTypeInternal = self->_configurationTypeInternal;
      v21 = -[NIAcwgConfiguration configurationType](v8, "configurationType");
      v22 = v19 | v15;
      if (lockBtConnHandle == v13)
        v23 = v11;
      else
        v23 = 0;
      if ((id)configurationTypeInternal != v21)
        v22 = 0;
      if (v23 == 1)
        v16 = v22;
      else
        v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NSString hash](self->_lockIdentifier, "hash") ^ self->_lockBtConnHandle;
  return v3 ^ (unint64_t)-[NSDictionary hash](self->_debugOptions, "hash") ^ self->_configurationTypeInternal;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<lock identifier: %@, BT conn handle: 0x%04x, debug options: <%@>>"), self->_lockIdentifier, self->_lockBtConnHandle, self->_debugOptions);
}

- (NSString)lockIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLockIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unsigned)lockBtConnHandle
{
  return self->_lockBtConnHandle;
}

- (void)setLockBtConnHandle:(unsigned __int16)a3
{
  self->_lockBtConnHandle = a3;
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_lockIdentifier, 0);
}

@end
