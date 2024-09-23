@implementation W5LogItemRequest

- (W5LogItemRequest)init
{
  W5LogItemRequest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)W5LogItemRequest;
  v2 = -[W5LogItemRequest init](&v4, sel_init);
  if (v2)
    v2->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "copy");
  return v2;
}

+ (W5LogItemRequest)requestWithItemID:(int64_t)a3 configuration:(id)a4
{
  W5LogItemRequest *v6;

  v6 = objc_alloc_init(W5LogItemRequest);
  -[W5LogItemRequest setItemID:](v6, "setItemID:", a3);
  -[W5LogItemRequest setConfiguration:](v6, "setConfiguration:", a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5LogItemRequest;
  -[W5LogItemRequest dealloc](&v3, sel_dealloc);
}

- (void)setConfiguration:(id)a3
{
  NSDictionary *configuration;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

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
        v16 = (void *)MEMORY[0x24BDD1620];
        v8 = (void *)MEMORY[0x24BDBCF20];
        v9 = objc_opt_class();
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        v15 = objc_opt_class();
        self->_configuration = (NSDictionary *)(id)objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@ (%ld)\n"), W5DescriptionForLogItemID(self->_itemID), self->_itemID);
  objc_msgSend(v3, "appendFormat:", CFSTR("Configuration: %@\n"), self->_configuration);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5LogItemRequest;
  if (-[W5LogItemRequest conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToLogItemRequest:(id)a3
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
      return -[W5LogItemRequest isEqualToLogItemRequest:](self, "isEqualToLogItemRequest:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5LogItemRequest *v4;

  v4 = -[W5LogItemRequest init](+[W5LogItemRequest allocWithZone:](W5LogItemRequest, "allocWithZone:", a3), "init");
  -[W5LogItemRequest setItemID:](v4, "setItemID:", self->_itemID);
  -[W5LogItemRequest setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5LogItemRequest setUuid:](v4, "setUuid:", self->_uuid);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_itemID, CFSTR("_itemID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_configuration, CFSTR("_configuration"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
}

- (W5LogItemRequest)initWithCoder:(id)a3
{
  W5LogItemRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)W5LogItemRequest;
  v4 = -[W5LogItemRequest init](&v14, sel_init);
  if (v4)
  {
    v4->_itemID = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_itemID"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("_configuration")), "copy");
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

- (int64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(int64_t)a3
{
  self->_itemID = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

@end
