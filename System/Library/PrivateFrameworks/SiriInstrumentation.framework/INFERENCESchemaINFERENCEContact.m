@implementation INFERENCESchemaINFERENCEContact

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAnonymizedContactIdentifier
{
  return self->_anonymizedContactIdentifier != 0;
}

- (void)deleteAnonymizedContactIdentifier
{
  -[INFERENCESchemaINFERENCEContact setAnonymizedContactIdentifier:](self, "setAnonymizedContactIdentifier:", 0);
}

- (void)clearAnonymizedHandleValues
{
  -[NSArray removeAllObjects](self->_anonymizedHandleValues, "removeAllObjects");
}

- (void)addAnonymizedHandleValues:(id)a3
{
  id v4;
  NSArray *anonymizedHandleValues;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  anonymizedHandleValues = self->_anonymizedHandleValues;
  v8 = v4;
  if (!anonymizedHandleValues)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_anonymizedHandleValues;
    self->_anonymizedHandleValues = v6;

    v4 = v8;
    anonymizedHandleValues = self->_anonymizedHandleValues;
  }
  -[NSArray addObject:](anonymizedHandleValues, "addObject:", v4);

}

- (unint64_t)anonymizedHandleValuesCount
{
  return -[NSArray count](self->_anonymizedHandleValues, "count");
}

- (id)anonymizedHandleValuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_anonymizedHandleValues, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCEContact anonymizedContactIdentifier](self, "anonymizedContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_anonymizedHandleValues;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[INFERENCESchemaINFERENCEContact anonymizedContactIdentifier](self, "anonymizedContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[INFERENCESchemaINFERENCEContact anonymizedContactIdentifier](self, "anonymizedContactIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEContact anonymizedContactIdentifier](self, "anonymizedContactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContact anonymizedHandleValues](self, "anonymizedHandleValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedHandleValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCEContact anonymizedHandleValues](self, "anonymizedHandleValues");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEContact anonymizedHandleValues](self, "anonymizedHandleValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedHandleValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_anonymizedContactIdentifier, "hash");
  return -[NSArray hash](self->_anonymizedHandleValues, "hash") ^ v3;
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
  if (self->_anonymizedContactIdentifier)
  {
    -[INFERENCESchemaINFERENCEContact anonymizedContactIdentifier](self, "anonymizedContactIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedContactIdentifier"));

  }
  if (self->_anonymizedHandleValues)
  {
    -[INFERENCESchemaINFERENCEContact anonymizedHandleValues](self, "anonymizedHandleValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("anonymizedHandleValues"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContact dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContact)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContact *v5;
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
    self = -[INFERENCESchemaINFERENCEContact initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContact)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContact *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  INFERENCESchemaINFERENCEContact *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INFERENCESchemaINFERENCEContact;
  v5 = -[INFERENCESchemaINFERENCEContact init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedContactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[INFERENCESchemaINFERENCEContact setAnonymizedContactIdentifier:](v5, "setAnonymizedContactIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedHandleValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy", (_QWORD)v18);
              -[INFERENCESchemaINFERENCEContact addAnonymizedHandleValues:](v5, "addAnonymizedHandleValues:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v11);
      }

    }
    v16 = v5;

  }
  return v5;
}

- (NSString)anonymizedContactIdentifier
{
  return self->_anonymizedContactIdentifier;
}

- (void)setAnonymizedContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)anonymizedHandleValues
{
  return self->_anonymizedHandleValues;
}

- (void)setAnonymizedHandleValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasAnonymizedContactIdentifier:(BOOL)a3
{
  self->_hasAnonymizedContactIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedHandleValues, 0);
  objc_storeStrong((id *)&self->_anonymizedContactIdentifier, 0);
}

@end
