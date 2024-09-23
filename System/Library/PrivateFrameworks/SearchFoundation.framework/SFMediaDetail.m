@implementation SFMediaDetail

- (SFMediaDetail)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  SFText *v9;
  void *v10;
  SFText *v11;
  SFMediaDetail *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFMediaDetail;
  v5 = -[SFMediaDetail init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaDetail setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFText alloc];
      objc_msgSend(v4, "content");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFText initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFMediaDetail setContent:](v5, "setContent:", v11);

    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMediaDetail)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaDetail *v6;
  SFMediaDetail *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMediaDetail initWithData:]([_SFPBMediaDetail alloc], "initWithData:", v5);
  v7 = -[SFMediaDetail initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaDetail *v6;

  v4 = a3;
  v6 = -[_SFPBMediaDetail initWithFacade:]([_SFPBMediaDetail alloc], "initWithFacade:", self);
  -[_SFPBMediaDetail data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMediaDetail *v2;
  void *v3;

  v2 = -[_SFPBMediaDetail initWithFacade:]([_SFPBMediaDetail alloc], "initWithFacade:", self);
  -[_SFPBMediaDetail dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaDetail *v2;
  void *v3;

  v2 = -[_SFPBMediaDetail initWithFacade:]([_SFPBMediaDetail alloc], "initWithFacade:", self);
  -[_SFPBMediaDetail jsonData](v2, "jsonData");
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
  -[SFMediaDetail title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFMediaDetail content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setContent:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMediaDetail *v5;
  SFMediaDetail *v6;
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

  v5 = (SFMediaDetail *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMediaDetail isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFMediaDetail title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaDetail title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFMediaDetail title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFMediaDetail title](self, "title");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaDetail title](v6, "title");
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
      -[SFMediaDetail content](self, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaDetail content](v6, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFMediaDetail content](self, "content");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFMediaDetail content](self, "content");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaDetail content](v6, "content");
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

  -[SFMediaDetail title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFMediaDetail content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SFText)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
