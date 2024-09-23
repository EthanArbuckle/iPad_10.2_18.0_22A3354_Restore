@implementation RGSiriSchemaRGRequestEnded

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
  v13.super_class = (Class)RGSiriSchemaRGRequestEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RGSiriSchemaRGRequestEnded deleteLinkId](self, "deleteLinkId");
  -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RGSiriSchemaRGRequestEnded deleteTranscriptEventId](self, "deleteTranscriptEventId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[RGSiriSchemaRGRequestEnded setLinkId:](self, "setLinkId:", 0);
}

- (void)setResponseSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseSource = a3;
}

- (BOOL)hasResponseSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResponseSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResponseSource
{
  -[RGSiriSchemaRGRequestEnded setResponseSource:](self, "setResponseSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCharacterCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_characterCount = a3;
}

- (BOOL)hasCharacterCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCharacterCount
{
  -[RGSiriSchemaRGRequestEnded setCharacterCount:](self, "setCharacterCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setWordCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wordCount = a3;
}

- (BOOL)hasWordCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasWordCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteWordCount
{
  -[RGSiriSchemaRGRequestEnded setWordCount:](self, "setWordCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setFallbackReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fallbackReason = a3;
}

- (BOOL)hasFallbackReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasFallbackReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteFallbackReason
{
  -[RGSiriSchemaRGRequestEnded setFallbackReason:](self, "setFallbackReason:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasTranscriptEventId
{
  return self->_transcriptEventId != 0;
}

- (void)deleteTranscriptEventId
{
  -[RGSiriSchemaRGRequestEnded setTranscriptEventId:](self, "setTranscriptEventId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
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
  $D49F5C6C553453FE73735A0F5CD3A9C4 has;
  unsigned int v13;
  int responseSource;
  int v15;
  unsigned int characterCount;
  int v17;
  unsigned int wordCount;
  int v19;
  int fallbackReason;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    responseSource = self->_responseSource;
    if (responseSource != objc_msgSend(v4, "responseSource"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    characterCount = self->_characterCount;
    if (characterCount != objc_msgSend(v4, "characterCount"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_27;
  if (v17)
  {
    wordCount = self->_wordCount;
    if (wordCount != objc_msgSend(v4, "wordCount"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_27;
  if (v19)
  {
    fallbackReason = self->_fallbackReason;
    if (fallbackReason != objc_msgSend(v4, "fallbackReason"))
      goto LABEL_27;
  }
  -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

LABEL_30:
    v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEventId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if ((v25 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v26 = 0;
LABEL_28:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_responseSource;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_characterCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[SISchemaUUID hash](self->_transcriptEventId, "hash");
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_wordCount;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_fallbackReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[SISchemaUUID hash](self->_transcriptEventId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RGSiriSchemaRGRequestEnded characterCount](self, "characterCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("characterCount"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = -[RGSiriSchemaRGRequestEnded fallbackReason](self, "fallbackReason") - 1;
    if (v6 > 9)
      v7 = CFSTR("RGFALLBACKREASON_UNKNOWN");
    else
      v7 = off_1E563D738[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fallbackReason"));
  }
  if (self->_linkId)
  {
    -[RGSiriSchemaRGRequestEnded linkId](self, "linkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = -[RGSiriSchemaRGRequestEnded responseSource](self, "responseSource") - 1;
    if (v11 > 5)
      v12 = CFSTR("RGRESPONSESOURCE_UNKNOWN");
    else
      v12 = off_1E563D788[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("responseSource"));
  }
  if (self->_transcriptEventId)
  {
    -[RGSiriSchemaRGRequestEnded transcriptEventId](self, "transcriptEventId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("transcriptEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("transcriptEventId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RGSiriSchemaRGRequestEnded wordCount](self, "wordCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("wordCount"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RGSiriSchemaRGRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RGSiriSchemaRGRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  RGSiriSchemaRGRequestEnded *v5;
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
    self = -[RGSiriSchemaRGRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RGSiriSchemaRGRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  RGSiriSchemaRGRequestEnded *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  RGSiriSchemaRGRequestEnded *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RGSiriSchemaRGRequestEnded;
  v5 = -[RGSiriSchemaRGRequestEnded init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[RGSiriSchemaRGRequestEnded setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RGSiriSchemaRGRequestEnded setResponseSource:](v5, "setResponseSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characterCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RGSiriSchemaRGRequestEnded setCharacterCount:](v5, "setCharacterCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wordCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RGSiriSchemaRGRequestEnded setWordCount:](v5, "setWordCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fallbackReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RGSiriSchemaRGRequestEnded setFallbackReason:](v5, "setFallbackReason:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transcriptEventId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[RGSiriSchemaRGRequestEnded setTranscriptEventId:](v5, "setTranscriptEventId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (int)responseSource
{
  return self->_responseSource;
}

- (unsigned)characterCount
{
  return self->_characterCount;
}

- (unsigned)wordCount
{
  return self->_wordCount;
}

- (int)fallbackReason
{
  return self->_fallbackReason;
}

- (SISchemaUUID)transcriptEventId
{
  return self->_transcriptEventId;
}

- (void)setTranscriptEventId:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptEventId, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTranscriptEventId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptEventId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
