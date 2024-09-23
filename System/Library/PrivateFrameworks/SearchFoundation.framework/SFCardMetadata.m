@implementation SFCardMetadata

- (SFCardMetadata)initWithProtobuf:(id)a3
{
  id v4;
  SFCardMetadata *v5;
  void *v6;
  void *v7;
  SFCardMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCardMetadata;
  v5 = -[SFCardMetadata init](&v10, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isServerEntity"))
      -[SFCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v4, "isServerEntity"));
    objc_msgSend(v4, "queryToSearchAcrossAllDomains");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "queryToSearchAcrossAllDomains");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardMetadata setQueryToSearchAcrossAllDomains:](v5, "setQueryToSearchAcrossAllDomains:", v7);

    }
    v8 = v5;
  }

  return v5;
}

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

- (SFCardMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardMetadata *v6;
  SFCardMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCardMetadata initWithData:]([_SFPBCardMetadata alloc], "initWithData:", v5);
  v7 = -[SFCardMetadata initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCardMetadata *v6;

  v4 = a3;
  v6 = -[_SFPBCardMetadata initWithFacade:]([_SFPBCardMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardMetadata data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCardMetadata *v2;
  void *v3;

  v2 = -[_SFPBCardMetadata initWithFacade:]([_SFPBCardMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardMetadata dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCardMetadata *v2;
  void *v3;

  v2 = -[_SFPBCardMetadata initWithFacade:]([_SFPBCardMetadata alloc], "initWithFacade:", self);
  -[_SFPBCardMetadata jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsServerEntity:", -[SFCardMetadata isServerEntity](self, "isServerEntity"));
  -[SFCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setQueryToSearchAcrossAllDomains:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCardMetadata *v4;
  SFCardMetadata *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (SFCardMetadata *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[SFCardMetadata isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFCardMetadata isServerEntity](self, "isServerEntity");
    if (v6 == -[SFCardMetadata isServerEntity](v5, "isServerEntity"))
    {
      -[SFCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardMetadata queryToSearchAcrossAllDomains](v5, "queryToSearchAcrossAllDomains");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v7 = 0;
      }
      else
      {
        -[SFCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SFCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardMetadata queryToSearchAcrossAllDomains](v5, "queryToSearchAcrossAllDomains");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v7 = 1;
        }

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SFCardMetadata isServerEntity](self, "isServerEntity");
  -[SFCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (NSString)queryToSearchAcrossAllDomains
{
  return self->_queryToSearchAcrossAllDomains;
}

- (void)setQueryToSearchAcrossAllDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryToSearchAcrossAllDomains, 0);
}

@end
