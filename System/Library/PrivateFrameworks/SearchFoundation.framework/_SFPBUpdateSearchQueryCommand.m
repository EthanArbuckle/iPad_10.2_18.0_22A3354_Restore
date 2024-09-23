@implementation _SFPBUpdateSearchQueryCommand

- (_SFPBUpdateSearchQueryCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBUpdateSearchQueryCommand *v5;
  void *v6;
  void *v7;
  _SFPBUpdateSearchQueryCommand *v8;

  v4 = a3;
  v5 = -[_SFPBUpdateSearchQueryCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUpdateSearchQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    if (objc_msgSend(v4, "hasQuerySource"))
      -[_SFPBUpdateSearchQueryCommand setQuerySource:](v5, "setQuerySource:", objc_msgSend(v4, "querySource"));
    v8 = v5;
  }

  return v5;
}

- (void)setSearchString:(id)a3
{
  NSString *v4;
  NSString *searchString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  searchString = self->_searchString;
  self->_searchString = v4;

}

- (void)setQuerySource:(int)a3
{
  self->_querySource = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUpdateSearchQueryCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBUpdateSearchQueryCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBUpdateSearchQueryCommand querySource](self, "querySource"))
    PBDataWriterWriteInt32Field();

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
  BOOL v13;
  int querySource;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBUpdateSearchQueryCommand searchString](self, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBUpdateSearchQueryCommand searchString](self, "searchString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        querySource = self->_querySource;
        v13 = querySource == objc_msgSend(v4, "querySource");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBUpdateSearchQueryCommand searchString](self, "searchString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "searchString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return (2654435761 * self->_querySource) ^ -[NSString hash](self->_searchString, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_querySource)
  {
    v4 = -[_SFPBUpdateSearchQueryCommand querySource](self, "querySource");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042178 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("querySource"));

  }
  if (self->_searchString)
  {
    -[_SFPBUpdateSearchQueryCommand searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchString"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBUpdateSearchQueryCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBUpdateSearchQueryCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBUpdateSearchQueryCommand *v5;
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
    self = -[_SFPBUpdateSearchQueryCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBUpdateSearchQueryCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBUpdateSearchQueryCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBUpdateSearchQueryCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBUpdateSearchQueryCommand;
  v5 = -[_SFPBUpdateSearchQueryCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBUpdateSearchQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("querySource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBUpdateSearchQueryCommand setQuerySource:](v5, "setQuerySource:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int)querySource
{
  return self->_querySource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
