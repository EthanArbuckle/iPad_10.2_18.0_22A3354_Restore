@implementation SISchemaUEIDictationVoiceCommandKeyboardAction

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
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandKeyboardAction;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaUEIDictationVoiceCommandKeyboardAction deleteVoiceCommandId](self, "deleteVoiceCommandId");
  return v5;
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

- (void)deleteVoiceCommandId
{
  -[SISchemaUEIDictationVoiceCommandKeyboardAction setVoiceCommandId:](self, "setVoiceCommandId:", 0);
}

- (void)setInsertions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_insertions = a3;
}

- (BOOL)hasInsertions
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInsertions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInsertions
{
  -[SISchemaUEIDictationVoiceCommandKeyboardAction setInsertions:](self, "setInsertions:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSubstituted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_substituted = a3;
}

- (BOOL)hasSubstituted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSubstituted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSubstituted
{
  -[SISchemaUEIDictationVoiceCommandKeyboardAction setSubstituted:](self, "setSubstituted:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setDeleted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteDeleted
{
  -[SISchemaUEIDictationVoiceCommandKeyboardAction setDeleted:](self, "setDeleted:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAlgorithmStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_algorithmStatus = a3;
}

- (BOOL)hasAlgorithmStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAlgorithmStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAlgorithmStatus
{
  -[SISchemaUEIDictationVoiceCommandKeyboardAction setAlgorithmStatus:](self, "setAlgorithmStatus:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandKeyboardActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
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
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteUint32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }
LABEL_9:

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
  $CACD090B11F4A6915D1DDDEA2D7195C4 has;
  unsigned int v14;
  unsigned int insertions;
  int v16;
  unsigned int substituted;
  int v18;
  unsigned int deleted;
  int v20;
  unsigned int algorithmStatus;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommandId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    insertions = self->_insertions;
    if (insertions != objc_msgSend(v4, "insertions"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    substituted = self->_substituted;
    if (substituted != objc_msgSend(v4, "substituted"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    deleted = self->_deleted;
    if (deleted == objc_msgSend(v4, "deleted"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    algorithmStatus = self->_algorithmStatus;
    if (algorithmStatus != objc_msgSend(v4, "algorithmStatus"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_voiceCommandId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_insertions;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_substituted;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  v6 = 2654435761 * self->_deleted;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_algorithmStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction algorithmStatus](self, "algorithmStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("algorithmStatus"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction deleted](self, "deleted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deleted"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction insertions](self, "insertions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("insertions"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandKeyboardAction substituted](self, "substituted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("substituted"));

  }
LABEL_6:
  if (self->_voiceCommandId)
  {
    -[SISchemaUEIDictationVoiceCommandKeyboardAction voiceCommandId](self, "voiceCommandId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("voiceCommandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("voiceCommandId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationVoiceCommandKeyboardAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationVoiceCommandKeyboardAction *v5;
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
    self = -[SISchemaUEIDictationVoiceCommandKeyboardAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationVoiceCommandKeyboardAction)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationVoiceCommandKeyboardAction *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUEIDictationVoiceCommandKeyboardAction *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaUEIDictationVoiceCommandKeyboardAction;
  v5 = -[SISchemaUEIDictationVoiceCommandKeyboardAction init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceCommandId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setVoiceCommandId:](v5, "setVoiceCommandId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("insertions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setInsertions:](v5, "setInsertions:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("substituted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setSubstituted:](v5, "setSubstituted:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deleted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setDeleted:](v5, "setDeleted:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("algorithmStatus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandKeyboardAction setAlgorithmStatus:](v5, "setAlgorithmStatus:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

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

- (unsigned)insertions
{
  return self->_insertions;
}

- (unsigned)substituted
{
  return self->_substituted;
}

- (unsigned)deleted
{
  return self->_deleted;
}

- (unsigned)algorithmStatus
{
  return self->_algorithmStatus;
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
