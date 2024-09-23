@implementation SFAbstractCommand

- (SFAbstractCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFAbstractCommand *v5;
  void *v6;
  SFCommandValue *v7;
  void *v8;
  SFCommandValue *v9;
  SFAbstractCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAbstractCommand;
  v5 = -[SFAbstractCommand init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "type"))
      -[SFAbstractCommand setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCommandValue alloc];
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCommandValue initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFAbstractCommand setValue:](v5, "setValue:", v9);

    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFAbstractCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAbstractCommand *v6;
  SFAbstractCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAbstractCommand initWithData:]([_SFPBAbstractCommand alloc], "initWithData:", v5);
  v7 = -[SFAbstractCommand initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAbstractCommand *v6;

  v4 = a3;
  v6 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", self);
  -[_SFPBAbstractCommand data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAbstractCommand *v2;
  void *v3;

  v2 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", self);
  -[_SFPBAbstractCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAbstractCommand *v2;
  void *v3;

  v2 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", self);
  -[_SFPBAbstractCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFAbstractCommand type](self, "type"));
  -[SFAbstractCommand value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setValue:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAbstractCommand *v4;
  SFAbstractCommand *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (SFAbstractCommand *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[SFAbstractCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFAbstractCommand type](self, "type");
    if (v6 == -[SFAbstractCommand type](v5, "type"))
    {
      -[SFAbstractCommand value](self, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAbstractCommand value](v5, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v12 = 0;
      }
      else
      {
        -[SFAbstractCommand value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFAbstractCommand value](self, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAbstractCommand value](v5, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 1;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SFAbstractCommand type](self, "type");
  -[SFAbstractCommand value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (int)type
{
  return self->_type;
}

- (SFCommandValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
