@implementation _SFPBStoreButtonItem

- (_SFPBStoreButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBStoreButtonItem *v5;
  void *v6;
  void *v7;
  _SFPBStoreButtonItem *v8;

  v4 = a3;
  v5 = -[_SFPBStoreButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStoreButtonItem setIdentifier:](v5, "setIdentifier:", v7);

    }
    if (objc_msgSend(v4, "hasShouldOpenAppAfterInstallCompletes"))
      -[_SFPBStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", objc_msgSend(v4, "shouldOpenAppAfterInstallCompletes"));
    if (objc_msgSend(v4, "hasIdentifierType"))
      -[_SFPBStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", objc_msgSend(v4, "identifierType"));
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBStoreButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v8 = v5;
  }

  return v5;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3
{
  self->_shouldOpenAppAfterInstallCompletes = a3;
}

- (void)setIdentifierType:(int)a3
{
  self->_identifierType = a3;
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStoreButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBStoreButtonItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBStoreButtonItem identifierType](self, "identifierType"))
    PBDataWriterWriteInt32Field();
  v5 = -[_SFPBStoreButtonItem uniqueId](self, "uniqueId");
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
  int shouldOpenAppAfterInstallCompletes;
  int identifierType;
  unint64_t uniqueId;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[_SFPBStoreButtonItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  -[_SFPBStoreButtonItem identifier](self, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBStoreButtonItem identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_11;
  }
  else
  {

  }
  shouldOpenAppAfterInstallCompletes = self->_shouldOpenAppAfterInstallCompletes;
  if (shouldOpenAppAfterInstallCompletes != objc_msgSend(v4, "shouldOpenAppAfterInstallCompletes"))
    goto LABEL_11;
  identifierType = self->_identifierType;
  if (identifierType != objc_msgSend(v4, "identifierType"))
    goto LABEL_11;
  uniqueId = self->_uniqueId;
  v16 = uniqueId == objc_msgSend(v4, "uniqueId");
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  if (self->_shouldOpenAppAfterInstallCompletes)
    v4 = 2654435761;
  else
    v4 = 0;
  return v4 ^ v3 ^ (2654435761 * self->_identifierType) ^ (2654435761u * self->_uniqueId);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_identifier)
  {
    -[_SFPBStoreButtonItem identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  if (self->_identifierType)
  {
    v6 = -[_SFPBStoreButtonItem identifierType](self, "identifierType");
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v7 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identifierType"));

  }
  if (self->_shouldOpenAppAfterInstallCompletes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("shouldOpenAppAfterInstallCompletes"));

  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBStoreButtonItem uniqueId](self, "uniqueId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("uniqueId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBStoreButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBStoreButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBStoreButtonItem *v5;
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
    self = -[_SFPBStoreButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBStoreButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBStoreButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBStoreButtonItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBStoreButtonItem;
  v5 = -[_SFPBStoreButtonItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBStoreButtonItem setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldOpenAppAfterInstallCompletes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifierType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBStoreButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v10, "unsignedLongLongValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)shouldOpenAppAfterInstallCompletes
{
  return self->_shouldOpenAppAfterInstallCompletes;
}

- (int)identifierType
{
  return self->_identifierType;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
