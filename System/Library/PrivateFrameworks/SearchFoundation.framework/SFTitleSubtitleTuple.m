@implementation SFTitleSubtitleTuple

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTitleSubtitleTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTitleSubtitleTuple *v6;
  SFTitleSubtitleTuple *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTitleSubtitleTuple initWithData:]([_SFPBTitleSubtitleTuple alloc], "initWithData:", v5);
  v7 = -[SFTitleSubtitleTuple initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTitleSubtitleTuple *v6;

  v4 = a3;
  v6 = -[_SFPBTitleSubtitleTuple initWithFacade:]([_SFPBTitleSubtitleTuple alloc], "initWithFacade:", self);
  -[_SFPBTitleSubtitleTuple data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTitleSubtitleTuple *v2;
  void *v3;

  v2 = -[_SFPBTitleSubtitleTuple initWithFacade:]([_SFPBTitleSubtitleTuple alloc], "initWithFacade:", self);
  -[_SFPBTitleSubtitleTuple dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTitleSubtitleTuple *v2;
  void *v3;

  v2 = -[_SFPBTitleSubtitleTuple initWithFacade:]([_SFPBTitleSubtitleTuple alloc], "initWithFacade:", self);
  -[_SFPBTitleSubtitleTuple jsonData](v2, "jsonData");
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
  -[SFTitleSubtitleTuple title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFTitleSubtitleTuple subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSubtitle:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFTitleSubtitleTuple *v5;
  SFTitleSubtitleTuple *v6;
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

  v5 = (SFTitleSubtitleTuple *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFTitleSubtitleTuple isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFTitleSubtitleTuple title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleSubtitleTuple title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFTitleSubtitleTuple title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFTitleSubtitleTuple title](self, "title");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTitleSubtitleTuple title](v6, "title");
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
      -[SFTitleSubtitleTuple subtitle](self, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleSubtitleTuple subtitle](v6, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFTitleSubtitleTuple subtitle](self, "subtitle");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFTitleSubtitleTuple subtitle](self, "subtitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFTitleSubtitleTuple subtitle](v6, "subtitle");
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

  -[SFTitleSubtitleTuple title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFTitleSubtitleTuple subtitle](self, "subtitle");
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

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (SFTitleSubtitleTuple)initWithProtobuf:(id)a3
{
  id v4;
  SFTitleSubtitleTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFTitleSubtitleTuple *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFTitleSubtitleTuple;
  v5 = -[SFTitleSubtitleTuple init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleSubtitleTuple setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "subtitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleSubtitleTuple setSubtitle:](v5, "setSubtitle:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
