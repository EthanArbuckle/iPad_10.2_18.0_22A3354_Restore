@implementation SFShowContactCardCommand

- (void)setIsSuggestedContact:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSuggestedContact = a3;
}

- (BOOL)hasIsSuggestedContact
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFShowContactCardCommand)initWithCoder:(id)a3
{
  id v4;
  SFShowContactCardCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFShowContactCardCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand contactIdentifier](v8, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowContactCardCommand setContactIdentifier:](v5, "setContactIdentifier:", v9);

    -[SFShowContactCardCommand setIsSuggestedContact:](v5, "setIsSuggestedContact:", -[SFCommand isSuggestedContact](v8, "isSuggestedContact"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v10);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    -[SFCommand backendData](v8, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    -[SFCommand commandReference](v8, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFShowContactCardCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShowContactCardCommand *v2;
  void *v3;

  v2 = -[_SFPBShowContactCardCommand initWithFacade:]([_SFPBShowContactCardCommand alloc], "initWithFacade:", self);
  -[_SFPBShowContactCardCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShowContactCardCommand *v2;
  void *v3;

  v2 = -[_SFPBShowContactCardCommand initWithFacade:]([_SFPBShowContactCardCommand alloc], "initWithFacade:", self);
  -[_SFPBShowContactCardCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFShowContactCardCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFShowContactCardCommand contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContactIdentifier:", v6);

  objc_msgSend(v4, "setIsSuggestedContact:", -[SFShowContactCardCommand isSuggestedContact](self, "isSuggestedContact"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFShowContactCardCommand *v6;
  SFShowContactCardCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v6 = (SFShowContactCardCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFShowContactCardCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFShowContactCardCommand;
      if (-[SFCommand isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFShowContactCardCommand contactIdentifier](self, "contactIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowContactCardCommand contactIdentifier](v7, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFShowContactCardCommand contactIdentifier](self, "contactIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFShowContactCardCommand contactIdentifier](self, "contactIdentifier"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFShowContactCardCommand contactIdentifier](v7, "contactIdentifier"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFShowContactCardCommand isSuggestedContact](self, "isSuggestedContact");
          v11 = v12 ^ -[SFShowContactCardCommand isSuggestedContact](v7, "isSuggestedContact") ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
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
  v8.super_class = (Class)SFShowContactCardCommand;
  v3 = -[SFCommand hash](&v8, sel_hash);
  -[SFShowContactCardCommand contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFShowContactCardCommand isSuggestedContact](self, "isSuggestedContact") ^ v3;

  return v6;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSuggestedContact
{
  return self->_isSuggestedContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShowContactCardCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFShowContactCardCommand *v5;
  void *v6;
  void *v7;
  SFShowContactCardCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShowContactCardCommand;
  v5 = -[SFShowContactCardCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFShowContactCardCommand setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    if (objc_msgSend(v4, "isSuggestedContact"))
      -[SFShowContactCardCommand setIsSuggestedContact:](v5, "setIsSuggestedContact:", objc_msgSend(v4, "isSuggestedContact"));
    v8 = v5;
  }

  return v5;
}

@end
