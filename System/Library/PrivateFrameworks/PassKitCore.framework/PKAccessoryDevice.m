@implementation PKAccessoryDevice

- (PKAccessoryDevice)init
{

  return 0;
}

+ (id)mockAccessoryDevice
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PKAccessoryDevice *v13;
  uint64_t v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v15 = 0x3FF0000000000000;
  objc_msgSend(v2, "appendBytes:length:", &v15, 8);
  v15 = 0;
  objc_msgSend(v2, "appendBytes:length:", &v15, 8);
  objc_msgSend(v2, "appendBytes:length:", &v15, 8);
  v15 = 0x3FF0000000000000;
  objc_msgSend(v2, "appendBytes:length:", &v15, 8);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v15 = 0;
  objc_msgSend(v3, "appendBytes:length:", &v15, 8);
  objc_msgSend(v3, "appendBytes:length:", &v15, 8);
  objc_msgSend(v3, "appendBytes:length:", &v15, 8);
  v15 = 0x3FF0000000000000;
  objc_msgSend(v3, "appendBytes:length:", &v15, 8);
  _MergedGlobals_178();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v5 = (void *)objc_msgSend(v2, "copy");
  v17[0] = v5;
  off_1ECF21B98();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v7 = (void *)objc_msgSend(v3, "copy");
  v17[1] = v7;
  off_1ECF21BA0();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", 86);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = CFSTR("isMock");
  v17[2] = v9;
  v17[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKAccessoryDevice initWithDictionary:endpointUUID:]([PKAccessoryDevice alloc], "initWithDictionary:endpointUUID:", v10, v12);
  return v13;
}

- (PKAccessoryDevice)initWithDictionary:(id)a3 endpointUUID:(id)a4
{
  id v7;
  id v8;
  PKAccessoryDevice *v9;
  PKAccessoryDevice *v10;
  void *v11;
  uint64_t v12;
  NSData *primaryColorData;
  void *v14;
  uint64_t v15;
  NSData *secondaryColorData;
  void *v17;
  uint64_t v18;
  NSNumber *type;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKAccessoryDevice;
  v9 = -[PKAccessoryDevice init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointUUID, a4);
    objc_storeStrong((id *)&v10->_dictionary, a3);
    _MergedGlobals_178();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    primaryColorData = v10->_primaryColorData;
    v10->_primaryColorData = (NSData *)v12;

    off_1ECF21B98();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryColorData = v10->_secondaryColorData;
    v10->_secondaryColorData = (NSData *)v15;

    off_1ECF21BA0();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    type = v10->_type;
    v10->_type = (NSNumber *)v18;

    v10->_isMock = objc_msgSend(v7, "PKBoolForKey:", CFSTR("isMock"));
  }

  return v10;
}

- (BOOL)isSleeve
{
  return -[NSNumber charValue](self->_type, "charValue") == 86;
}

- (id)accessoryTypeString
{
  int v2;

  v2 = -[NSNumber charValue](self->_type, "charValue");
  if (v2 > 75)
  {
    if (v2 > 85)
    {
      if (v2 == 86)
        return CFSTR("Sleeve");
      if (v2 == 87)
        return CFSTR("Wallet");
    }
    else
    {
      if (v2 == 76)
        return CFSTR("Leather Case");
      if (v2 == 83)
        return CFSTR("Silicon Case");
    }
    return CFSTR("Unidentified");
  }
  if (v2 == 57)
    return CFSTR("Charging Cable");
  if (v2 != 66)
  {
    if (v2 == 67)
      return CFSTR("Clear Case");
    return CFSTR("Unidentified");
  }
  return CFSTR("Battery Pack");
}

- (id)description
{
  void *v3;
  NSString *endpointUUID;
  uint64_t v5;
  void *v6;
  NSData *secondaryColorData;
  NSData *primaryColorData;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  endpointUUID = self->_endpointUUID;
  -[PKAccessoryDevice accessoryTypeString](self, "accessoryTypeString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  secondaryColorData = (NSData *)CFSTR("N/A");
  primaryColorData = self->_primaryColorData;
  if (!primaryColorData)
    primaryColorData = (NSData *)CFSTR("N/A");
  if (self->_secondaryColorData)
    secondaryColorData = self->_secondaryColorData;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory endpointUUID: %@, type: %@, primary color: %@, secondary color: %@"), endpointUUID, v5, primaryColorData, secondaryColorData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *endpointUUID;
  id v5;

  endpointUUID = self->_endpointUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", endpointUUID, CFSTR("endpointUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryColorData, CFSTR("primaryColorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryColorData, CFSTR("secondaryColorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMock, CFSTR("isMock"));

}

- (PKAccessoryDevice)initWithCoder:(id)a3
{
  id v4;
  PKAccessoryDevice *v5;
  uint64_t v6;
  NSString *endpointUUID;
  uint64_t v8;
  NSData *primaryColorData;
  uint64_t v10;
  NSData *secondaryColorData;
  uint64_t v12;
  NSNumber *type;

  v4 = a3;
  v5 = -[PKAccessoryDevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    endpointUUID = v5->_endpointUUID;
    v5->_endpointUUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryColorData"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryColorData = v5->_primaryColorData;
    v5->_primaryColorData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryColorData"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryColorData = v5->_secondaryColorData;
    v5->_secondaryColorData = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSNumber *)v12;

    v5->_isMock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMock"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_endpointUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_primaryColorData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_secondaryColorData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSNumber copyWithZone:](self->_type, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(_BYTE *)(v5 + 8) = self->_isMock;
  return (id)v5;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (NSData)primaryColorData
{
  return self->_primaryColorData;
}

- (void)setPrimaryColorData:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColorData, a3);
}

- (NSData)secondaryColorData
{
  return self->_secondaryColorData;
}

- (void)setSecondaryColorData:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColorData, a3);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (BOOL)isMock
{
  return self->_isMock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_secondaryColorData, 0);
  objc_storeStrong((id *)&self->_primaryColorData, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

@end
