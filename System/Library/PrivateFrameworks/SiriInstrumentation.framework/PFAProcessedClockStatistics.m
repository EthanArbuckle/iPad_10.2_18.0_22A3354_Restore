@implementation PFAProcessedClockStatistics

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
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFAProcessedClockStatistics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v14, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PFAProcessedClockStatistics deleteClockIdentifier](self, "deleteClockIdentifier");
  -[PFAProcessedClockStatistics publishedEventStatistics](self, "publishedEventStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAProcessedClockStatistics setPublishedEventStatistics:](self, "setPublishedEventStatistics:", v10);

  -[PFAProcessedClockStatistics redactedEventStatistics](self, "redactedEventStatistics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAProcessedClockStatistics setRedactedEventStatistics:](self, "setRedactedEventStatistics:", v12);

  return v5;
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (void)deleteClockIdentifier
{
  -[PFAProcessedClockStatistics setClockIdentifier:](self, "setClockIdentifier:", 0);
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
  -[PFAProcessedClockStatistics setMessageCount:](self, "setMessageCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearPublishedEventStatistics
{
  -[NSArray removeAllObjects](self->_publishedEventStatistics, "removeAllObjects");
}

- (void)addPublishedEventStatistics:(id)a3
{
  id v4;
  NSArray *publishedEventStatistics;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  publishedEventStatistics = self->_publishedEventStatistics;
  v8 = v4;
  if (!publishedEventStatistics)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_publishedEventStatistics;
    self->_publishedEventStatistics = v6;

    v4 = v8;
    publishedEventStatistics = self->_publishedEventStatistics;
  }
  -[NSArray addObject:](publishedEventStatistics, "addObject:", v4);

}

- (unint64_t)publishedEventStatisticsCount
{
  return -[NSArray count](self->_publishedEventStatistics, "count");
}

- (id)publishedEventStatisticsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_publishedEventStatistics, "objectAtIndexedSubscript:", a3);
}

- (void)clearRedactedEventStatistics
{
  -[NSArray removeAllObjects](self->_redactedEventStatistics, "removeAllObjects");
}

- (void)addRedactedEventStatistics:(id)a3
{
  id v4;
  NSArray *redactedEventStatistics;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  redactedEventStatistics = self->_redactedEventStatistics;
  v8 = v4;
  if (!redactedEventStatistics)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_redactedEventStatistics;
    self->_redactedEventStatistics = v6;

    v4 = v8;
    redactedEventStatistics = self->_redactedEventStatistics;
  }
  -[NSArray addObject:](redactedEventStatistics, "addObject:", v4);

}

- (unint64_t)redactedEventStatisticsCount
{
  return -[NSArray count](self->_redactedEventStatistics, "count");
}

- (id)redactedEventStatisticsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_redactedEventStatistics, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PFAProcessedClockStatisticsReadFrom(self, (uint64_t)a3);
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_publishedEventStatistics;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_redactedEventStatistics;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clockIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    messageCount = self->_messageCount;
    if (messageCount != objc_msgSend(v4, "messageCount"))
      goto LABEL_20;
  }
  -[PFAProcessedClockStatistics publishedEventStatistics](self, "publishedEventStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishedEventStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PFAProcessedClockStatistics publishedEventStatistics](self, "publishedEventStatistics");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PFAProcessedClockStatistics publishedEventStatistics](self, "publishedEventStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publishedEventStatistics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[PFAProcessedClockStatistics redactedEventStatistics](self, "redactedEventStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedEventStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PFAProcessedClockStatistics redactedEventStatistics](self, "redactedEventStatistics");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[PFAProcessedClockStatistics redactedEventStatistics](self, "redactedEventStatistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redactedEventStatistics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_clockIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_messageCount;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSArray hash](self->_publishedEventStatistics, "hash");
  return v5 ^ v6 ^ -[NSArray hash](self->_redactedEventStatistics, "hash");
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
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clockIdentifier)
  {
    -[PFAProcessedClockStatistics clockIdentifier](self, "clockIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clockIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clockIdentifier"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAProcessedClockStatistics messageCount](self, "messageCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("messageCount"));

  }
  if (-[NSArray count](self->_publishedEventStatistics, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = self->_publishedEventStatistics;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
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
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("publishedEventStatistics"));
  }
  if (-[NSArray count](self->_redactedEventStatistics, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = self->_redactedEventStatistics;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("redactedEventStatistics"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v25);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAProcessedClockStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAProcessedClockStatistics)initWithJSON:(id)a3
{
  void *v4;
  PFAProcessedClockStatistics *v5;
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
    self = -[PFAProcessedClockStatistics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAProcessedClockStatistics)initWithDictionary:(id)a3
{
  id v4;
  PFAProcessedClockStatistics *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PFAAnyEventTypeStatistics *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PFAAnyEventTypeStatistics *v24;
  PFAProcessedClockStatistics *v25;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PFAProcessedClockStatistics;
  v5 = -[PFAProcessedClockStatistics init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PFAProcessedClockStatistics setClockIdentifier:](v5, "setClockIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAProcessedClockStatistics setMessageCount:](v5, "setMessageCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publishedEventStatistics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v9;
    v29 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v35;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[PFAAnyEventTypeStatistics initWithDictionary:]([PFAAnyEventTypeStatistics alloc], "initWithDictionary:", v15);
              -[PFAProcessedClockStatistics addPublishedEventStatistics:](v5, "addPublishedEventStatistics:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v12);
      }

      v9 = v28;
      v8 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactedEventStatistics"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[PFAAnyEventTypeStatistics initWithDictionary:]([PFAAnyEventTypeStatistics alloc], "initWithDictionary:", v23);
              -[PFAProcessedClockStatistics addRedactedEventStatistics:](v5, "addRedactedEventStatistics:", v24);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v20);
      }

      v6 = v27;
      v9 = v28;
      v8 = v29;
    }
    v25 = v5;

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

- (NSArray)publishedEventStatistics
{
  return self->_publishedEventStatistics;
}

- (void)setPublishedEventStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)redactedEventStatistics
{
  return self->_redactedEventStatistics;
}

- (void)setRedactedEventStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedEventStatistics, 0);
  objc_storeStrong((id *)&self->_publishedEventStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

@end
