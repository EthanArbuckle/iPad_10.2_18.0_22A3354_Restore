@implementation SISchemaSiriVoiceTriggerSettings

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsHeySiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 1u;
  self->_isHeySiriTriggerPhraseEnabled = a3;
}

- (BOOL)hasIsHeySiriTriggerPhraseEnabled
{
  return *(&self->_isEnrollmentReprompted + 1);
}

- (void)setHasIsHeySiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFE | a3;
}

- (void)deleteIsHeySiriTriggerPhraseEnabled
{
  -[SISchemaSiriVoiceTriggerSettings setIsHeySiriTriggerPhraseEnabled:](self, "setIsHeySiriTriggerPhraseEnabled:", 0);
  *(&self->_isEnrollmentReprompted + 1) &= ~1u;
}

- (void)setIsJustSiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 2u;
  self->_isJustSiriTriggerPhraseEnabled = a3;
}

- (BOOL)hasIsJustSiriTriggerPhraseEnabled
{
  return (*((unsigned __int8 *)&self->_isEnrollmentReprompted + 1) >> 1) & 1;
}

- (void)setHasIsJustSiriTriggerPhraseEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFD | v3;
}

- (void)deleteIsJustSiriTriggerPhraseEnabled
{
  -[SISchemaSiriVoiceTriggerSettings setIsJustSiriTriggerPhraseEnabled:](self, "setIsJustSiriTriggerPhraseEnabled:", 0);
  *(&self->_isEnrollmentReprompted + 1) &= ~2u;
}

- (void)setIsEnrollmentReprompted:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 4u;
  self->_isEnrollmentReprompted = a3;
}

- (BOOL)hasIsEnrollmentReprompted
{
  return (*((unsigned __int8 *)&self->_isEnrollmentReprompted + 1) >> 2) & 1;
}

- (void)setHasIsEnrollmentReprompted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFB | v3;
}

- (void)deleteIsEnrollmentReprompted
{
  -[SISchemaSiriVoiceTriggerSettings setIsEnrollmentReprompted:](self, "setIsEnrollmentReprompted:", 0);
  *(&self->_isEnrollmentReprompted + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSiriVoiceTriggerSettingsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isEnrollmentReprompted + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isEnrollmentReprompted + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isEnrollmentReprompted + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_isEnrollmentReprompted + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isHeySiriTriggerPhraseEnabled;
  int v8;
  int isJustSiriTriggerPhraseEnabled;
  int v10;
  int isEnrollmentReprompted;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
  v6 = v4[11];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    isHeySiriTriggerPhraseEnabled = self->_isHeySiriTriggerPhraseEnabled;
    if (isHeySiriTriggerPhraseEnabled != objc_msgSend(v4, "isHeySiriTriggerPhraseEnabled"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
    v6 = v4[11];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isJustSiriTriggerPhraseEnabled = self->_isJustSiriTriggerPhraseEnabled;
    if (isJustSiriTriggerPhraseEnabled == objc_msgSend(v4, "isJustSiriTriggerPhraseEnabled"))
    {
      v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
      v6 = v4[11];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    isEnrollmentReprompted = self->_isEnrollmentReprompted;
    if (isEnrollmentReprompted != objc_msgSend(v4, "isEnrollmentReprompted"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(&self->_isEnrollmentReprompted + 1))
  {
    v2 = 0;
    if ((*(&self->_isEnrollmentReprompted + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isEnrollmentReprompted + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isHeySiriTriggerPhraseEnabled;
  if ((*(&self->_isEnrollmentReprompted + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isJustSiriTriggerPhraseEnabled;
  if ((*(&self->_isEnrollmentReprompted + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isEnrollmentReprompted;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEnrollmentReprompted + 1);
  if ((v4 & 4) == 0)
  {
    if (!*(&self->_isEnrollmentReprompted + 1))
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isHeySiriTriggerPhraseEnabled](self, "isHeySiriTriggerPhraseEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isHeySiriTriggerPhraseEnabled"));

    if ((*(&self->_isEnrollmentReprompted + 1) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isEnrollmentReprompted](self, "isEnrollmentReprompted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isEnrollmentReprompted"));

  v4 = *(&self->_isEnrollmentReprompted + 1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isJustSiriTriggerPhraseEnabled](self, "isJustSiriTriggerPhraseEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isJustSiriTriggerPhraseEnabled"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaSiriVoiceTriggerSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaSiriVoiceTriggerSettings)initWithJSON:(id)a3
{
  void *v4;
  SISchemaSiriVoiceTriggerSettings *v5;
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
    self = -[SISchemaSiriVoiceTriggerSettings initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaSiriVoiceTriggerSettings)initWithDictionary:(id)a3
{
  id v4;
  SISchemaSiriVoiceTriggerSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaSiriVoiceTriggerSettings *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSiriVoiceTriggerSettings;
  v5 = -[SISchemaSiriVoiceTriggerSettings init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHeySiriTriggerPhraseEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSiriVoiceTriggerSettings setIsHeySiriTriggerPhraseEnabled:](v5, "setIsHeySiriTriggerPhraseEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isJustSiriTriggerPhraseEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSiriVoiceTriggerSettings setIsJustSiriTriggerPhraseEnabled:](v5, "setIsJustSiriTriggerPhraseEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnrollmentReprompted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSiriVoiceTriggerSettings setIsEnrollmentReprompted:](v5, "setIsEnrollmentReprompted:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isHeySiriTriggerPhraseEnabled
{
  return self->_isHeySiriTriggerPhraseEnabled;
}

- (BOOL)isJustSiriTriggerPhraseEnabled
{
  return self->_isJustSiriTriggerPhraseEnabled;
}

- (BOOL)isEnrollmentReprompted
{
  return self->_isEnrollmentReprompted;
}

@end
