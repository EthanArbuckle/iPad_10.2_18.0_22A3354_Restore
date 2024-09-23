@implementation IFTSchemaIFTClientEventMetadata

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
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IFTSchemaIFTClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v21, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTClientEventMetadata deleteIfRequestId](self, "deleteIfRequestId");
  -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTClientEventMetadata deleteIfEventId](self, "deleteIfEventId");
  -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTClientEventMetadata deleteIfSessionId](self, "deleteIfSessionId");
  -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTClientEventMetadata deleteClientTraceId](self, "deleteClientTraceId");
  -[IFTSchemaIFTClientEventMetadata initiatedSpans](self, "initiatedSpans");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTClientEventMetadata setInitiatedSpans:](self, "setInitiatedSpans:", v19);

  return v5;
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

- (void)deleteIfRequestId
{
  -[IFTSchemaIFTClientEventMetadata setIfRequestId:](self, "setIfRequestId:", 0);
}

- (BOOL)hasIfEventId
{
  return self->_ifEventId != 0;
}

- (void)deleteIfEventId
{
  -[IFTSchemaIFTClientEventMetadata setIfEventId:](self, "setIfEventId:", 0);
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteIfSessionId
{
  -[IFTSchemaIFTClientEventMetadata setIfSessionId:](self, "setIfSessionId:", 0);
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

- (void)deleteClientTraceId
{
  -[IFTSchemaIFTClientEventMetadata setClientTraceId:](self, "setClientTraceId:", 0);
}

- (void)setSender:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sender = a3;
}

- (BOOL)hasSender
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSender:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSender
{
  -[IFTSchemaIFTClientEventMetadata setSender:](self, "setSender:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPostingSpanId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_postingSpanId = a3;
}

- (BOOL)hasPostingSpanId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPostingSpanId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePostingSpanId
{
  -[IFTSchemaIFTClientEventMetadata setPostingSpanId:](self, "setPostingSpanId:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearInitiatedSpans
{
  -[NSArray removeAllObjects](self->_initiatedSpans, "removeAllObjects");
}

- (void)addInitiatedSpans:(id)a3
{
  id v4;
  NSArray *initiatedSpans;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  initiatedSpans = self->_initiatedSpans;
  v8 = v4;
  if (!initiatedSpans)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_initiatedSpans;
    self->_initiatedSpans = v6;

    v4 = v8;
    initiatedSpans = self->_initiatedSpans;
  }
  -[NSArray addObject:](initiatedSpans, "addObject:", v4);

}

- (unint64_t)initiatedSpansCount
{
  return -[NSArray count](self->_initiatedSpans, "count");
}

- (id)initiatedSpansAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_initiatedSpans, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char has;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_initiatedSpans;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
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
  $FC28A89ED6AEA62D141FDD5D468CF852 has;
  unsigned int v28;
  int sender;
  int v30;
  unint64_t postingSpanId;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifEventId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifSessionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientTraceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientTraceId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_34;
  }
  else
  {

  }
  has = self->_has;
  v28 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v28 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sender = self->_sender;
    if (sender != objc_msgSend(v4, "sender"))
      goto LABEL_34;
    has = self->_has;
    v28 = v4[64];
  }
  v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_34;
  if (v30)
  {
    postingSpanId = self->_postingSpanId;
    if (postingSpanId != objc_msgSend(v4, "postingSpanId"))
      goto LABEL_34;
  }
  -[IFTSchemaIFTClientEventMetadata initiatedSpans](self, "initiatedSpans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiatedSpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[IFTSchemaIFTClientEventMetadata initiatedSpans](self, "initiatedSpans");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_37:
    v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  -[IFTSchemaIFTClientEventMetadata initiatedSpans](self, "initiatedSpans");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiatedSpans");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_37;
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_ifRequestId, "hash");
  v4 = -[SISchemaUUID hash](self->_ifEventId, "hash");
  v5 = -[SISchemaUUID hash](self->_ifSessionId, "hash");
  v6 = -[SISchemaUUID hash](self->_clientTraceId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_sender;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSArray hash](self->_initiatedSpans, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761u * self->_postingSpanId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSArray hash](self->_initiatedSpans, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char has;
  void *v25;
  unsigned int v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientTraceId)
  {
    -[IFTSchemaIFTClientEventMetadata clientTraceId](self, "clientTraceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientTraceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientTraceId"));

    }
  }
  if (self->_ifEventId)
  {
    -[IFTSchemaIFTClientEventMetadata ifEventId](self, "ifEventId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ifEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ifEventId"));

    }
  }
  if (self->_ifRequestId)
  {
    -[IFTSchemaIFTClientEventMetadata ifRequestId](self, "ifRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ifRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ifRequestId"));

    }
  }
  if (self->_ifSessionId)
  {
    -[IFTSchemaIFTClientEventMetadata ifSessionId](self, "ifSessionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ifSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("ifSessionId"));

    }
  }
  if (-[NSArray count](self->_initiatedSpans, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_initiatedSpans;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v29);
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
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("initiatedSpans"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IFTSchemaIFTClientEventMetadata postingSpanId](self, "postingSpanId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("postingSpanId"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v26 = -[IFTSchemaIFTClientEventMetadata sender](self, "sender") - 1;
    if (v26 > 5)
      v27 = CFSTR("IFPARTICIPANT_UNKNOWN");
    else
      v27 = off_1E563D0F8[v26];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("sender"), (_QWORD)v29);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v29);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTClientEventMetadata *v5;
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
    self = -[IFTSchemaIFTClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  IFTSchemaIFTInitiatedSpans *v23;
  IFTSchemaIFTClientEventMetadata *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IFTSchemaIFTClientEventMetadata;
  v5 = -[IFTSchemaIFTClientEventMetadata init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTClientEventMetadata setIfRequestId:](v5, "setIfRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifEventId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTClientEventMetadata setIfEventId:](v5, "setIfEventId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifSessionId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTClientEventMetadata setIfSessionId:](v5, "setIfSessionId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientTraceId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTClientEventMetadata setClientTraceId:](v5, "setClientTraceId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sender"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTClientEventMetadata setSender:](v5, "setSender:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postingSpanId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", objc_msgSend(v15, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initiatedSpans"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v15;
      v27 = v14;
      v28 = v12;
      v29 = v10;
      v30 = v6;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[IFTSchemaIFTInitiatedSpans initWithDictionary:]([IFTSchemaIFTInitiatedSpans alloc], "initWithDictionary:", v22);
              -[IFTSchemaIFTClientEventMetadata addInitiatedSpans:](v5, "addInitiatedSpans:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v19);
      }

      v6 = v30;
      v12 = v28;
      v10 = v29;
      v15 = v26;
      v14 = v27;
    }
    v24 = v5;

  }
  return v5;
}

- (SISchemaUUID)ifRequestId
{
  return self->_ifRequestId;
}

- (void)setIfRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_ifRequestId, a3);
}

- (SISchemaUUID)ifEventId
{
  return self->_ifEventId;
}

- (void)setIfEventId:(id)a3
{
  objc_storeStrong((id *)&self->_ifEventId, a3);
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (void)setIfSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_ifSessionId, a3);
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_clientTraceId, a3);
}

- (int)sender
{
  return self->_sender;
}

- (unint64_t)postingSpanId
{
  return self->_postingSpanId;
}

- (NSArray)initiatedSpans
{
  return self->_initiatedSpans;
}

- (void)setInitiatedSpans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasIfEventId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasIfRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatedSpans, 0);
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
  objc_storeStrong((id *)&self->_ifEventId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

@end
