@implementation MTSchemaMTAppInvocationMetadata

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
  v16.super_class = (Class)MTSchemaMTAppInvocationMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MTSchemaMTAppInvocationMetadata deleteLocalePair](self, "deleteLocalePair");
  -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MTSchemaMTAppInvocationMetadata deleteTabSessionId](self, "deleteTabSessionId");
  -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MTSchemaMTAppInvocationMetadata deleteAutoTranslateSessionId](self, "deleteAutoTranslateSessionId");

  return v5;
}

- (void)setDisplayMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_displayMode = a3;
}

- (BOOL)hasDisplayMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDisplayMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDisplayMode
{
  -[MTSchemaMTAppInvocationMetadata setDisplayMode:](self, "setDisplayMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

- (void)deleteLocalePair
{
  -[MTSchemaMTAppInvocationMetadata setLocalePair:](self, "setLocalePair:", 0);
}

- (void)setIsGenderAlternativeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isGenderAlternativeEnabled = a3;
}

- (BOOL)hasIsGenderAlternativeEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsGenderAlternativeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsGenderAlternativeEnabled
{
  -[MTSchemaMTAppInvocationMetadata setIsGenderAlternativeEnabled:](self, "setIsGenderAlternativeEnabled:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTabName:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tabName = a3;
}

- (BOOL)hasTabName
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTabName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTabName
{
  -[MTSchemaMTAppInvocationMetadata setTabName:](self, "setTabName:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasTabSessionId
{
  return self->_tabSessionId != 0;
}

- (void)deleteTabSessionId
{
  -[MTSchemaMTAppInvocationMetadata setTabSessionId:](self, "setTabSessionId:", 0);
}

- (BOOL)hasAutoTranslateSessionId
{
  return self->_autoTranslateSessionId != 0;
}

- (void)deleteAutoTranslateSessionId
{
  -[MTSchemaMTAppInvocationMetadata setAutoTranslateSessionId:](self, "setAutoTranslateSessionId:", 0);
}

- (void)setIsPlayTranslationsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPlayTranslationsEnabled = a3;
}

- (BOOL)hasIsPlayTranslationsEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsPlayTranslationsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsPlayTranslationsEnabled
{
  -[MTSchemaMTAppInvocationMetadata setIsPlayTranslationsEnabled:](self, "setIsPlayTranslationsEnabled:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setConversationTabView:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_conversationTabView = a3;
}

- (BOOL)hasConversationTabView
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasConversationTabView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteConversationTabView
{
  -[MTSchemaMTAppInvocationMetadata setConversationTabView:](self, "setConversationTabView:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setAudioChannel:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_audioChannel = a3;
}

- (BOOL)hasAudioChannel
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAudioChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteAudioChannel
{
  -[MTSchemaMTAppInvocationMetadata setAudioChannel:](self, "setAudioChannel:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTAppInvocationMetadataReadFrom(self, (uint64_t)a3);
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
  char v11;
  id v12;

  v12 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v11 = (char)self->_has;
  if ((v11 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
LABEL_19:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
    goto LABEL_19;
LABEL_15:
  if ((v11 & 0x20) != 0)
LABEL_16:
    PBDataWriterWriteInt32Field();
LABEL_17:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int displayMode;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $48140CF3950320FCE88C15C9425D0D2A has;
  int v14;
  unsigned int v15;
  int isGenderAlternativeEnabled;
  int v17;
  int tabName;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  $48140CF3950320FCE88C15C9425D0D2A v31;
  int v32;
  unsigned int v33;
  int isPlayTranslationsEnabled;
  int v35;
  int conversationTabView;
  int v37;
  int audioChannel;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 1) != (v4[60] & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    displayMode = self->_displayMode;
    if (displayMode != objc_msgSend(v4, "displayMode"))
      goto LABEL_27;
  }
  -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localePair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_26;
  -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localePair");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v14 = (*(unsigned int *)&has >> 1) & 1;
  v15 = v4[60];
  if (v14 != ((v15 >> 1) & 1))
    goto LABEL_27;
  if (v14)
  {
    isGenderAlternativeEnabled = self->_isGenderAlternativeEnabled;
    if (isGenderAlternativeEnabled != objc_msgSend(v4, "isGenderAlternativeEnabled"))
      goto LABEL_27;
    has = self->_has;
    v15 = v4[60];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1))
    goto LABEL_27;
  if (v17)
  {
    tabName = self->_tabName;
    if (tabName != objc_msgSend(v4, "tabName"))
      goto LABEL_27;
  }
  -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_26;
  -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabSessionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_27;
  }
  else
  {

  }
  -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoTranslateSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoTranslateSessionId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_27;
  }
  else
  {

  }
  v31 = self->_has;
  v32 = (*(unsigned int *)&v31 >> 3) & 1;
  v33 = v4[60];
  if (v32 == ((v33 >> 3) & 1))
  {
    if (v32)
    {
      isPlayTranslationsEnabled = self->_isPlayTranslationsEnabled;
      if (isPlayTranslationsEnabled != objc_msgSend(v4, "isPlayTranslationsEnabled"))
        goto LABEL_27;
      v31 = self->_has;
      v33 = v4[60];
    }
    v35 = (*(unsigned int *)&v31 >> 4) & 1;
    if (v35 == ((v33 >> 4) & 1))
    {
      if (v35)
      {
        conversationTabView = self->_conversationTabView;
        if (conversationTabView != objc_msgSend(v4, "conversationTabView"))
          goto LABEL_27;
        v31 = self->_has;
        v33 = v4[60];
      }
      v37 = (*(unsigned int *)&v31 >> 5) & 1;
      if (v37 == ((v33 >> 5) & 1))
      {
        if (!v37
          || (audioChannel = self->_audioChannel, audioChannel == objc_msgSend(v4, "audioChannel")))
        {
          v29 = 1;
          goto LABEL_28;
        }
      }
    }
  }
LABEL_27:
  v29 = 0;
LABEL_28:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_displayMode;
  else
    v3 = 0;
  v4 = -[MTSchemaMTLocalePair hash](self->_localePair, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_isGenderAlternativeEnabled;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_tabName;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[SISchemaUUID hash](self->_tabSessionId, "hash");
  v8 = -[SISchemaUUID hash](self->_autoTranslateSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_isPlayTranslationsEnabled;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_conversationTabView;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_audioChannel;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4 = -[MTSchemaMTAppInvocationMetadata audioChannel](self, "audioChannel") - 1;
    if (v4 > 4)
      v5 = CFSTR("MTAPPAUDIOCHANNEL_UNKNOWN");
    else
      v5 = off_1E563B730[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioChannel"));
  }
  if (self->_autoTranslateSessionId)
  {
    -[MTSchemaMTAppInvocationMetadata autoTranslateSessionId](self, "autoTranslateSessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("autoTranslateSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("autoTranslateSessionId"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v10 = -[MTSchemaMTAppInvocationMetadata conversationTabView](self, "conversationTabView");
    v11 = CFSTR("MTAPPCONVERSATIONTABVIEW_UNKNOWN");
    if (v10 == 1)
      v11 = CFSTR("MTAPPCONVERSATIONTABVIEW_FACE_TO_FACE");
    if (v10 == 2)
      v12 = CFSTR("MTAPPCONVERSATIONTABVIEW_SIDE_BY_SIDE");
    else
      v12 = v11;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("conversationTabView"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = -[MTSchemaMTAppInvocationMetadata displayMode](self, "displayMode") - 1;
    if (v13 > 2)
      v14 = CFSTR("MTAPPDISPLAYMODE_UNKNOWN");
    else
      v14 = off_1E563B758[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("displayMode"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTAppInvocationMetadata isGenderAlternativeEnabled](self, "isGenderAlternativeEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isGenderAlternativeEnabled"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTAppInvocationMetadata isPlayTranslationsEnabled](self, "isPlayTranslationsEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isPlayTranslationsEnabled"));

  }
  if (self->_localePair)
  {
    -[MTSchemaMTAppInvocationMetadata localePair](self, "localePair");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("localePair"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("localePair"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v20 = -[MTSchemaMTAppInvocationMetadata tabName](self, "tabName") - 1;
    if (v20 > 3)
      v21 = CFSTR("MTAPPTABNAME_UNKNOWN");
    else
      v21 = off_1E563B770[v20];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("tabName"));
  }
  if (self->_tabSessionId)
  {
    -[MTSchemaMTAppInvocationMetadata tabSessionId](self, "tabSessionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("tabSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("tabSessionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTAppInvocationMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTAppInvocationMetadata)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTAppInvocationMetadata *v5;
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
    self = -[MTSchemaMTAppInvocationMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTAppInvocationMetadata)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTAppInvocationMetadata *v5;
  void *v6;
  uint64_t v7;
  MTSchemaMTLocalePair *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  SISchemaUUID *v14;
  void *v15;
  void *v16;
  void *v17;
  MTSchemaMTAppInvocationMetadata *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTSchemaMTAppInvocationMetadata;
  v5 = -[MTSchemaMTAppInvocationMetadata init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setDisplayMode:](v5, "setDisplayMode:", objc_msgSend(v6, "intValue"));
    v21 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localePair"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[MTSchemaMTLocalePair initWithDictionary:]([MTSchemaMTLocalePair alloc], "initWithDictionary:", v7);
      -[MTSchemaMTAppInvocationMetadata setLocalePair:](v5, "setLocalePair:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGenderAlternativeEnabled"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setIsGenderAlternativeEnabled:](v5, "setIsGenderAlternativeEnabled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tabName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setTabName:](v5, "setTabName:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tabSessionId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[MTSchemaMTAppInvocationMetadata setTabSessionId:](v5, "setTabSessionId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoTranslateSessionId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v13);
      -[MTSchemaMTAppInvocationMetadata setAutoTranslateSessionId:](v5, "setAutoTranslateSessionId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlayTranslationsEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setIsPlayTranslationsEnabled:](v5, "setIsPlayTranslationsEnabled:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversationTabView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setConversationTabView:](v5, "setConversationTabView:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioChannel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTAppInvocationMetadata setAudioChannel:](v5, "setAudioChannel:", objc_msgSend(v17, "intValue"));
    v18 = v5;

  }
  return v5;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_storeStrong((id *)&self->_localePair, a3);
}

- (BOOL)isGenderAlternativeEnabled
{
  return self->_isGenderAlternativeEnabled;
}

- (int)tabName
{
  return self->_tabName;
}

- (SISchemaUUID)tabSessionId
{
  return self->_tabSessionId;
}

- (void)setTabSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_tabSessionId, a3);
}

- (SISchemaUUID)autoTranslateSessionId
{
  return self->_autoTranslateSessionId;
}

- (void)setAutoTranslateSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_autoTranslateSessionId, a3);
}

- (BOOL)isPlayTranslationsEnabled
{
  return self->_isPlayTranslationsEnabled;
}

- (int)conversationTabView
{
  return self->_conversationTabView;
}

- (int)audioChannel
{
  return self->_audioChannel;
}

- (void)setHasLocalePair:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTabSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAutoTranslateSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoTranslateSessionId, 0);
  objc_storeStrong((id *)&self->_tabSessionId, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

@end
