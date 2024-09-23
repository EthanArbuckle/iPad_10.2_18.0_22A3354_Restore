@implementation SessionSchemaOrderedSessionEvent

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SessionSchemaOrderedSessionEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SessionSchemaOrderedSessionEvent event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SessionSchemaOrderedSessionEvent deleteEvent](self, "deleteEvent");
  -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SessionSchemaOrderedSessionEvent deleteMetadata](self, "deleteMetadata");

  return v5;
}

- (void)setLogicalEventTimestampInNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_logicalEventTimestampInNs = a3;
}

- (BOOL)hasLogicalEventTimestampInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLogicalEventTimestampInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLogicalEventTimestampInNs
{
  -[SessionSchemaOrderedSessionEvent setLogicalEventTimestampInNs:](self, "setLogicalEventTimestampInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (void)deleteEvent
{
  -[SessionSchemaOrderedSessionEvent setEvent:](self, "setEvent:", 0);
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)deleteMetadata
{
  -[SessionSchemaOrderedSessionEvent setMetadata:](self, "setMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SessionSchemaOrderedSessionEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  -[SessionSchemaOrderedSessionEvent event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SessionSchemaOrderedSessionEvent event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int64_t logicalEventTimestampInNs;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    logicalEventTimestampInNs = self->_logicalEventTimestampInNs;
    if (logicalEventTimestampInNs != objc_msgSend(v4, "logicalEventTimestampInNs"))
      goto LABEL_15;
  }
  -[SessionSchemaOrderedSessionEvent event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[SessionSchemaOrderedSessionEvent event](self, "event");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SessionSchemaOrderedSessionEvent event](self, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
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
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_logicalEventTimestampInNs;
  else
    v3 = 0;
  v4 = -[SISchemaAnyEvent hash](self->_event, "hash") ^ v3;
  return v4 ^ -[SISchemaCommonEventMetadata hash](self->_metadata, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_event)
  {
    -[SessionSchemaOrderedSessionEvent event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("event"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("event"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SessionSchemaOrderedSessionEvent logicalEventTimestampInNs](self, "logicalEventTimestampInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("logicalEventTimestampInNs"));

  }
  if (self->_metadata)
  {
    -[SessionSchemaOrderedSessionEvent metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("metadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SessionSchemaOrderedSessionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SessionSchemaOrderedSessionEvent)initWithJSON:(id)a3
{
  void *v4;
  SessionSchemaOrderedSessionEvent *v5;
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
    self = -[SessionSchemaOrderedSessionEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SessionSchemaOrderedSessionEvent)initWithDictionary:(id)a3
{
  id v4;
  SessionSchemaOrderedSessionEvent *v5;
  void *v6;
  void *v7;
  SISchemaAnyEvent *v8;
  void *v9;
  SISchemaCommonEventMetadata *v10;
  SessionSchemaOrderedSessionEvent *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SessionSchemaOrderedSessionEvent;
  v5 = -[SessionSchemaOrderedSessionEvent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logicalEventTimestampInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SessionSchemaOrderedSessionEvent setLogicalEventTimestampInNs:](v5, "setLogicalEventTimestampInNs:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaAnyEvent initWithDictionary:]([SISchemaAnyEvent alloc], "initWithDictionary:", v7);
      -[SessionSchemaOrderedSessionEvent setEvent:](v5, "setEvent:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaCommonEventMetadata initWithDictionary:]([SISchemaCommonEventMetadata alloc], "initWithDictionary:", v9);
      -[SessionSchemaOrderedSessionEvent setMetadata:](v5, "setMetadata:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int64_t)logicalEventTimestampInNs
{
  return self->_logicalEventTimestampInNs;
}

- (SISchemaAnyEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (SISchemaCommonEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setHasEvent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
