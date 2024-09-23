@implementation _SFPBRequestProductPageCommand

- (_SFPBRequestProductPageCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBRequestProductPageCommand *v5;
  void *v6;
  void *v7;
  _SFPBRequestProductPageCommand *v8;

  v4 = a3;
  v5 = -[_SFPBRequestProductPageCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "distributorBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "distributorBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRequestProductPageCommand setDistributorBundleIdentifier:](v5, "setDistributorBundleIdentifier:", v7);

    }
    if (objc_msgSend(v4, "hasItemIdentifier"))
      -[_SFPBRequestProductPageCommand setItemIdentifier:](v5, "setItemIdentifier:", objc_msgSend(v4, "itemIdentifier"));
    if (objc_msgSend(v4, "hasVersionIdentifier"))
      -[_SFPBRequestProductPageCommand setVersionIdentifier:](v5, "setVersionIdentifier:", objc_msgSend(v4, "versionIdentifier"));
    v8 = v5;
  }

  return v5;
}

- (void)setDistributorBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *distributorBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  distributorBundleIdentifier = self->_distributorBundleIdentifier;
  self->_distributorBundleIdentifier = v4;

}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setVersionIdentifier:(unint64_t)a3
{
  self->_versionIdentifier = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRequestProductPageCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBRequestProductPageCommand itemIdentifier](self, "itemIdentifier"))
    PBDataWriterWriteUint64Field();
  v5 = -[_SFPBRequestProductPageCommand versionIdentifier](self, "versionIdentifier");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t itemIdentifier;
  unint64_t versionIdentifier;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[_SFPBRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distributorBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_10;
  }
  -[_SFPBRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distributorBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_10;
  }
  else
  {

  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier != objc_msgSend(v4, "itemIdentifier"))
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  versionIdentifier = self->_versionIdentifier;
  v15 = versionIdentifier == objc_msgSend(v4, "versionIdentifier");
LABEL_11:

  return v15;
}

- (unint64_t)hash
{
  return (2654435761u * self->_itemIdentifier) ^ -[NSString hash](self->_distributorBundleIdentifier, "hash") ^ (2654435761u * self->_versionIdentifier);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_distributorBundleIdentifier)
  {
    -[_SFPBRequestProductPageCommand distributorBundleIdentifier](self, "distributorBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("distributorBundleIdentifier"));

  }
  if (self->_itemIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBRequestProductPageCommand itemIdentifier](self, "itemIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("itemIdentifier"));

  }
  if (self->_versionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBRequestProductPageCommand versionIdentifier](self, "versionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("versionIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRequestProductPageCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRequestProductPageCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRequestProductPageCommand *v5;
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
    self = -[_SFPBRequestProductPageCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRequestProductPageCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRequestProductPageCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBRequestProductPageCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRequestProductPageCommand;
  v5 = -[_SFPBRequestProductPageCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distributorBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRequestProductPageCommand setDistributorBundleIdentifier:](v5, "setDistributorBundleIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRequestProductPageCommand setItemIdentifier:](v5, "setItemIdentifier:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("versionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRequestProductPageCommand setVersionIdentifier:](v5, "setVersionIdentifier:", objc_msgSend(v9, "unsignedLongLongValue"));
    v10 = v5;

  }
  return v5;
}

- (NSString)distributorBundleIdentifier
{
  return self->_distributorBundleIdentifier;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributorBundleIdentifier, 0);
}

@end
