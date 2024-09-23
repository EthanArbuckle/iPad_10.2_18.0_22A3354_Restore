@implementation HAPBLECharacteristicCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  HAPBLECharacteristicCache *v14;
  HAPBLECharacteristicCache *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPBLECharacteristicCache;
  v14 = -[HAPBLECharacteristicCache init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_characteristicUUID, a3);
    objc_storeStrong((id *)&v15->_characteristicInstanceId, a4);
    v15->_characteristicProperties = a5;
    objc_storeStrong((id *)&v15->_characteristicMetadata, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLECharacteristicCache *v4;
  uint64_t v5;
  HAPBLECharacteristicCache *v6;
  uint64_t v7;
  HAPBLECharacteristicCache *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (HAPBLECharacteristicCache *)a3;
  v6 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v7 = objc_opt_class(v4, v5);
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicUUID](v8, "characteristicUUID"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicInstanceId](v8, "characteristicInstanceId"));
        v14 = objc_msgSend(v12, "isEqual:", v13);

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
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAPBLECharacteristicCache setCharacteristicProperties:](self, "setCharacteristicProperties:", objc_msgSend(v4, "characteristicProperties"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristicMetadata"));

  -[HAPBLECharacteristicCache setCharacteristicMetadata:](self, "setCharacteristicMetadata:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CUUI"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties"), CFSTR("CP"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicMetadata](self, "characteristicMetadata"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CM"));

}

- (HAPBLECharacteristicCache)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPBLECharacteristicCache *v6;
  id v7;
  uint64_t v8;
  NSUUID *characteristicUUID;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *characteristicInstanceId;
  uint64_t v14;
  id v15;
  uint64_t v16;
  HAPCharacteristicMetadata *characteristicMetadata;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPBLECharacteristicCache;
  v6 = -[HAPBLECharacteristicCache init](&v19, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("CUUI"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    characteristicUUID = v6->_characteristicUUID;
    v6->_characteristicUUID = (NSUUID *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("CI"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    characteristicInstanceId = v6->_characteristicInstanceId;
    v6->_characteristicInstanceId = (NSNumber *)v12;

    v6->_characteristicProperties = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CP"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(HAPCharacteristicMetadata, v14), CFSTR("CM"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    characteristicMetadata = v6->_characteristicMetadata;
    v6->_characteristicMetadata = (HAPCharacteristicMetadata *)v16;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId"));
  v5 = sub_100026598((__int16)-[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLECharacteristicCache characteristicMetadata](self, "characteristicMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\tCharacteristic Info:\n\t\tCharacteristic UUID: %@,\n\t\tInstanceId: %@,\n\t\tProperties: %@,\n\t\tMetadata: %@"), v3, v4, v6, v7));

  return v8;
}

- (NSUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (NSNumber)characteristicInstanceId
{
  return self->_characteristicInstanceId;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicProperties:(unint64_t)a3
{
  self->_characteristicProperties = a3;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void)setCharacteristicMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceId, 0);
  objc_storeStrong((id *)&self->_characteristicUUID, 0);
}

@end
