@implementation RFOptionalFloat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFOptionalFloat)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFOptionalFloat *v6;
  RFOptionalFloat *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFOptionalFloat initWithData:]([_SFPBRFOptionalFloat alloc], "initWithData:", v5);
  v7 = -[RFOptionalFloat initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFOptionalFloat *v6;

  v4 = a3;
  v6 = -[_SFPBRFOptionalFloat initWithFacade:]([_SFPBRFOptionalFloat alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalFloat data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFOptionalFloat *v2;
  void *v3;

  v2 = -[_SFPBRFOptionalFloat initWithFacade:]([_SFPBRFOptionalFloat alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalFloat dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFOptionalFloat *v2;
  void *v3;

  v2 = -[_SFPBRFOptionalFloat initWithFacade:]([_SFPBRFOptionalFloat alloc], "initWithFacade:", self);
  -[_SFPBRFOptionalFloat jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFOptionalFloat value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setValue:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFOptionalFloat *v4;
  RFOptionalFloat *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (RFOptionalFloat *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[RFOptionalFloat isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RFOptionalFloat value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFOptionalFloat value](v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[RFOptionalFloat value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFOptionalFloat value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFOptionalFloat value](v5, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

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
  void *v2;
  unint64_t v3;

  -[RFOptionalFloat value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

- (RFOptionalFloat)initWithProtobuf:(id)a3
{
  id v4;
  RFOptionalFloat *v5;
  float v6;
  void *v7;
  void *v8;
  RFOptionalFloat *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RFOptionalFloat;
  v5 = -[RFOptionalFloat init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "value");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "value");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFOptionalFloat setValue:](v5, "setValue:", v8);

    }
    v9 = v5;
  }

  return v5;
}

@end
