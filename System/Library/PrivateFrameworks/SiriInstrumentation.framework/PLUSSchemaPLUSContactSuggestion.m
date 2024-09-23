@implementation PLUSSchemaPLUSContactSuggestion

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
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggestion;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSContactSuggestion deleteSuggestionId](self, "deleteSuggestionId");
  -[PLUSSchemaPLUSContactSuggestion contributingGroundTruths](self, "contributingGroundTruths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggestion setContributingGroundTruths:](self, "setContributingGroundTruths:", v10);

  return v5;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[PLUSSchemaPLUSContactSuggestion setSuggestionId:](self, "setSuggestionId:", 0);
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSource
{
  -[PLUSSchemaPLUSContactSuggestion setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConfidence
{
  -[PLUSSchemaPLUSContactSuggestion setConfidence:](self, "setConfidence:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearContributingGroundTruth
{
  -[NSArray removeAllObjects](self->_contributingGroundTruths, "removeAllObjects");
}

- (void)addContributingGroundTruth:(id)a3
{
  id v4;
  NSArray *contributingGroundTruths;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contributingGroundTruths = self->_contributingGroundTruths;
  v8 = v4;
  if (!contributingGroundTruths)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contributingGroundTruths;
    self->_contributingGroundTruths = v6;

    v4 = v8;
    contributingGroundTruths = self->_contributingGroundTruths;
  }
  -[NSArray addObject:](contributingGroundTruths, "addObject:", v4);

}

- (unint64_t)contributingGroundTruthCount
{
  return -[NSArray count](self->_contributingGroundTruths, "count");
}

- (id)contributingGroundTruthAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contributingGroundTruths, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_contributingGroundTruths;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $90470D085CA6FB62232A2BC1221F8C73 has;
  unsigned int v13;
  int source;
  int v15;
  double confidence;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    source = self->_source;
    if (source != objc_msgSend(v4, "source"))
      goto LABEL_19;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v15)
  {
    confidence = self->_confidence;
    objc_msgSend(v4, "confidence");
    if (confidence != v17)
      goto LABEL_19;
  }
  -[PLUSSchemaPLUSContactSuggestion contributingGroundTruths](self, "contributingGroundTruths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contributingGroundTruths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[PLUSSchemaPLUSContactSuggestion contributingGroundTruths](self, "contributingGroundTruths");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_22:
    v23 = 1;
    goto LABEL_20;
  }
  v19 = (void *)v18;
  -[PLUSSchemaPLUSContactSuggestion contributingGroundTruths](self, "contributingGroundTruths");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contributingGroundTruths");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v23 = 0;
LABEL_20:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double confidence;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[SISchemaUUID hash](self->_suggestionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_source;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[NSArray hash](self->_contributingGroundTruths, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  confidence = self->_confidence;
  v6 = -confidence;
  if (confidence >= 0.0)
    v6 = self->_confidence;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ -[NSArray hash](self->_contributingGroundTruths, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[PLUSSchemaPLUSContactSuggestion confidence](self, "confidence");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confidence"));

  }
  if (-[NSArray count](self->_contributingGroundTruths, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_contributingGroundTruths;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation");
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contributingGroundTruth"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (-[PLUSSchemaPLUSContactSuggestion source](self, "source") == 1)
      v14 = CFSTR("PLUSCONTACTSUGGESTIONSOURCE_PLUS_INFERRED_CONTACT_SUGGESTER");
    else
      v14 = CFSTR("PLUSCONTACTSUGGESTIONSOURCE_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("source"));
  }
  if (self->_suggestionId)
  {
    -[PLUSSchemaPLUSContactSuggestion suggestionId](self, "suggestionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("suggestionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("suggestionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggestion)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggestion *v5;
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
    self = -[PLUSSchemaPLUSContactSuggestion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggestion)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggestion *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  PLUSSchemaPLUSContactGroundTruthSourceSummary *v17;
  PLUSSchemaPLUSContactSuggestion *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLUSSchemaPLUSContactSuggestion;
  v5 = -[PLUSSchemaPLUSContactSuggestion init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactSuggestion setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestion setSource:](v5, "setSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[PLUSSchemaPLUSContactSuggestion setConfidence:](v5, "setConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contributingGroundTruth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v9;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[PLUSSchemaPLUSContactGroundTruthSourceSummary initWithDictionary:]([PLUSSchemaPLUSContactGroundTruthSourceSummary alloc], "initWithDictionary:", v16);
              -[PLUSSchemaPLUSContactSuggestion addContributingGroundTruth:](v5, "addContributingGroundTruth:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v6 = v21;
      v9 = v20;
    }
    v18 = v5;

  }
  return v5;
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionId, a3);
}

- (int)source
{
  return self->_source;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)contributingGroundTruths
{
  return self->_contributingGroundTruths;
}

- (void)setContributingGroundTruths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributingGroundTruths, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
