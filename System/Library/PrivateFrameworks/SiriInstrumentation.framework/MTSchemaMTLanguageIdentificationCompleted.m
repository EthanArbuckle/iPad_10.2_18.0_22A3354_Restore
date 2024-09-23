@implementation MTSchemaMTLanguageIdentificationCompleted

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
  v9.super_class = (Class)MTSchemaMTLanguageIdentificationCompleted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTLanguageIdentificationCompleted lidConfidences](self, "lidConfidences", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTSchemaMTLanguageIdentificationCompleted setLidConfidences:](self, "setLidConfidences:", v7);
  return v5;
}

- (void)setInputSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inputSource = a3;
}

- (BOOL)hasInputSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInputSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInputSource
{
  -[MTSchemaMTLanguageIdentificationCompleted setInputSource:](self, "setInputSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTopLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_topLocale = a3;
}

- (BOOL)hasTopLocale
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTopLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTopLocale
{
  -[MTSchemaMTLanguageIdentificationCompleted setTopLocale:](self, "setTopLocale:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearLidConfidence
{
  -[NSArray removeAllObjects](self->_lidConfidences, "removeAllObjects");
}

- (void)addLidConfidence:(id)a3
{
  id v4;
  NSArray *lidConfidences;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  lidConfidences = self->_lidConfidences;
  v8 = v4;
  if (!lidConfidences)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_lidConfidences;
    self->_lidConfidences = v6;

    v4 = v8;
    lidConfidences = self->_lidConfidences;
  }
  -[NSArray addObject:](lidConfidences, "addObject:", v4);

}

- (unint64_t)lidConfidenceCount
{
  return -[NSArray count](self->_lidConfidences, "count");
}

- (id)lidConfidenceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_lidConfidences, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTLanguageIdentificationCompletedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_lidConfidences;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $C5EDA01EFA766C22BB8EDC829DA6867A has;
  unsigned int v6;
  int inputSource;
  int v8;
  int topLocale;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    inputSource = self->_inputSource;
    if (inputSource != objc_msgSend(v4, "inputSource"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (topLocale = self->_topLocale, topLocale == objc_msgSend(v4, "topLocale")))
    {
      -[MTSchemaMTLanguageIdentificationCompleted lidConfidences](self, "lidConfidences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lidConfidences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[MTSchemaMTLanguageIdentificationCompleted lidConfidences](self, "lidConfidences");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[MTSchemaMTLanguageIdentificationCompleted lidConfidences](self, "lidConfidences");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lidConfidences");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_inputSource;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSArray hash](self->_lidConfidences, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_topLocale;
  return v3 ^ v2 ^ -[NSArray hash](self->_lidConfidences, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[MTSchemaMTLanguageIdentificationCompleted inputSource](self, "inputSource") - 1;
    if (v4 > 3)
      v5 = CFSTR("MTINPUTSOURCE_UNKNOWN");
    else
      v5 = off_1E563CB08[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("inputSource"));
  }
  if (-[NSArray count](self->_lidConfidences, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_lidConfidences;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lidConfidence"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v14 = -[MTSchemaMTLanguageIdentificationCompleted topLocale](self, "topLocale") - 1;
    if (v14 > 0x3D)
      v15 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v15 = off_1E563CB28[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("topLocale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTLanguageIdentificationCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTLanguageIdentificationCompleted)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTLanguageIdentificationCompleted *v5;
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
    self = -[MTSchemaMTLanguageIdentificationCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTLanguageIdentificationCompleted)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTLanguageIdentificationCompleted *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTSchemaMTLanguageIdentificationConfidence *v15;
  MTSchemaMTLanguageIdentificationCompleted *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MTSchemaMTLanguageIdentificationCompleted;
  v5 = -[MTSchemaMTLanguageIdentificationCompleted init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTLanguageIdentificationCompleted setInputSource:](v5, "setInputSource:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTLanguageIdentificationCompleted setTopLocale:](v5, "setTopLocale:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lidConfidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      v19 = v6;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[MTSchemaMTLanguageIdentificationConfidence initWithDictionary:]([MTSchemaMTLanguageIdentificationConfidence alloc], "initWithDictionary:", v14);
              -[MTSchemaMTLanguageIdentificationCompleted addLidConfidence:](v5, "addLidConfidence:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;

  }
  return v5;
}

- (int)inputSource
{
  return self->_inputSource;
}

- (int)topLocale
{
  return self->_topLocale;
}

- (NSArray)lidConfidences
{
  return self->_lidConfidences;
}

- (void)setLidConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lidConfidences, 0);
}

@end
