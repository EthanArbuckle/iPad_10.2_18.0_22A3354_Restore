@implementation SFUserActivityInfo

- (SFUserActivityInfo)initWithProtobuf:(id)a3
{
  id v4;
  SFUserActivityInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SFUserActivityInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFUserActivityInfo;
  v5 = -[SFUserActivityInfo init](&v15, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "valueType"))
      -[SFUserActivityInfo setValueType:](v5, "setValueType:", objc_msgSend(v4, "valueType"));
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo setStringValue:](v5, "setStringValue:", v9);

    }
    objc_msgSend(v4, "urlValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "urlValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo setUrlValue:](v5, "setUrlValue:", v12);

    }
    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValueType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_valueType = a3;
}

- (BOOL)hasValueType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFUserActivityInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBUserActivityInfo *v6;
  SFUserActivityInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBUserActivityInfo initWithData:]([_SFPBUserActivityInfo alloc], "initWithData:", v5);
  v7 = -[SFUserActivityInfo initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBUserActivityInfo *v6;

  v4 = a3;
  v6 = -[_SFPBUserActivityInfo initWithFacade:]([_SFPBUserActivityInfo alloc], "initWithFacade:", self);
  -[_SFPBUserActivityInfo data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBUserActivityInfo *v2;
  void *v3;

  v2 = -[_SFPBUserActivityInfo initWithFacade:]([_SFPBUserActivityInfo alloc], "initWithFacade:", self);
  -[_SFPBUserActivityInfo dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBUserActivityInfo *v2;
  void *v3;

  v2 = -[_SFPBUserActivityInfo initWithFacade:]([_SFPBUserActivityInfo alloc], "initWithFacade:", self);
  -[_SFPBUserActivityInfo jsonData](v2, "jsonData");
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
  objc_msgSend(v4, "setValueType:", -[SFUserActivityInfo valueType](self, "valueType"));
  -[SFUserActivityInfo key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setKey:", v6);

  -[SFUserActivityInfo stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setStringValue:", v8);

  -[SFUserActivityInfo urlValue](self, "urlValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUrlValue:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFUserActivityInfo *v5;
  SFUserActivityInfo *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (SFUserActivityInfo *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFUserActivityInfo isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFUserActivityInfo valueType](self, "valueType");
      if (v7 != -[SFUserActivityInfo valueType](v6, "valueType"))
      {
        v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[SFUserActivityInfo key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo key](v6, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[SFUserActivityInfo key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFUserActivityInfo key](self, "key");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserActivityInfo key](v6, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v11))
        {
          v12 = 0;
          goto LABEL_30;
        }
        v32 = v11;
      }
      -[SFUserActivityInfo stringValue](self, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo stringValue](v6, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        v12 = 0;
        goto LABEL_29;
      }
      -[SFUserActivityInfo stringValue](self, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v26 = v13;
        -[SFUserActivityInfo stringValue](self, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserActivityInfo stringValue](v6, "stringValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v12 = 0;
          v13 = v26;
          goto LABEL_27;
        }
        v30 = v16;
        v31 = v3;
        v13 = v26;
      }
      else
      {
        v30 = 0;
        v31 = v3;
      }
      -[SFUserActivityInfo urlValue](self, "urlValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserActivityInfo urlValue](v6, "urlValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 == 0) == (v19 != 0))
      {

        v12 = 0;
        v16 = v30;
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
      else
      {
        v25 = v18;
        v27 = v19;
        -[SFUserActivityInfo urlValue](self, "urlValue");
        v20 = objc_claimAutoreleasedReturnValue();
        v16 = v30;
        if (v20)
        {
          v24 = (void *)v20;
          -[SFUserActivityInfo urlValue](self, "urlValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFUserActivityInfo urlValue](v6, "urlValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v23, "isEqual:");

        }
        else
        {

          v12 = 1;
        }
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
LABEL_27:

LABEL_28:
LABEL_29:
      v11 = v32;
      if (!v10)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    v12 = 0;
  }
LABEL_34:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SFUserActivityInfo valueType](self, "valueType");
  -[SFUserActivityInfo key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFUserActivityInfo stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFUserActivityInfo urlValue](self, "urlValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (int)valueType
{
  return self->_valueType;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
