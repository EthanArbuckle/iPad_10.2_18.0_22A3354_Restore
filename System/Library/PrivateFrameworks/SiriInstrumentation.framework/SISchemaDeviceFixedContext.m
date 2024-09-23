@implementation SISchemaDeviceFixedContext

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
  v13.super_class = (Class)SISchemaDeviceFixedContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
  {
    -[SISchemaDeviceFixedContext deleteSiriDeviceID](self, "deleteSiriDeviceID");
    -[SISchemaDeviceFixedContext deleteSpeechID](self, "deleteSpeechID");
  }
  -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaDeviceFixedContext deleteSiriUISettings](self, "deleteSiriUISettings");
  -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaDeviceFixedContext deleteVoiceSettings](self, "deleteVoiceSettings");

  return v5;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[SISchemaDeviceFixedContext setDeviceType:](self, "setDeviceType:", 0);
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[SISchemaDeviceFixedContext setSystemBuild:](self, "setSystemBuild:", 0);
}

- (BOOL)hasSiriInputLanguage
{
  return self->_siriInputLanguage != 0;
}

- (void)deleteSiriInputLanguage
{
  -[SISchemaDeviceFixedContext setSiriInputLanguage:](self, "setSiriInputLanguage:", 0);
}

- (BOOL)hasSiriVoiceLanguage
{
  return self->_siriVoiceLanguage != 0;
}

- (void)deleteSiriVoiceLanguage
{
  -[SISchemaDeviceFixedContext setSiriVoiceLanguage:](self, "setSiriVoiceLanguage:", 0);
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

- (void)deleteSystemLocale
{
  -[SISchemaDeviceFixedContext setSystemLocale:](self, "setSystemLocale:", 0);
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (void)deleteSiriDeviceID
{
  -[SISchemaDeviceFixedContext setSiriDeviceID:](self, "setSiriDeviceID:", 0);
}

- (BOOL)hasSpeechID
{
  return self->_speechID != 0;
}

- (void)deleteSpeechID
{
  -[SISchemaDeviceFixedContext setSpeechID:](self, "setSpeechID:", 0);
}

- (BOOL)hasSiriUISettings
{
  return self->_siriUISettings != 0;
}

- (void)deleteSiriUISettings
{
  -[SISchemaDeviceFixedContext setSiriUISettings:](self, "setSiriUISettings:", 0);
}

- (void)setIsSatellitePaired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSatellitePaired = a3;
}

- (BOOL)hasIsSatellitePaired
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSatellitePaired:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSatellitePaired
{
  -[SISchemaDeviceFixedContext setIsSatellitePaired:](self, "setIsSatellitePaired:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteVoiceSettings
{
  -[SISchemaDeviceFixedContext setVoiceSettings:](self, "setVoiceSettings:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDeviceFixedContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SISchemaDeviceFixedContext deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext siriInputLanguage](self, "siriInputLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext siriVoiceLanguage](self, "siriVoiceLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext systemLocale](self, "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext siriDeviceID](self, "siriDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext speechID](self, "speechID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int isSatellitePaired;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[SISchemaDeviceFixedContext deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext deviceType](self, "deviceType");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaDeviceFixedContext deviceType](self, "deviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext systemBuild](self, "systemBuild");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaDeviceFixedContext systemBuild](self, "systemBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext siriInputLanguage](self, "siriInputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext siriInputLanguage](self, "siriInputLanguage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaDeviceFixedContext siriInputLanguage](self, "siriInputLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInputLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext siriVoiceLanguage](self, "siriVoiceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriVoiceLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext siriVoiceLanguage](self, "siriVoiceLanguage");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SISchemaDeviceFixedContext siriVoiceLanguage](self, "siriVoiceLanguage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriVoiceLanguage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext systemLocale](self, "systemLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext systemLocale](self, "systemLocale");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[SISchemaDeviceFixedContext systemLocale](self, "systemLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext siriDeviceID](self, "siriDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext siriDeviceID](self, "siriDeviceID");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SISchemaDeviceFixedContext siriDeviceID](self, "siriDeviceID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext speechID](self, "speechID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext speechID](self, "speechID");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[SISchemaDeviceFixedContext speechID](self, "speechID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_50;
  }
  else
  {

  }
  -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriUISettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriUISettings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_50;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[88] & 1))
    goto LABEL_50;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isSatellitePaired = self->_isSatellitePaired;
    if (isSatellitePaired != objc_msgSend(v4, "isSatellitePaired"))
      goto LABEL_50;
  }
  -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_53:
      v53 = 1;
      goto LABEL_51;
    }
    v49 = (void *)v48;
    -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceSettings");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_53;
  }
  else
  {
LABEL_49:

  }
LABEL_50:
  v53 = 0;
LABEL_51:

  return v53;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_deviceType, "hash");
  v4 = -[NSString hash](self->_systemBuild, "hash");
  v5 = -[NSString hash](self->_siriInputLanguage, "hash");
  v6 = -[NSString hash](self->_siriVoiceLanguage, "hash");
  v7 = -[NSString hash](self->_systemLocale, "hash");
  v8 = -[NSString hash](self->_siriDeviceID, "hash");
  v9 = -[NSString hash](self->_speechID, "hash");
  v10 = -[SISchemaSiriUISettings hash](self->_siriUISettings, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_isSatellitePaired;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[SISchemaVoiceSettings hash](self->_voiceSettings, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceType)
  {
    -[SISchemaDeviceFixedContext deviceType](self, "deviceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceType"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaDeviceFixedContext isSatellitePaired](self, "isSatellitePaired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isSatellitePaired"));

  }
  if (self->_siriDeviceID)
  {
    -[SISchemaDeviceFixedContext siriDeviceID](self, "siriDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriDeviceID"));

  }
  if (self->_siriInputLanguage)
  {
    -[SISchemaDeviceFixedContext siriInputLanguage](self, "siriInputLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("siriInputLanguage"));

  }
  if (self->_siriUISettings)
  {
    -[SISchemaDeviceFixedContext siriUISettings](self, "siriUISettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("siriUISettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("siriUISettings"));

    }
  }
  if (self->_siriVoiceLanguage)
  {
    -[SISchemaDeviceFixedContext siriVoiceLanguage](self, "siriVoiceLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("siriVoiceLanguage"));

  }
  if (self->_speechID)
  {
    -[SISchemaDeviceFixedContext speechID](self, "speechID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("speechID"));

  }
  if (self->_systemBuild)
  {
    -[SISchemaDeviceFixedContext systemBuild](self, "systemBuild");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("systemBuild"));

  }
  if (self->_systemLocale)
  {
    -[SISchemaDeviceFixedContext systemLocale](self, "systemLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("systemLocale"));

  }
  if (self->_voiceSettings)
  {
    -[SISchemaDeviceFixedContext voiceSettings](self, "voiceSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("voiceSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("voiceSettings"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDeviceFixedContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDeviceFixedContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDeviceFixedContext *v5;
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
    self = -[SISchemaDeviceFixedContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDeviceFixedContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDeviceFixedContext *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  SISchemaSiriUISettings *v21;
  void *v22;
  void *v23;
  SISchemaVoiceSettings *v24;
  SISchemaDeviceFixedContext *v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SISchemaDeviceFixedContext;
  v5 = -[SISchemaDeviceFixedContext init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaDeviceFixedContext setDeviceType:](v5, "setDeviceType:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaDeviceFixedContext setSystemBuild:](v5, "setSystemBuild:", v9);

    }
    v28 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaDeviceFixedContext setSiriInputLanguage:](v5, "setSiriInputLanguage:", v11);

    }
    v27 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriVoiceLanguage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SISchemaDeviceFixedContext setSiriVoiceLanguage:](v5, "setSiriVoiceLanguage:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemLocale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[SISchemaDeviceFixedContext setSystemLocale:](v5, "setSystemLocale:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[SISchemaDeviceFixedContext setSiriDeviceID:](v5, "setSiriDeviceID:", v17);

    }
    v29 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[SISchemaDeviceFixedContext setSpeechID:](v5, "setSpeechID:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUISettings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[SISchemaSiriUISettings initWithDictionary:]([SISchemaSiriUISettings alloc], "initWithDictionary:", v20);
      -[SISchemaDeviceFixedContext setSiriUISettings:](v5, "setSiriUISettings:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSatellitePaired"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDeviceFixedContext setIsSatellitePaired:](v5, "setIsSatellitePaired:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceSettings"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[SISchemaVoiceSettings initWithDictionary:]([SISchemaVoiceSettings alloc], "initWithDictionary:", v23);
      -[SISchemaDeviceFixedContext setVoiceSettings:](v5, "setVoiceSettings:", v24);

    }
    v25 = v5;

  }
  return v5;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)siriInputLanguage
{
  return self->_siriInputLanguage;
}

- (void)setSiriInputLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)siriVoiceLanguage
{
  return self->_siriVoiceLanguage;
}

- (void)setSiriVoiceLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (void)setSystemLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)siriDeviceID
{
  return self->_siriDeviceID;
}

- (void)setSiriDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)speechID
{
  return self->_speechID;
}

- (void)setSpeechID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SISchemaSiriUISettings)siriUISettings
{
  return self->_siriUISettings;
}

- (void)setSiriUISettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriUISettings, a3);
}

- (BOOL)isSatellitePaired
{
  return self->_isSatellitePaired;
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSettings, a3);
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSiriInputLanguage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSiriVoiceLanguage:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  self->_hasSiriInputLanguage = a3;
}

- (void)setHasSpeechID:(BOOL)a3
{
  self->_hasSiriVoiceLanguage = a3;
}

- (void)setHasSiriUISettings:(BOOL)a3
{
  self->_hasSystemLocale = a3;
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  self->_hasSiriDeviceID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_siriUISettings, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_siriVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_siriInputLanguage, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end
