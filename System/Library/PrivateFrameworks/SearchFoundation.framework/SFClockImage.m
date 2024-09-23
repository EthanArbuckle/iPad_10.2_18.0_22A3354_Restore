@implementation SFClockImage

- (SFClockImage)initWithProtobuf:(id)a3
{
  id v4;
  SFClockImage *v5;
  void *v6;
  void *v7;
  void *v8;
  SFClockImage *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFClockImage;
  v5 = -[SFClockImage init](&v11, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hour"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "hour"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClockImage setHour:](v5, "setHour:", v6);

    }
    if (objc_msgSend(v4, "minute"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "minute"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClockImage setMinute:](v5, "setMinute:", v7);

    }
    if (objc_msgSend(v4, "second"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "second"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClockImage setSecond:](v5, "setSecond:", v8);

    }
    v9 = v5;
  }

  return v5;
}

- (SFClockImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFClockImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFClockImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBClockImage *v2;
  void *v3;

  v2 = -[_SFPBClockImage initWithFacade:]([_SFPBClockImage alloc], "initWithFacade:", self);
  -[_SFPBClockImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBClockImage *v2;
  void *v3;

  v2 = -[_SFPBClockImage initWithFacade:]([_SFPBClockImage alloc], "initWithFacade:", self);
  -[_SFPBClockImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFClockImage;
  v4 = -[SFImage copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFClockImage hour](self, "hour");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setHour:", v6);

  -[SFClockImage minute](self, "minute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMinute:", v8);

  -[SFClockImage second](self, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSecond:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFClockImage *v5;
  SFClockImage *v6;
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
  objc_super v32;

  v5 = (SFClockImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFClockImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFClockImage;
      if (-[SFImage isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFClockImage hour](self, "hour");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFClockImage hour](v6, "hour");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFClockImage hour](self, "hour");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFClockImage hour](self, "hour");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFClockImage hour](v6, "hour");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[SFClockImage minute](self, "minute");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFClockImage minute](v6, "minute");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[SFClockImage minute](self, "minute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v25 = v12;
          -[SFClockImage minute](self, "minute");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFClockImage minute](v6, "minute");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        -[SFClockImage second](self, "second");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFClockImage second](v6, "second");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v29;
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
        else
        {
          v24 = v17;
          v26 = v18;
          -[SFClockImage second](self, "second");
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            -[SFClockImage second](self, "second");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFClockImage second](v6, "second");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v22, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFClockImage;
  v3 = -[SFImage hash](&v11, sel_hash);
  -[SFClockImage hour](self, "hour");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFClockImage minute](self, "minute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFClockImage second](self, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (NSNumber)hour
{
  return self->_hour;
}

- (void)setHour:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)minute
{
  return self->_minute;
}

- (void)setMinute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_minute, 0);
  objc_storeStrong((id *)&self->_hour, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
