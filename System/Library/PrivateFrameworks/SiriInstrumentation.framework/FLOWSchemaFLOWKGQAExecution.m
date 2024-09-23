@implementation FLOWSchemaFLOWKGQAExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setKgQAUsecase:(int)a3
{
  *(&self->_isWebExtractedFact + 1) |= 1u;
  self->_kgQAUsecase = a3;
}

- (BOOL)hasKgQAUsecase
{
  return *(&self->_isWebExtractedFact + 1);
}

- (void)setHasKgQAUsecase:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFE | a3;
}

- (void)deleteKgQAUsecase
{
  -[FLOWSchemaFLOWKGQAExecution setKgQAUsecase:](self, "setKgQAUsecase:", 0);
  *(&self->_isWebExtractedFact + 1) &= ~1u;
}

- (void)clearAttributes
{
  -[NSArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttributes:(id)a3
{
  id v4;
  NSArray *attributes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  attributes = self->_attributes;
  v8 = v4;
  if (!attributes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attributes;
    self->_attributes = v6;

    v4 = v8;
    attributes = self->_attributes;
  }
  -[NSArray addObject:](attributes, "addObject:", v4);

}

- (unint64_t)attributesCount
{
  return -[NSArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_attributes, "objectAtIndexedSubscript:", a3);
}

- (void)setIsDisputedResponse:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) |= 2u;
  self->_isDisputedResponse = a3;
}

- (BOOL)hasIsDisputedResponse
{
  return (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 1) & 1;
}

- (void)setHasIsDisputedResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFD | v3;
}

- (void)deleteIsDisputedResponse
{
  -[FLOWSchemaFLOWKGQAExecution setIsDisputedResponse:](self, "setIsDisputedResponse:", 0);
  *(&self->_isWebExtractedFact + 1) &= ~2u;
}

- (BOOL)hasNlgKey
{
  return self->_nlgKey != 0;
}

- (void)deleteNlgKey
{
  -[FLOWSchemaFLOWKGQAExecution setNlgKey:](self, "setNlgKey:", 0);
}

- (void)setIsWebExtractedFact:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 1) |= 4u;
  self->_isWebExtractedFact = a3;
}

- (BOOL)hasIsWebExtractedFact
{
  return (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 2) & 1;
}

- (void)setHasIsWebExtractedFact:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isWebExtractedFact + 1) = *(&self->_isWebExtractedFact + 1) & 0xFB | v3;
}

- (void)deleteIsWebExtractedFact
{
  -[FLOWSchemaFLOWKGQAExecution setIsWebExtractedFact:](self, "setIsWebExtractedFact:", 0);
  *(&self->_isWebExtractedFact + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWKGQAExecutionReadFrom(self, (uint64_t)a3);
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
  if (*(&self->_isWebExtractedFact + 1))
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_attributes;
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

  if ((*(&self->_isWebExtractedFact + 1) & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[FLOWSchemaFLOWKGQAExecution nlgKey](self, "nlgKey", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  if ((*(&self->_isWebExtractedFact + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int kgQAUsecase;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int isDisputedResponse;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v22;
  int isWebExtractedFact;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if (*(&self->_isWebExtractedFact + 1) != (v4[41] & 1))
    goto LABEL_18;
  if (*(&self->_isWebExtractedFact + 1))
  {
    kgQAUsecase = self->_kgQAUsecase;
    if (kgQAUsecase != objc_msgSend(v4, "kgQAUsecase"))
      goto LABEL_18;
  }
  -[FLOWSchemaFLOWKGQAExecution attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[FLOWSchemaFLOWKGQAExecution attributes](self, "attributes");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWKGQAExecution attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 1) & 1;
  if (v13 != ((v4[41] >> 1) & 1))
    goto LABEL_18;
  if (v13)
  {
    isDisputedResponse = self->_isDisputedResponse;
    if (isDisputedResponse != objc_msgSend(v4, "isDisputedResponse"))
      goto LABEL_18;
  }
  -[FLOWSchemaFLOWKGQAExecution nlgKey](self, "nlgKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlgKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[FLOWSchemaFLOWKGQAExecution nlgKey](self, "nlgKey");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[FLOWSchemaFLOWKGQAExecution nlgKey](self, "nlgKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlgKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_18;
  }
  else
  {

  }
  v22 = (*((unsigned __int8 *)&self->_isWebExtractedFact + 1) >> 2) & 1;
  if (v22 == ((v4[41] >> 2) & 1))
  {
    if (!v22
      || (isWebExtractedFact = self->_isWebExtractedFact,
          isWebExtractedFact == objc_msgSend(v4, "isWebExtractedFact")))
    {
      v20 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  if (*(&self->_isWebExtractedFact + 1))
    v3 = 2654435761 * self->_kgQAUsecase;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_attributes, "hash");
  if ((*(&self->_isWebExtractedFact + 1) & 2) != 0)
    v5 = 2654435761 * self->_isDisputedResponse;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_nlgKey, "hash");
  if ((*(&self->_isWebExtractedFact + 1) & 4) != 0)
    v7 = 2654435761 * self->_isWebExtractedFact;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_attributes)
  {
    -[FLOWSchemaFLOWKGQAExecution attributes](self, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attributes"));

  }
  v6 = *(&self->_isWebExtractedFact + 1);
  if ((v6 & 2) == 0)
  {
    if ((*(&self->_isWebExtractedFact + 1) & 4) == 0)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWKGQAExecution isWebExtractedFact](self, "isWebExtractedFact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isWebExtractedFact"));

    if (!*(&self->_isWebExtractedFact + 1))
      goto LABEL_13;
LABEL_9:
    v9 = -[FLOWSchemaFLOWKGQAExecution kgQAUsecase](self, "kgQAUsecase") - 1;
    if (v9 > 6)
      v10 = CFSTR("FLOWKGQAUSECASE_UNKNOWN");
    else
      v10 = off_1E562DCA0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("kgQAUsecase"));
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWKGQAExecution isDisputedResponse](self, "isDisputedResponse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isDisputedResponse"));

  v6 = *(&self->_isWebExtractedFact + 1);
  if ((v6 & 4) != 0)
    goto LABEL_8;
LABEL_5:
  if ((v6 & 1) != 0)
    goto LABEL_9;
LABEL_13:
  if (self->_nlgKey)
  {
    -[FLOWSchemaFLOWKGQAExecution nlgKey](self, "nlgKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nlgKey"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWKGQAExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWKGQAExecution)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWKGQAExecution *v5;
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
    self = -[FLOWSchemaFLOWKGQAExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWKGQAExecution)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWKGQAExecution *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FLOWSchemaFLOWKGQAExecution *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWKGQAExecution;
  v5 = -[FLOWSchemaFLOWKGQAExecution init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgQAUsecase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKGQAExecution setKgQAUsecase:](v5, "setKgQAUsecase:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = (void *)objc_msgSend(v13, "copy", (_QWORD)v21);
              -[FLOWSchemaFLOWKGQAExecution addAttributes:](v5, "addAttributes:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v10);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDisputedResponse"), (_QWORD)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKGQAExecution setIsDisputedResponse:](v5, "setIsDisputedResponse:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlgKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[FLOWSchemaFLOWKGQAExecution setNlgKey:](v5, "setNlgKey:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWebExtractedFact"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWKGQAExecution setIsWebExtractedFact:](v5, "setIsWebExtractedFact:", objc_msgSend(v18, "BOOLValue"));
    v19 = v5;

  }
  return v5;
}

- (int)kgQAUsecase
{
  return self->_kgQAUsecase;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isDisputedResponse
{
  return self->_isDisputedResponse;
}

- (NSString)nlgKey
{
  return self->_nlgKey;
}

- (void)setNlgKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isWebExtractedFact
{
  return self->_isWebExtractedFact;
}

- (void)setHasNlgKey:(BOOL)a3
{
  *(&self->_isWebExtractedFact + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlgKey, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
