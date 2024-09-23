@implementation LTSchemaBatchTranslationEvent

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
  v13.super_class = (Class)LTSchemaBatchTranslationEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTSchemaBatchTranslationEvent task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LTSchemaBatchTranslationEvent deleteTask](self, "deleteTask");
  -[LTSchemaBatchTranslationEvent error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LTSchemaBatchTranslationEvent deleteError](self, "deleteError");

  return v5;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteTask
{
  -[LTSchemaBatchTranslationEvent setTask:](self, "setTask:", 0);
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)deleteSessionID
{
  -[LTSchemaBatchTranslationEvent setSessionID:](self, "setSessionID:", 0);
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaBatchTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

- (void)deleteSystemLocale
{
  -[LTSchemaBatchTranslationEvent setSystemLocale:](self, "setSystemLocale:", 0);
}

- (void)setBatchSeqNo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_batchSeqNo = a3;
}

- (BOOL)hasBatchSeqNo
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBatchSeqNo:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBatchSeqNo
{
  -[LTSchemaBatchTranslationEvent setBatchSeqNo:](self, "setBatchSeqNo:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumberOfParagraphs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfParagraphs = a3;
}

- (BOOL)hasNumberOfParagraphs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfParagraphs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumberOfParagraphs
{
  -[LTSchemaBatchTranslationEvent setNumberOfParagraphs:](self, "setNumberOfParagraphs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setResponseTimeMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_responseTimeMs = a3;
}

- (BOOL)hasResponseTimeMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasResponseTimeMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteResponseTimeMs
{
  -[LTSchemaBatchTranslationEvent setResponseTimeMs:](self, "setResponseTimeMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumParagraphFailures:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numParagraphFailures = a3;
}

- (BOOL)hasNumParagraphFailures
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumParagraphFailures:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumParagraphFailures
{
  -[LTSchemaBatchTranslationEvent setNumParagraphFailures:](self, "setNumParagraphFailures:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[LTSchemaBatchTranslationEvent setError:](self, "setError:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaBatchTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[LTSchemaBatchTranslationEvent task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTSchemaBatchTranslationEvent task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaBatchTranslationEvent sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[LTSchemaBatchTranslationEvent requestID](self, "requestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[LTSchemaBatchTranslationEvent systemLocale](self, "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field();
LABEL_14:
  -[LTSchemaBatchTranslationEvent error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[LTSchemaBatchTranslationEvent error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
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
  $613A9DD8B06BD4489BDD94EA1AE706A4 has;
  unsigned int v28;
  unsigned int batchSeqNo;
  int v30;
  unsigned int numberOfParagraphs;
  int v32;
  unsigned int responseTimeMs;
  int v34;
  unsigned int numParagraphFailures;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[LTSchemaBatchTranslationEvent task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[LTSchemaBatchTranslationEvent task](self, "task");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaBatchTranslationEvent task](self, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[LTSchemaBatchTranslationEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[LTSchemaBatchTranslationEvent sessionID](self, "sessionID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaBatchTranslationEvent sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[LTSchemaBatchTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[LTSchemaBatchTranslationEvent requestID](self, "requestID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LTSchemaBatchTranslationEvent requestID](self, "requestID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[LTSchemaBatchTranslationEvent systemLocale](self, "systemLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[LTSchemaBatchTranslationEvent systemLocale](self, "systemLocale");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[LTSchemaBatchTranslationEvent systemLocale](self, "systemLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  has = self->_has;
  v28 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v28 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    batchSeqNo = self->_batchSeqNo;
    if (batchSeqNo != objc_msgSend(v4, "batchSeqNo"))
      goto LABEL_42;
    has = self->_has;
    v28 = v4[64];
  }
  v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_42;
  if (v30)
  {
    numberOfParagraphs = self->_numberOfParagraphs;
    if (numberOfParagraphs != objc_msgSend(v4, "numberOfParagraphs"))
      goto LABEL_42;
    has = self->_has;
    v28 = v4[64];
  }
  v32 = (*(unsigned int *)&has >> 2) & 1;
  if (v32 != ((v28 >> 2) & 1))
    goto LABEL_42;
  if (v32)
  {
    responseTimeMs = self->_responseTimeMs;
    if (responseTimeMs != objc_msgSend(v4, "responseTimeMs"))
      goto LABEL_42;
    has = self->_has;
    v28 = v4[64];
  }
  v34 = (*(unsigned int *)&has >> 3) & 1;
  if (v34 != ((v28 >> 3) & 1))
    goto LABEL_42;
  if (v34)
  {
    numParagraphFailures = self->_numParagraphFailures;
    if (numParagraphFailures != objc_msgSend(v4, "numParagraphFailures"))
      goto LABEL_42;
  }
  -[LTSchemaBatchTranslationEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  -[LTSchemaBatchTranslationEvent error](self, "error");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {

LABEL_45:
    v41 = 1;
    goto LABEL_43;
  }
  v37 = (void *)v36;
  -[LTSchemaBatchTranslationEvent error](self, "error");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqual:", v39);

  if ((v40 & 1) != 0)
    goto LABEL_45;
LABEL_42:
  v41 = 0;
LABEL_43:

  return v41;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[LTSchemaTask hash](self->_task, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash");
  v5 = -[NSString hash](self->_requestID, "hash");
  v6 = -[NSString hash](self->_systemLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_batchSeqNo;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_numberOfParagraphs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[LTSchemaError hash](self->_error, "hash");
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v9 = 2654435761 * self->_responseTimeMs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v10 = 2654435761 * self->_numParagraphFailures;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[LTSchemaError hash](self->_error, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent batchSeqNo](self, "batchSeqNo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("batchSeqNo"));

  }
  if (self->_error)
  {
    -[LTSchemaBatchTranslationEvent error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("error"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("error"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent numParagraphFailures](self, "numParagraphFailures"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numParagraphFailures"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent numberOfParagraphs](self, "numberOfParagraphs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numberOfParagraphs"));

  }
  if (self->_requestID)
  {
    -[LTSchemaBatchTranslationEvent requestID](self, "requestID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestID"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent responseTimeMs](self, "responseTimeMs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("responseTimeMs"));

  }
  if (self->_sessionID)
  {
    -[LTSchemaBatchTranslationEvent sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sessionID"));

  }
  if (self->_systemLocale)
  {
    -[LTSchemaBatchTranslationEvent systemLocale](self, "systemLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("systemLocale"));

  }
  if (self->_task)
  {
    -[LTSchemaBatchTranslationEvent task](self, "task");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("task"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("task"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaBatchTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaBatchTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaBatchTranslationEvent *v5;
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
    self = -[LTSchemaBatchTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaBatchTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaBatchTranslationEvent *v5;
  uint64_t v6;
  LTSchemaTask *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  LTSchemaError *v19;
  LTSchemaBatchTranslationEvent *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LTSchemaBatchTranslationEvent;
  v5 = -[LTSchemaBatchTranslationEvent init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LTSchemaTask initWithDictionary:]([LTSchemaTask alloc], "initWithDictionary:", v6);
      -[LTSchemaBatchTranslationEvent setTask:](v5, "setTask:", v7);

    }
    v23 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaBatchTranslationEvent setSessionID:](v5, "setSessionID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[LTSchemaBatchTranslationEvent setRequestID:](v5, "setRequestID:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[LTSchemaBatchTranslationEvent setSystemLocale:](v5, "setSystemLocale:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchSeqNo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaBatchTranslationEvent setBatchSeqNo:](v5, "setBatchSeqNo:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfParagraphs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaBatchTranslationEvent setNumberOfParagraphs:](v5, "setNumberOfParagraphs:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseTimeMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaBatchTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numParagraphFailures"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaBatchTranslationEvent setNumParagraphFailures:](v5, "setNumParagraphFailures:", objc_msgSend(v17, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[LTSchemaError initWithDictionary:]([LTSchemaError alloc], "initWithDictionary:", v18);
      -[LTSchemaBatchTranslationEvent setError:](v5, "setError:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (LTSchemaTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (void)setSystemLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)batchSeqNo
{
  return self->_batchSeqNo;
}

- (unsigned)numberOfParagraphs
{
  return self->_numberOfParagraphs;
}

- (unsigned)responseTimeMs
{
  return self->_responseTimeMs;
}

- (unsigned)numParagraphFailures
{
  return self->_numParagraphFailures;
}

- (LTSchemaError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setHasTask:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
