@implementation _SFPBPerformEntityQueryCommand

- (_SFPBPerformEntityQueryCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBPerformEntityQueryCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBSymbolImage *v11;
  void *v12;
  _SFPBSymbolImage *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFPBColor *v17;
  void *v18;
  _SFPBColor *v19;
  void *v20;
  _SFPBDrillDownMetadata *v21;
  void *v22;
  _SFPBDrillDownMetadata *v23;
  void *v24;
  _SFPBDrillDownMetadata *v25;
  void *v26;
  _SFPBDrillDownMetadata *v27;
  _SFPBPerformEntityQueryCommand *v28;

  v4 = a3;
  v5 = -[_SFPBPerformEntityQueryCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformEntityQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "tokenString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "tokenString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformEntityQueryCommand setTokenString:](v5, "setTokenString:", v9);

    }
    objc_msgSend(v4, "symbolImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBSymbolImage alloc];
      objc_msgSend(v4, "symbolImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBSymbolImage initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBPerformEntityQueryCommand setSymbolImage:](v5, "setSymbolImage:", v13);

    }
    if (objc_msgSend(v4, "hasEntityType"))
      -[_SFPBPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", objc_msgSend(v4, "entityType"));
    objc_msgSend(v4, "entityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "entityIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPerformEntityQueryCommand setEntityIdentifier:](v5, "setEntityIdentifier:", v15);

    }
    objc_msgSend(v4, "entityBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBColor alloc];
      objc_msgSend(v4, "entityBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBColor initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBPerformEntityQueryCommand setEntityBackgroundColor:](v5, "setEntityBackgroundColor:", v19);

    }
    objc_msgSend(v4, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBDrillDownMetadata alloc];
      objc_msgSend(v4, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBDrillDownMetadata initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBPerformEntityQueryCommand setMetadata:](v5, "setMetadata:", v23);

    }
    objc_msgSend(v4, "drilldownMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBDrillDownMetadata alloc];
      objc_msgSend(v4, "drilldownMetadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBDrillDownMetadata initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBPerformEntityQueryCommand setDrilldownMetadata:](v5, "setDrilldownMetadata:", v27);

    }
    v28 = v5;
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

- (void)setTokenString:(id)a3
{
  NSString *v4;
  NSString *tokenString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tokenString = self->_tokenString;
  self->_tokenString = v4;

}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (void)setEntityType:(int)a3
{
  self->_entityType = a3;
}

- (void)setEntityIdentifier:(id)a3
{
  NSString *v4;
  NSString *entityIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  entityIdentifier = self->_entityIdentifier;
  self->_entityIdentifier = v4;

}

- (void)setEntityBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_entityBackgroundColor, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setDrilldownMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_drilldownMetadata, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPerformEntityQueryCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_SFPBPerformEntityQueryCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBPerformEntityQueryCommand tokenString](self, "tokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBPerformEntityQueryCommand symbolImage](self, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBPerformEntityQueryCommand entityType](self, "entityType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBPerformEntityQueryCommand metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

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
  int entityType;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[_SFPBPerformEntityQueryCommand searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand searchString](self, "searchString");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPerformEntityQueryCommand searchString](self, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBPerformEntityQueryCommand tokenString](self, "tokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand tokenString](self, "tokenString");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPerformEntityQueryCommand tokenString](self, "tokenString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBPerformEntityQueryCommand symbolImage](self, "symbolImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand symbolImage](self, "symbolImage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPerformEntityQueryCommand symbolImage](self, "symbolImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_38;
  }
  else
  {

  }
  entityType = self->_entityType;
  if (entityType != objc_msgSend(v4, "entityType"))
    goto LABEL_38;
  -[_SFPBPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBPerformEntityQueryCommand metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBPerformEntityQueryCommand metadata](self, "metadata");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBPerformEntityQueryCommand metadata](self, "metadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drilldownMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[_SFPBPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_41:
    v43 = 1;
    goto LABEL_39;
  }
  v39 = (void *)v38;
  -[_SFPBPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drilldownMetadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "isEqual:", v41);

  if ((v42 & 1) != 0)
    goto LABEL_41;
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_searchString, "hash");
  v4 = -[NSString hash](self->_tokenString, "hash");
  v5 = -[_SFPBSymbolImage hash](self->_symbolImage, "hash");
  v6 = 2654435761 * self->_entityType;
  v7 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_entityIdentifier, "hash");
  v8 = v7 ^ -[_SFPBColor hash](self->_entityBackgroundColor, "hash") ^ v6;
  v9 = -[_SFPBDrillDownMetadata hash](self->_metadata, "hash");
  return v8 ^ v9 ^ -[_SFPBDrillDownMetadata hash](self->_drilldownMetadata, "hash");
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_drilldownMetadata)
  {
    -[_SFPBPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("drilldownMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("drilldownMetadata"));

    }
  }
  if (self->_entityBackgroundColor)
  {
    -[_SFPBPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityBackgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityBackgroundColor"));

    }
  }
  if (self->_entityIdentifier)
  {
    -[_SFPBPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityIdentifier"));

  }
  if (self->_entityType)
  {
    v12 = -[_SFPBPerformEntityQueryCommand entityType](self, "entityType");
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E4042078 + v12);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entityType"));

  }
  if (self->_metadata)
  {
    -[_SFPBPerformEntityQueryCommand metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("metadata"));

    }
  }
  if (self->_searchString)
  {
    -[_SFPBPerformEntityQueryCommand searchString](self, "searchString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("searchString"));

  }
  if (self->_symbolImage)
  {
    -[_SFPBPerformEntityQueryCommand symbolImage](self, "symbolImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("symbolImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("symbolImage"));

    }
  }
  if (self->_tokenString)
  {
    -[_SFPBPerformEntityQueryCommand tokenString](self, "tokenString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("tokenString"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPerformEntityQueryCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPerformEntityQueryCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPerformEntityQueryCommand *v5;
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
    self = -[_SFPBPerformEntityQueryCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPerformEntityQueryCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPerformEntityQueryCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBSymbolImage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _SFPBColor *v16;
  void *v17;
  _SFPBDrillDownMetadata *v18;
  void *v19;
  _SFPBDrillDownMetadata *v20;
  _SFPBPerformEntityQueryCommand *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBPerformEntityQueryCommand;
  v5 = -[_SFPBPerformEntityQueryCommand init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPerformEntityQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    v24 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBPerformEntityQueryCommand setTokenString:](v5, "setTokenString:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbolImage"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBSymbolImage initWithDictionary:]([_SFPBSymbolImage alloc], "initWithDictionary:", v10);
      -[_SFPBPerformEntityQueryCommand setSymbolImage:](v5, "setSymbolImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[_SFPBPerformEntityQueryCommand setEntityIdentifier:](v5, "setEntityIdentifier:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityBackgroundColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v15);
      -[_SFPBPerformEntityQueryCommand setEntityBackgroundColor:](v5, "setEntityBackgroundColor:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBDrillDownMetadata initWithDictionary:]([_SFPBDrillDownMetadata alloc], "initWithDictionary:", v17);
      -[_SFPBPerformEntityQueryCommand setMetadata:](v5, "setMetadata:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("drilldownMetadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBDrillDownMetadata initWithDictionary:]([_SFPBDrillDownMetadata alloc], "initWithDictionary:", v19);
      -[_SFPBPerformEntityQueryCommand setDrilldownMetadata:](v5, "setDrilldownMetadata:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (_SFPBSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (int)entityType
{
  return self->_entityType;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (_SFPBColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (_SFPBDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (_SFPBDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
