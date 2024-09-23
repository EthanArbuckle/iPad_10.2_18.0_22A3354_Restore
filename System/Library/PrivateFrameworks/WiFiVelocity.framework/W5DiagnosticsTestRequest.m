@implementation W5DiagnosticsTestRequest

- (W5DiagnosticsTestRequest)init
{
  W5DiagnosticsTestRequest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)W5DiagnosticsTestRequest;
  v2 = -[W5DiagnosticsTestRequest init](&v4, sel_init);
  if (v2)
    v2->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "copy");
  return v2;
}

+ (id)requestWithTestID:(int64_t)a3 configuration:(id)a4
{
  W5DiagnosticsTestRequest *v6;

  v6 = objc_alloc_init(W5DiagnosticsTestRequest);
  -[W5DiagnosticsTestRequest setTestID:](v6, "setTestID:", a3);
  -[W5DiagnosticsTestRequest setConfiguration:](v6, "setConfiguration:", a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestRequest;
  -[W5DiagnosticsTestRequest dealloc](&v3, sel_dealloc);
}

- (void)setConfiguration:(id)a3
{
  NSDictionary *configuration;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        self->_configuration = (NSDictionary *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@ (%ld)\n"), W5DescriptionForDiagnosticsTestID(self->_testID), self->_testID);
  objc_msgSend(v3, "appendFormat:", CFSTR("Description: %@\n"), W5ExtendedDescriptionForDiagnosticsTestID(self->_testID));
  objc_msgSend(v3, "appendFormat:", CFSTR("Configuration: %@\n"), self->_configuration);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestRequest;
  if (-[W5DiagnosticsTestRequest conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToDiagnosticsTestRequest:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5DiagnosticsTestRequest isEqualToDiagnosticsTestRequest:](self, "isEqualToDiagnosticsTestRequest:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DiagnosticsTestRequest *v4;

  v4 = -[W5DiagnosticsTestRequest init](+[W5DiagnosticsTestRequest allocWithZone:](W5DiagnosticsTestRequest, "allocWithZone:", a3), "init");
  -[W5DiagnosticsTestRequest setTestID:](v4, "setTestID:", self->_testID);
  -[W5DiagnosticsTestRequest setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5DiagnosticsTestRequest setUuid:](v4, "setUuid:", self->_uuid);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_testID, CFSTR("_testID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_configuration, CFSTR("_configuration"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
}

- (W5DiagnosticsTestRequest)initWithCoder:(id)a3
{
  W5DiagnosticsTestRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5DiagnosticsTestRequest;
  v4 = -[W5DiagnosticsTestRequest init](&v12, sel_init);
  if (v4)
  {
    v4->_testID = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_testID"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("_configuration")), "copy");
    v4->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid")), "copy");
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)testID
{
  return self->_testID;
}

- (void)setTestID:(int64_t)a3
{
  self->_testID = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

@end
