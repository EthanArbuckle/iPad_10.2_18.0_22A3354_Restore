@implementation WPCharacteristic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WPCharacteristic uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPCharacteristic data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("characteristic with uuid %@ and data %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WPCharacteristic)initWithCoder:(id)a3
{
  id v4;
  WPCharacteristic *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *data;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPCharacteristic;
  v5 = -[WPCharacteristic init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_properties = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCharacteristicProperties"));
    v5->_permissions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kAttributePermissions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kData"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v5->_writeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kWriteType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WPCharacteristic uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kUUID"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic properties](self, "properties"), CFSTR("kCharacteristicProperties"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic permissions](self, "permissions"), CFSTR("kAttributePermissions"));
  -[WPCharacteristic data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kData"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[WPCharacteristic writeType](self, "writeType"), CFSTR("kWriteType"));
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (unint64_t)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(unint64_t)a3
{
  self->_permissions = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)writeType
{
  return self->_writeType;
}

- (void)setWriteType:(int64_t)a3
{
  self->_writeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
