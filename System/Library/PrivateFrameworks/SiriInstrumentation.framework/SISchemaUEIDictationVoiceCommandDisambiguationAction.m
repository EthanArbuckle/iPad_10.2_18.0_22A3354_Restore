@implementation SISchemaUEIDictationVoiceCommandDisambiguationAction

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
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandDisambiguationAction;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaUEIDictationVoiceCommandDisambiguationAction deleteVoiceCommandId](self, "deleteVoiceCommandId");
  return v5;
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

- (void)deleteVoiceCommandId
{
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction setVoiceCommandId:](self, "setVoiceCommandId:", 0);
}

- (void)setDisambiguationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_disambiguationType = a3;
}

- (BOOL)hasDisambiguationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDisambiguationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDisambiguationType
{
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationType:](self, "setDisambiguationType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDisambiguationIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_disambiguationIndex = a3;
}

- (BOOL)hasDisambiguationIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDisambiguationIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDisambiguationIndex
{
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationIndex:](self, "setDisambiguationIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTotalDisambiguationAlternatives:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalDisambiguationAlternatives = a3;
}

- (BOOL)hasTotalDisambiguationAlternatives
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTotalDisambiguationAlternatives:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTotalDisambiguationAlternatives
{
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction setTotalDisambiguationAlternatives:](self, "setTotalDisambiguationAlternatives:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandDisambiguationActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
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
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
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
  $658AE71E088695757E4BB06C3E4750EA has;
  unsigned int v14;
  int disambiguationType;
  int v16;
  unsigned int disambiguationIndex;
  int v18;
  unsigned int totalDisambiguationAlternatives;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommandId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    disambiguationType = self->_disambiguationType;
    if (disambiguationType != objc_msgSend(v4, "disambiguationType"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    disambiguationIndex = self->_disambiguationIndex;
    if (disambiguationIndex == objc_msgSend(v4, "disambiguationIndex"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    totalDisambiguationAlternatives = self->_totalDisambiguationAlternatives;
    if (totalDisambiguationAlternatives != objc_msgSend(v4, "totalDisambiguationAlternatives"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_voiceCommandId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_disambiguationType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_disambiguationIndex;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_totalDisambiguationAlternatives;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandDisambiguationAction disambiguationIndex](self, "disambiguationIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("disambiguationIndex"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = -[SISchemaUEIDictationVoiceCommandDisambiguationAction disambiguationType](self, "disambiguationType");
  v10 = CFSTR("UEIVOICECOMMANDDISAMBIGUATIONTYPE_UNKNOWN");
  if (v9 == 1)
    v10 = CFSTR("UEIVOICECOMMANDDISAMBIGUATIONTYPE_TAP");
  if (v9 == 2)
    v11 = CFSTR("UEIVOICECOMMANDDISAMBIGUATIONTYPE_GAZE");
  else
    v11 = v10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("disambiguationType"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaUEIDictationVoiceCommandDisambiguationAction totalDisambiguationAlternatives](self, "totalDisambiguationAlternatives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("totalDisambiguationAlternatives"));

  }
LABEL_5:
  if (self->_voiceCommandId)
  {
    -[SISchemaUEIDictationVoiceCommandDisambiguationAction voiceCommandId](self, "voiceCommandId");
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
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("voiceCommandId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationVoiceCommandDisambiguationAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationVoiceCommandDisambiguationAction *v5;
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
    self = -[SISchemaUEIDictationVoiceCommandDisambiguationAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationVoiceCommandDisambiguationAction)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationVoiceCommandDisambiguationAction *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUEIDictationVoiceCommandDisambiguationAction *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUEIDictationVoiceCommandDisambiguationAction;
  v5 = -[SISchemaUEIDictationVoiceCommandDisambiguationAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceCommandId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setVoiceCommandId:](v5, "setVoiceCommandId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationType:](v5, "setDisambiguationType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setDisambiguationIndex:](v5, "setDisambiguationIndex:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDisambiguationAlternatives"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationVoiceCommandDisambiguationAction setTotalDisambiguationAlternatives:](v5, "setTotalDisambiguationAlternatives:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = v5;

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

- (int)disambiguationType
{
  return self->_disambiguationType;
}

- (unsigned)disambiguationIndex
{
  return self->_disambiguationIndex;
}

- (unsigned)totalDisambiguationAlternatives
{
  return self->_totalDisambiguationAlternatives;
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
