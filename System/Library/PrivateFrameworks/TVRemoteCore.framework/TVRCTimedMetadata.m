@implementation TVRCTimedMetadata

+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4
{
  return (TVRCTimedMetadata *)objc_msgSend(a1, "_timedMetadataWithIdentifier:rawData:expectsTimedMetadata:", a3, a4, 0);
}

+ (TVRCTimedMetadata)timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_timedMetadataWithIdentifier:rawData:expectsTimedMetadata:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVRCTimedMetadata *)v12;
}

+ (id)_timedMetadataWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:rawData:expectsTimedMetadata:", v10, v9, v8);

  return v11;
}

- (TVRCTimedMetadata)initWithIdentifier:(id)a3 rawData:(id)a4 expectsTimedMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  TVRCTimedMetadata *v11;
  uint64_t v12;
  NSString *identifier;
  char v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TVRCTimedMetadata;
  v11 = -[TVRCTimedMetadata init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_rawData, a4);
    v11->_hasExpectsTimedMetadata = v10 != 0;
    if (v10)
      v14 = objc_msgSend(v10, "BOOLValue");
    else
      v14 = 0;
    v11->_expectsTimedMetadata = v14;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[TVRCTimedMetadata isEqualToTimedMetadata:](self, "isEqualToTimedMetadata:", v4);

  return v5;
}

- (BOOL)isEqualToTimedMetadata:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v5 = -[TVRCTimedMetadata hasExpectsTimedMetadata](self, "hasExpectsTimedMetadata");
  if (v5 != objc_msgSend(v4, "hasExpectsTimedMetadata"))
    goto LABEL_7;
  v6 = -[TVRCTimedMetadata expectsTimedMetadata](self, "expectsTimedMetadata");
  if (v6 != objc_msgSend(v4, "expectsTimedMetadata"))
    goto LABEL_7;
  -[TVRCTimedMetadata identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[TVRCTimedMetadata rawData](self, "rawData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToData:", v11);

  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TVRCTimedMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[TVRCTimedMetadata rawData](self, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRawData:", v6);

  objc_msgSend(v4, "setHasExpectsTimedMetadata:", -[TVRCTimedMetadata hasExpectsTimedMetadata](self, "hasExpectsTimedMetadata"));
  objc_msgSend(v4, "setExpectsTimedMetadata:", -[TVRCTimedMetadata expectsTimedMetadata](self, "expectsTimedMetadata"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCTimedMetadata)initWithCoder:(id)a3
{
  id v4;
  TVRCTimedMetadata *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSData *rawData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCTimedMetadata;
  v5 = -[TVRCTimedMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawData"));
    v8 = objc_claimAutoreleasedReturnValue();
    rawData = v5->_rawData;
    v5->_rawData = (NSData *)v8;

    v5->_hasExpectsTimedMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasExpectsTimedMetadata"));
    v5->_expectsTimedMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expectsTimedMetadata"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawData, CFSTR("rawData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasExpectsTimedMetadata, CFSTR("hasExpectsTimedMetadata"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_expectsTimedMetadata, CFSTR("expectsTimedMetadata"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (BOOL)hasExpectsTimedMetadata
{
  return self->_hasExpectsTimedMetadata;
}

- (void)setHasExpectsTimedMetadata:(BOOL)a3
{
  self->_hasExpectsTimedMetadata = a3;
}

- (BOOL)expectsTimedMetadata
{
  return self->_expectsTimedMetadata;
}

- (void)setExpectsTimedMetadata:(BOOL)a3
{
  self->_expectsTimedMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
