@implementation INFERENCESchemaINFERENCEDisambiguationPromptContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearAnonymizedEntitiesPresented
{
  -[NSArray removeAllObjects](self->_anonymizedEntitiesPresenteds, "removeAllObjects");
}

- (void)addAnonymizedEntitiesPresented:(id)a3
{
  id v4;
  NSArray *anonymizedEntitiesPresenteds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  anonymizedEntitiesPresenteds = self->_anonymizedEntitiesPresenteds;
  v8 = v4;
  if (!anonymizedEntitiesPresenteds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_anonymizedEntitiesPresenteds;
    self->_anonymizedEntitiesPresenteds = v6;

    v4 = v8;
    anonymizedEntitiesPresenteds = self->_anonymizedEntitiesPresenteds;
  }
  -[NSArray addObject:](anonymizedEntitiesPresenteds, "addObject:", v4);

}

- (unint64_t)anonymizedEntitiesPresentedCount
{
  return -[NSArray count](self->_anonymizedEntitiesPresenteds, "count");
}

- (id)anonymizedEntitiesPresentedAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_anonymizedEntitiesPresenteds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAnonymizedEntitySelected
{
  return self->_anonymizedEntitySelected != 0;
}

- (void)deleteAnonymizedEntitySelected
{
  -[INFERENCESchemaINFERENCEDisambiguationPromptContext setAnonymizedEntitySelected:](self, "setAnonymizedEntitySelected:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEDisambiguationPromptContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_anonymizedEntitiesPresenteds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitySelected](self, "anonymizedEntitySelected", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitiesPresenteds](self, "anonymizedEntitiesPresenteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedEntitiesPresenteds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitiesPresenteds](self, "anonymizedEntitiesPresenteds");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitiesPresenteds](self, "anonymizedEntitiesPresenteds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedEntitiesPresenteds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitySelected](self, "anonymizedEntitySelected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedEntitySelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitySelected](self, "anonymizedEntitySelected");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitySelected](self, "anonymizedEntitySelected");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedEntitySelected");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_anonymizedEntitiesPresenteds, "hash");
  return -[NSString hash](self->_anonymizedEntitySelected, "hash") ^ v3;
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
  if (self->_anonymizedEntitiesPresenteds)
  {
    -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitiesPresenteds](self, "anonymizedEntitiesPresenteds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedEntitiesPresented"));

  }
  if (self->_anonymizedEntitySelected)
  {
    -[INFERENCESchemaINFERENCEDisambiguationPromptContext anonymizedEntitySelected](self, "anonymizedEntitySelected");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("anonymizedEntitySelected"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEDisambiguationPromptContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *v5;
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
    self = -[INFERENCESchemaINFERENCEDisambiguationPromptContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *v16;
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
  v22.super_class = (Class)INFERENCESchemaINFERENCEDisambiguationPromptContext;
  v5 = -[INFERENCESchemaINFERENCEDisambiguationPromptContext init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedEntitiesPresented"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v18);
              -[INFERENCESchemaINFERENCEDisambiguationPromptContext addAnonymizedEntitiesPresented:](v5, "addAnonymizedEntitiesPresented:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedEntitySelected"), (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[INFERENCESchemaINFERENCEDisambiguationPromptContext setAnonymizedEntitySelected:](v5, "setAnonymizedEntitySelected:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (NSArray)anonymizedEntitiesPresenteds
{
  return self->_anonymizedEntitiesPresenteds;
}

- (void)setAnonymizedEntitiesPresenteds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)anonymizedEntitySelected
{
  return self->_anonymizedEntitySelected;
}

- (void)setAnonymizedEntitySelected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasAnonymizedEntitySelected:(BOOL)a3
{
  self->_hasAnonymizedEntitySelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedEntitySelected, 0);
  objc_storeStrong((id *)&self->_anonymizedEntitiesPresenteds, 0);
}

@end
