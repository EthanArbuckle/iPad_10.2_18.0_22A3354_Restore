@implementation _SFPBSportsSubscriptionRequestItem

- (_SFPBSportsSubscriptionRequestItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBSportsSubscriptionRequestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBSportsSubscriptionRequestItem *v12;

  v4 = a3;
  v5 = -[_SFPBSportsSubscriptionRequestItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "canonicalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "canonicalIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsSubscriptionRequestItem setCanonicalIdentifier:](v5, "setCanonicalIdentifier:", v7);

    }
    objc_msgSend(v4, "sportIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "sportIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsSubscriptionRequestItem setSportIdentifier:](v5, "setSportIdentifier:", v9);

    }
    objc_msgSend(v4, "leagueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "leagueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsSubscriptionRequestItem setLeagueIdentifier:](v5, "setLeagueIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setCanonicalIdentifier:(id)a3
{
  NSString *v4;
  NSString *canonicalIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  canonicalIdentifier = self->_canonicalIdentifier;
  self->_canonicalIdentifier = v4;

}

- (void)setSportIdentifier:(id)a3
{
  NSString *v4;
  NSString *sportIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sportIdentifier = self->_sportIdentifier;
  self->_sportIdentifier = v4;

}

- (void)setLeagueIdentifier:(id)a3
{
  NSString *v4;
  NSString *leagueIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  leagueIdentifier = self->_leagueIdentifier;
  self->_leagueIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSportsSubscriptionRequestItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leagueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leagueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_canonicalIdentifier, "hash");
  v4 = -[NSString hash](self->_sportIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_leagueIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_canonicalIdentifier)
  {
    -[_SFPBSportsSubscriptionRequestItem canonicalIdentifier](self, "canonicalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("canonicalIdentifier"));

  }
  if (self->_leagueIdentifier)
  {
    -[_SFPBSportsSubscriptionRequestItem leagueIdentifier](self, "leagueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("leagueIdentifier"));

  }
  if (self->_sportIdentifier)
  {
    -[_SFPBSportsSubscriptionRequestItem sportIdentifier](self, "sportIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sportIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSportsSubscriptionRequestItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBSportsSubscriptionRequestItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSportsSubscriptionRequestItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBSportsSubscriptionRequestItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSportsSubscriptionRequestItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSportsSubscriptionRequestItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBSportsSubscriptionRequestItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBSportsSubscriptionRequestItem;
  v5 = -[_SFPBSportsSubscriptionRequestItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canonicalIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBSportsSubscriptionRequestItem setCanonicalIdentifier:](v5, "setCanonicalIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBSportsSubscriptionRequestItem setSportIdentifier:](v5, "setSportIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leagueIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBSportsSubscriptionRequestItem setLeagueIdentifier:](v5, "setLeagueIdentifier:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)canonicalIdentifier
{
  return self->_canonicalIdentifier;
}

- (NSString)sportIdentifier
{
  return self->_sportIdentifier;
}

- (NSString)leagueIdentifier
{
  return self->_leagueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueIdentifier, 0);
  objc_storeStrong((id *)&self->_sportIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalIdentifier, 0);
}

@end
