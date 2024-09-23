@implementation GRPSchemaGroupedMessagesClientEvent

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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GRPSchemaGroupedMessagesClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[GRPSchemaGroupedMessagesClientEvent deleteGroupedBy](self, "deleteGroupedBy");
  -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[GRPSchemaGroupedMessagesClientEvent deleteProducerMetadata](self, "deleteProducerMetadata");
  -[GRPSchemaGroupedMessagesClientEvent orderedMessages](self, "orderedMessages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRPSchemaGroupedMessagesClientEvent setOrderedMessages:](self, "setOrderedMessages:", v13);

  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.platform.GroupedMessagesClientEvent");
}

- (BOOL)hasGroupedBy
{
  return self->_groupedBy != 0;
}

- (void)deleteGroupedBy
{
  -[GRPSchemaGroupedMessagesClientEvent setGroupedBy:](self, "setGroupedBy:", 0);
}

- (BOOL)hasProducerMetadata
{
  return self->_producerMetadata != 0;
}

- (void)deleteProducerMetadata
{
  -[GRPSchemaGroupedMessagesClientEvent setProducerMetadata:](self, "setProducerMetadata:", 0);
}

- (void)clearOrderedMessages
{
  -[NSArray removeAllObjects](self->_orderedMessages, "removeAllObjects");
}

- (void)addOrderedMessages:(id)a3
{
  id v4;
  NSArray *orderedMessages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  orderedMessages = self->_orderedMessages;
  v8 = v4;
  if (!orderedMessages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedMessages;
    self->_orderedMessages = v6;

    v4 = v8;
    orderedMessages = self->_orderedMessages;
  }
  -[NSArray addObject:](orderedMessages, "addObject:", v4);

}

- (unint64_t)orderedMessagesCount
{
  return -[NSArray count](self->_orderedMessages, "count");
}

- (id)orderedMessagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_orderedMessages, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaGroupedMessagesClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_orderedMessages;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupedBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupedBy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "producerMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "producerMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[GRPSchemaGroupedMessagesClientEvent orderedMessages](self, "orderedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[GRPSchemaGroupedMessagesClientEvent orderedMessages](self, "orderedMessages");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[GRPSchemaGroupedMessagesClientEvent orderedMessages](self, "orderedMessages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedMessages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[GRPSchemaGroupedMessagesGrouping hash](self->_groupedBy, "hash");
  v4 = -[GRPSchemaProducerMetadata hash](self->_producerMetadata, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_orderedMessages, "hash");
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_groupedBy)
  {
    -[GRPSchemaGroupedMessagesClientEvent groupedBy](self, "groupedBy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groupedBy"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("groupedBy"));

    }
  }
  if (-[NSArray count](self->_orderedMessages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_orderedMessages;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("orderedMessages"));
  }
  if (self->_producerMetadata)
  {
    -[GRPSchemaGroupedMessagesClientEvent producerMetadata](self, "producerMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("producerMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("producerMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRPSchemaGroupedMessagesClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRPSchemaGroupedMessagesClientEvent)initWithJSON:(id)a3
{
  void *v4;
  GRPSchemaGroupedMessagesClientEvent *v5;
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
    self = -[GRPSchemaGroupedMessagesClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRPSchemaGroupedMessagesClientEvent)initWithDictionary:(id)a3
{
  id v4;
  GRPSchemaGroupedMessagesClientEvent *v5;
  void *v6;
  GRPSchemaGroupedMessagesGrouping *v7;
  void *v8;
  GRPSchemaProducerMetadata *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GRPSchemaOrderedMessage *v17;
  GRPSchemaGroupedMessagesClientEvent *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GRPSchemaGroupedMessagesClientEvent;
  v5 = -[GRPSchemaGroupedMessagesClientEvent init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupedBy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[GRPSchemaGroupedMessagesGrouping initWithDictionary:]([GRPSchemaGroupedMessagesGrouping alloc], "initWithDictionary:", v6);
      -[GRPSchemaGroupedMessagesClientEvent setGroupedBy:](v5, "setGroupedBy:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("producerMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[GRPSchemaProducerMetadata initWithDictionary:]([GRPSchemaProducerMetadata alloc], "initWithDictionary:", v8);
      -[GRPSchemaGroupedMessagesClientEvent setProducerMetadata:](v5, "setProducerMetadata:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orderedMessages"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[GRPSchemaOrderedMessage initWithDictionary:]([GRPSchemaOrderedMessage alloc], "initWithDictionary:", v16);
              -[GRPSchemaGroupedMessagesClientEvent addOrderedMessages:](v5, "addOrderedMessages:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v13);
      }

      v8 = v20;
    }
    v18 = v5;

  }
  return v5;
}

- (GRPSchemaGroupedMessagesGrouping)groupedBy
{
  return self->_groupedBy;
}

- (void)setGroupedBy:(id)a3
{
  objc_storeStrong((id *)&self->_groupedBy, a3);
}

- (GRPSchemaProducerMetadata)producerMetadata
{
  return self->_producerMetadata;
}

- (void)setProducerMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_producerMetadata, a3);
}

- (NSArray)orderedMessages
{
  return self->_orderedMessages;
}

- (void)setOrderedMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasGroupedBy:(BOOL)a3
{
  self->_hasGroupedBy = a3;
}

- (void)setHasProducerMetadata:(BOOL)a3
{
  self->_hasProducerMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedMessages, 0);
  objc_storeStrong((id *)&self->_producerMetadata, 0);
  objc_storeStrong((id *)&self->_groupedBy, 0);
}

- (int)getAnyEventType
{
  return 66;
}

@end
