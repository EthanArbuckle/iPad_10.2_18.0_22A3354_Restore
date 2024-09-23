@implementation RFOptionalBool

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFOptionalBool)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFOptionalBool *v6;
  RFOptionalBool *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFOptionalBool initWithData:]([_SFPBRFOptionalBool alloc], "initWithData:", v5);
  v7 = -[RFOptionalBool initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFOptionalBool *v6;

  v4 = a3;
  v6 = -[_SFPBRFOptionalBool initWithFacade:]([_SFPBRFOptionalBool alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalBool data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFOptionalBool *v2;
  void *v3;

  v2 = -[_SFPBRFOptionalBool initWithFacade:]([_SFPBRFOptionalBool alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalBool dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFOptionalBool *v2;
  void *v3;

  v2 = -[_SFPBRFOptionalBool initWithFacade:]([_SFPBRFOptionalBool alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalBool jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setValue:", -[RFOptionalBool value](self, "value"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFOptionalBool *v4;
  RFOptionalBool *v5;
  BOOL v6;
  BOOL v7;
  char v8;

  v4 = (RFOptionalBool *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[RFOptionalBool isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[RFOptionalBool value](self, "value");
    v7 = -[RFOptionalBool value](v5, "value");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[RFOptionalBool value](self, "value");
}

- (BOOL)value
{
  return self->_value;
}

- (RFOptionalBool)initWithProtobuf:(id)a3
{
  id v4;
  RFOptionalBool *v5;
  RFOptionalBool *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFOptionalBool;
  v5 = -[RFOptionalBool init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "value"))
      -[RFOptionalBool setValue:](v5, "setValue:", objc_msgSend(v4, "value"));
    v6 = v5;
  }

  return v5;
}

@end
