@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted

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
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted deleteLocale](self, "deleteLocale");
  return v5;
}

- (void)setEnrollmentMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enrollmentMode = a3;
}

- (BOOL)hasEnrollmentMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnrollmentMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEnrollmentMode
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setEnrollmentMode:](self, "setEnrollmentMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVoiceTriggerType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_voiceTriggerType = a3;
}

- (BOOL)hasVoiceTriggerType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVoiceTriggerType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVoiceTriggerType
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setVoiceTriggerType:](self, "setVoiceTriggerType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setLocale:](self, "setLocale:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $548B5876226131DCE5D166D126AD36BC has;
  unsigned int v6;
  int enrollmentMode;
  int v8;
  int voiceTriggerType;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != objc_msgSend(v4, "enrollmentMode"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (voiceTriggerType = self->_voiceTriggerType,
          voiceTriggerType == objc_msgSend(v4, "voiceTriggerType")))
    {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_enrollmentMode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SISchemaISOLocale hash](self->_locale, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_voiceTriggerType;
  return v3 ^ v2 ^ -[SISchemaISOLocale hash](self->_locale, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted enrollmentMode](self, "enrollmentMode") - 1;
    if (v4 > 6)
      v5 = CFSTR("SIRISETUPENROLLMENTUIMODE_UNKNOWN");
    else
      v5 = off_1E563D808[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("enrollmentMode"));
  }
  if (self->_locale)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("locale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("locale"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted voiceTriggerType](self, "voiceTriggerType");
    v10 = CFSTR("SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_UNKNOWN");
    if (v9 == 1)
      v10 = CFSTR("SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS");
    if (v9 == 2)
      v11 = CFSTR("SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS_JS");
    else
      v11 = v10;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("voiceTriggerType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaISOLocale *v9;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setEnrollmentMode:](v5, "setEnrollmentMode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setVoiceTriggerType:](v5, "setVoiceTriggerType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v8);
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setLocale:](v5, "setLocale:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (int)voiceTriggerType
{
  return self->_voiceTriggerType;
}

- (SISchemaISOLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setHasLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
