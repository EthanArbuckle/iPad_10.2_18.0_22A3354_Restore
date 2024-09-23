@implementation SISchemaAnnounceNotifications

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 1u;
  self->_isEnabled = a3;
}

- (BOOL)hasIsEnabled
{
  return *(&self->_isCarPlayMuted + 1);
}

- (void)setHasIsEnabled:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFE | a3;
}

- (void)deleteIsEnabled
{
  -[SISchemaAnnounceNotifications setIsEnabled:](self, "setIsEnabled:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~1u;
}

- (void)setProxCardSeen:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 2u;
  self->_proxCardSeen = a3;
}

- (BOOL)hasProxCardSeen
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 1) & 1;
}

- (void)setHasProxCardSeen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFD | v3;
}

- (void)deleteProxCardSeen
{
  -[SISchemaAnnounceNotifications setProxCardSeen:](self, "setProxCardSeen:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~2u;
}

- (void)setReplyWithoutConfirmation:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 4u;
  self->_replyWithoutConfirmation = a3;
}

- (BOOL)hasReplyWithoutConfirmation
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 2) & 1;
}

- (void)setHasReplyWithoutConfirmation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFB | v3;
}

- (void)deleteReplyWithoutConfirmation
{
  -[SISchemaAnnounceNotifications setReplyWithoutConfirmation:](self, "setReplyWithoutConfirmation:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~4u;
}

- (void)setCarPlayStatus:(int)a3
{
  *(&self->_isCarPlayMuted + 1) |= 8u;
  self->_carPlayStatus = a3;
}

- (BOOL)hasCarPlayStatus
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 3) & 1;
}

- (void)setHasCarPlayStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xF7 | v3;
}

- (void)deleteCarPlayStatus
{
  -[SISchemaAnnounceNotifications setCarPlayStatus:](self, "setCarPlayStatus:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~8u;
}

- (void)setIsEnabledForHeadphones:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 0x10u;
  self->_isEnabledForHeadphones = a3;
}

- (BOOL)hasIsEnabledForHeadphones
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 4) & 1;
}

- (void)setHasIsEnabledForHeadphones:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xEF | v3;
}

- (void)deleteIsEnabledForHeadphones
{
  -[SISchemaAnnounceNotifications setIsEnabledForHeadphones:](self, "setIsEnabledForHeadphones:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~0x10u;
}

- (void)setIsCarPlayMuted:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 0x20u;
  self->_isCarPlayMuted = a3;
}

- (BOOL)hasIsCarPlayMuted
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 5) & 1;
}

- (void)setHasIsCarPlayMuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xDF | v3;
}

- (void)deleteIsCarPlayMuted
{
  -[SISchemaAnnounceNotifications setIsCarPlayMuted:](self, "setIsCarPlayMuted:", 0);
  *(&self->_isCarPlayMuted + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnnounceNotificationsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(&self->_isCarPlayMuted + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(&self->_isCarPlayMuted + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isCarPlayMuted + 1) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isEnabled;
  int v8;
  int proxCardSeen;
  int v10;
  int replyWithoutConfirmation;
  int v12;
  int carPlayStatus;
  int v14;
  int isEnabledForHeadphones;
  int v16;
  int isCarPlayMuted;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
  v6 = v4[18];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_26;
  if ((v5 & 1) != 0)
  {
    isEnabled = self->_isEnabled;
    if (isEnabled != objc_msgSend(v4, "isEnabled"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    v6 = v4[18];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    proxCardSeen = self->_proxCardSeen;
    if (proxCardSeen != objc_msgSend(v4, "proxCardSeen"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    v6 = v4[18];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    replyWithoutConfirmation = self->_replyWithoutConfirmation;
    if (replyWithoutConfirmation != objc_msgSend(v4, "replyWithoutConfirmation"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    v6 = v4[18];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    carPlayStatus = self->_carPlayStatus;
    if (carPlayStatus != objc_msgSend(v4, "carPlayStatus"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    v6 = v4[18];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    isEnabledForHeadphones = self->_isEnabledForHeadphones;
    if (isEnabledForHeadphones == objc_msgSend(v4, "isEnabledForHeadphones"))
    {
      v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
      v6 = v4[18];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    isCarPlayMuted = self->_isCarPlayMuted;
    if (isCarPlayMuted != objc_msgSend(v4, "isCarPlayMuted"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(&self->_isCarPlayMuted + 1))
  {
    v2 = 2654435761 * self->_isEnabled;
    if ((*(&self->_isCarPlayMuted + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_proxCardSeen;
      if ((*(&self->_isCarPlayMuted + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_isCarPlayMuted + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_replyWithoutConfirmation;
    if ((*(&self->_isCarPlayMuted + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_carPlayStatus;
    if ((*(&self->_isCarPlayMuted + 1) & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(&self->_isCarPlayMuted + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_isEnabledForHeadphones;
  if ((*(&self->_isCarPlayMuted + 1) & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_isCarPlayMuted;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 8) != 0)
  {
    v5 = -[SISchemaAnnounceNotifications carPlayStatus](self, "carPlayStatus") - 1;
    if (v5 > 3)
      v6 = CFSTR("ANNOUNCENOTIFICATIONSCARPLAYSTATUS_UNKNOWN");
    else
      v6 = off_1E5633EA8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("carPlayStatus"));
    v4 = *(&self->_isCarPlayMuted + 1);
  }
  if ((v4 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAnnounceNotifications isCarPlayMuted](self, "isCarPlayMuted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isCarPlayMuted"));

    v4 = *(&self->_isCarPlayMuted + 1);
    if ((v4 & 1) == 0)
    {
LABEL_8:
      if ((v4 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAnnounceNotifications isEnabled](self, "isEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isEnabled"));

  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 2) == 0)
      goto LABEL_10;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAnnounceNotifications proxCardSeen](self, "proxCardSeen"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("proxCardSeen"));

    if ((*(&self->_isCarPlayMuted + 1) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAnnounceNotifications isEnabledForHeadphones](self, "isEnabledForHeadphones"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isEnabledForHeadphones"));

  v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 2) != 0)
    goto LABEL_16;
LABEL_10:
  if ((v4 & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAnnounceNotifications replyWithoutConfirmation](self, "replyWithoutConfirmation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("replyWithoutConfirmation"));

  }
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaAnnounceNotifications dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaAnnounceNotifications)initWithJSON:(id)a3
{
  void *v4;
  SISchemaAnnounceNotifications *v5;
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
    self = -[SISchemaAnnounceNotifications initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaAnnounceNotifications)initWithDictionary:(id)a3
{
  id v4;
  SISchemaAnnounceNotifications *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaAnnounceNotifications *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaAnnounceNotifications;
  v5 = -[SISchemaAnnounceNotifications init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proxCardSeen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setProxCardSeen:](v5, "setProxCardSeen:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyWithoutConfirmation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setReplyWithoutConfirmation:](v5, "setReplyWithoutConfirmation:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setCarPlayStatus:](v5, "setCarPlayStatus:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabledForHeadphones"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setIsEnabledForHeadphones:](v5, "setIsEnabledForHeadphones:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarPlayMuted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnnounceNotifications setIsCarPlayMuted:](v5, "setIsCarPlayMuted:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)proxCardSeen
{
  return self->_proxCardSeen;
}

- (BOOL)replyWithoutConfirmation
{
  return self->_replyWithoutConfirmation;
}

- (int)carPlayStatus
{
  return self->_carPlayStatus;
}

- (BOOL)isEnabledForHeadphones
{
  return self->_isEnabledForHeadphones;
}

- (BOOL)isCarPlayMuted
{
  return self->_isCarPlayMuted;
}

@end
