@implementation CLPInstSchemaCLPCDMReplaySampleStarted

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
  v13.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPCDMReplaySampleStarted deleteOriginalRequestId](self, "deleteOriginalRequestId");
  -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CLPInstSchemaCLPCDMReplaySampleStarted deleteTrpId](self, "deleteTrpId");

  return v5;
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[CLPInstSchemaCLPCDMReplaySampleStarted setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[CLPInstSchemaCLPCDMReplaySampleStarted setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (void)setUtteranceRepetitionsInCalendarWeek:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_utteranceRepetitionsInCalendarWeek = a3;
}

- (BOOL)hasUtteranceRepetitionsInCalendarWeek
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUtteranceRepetitionsInCalendarWeek:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUtteranceRepetitionsInCalendarWeek
{
  -[CLPInstSchemaCLPCDMReplaySampleStarted setUtteranceRepetitionsInCalendarWeek:](self, "setUtteranceRepetitionsInCalendarWeek:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wasHabitualUserDuringCalendarWeek = a3;
}

- (BOOL)hasWasHabitualUserDuringCalendarWeek
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteWasHabitualUserDuringCalendarWeek
{
  -[CLPInstSchemaCLPCDMReplaySampleStarted setWasHabitualUserDuringCalendarWeek:](self, "setWasHabitualUserDuringCalendarWeek:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[CLPInstSchemaCLPCDMReplaySampleStarted setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplaySampleStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPCDMReplaySampleStarted resultCandidateId](self, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  $F5B8DC446DBA91C7F9A364DF2A550771 has;
  unsigned int v18;
  unsigned int utteranceRepetitionsInCalendarWeek;
  int v20;
  int wasHabitualUserDuringCalendarWeek;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  -[CLPInstSchemaCLPCDMReplaySampleStarted resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[CLPInstSchemaCLPCDMReplaySampleStarted resultCandidateId](self, "resultCandidateId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CLPInstSchemaCLPCDMReplaySampleStarted resultCandidateId](self, "resultCandidateId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    utteranceRepetitionsInCalendarWeek = self->_utteranceRepetitionsInCalendarWeek;
    if (utteranceRepetitionsInCalendarWeek != objc_msgSend(v4, "utteranceRepetitionsInCalendarWeek"))
      goto LABEL_24;
    has = self->_has;
    v18 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_24;
  if (v20)
  {
    wasHabitualUserDuringCalendarWeek = self->_wasHabitualUserDuringCalendarWeek;
    if (wasHabitualUserDuringCalendarWeek != objc_msgSend(v4, "wasHabitualUserDuringCalendarWeek"))
      goto LABEL_24;
  }
  -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

LABEL_27:
    v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v27 = 0;
LABEL_25:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  v4 = -[NSString hash](self->_resultCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_utteranceRepetitionsInCalendarWeek;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_trpId, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_wasHabitualUserDuringCalendarWeek;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_trpId, "hash");
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
  char has;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_originalRequestId)
  {
    -[CLPInstSchemaCLPCDMReplaySampleStarted originalRequestId](self, "originalRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originalRequestId"));

    }
  }
  if (self->_resultCandidateId)
  {
    -[CLPInstSchemaCLPCDMReplaySampleStarted resultCandidateId](self, "resultCandidateId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("resultCandidateId"));

  }
  if (self->_trpId)
  {
    -[CLPInstSchemaCLPCDMReplaySampleStarted trpId](self, "trpId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trpId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPCDMReplaySampleStarted utteranceRepetitionsInCalendarWeek](self, "utteranceRepetitionsInCalendarWeek"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("utteranceRepetitionsInCalendarWeek"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPCDMReplaySampleStarted wasHabitualUserDuringCalendarWeek](self, "wasHabitualUserDuringCalendarWeek"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("wasHabitualUserDuringCalendarWeek"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCDMReplaySampleStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCDMReplaySampleStarted *v5;
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
    self = -[CLPInstSchemaCLPCDMReplaySampleStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCDMReplaySampleStarted *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  CLPInstSchemaCLPCDMReplaySampleStarted *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleStarted;
  v5 = -[CLPInstSchemaCLPCDMReplaySampleStarted init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CLPInstSchemaCLPCDMReplaySampleStarted setOriginalRequestId:](v5, "setOriginalRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[CLPInstSchemaCLPCDMReplaySampleStarted setResultCandidateId:](v5, "setResultCandidateId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceRepetitionsInCalendarWeek"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCDMReplaySampleStarted setUtteranceRepetitionsInCalendarWeek:](v5, "setUtteranceRepetitionsInCalendarWeek:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasHabitualUserDuringCalendarWeek"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCDMReplaySampleStarted setWasHabitualUserDuringCalendarWeek:](v5, "setWasHabitualUserDuringCalendarWeek:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[CLPInstSchemaCLPCDMReplaySampleStarted setTrpId:](v5, "setTrpId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)utteranceRepetitionsInCalendarWeek
{
  return self->_utteranceRepetitionsInCalendarWeek;
}

- (BOOL)wasHabitualUserDuringCalendarWeek
{
  return self->_wasHabitualUserDuringCalendarWeek;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
}

@end
