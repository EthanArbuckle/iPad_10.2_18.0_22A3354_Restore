@implementation LRSchemaLRRedactionSummaryReported

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
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LRSchemaLRRedactionSummaryReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRRedactionSummaryReported redactionWindows](self, "redactionWindows", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRRedactionSummaryReported setRedactionWindows:](self, "setRedactionWindows:", v7);

  -[LRSchemaLRRedactionSummaryReported redactionSignals](self, "redactionSignals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRRedactionSummaryReported setRedactionSignals:](self, "setRedactionSignals:", v9);

  -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applySensitiveConditionsPolicy:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v11, "suppressMessage");
  if ((_DWORD)v4)
    -[LRSchemaLRRedactionSummaryReported deletePreProcessorInfo](self, "deletePreProcessorInfo");
  return v5;
}

- (void)setHasRedactedEvents:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasRedactedEvents = a3;
}

- (BOOL)hasHasRedactedEvents
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHasRedactedEvents:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHasRedactedEvents
{
  -[LRSchemaLRRedactionSummaryReported setHasRedactedEvents:](self, "setHasRedactedEvents:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearRedactionWindows
{
  -[NSArray removeAllObjects](self->_redactionWindows, "removeAllObjects");
}

- (void)addRedactionWindows:(id)a3
{
  id v4;
  NSArray *redactionWindows;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  redactionWindows = self->_redactionWindows;
  v8 = v4;
  if (!redactionWindows)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_redactionWindows;
    self->_redactionWindows = v6;

    v4 = v8;
    redactionWindows = self->_redactionWindows;
  }
  -[NSArray addObject:](redactionWindows, "addObject:", v4);

}

- (unint64_t)redactionWindowsCount
{
  return -[NSArray count](self->_redactionWindows, "count");
}

- (id)redactionWindowsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_redactionWindows, "objectAtIndexedSubscript:", a3);
}

- (void)clearRedactionSignals
{
  -[NSArray removeAllObjects](self->_redactionSignals, "removeAllObjects");
}

- (void)addRedactionSignals:(id)a3
{
  id v4;
  NSArray *redactionSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  redactionSignals = self->_redactionSignals;
  v8 = v4;
  if (!redactionSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_redactionSignals;
    self->_redactionSignals = v6;

    v4 = v8;
    redactionSignals = self->_redactionSignals;
  }
  -[NSArray addObject:](redactionSignals, "addObject:", v4);

}

- (unint64_t)redactionSignalsCount
{
  return -[NSArray count](self->_redactionSignals, "count");
}

- (id)redactionSignalsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_redactionSignals, "objectAtIndexedSubscript:", a3);
}

- (void)setSummaryCreationTimeSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_summaryCreationTimeSince1970 = a3;
}

- (BOOL)hasSummaryCreationTimeSince1970
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSummaryCreationTimeSince1970:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSummaryCreationTimeSince1970
{
  -[LRSchemaLRRedactionSummaryReported setSummaryCreationTimeSince1970:](self, "setSummaryCreationTimeSince1970:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasPreProcessorInfo
{
  return self->_preProcessorInfo != 0;
}

- (void)deletePreProcessorInfo
{
  -[LRSchemaLRRedactionSummaryReported setPreProcessorInfo:](self, "setPreProcessorInfo:", 0);
}

- (void)setMessageCreationTimeSince1970:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageCreationTimeSince1970 = a3;
}

- (BOOL)hasMessageCreationTimeSince1970
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMessageCreationTimeSince1970:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMessageCreationTimeSince1970
{
  -[LRSchemaLRRedactionSummaryReported setMessageCreationTimeSince1970:](self, "setMessageCreationTimeSince1970:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRRedactionSummaryReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_redactionWindows;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_redactionSignals;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int hasRedactedEvents;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  unint64_t summaryCreationTimeSince1970;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  int v27;
  double messageCreationTimeSince1970;
  double v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    hasRedactedEvents = self->_hasRedactedEvents;
    if (hasRedactedEvents != objc_msgSend(v4, "hasRedactedEvents"))
      goto LABEL_23;
  }
  -[LRSchemaLRRedactionSummaryReported redactionWindows](self, "redactionWindows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactionWindows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[LRSchemaLRRedactionSummaryReported redactionWindows](self, "redactionWindows");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[LRSchemaLRRedactionSummaryReported redactionWindows](self, "redactionWindows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redactionWindows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[LRSchemaLRRedactionSummaryReported redactionSignals](self, "redactionSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactionSignals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[LRSchemaLRRedactionSummaryReported redactionSignals](self, "redactionSignals");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[LRSchemaLRRedactionSummaryReported redactionSignals](self, "redactionSignals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redactionSignals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  v18 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v18 != ((v4[56] >> 1) & 1))
    goto LABEL_23;
  if (v18)
  {
    summaryCreationTimeSince1970 = self->_summaryCreationTimeSince1970;
    if (summaryCreationTimeSince1970 != objc_msgSend(v4, "summaryCreationTimeSince1970"))
      goto LABEL_23;
  }
  -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preProcessorInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preProcessorInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_23;
  }
  else
  {

  }
  v27 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v27 == ((v4[56] >> 2) & 1))
  {
    if (!v27
      || (messageCreationTimeSince1970 = self->_messageCreationTimeSince1970,
          objc_msgSend(v4, "messageCreationTimeSince1970"),
          messageCreationTimeSince1970 == v29))
    {
      v25 = 1;
      goto LABEL_24;
    }
  }
LABEL_23:
  v25 = 0;
LABEL_24:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double messageCreationTimeSince1970;
  double v10;
  long double v11;
  double v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_hasRedactedEvents;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_redactionWindows, "hash");
  v5 = -[NSArray hash](self->_redactionSignals, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761u * self->_summaryCreationTimeSince1970;
  else
    v6 = 0;
  v7 = -[LRSchemaLRPreprocessorInfo hash](self->_preProcessorInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    messageCreationTimeSince1970 = self->_messageCreationTimeSince1970;
    v10 = -messageCreationTimeSince1970;
    if (messageCreationTimeSince1970 >= 0.0)
      v10 = self->_messageCreationTimeSince1970;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LRSchemaLRRedactionSummaryReported hasRedactedEvents](self, "hasRedactedEvents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasRedactedEvents"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[LRSchemaLRRedactionSummaryReported messageCreationTimeSince1970](self, "messageCreationTimeSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("messageCreationTimeSince1970"));

  }
  if (self->_preProcessorInfo)
  {
    -[LRSchemaLRRedactionSummaryReported preProcessorInfo](self, "preProcessorInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("preProcessorInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("preProcessorInfo"));

    }
  }
  if (-[NSArray count](self->_redactionSignals, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_redactionSignals;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("redactionSignals"));
  }
  if (-[NSArray count](self->_redactionWindows, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = self->_redactionWindows;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v19, "addObject:", v25);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v26);

          }
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("redactionWindows"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LRSchemaLRRedactionSummaryReported summaryCreationTimeSince1970](self, "summaryCreationTimeSince1970"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("summaryCreationTimeSince1970"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LRSchemaLRRedactionSummaryReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LRSchemaLRRedactionSummaryReported)initWithJSON:(id)a3
{
  void *v4;
  LRSchemaLRRedactionSummaryReported *v5;
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
    self = -[LRSchemaLRRedactionSummaryReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LRSchemaLRRedactionSummaryReported)initWithDictionary:(id)a3
{
  id v4;
  LRSchemaLRRedactionSummaryReported *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  LRSchemaLRWindow *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  LRSchemaLRRedactionSignal *v22;
  void *v23;
  void *v24;
  LRSchemaLRPreprocessorInfo *v25;
  void *v26;
  LRSchemaLRRedactionSummaryReported *v27;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)LRSchemaLRRedactionSummaryReported;
  v5 = -[LRSchemaLRRedactionSummaryReported init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRedactedEvents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRRedactionSummaryReported setHasRedactedEvents:](v5, "setHasRedactedEvents:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactionWindows"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[LRSchemaLRWindow initWithDictionary:]([LRSchemaLRWindow alloc], "initWithDictionary:", v13);
              -[LRSchemaLRRedactionSummaryReported addRedactionWindows:](v5, "addRedactionWindows:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v10);
      }

      v7 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactionSignals"), v29, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[LRSchemaLRRedactionSignal initWithDictionary:]([LRSchemaLRRedactionSignal alloc], "initWithDictionary:", v21);
              -[LRSchemaLRRedactionSummaryReported addRedactionSignals:](v5, "addRedactionSignals:", v22);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v18);
      }

      v7 = v30;
      v6 = v31;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("summaryCreationTimeSince1970"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRRedactionSummaryReported setSummaryCreationTimeSince1970:](v5, "setSummaryCreationTimeSince1970:", objc_msgSend(v23, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preProcessorInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[LRSchemaLRPreprocessorInfo initWithDictionary:]([LRSchemaLRPreprocessorInfo alloc], "initWithDictionary:", v24);
      -[LRSchemaLRRedactionSummaryReported setPreProcessorInfo:](v5, "setPreProcessorInfo:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCreationTimeSince1970"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "doubleValue");
      -[LRSchemaLRRedactionSummaryReported setMessageCreationTimeSince1970:](v5, "setMessageCreationTimeSince1970:");
    }
    v27 = v5;

  }
  return v5;
}

- (BOOL)hasRedactedEvents
{
  return self->_hasRedactedEvents;
}

- (NSArray)redactionWindows
{
  return self->_redactionWindows;
}

- (void)setRedactionWindows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)redactionSignals
{
  return self->_redactionSignals;
}

- (void)setRedactionSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)summaryCreationTimeSince1970
{
  return self->_summaryCreationTimeSince1970;
}

- (LRSchemaLRPreprocessorInfo)preProcessorInfo
{
  return self->_preProcessorInfo;
}

- (void)setPreProcessorInfo:(id)a3
{
  objc_storeStrong((id *)&self->_preProcessorInfo, a3);
}

- (double)messageCreationTimeSince1970
{
  return self->_messageCreationTimeSince1970;
}

- (void)setHasPreProcessorInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preProcessorInfo, 0);
  objc_storeStrong((id *)&self->_redactionSignals, 0);
  objc_storeStrong((id *)&self->_redactionWindows, 0);
}

@end
