@implementation _SFPBEntitySearchMetadata

- (_SFPBEntitySearchMetadata)initWithFacade:(id)a3
{
  id v4;
  _SFPBEntitySearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBEntitySearchMetadata *v14;

  v4 = a3;
  v5 = -[_SFPBEntitySearchMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "entitySearchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "entitySearchQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEntitySearchMetadata setEntitySearchQuery:](v5, "setEntitySearchQuery:", v7);

    }
    objc_msgSend(v4, "tokenQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "tokenQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEntitySearchMetadata setTokenQuery:](v5, "setTokenQuery:", v9);

    }
    objc_msgSend(v4, "entityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "entityIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEntitySearchMetadata setEntityIdentifier:](v5, "setEntityIdentifier:", v11);

    }
    objc_msgSend(v4, "viewConfigName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "viewConfigName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEntitySearchMetadata setViewConfigName:](v5, "setViewConfigName:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setEntitySearchQuery:(id)a3
{
  NSString *v4;
  NSString *entitySearchQuery;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  entitySearchQuery = self->_entitySearchQuery;
  self->_entitySearchQuery = v4;

}

- (void)setTokenQuery:(id)a3
{
  NSString *v4;
  NSString *tokenQuery;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tokenQuery = self->_tokenQuery;
  self->_tokenQuery = v4;

}

- (void)setEntityIdentifier:(id)a3
{
  NSString *v4;
  NSString *entityIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  entityIdentifier = self->_entityIdentifier;
  self->_entityIdentifier = v4;

}

- (void)setViewConfigName:(id)a3
{
  NSString *v4;
  NSString *viewConfigName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  viewConfigName = self->_viewConfigName;
  self->_viewConfigName = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBEntitySearchMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBEntitySearchMetadata tokenQuery](self, "tokenQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBEntitySearchMetadata viewConfigName](self, "viewConfigName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySearchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySearchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBEntitySearchMetadata tokenQuery](self, "tokenQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBEntitySearchMetadata tokenQuery](self, "tokenQuery");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBEntitySearchMetadata tokenQuery](self, "tokenQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBEntitySearchMetadata viewConfigName](self, "viewConfigName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewConfigName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBEntitySearchMetadata viewConfigName](self, "viewConfigName");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBEntitySearchMetadata viewConfigName](self, "viewConfigName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewConfigName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_entitySearchQuery, "hash");
  v4 = -[NSString hash](self->_tokenQuery, "hash") ^ v3;
  v5 = -[NSString hash](self->_entityIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_viewConfigName, "hash");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityIdentifier)
  {
    -[_SFPBEntitySearchMetadata entityIdentifier](self, "entityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityIdentifier"));

  }
  if (self->_entitySearchQuery)
  {
    -[_SFPBEntitySearchMetadata entitySearchQuery](self, "entitySearchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entitySearchQuery"));

  }
  if (self->_tokenQuery)
  {
    -[_SFPBEntitySearchMetadata tokenQuery](self, "tokenQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("tokenQuery"));

  }
  if (self->_viewConfigName)
  {
    -[_SFPBEntitySearchMetadata viewConfigName](self, "viewConfigName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("viewConfigName"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBEntitySearchMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBEntitySearchMetadata)initWithJSON:(id)a3
{
  void *v4;
  _SFPBEntitySearchMetadata *v5;
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
    self = -[_SFPBEntitySearchMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBEntitySearchMetadata)initWithDictionary:(id)a3
{
  id v4;
  _SFPBEntitySearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBEntitySearchMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBEntitySearchMetadata;
  v5 = -[_SFPBEntitySearchMetadata init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchQuery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBEntitySearchMetadata setEntitySearchQuery:](v5, "setEntitySearchQuery:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenQuery"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBEntitySearchMetadata setTokenQuery:](v5, "setTokenQuery:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBEntitySearchMetadata setEntityIdentifier:](v5, "setEntityIdentifier:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewConfigName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBEntitySearchMetadata setViewConfigName:](v5, "setViewConfigName:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)entitySearchQuery
{
  return self->_entitySearchQuery;
}

- (NSString)tokenQuery
{
  return self->_tokenQuery;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenQuery, 0);
  objc_storeStrong((id *)&self->_entitySearchQuery, 0);
}

@end
