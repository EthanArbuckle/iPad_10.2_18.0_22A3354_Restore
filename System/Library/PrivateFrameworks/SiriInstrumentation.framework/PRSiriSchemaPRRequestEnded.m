@implementation PRSiriSchemaPRRequestEnded

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRSiriSchemaPRRequestEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PRSiriSchemaPRRequestEnded deleteTranscriptEventId](self, "deleteTranscriptEventId");
  return v5;
}

- (BOOL)hasTranscriptEventId
{
  return self->_transcriptEventId != 0;
}

- (void)deleteTranscriptEventId
{
  -[PRSiriSchemaPRRequestEnded setTranscriptEventId:](self, "setTranscriptEventId:", 0);
}

- (void)setEventName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventName = a3;
}

- (BOOL)hasEventName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventName
{
  -[PRSiriSchemaPRRequestEnded setEventName:](self, "setEventName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int eventName;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transcriptEventId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventName = self->_eventName;
    if (eventName != objc_msgSend(v4, "eventName"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_transcriptEventId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_eventName;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[PRSiriSchemaPRRequestEnded eventName](self, "eventName") - 1;
    if (v4 > 6)
      v5 = CFSTR("TRANSCRIPTEVENTTYPE_UNKNOWN");
    else
      v5 = off_1E563D908[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventName"));
  }
  if (self->_transcriptEventId)
  {
    -[PRSiriSchemaPRRequestEnded transcriptEventId](self, "transcriptEventId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("transcriptEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("transcriptEventId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PRSiriSchemaPRRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PRSiriSchemaPRRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  PRSiriSchemaPRRequestEnded *v5;
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
    self = -[PRSiriSchemaPRRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PRSiriSchemaPRRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  PRSiriSchemaPRRequestEnded *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PRSiriSchemaPRRequestEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSiriSchemaPRRequestEnded;
  v5 = -[PRSiriSchemaPRRequestEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transcriptEventId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PRSiriSchemaPRRequestEnded setTranscriptEventId:](v5, "setTranscriptEventId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PRSiriSchemaPRRequestEnded setEventName:](v5, "setEventName:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (SISchemaUUID)transcriptEventId
{
  return self->_transcriptEventId;
}

- (void)setTranscriptEventId:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptEventId, a3);
}

- (int)eventName
{
  return self->_eventName;
}

- (void)setHasTranscriptEventId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptEventId, 0);
}

@end
