@implementation DHTSchemaDHTDeleteTrigger

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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DHTSchemaDHTDeleteTrigger;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");
  }
  -[DHTSchemaDHTDeleteTrigger id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DHTSchemaDHTDeleteTrigger deleteId](self, "deleteId");
  -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DHTSchemaDHTDeleteTrigger deleteSpeechId](self, "deleteSpeechId");
  -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DHTSchemaDHTDeleteTrigger deleteSiriDeviceId](self, "deleteSiriDeviceId");

  return v5;
}

- (BOOL)hasId
{
  return self->_id != 0;
}

- (void)deleteId
{
  -[DHTSchemaDHTDeleteTrigger setId:](self, "setId:", 0);
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteSpeechId
{
  -[DHTSchemaDHTDeleteTrigger setSpeechId:](self, "setSpeechId:", 0);
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

- (void)deleteSiriDeviceId
{
  -[DHTSchemaDHTDeleteTrigger setSiriDeviceId:](self, "setSiriDeviceId:", 0);
}

- (void)setDeleteTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deleteTimestampMs = a3;
}

- (BOOL)hasDeleteTimestampMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeleteTimestampMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeleteTimestampMs
{
  -[DHTSchemaDHTDeleteTrigger setDeleteTimestampMs:](self, "setDeleteTimestampMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDeletionTriggerEvent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deletionTriggerEvent = a3;
}

- (BOOL)hasDeletionTriggerEvent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDeletionTriggerEvent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDeletionTriggerEvent
{
  -[DHTSchemaDHTDeleteTrigger setDeletionTriggerEvent:](self, "setDeletionTriggerEvent:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return DHTSchemaDHTDeleteTriggerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  id v12;

  v12 = a3;
  -[DHTSchemaDHTDeleteTrigger id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DHTSchemaDHTDeleteTrigger id](self, "id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  v11 = v12;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = v12;
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
  BOOL v22;
  $288D361F4B1DBFB15C083ABE2D422071 has;
  unsigned int v25;
  unint64_t deleteTimestampMs;
  int v27;
  int deletionTriggerEvent;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[DHTSchemaDHTDeleteTrigger id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[DHTSchemaDHTDeleteTrigger id](self, "id");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DHTSchemaDHTDeleteTrigger id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  has = self->_has;
  v25 = v4[44];
  if ((*(_BYTE *)&has & 1) == (v25 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      deleteTimestampMs = self->_deleteTimestampMs;
      if (deleteTimestampMs != objc_msgSend(v4, "deleteTimestampMs"))
        goto LABEL_17;
      has = self->_has;
      v25 = v4[44];
    }
    v27 = (*(unsigned int *)&has >> 1) & 1;
    if (v27 == ((v25 >> 1) & 1))
    {
      if (!v27
        || (deletionTriggerEvent = self->_deletionTriggerEvent,
            deletionTriggerEvent == objc_msgSend(v4, "deletionTriggerEvent")))
      {
        v22 = 1;
        goto LABEL_18;
      }
    }
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
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_id, "hash");
  v4 = -[SISchemaUUID hash](self->_speechId, "hash");
  v5 = -[SISchemaUUID hash](self->_siriDeviceId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_deleteTimestampMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_deletionTriggerEvent;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DHTSchemaDHTDeleteTrigger deleteTimestampMs](self, "deleteTimestampMs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deleteTimestampMs"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = -[DHTSchemaDHTDeleteTrigger deletionTriggerEvent](self, "deletionTriggerEvent");
    v7 = CFSTR("DHTTRIGGEREVENT_UNKNOWN");
    if (v6 == 1)
      v7 = CFSTR("DHTTRIGGEREVENT_DESTROY_ASSISTANT");
    if (v6 == 2)
      v8 = CFSTR("DHTTRIGGEREVENT_DELETE_ASSISTANT_HISTORY");
    else
      v8 = v7;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deletionTriggerEvent"));
  }
  if (self->_id)
  {
    -[DHTSchemaDHTDeleteTrigger id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("id"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("id"));

    }
  }
  if (self->_siriDeviceId)
  {
    -[DHTSchemaDHTDeleteTrigger siriDeviceId](self, "siriDeviceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("siriDeviceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("siriDeviceId"));

    }
  }
  if (self->_speechId)
  {
    -[DHTSchemaDHTDeleteTrigger speechId](self, "speechId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("speechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("speechId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DHTSchemaDHTDeleteTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DHTSchemaDHTDeleteTrigger)initWithJSON:(id)a3
{
  void *v4;
  DHTSchemaDHTDeleteTrigger *v5;
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
    self = -[DHTSchemaDHTDeleteTrigger initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DHTSchemaDHTDeleteTrigger)initWithDictionary:(id)a3
{
  id v4;
  DHTSchemaDHTDeleteTrigger *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  DHTSchemaDHTDeleteTrigger *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DHTSchemaDHTDeleteTrigger;
  v5 = -[DHTSchemaDHTDeleteTrigger init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DHTSchemaDHTDeleteTrigger setId:](v5, "setId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[DHTSchemaDHTDeleteTrigger setSpeechId:](v5, "setSpeechId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[DHTSchemaDHTDeleteTrigger setSiriDeviceId:](v5, "setSiriDeviceId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deleteTimestampMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DHTSchemaDHTDeleteTrigger setDeleteTimestampMs:](v5, "setDeleteTimestampMs:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deletionTriggerEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DHTSchemaDHTDeleteTrigger setDeletionTriggerEvent:](v5, "setDeletionTriggerEvent:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_speechId, a3);
}

- (SISchemaUUID)siriDeviceId
{
  return self->_siriDeviceId;
}

- (void)setSiriDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_siriDeviceId, a3);
}

- (unint64_t)deleteTimestampMs
{
  return self->_deleteTimestampMs;
}

- (int)deletionTriggerEvent
{
  return self->_deletionTriggerEvent;
}

- (void)setHasId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSpeechId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
