@implementation _SFPBCardMetadata

- (_SFPBCardMetadata)initWithFacade:(id)a3
{
  id v4;
  _SFPBCardMetadata *v5;
  void *v6;
  void *v7;
  _SFPBCardMetadata *v8;

  v4 = a3;
  v5 = -[_SFPBCardMetadata init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasIsServerEntity"))
      -[_SFPBCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v4, "isServerEntity"));
    objc_msgSend(v4, "queryToSearchAcrossAllDomains");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "queryToSearchAcrossAllDomains");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCardMetadata setQueryToSearchAcrossAllDomains:](v5, "setQueryToSearchAcrossAllDomains:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setIsServerEntity:(BOOL)a3
{
  self->_isServerEntity = a3;
}

- (void)setQueryToSearchAcrossAllDomains:(id)a3
{
  NSString *v4;
  NSString *queryToSearchAcrossAllDomains;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  queryToSearchAcrossAllDomains = self->_queryToSearchAcrossAllDomains;
  self->_queryToSearchAcrossAllDomains = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_SFPBCardMetadata isServerEntity](self, "isServerEntity"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int isServerEntity;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    isServerEntity = self->_isServerEntity;
    if (isServerEntity == objc_msgSend(v4, "isServerEntity"))
    {
      -[_SFPBCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "queryToSearchAcrossAllDomains");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_SFPBCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_SFPBCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "queryToSearchAcrossAllDomains");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_isServerEntity)
    v2 = 2654435761;
  else
    v2 = 0;
  return -[NSString hash](self->_queryToSearchAcrossAllDomains, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isServerEntity)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCardMetadata isServerEntity](self, "isServerEntity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isServerEntity"));

  }
  if (self->_queryToSearchAcrossAllDomains)
  {
    -[_SFPBCardMetadata queryToSearchAcrossAllDomains](self, "queryToSearchAcrossAllDomains");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("queryToSearchAcrossAllDomains"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCardMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCardMetadata)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCardMetadata *v5;
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
    self = -[_SFPBCardMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCardMetadata)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCardMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBCardMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBCardMetadata;
  v5 = -[_SFPBCardMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isServerEntity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryToSearchAcrossAllDomains"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[_SFPBCardMetadata setQueryToSearchAcrossAllDomains:](v5, "setQueryToSearchAcrossAllDomains:", v8);

    }
    v9 = v5;

  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryToSearchAcrossAllDomains, 0);
}

@end
