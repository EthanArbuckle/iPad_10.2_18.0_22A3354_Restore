@implementation ODBATCHSiriSchemaODBATCHDataReported

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
  v9.super_class = (Class)ODBATCHSiriSchemaODBATCHDataReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODBATCHSiriSchemaODBATCHDataReported deleteOriginalClockId](self, "deleteOriginalClockId");
  return v5;
}

- (BOOL)hasOriginalClockId
{
  return self->_originalClockId != 0;
}

- (void)deleteOriginalClockId
{
  -[ODBATCHSiriSchemaODBATCHDataReported setOriginalClockId:](self, "setOriginalClockId:", 0);
}

- (void)setDaysWithTwoValidAssistantTurnsPerWeek:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_daysWithTwoValidAssistantTurnsPerWeek = a3;
}

- (BOOL)hasDaysWithTwoValidAssistantTurnsPerWeek
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDaysWithTwoValidAssistantTurnsPerWeek:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDaysWithTwoValidAssistantTurnsPerWeek
{
  -[ODBATCHSiriSchemaODBATCHDataReported setDaysWithTwoValidAssistantTurnsPerWeek:](self, "setDaysWithTwoValidAssistantTurnsPerWeek:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDaysWithTwoAssistantSpeechRequestsPerWeek:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_daysWithTwoAssistantSpeechRequestsPerWeek = a3;
}

- (BOOL)hasDaysWithTwoAssistantSpeechRequestsPerWeek
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDaysWithTwoAssistantSpeechRequestsPerWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDaysWithTwoAssistantSpeechRequestsPerWeek
{
  -[ODBATCHSiriSchemaODBATCHDataReported setDaysWithTwoAssistantSpeechRequestsPerWeek:](self, "setDaysWithTwoAssistantSpeechRequestsPerWeek:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaODBATCHDataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $02D520F6C6BCB9EC5D6012E047627FA1 has;
  unsigned int v14;
  unsigned int daysWithTwoValidAssistantTurnsPerWeek;
  int v16;
  unsigned int daysWithTwoAssistantSpeechRequestsPerWeek;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalClockId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalClockId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    daysWithTwoValidAssistantTurnsPerWeek = self->_daysWithTwoValidAssistantTurnsPerWeek;
    if (daysWithTwoValidAssistantTurnsPerWeek == objc_msgSend(v4, "daysWithTwoValidAssistantTurnsPerWeek"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    daysWithTwoAssistantSpeechRequestsPerWeek = self->_daysWithTwoAssistantSpeechRequestsPerWeek;
    if (daysWithTwoAssistantSpeechRequestsPerWeek != objc_msgSend(v4, "daysWithTwoAssistantSpeechRequestsPerWeek"))goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_originalClockId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_daysWithTwoValidAssistantTurnsPerWeek;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_daysWithTwoAssistantSpeechRequestsPerWeek;
  return v4 ^ v3 ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODBATCHSiriSchemaODBATCHDataReported daysWithTwoAssistantSpeechRequestsPerWeek](self, "daysWithTwoAssistantSpeechRequestsPerWeek"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("daysWithTwoAssistantSpeechRequestsPerWeek"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODBATCHSiriSchemaODBATCHDataReported daysWithTwoValidAssistantTurnsPerWeek](self, "daysWithTwoValidAssistantTurnsPerWeek"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("daysWithTwoValidAssistantTurnsPerWeek"));

  }
  if (self->_originalClockId)
  {
    -[ODBATCHSiriSchemaODBATCHDataReported originalClockId](self, "originalClockId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalClockId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalClockId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODBATCHSiriSchemaODBATCHDataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODBATCHSiriSchemaODBATCHDataReported)initWithJSON:(id)a3
{
  void *v4;
  ODBATCHSiriSchemaODBATCHDataReported *v5;
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
    self = -[ODBATCHSiriSchemaODBATCHDataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODBATCHSiriSchemaODBATCHDataReported)initWithDictionary:(id)a3
{
  id v4;
  ODBATCHSiriSchemaODBATCHDataReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  ODBATCHSiriSchemaODBATCHDataReported *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODBATCHSiriSchemaODBATCHDataReported;
  v5 = -[ODBATCHSiriSchemaODBATCHDataReported init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalClockId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ODBATCHSiriSchemaODBATCHDataReported setOriginalClockId:](v5, "setOriginalClockId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysWithTwoValidAssistantTurnsPerWeek"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODBATCHSiriSchemaODBATCHDataReported setDaysWithTwoValidAssistantTurnsPerWeek:](v5, "setDaysWithTwoValidAssistantTurnsPerWeek:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysWithTwoAssistantSpeechRequestsPerWeek"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODBATCHSiriSchemaODBATCHDataReported setDaysWithTwoAssistantSpeechRequestsPerWeek:](v5, "setDaysWithTwoAssistantSpeechRequestsPerWeek:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalClockId
{
  return self->_originalClockId;
}

- (void)setOriginalClockId:(id)a3
{
  objc_storeStrong((id *)&self->_originalClockId, a3);
}

- (unsigned)daysWithTwoValidAssistantTurnsPerWeek
{
  return self->_daysWithTwoValidAssistantTurnsPerWeek;
}

- (unsigned)daysWithTwoAssistantSpeechRequestsPerWeek
{
  return self->_daysWithTwoAssistantSpeechRequestsPerWeek;
}

- (void)setHasOriginalClockId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalClockId, 0);
}

@end
