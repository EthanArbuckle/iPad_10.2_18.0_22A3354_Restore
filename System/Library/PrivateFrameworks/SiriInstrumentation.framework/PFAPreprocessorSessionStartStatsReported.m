@implementation PFAPreprocessorSessionStartStatsReported

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
  v12.super_class = (Class)PFAPreprocessorSessionStartStatsReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PFAPreprocessorSessionStartStatsReported deleteClockIdentifier](self, "deleteClockIdentifier");
  -[PFAPreprocessorSessionStartStatsReported anyEventTypeStatistics](self, "anyEventTypeStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAPreprocessorSessionStartStatsReported setAnyEventTypeStatistics:](self, "setAnyEventTypeStatistics:", v10);

  return v5;
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (void)deleteClockIdentifier
{
  -[PFAPreprocessorSessionStartStatsReported setClockIdentifier:](self, "setClockIdentifier:", 0);
}

- (void)setMessageCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageCount = a3;
}

- (BOOL)hasMessageCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMessageCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMessageCount
{
  -[PFAPreprocessorSessionStartStatsReported setMessageCount:](self, "setMessageCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearAnyEventTypeStatistics
{
  -[NSArray removeAllObjects](self->_anyEventTypeStatistics, "removeAllObjects");
}

- (void)addAnyEventTypeStatistics:(id)a3
{
  id v4;
  NSArray *anyEventTypeStatistics;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  anyEventTypeStatistics = self->_anyEventTypeStatistics;
  v8 = v4;
  if (!anyEventTypeStatistics)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_anyEventTypeStatistics;
    self->_anyEventTypeStatistics = v6;

    v4 = v8;
    anyEventTypeStatistics = self->_anyEventTypeStatistics;
  }
  -[NSArray addObject:](anyEventTypeStatistics, "addObject:", v4);

}

- (unint64_t)anyEventTypeStatisticsCount
{
  return -[NSArray count](self->_anyEventTypeStatistics, "count");
}

- (id)anyEventTypeStatisticsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_anyEventTypeStatistics, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorSessionStartStatsReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_anyEventTypeStatistics;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int messageCount;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clockIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    messageCount = self->_messageCount;
    if (messageCount != objc_msgSend(v4, "messageCount"))
      goto LABEL_15;
  }
  -[PFAPreprocessorSessionStartStatsReported anyEventTypeStatistics](self, "anyEventTypeStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyEventTypeStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PFAPreprocessorSessionStartStatsReported anyEventTypeStatistics](self, "anyEventTypeStatistics");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[PFAPreprocessorSessionStartStatsReported anyEventTypeStatistics](self, "anyEventTypeStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyEventTypeStatistics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_clockIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_messageCount;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_anyEventTypeStatistics, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_anyEventTypeStatistics, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_anyEventTypeStatistics;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("anyEventTypeStatistics"));
  }
  if (self->_clockIdentifier)
  {
    -[PFAPreprocessorSessionStartStatsReported clockIdentifier](self, "clockIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("clockIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("clockIdentifier"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAPreprocessorSessionStartStatsReported messageCount](self, "messageCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("messageCount"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAPreprocessorSessionStartStatsReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAPreprocessorSessionStartStatsReported)initWithJSON:(id)a3
{
  void *v4;
  PFAPreprocessorSessionStartStatsReported *v5;
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
    self = -[PFAPreprocessorSessionStartStatsReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAPreprocessorSessionStartStatsReported)initWithDictionary:(id)a3
{
  id v4;
  PFAPreprocessorSessionStartStatsReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PFAAnyEventTypeStatistics *v16;
  PFAPreprocessorSessionStartStatsReported *v17;
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
  v24.super_class = (Class)PFAPreprocessorSessionStartStatsReported;
  v5 = -[PFAPreprocessorSessionStartStatsReported init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PFAPreprocessorSessionStartStatsReported setClockIdentifier:](v5, "setClockIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPreprocessorSessionStartStatsReported setMessageCount:](v5, "setMessageCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anyEventTypeStatistics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[PFAAnyEventTypeStatistics initWithDictionary:]([PFAAnyEventTypeStatistics alloc], "initWithDictionary:", v15);
              -[PFAPreprocessorSessionStartStatsReported addAnyEventTypeStatistics:](v5, "addAnyEventTypeStatistics:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v8 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clockIdentifier, a3);
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (NSArray)anyEventTypeStatistics
{
  return self->_anyEventTypeStatistics;
}

- (void)setAnyEventTypeStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyEventTypeStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

@end
