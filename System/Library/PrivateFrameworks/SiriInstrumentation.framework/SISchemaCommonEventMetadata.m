@implementation SISchemaCommonEventMetadata

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
  v16.super_class = (Class)SISchemaCommonEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaCommonEventMetadata deleteTimestamp](self, "deleteTimestamp");
  -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaCommonEventMetadata deleteTestFingerprint](self, "deleteTestFingerprint");
  -[SISchemaCommonEventMetadata eventId](self, "eventId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaCommonEventMetadata deleteEventId](self, "deleteEventId");

  return v5;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (void)deleteTimestamp
{
  -[SISchemaCommonEventMetadata setTimestamp:](self, "setTimestamp:", 0);
}

- (BOOL)hasTestFingerprint
{
  return self->_testFingerprint != 0;
}

- (void)deleteTestFingerprint
{
  -[SISchemaCommonEventMetadata setTestFingerprint:](self, "setTestFingerprint:", 0);
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)deleteEventId
{
  -[SISchemaCommonEventMetadata setEventId:](self, "setEventId:", 0);
}

- (void)setEmitTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_emitTimestamp = a3;
}

- (BOOL)hasEmitTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEmitTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEmitTimestamp
{
  -[SISchemaCommonEventMetadata setEmitTimestamp:](self, "setEmitTimestamp:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCommonEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaCommonEventMetadata eventId](self, "eventId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaCommonEventMetadata eventId](self, "eventId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

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
  int64_t emitTimestamp;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testFingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testFingerprint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaCommonEventMetadata eventId](self, "eventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[SISchemaCommonEventMetadata eventId](self, "eventId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaCommonEventMetadata eventId](self, "eventId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[40] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (emitTimestamp = self->_emitTimestamp, emitTimestamp == objc_msgSend(v4, "emitTimestamp")))
    {
      v22 = 1;
      goto LABEL_18;
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
  uint64_t v6;

  v3 = -[SISchemaLogicalTimestamp hash](self->_timestamp, "hash");
  v4 = -[SISchemaUUID hash](self->_testFingerprint, "hash");
  v5 = -[SISchemaUUID hash](self->_eventId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_emitTimestamp;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaCommonEventMetadata emitTimestamp](self, "emitTimestamp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("emitTimestamp"));

  }
  if (self->_eventId)
  {
    -[SISchemaCommonEventMetadata eventId](self, "eventId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventId"));

    }
  }
  if (self->_testFingerprint)
  {
    -[SISchemaCommonEventMetadata testFingerprint](self, "testFingerprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("testFingerprint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("testFingerprint"));

    }
  }
  if (self->_timestamp)
  {
    -[SISchemaCommonEventMetadata timestamp](self, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("timestamp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("timestamp"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaCommonEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaCommonEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SISchemaCommonEventMetadata *v5;
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
    self = -[SISchemaCommonEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaCommonEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SISchemaCommonEventMetadata *v5;
  void *v6;
  SISchemaLogicalTimestamp *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  SISchemaCommonEventMetadata *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaCommonEventMetadata;
  v5 = -[SISchemaCommonEventMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaLogicalTimestamp initWithDictionary:]([SISchemaLogicalTimestamp alloc], "initWithDictionary:", v6);
      -[SISchemaCommonEventMetadata setTimestamp:](v5, "setTimestamp:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testFingerprint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[SISchemaCommonEventMetadata setTestFingerprint:](v5, "setTestFingerprint:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[SISchemaCommonEventMetadata setEventId:](v5, "setEventId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emitTimestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCommonEventMetadata setEmitTimestamp:](v5, "setEmitTimestamp:", objc_msgSend(v12, "longLongValue"));
    v13 = v5;

  }
  return v5;
}

- (SISchemaLogicalTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (SISchemaUUID)testFingerprint
{
  return self->_testFingerprint;
}

- (void)setTestFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_testFingerprint, a3);
}

- (SISchemaUUID)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (int64_t)emitTimestamp
{
  return self->_emitTimestamp;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTestFingerprint:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEventId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_testFingerprint, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
