@implementation RFAspectRatio

- (RFAspectRatio)initWithProtobuf:(id)a3
{
  id v4;
  RFAspectRatio *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  RFAspectRatio *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFAspectRatio;
  v5 = -[RFAspectRatio init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "width");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "width");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAspectRatio setWidth:](v5, "setWidth:", v8);

    }
    objc_msgSend(v4, "height");
    if (v9 != 0.0)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "height");
      objc_msgSend(v10, "numberWithFloat:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAspectRatio setHeight:](v5, "setHeight:", v11);

    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFAspectRatio)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAspectRatio *v6;
  RFAspectRatio *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFAspectRatio initWithData:]([_SFPBRFAspectRatio alloc], "initWithData:", v5);
  v7 = -[RFAspectRatio initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAspectRatio *v6;

  v4 = a3;
  v6 = -[_SFPBRFAspectRatio initWithFacade:]([_SFPBRFAspectRatio alloc], "initWithFacade:", self);
  -[_SFPBRFAspectRatio data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFAspectRatio *v2;
  void *v3;

  v2 = -[_SFPBRFAspectRatio initWithFacade:]([_SFPBRFAspectRatio alloc], "initWithFacade:", self);
  -[_SFPBRFAspectRatio dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFAspectRatio *v2;
  void *v3;

  v2 = -[_SFPBRFAspectRatio initWithFacade:]([_SFPBRFAspectRatio alloc], "initWithFacade:", self);
  -[_SFPBRFAspectRatio jsonData](v2, "jsonData");
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
  -[RFAspectRatio width](self, "width");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setWidth:", v6);

  -[RFAspectRatio height](self, "height");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setHeight:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFAspectRatio *v5;
  RFAspectRatio *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (RFAspectRatio *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFAspectRatio isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFAspectRatio width](self, "width");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAspectRatio width](v6, "width");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFAspectRatio width](self, "width");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFAspectRatio width](self, "width");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFAspectRatio width](v6, "width");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[RFAspectRatio height](self, "height");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAspectRatio height](v6, "height");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFAspectRatio height](self, "height");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFAspectRatio height](self, "height");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFAspectRatio height](v6, "height");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RFAspectRatio width](self, "width");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFAspectRatio height](self, "height");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

@end
