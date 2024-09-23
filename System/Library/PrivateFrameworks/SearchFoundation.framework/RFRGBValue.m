@implementation RFRGBValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFRGBValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFRGBValue *v6;
  RFRGBValue *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFRGBValue initWithData:]([_SFPBRFRGBValue alloc], "initWithData:", v5);
  v7 = -[RFRGBValue initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFRGBValue *v6;

  v4 = a3;
  v6 = -[_SFPBRFRGBValue initWithFacade:]([_SFPBRFRGBValue alloc], "initWithFacade:", self);
  -[_SFPBRFRGBValue data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFRGBValue *v2;
  void *v3;

  v2 = -[_SFPBRFRGBValue initWithFacade:]([_SFPBRFRGBValue alloc], "initWithFacade:", self);
  -[_SFPBRFRGBValue dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFRGBValue *v2;
  void *v3;

  v2 = -[_SFPBRFRGBValue initWithFacade:]([_SFPBRFRGBValue alloc], "initWithFacade:", self);
  -[_SFPBRFRGBValue jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFRGBValue red](self, "red");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRed:", v6);

  -[RFRGBValue green](self, "green");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setGreen:", v8);

  -[RFRGBValue blue](self, "blue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBlue:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFRGBValue *v5;
  RFRGBValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (RFRGBValue *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFRGBValue isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFRGBValue red](self, "red");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue red](v6, "red");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[RFRGBValue red](self, "red");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFRGBValue red](self, "red");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFRGBValue red](v6, "red");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[RFRGBValue green](self, "green");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue green](v6, "green");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[RFRGBValue green](self, "green");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[RFRGBValue green](self, "green");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFRGBValue green](v6, "green");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      -[RFRGBValue blue](self, "blue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue blue](v6, "blue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 == 0) == (v18 != 0))
      {

        v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30)
          goto LABEL_26;
      }
      else
      {
        v24 = v17;
        v26 = v18;
        -[RFRGBValue blue](self, "blue");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[RFRGBValue blue](self, "blue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFRGBValue blue](v6, "blue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v22, "isEqual:");

        }
        else
        {

          v11 = 1;
        }
        v3 = v27;
        if (!v30)
          goto LABEL_26;
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RFRGBValue red](self, "red");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFRGBValue green](self, "green");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFRGBValue blue](self, "blue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSNumber)red
{
  return self->_red;
}

- (void)setRed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)green
{
  return self->_green;
}

- (void)setGreen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)blue
{
  return self->_blue;
}

- (void)setBlue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);
  objc_storeStrong((id *)&self->_red, 0);
}

- (RFRGBValue)initWithProtobuf:(id)a3
{
  id v4;
  RFRGBValue *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  RFRGBValue *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFRGBValue;
  v5 = -[RFRGBValue init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "red");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "red");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue setRed:](v5, "setRed:", v8);

    }
    objc_msgSend(v4, "green");
    if (v9 != 0.0)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "green");
      objc_msgSend(v10, "numberWithFloat:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue setGreen:](v5, "setGreen:", v11);

    }
    objc_msgSend(v4, "blue");
    if (v12 != 0.0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "blue");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFRGBValue setBlue:](v5, "setBlue:", v14);

    }
    v15 = v5;
  }

  return v5;
}

@end
