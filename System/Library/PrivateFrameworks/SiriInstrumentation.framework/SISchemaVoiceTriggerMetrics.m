@implementation SISchemaVoiceTriggerMetrics

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
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SISchemaVoiceTriggerMetrics;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaVoiceTriggerMetrics firstPassStatistics](self, "firstPassStatistics", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaVoiceTriggerMetrics setFirstPassStatistics:](self, "setFirstPassStatistics:", v7);

  -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaVoiceTriggerMetrics deleteFirstPassMetadata](self, "deleteFirstPassMetadata");
  return v5;
}

- (void)setImplicitUtterances:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 1u;
  self->_implicitUtterances = a3;
}

- (BOOL)hasImplicitUtterances
{
  return *(&self->_isJSEnabled + 1);
}

- (void)setHasImplicitUtterances:(BOOL)a3
{
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFE | a3;
}

- (void)deleteImplicitUtterances
{
  -[SISchemaVoiceTriggerMetrics setImplicitUtterances:](self, "setImplicitUtterances:", 0);
  *(&self->_isJSEnabled + 1) &= ~1u;
}

- (void)setExplicitUtterances:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 2u;
  self->_explicitUtterances = a3;
}

- (BOOL)hasExplicitUtterances
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 1) & 1;
}

- (void)setHasExplicitUtterances:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFD | v3;
}

- (void)deleteExplicitUtterances
{
  -[SISchemaVoiceTriggerMetrics setExplicitUtterances:](self, "setExplicitUtterances:", 0);
  *(&self->_isJSEnabled + 1) &= ~2u;
}

- (void)setFirstPassTriggers:(int)a3
{
  *(&self->_isJSEnabled + 1) |= 4u;
  self->_firstPassTriggers = a3;
}

- (BOOL)hasFirstPassTriggers
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 2) & 1;
}

- (void)setHasFirstPassTriggers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xFB | v3;
}

- (void)deleteFirstPassTriggers
{
  -[SISchemaVoiceTriggerMetrics setFirstPassTriggers:](self, "setFirstPassTriggers:", 0);
  *(&self->_isJSEnabled + 1) &= ~4u;
}

- (void)clearFirstPassStatistics
{
  -[NSArray removeAllObjects](self->_firstPassStatistics, "removeAllObjects");
}

- (void)addFirstPassStatistics:(id)a3
{
  id v4;
  NSArray *firstPassStatistics;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  firstPassStatistics = self->_firstPassStatistics;
  v8 = v4;
  if (!firstPassStatistics)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_firstPassStatistics;
    self->_firstPassStatistics = v6;

    v4 = v8;
    firstPassStatistics = self->_firstPassStatistics;
  }
  -[NSArray addObject:](firstPassStatistics, "addObject:", v4);

}

- (unint64_t)firstPassStatisticsCount
{
  return -[NSArray count](self->_firstPassStatistics, "count");
}

- (id)firstPassStatisticsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_firstPassStatistics, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasFirstPassMetadata
{
  return self->_firstPassMetadata != 0;
}

- (void)deleteFirstPassMetadata
{
  -[SISchemaVoiceTriggerMetrics setFirstPassMetadata:](self, "setFirstPassMetadata:", 0);
}

- (void)setIsJSEnabled:(BOOL)a3
{
  *(&self->_isJSEnabled + 1) |= 8u;
  self->_isJSEnabled = a3;
}

- (BOOL)hasIsJSEnabled
{
  return (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 3) & 1;
}

- (void)setHasIsJSEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isJSEnabled + 1) = *(&self->_isJSEnabled + 1) & 0xF7 | v3;
}

- (void)deleteIsJSEnabled
{
  -[SISchemaVoiceTriggerMetrics setIsJSEnabled:](self, "setIsJSEnabled:", 0);
  *(&self->_isJSEnabled + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVoiceTriggerMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(&self->_isJSEnabled + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = *(&self->_isJSEnabled + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isJSEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(&self->_isJSEnabled + 1) & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_firstPassStatistics;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_isJSEnabled + 1) & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int implicitUtterances;
  int v8;
  int explicitUtterances;
  int v10;
  int firstPassTriggers;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  int isJSEnabled;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
  v6 = v4[41];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_23;
  if ((v5 & 1) != 0)
  {
    implicitUtterances = self->_implicitUtterances;
    if (implicitUtterances != objc_msgSend(v4, "implicitUtterances"))
      goto LABEL_23;
    v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
    v6 = v4[41];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      explicitUtterances = self->_explicitUtterances;
      if (explicitUtterances != objc_msgSend(v4, "explicitUtterances"))
        goto LABEL_23;
      v5 = *((unsigned __int8 *)&self->_isJSEnabled + 1);
      v6 = v4[41];
    }
    v10 = (v5 >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_23;
    if (v10)
    {
      firstPassTriggers = self->_firstPassTriggers;
      if (firstPassTriggers != objc_msgSend(v4, "firstPassTriggers"))
        goto LABEL_23;
    }
    -[SISchemaVoiceTriggerMetrics firstPassStatistics](self, "firstPassStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstPassStatistics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_22;
    -[SISchemaVoiceTriggerMetrics firstPassStatistics](self, "firstPassStatistics");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[SISchemaVoiceTriggerMetrics firstPassStatistics](self, "firstPassStatistics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstPassStatistics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_23;
    }
    else
    {

    }
    -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstPassMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_22:

      goto LABEL_23;
    }
    -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstPassMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_23;
    }
    else
    {

    }
    v26 = (*((unsigned __int8 *)&self->_isJSEnabled + 1) >> 3) & 1;
    if (v26 == ((v4[41] >> 3) & 1))
    {
      if (!v26 || (isJSEnabled = self->_isJSEnabled, isJSEnabled == objc_msgSend(v4, "isJSEnabled")))
      {
        v24 = 1;
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  v24 = 0;
LABEL_24:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*(&self->_isJSEnabled + 1))
  {
    v3 = 0;
    if ((*(&self->_isJSEnabled + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(&self->_isJSEnabled + 1) & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_implicitUtterances;
  if ((*(&self->_isJSEnabled + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_explicitUtterances;
  if ((*(&self->_isJSEnabled + 1) & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_firstPassTriggers;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSArray hash](self->_firstPassStatistics, "hash");
  v7 = -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata hash](self->_firstPassMetadata, "hash");
  if ((*(&self->_isJSEnabled + 1) & 8) != 0)
    v8 = 2654435761 * self->_isJSEnabled;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(&self->_isJSEnabled + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaVoiceTriggerMetrics explicitUtterances](self, "explicitUtterances"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("explicitUtterances"));

  }
  if (self->_firstPassMetadata)
  {
    -[SISchemaVoiceTriggerMetrics firstPassMetadata](self, "firstPassMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("firstPassMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("firstPassMetadata"));

    }
  }
  if (-[NSArray count](self->_firstPassStatistics, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_firstPassStatistics;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("firstPassStatistics"));
  }
  v16 = *(&self->_isJSEnabled + 1);
  if ((v16 & 4) == 0)
  {
    if (!*(&self->_isJSEnabled + 1))
      goto LABEL_22;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaVoiceTriggerMetrics implicitUtterances](self, "implicitUtterances"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("implicitUtterances"));

    if ((*(&self->_isJSEnabled + 1) & 8) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaVoiceTriggerMetrics firstPassTriggers](self, "firstPassTriggers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("firstPassTriggers"));

  v16 = *(&self->_isJSEnabled + 1);
  if ((v16 & 1) != 0)
    goto LABEL_26;
LABEL_22:
  if ((v16 & 8) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaVoiceTriggerMetrics isJSEnabled](self, "isJSEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isJSEnabled"));

  }
LABEL_24:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaVoiceTriggerMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaVoiceTriggerMetrics)initWithJSON:(id)a3
{
  void *v4;
  SISchemaVoiceTriggerMetrics *v5;
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
    self = -[SISchemaVoiceTriggerMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaVoiceTriggerMetrics)initWithDictionary:(id)a3
{
  id v4;
  SISchemaVoiceTriggerMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  MHSchemaMHVoiceTriggerFirstPassStatistic *v16;
  void *v17;
  MHSchemaMHVoiceTriggerFirstPassDailyMetadata *v18;
  void *v19;
  SISchemaVoiceTriggerMetrics *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SISchemaVoiceTriggerMetrics;
  v5 = -[SISchemaVoiceTriggerMetrics init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("implicitUtterances"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceTriggerMetrics setImplicitUtterances:](v5, "setImplicitUtterances:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("explicitUtterances"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceTriggerMetrics setExplicitUtterances:](v5, "setExplicitUtterances:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceTriggerMetrics setFirstPassTriggers:](v5, "setFirstPassTriggers:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassStatistics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v8;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[MHSchemaMHVoiceTriggerFirstPassStatistic initWithDictionary:]([MHSchemaMHVoiceTriggerFirstPassStatistic alloc], "initWithDictionary:", v15);
              -[SISchemaVoiceTriggerMetrics addFirstPassStatistics:](v5, "addFirstPassStatistics:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v12);
      }

      v6 = v23;
      v8 = v22;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassMetadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata initWithDictionary:]([MHSchemaMHVoiceTriggerFirstPassDailyMetadata alloc], "initWithDictionary:", v17);
      -[SISchemaVoiceTriggerMetrics setFirstPassMetadata:](v5, "setFirstPassMetadata:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isJSEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceTriggerMetrics setIsJSEnabled:](v5, "setIsJSEnabled:", objc_msgSend(v19, "BOOLValue"));
    v20 = v5;

  }
  return v5;
}

- (int)implicitUtterances
{
  return self->_implicitUtterances;
}

- (int)explicitUtterances
{
  return self->_explicitUtterances;
}

- (int)firstPassTriggers
{
  return self->_firstPassTriggers;
}

- (NSArray)firstPassStatistics
{
  return self->_firstPassStatistics;
}

- (void)setFirstPassStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)firstPassMetadata
{
  return self->_firstPassMetadata;
}

- (void)setFirstPassMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassMetadata, a3);
}

- (BOOL)isJSEnabled
{
  return self->_isJSEnabled;
}

- (void)setHasFirstPassMetadata:(BOOL)a3
{
  *(&self->_isJSEnabled + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPassMetadata, 0);
  objc_storeStrong((id *)&self->_firstPassStatistics, 0);
}

@end
