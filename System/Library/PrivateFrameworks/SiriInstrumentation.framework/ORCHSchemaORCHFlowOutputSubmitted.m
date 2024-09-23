@implementation ORCHSchemaORCHFlowOutputSubmitted

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
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ORCHSchemaORCHFlowOutputSubmitted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHFlowOutputSubmitted deleteAceCommandId](self, "deleteAceCommandId");
  -[ORCHSchemaORCHFlowOutputSubmitted aceViewIds](self, "aceViewIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHFlowOutputSubmitted setAceViewIds:](self, "setAceViewIds:", v10);

  -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[ORCHSchemaORCHFlowOutputSubmitted deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (void)setFlowOutputSubmissionId:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_flowOutputSubmissionId = a3;
}

- (BOOL)hasFlowOutputSubmissionId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFlowOutputSubmissionId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFlowOutputSubmissionId
{
  -[ORCHSchemaORCHFlowOutputSubmitted setFlowOutputSubmissionId:](self, "setFlowOutputSubmissionId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setFlowCommandReceived:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_flowCommandReceived = a3;
}

- (BOOL)hasFlowCommandReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFlowCommandReceived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFlowCommandReceived
{
  -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandReceived:](self, "setFlowCommandReceived:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setFlowCommandResponseError:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_flowCommandResponseError = a3;
}

- (BOOL)hasFlowCommandResponseError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasFlowCommandResponseError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteFlowCommandResponseError
{
  -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandResponseError:](self, "setFlowCommandResponseError:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasAceCommandId
{
  return self->_aceCommandId != 0;
}

- (void)deleteAceCommandId
{
  -[ORCHSchemaORCHFlowOutputSubmitted setAceCommandId:](self, "setAceCommandId:", 0);
}

- (void)clearAceViewIds
{
  -[NSArray removeAllObjects](self->_aceViewIds, "removeAllObjects");
}

- (void)addAceViewIds:(id)a3
{
  id v4;
  NSArray *aceViewIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  aceViewIds = self->_aceViewIds;
  v8 = v4;
  if (!aceViewIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aceViewIds;
    self->_aceViewIds = v6;

    v4 = v8;
    aceViewIds = self->_aceViewIds;
  }
  -[NSArray addObject:](aceViewIds, "addObject:", v4);

}

- (unint64_t)aceViewIdsCount
{
  return -[NSArray count](self->_aceViewIds, "count");
}

- (id)aceViewIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_aceViewIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[ORCHSchemaORCHFlowOutputSubmitted setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHFlowOutputSubmittedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_aceViewIds;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8CF3C99840CD6FD7472937E8AEAB16CE has;
  unsigned int v6;
  int flowOutputSubmissionId;
  int v8;
  int flowCommandReceived;
  int v10;
  int flowCommandResponseError;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_28;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    flowOutputSubmissionId = self->_flowOutputSubmissionId;
    if (flowOutputSubmissionId != objc_msgSend(v4, "flowOutputSubmissionId"))
      goto LABEL_28;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      flowCommandReceived = self->_flowCommandReceived;
      if (flowCommandReceived != objc_msgSend(v4, "flowCommandReceived"))
        goto LABEL_28;
      has = self->_has;
      v6 = v4[40];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_28;
    if (v10)
    {
      flowCommandResponseError = self->_flowCommandResponseError;
      if (flowCommandResponseError != objc_msgSend(v4, "flowCommandResponseError"))
        goto LABEL_28;
    }
    -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceCommandId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_27;
    -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aceCommandId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_28;
    }
    else
    {

    }
    -[ORCHSchemaORCHFlowOutputSubmitted aceViewIds](self, "aceViewIds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewIds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_27;
    -[ORCHSchemaORCHFlowOutputSubmitted aceViewIds](self, "aceViewIds");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[ORCHSchemaORCHFlowOutputSubmitted aceViewIds](self, "aceViewIds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aceViewIds");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_28;
    }
    else
    {

    }
    -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) != (v13 != 0))
    {
      -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {

LABEL_31:
        v29 = 1;
        goto LABEL_29;
      }
      v25 = (void *)v24;
      -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subRequestId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if ((v28 & 1) != 0)
        goto LABEL_31;
    }
    else
    {
LABEL_27:

    }
  }
LABEL_28:
  v29 = 0;
LABEL_29:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_flowOutputSubmissionId;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_flowCommandReceived;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_flowCommandResponseError;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_aceCommandId, "hash");
  v7 = -[NSArray hash](self->_aceViewIds, "hash");
  return v6 ^ v7 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
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
  char has;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceCommandId)
  {
    -[ORCHSchemaORCHFlowOutputSubmitted aceCommandId](self, "aceCommandId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceCommandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aceCommandId"));

    }
  }
  if (-[NSArray count](self->_aceViewIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = self->_aceViewIds;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aceViewIds"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHFlowOutputSubmitted flowCommandReceived](self, "flowCommandReceived"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("flowCommandReceived"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_20:
      if ((has & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHFlowOutputSubmitted flowCommandResponseError](self, "flowCommandResponseError", (_QWORD)v23));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("flowCommandResponseError"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaORCHFlowOutputSubmitted flowOutputSubmissionId](self, "flowOutputSubmissionId", (_QWORD)v23));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("flowOutputSubmissionId"));

  }
LABEL_22:
  if (self->_subRequestId)
  {
    -[ORCHSchemaORCHFlowOutputSubmitted subRequestId](self, "subRequestId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("subRequestId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v23);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHFlowOutputSubmitted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHFlowOutputSubmitted)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHFlowOutputSubmitted *v5;
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
    self = -[ORCHSchemaORCHFlowOutputSubmitted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHFlowOutputSubmitted)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHFlowOutputSubmitted *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SISchemaUUID *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SISchemaUUID *v18;
  void *v19;
  SISchemaUUID *v20;
  ORCHSchemaORCHFlowOutputSubmitted *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ORCHSchemaORCHFlowOutputSubmitted;
  v5 = -[ORCHSchemaORCHFlowOutputSubmitted init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowOutputSubmissionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowOutputSubmissionId:](v5, "setFlowOutputSubmissionId:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowCommandReceived"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandReceived:](v5, "setFlowCommandReceived:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowCommandResponseError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHFlowOutputSubmitted setFlowCommandResponseError:](v5, "setFlowCommandResponseError:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandId"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v9);
      -[ORCHSchemaORCHFlowOutputSubmitted setAceCommandId:](v5, "setAceCommandId:", v10);

    }
    v26 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewIds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v8;
      v24 = v7;
      v25 = v6;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v17);
              -[ORCHSchemaORCHFlowOutputSubmitted addAceViewIds:](v5, "addAceViewIds:", v18);

            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v14);
      }

      v7 = v24;
      v6 = v25;
      v8 = v23;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"), v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v19);
      -[ORCHSchemaORCHFlowOutputSubmitted setSubRequestId:](v5, "setSubRequestId:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (int)flowOutputSubmissionId
{
  return self->_flowOutputSubmissionId;
}

- (BOOL)flowCommandReceived
{
  return self->_flowCommandReceived;
}

- (BOOL)flowCommandResponseError
{
  return self->_flowCommandResponseError;
}

- (SISchemaUUID)aceCommandId
{
  return self->_aceCommandId;
}

- (void)setAceCommandId:(id)a3
{
  objc_storeStrong((id *)&self->_aceCommandId, a3);
}

- (NSArray)aceViewIds
{
  return self->_aceViewIds;
}

- (void)setAceViewIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (void)setHasAceCommandId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_aceViewIds, 0);
  objc_storeStrong((id *)&self->_aceCommandId, 0);
}

@end
