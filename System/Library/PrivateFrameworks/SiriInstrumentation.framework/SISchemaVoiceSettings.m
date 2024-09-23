@implementation SISchemaVoiceSettings

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
  v9.super_class = (Class)SISchemaVoiceSettings;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaVoiceSettings deleteVoiceAccentV2](self, "deleteVoiceAccentV2");
  return v5;
}

- (void)setVoiceGender:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_voiceGender = a3;
}

- (BOOL)hasVoiceGender
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasVoiceGender:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteVoiceGender
{
  -[SISchemaVoiceSettings setVoiceGender:](self, "setVoiceGender:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVoiceAccent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_voiceAccent = a3;
}

- (BOOL)hasVoiceAccent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVoiceAccent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVoiceAccent
{
  -[SISchemaVoiceSettings setVoiceAccent:](self, "setVoiceAccent:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0;
}

- (void)deleteVoiceName
{
  -[SISchemaVoiceSettings setVoiceName:](self, "setVoiceName:", 0);
}

- (BOOL)hasVoiceAccentV2
{
  return self->_voiceAccentV2 != 0;
}

- (void)deleteVoiceAccentV2
{
  -[SISchemaVoiceSettings setVoiceAccentV2:](self, "setVoiceAccentV2:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVoiceSettingsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaVoiceSettings voiceName](self, "voiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $09E27EB0C37AE32C8FD192ECFCBB73AC has;
  unsigned int v6;
  int voiceGender;
  int v8;
  int voiceAccent;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    voiceGender = self->_voiceGender;
    if (voiceGender != objc_msgSend(v4, "voiceGender"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    voiceAccent = self->_voiceAccent;
    if (voiceAccent != objc_msgSend(v4, "voiceAccent"))
      goto LABEL_19;
  }
  -[SISchemaVoiceSettings voiceName](self, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[SISchemaVoiceSettings voiceName](self, "voiceName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaVoiceSettings voiceName](self, "voiceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceAccentV2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_22:
      v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceAccentV2");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
LABEL_18:

  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_voiceGender;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_voiceAccent;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_voiceName, "hash");
  return v5 ^ -[SISchemaISOLocale hash](self->_voiceAccentV2, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[SISchemaVoiceSettings voiceAccent](self, "voiceAccent") - 1;
    if (v4 > 0x3D)
      v5 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v5 = off_1E5637A28[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("voiceAccent"));
  }
  if (self->_voiceAccentV2)
  {
    -[SISchemaVoiceSettings voiceAccentV2](self, "voiceAccentV2");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("voiceAccentV2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("voiceAccentV2"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = -[SISchemaVoiceSettings voiceGender](self, "voiceGender") - 1;
    if (v9 > 2)
      v10 = CFSTR("VOICEGENDER_UNKNOWN_VOICE_GENDER");
    else
      v10 = off_1E5637C18[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("voiceGender"));
  }
  if (self->_voiceName)
  {
    -[SISchemaVoiceSettings voiceName](self, "voiceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("voiceName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaVoiceSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaVoiceSettings)initWithJSON:(id)a3
{
  void *v4;
  SISchemaVoiceSettings *v5;
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
    self = -[SISchemaVoiceSettings initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaVoiceSettings)initWithDictionary:(id)a3
{
  id v4;
  SISchemaVoiceSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaISOLocale *v11;
  SISchemaVoiceSettings *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaVoiceSettings;
  v5 = -[SISchemaVoiceSettings init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceGender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceSettings setVoiceGender:](v5, "setVoiceGender:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceAccent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVoiceSettings setVoiceAccent:](v5, "setVoiceAccent:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaVoiceSettings setVoiceName:](v5, "setVoiceName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceAccentV2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v10);
      -[SISchemaVoiceSettings setVoiceAccentV2:](v5, "setVoiceAccentV2:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (int)voiceGender
{
  return self->_voiceGender;
}

- (int)voiceAccent
{
  return self->_voiceAccent;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaISOLocale)voiceAccentV2
{
  return self->_voiceAccentV2;
}

- (void)setVoiceAccentV2:(id)a3
{
  objc_storeStrong((id *)&self->_voiceAccentV2, a3);
}

- (void)setHasVoiceName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVoiceAccentV2:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceAccentV2, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
}

@end
