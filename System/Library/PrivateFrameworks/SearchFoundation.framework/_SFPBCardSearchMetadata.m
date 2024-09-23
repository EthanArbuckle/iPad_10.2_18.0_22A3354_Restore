@implementation _SFPBCardSearchMetadata

- (_SFPBCardSearchMetadata)initWithFacade:(id)a3
{
  id v4;
  _SFPBCardSearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBCardSearchMetadata *v10;

  v4 = a3;
  v5 = -[_SFPBCardSearchMetadata init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasIsServerEntity"))
      -[_SFPBCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v4, "isServerEntity"));
    objc_msgSend(v4, "searchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSearchMetadata setSearchQuery:](v5, "setSearchQuery:", v7);

    }
    objc_msgSend(v4, "viewConfigName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "viewConfigName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardSearchMetadata setViewConfigName:](v5, "setViewConfigName:", v9);

    }
    if (objc_msgSend(v4, "hasIsFederatedDomainSearch"))
      -[_SFPBCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", objc_msgSend(v4, "isFederatedDomainSearch"));
    v10 = v5;
  }

  return v5;
}

- (void)setIsServerEntity:(BOOL)a3
{
  self->_isServerEntity = a3;
}

- (void)setSearchQuery:(id)a3
{
  NSString *v4;
  NSString *searchQuery;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  searchQuery = self->_searchQuery;
  self->_searchQuery = v4;

}

- (void)setViewConfigName:(id)a3
{
  NSString *v4;
  NSString *viewConfigName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  viewConfigName = self->_viewConfigName;
  self->_viewConfigName = v4;

}

- (void)setIsFederatedDomainSearch:(BOOL)a3
{
  self->_isFederatedDomainSearch = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardSearchMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBCardSearchMetadata isServerEntity](self, "isServerEntity"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCardSearchMetadata searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBCardSearchMetadata viewConfigName](self, "viewConfigName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int isServerEntity;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int isFederatedDomainSearch;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  isServerEntity = self->_isServerEntity;
  if (isServerEntity != objc_msgSend(v4, "isServerEntity"))
    goto LABEL_13;
  -[_SFPBCardSearchMetadata searchQuery](self, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[_SFPBCardSearchMetadata searchQuery](self, "searchQuery");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBCardSearchMetadata searchQuery](self, "searchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[_SFPBCardSearchMetadata viewConfigName](self, "viewConfigName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewConfigName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_SFPBCardSearchMetadata viewConfigName](self, "viewConfigName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      isFederatedDomainSearch = self->_isFederatedDomainSearch;
      v18 = isFederatedDomainSearch == objc_msgSend(v4, "isFederatedDomainSearch");
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[_SFPBCardSearchMetadata viewConfigName](self, "viewConfigName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewConfigName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if (self->_isServerEntity)
    v3 = 2654435761;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_searchQuery, "hash");
  v5 = -[NSString hash](self->_viewConfigName, "hash");
  if (self->_isFederatedDomainSearch)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v5 ^ v3 ^ v6;
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
  if (self->_isFederatedDomainSearch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isFederatedDomainSearch"));

  }
  if (self->_isServerEntity)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardSearchMetadata isServerEntity](self, "isServerEntity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isServerEntity"));

  }
  if (self->_searchQuery)
  {
    -[_SFPBCardSearchMetadata searchQuery](self, "searchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchQuery"));

  }
  if (self->_viewConfigName)
  {
    -[_SFPBCardSearchMetadata viewConfigName](self, "viewConfigName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("viewConfigName"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCardSearchMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCardSearchMetadata)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCardSearchMetadata *v5;
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
    self = -[_SFPBCardSearchMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCardSearchMetadata)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCardSearchMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBCardSearchMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBCardSearchMetadata;
  v5 = -[_SFPBCardSearchMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isServerEntity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchQuery"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[_SFPBCardSearchMetadata setSearchQuery:](v5, "setSearchQuery:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewConfigName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[_SFPBCardSearchMetadata setViewConfigName:](v5, "setViewConfigName:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFederatedDomainSearch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
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

@end
