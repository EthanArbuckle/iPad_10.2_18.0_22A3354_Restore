@implementation ODDSiriSchemaODDAssistantProperties

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
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODDSiriSchemaODDAssistantProperties;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssistantProperties deleteInputLocale](self, "deleteInputLocale");
  -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssistantProperties deleteVoice](self, "deleteVoice");
  -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDAssistantProperties deleteOptIn](self, "deleteOptIn");
  -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODDSiriSchemaODDAssistantProperties deleteHomeKit](self, "deleteHomeKit");
  -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ODDSiriSchemaODDAssistantProperties deleteAppleIntelligence](self, "deleteAppleIntelligence");

  return v5;
}

- (void)setIsAssistantEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAssistantEnabled = a3;
}

- (BOOL)hasIsAssistantEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAssistantEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAssistantEnabled
{
  -[ODDSiriSchemaODDAssistantProperties setIsAssistantEnabled:](self, "setIsAssistantEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasInputLocale
{
  return self->_inputLocale != 0;
}

- (void)deleteInputLocale
{
  -[ODDSiriSchemaODDAssistantProperties setInputLocale:](self, "setInputLocale:", 0);
}

- (void)setListenFor:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_listenFor = a3;
}

- (BOOL)hasListenFor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasListenFor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteListenFor
{
  -[ODDSiriSchemaODDAssistantProperties setListenFor:](self, "setListenFor:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumSiriShortcutsEnabled:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSiriShortcutsEnabled = a3;
}

- (BOOL)hasNumSiriShortcutsEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumSiriShortcutsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumSiriShortcutsEnabled
{
  -[ODDSiriSchemaODDAssistantProperties setNumSiriShortcutsEnabled:](self, "setNumSiriShortcutsEnabled:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsPreciseLocationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPreciseLocationEnabled = a3;
}

- (BOOL)hasIsPreciseLocationEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsPreciseLocationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsPreciseLocationEnabled
{
  -[ODDSiriSchemaODDAssistantProperties setIsPreciseLocationEnabled:](self, "setIsPreciseLocationEnabled:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasVoice
{
  return self->_voice != 0;
}

- (void)deleteVoice
{
  -[ODDSiriSchemaODDAssistantProperties setVoice:](self, "setVoice:", 0);
}

- (BOOL)hasOptIn
{
  return self->_optIn != 0;
}

- (void)deleteOptIn
{
  -[ODDSiriSchemaODDAssistantProperties setOptIn:](self, "setOptIn:", 0);
}

- (BOOL)hasHomeKit
{
  return self->_homeKit != 0;
}

- (void)deleteHomeKit
{
  -[ODDSiriSchemaODDAssistantProperties setHomeKit:](self, "setHomeKit:", 0);
}

- (void)setLocationAccessPermission:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locationAccessPermission = a3;
}

- (BOOL)hasLocationAccessPermission
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasLocationAccessPermission:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteLocationAccessPermission
{
  -[ODDSiriSchemaODDAssistantProperties setLocationAccessPermission:](self, "setLocationAccessPermission:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasAppleIntelligence
{
  return self->_appleIntelligence != 0;
}

- (void)deleteAppleIntelligence
{
  -[ODDSiriSchemaODDAssistantProperties setAppleIntelligence:](self, "setAppleIntelligence:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantPropertiesReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isAssistantEnabled;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $06056A90C2C9AD1E04581F30C75E1244 has;
  int v14;
  unsigned int v15;
  int listenFor;
  int v17;
  int numSiriShortcutsEnabled;
  int v19;
  int isPreciseLocationEnabled;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int locationAccessPermission;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 1) != (v4[80] & 1))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isAssistantEnabled = self->_isAssistantEnabled;
    if (isAssistantEnabled != objc_msgSend(v4, "isAssistantEnabled"))
      goto LABEL_44;
  }
  -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_43;
  -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_44;
  }
  else
  {

  }
  has = self->_has;
  v14 = (*(unsigned int *)&has >> 1) & 1;
  v15 = v4[80];
  if (v14 != ((v15 >> 1) & 1))
    goto LABEL_44;
  if (v14)
  {
    listenFor = self->_listenFor;
    if (listenFor != objc_msgSend(v4, "listenFor"))
      goto LABEL_44;
    has = self->_has;
    v15 = v4[80];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1))
    goto LABEL_44;
  if (v17)
  {
    numSiriShortcutsEnabled = self->_numSiriShortcutsEnabled;
    if (numSiriShortcutsEnabled != objc_msgSend(v4, "numSiriShortcutsEnabled"))
      goto LABEL_44;
    has = self->_has;
    v15 = v4[80];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v15 >> 3) & 1))
    goto LABEL_44;
  if (v19)
  {
    isPreciseLocationEnabled = self->_isPreciseLocationEnabled;
    if (isPreciseLocationEnabled != objc_msgSend(v4, "isPreciseLocationEnabled"))
      goto LABEL_44;
  }
  -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_43;
  -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_44;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optIn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_43;
  -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optIn");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_44;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_43;
  -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKit");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_44;
  }
  else
  {

  }
  v36 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v36 != ((v4[80] >> 4) & 1))
    goto LABEL_44;
  if (v36)
  {
    locationAccessPermission = self->_locationAccessPermission;
    if (locationAccessPermission != objc_msgSend(v4, "locationAccessPermission"))
      goto LABEL_44;
  }
  -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleIntelligence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_47:
    v43 = 1;
    goto LABEL_45;
  }
  v39 = (void *)v38;
  -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleIntelligence");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "isEqual:", v41);

  if ((v42 & 1) != 0)
    goto LABEL_47;
LABEL_44:
  v43 = 0;
LABEL_45:

  return v43;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isAssistantEnabled;
  else
    v3 = 0;
  v4 = -[SISchemaISOLocale hash](self->_inputLocale, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_listenFor;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_numSiriShortcutsEnabled;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_isPreciseLocationEnabled;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[ODDSiriSchemaODDVoiceProperties hash](self->_voice, "hash");
  v9 = -[ODDSiriSchemaODDOptInProperties hash](self->_optIn, "hash");
  v10 = -[ODDSiriSchemaODDHomeKitProperties hash](self->_homeKit, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_locationAccessPermission;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[ODDSiriSchemaODDAppleIntelligenceProperties hash](self->_appleIntelligence, "hash");
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
  char has;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  const __CFString *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appleIntelligence)
  {
    -[ODDSiriSchemaODDAssistantProperties appleIntelligence](self, "appleIntelligence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleIntelligence"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appleIntelligence"));

    }
  }
  if (self->_homeKit)
  {
    -[ODDSiriSchemaODDAssistantProperties homeKit](self, "homeKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeKit"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("homeKit"));

    }
  }
  if (self->_inputLocale)
  {
    -[ODDSiriSchemaODDAssistantProperties inputLocale](self, "inputLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("inputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("inputLocale"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAssistantProperties isAssistantEnabled](self, "isAssistantEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isAssistantEnabled"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 2) == 0)
        goto LABEL_19;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAssistantProperties isPreciseLocationEnabled](self, "isPreciseLocationEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isPreciseLocationEnabled"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_27:
  v19 = -[ODDSiriSchemaODDAssistantProperties listenFor](self, "listenFor") - 1;
  if (v19 > 2)
    v20 = CFSTR("ODDLISTENFOR_UNKNOWN");
  else
    v20 = off_1E563BD80[v19];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("listenFor"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_36:
  v24 = -[ODDSiriSchemaODDAssistantProperties locationAccessPermission](self, "locationAccessPermission") - 1;
  if (v24 > 5)
    v25 = CFSTR("ODDLOCATIONACCESSPERMISSION_UNKNOWN");
  else
    v25 = off_1E563BD98[v24];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("locationAccessPermission"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ODDSiriSchemaODDAssistantProperties numSiriShortcutsEnabled](self, "numSiriShortcutsEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numSiriShortcutsEnabled"));

  }
LABEL_22:
  if (self->_optIn)
  {
    -[ODDSiriSchemaODDAssistantProperties optIn](self, "optIn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("optIn"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("optIn"));

    }
  }
  if (self->_voice)
  {
    -[ODDSiriSchemaODDAssistantProperties voice](self, "voice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("voice"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("voice"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantProperties *v5;
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
    self = -[ODDSiriSchemaODDAssistantProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantProperties *v5;
  void *v6;
  uint64_t v7;
  SISchemaISOLocale *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ODDSiriSchemaODDVoiceProperties *v13;
  void *v14;
  ODDSiriSchemaODDOptInProperties *v15;
  void *v16;
  ODDSiriSchemaODDHomeKitProperties *v17;
  void *v18;
  void *v19;
  ODDSiriSchemaODDAppleIntelligenceProperties *v20;
  ODDSiriSchemaODDAssistantProperties *v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ODDSiriSchemaODDAssistantProperties;
  v5 = -[ODDSiriSchemaODDAssistantProperties init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAssistantEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantProperties setIsAssistantEnabled:](v5, "setIsAssistantEnabled:", objc_msgSend(v6, "BOOLValue"));
    v25 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputLocale"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v7);
      -[ODDSiriSchemaODDAssistantProperties setInputLocale:](v5, "setInputLocale:", v8);

    }
    v24 = (void *)v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listenFor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantProperties setListenFor:](v5, "setListenFor:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSiriShortcutsEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantProperties setNumSiriShortcutsEnabled:](v5, "setNumSiriShortcutsEnabled:", objc_msgSend(v10, "intValue"));
    v23 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPreciseLocationEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantProperties setIsPreciseLocationEnabled:](v5, "setIsPreciseLocationEnabled:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODDSiriSchemaODDVoiceProperties initWithDictionary:]([ODDSiriSchemaODDVoiceProperties alloc], "initWithDictionary:", v12);
      -[ODDSiriSchemaODDAssistantProperties setVoice:](v5, "setVoice:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optIn"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ODDSiriSchemaODDOptInProperties initWithDictionary:]([ODDSiriSchemaODDOptInProperties alloc], "initWithDictionary:", v14);
      -[ODDSiriSchemaODDAssistantProperties setOptIn:](v5, "setOptIn:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ODDSiriSchemaODDHomeKitProperties initWithDictionary:]([ODDSiriSchemaODDHomeKitProperties alloc], "initWithDictionary:", v16);
      -[ODDSiriSchemaODDAssistantProperties setHomeKit:](v5, "setHomeKit:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAccessPermission"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantProperties setLocationAccessPermission:](v5, "setLocationAccessPermission:", objc_msgSend(v18, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleIntelligence"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[ODDSiriSchemaODDAppleIntelligenceProperties initWithDictionary:]([ODDSiriSchemaODDAppleIntelligenceProperties alloc], "initWithDictionary:", v19);
      -[ODDSiriSchemaODDAssistantProperties setAppleIntelligence:](v5, "setAppleIntelligence:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (BOOL)isAssistantEnabled
{
  return self->_isAssistantEnabled;
}

- (SISchemaISOLocale)inputLocale
{
  return self->_inputLocale;
}

- (void)setInputLocale:(id)a3
{
  objc_storeStrong((id *)&self->_inputLocale, a3);
}

- (int)listenFor
{
  return self->_listenFor;
}

- (int)numSiriShortcutsEnabled
{
  return self->_numSiriShortcutsEnabled;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_isPreciseLocationEnabled;
}

- (ODDSiriSchemaODDVoiceProperties)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (ODDSiriSchemaODDOptInProperties)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(id)a3
{
  objc_storeStrong((id *)&self->_optIn, a3);
}

- (ODDSiriSchemaODDHomeKitProperties)homeKit
{
  return self->_homeKit;
}

- (void)setHomeKit:(id)a3
{
  objc_storeStrong((id *)&self->_homeKit, a3);
}

- (int)locationAccessPermission
{
  return self->_locationAccessPermission;
}

- (ODDSiriSchemaODDAppleIntelligenceProperties)appleIntelligence
{
  return self->_appleIntelligence;
}

- (void)setAppleIntelligence:(id)a3
{
  objc_storeStrong((id *)&self->_appleIntelligence, a3);
}

- (void)setHasInputLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVoice:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasOptIn:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasHomeKit:(BOOL)a3
{
  self->_hasInputLocale = a3;
}

- (void)setHasAppleIntelligence:(BOOL)a3
{
  self->_hasVoice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIntelligence, 0);
  objc_storeStrong((id *)&self->_homeKit, 0);
  objc_storeStrong((id *)&self->_optIn, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_inputLocale, 0);
}

@end
