@implementation ODDSiriSchemaODDAnnounceProperties

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsAnnounceCallsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAnnounceCallsEnabled = a3;
}

- (BOOL)hasIsAnnounceCallsEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAnnounceCallsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAnnounceCallsEnabled
{
  -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceCallsEnabled:](self, "setIsAnnounceCallsEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsAnnounceNotificationsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAnnounceNotificationsEnabled = a3;
}

- (BOOL)hasIsAnnounceNotificationsEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAnnounceNotificationsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsAnnounceNotificationsEnabled
{
  -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceNotificationsEnabled:](self, "setIsAnnounceNotificationsEnabled:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsProximityCardSeen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isProximityCardSeen = a3;
}

- (BOOL)hasIsProximityCardSeen
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsProximityCardSeen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsProximityCardSeen
{
  -[ODDSiriSchemaODDAnnounceProperties setIsProximityCardSeen:](self, "setIsProximityCardSeen:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsReplyWithoutConfirmationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isReplyWithoutConfirmationEnabled = a3;
}

- (BOOL)hasIsReplyWithoutConfirmationEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsReplyWithoutConfirmationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsReplyWithoutConfirmationEnabled
{
  -[ODDSiriSchemaODDAnnounceProperties setIsReplyWithoutConfirmationEnabled:](self, "setIsReplyWithoutConfirmationEnabled:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsEnabledForHeadphones:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isEnabledForHeadphones = a3;
}

- (BOOL)hasIsEnabledForHeadphones
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsEnabledForHeadphones:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsEnabledForHeadphones
{
  -[ODDSiriSchemaODDAnnounceProperties setIsEnabledForHeadphones:](self, "setIsEnabledForHeadphones:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isSpokenNotificationsControlCenterModuleEnabled = a3;
}

- (BOOL)hasIsSpokenNotificationsControlCenterModuleEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsSpokenNotificationsControlCenterModuleEnabled
{
  -[ODDSiriSchemaODDAnnounceProperties setIsSpokenNotificationsControlCenterModuleEnabled:](self, "setIsSpokenNotificationsControlCenterModuleEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setIsCarPlayMuted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isCarPlayMuted = a3;
}

- (BOOL)hasIsCarPlayMuted
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasIsCarPlayMuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteIsCarPlayMuted
{
  -[ODDSiriSchemaODDAnnounceProperties setIsCarPlayMuted:](self, "setIsCarPlayMuted:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setCarPlayStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_carPlayStatus = a3;
}

- (BOOL)hasCarPlayStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasCarPlayStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteCarPlayStatus
{
  -[ODDSiriSchemaODDAnnounceProperties setCarPlayStatus:](self, "setCarPlayStatus:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAnnouncePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteInt32Field();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $36A0953300C39560EC6541B1AA7BC3E6 has;
  unsigned int v6;
  int isAnnounceCallsEnabled;
  int v8;
  int isAnnounceNotificationsEnabled;
  int v10;
  int isProximityCardSeen;
  int v12;
  int isReplyWithoutConfirmationEnabled;
  int v14;
  int isEnabledForHeadphones;
  int v16;
  int isSpokenNotificationsControlCenterModuleEnabled;
  int v18;
  int isCarPlayMuted;
  int carPlayStatus;
  BOOL v21;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isAnnounceCallsEnabled = self->_isAnnounceCallsEnabled;
    if (isAnnounceCallsEnabled != objc_msgSend(v4, "isAnnounceCallsEnabled"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_34;
  if (v8)
  {
    isAnnounceNotificationsEnabled = self->_isAnnounceNotificationsEnabled;
    if (isAnnounceNotificationsEnabled != objc_msgSend(v4, "isAnnounceNotificationsEnabled"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_34;
  if (v10)
  {
    isProximityCardSeen = self->_isProximityCardSeen;
    if (isProximityCardSeen != objc_msgSend(v4, "isProximityCardSeen"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_34;
  if (v12)
  {
    isReplyWithoutConfirmationEnabled = self->_isReplyWithoutConfirmationEnabled;
    if (isReplyWithoutConfirmationEnabled != objc_msgSend(v4, "isReplyWithoutConfirmationEnabled"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_34;
  if (v14)
  {
    isEnabledForHeadphones = self->_isEnabledForHeadphones;
    if (isEnabledForHeadphones != objc_msgSend(v4, "isEnabledForHeadphones"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_34;
  if (v16)
  {
    isSpokenNotificationsControlCenterModuleEnabled = self->_isSpokenNotificationsControlCenterModuleEnabled;
    if (isSpokenNotificationsControlCenterModuleEnabled != objc_msgSend(v4, "isSpokenNotificationsControlCenterModuleEnabled"))goto LABEL_34;
    has = self->_has;
    v6 = v4[20];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_34;
  if (v18)
  {
    isCarPlayMuted = self->_isCarPlayMuted;
    if (isCarPlayMuted == objc_msgSend(v4, "isCarPlayMuted"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_30;
    }
LABEL_34:
    v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0)
    goto LABEL_34;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    carPlayStatus = self->_carPlayStatus;
    if (carPlayStatus != objc_msgSend(v4, "carPlayStatus"))
      goto LABEL_34;
  }
  v21 = 1;
LABEL_35:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isAnnounceCallsEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isAnnounceNotificationsEnabled;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isProximityCardSeen;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isReplyWithoutConfirmationEnabled;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isEnabledForHeadphones;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_isSpokenNotificationsControlCenterModuleEnabled;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_isCarPlayMuted;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_carPlayStatus;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if (has < 0)
  {
    v5 = -[ODDSiriSchemaODDAnnounceProperties carPlayStatus](self, "carPlayStatus") - 1;
    if (v5 > 3)
      v6 = CFSTR("ODDANNOUNCENOTIFICATIONSCARPLAYSTATUS_UNKNOWN");
    else
      v6 = off_1E563BD60[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("carPlayStatus"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isAnnounceCallsEnabled](self, "isAnnounceCallsEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAnnounceCallsEnabled"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isAnnounceNotificationsEnabled](self, "isAnnounceNotificationsEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isAnnounceNotificationsEnabled"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isCarPlayMuted](self, "isCarPlayMuted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isCarPlayMuted"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isEnabledForHeadphones](self, "isEnabledForHeadphones"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isEnabledForHeadphones"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isReplyWithoutConfirmationEnabled](self, "isReplyWithoutConfirmationEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isReplyWithoutConfirmationEnabled"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isProximityCardSeen](self, "isProximityCardSeen"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isProximityCardSeen"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_20;
LABEL_12:
  if ((has & 0x20) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isSpokenNotificationsControlCenterModuleEnabled](self, "isSpokenNotificationsControlCenterModuleEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSpokenNotificationsControlCenterModuleEnabled"));

  }
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAnnounceProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAnnounceProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAnnounceProperties *v5;
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
    self = -[ODDSiriSchemaODDAnnounceProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAnnounceProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAnnounceProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ODDSiriSchemaODDAnnounceProperties *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDAnnounceProperties;
  v5 = -[ODDSiriSchemaODDAnnounceProperties init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAnnounceCallsEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceCallsEnabled:](v5, "setIsAnnounceCallsEnabled:", objc_msgSend(v6, "BOOLValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAnnounceNotificationsEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceNotificationsEnabled:](v5, "setIsAnnounceNotificationsEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isProximityCardSeen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsProximityCardSeen:](v5, "setIsProximityCardSeen:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReplyWithoutConfirmationEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsReplyWithoutConfirmationEnabled:](v5, "setIsReplyWithoutConfirmationEnabled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabledForHeadphones"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsEnabledForHeadphones:](v5, "setIsEnabledForHeadphones:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSpokenNotificationsControlCenterModuleEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsSpokenNotificationsControlCenterModuleEnabled:](v5, "setIsSpokenNotificationsControlCenterModuleEnabled:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarPlayMuted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setIsCarPlayMuted:](v5, "setIsCarPlayMuted:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAnnounceProperties setCarPlayStatus:](v5, "setCarPlayStatus:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (BOOL)isAnnounceCallsEnabled
{
  return self->_isAnnounceCallsEnabled;
}

- (BOOL)isAnnounceNotificationsEnabled
{
  return self->_isAnnounceNotificationsEnabled;
}

- (BOOL)isProximityCardSeen
{
  return self->_isProximityCardSeen;
}

- (BOOL)isReplyWithoutConfirmationEnabled
{
  return self->_isReplyWithoutConfirmationEnabled;
}

- (BOOL)isEnabledForHeadphones
{
  return self->_isEnabledForHeadphones;
}

- (BOOL)isSpokenNotificationsControlCenterModuleEnabled
{
  return self->_isSpokenNotificationsControlCenterModuleEnabled;
}

- (BOOL)isCarPlayMuted
{
  return self->_isCarPlayMuted;
}

- (int)carPlayStatus
{
  return self->_carPlayStatus;
}

@end
