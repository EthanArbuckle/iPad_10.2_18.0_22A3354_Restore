@implementation FLOWSchemaFLOWStep

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
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FLOWSchemaFLOWStep;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v20, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWStep flowState](self, "flowState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWStep deleteFlowState](self, "deleteFlowState");
  -[FLOWSchemaFLOWStep appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWStep deleteAppContext](self, "deleteAppContext");
  -[FLOWSchemaFLOWStep domainContexts](self, "domainContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWStep setDomainContexts:](self, "setDomainContexts:", v13);

  -[FLOWSchemaFLOWStep platformContexts](self, "platformContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWStep setPlatformContexts:](self, "setPlatformContexts:", v15);

  -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applySensitiveConditionsPolicy:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "suppressMessage");

  if (v18)
    -[FLOWSchemaFLOWStep deletePlatformRelatedContext](self, "deletePlatformRelatedContext");

  return v5;
}

- (void)setSequenceNum:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNum = a3;
}

- (BOOL)hasSequenceNum
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSequenceNum:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSequenceNum
{
  -[FLOWSchemaFLOWStep setSequenceNum:](self, "setSequenceNum:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTimestampMs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestampMs = a3;
}

- (BOOL)hasTimestampMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTimestampMs
{
  -[FLOWSchemaFLOWStep setTimestampMs:](self, "setTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasFlowState
{
  return self->_flowState != 0;
}

- (void)deleteFlowState
{
  -[FLOWSchemaFLOWStep setFlowState:](self, "setFlowState:", 0);
}

- (BOOL)hasAppContext
{
  return self->_appContext != 0;
}

- (void)deleteAppContext
{
  -[FLOWSchemaFLOWStep setAppContext:](self, "setAppContext:", 0);
}

- (void)clearDomainContext
{
  -[NSArray removeAllObjects](self->_domainContexts, "removeAllObjects");
}

- (void)addDomainContext:(id)a3
{
  id v4;
  NSArray *domainContexts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  domainContexts = self->_domainContexts;
  v8 = v4;
  if (!domainContexts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_domainContexts;
    self->_domainContexts = v6;

    v4 = v8;
    domainContexts = self->_domainContexts;
  }
  -[NSArray addObject:](domainContexts, "addObject:", v4);

}

- (unint64_t)domainContextCount
{
  return -[NSArray count](self->_domainContexts, "count");
}

- (id)domainContextAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_domainContexts, "objectAtIndexedSubscript:", a3);
}

- (void)clearPlatformContext
{
  -[NSArray removeAllObjects](self->_platformContexts, "removeAllObjects");
}

- (void)addPlatformContext:(id)a3
{
  id v4;
  NSArray *platformContexts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  platformContexts = self->_platformContexts;
  v8 = v4;
  if (!platformContexts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_platformContexts;
    self->_platformContexts = v6;

    v4 = v8;
    platformContexts = self->_platformContexts;
  }
  -[NSArray addObject:](platformContexts, "addObject:", v4);

}

- (unint64_t)platformContextCount
{
  return -[NSArray count](self->_platformContexts, "count");
}

- (id)platformContextAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_platformContexts, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasPlatformRelatedContext
{
  return self->_platformRelatedContext != 0;
}

- (void)deletePlatformRelatedContext
{
  -[FLOWSchemaFLOWStep setPlatformRelatedContext:](self, "setPlatformRelatedContext:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWStepReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[FLOWSchemaFLOWStep flowState](self, "flowState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWStep flowState](self, "flowState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWStep appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWSchemaFLOWStep appContext](self, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_domainContexts;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_platformContexts;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $FC72F3F70C0590DEDAD7EF58DA3B6E45 has;
  unsigned int v6;
  unsigned int sequenceNum;
  int v8;
  int64_t timestampMs;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sequenceNum = self->_sequenceNum;
    if (sequenceNum != objc_msgSend(v4, "sequenceNum"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[64];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_34;
  if (v8)
  {
    timestampMs = self->_timestampMs;
    if (timestampMs != objc_msgSend(v4, "timestampMs"))
      goto LABEL_34;
  }
  -[FLOWSchemaFLOWStep flowState](self, "flowState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_33;
  -[FLOWSchemaFLOWStep flowState](self, "flowState");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWStep flowState](self, "flowState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  -[FLOWSchemaFLOWStep appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_33;
  -[FLOWSchemaFLOWStep appContext](self, "appContext");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWStep appContext](self, "appContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  -[FLOWSchemaFLOWStep domainContexts](self, "domainContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainContexts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_33;
  -[FLOWSchemaFLOWStep domainContexts](self, "domainContexts");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWStep domainContexts](self, "domainContexts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainContexts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_34;
  }
  else
  {

  }
  -[FLOWSchemaFLOWStep platformContexts](self, "platformContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platformContexts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_33;
  -[FLOWSchemaFLOWStep platformContexts](self, "platformContexts");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[FLOWSchemaFLOWStep platformContexts](self, "platformContexts");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "platformContexts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_34;
  }
  else
  {

  }
  -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platformRelatedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_37:
      v37 = 1;
      goto LABEL_35;
    }
    v33 = (void *)v32;
    -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "platformRelatedContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
LABEL_33:

  }
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_sequenceNum;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_timestampMs;
LABEL_6:
  v5 = v4 ^ v3 ^ -[FLOWSchemaFLOWState hash](self->_flowState, "hash");
  v6 = -[FLOWSchemaFLOWAppContext hash](self->_appContext, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_domainContexts, "hash");
  v8 = -[NSArray hash](self->_platformContexts, "hash");
  return v7 ^ v8 ^ -[FLOWSchemaFLOWPlatformContext hash](self->_platformRelatedContext, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char has;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appContext)
  {
    -[FLOWSchemaFLOWStep appContext](self, "appContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appContext"));

    }
  }
  if (-[NSArray count](self->_domainContexts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = self->_domainContexts;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("domainContext"));
  }
  if (self->_flowState)
  {
    -[FLOWSchemaFLOWStep flowState](self, "flowState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("flowState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("flowState"));

    }
  }
  if (-[NSArray count](self->_platformContexts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = self->_platformContexts;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v18, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("platformContext"));
  }
  if (self->_platformRelatedContext)
  {
    -[FLOWSchemaFLOWStep platformRelatedContext](self, "platformRelatedContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("platformRelatedContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("platformRelatedContext"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWStep sequenceNum](self, "sequenceNum"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("sequenceNum"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FLOWSchemaFLOWStep timestampMs](self, "timestampMs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("timestampMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v33);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWStep dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWStep)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWStep *v5;
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
    self = -[FLOWSchemaFLOWStep initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWStep)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWStep *v5;
  void *v6;
  void *v7;
  void *v8;
  FLOWSchemaFLOWState *v9;
  void *v10;
  FLOWSchemaFLOWAppContext *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  FLOWSchemaFLOWDomainContext *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  FLOWSchemaFLOWPlatformContext *v27;
  void *v28;
  FLOWSchemaFLOWPlatformContext *v29;
  FLOWSchemaFLOWStep *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWSchemaFLOWStep;
  v5 = -[FLOWSchemaFLOWStep init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWStep setSequenceNum:](v5, "setSequenceNum:", objc_msgSend(v6, "unsignedIntValue"));
    v35 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWStep setTimestampMs:](v5, "setTimestampMs:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWState initWithDictionary:]([FLOWSchemaFLOWState alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWStep setFlowState:](v5, "setFlowState:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWSchemaFLOWAppContext initWithDictionary:]([FLOWSchemaFLOWAppContext alloc], "initWithDictionary:", v10);
      -[FLOWSchemaFLOWStep setAppContext:](v5, "setAppContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v10;
    v34 = v8;
    v32 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[FLOWSchemaFLOWDomainContext initWithDictionary:]([FLOWSchemaFLOWDomainContext alloc], "initWithDictionary:", v18);
              -[FLOWSchemaFLOWStep addDomainContext:](v5, "addDomainContext:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v15);
      }

      v10 = v33;
      v12 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = -[FLOWSchemaFLOWPlatformContext initWithDictionary:]([FLOWSchemaFLOWPlatformContext alloc], "initWithDictionary:", v26);
              -[FLOWSchemaFLOWStep addPlatformContext:](v5, "addPlatformContext:", v27);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v23);
      }

      v10 = v33;
      v8 = v34;
      v12 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformRelatedContext"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[FLOWSchemaFLOWPlatformContext initWithDictionary:]([FLOWSchemaFLOWPlatformContext alloc], "initWithDictionary:", v28);
      -[FLOWSchemaFLOWStep setPlatformRelatedContext:](v5, "setPlatformRelatedContext:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (unsigned)sequenceNum
{
  return self->_sequenceNum;
}

- (int64_t)timestampMs
{
  return self->_timestampMs;
}

- (FLOWSchemaFLOWState)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(id)a3
{
  objc_storeStrong((id *)&self->_flowState, a3);
}

- (FLOWSchemaFLOWAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (NSArray)domainContexts
{
  return self->_domainContexts;
}

- (void)setDomainContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)platformContexts
{
  return self->_platformContexts;
}

- (void)setPlatformContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (FLOWSchemaFLOWPlatformContext)platformRelatedContext
{
  return self->_platformRelatedContext;
}

- (void)setPlatformRelatedContext:(id)a3
{
  objc_storeStrong((id *)&self->_platformRelatedContext, a3);
}

- (void)setHasFlowState:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAppContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPlatformRelatedContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformRelatedContext, 0);
  objc_storeStrong((id *)&self->_platformContexts, 0);
  objc_storeStrong((id *)&self->_domainContexts, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_flowState, 0);
}

@end
