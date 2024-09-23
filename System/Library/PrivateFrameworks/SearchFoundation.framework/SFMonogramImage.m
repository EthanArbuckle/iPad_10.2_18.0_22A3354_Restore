@implementation SFMonogramImage

- (SFMonogramImage)initWithProtobuf:(id)a3
{
  id v4;
  SFMonogramImage *v5;
  void *v6;
  void *v7;
  SFMonogramImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFMonogramImage;
  v5 = -[SFMonogramImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "monogramLetters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "monogramLetters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMonogramImage setMonogramLetters:](v5, "setMonogramLetters:", v7);

    }
    if (objc_msgSend(v4, "monogramStyle"))
      -[SFMonogramImage setMonogramStyle:](v5, "setMonogramStyle:", objc_msgSend(v4, "monogramStyle"));
    v8 = v5;
  }

  return v5;
}

- (void)setMonogramStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_monogramStyle = a3;
}

- (BOOL)hasMonogramStyle
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMonogramImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFMonogramImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFMonogramImage;
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
  _SFPBMonogramImage *v2;
  void *v3;

  v2 = -[_SFPBMonogramImage initWithFacade:]([_SFPBMonogramImage alloc], "initWithFacade:", self);
  -[_SFPBMonogramImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMonogramImage *v2;
  void *v3;

  v2 = -[_SFPBMonogramImage initWithFacade:]([_SFPBMonogramImage alloc], "initWithFacade:", self);
  -[_SFPBMonogramImage jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFMonogramImage;
  v4 = -[SFImage copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFMonogramImage monogramLetters](self, "monogramLetters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMonogramLetters:", v6);

  objc_msgSend(v4, "setMonogramStyle:", -[SFMonogramImage monogramStyle](self, "monogramStyle"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFMonogramImage *v6;
  SFMonogramImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = (SFMonogramImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMonogramImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFMonogramImage;
      if (-[SFImage isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFMonogramImage monogramLetters](self, "monogramLetters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMonogramImage monogramLetters](v7, "monogramLetters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFMonogramImage monogramLetters](self, "monogramLetters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFMonogramImage monogramLetters](self, "monogramLetters"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFMonogramImage monogramLetters](v7, "monogramLetters"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFMonogramImage monogramStyle](self, "monogramStyle");
          v11 = v12 == -[SFMonogramImage monogramStyle](v7, "monogramStyle");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFMonogramImage;
  v3 = -[SFImage hash](&v8, sel_hash);
  -[SFMonogramImage monogramLetters](self, "monogramLetters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFMonogramImage monogramStyle](self, "monogramStyle") ^ v3;

  return v6;
}

- (NSString)monogramLetters
{
  return self->_monogramLetters;
}

- (void)setMonogramLetters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)monogramStyle
{
  return self->_monogramStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramLetters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
