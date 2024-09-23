@implementation RFSystemFont

- (RFSystemFont)initWithProtobuf:(id)a3
{
  id v4;
  RFSystemFont *v5;
  float v6;
  void *v7;
  void *v8;
  RFSystemFont *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RFSystemFont;
  v5 = -[RFSystemFont init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "size");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "size");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSystemFont setSize:](v5, "setSize:", v8);

    }
    if (objc_msgSend(v4, "weight"))
      -[RFSystemFont setWeight:](v5, "setWeight:", objc_msgSend(v4, "weight"));
    v9 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setWeight:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_weight = a3;
}

- (BOOL)hasWeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFSystemFont)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFont_RFSystemFont *v6;
  RFSystemFont *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFFont_RFSystemFont initWithData:]([_SFPBRFFont_RFSystemFont alloc], "initWithData:", v5);
  v7 = -[RFSystemFont initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFont_RFSystemFont *v6;

  v4 = a3;
  v6 = -[_SFPBRFFont_RFSystemFont initWithFacade:]([_SFPBRFFont_RFSystemFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont_RFSystemFont data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFFont_RFSystemFont *v2;
  void *v3;

  v2 = -[_SFPBRFFont_RFSystemFont initWithFacade:]([_SFPBRFFont_RFSystemFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont_RFSystemFont dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFFont_RFSystemFont *v2;
  void *v3;

  v2 = -[_SFPBRFFont_RFSystemFont initWithFacade:]([_SFPBRFFont_RFSystemFont alloc], "initWithFacade:", self);
  -[_SFPBRFFont_RFSystemFont jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFSystemFont size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSize:", v6);

  objc_msgSend(v4, "setWeight:", -[RFSystemFont weight](self, "weight"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFSystemFont *v6;
  RFSystemFont *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;

  v6 = (RFSystemFont *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFSystemFont isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFSystemFont size](self, "size");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSystemFont size](v7, "size");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFSystemFont size](self, "size");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFSystemFont size](self, "size"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFSystemFont size](v7, "size"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFSystemFont weight](self, "weight");
        v11 = v12 == -[RFSystemFont weight](v7, "weight");
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[RFSystemFont size](self, "size");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFSystemFont weight](self, "weight");

  return v5;
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
}

@end
