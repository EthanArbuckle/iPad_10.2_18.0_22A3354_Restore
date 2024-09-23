@implementation TVRCSiriRemoteInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCSiriRemoteInfo)initWithCoder:(id)a3
{
  id v4;
  TVRCSiriRemoteInfo *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *tvName;
  uint64_t v10;
  NSString *tvModel;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *serialNumber;
  uint64_t v16;
  NSData *btAddressData;
  uint64_t v18;
  NSData *irkData;
  uint64_t v20;
  NSString *firmwareVersion;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TVRCSiriRemoteInfo;
  v5 = -[TVRCSiriRemoteInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tvName"));
    v8 = objc_claimAutoreleasedReturnValue();
    tvName = v5->_tvName;
    v5->_tvName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tvModel"));
    v10 = objc_claimAutoreleasedReturnValue();
    tvModel = v5->_tvModel;
    v5->_tvModel = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v14;

    v5->_supportsFindMy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsFindMy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("btAddressData"));
    v16 = objc_claimAutoreleasedReturnValue();
    btAddressData = v5->_btAddressData;
    v5->_btAddressData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("irkData"));
    v18 = objc_claimAutoreleasedReturnValue();
    irkData = v5->_irkData;
    v5->_irkData = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v20;

    v5->_connected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connected"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvName, CFSTR("tvName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvModel, CFSTR("tvModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsFindMy, CFSTR("supportsFindMy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_btAddressData, CFSTR("btAddressData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_irkData, CFSTR("irkData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_connected, CFSTR("connected"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCSiriRemoteInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("name"), 1);

  -[TVRCSiriRemoteInfo tvModel](self, "tvModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v5, CFSTR("tvModel"), 1);

  -[TVRCSiriRemoteInfo tvName](self, "tvName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v6, CFSTR("tvName"), 1);

  -[TVRCSiriRemoteInfo identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v7, CFSTR("identifier"), 1);

  -[TVRCSiriRemoteInfo serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v8, CFSTR("serialNumber"), 1);

  -[TVRCSiriRemoteInfo firmwareVersion](self, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v9, CFSTR("firmwareVersion"), 0);

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCSiriRemoteInfo supportsFindMy](self, "supportsFindMy"), CFSTR("supportsFindMy"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCSiriRemoteInfo connected](self, "connected"), CFSTR("connected"));
  -[TVRCSiriRemoteInfo btAddressData](self, "btAddressData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSDataAddress();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v13, CFSTR("btAddressData"), 1);

  -[TVRCSiriRemoteInfo irkData](self, "irkData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSDataHex();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v15, CFSTR("irkData"), 1);

  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqualToRemoteInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TVRCSiriRemoteInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVRCSiriRemoteInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(TVRCSiriRemoteInfo);
  v5 = (void *)-[NSString copy](self->_name, "copy");
  -[TVRCSiriRemoteInfo setName:](v4, "setName:", v5);

  v6 = (void *)-[NSString copy](self->_tvModel, "copy");
  -[TVRCSiriRemoteInfo setTvModel:](v4, "setTvModel:", v6);

  v7 = (void *)-[NSString copy](self->_tvName, "copy");
  -[TVRCSiriRemoteInfo setTvName:](v4, "setTvName:", v7);

  v8 = (void *)-[NSString copy](self->_identifier, "copy");
  -[TVRCSiriRemoteInfo setIdentifier:](v4, "setIdentifier:", v8);

  v9 = (void *)-[NSString copy](self->_serialNumber, "copy");
  -[TVRCSiriRemoteInfo setSerialNumber:](v4, "setSerialNumber:", v9);

  -[TVRCSiriRemoteInfo setSupportsFindMy:](v4, "setSupportsFindMy:", self->_supportsFindMy);
  v10 = (void *)-[NSData copy](self->_btAddressData, "copy");
  -[TVRCSiriRemoteInfo setBtAddressData:](v4, "setBtAddressData:", v10);

  v11 = (void *)-[NSData copy](self->_irkData, "copy");
  -[TVRCSiriRemoteInfo setIrkData:](v4, "setIrkData:", v11);

  v12 = (void *)-[NSString copy](self->_firmwareVersion, "copy");
  -[TVRCSiriRemoteInfo setFirmwareVersion:](v4, "setFirmwareVersion:", v12);

  -[TVRCSiriRemoteInfo setConnected:](v4, "setConnected:", self->_connected);
  return v4;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const void *v6;
  CC_LONG v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  -[TVRCSiriRemoteInfo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  CC_SHA256(v6, v7, (unsigned __int8 *)objc_msgSend(v8, "mutableBytes"));
  objc_msgSend(v8, "subdataWithRange:", 0, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDD1880]);
  v11 = objc_retainAutorelease(v9);
  v12 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));

  return (NSUUID *)v12;
}

- (CBOOBKeyInfo)cbKeyInfo
{
  CBOOBKeyInfo *cbKeyInfo;
  CBOOBKeyInfo *v4;
  CBOOBKeyInfo *v5;
  void *v6;
  void *v7;

  cbKeyInfo = self->_cbKeyInfo;
  if (!cbKeyInfo)
  {
    v4 = (CBOOBKeyInfo *)objc_alloc_init(MEMORY[0x24BDBB270]);
    v5 = self->_cbKeyInfo;
    self->_cbKeyInfo = v4;

    -[TVRCSiriRemoteInfo btAddressData](self, "btAddressData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBOOBKeyInfo setBtAddressData:](self->_cbKeyInfo, "setBtAddressData:", v6);

    -[TVRCSiriRemoteInfo irkData](self, "irkData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBOOBKeyInfo setIrkData:](self->_cbKeyInfo, "setIrkData:", v7);

    cbKeyInfo = self->_cbKeyInfo;
  }
  return cbKeyInfo;
}

- (void)setTvName:(id)a3
{
  objc_storeStrong((id *)&self->_tvName, a3);
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
  objc_storeStrong((id *)&self->_btAddressData, a3);
}

- (NSString)tvModel
{
  return self->_tvModel;
}

- (void)setTvModel:(id)a3
{
  objc_storeStrong((id *)&self->_tvModel, a3);
}

- (NSString)tvName
{
  return self->_tvName;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_storeStrong((id *)&self->_irkData, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (BOOL)supportsFindMy
{
  return self->_supportsFindMy;
}

- (void)setSupportsFindMy:(BOOL)a3
{
  self->_supportsFindMy = a3;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setCbKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cbKeyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbKeyInfo, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_tvName, 0);
  objc_storeStrong((id *)&self->_tvModel, 0);
  objc_storeStrong((id *)&self->_btAddressData, 0);
}

@end
