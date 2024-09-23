@implementation SYDTestConfiguration

- (SYDTestConfiguration)initWithTestServerName:(id)a3 testDeviceID:(id)a4
{
  id v6;
  id v7;
  SYDTestConfiguration *v8;
  uint64_t v9;
  NSString *testServerName;
  uint64_t v11;
  NSString *testDeviceID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYDTestConfiguration;
  v8 = -[SYDTestConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    testServerName = v8->_testServerName;
    v8->_testServerName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    testDeviceID = v8->_testDeviceID;
    v8->_testDeviceID = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SYDTestConfiguration testServerName](self, "testServerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "testServerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SYDObjectsAreBothNilOrEqual(v6, v7);

    if (v8)
    {
      -[SYDTestConfiguration testDeviceID](self, "testDeviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "testDeviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SYDObjectsAreBothNilOrEqual(v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SYDTestConfiguration testServerName](self, "testServerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SYDTestConfiguration testDeviceID](self, "testDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDTestConfiguration testServerName](self, "testServerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDTestConfiguration testDeviceID](self, "testDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ server=%@ device=%@>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDTestConfiguration)initWithCoder:(id)a3
{
  id v4;
  SYDTestConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *testServerName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *testDeviceID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYDTestConfiguration;
  v5 = -[SYDTestConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_testServerName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    testServerName = v5->_testServerName;
    v5->_testServerName = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_testDeviceID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    testDeviceID = v5->_testDeviceID;
    v5->_testDeviceID = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *testServerName;
  id v5;
  void *v6;
  NSString *testDeviceID;
  id v8;

  testServerName = self->_testServerName;
  v5 = a3;
  NSStringFromSelector(sel_testServerName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", testServerName, v6);

  testDeviceID = self->_testDeviceID;
  NSStringFromSelector(sel_testDeviceID);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", testDeviceID, v8);

}

- (NSString)testServerName
{
  return self->_testServerName;
}

- (NSString)testDeviceID
{
  return self->_testDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceID, 0);
  objc_storeStrong((id *)&self->_testServerName, 0);
}

@end
