@implementation SIServiceInstrumentationBatch

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
  v12.super_class = (Class)SIServiceInstrumentationBatch;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SIServiceInstrumentationBatch deleteBatch_info](self, "deleteBatch_info");
  -[SIServiceInstrumentationBatch events](self, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIServiceInstrumentationBatch setEvents:](self, "setEvents:", v10);

  return v5;
}

- (BOOL)hasApp_id
{
  return self->_app_id != 0;
}

- (void)deleteApp_id
{
  -[SIServiceInstrumentationBatch setApp_id:](self, "setApp_id:", 0);
}

- (BOOL)hasBatch_info
{
  return self->_batch_info != 0;
}

- (void)deleteBatch_info
{
  -[SIServiceInstrumentationBatch setBatch_info:](self, "setBatch_info:", 0);
}

- (void)clearEvent
{
  -[NSArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvent:(id)a3
{
  id v4;
  NSArray *events;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventCount
{
  return -[NSArray count](self->_events, "count");
}

- (id)eventAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_events, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceInstrumentationBatchReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SIServiceInstrumentationBatch app_id](self, "app_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_events;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
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
  -[SIServiceInstrumentationBatch app_id](self, "app_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "app_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SIServiceInstrumentationBatch app_id](self, "app_id");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SIServiceInstrumentationBatch app_id](self, "app_id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "app_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batch_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batch_info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SIServiceInstrumentationBatch events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SIServiceInstrumentationBatch events](self, "events");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[SIServiceInstrumentationBatch events](self, "events");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
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
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_app_id, "hash");
  v4 = -[SIServiceBatchInfo hash](self->_batch_info, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_events, "hash");
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_app_id)
  {
    -[SIServiceInstrumentationBatch app_id](self, "app_id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appId"));

  }
  if (self->_batch_info)
  {
    -[SIServiceInstrumentationBatch batch_info](self, "batch_info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("batchInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("batchInfo"));

    }
  }
  if (-[NSArray count](self->_events, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_events;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("event"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v18);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIServiceInstrumentationBatch dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIServiceInstrumentationBatch)initWithJSON:(id)a3
{
  void *v4;
  SIServiceInstrumentationBatch *v5;
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
    self = -[SIServiceInstrumentationBatch initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIServiceInstrumentationBatch)initWithDictionary:(id)a3
{
  id v4;
  SIServiceInstrumentationBatch *v5;
  void *v6;
  void *v7;
  void *v8;
  SIServiceBatchInfo *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SISchemaAnyEvent *v17;
  SIServiceInstrumentationBatch *v18;
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
  v25.super_class = (Class)SIServiceInstrumentationBatch;
  v5 = -[SIServiceInstrumentationBatch init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SIServiceInstrumentationBatch setApp_id:](v5, "setApp_id:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SIServiceBatchInfo initWithDictionary:]([SIServiceBatchInfo alloc], "initWithDictionary:", v8);
      -[SIServiceInstrumentationBatch setBatch_info:](v5, "setBatch_info:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
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
              v17 = -[SISchemaAnyEvent initWithDictionary:]([SISchemaAnyEvent alloc], "initWithDictionary:", v16);
              -[SIServiceInstrumentationBatch addEvent:](v5, "addEvent:", v17);

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

- (NSString)app_id
{
  return self->_app_id;
}

- (void)setApp_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SIServiceBatchInfo)batch_info
{
  return self->_batch_info;
}

- (void)setBatch_info:(id)a3
{
  objc_storeStrong((id *)&self->_batch_info, a3);
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasApp_id:(BOOL)a3
{
  self->_hasApp_id = a3;
}

- (void)setHasBatch_info:(BOOL)a3
{
  self->_hasBatch_info = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_batch_info, 0);
  objc_storeStrong((id *)&self->_app_id, 0);
}

@end
