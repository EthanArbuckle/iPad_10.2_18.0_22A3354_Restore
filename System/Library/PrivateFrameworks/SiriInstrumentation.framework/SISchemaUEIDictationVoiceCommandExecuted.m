@implementation SISchemaUEIDictationVoiceCommandExecuted

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
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandExecuted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaUEIDictationVoiceCommandExecuted deleteVoiceCommandId](self, "deleteVoiceCommandId");
  return v5;
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

- (void)deleteVoiceCommandId
{
  -[SISchemaUEIDictationVoiceCommandExecuted setVoiceCommandId:](self, "setVoiceCommandId:", 0);
}

- (void)setCommandStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_commandStatus = a3;
}

- (BOOL)hasCommandStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCommandStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCommandStatus
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandStatus:](self, "setCommandStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCommandType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_commandType = a3;
}

- (BOOL)hasCommandType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCommandType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCommandType
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandType:](self, "setCommandType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCommandTargetWordCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_commandTargetWordCount = a3;
}

- (BOOL)hasCommandTargetWordCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCommandTargetWordCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCommandTargetWordCount
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetWordCount:](self, "setCommandTargetWordCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCommandPayloadWordCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_commandPayloadWordCount = a3;
}

- (BOOL)hasCommandPayloadWordCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCommandPayloadWordCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCommandPayloadWordCount
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadWordCount:](self, "setCommandPayloadWordCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setCommandTargetCharacterCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_commandTargetCharacterCount = a3;
}

- (BOOL)hasCommandTargetCharacterCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasCommandTargetCharacterCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteCommandTargetCharacterCount
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetCharacterCount:](self, "setCommandTargetCharacterCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setCommandPayloadCharacterCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_commandPayloadCharacterCount = a3;
}

- (BOOL)hasCommandPayloadCharacterCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasCommandPayloadCharacterCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteCommandPayloadCharacterCount
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadCharacterCount:](self, "setCommandPayloadCharacterCount:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setCommandExecutionStartTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_commandExecutionStartTimeInNs = a3;
}

- (BOOL)hasCommandExecutionStartTimeInNs
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasCommandExecutionStartTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteCommandExecutionStartTimeInNs
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionStartTimeInNs:](self, "setCommandExecutionStartTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setCommandExecutionEndTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_commandExecutionEndTimeInNs = a3;
}

- (BOOL)hasCommandExecutionEndTimeInNs
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasCommandExecutionEndTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteCommandExecutionEndTimeInNs
{
  -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionEndTimeInNs:](self, "setCommandExecutionEndTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandExecutedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
LABEL_18:
    PBDataWriterWriteUint64Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_12;
LABEL_19:
    PBDataWriterWriteUint64Field();
    v7 = v8;
    goto LABEL_12;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_18;
LABEL_11:
  if (has < 0)
    goto LABEL_19;
LABEL_12:

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
  $DA52C4A8304ABE849CAB3344C73C7BE3 has;
  unsigned int v14;
  int commandStatus;
  int v16;
  int commandType;
  int v18;
  unint64_t commandTargetWordCount;
  int v20;
  unint64_t commandPayloadWordCount;
  int v22;
  unint64_t commandTargetCharacterCount;
  int v24;
  unint64_t commandPayloadCharacterCount;
  int v26;
  unint64_t commandExecutionStartTimeInNs;
  unint64_t commandExecutionEndTimeInNs;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_40;
  }
  -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommandId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_40;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_40:
    v29 = 0;
    goto LABEL_41;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    commandStatus = self->_commandStatus;
    if (commandStatus != objc_msgSend(v4, "commandStatus"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_40;
  if (v16)
  {
    commandType = self->_commandType;
    if (commandType != objc_msgSend(v4, "commandType"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_40;
  if (v18)
  {
    commandTargetWordCount = self->_commandTargetWordCount;
    if (commandTargetWordCount != objc_msgSend(v4, "commandTargetWordCount"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_40;
  if (v20)
  {
    commandPayloadWordCount = self->_commandPayloadWordCount;
    if (commandPayloadWordCount != objc_msgSend(v4, "commandPayloadWordCount"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_40;
  if (v22)
  {
    commandTargetCharacterCount = self->_commandTargetCharacterCount;
    if (commandTargetCharacterCount != objc_msgSend(v4, "commandTargetCharacterCount"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_40;
  if (v24)
  {
    commandPayloadCharacterCount = self->_commandPayloadCharacterCount;
    if (commandPayloadCharacterCount != objc_msgSend(v4, "commandPayloadCharacterCount"))
      goto LABEL_40;
    has = self->_has;
    v14 = v4[72];
  }
  v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_40;
  if (v26)
  {
    commandExecutionStartTimeInNs = self->_commandExecutionStartTimeInNs;
    if (commandExecutionStartTimeInNs == objc_msgSend(v4, "commandExecutionStartTimeInNs"))
    {
      has = self->_has;
      v14 = v4[72];
      goto LABEL_36;
    }
    goto LABEL_40;
  }
LABEL_36:
  if (((v14 ^ *(_DWORD *)&has) & 0x80) != 0)
    goto LABEL_40;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    commandExecutionEndTimeInNs = self->_commandExecutionEndTimeInNs;
    if (commandExecutionEndTimeInNs != objc_msgSend(v4, "commandExecutionEndTimeInNs"))
      goto LABEL_40;
  }
  v29 = 1;
LABEL_41:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[SISchemaUUID hash](self->_voiceCommandId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_commandStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_commandType;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
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
    v6 = 2654435761u * self->_commandTargetWordCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761u * self->_commandPayloadWordCount;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761u * self->_commandTargetCharacterCount;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_commandPayloadCharacterCount;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761u * self->_commandExecutionStartTimeInNs;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761u * self->_commandExecutionEndTimeInNs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if (has < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandExecutionEndTimeInNs](self, "commandExecutionEndTimeInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandExecutionEndTimeInNs"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandExecutionStartTimeInNs](self, "commandExecutionStartTimeInNs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commandExecutionStartTimeInNs"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandPayloadCharacterCount](self, "commandPayloadCharacterCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("commandPayloadCharacterCount"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandPayloadWordCount](self, "commandPayloadWordCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("commandPayloadWordCount"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_14:
  v9 = -[SISchemaUEIDictationVoiceCommandExecuted commandStatus](self, "commandStatus") - 1;
  if (v9 > 2)
    v10 = CFSTR("UEIVOICECOMMANDEXECUTIONSTATUS_UNKNOWN");
  else
    v10 = off_1E56372D8[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("commandStatus"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandTargetCharacterCount](self, "commandTargetCharacterCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("commandTargetCharacterCount"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_24;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaUEIDictationVoiceCommandExecuted commandTargetWordCount](self, "commandTargetWordCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("commandTargetWordCount"));

  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_24;
LABEL_20:
  v13 = -[SISchemaUEIDictationVoiceCommandExecuted commandType](self, "commandType") - 1;
  if (v13 > 0x25)
    v14 = CFSTR("UEIVOICECOMMANDTYPE_UNKNOWN");
  else
    v14 = off_1E56372F0[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("commandType"));
LABEL_24:
  if (self->_voiceCommandId)
  {
    -[SISchemaUEIDictationVoiceCommandExecuted voiceCommandId](self, "voiceCommandId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("voiceCommandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("voiceCommandId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationVoiceCommandExecuted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationVoiceCommandExecuted)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationVoiceCommandExecuted *v5;
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
    self = -[SISchemaUEIDictationVoiceCommandExecuted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationVoiceCommandExecuted)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationVoiceCommandExecuted *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SISchemaUEIDictationVoiceCommandExecuted *v17;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaUEIDictationVoiceCommandExecuted;
  v5 = -[SISchemaUEIDictationVoiceCommandExecuted init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceCommandId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaUEIDictationVoiceCommandExecuted setVoiceCommandId:](v5, "setVoiceCommandId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandStatus:](v5, "setCommandStatus:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandType:](v5, "setCommandType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandTargetWordCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetWordCount:](v5, "setCommandTargetWordCount:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandPayloadWordCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadWordCount:](v5, "setCommandPayloadWordCount:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandTargetCharacterCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandTargetCharacterCount:](v5, "setCommandTargetCharacterCount:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandPayloadCharacterCount"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandPayloadCharacterCount:](v5, "setCommandPayloadCharacterCount:", objc_msgSend(v13, "unsignedLongLongValue"));
    v14 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandExecutionStartTimeInNs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionStartTimeInNs:](v5, "setCommandExecutionStartTimeInNs:", objc_msgSend(v15, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandExecutionEndTimeInNs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandExecuted setCommandExecutionEndTimeInNs:](v5, "setCommandExecutionEndTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));
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

- (int)commandStatus
{
  return self->_commandStatus;
}

- (int)commandType
{
  return self->_commandType;
}

- (unint64_t)commandTargetWordCount
{
  return self->_commandTargetWordCount;
}

- (unint64_t)commandPayloadWordCount
{
  return self->_commandPayloadWordCount;
}

- (unint64_t)commandTargetCharacterCount
{
  return self->_commandTargetCharacterCount;
}

- (unint64_t)commandPayloadCharacterCount
{
  return self->_commandPayloadCharacterCount;
}

- (unint64_t)commandExecutionStartTimeInNs
{
  return self->_commandExecutionStartTimeInNs;
}

- (unint64_t)commandExecutionEndTimeInNs
{
  return self->_commandExecutionEndTimeInNs;
}

- (void)setHasVoiceCommandId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommandId, 0);
}

@end
