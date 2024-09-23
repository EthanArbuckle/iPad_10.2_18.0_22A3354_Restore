@implementation RFFont

- (RFFont)initWithProtobuf:(id)a3
{
  id v4;
  RFFont *v5;
  void *v6;
  RFSystemFont *v7;
  void *v8;
  RFSystemFont *v9;
  RFFont *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFFont;
  v5 = -[RFFont init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "name"))
      -[RFFont setName:](v5, "setName:", objc_msgSend(v4, "name"));
    objc_msgSend(v4, "system");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFSystemFont alloc];
      objc_msgSend(v4, "system");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFSystemFont initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFFont setSystem:](v5, "setSystem:", v9);

    }
    if (objc_msgSend(v4, "applySmallCaps"))
      -[RFFont setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v4, "applySmallCaps"));
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setName:(int)a3
{
  char has;
  RFSystemFont *system;

  has = (char)self->_has;
  self->_name = a3;
  *(_BYTE *)&self->_has = has & 0xFC | 1;
  system = self->_system;
  self->_system = 0;

}

- (BOOL)hasName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSystem:(id)a3
{
  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_system, a3);
  *(_BYTE *)&self->_has &= ~1u;
  self->_name = 0;
}

- (BOOL)hasSystem
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_applySmallCaps = a3;
}

- (BOOL)hasApplySmallCaps
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (RFFont)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFont *v6;
  RFFont *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFFont initWithData:]([_SFPBRFFont alloc], "initWithData:", v5);
  v7 = -[RFFont initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFont *v6;

  v4 = a3;
  v6 = -[_SFPBRFFont initWithFacade:]([_SFPBRFFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFFont *v2;
  void *v3;

  v2 = -[_SFPBRFFont initWithFacade:]([_SFPBRFFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFFont *v2;
  void *v3;

  v2 = -[_SFPBRFFont initWithFacade:]([_SFPBRFFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFFont hasName](self, "hasName"))
    objc_msgSend(v4, "setName:", -[RFFont name](self, "name"));
  if (-[RFFont hasSystem](self, "hasSystem"))
  {
    -[RFFont system](self, "system");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setSystem:", v6);

  }
  objc_msgSend(v4, "setApplySmallCaps:", -[RFFont applySmallCaps](self, "applySmallCaps"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFFont *v6;
  RFFont *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v6 = (RFFont *)a3;
  if (self == v6)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (-[RFFont isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      v8 = -[RFFont name](self, "name");
      if (v8 != -[RFFont name](v7, "name"))
      {
        LOBYTE(v12) = 0;
LABEL_16:

        goto LABEL_17;
      }
      -[RFFont system](self, "system");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFFont system](v7, "system");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 == 0) == (v10 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_15:

        goto LABEL_16;
      }
      -[RFFont system](self, "system");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11
        || (-[RFFont system](self, "system"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFFont system](v7, "system"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v13 = -[RFFont applySmallCaps](self, "applySmallCaps");
        v12 = v13 ^ -[RFFont applySmallCaps](v7, "applySmallCaps") ^ 1;
        if (!v11)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }

      goto LABEL_14;
    }
    LOBYTE(v12) = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[RFFont name](self, "name");
  -[RFFont system](self, "system");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = v5 ^ -[RFFont applySmallCaps](self, "applySmallCaps");

  return v6;
}

- (int)name
{
  return self->_name;
}

- (RFSystemFont)system
{
  return self->_system;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
}

@end
