@implementation SFCommandValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCommandValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCommandValue *v6;
  SFCommandValue *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCommandValue initWithData:]([_SFPBCommandValue alloc], "initWithData:", v5);
  v7 = -[SFCommandValue initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCommandValue *v6;

  v4 = a3;
  v6 = -[_SFPBCommandValue initWithFacade:]([_SFPBCommandValue alloc], "initWithFacade:", self);
  -[_SFPBCommandValue data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCommandValue *v2;
  void *v3;

  v2 = -[_SFPBCommandValue initWithFacade:]([_SFPBCommandValue alloc], "initWithFacade:", self);
  -[_SFPBCommandValue dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCommandValue *v2;
  void *v3;

  v2 = -[_SFPBCommandValue initWithFacade:]([_SFPBCommandValue alloc], "initWithFacade:", self);
  -[_SFPBCommandValue jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCommandValue referentialCommand](self, "referentialCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setReferentialCommand:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCommandValue *v4;
  SFCommandValue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFCommandValue *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFCommandValue isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFCommandValue referentialCommand](self, "referentialCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommandValue referentialCommand](v5, "referentialCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFCommandValue referentialCommand](self, "referentialCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCommandValue referentialCommand](self, "referentialCommand");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommandValue referentialCommand](v5, "referentialCommand");
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

  -[SFCommandValue referentialCommand](self, "referentialCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (SFReferentialCommand)referentialCommand
{
  return self->_referentialCommand;
}

- (void)setReferentialCommand:(id)a3
{
  objc_storeStrong((id *)&self->_referentialCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referentialCommand, 0);
}

- (SFCommandValue)initWithProtobuf:(id)a3
{
  id v4;
  SFCommandValue *v5;
  void *v6;
  SFReferentialCommand *v7;
  void *v8;
  SFReferentialCommand *v9;
  SFCommandValue *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCommandValue;
  v5 = -[SFCommandValue init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "referentialCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFReferentialCommand alloc];
      objc_msgSend(v4, "referentialCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFReferentialCommand initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFCommandValue setReferentialCommand:](v5, "setReferentialCommand:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
