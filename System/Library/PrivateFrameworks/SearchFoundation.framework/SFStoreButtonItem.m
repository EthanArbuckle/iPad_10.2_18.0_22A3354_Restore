@implementation SFStoreButtonItem

- (SFStoreButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFStoreButtonItem *v5;
  void *v6;
  void *v7;
  SFStoreButtonItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStoreButtonItem;
  v5 = -[SFStoreButtonItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFStoreButtonItem setIdentifier:](v5, "setIdentifier:", v7);

    }
    if (objc_msgSend(v4, "shouldOpenAppAfterInstallCompletes"))
      -[SFStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", objc_msgSend(v4, "shouldOpenAppAfterInstallCompletes"));
    if (objc_msgSend(v4, "identifierType"))
      -[SFStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", objc_msgSend(v4, "identifierType"));
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v8 = v5;
  }

  return v5;
}

- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldOpenAppAfterInstallCompletes = a3;
}

- (BOOL)hasShouldOpenAppAfterInstallCompletes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIdentifierType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_identifierType = a3;
}

- (BOOL)hasIdentifierType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFStoreButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBStoreButtonItem *v6;
  SFStoreButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBStoreButtonItem initWithData:]([_SFPBStoreButtonItem alloc], "initWithData:", v5);
  v7 = -[SFStoreButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBStoreButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBStoreButtonItem initWithFacade:]([_SFPBStoreButtonItem alloc], "initWithFacade:", self);
  -[_SFPBStoreButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBStoreButtonItem *v2;
  void *v3;

  v2 = -[_SFPBStoreButtonItem initWithFacade:]([_SFPBStoreButtonItem alloc], "initWithFacade:", self);
  -[_SFPBStoreButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBStoreButtonItem *v2;
  void *v3;

  v2 = -[_SFPBStoreButtonItem initWithFacade:]([_SFPBStoreButtonItem alloc], "initWithFacade:", self);
  -[_SFPBStoreButtonItem jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFStoreButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFStoreButtonItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  objc_msgSend(v4, "setShouldOpenAppAfterInstallCompletes:", -[SFStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes"));
  objc_msgSend(v4, "setIdentifierType:", -[SFStoreButtonItem identifierType](self, "identifierType"));
  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFStoreButtonItem *v6;
  SFStoreButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  int v14;
  unint64_t v15;
  objc_super v17;

  v6 = (SFStoreButtonItem *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFStoreButtonItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v17.receiver = self;
      v17.super_class = (Class)SFStoreButtonItem;
      if (-[SFButtonItem isEqual:](&v17, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFStoreButtonItem identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStoreButtonItem identifier](v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
        -[SFStoreButtonItem identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFStoreButtonItem identifier](self, "identifier"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFStoreButtonItem identifier](v7, "identifier"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v13 = -[SFStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes");
          if (v13 == -[SFStoreButtonItem shouldOpenAppAfterInstallCompletes](v7, "shouldOpenAppAfterInstallCompletes")
            && (v14 = -[SFStoreButtonItem identifierType](self, "identifierType"),
                v14 == -[SFStoreButtonItem identifierType](v7, "identifierType")))
          {
            v15 = -[SFButtonItem uniqueId](self, "uniqueId");
            v11 = v15 == -[SFButtonItem uniqueId](v7, "uniqueId");
            v12 = v11;
            if (!v10)
              goto LABEL_17;
          }
          else
          {
            v11 = 0;
            v12 = 0;
            if (!v10)
            {
LABEL_17:

              goto LABEL_18;
            }
          }
        }
        else
        {
          v11 = 0;
        }

        v12 = v11;
        goto LABEL_17;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFStoreButtonItem;
  v3 = -[SFButtonItem hash](&v10, sel_hash);
  -[SFStoreButtonItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes");
  v7 = v6 ^ -[SFStoreButtonItem identifierType](self, "identifierType");
  v8 = v7 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldOpenAppAfterInstallCompletes
{
  return self->_shouldOpenAppAfterInstallCompletes;
}

- (int)identifierType
{
  return self->_identifierType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
