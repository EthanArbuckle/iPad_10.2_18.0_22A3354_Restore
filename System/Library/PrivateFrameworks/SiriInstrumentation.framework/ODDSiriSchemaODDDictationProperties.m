@implementation ODDSiriSchemaODDDictationProperties

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDDictationProperties;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDDictationProperties enabledDictationLocales](self, "enabledDictationLocales", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ODDSiriSchemaODDDictationProperties setEnabledDictationLocales:](self, "setEnabledDictationLocales:", v7);
  return v5;
}

- (void)setIsDictationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) |= 1u;
  self->_isDictationEnabled = a3;
}

- (BOOL)hasIsDictationEnabled
{
  return *(&self->_isAutoPunctuationEnabled + 1);
}

- (void)setHasIsDictationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) = *(&self->_isAutoPunctuationEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsDictationEnabled
{
  -[ODDSiriSchemaODDDictationProperties setIsDictationEnabled:](self, "setIsDictationEnabled:", 0);
  *(&self->_isAutoPunctuationEnabled + 1) &= ~1u;
}

- (void)clearEnabledDictationLocales
{
  -[NSArray removeAllObjects](self->_enabledDictationLocales, "removeAllObjects");
}

- (void)addEnabledDictationLocales:(id)a3
{
  id v4;
  NSArray *enabledDictationLocales;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  enabledDictationLocales = self->_enabledDictationLocales;
  v8 = v4;
  if (!enabledDictationLocales)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_enabledDictationLocales;
    self->_enabledDictationLocales = v6;

    v4 = v8;
    enabledDictationLocales = self->_enabledDictationLocales;
  }
  -[NSArray addObject:](enabledDictationLocales, "addObject:", v4);

}

- (unint64_t)enabledDictationLocalesCount
{
  return -[NSArray count](self->_enabledDictationLocales, "count");
}

- (id)enabledDictationLocalesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_enabledDictationLocales, "objectAtIndexedSubscript:", a3);
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) |= 2u;
  self->_isAutoPunctuationEnabled = a3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*((unsigned __int8 *)&self->_isAutoPunctuationEnabled + 1) >> 1) & 1;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAutoPunctuationEnabled + 1) = *(&self->_isAutoPunctuationEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsAutoPunctuationEnabled
{
  -[ODDSiriSchemaODDDictationProperties setIsAutoPunctuationEnabled:](self, "setIsAutoPunctuationEnabled:", 0);
  *(&self->_isAutoPunctuationEnabled + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*(&self->_isAutoPunctuationEnabled + 1))
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_enabledDictationLocales;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(&self->_isAutoPunctuationEnabled + 1) & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isDictationEnabled;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int isAutoPunctuationEnabled;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if (*(&self->_isAutoPunctuationEnabled + 1) != (v4[25] & 1))
    goto LABEL_15;
  if (*(&self->_isAutoPunctuationEnabled + 1))
  {
    isDictationEnabled = self->_isDictationEnabled;
    if (isDictationEnabled != objc_msgSend(v4, "isDictationEnabled"))
      goto LABEL_15;
  }
  -[ODDSiriSchemaODDDictationProperties enabledDictationLocales](self, "enabledDictationLocales");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDictationLocales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[ODDSiriSchemaODDDictationProperties enabledDictationLocales](self, "enabledDictationLocales");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[ODDSiriSchemaODDDictationProperties enabledDictationLocales](self, "enabledDictationLocales");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledDictationLocales");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*((unsigned __int8 *)&self->_isAutoPunctuationEnabled + 1) >> 1) & 1;
  if (v14 != ((v4[25] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    isAutoPunctuationEnabled = self->_isAutoPunctuationEnabled;
    if (isAutoPunctuationEnabled != objc_msgSend(v4, "isAutoPunctuationEnabled"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(&self->_isAutoPunctuationEnabled + 1))
    v3 = 2654435761 * self->_isDictationEnabled;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_enabledDictationLocales, "hash");
  if ((*(&self->_isAutoPunctuationEnabled + 1) & 2) != 0)
    v5 = 2654435761 * self->_isAutoPunctuationEnabled;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_enabledDictationLocales, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_enabledDictationLocales;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("enabledDictationLocales"));
  }
  v12 = *(&self->_isAutoPunctuationEnabled + 1);
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDDictationProperties isAutoPunctuationEnabled](self, "isAutoPunctuationEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isAutoPunctuationEnabled"));

    v12 = *(&self->_isAutoPunctuationEnabled + 1);
  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDDictationProperties isDictationEnabled](self, "isDictationEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isDictationEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDDictationProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDDictationProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDDictationProperties *v5;
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
    self = -[ODDSiriSchemaODDDictationProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDDictationProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDDictationProperties *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SISchemaLocaleIdentifier *v14;
  void *v15;
  ODDSiriSchemaODDDictationProperties *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ODDSiriSchemaODDDictationProperties;
  v5 = -[ODDSiriSchemaODDDictationProperties init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDictationEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDictationProperties setIsDictationEnabled:](v5, "setIsDictationEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabledDictationLocales"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v13);
              -[ODDSiriSchemaODDDictationProperties addEnabledDictationLocales:](v5, "addEnabledDictationLocales:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      v6 = v18;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoPunctuationEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDictationProperties setIsAutoPunctuationEnabled:](v5, "setIsAutoPunctuationEnabled:", objc_msgSend(v15, "BOOLValue"));
    v16 = v5;

  }
  return v5;
}

- (BOOL)isDictationEnabled
{
  return self->_isDictationEnabled;
}

- (NSArray)enabledDictationLocales
{
  return self->_enabledDictationLocales;
}

- (void)setEnabledDictationLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledDictationLocales, 0);
}

@end
