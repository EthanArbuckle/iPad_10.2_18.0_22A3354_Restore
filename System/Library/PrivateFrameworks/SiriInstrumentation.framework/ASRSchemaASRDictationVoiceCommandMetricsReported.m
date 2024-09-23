@implementation ASRSchemaASRDictationVoiceCommandMetricsReported

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
  v16.super_class = (Class)ASRSchemaASRDictationVoiceCommandMetricsReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRDictationVoiceCommandMetricsReported deleteVoiceCommandId](self, "deleteVoiceCommandId");
  -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ASRSchemaASRDictationVoiceCommandMetricsReported deleteRecognitionResultLinkId](self, "deleteRecognitionResultLinkId");
  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ASRSchemaASRDictationVoiceCommandMetricsReported deleteDictationVoiceCommandLinkId](self, "deleteDictationVoiceCommandLinkId");

  return v5;
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

- (void)deleteVoiceCommandId
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setVoiceCommandId:](self, "setVoiceCommandId:", 0);
}

- (void)setCommandEndTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_commandEndTimeInNs = a3;
}

- (BOOL)hasCommandEndTimeInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCommandEndTimeInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCommandEndTimeInNs
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandEndTimeInNs:](self, "setCommandEndTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCommandParserStartTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_commandParserStartTimeInNs = a3;
}

- (BOOL)hasCommandParserStartTimeInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCommandParserStartTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCommandParserStartTimeInNs
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserStartTimeInNs:](self, "setCommandParserStartTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCommandParserEndTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_commandParserEndTimeInNs = a3;
}

- (BOOL)hasCommandParserEndTimeInNs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCommandParserEndTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCommandParserEndTimeInNs
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserEndTimeInNs:](self, "setCommandParserEndTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setUtteranceStartTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_utteranceStartTimeInNs = a3;
}

- (BOOL)hasUtteranceStartTimeInNs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasUtteranceStartTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteUtteranceStartTimeInNs
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceStartTimeInNs:](self, "setUtteranceStartTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setUtteranceEndTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_utteranceEndTimeInNs = a3;
}

- (BOOL)hasUtteranceEndTimeInNs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasUtteranceEndTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteUtteranceEndTimeInNs
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceEndTimeInNs:](self, "setUtteranceEndTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasRecognitionResultLinkId
{
  return self->_recognitionResultLinkId != 0;
}

- (void)deleteRecognitionResultLinkId
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setRecognitionResultLinkId:](self, "setRecognitionResultLinkId:", 0);
}

- (BOOL)hasDictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId != 0;
}

- (void)deleteDictationVoiceCommandLinkId
{
  -[ASRSchemaASRDictationVoiceCommandMetricsReported setDictationVoiceCommandLinkId:](self, "setDictationVoiceCommandLinkId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRDictationVoiceCommandMetricsReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteUint64Field();
LABEL_9:
  -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
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
  $624CFD93D76B45E4603A0DD6940BEB43 has;
  unsigned int v13;
  unint64_t commandEndTimeInNs;
  int v15;
  unint64_t commandParserStartTimeInNs;
  int v17;
  unint64_t commandParserEndTimeInNs;
  int v19;
  unint64_t utteranceStartTimeInNs;
  int v21;
  unint64_t utteranceEndTimeInNs;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommandId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_36;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_36;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    commandEndTimeInNs = self->_commandEndTimeInNs;
    if (commandEndTimeInNs != objc_msgSend(v4, "commandEndTimeInNs"))
      goto LABEL_36;
    has = self->_has;
    v13 = v4[72];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_36;
  if (v15)
  {
    commandParserStartTimeInNs = self->_commandParserStartTimeInNs;
    if (commandParserStartTimeInNs != objc_msgSend(v4, "commandParserStartTimeInNs"))
      goto LABEL_36;
    has = self->_has;
    v13 = v4[72];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_36;
  if (v17)
  {
    commandParserEndTimeInNs = self->_commandParserEndTimeInNs;
    if (commandParserEndTimeInNs != objc_msgSend(v4, "commandParserEndTimeInNs"))
      goto LABEL_36;
    has = self->_has;
    v13 = v4[72];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_36;
  if (v19)
  {
    utteranceStartTimeInNs = self->_utteranceStartTimeInNs;
    if (utteranceStartTimeInNs != objc_msgSend(v4, "utteranceStartTimeInNs"))
      goto LABEL_36;
    has = self->_has;
    v13 = v4[72];
  }
  v21 = (*(unsigned int *)&has >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1))
    goto LABEL_36;
  if (v21)
  {
    utteranceEndTimeInNs = self->_utteranceEndTimeInNs;
    if (utteranceEndTimeInNs != objc_msgSend(v4, "utteranceEndTimeInNs"))
      goto LABEL_36;
  }
  -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognitionResultLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognitionResultLinkId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_36;
  }
  else
  {

  }
  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationVoiceCommandLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_39:
    v33 = 1;
    goto LABEL_37;
  }
  v29 = (void *)v28;
  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationVoiceCommandLinkId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_39;
LABEL_36:
  v33 = 0;
LABEL_37:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SISchemaUUID hash](self->_voiceCommandId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761u * self->_commandEndTimeInNs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_commandParserStartTimeInNs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_commandParserEndTimeInNs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761u * self->_utteranceStartTimeInNs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761u * self->_utteranceEndTimeInNs;
LABEL_12:
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[SISchemaUUID hash](self->_recognitionResultLinkId, "hash");
  return v9 ^ -[SISchemaUUID hash](self->_dictationVoiceCommandLinkId, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandEndTimeInNs](self, "commandEndTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("commandEndTimeInNs"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandParserEndTimeInNs](self, "commandParserEndTimeInNs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("commandParserEndTimeInNs"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported commandParserStartTimeInNs](self, "commandParserStartTimeInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandParserStartTimeInNs"));

  }
LABEL_5:
  if (self->_dictationVoiceCommandLinkId)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dictationVoiceCommandLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dictationVoiceCommandLinkId"));

    }
  }
  if (self->_recognitionResultLinkId)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported recognitionResultLinkId](self, "recognitionResultLinkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("recognitionResultLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("recognitionResultLinkId"));

    }
  }
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported utteranceEndTimeInNs](self, "utteranceEndTimeInNs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("utteranceEndTimeInNs"));

    v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRDictationVoiceCommandMetricsReported utteranceStartTimeInNs](self, "utteranceStartTimeInNs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("utteranceStartTimeInNs"));

  }
  if (self->_voiceCommandId)
  {
    -[ASRSchemaASRDictationVoiceCommandMetricsReported voiceCommandId](self, "voiceCommandId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("voiceCommandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("voiceCommandId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRDictationVoiceCommandMetricsReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRDictationVoiceCommandMetricsReported *v5;
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
    self = -[ASRSchemaASRDictationVoiceCommandMetricsReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRDictationVoiceCommandMetricsReported)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRDictationVoiceCommandMetricsReported *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaUUID *v14;
  void *v15;
  SISchemaUUID *v16;
  ASRSchemaASRDictationVoiceCommandMetricsReported *v17;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASRSchemaASRDictationVoiceCommandMetricsReported;
  v5 = -[ASRSchemaASRDictationVoiceCommandMetricsReported init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceCommandId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setVoiceCommandId:](v5, "setVoiceCommandId:", v7);

    }
    v19 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandEndTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandEndTimeInNs:](v5, "setCommandEndTimeInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandParserStartTimeInNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserStartTimeInNs:](v5, "setCommandParserStartTimeInNs:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandParserEndTimeInNs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setCommandParserEndTimeInNs:](v5, "setCommandParserEndTimeInNs:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceStartTimeInNs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceStartTimeInNs:](v5, "setUtteranceStartTimeInNs:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceEndTimeInNs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setUtteranceEndTimeInNs:](v5, "setUtteranceEndTimeInNs:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionResultLinkId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v13);
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setRecognitionResultLinkId:](v5, "setRecognitionResultLinkId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationVoiceCommandLinkId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[ASRSchemaASRDictationVoiceCommandMetricsReported setDictationVoiceCommandLinkId:](v5, "setDictationVoiceCommandLinkId:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (void)setVoiceCommandId:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommandId, a3);
}

- (unint64_t)commandEndTimeInNs
{
  return self->_commandEndTimeInNs;
}

- (unint64_t)commandParserStartTimeInNs
{
  return self->_commandParserStartTimeInNs;
}

- (unint64_t)commandParserEndTimeInNs
{
  return self->_commandParserEndTimeInNs;
}

- (unint64_t)utteranceStartTimeInNs
{
  return self->_utteranceStartTimeInNs;
}

- (unint64_t)utteranceEndTimeInNs
{
  return self->_utteranceEndTimeInNs;
}

- (SISchemaUUID)recognitionResultLinkId
{
  return self->_recognitionResultLinkId;
}

- (void)setRecognitionResultLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionResultLinkId, a3);
}

- (SISchemaUUID)dictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId;
}

- (void)setDictationVoiceCommandLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, a3);
}

- (void)setHasVoiceCommandId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRecognitionResultLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, 0);
  objc_storeStrong((id *)&self->_recognitionResultLinkId, 0);
  objc_storeStrong((id *)&self->_voiceCommandId, 0);
}

@end
