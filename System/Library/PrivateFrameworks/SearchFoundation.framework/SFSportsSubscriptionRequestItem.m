@implementation SFSportsSubscriptionRequestItem

- (SFSportsSubscriptionRequestItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsSubscriptionRequestItem *v6;
  SFSportsSubscriptionRequestItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSportsSubscriptionRequestItem initWithData:]([_SFPBSportsSubscriptionRequestItem alloc], "initWithData:", v5);
  v7 = -[SFSportsSubscriptionRequestItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsSubscriptionRequestItem *v6;

  v4 = a3;
  v6 = -[_SFPBSportsSubscriptionRequestItem initWithFacade:]([_SFPBSportsSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBSportsSubscriptionRequestItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSportsSubscriptionRequestItem *v2;
  void *v3;

  v2 = -[_SFPBSportsSubscriptionRequestItem initWithFacade:]([_SFPBSportsSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBSportsSubscriptionRequestItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSportsSubscriptionRequestItem *v2;
  void *v3;

  v2 = -[_SFPBSportsSubscriptionRequestItem initWithFacade:]([_SFPBSportsSubscriptionRequestItem alloc], "initWithFacade:", self);
  -[_SFPBSportsSubscriptionRequestItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFSportsSubscriptionRequestItem;
  v4 = -[SFDomainSubscriptionRequestItem copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCanonicalIdentifier:", v6);

  -[SFSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSportIdentifier:", v8);

  -[SFSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLeagueIdentifier:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSportsSubscriptionRequestItem *v5;
  SFSportsSubscriptionRequestItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v5 = (SFSportsSubscriptionRequestItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFSportsSubscriptionRequestItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFSportsSubscriptionRequestItem;
      if (-[SFDomainSubscriptionRequestItem isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsSubscriptionRequestItem canonicalIdentifier](v6, "canonicalIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsSubscriptionRequestItem canonicalIdentifier](v6, "canonicalIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[SFSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsSubscriptionRequestItem sportIdentifier](v6, "sportIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[SFSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v25 = v12;
          -[SFSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsSubscriptionRequestItem sportIdentifier](v6, "sportIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        -[SFSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsSubscriptionRequestItem leagueIdentifier](v6, "leagueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v29;
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
        else
        {
          v24 = v17;
          v26 = v18;
          -[SFSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            -[SFSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSportsSubscriptionRequestItem leagueIdentifier](v6, "leagueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v22, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFSportsSubscriptionRequestItem;
  v3 = -[SFDomainSubscriptionRequestItem hash](&v11, sel_hash);
  -[SFSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (NSString)canonicalIdentifier
{
  return self->_canonicalIdentifier;
}

- (void)setCanonicalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sportIdentifier
{
  return self->_sportIdentifier;
}

- (void)setSportIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)leagueIdentifier
{
  return self->_leagueIdentifier;
}

- (void)setLeagueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueIdentifier, 0);
  objc_storeStrong((id *)&self->_sportIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSportsSubscriptionRequestItem)initWithProtobuf:(id)a3
{
  id v4;
  SFSportsSubscriptionRequestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFSportsSubscriptionRequestItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFSportsSubscriptionRequestItem;
  v5 = -[SFSportsSubscriptionRequestItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "canonicalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "canonicalIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsSubscriptionRequestItem setCanonicalIdentifier:](v5, "setCanonicalIdentifier:", v7);

    }
    objc_msgSend(v4, "sportIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "sportIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsSubscriptionRequestItem setSportIdentifier:](v5, "setSportIdentifier:", v9);

    }
    objc_msgSend(v4, "leagueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "leagueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsSubscriptionRequestItem setLeagueIdentifier:](v5, "setLeagueIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

@end
