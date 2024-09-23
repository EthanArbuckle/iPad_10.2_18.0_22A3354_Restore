@implementation SFCalendarImage

- (SFCalendarImage)initWithProtobuf:(id)a3
{
  id v4;
  SFCalendarImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFCalendarImage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCalendarImage;
  v5 = -[SFCalendarImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "secondsSince1970");
      objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarImage setDate:](v5, "setDate:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFCalendarImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFCalendarImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFCalendarImage;
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
  _SFPBCalendarImage *v2;
  void *v3;

  v2 = -[_SFPBCalendarImage initWithFacade:]([_SFPBCalendarImage alloc], "initWithFacade:", self);
  -[_SFPBCalendarImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCalendarImage *v2;
  void *v3;

  v2 = -[_SFPBCalendarImage initWithFacade:]([_SFPBCalendarImage alloc], "initWithFacade:", self);
  -[_SFPBCalendarImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFCalendarImage;
  v4 = -[SFImage copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFCalendarImage date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDate:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCalendarImage *v4;
  SFCalendarImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFCalendarImage *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFCalendarImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFCalendarImage,
             -[SFImage isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFCalendarImage date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCalendarImage date](v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFCalendarImage date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCalendarImage date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCalendarImage date](v5, "date");
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
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCalendarImage;
  v3 = -[SFImage hash](&v7, sel_hash);
  -[SFCalendarImage date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCalendarImage)initWithDate:(id)a3
{
  id v4;
  SFCalendarImage *v5;
  SFCalendarImage *v6;

  v4 = a3;
  v5 = -[SFCalendarImage init](self, "init");
  v6 = v5;
  if (v5)
    -[SFCalendarImage setDate:](v5, "setDate:", v4);

  return v6;
}

@end
