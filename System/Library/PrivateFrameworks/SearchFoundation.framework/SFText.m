@implementation SFText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)textWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setText:", v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBText *v6;

  v4 = a3;
  v6 = -[_SFPBText initWithFacade:]([_SFPBText alloc], "initWithFacade:", self);
  -[_SFPBText data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (SFText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBText *v6;
  SFText *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBText initWithData:]([_SFPBText alloc], "initWithData:", v5);
  v7 = -[SFText initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (SFText)initWithProtobuf:(id)a3
{
  id v4;
  SFText *v5;
  void *v6;
  void *v7;
  SFText *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFText;
  v5 = -[SFText init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFText setText:](v5, "setText:", v7);

    }
    if (objc_msgSend(v4, "maxLines"))
      -[SFText setMaxLines:](v5, "setMaxLines:", objc_msgSend(v4, "maxLines"));
    v8 = v5;
  }

  return v5;
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setMaxLines:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxLines = a3;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

- (BOOL)hasMaxLines
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBText *v2;
  void *v3;

  v2 = -[_SFPBText initWithFacade:]([_SFPBText alloc], "initWithFacade:", self);
  -[_SFPBText dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBText *v2;
  void *v3;

  v2 = -[_SFPBText initWithFacade:]([_SFPBText alloc], "initWithFacade:", self);
  -[_SFPBText jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText:", v6);

  objc_msgSend(v4, "setMaxLines:", -[SFText maxLines](self, "maxLines"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFText *v6;
  SFText *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;

  v6 = (SFText *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFText isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[SFText text](self, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFText text](v7, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[SFText text](self, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[SFText text](self, "text"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFText text](v7, "text"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[SFText maxLines](self, "maxLines");
        v11 = v12 == -[SFText maxLines](v7, "maxLines");
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

  -[SFText text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SFText maxLines](self, "maxLines") ^ v4;

  return v5;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[SFText text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  -[SFText text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(a3) = objc_msgSend(v4, "characterAtIndex:", a3);

  return a3;
}

@end
