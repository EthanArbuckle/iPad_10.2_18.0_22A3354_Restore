@implementation RFColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRgb_value:(id)a3
{
  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_rgb_value, a3);
  *(_BYTE *)&self->_has &= ~2u;
  self->_name = 0;
}

- (BOOL)hasRgb_value
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setName:(int)a3
{
  char has;
  RFRGBValue *rgb_value;

  has = (char)self->_has;
  self->_name = a3;
  *(_BYTE *)&self->_has = has & 0xFC | 2;
  rgb_value = self->_rgb_value;
  self->_rgb_value = 0;

}

- (BOOL)hasName
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFColor *v6;
  RFColor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFColor initWithData:]([_SFPBRFColor alloc], "initWithData:", v5);
  v7 = -[RFColor initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFColor *v6;

  v4 = a3;
  v6 = -[_SFPBRFColor initWithFacade:]([_SFPBRFColor alloc], "initWithFacade:", self);
  -[_SFPBRFColor data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFColor *v2;
  void *v3;

  v2 = -[_SFPBRFColor initWithFacade:]([_SFPBRFColor alloc], "initWithFacade:", self);
  -[_SFPBRFColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFColor *v2;
  void *v3;

  v2 = -[_SFPBRFColor initWithFacade:]([_SFPBRFColor alloc], "initWithFacade:", self);
  -[_SFPBRFColor jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFColor hasRgb_value](self, "hasRgb_value"))
  {
    -[RFColor rgb_value](self, "rgb_value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setRgb_value:", v6);

  }
  if (-[RFColor hasName](self, "hasName"))
    objc_msgSend(v4, "setName:", -[RFColor name](self, "name"));
  -[RFColor alpha](self, "alpha");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAlpha:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFColor *v5;
  RFColor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (RFColor *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFColor isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFColor rgb_value](self, "rgb_value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFColor rgb_value](v6, "rgb_value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      -[RFColor rgb_value](self, "rgb_value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFColor rgb_value](self, "rgb_value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFColor rgb_value](v6, "rgb_value");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_18;
        }
        v21 = v10;
      }
      v12 = -[RFColor name](self, "name");
      if (v12 == -[RFColor name](v6, "name"))
      {
        -[RFColor alpha](self, "alpha");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFColor alpha](v6, "alpha");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          -[RFColor alpha](self, "alpha");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            -[RFColor alpha](self, "alpha");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFColor alpha](v6, "alpha");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v20, "isEqual:", v19);

          }
          else
          {

            v11 = 1;
          }
LABEL_17:
          v10 = v21;
          if (!v9)
          {
LABEL_19:

            goto LABEL_20;
          }
LABEL_18:

          goto LABEL_19;
        }

      }
      v11 = 0;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[RFColor rgb_value](self, "rgb_value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFColor name](self, "name");
  -[RFColor alpha](self, "alpha");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (RFRGBValue)rgb_value
{
  return self->_rgb_value;
}

- (int)name
{
  return self->_name;
}

- (RFOptionalFloat)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_alpha, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_rgb_value, 0);
}

- (RFColor)initWithProtobuf:(id)a3
{
  id v4;
  RFColor *v5;
  void *v6;
  RFRGBValue *v7;
  void *v8;
  RFRGBValue *v9;
  void *v10;
  RFOptionalFloat *v11;
  void *v12;
  RFOptionalFloat *v13;
  RFColor *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFColor;
  v5 = -[RFColor init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "rgb_value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFRGBValue alloc];
      objc_msgSend(v4, "rgb_value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFRGBValue initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFColor setRgb_value:](v5, "setRgb_value:", v9);

    }
    if (objc_msgSend(v4, "name"))
      -[RFColor setName:](v5, "setName:", objc_msgSend(v4, "name"));
    objc_msgSend(v4, "alpha");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFOptionalFloat alloc];
      objc_msgSend(v4, "alpha");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFOptionalFloat initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFColor setAlpha:](v5, "setAlpha:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
