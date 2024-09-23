@implementation MHSchemaMHVoiceTriggerRePrompted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasSiriSpeechID
{
  return self->_siriSpeechID != 0;
}

- (void)deleteSiriSpeechID
{
  -[MHSchemaMHVoiceTriggerRePrompted setSiriSpeechID:](self, "setSiriSpeechID:", 0);
}

- (void)setIsRePrompted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isRePrompted = a3;
}

- (BOOL)hasIsRePrompted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsRePrompted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsRePrompted
{
  -[MHSchemaMHVoiceTriggerRePrompted setIsRePrompted:](self, "setIsRePrompted:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLastWhenRePrompted
{
  return self->_lastWhenRePrompted != 0;
}

- (void)deleteLastWhenRePrompted
{
  -[MHSchemaMHVoiceTriggerRePrompted setLastWhenRePrompted:](self, "setLastWhenRePrompted:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerRePromptedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MHSchemaMHVoiceTriggerRePrompted siriSpeechID](self, "siriSpeechID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[MHSchemaMHVoiceTriggerRePrompted lastWhenRePrompted](self, "lastWhenRePrompted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

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
  int isRePrompted;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[MHSchemaMHVoiceTriggerRePrompted siriSpeechID](self, "siriSpeechID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSpeechID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[MHSchemaMHVoiceTriggerRePrompted siriSpeechID](self, "siriSpeechID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHVoiceTriggerRePrompted siriSpeechID](self, "siriSpeechID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSpeechID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isRePrompted = self->_isRePrompted;
    if (isRePrompted != objc_msgSend(v4, "isRePrompted"))
      goto LABEL_15;
  }
  -[MHSchemaMHVoiceTriggerRePrompted lastWhenRePrompted](self, "lastWhenRePrompted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastWhenRePrompted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaMHVoiceTriggerRePrompted lastWhenRePrompted](self, "lastWhenRePrompted");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[MHSchemaMHVoiceTriggerRePrompted lastWhenRePrompted](self, "lastWhenRePrompted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastWhenRePrompted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_siriSpeechID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isRePrompted;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_lastWhenRePrompted, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerRePrompted isRePrompted](self, "isRePrompted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isRePrompted"));

  }
  if (self->_lastWhenRePrompted)
  {
    -[MHSchemaMHVoiceTriggerRePrompted lastWhenRePrompted](self, "lastWhenRePrompted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lastWhenRePrompted"));

  }
  if (self->_siriSpeechID)
  {
    -[MHSchemaMHVoiceTriggerRePrompted siriSpeechID](self, "siriSpeechID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriSpeechID"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceTriggerRePrompted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceTriggerRePrompted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceTriggerRePrompted *v5;
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
    self = -[MHSchemaMHVoiceTriggerRePrompted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceTriggerRePrompted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceTriggerRePrompted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHVoiceTriggerRePrompted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHVoiceTriggerRePrompted;
  v5 = -[MHSchemaMHVoiceTriggerRePrompted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHVoiceTriggerRePrompted setSiriSpeechID:](v5, "setSiriSpeechID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRePrompted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerRePrompted setIsRePrompted:](v5, "setIsRePrompted:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastWhenRePrompted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[MHSchemaMHVoiceTriggerRePrompted setLastWhenRePrompted:](v5, "setLastWhenRePrompted:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)siriSpeechID
{
  return self->_siriSpeechID;
}

- (void)setSiriSpeechID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isRePrompted
{
  return self->_isRePrompted;
}

- (NSString)lastWhenRePrompted
{
  return self->_lastWhenRePrompted;
}

- (void)setLastWhenRePrompted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasSiriSpeechID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLastWhenRePrompted:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWhenRePrompted, 0);
  objc_storeStrong((id *)&self->_siriSpeechID, 0);
}

@end
