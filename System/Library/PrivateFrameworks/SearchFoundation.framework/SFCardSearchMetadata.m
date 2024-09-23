@implementation SFCardSearchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsServerEntity:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isServerEntity = a3;
}

- (BOOL)hasIsServerEntity
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsFederatedDomainSearch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isFederatedDomainSearch = a3;
}

- (BOOL)hasIsFederatedDomainSearch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFCardSearchMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSearchMetadata *v6;
  SFCardSearchMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCardSearchMetadata initWithData:]([_SFPBCardSearchMetadata alloc], "initWithData:", v5);
  v7 = -[SFCardSearchMetadata initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardSearchMetadata *v6;

  v4 = a3;
  v6 = -[_SFPBCardSearchMetadata initWithFacade:]([_SFPBCardSearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardSearchMetadata data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCardSearchMetadata *v2;
  void *v3;

  v2 = -[_SFPBCardSearchMetadata initWithFacade:]([_SFPBCardSearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardSearchMetadata dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCardSearchMetadata *v2;
  void *v3;

  v2 = -[_SFPBCardSearchMetadata initWithFacade:]([_SFPBCardSearchMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardSearchMetadata jsonData](v2, "jsonData");
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
  objc_msgSend(v4, "setIsServerEntity:", -[SFCardSearchMetadata isServerEntity](self, "isServerEntity"));
  -[SFCardSearchMetadata searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSearchQuery:", v6);

  -[SFCardSearchMetadata viewConfigName](self, "viewConfigName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setViewConfigName:", v8);

  objc_msgSend(v4, "setIsFederatedDomainSearch:", -[SFCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFCardSearchMetadata *v5;
  SFCardSearchMetadata *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (SFCardSearchMetadata *)a3;
  if (self == v5)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (-[SFCardSearchMetadata isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFCardSearchMetadata isServerEntity](self, "isServerEntity");
      if (v7 != -[SFCardSearchMetadata isServerEntity](v6, "isServerEntity"))
      {
        LOBYTE(v8) = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[SFCardSearchMetadata searchQuery](self, "searchQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSearchMetadata searchQuery](v6, "searchQuery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 == 0) == (v10 != 0))
      {
        LOBYTE(v8) = 0;
LABEL_26:

        goto LABEL_27;
      }
      -[SFCardSearchMetadata searchQuery](self, "searchQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[SFCardSearchMetadata searchQuery](self, "searchQuery");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSearchMetadata searchQuery](v6, "searchQuery");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          LOBYTE(v8) = 0;
          goto LABEL_24;
        }
        v23 = v12;
      }
      -[SFCardSearchMetadata viewConfigName](self, "viewConfigName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSearchMetadata viewConfigName](v6, "viewConfigName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        LOBYTE(v8) = 0;
        goto LABEL_23;
      }
      -[SFCardSearchMetadata viewConfigName](self, "viewConfigName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v20 = v3;
        -[SFCardSearchMetadata viewConfigName](self, "viewConfigName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSearchMetadata viewConfigName](v6, "viewConfigName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          LOBYTE(v8) = 0;
          v3 = v20;
LABEL_21:

LABEL_22:
LABEL_23:
          v12 = v23;
          if (!v11)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_24:

          goto LABEL_25;
        }
        v3 = v20;
      }
      v18 = -[SFCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch");
      v8 = v18 ^ -[SFCardSearchMetadata isFederatedDomainSearch](v6, "isFederatedDomainSearch") ^ 1;
      if (!v16)
        goto LABEL_22;
      goto LABEL_21;
    }
    LOBYTE(v8) = 0;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[SFCardSearchMetadata isServerEntity](self, "isServerEntity");
  -[SFCardSearchMetadata searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCardSearchMetadata viewConfigName](self, "viewConfigName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  v8 = v7 ^ -[SFCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch");

  return v8;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setViewConfigName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isFederatedDomainSearch
{
  return self->_isFederatedDomainSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (SFCardSearchMetadata)initWithProtobuf:(id)a3
{
  id v4;
  SFCardSearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFCardSearchMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCardSearchMetadata;
  v5 = -[SFCardSearchMetadata init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isServerEntity"))
      -[SFCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v4, "isServerEntity"));
    objc_msgSend(v4, "searchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSearchMetadata setSearchQuery:](v5, "setSearchQuery:", v7);

    }
    objc_msgSend(v4, "viewConfigName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "viewConfigName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSearchMetadata setViewConfigName:](v5, "setViewConfigName:", v9);

    }
    if (objc_msgSend(v4, "isFederatedDomainSearch"))
      -[SFCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", objc_msgSend(v4, "isFederatedDomainSearch"));
    v10 = v5;
  }

  return v5;
}

@end
