@implementation TTMSchemaTTMOverrideTCUResult

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
  v12.super_class = (Class)TTMSchemaTTMOverrideTCUResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTMSchemaTTMOverrideTCUResult deleteTcuId](self, "deleteTcuId");
  -[TTMSchemaTTMOverrideTCUResult overrideResults](self, "overrideResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMSchemaTTMOverrideTCUResult setOverrideResults:](self, "setOverrideResults:", v10);

  return v5;
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

- (void)deleteTcuId
{
  -[TTMSchemaTTMOverrideTCUResult setTcuId:](self, "setTcuId:", 0);
}

- (void)setRecommendation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recommendation = a3;
}

- (BOOL)hasRecommendation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRecommendation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRecommendation
{
  -[TTMSchemaTTMOverrideTCUResult setRecommendation:](self, "setRecommendation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setOverrideType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_overrideType = a3;
}

- (BOOL)hasOverrideType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOverrideType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteOverrideType
{
  -[TTMSchemaTTMOverrideTCUResult setOverrideType:](self, "setOverrideType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearOverrideResults
{
  -[NSArray removeAllObjects](self->_overrideResults, "removeAllObjects");
}

- (void)addOverrideResults:(id)a3
{
  id v4;
  NSArray *overrideResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  overrideResults = self->_overrideResults;
  v8 = v4;
  if (!overrideResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_overrideResults;
    self->_overrideResults = v6;

    v4 = v8;
    overrideResults = self->_overrideResults;
  }
  -[NSArray addObject:](overrideResults, "addObject:", v4);

}

- (unint64_t)overrideResultsCount
{
  return -[NSArray count](self->_overrideResults, "count");
}

- (id)overrideResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_overrideResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMOverrideTCUResultReadFrom(self, (uint64_t)a3);
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
  -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
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
    PBDataWriterWriteInt32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_overrideResults;
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
  $034A423F62881F9F2DCBC6443011B8FB has;
  unsigned int v13;
  int recommendation;
  int v15;
  int overrideType;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tcuId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tcuId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    recommendation = self->_recommendation;
    if (recommendation != objc_msgSend(v4, "recommendation"))
      goto LABEL_19;
    has = self->_has;
    v13 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v15)
  {
    overrideType = self->_overrideType;
    if (overrideType != objc_msgSend(v4, "overrideType"))
      goto LABEL_19;
  }
  -[TTMSchemaTTMOverrideTCUResult overrideResults](self, "overrideResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[TTMSchemaTTMOverrideTCUResult overrideResults](self, "overrideResults");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

LABEL_22:
    v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  -[TTMSchemaTTMOverrideTCUResult overrideResults](self, "overrideResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_tcuId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_recommendation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_overrideResults, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_overrideType;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_overrideResults, "hash");
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
  char has;
  unsigned int v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_overrideResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_overrideResults;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("overrideResults"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = -[TTMSchemaTTMOverrideTCUResult overrideType](self, "overrideType") - 1;
    if (v13 > 7)
      v14 = CFSTR("TTMOVERRIDETYPE_UNKNOWN");
    else
      v14 = off_1E5639C48[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("overrideType"), (_QWORD)v21);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v15 = -[TTMSchemaTTMOverrideTCUResult recommendation](self, "recommendation") - 1;
    if (v15 > 4)
      v16 = CFSTR("TTMTCUMITIGATIONDECISION_UNKNOWN");
    else
      v16 = off_1E5639C88[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("recommendation"), (_QWORD)v21);
  }
  if (self->_tcuId)
  {
    -[TTMSchemaTTMOverrideTCUResult tcuId](self, "tcuId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tcuId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("tcuId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v21);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTMSchemaTTMOverrideTCUResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTMSchemaTTMOverrideTCUResult)initWithJSON:(id)a3
{
  void *v4;
  TTMSchemaTTMOverrideTCUResult *v5;
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
    self = -[TTMSchemaTTMOverrideTCUResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTMSchemaTTMOverrideTCUResult)initWithDictionary:(id)a3
{
  id v4;
  TTMSchemaTTMOverrideTCUResult *v5;
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
  TTMSchemaTTMOverrideResult *v17;
  TTMSchemaTTMOverrideTCUResult *v18;
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
  v26.super_class = (Class)TTMSchemaTTMOverrideTCUResult;
  v5 = -[TTMSchemaTTMOverrideTCUResult init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tcuId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[TTMSchemaTTMOverrideTCUResult setTcuId:](v5, "setTcuId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTMSchemaTTMOverrideTCUResult setRecommendation:](v5, "setRecommendation:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTMSchemaTTMOverrideTCUResult setOverrideType:](v5, "setOverrideType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideResults"));
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
              v17 = -[TTMSchemaTTMOverrideResult initWithDictionary:]([TTMSchemaTTMOverrideResult alloc], "initWithDictionary:", v16);
              -[TTMSchemaTTMOverrideTCUResult addOverrideResults:](v5, "addOverrideResults:", v17);

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

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (void)setTcuId:(id)a3
{
  objc_storeStrong((id *)&self->_tcuId, a3);
}

- (int)recommendation
{
  return self->_recommendation;
}

- (int)overrideType
{
  return self->_overrideType;
}

- (NSArray)overrideResults
{
  return self->_overrideResults;
}

- (void)setOverrideResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasTcuId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideResults, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
}

@end
