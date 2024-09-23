@implementation ANCSchemaANCAppNotificationMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCommsNotificationType:(int)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 1u;
  self->_commsNotificationType = a3;
}

- (BOOL)hasCommsNotificationType
{
  return *(&self->_isAskWithSiriEnabled + 1);
}

- (void)setHasCommsNotificationType:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFE | a3;
}

- (void)deleteCommsNotificationType
{
  -[ANCSchemaANCAppNotificationMetadata setCommsNotificationType:](self, "setCommsNotificationType:", 0);
  *(&self->_isAskWithSiriEnabled + 1) &= ~1u;
}

- (void)setIsSmsEligible:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 2u;
  self->_isSmsEligible = a3;
}

- (BOOL)hasIsSmsEligible
{
  return (*((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1) >> 1) & 1;
}

- (void)setHasIsSmsEligible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsSmsEligible
{
  -[ANCSchemaANCAppNotificationMetadata setIsSmsEligible:](self, "setIsSmsEligible:", 0);
  *(&self->_isAskWithSiriEnabled + 1) &= ~2u;
}

- (void)setIsAskWithSiriEnabled:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 4u;
  self->_isAskWithSiriEnabled = a3;
}

- (BOOL)hasIsAskWithSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1) >> 2) & 1;
}

- (void)setHasIsAskWithSiriEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFB | v3;
}

- (void)deleteIsAskWithSiriEnabled
{
  -[ANCSchemaANCAppNotificationMetadata setIsAskWithSiriEnabled:](self, "setIsAskWithSiriEnabled:", 0);
  *(&self->_isAskWithSiriEnabled + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCAppNotificationMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isAskWithSiriEnabled + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isAskWithSiriEnabled + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isAskWithSiriEnabled + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  v5 = *(&self->_isAskWithSiriEnabled + 1);
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
  int commsNotificationType;
  int v8;
  int isSmsEligible;
  int v10;
  int isAskWithSiriEnabled;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
  v6 = v4[14];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    commsNotificationType = self->_commsNotificationType;
    if (commsNotificationType != objc_msgSend(v4, "commsNotificationType"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
    v6 = v4[14];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isSmsEligible = self->_isSmsEligible;
    if (isSmsEligible == objc_msgSend(v4, "isSmsEligible"))
    {
      v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
      v6 = v4[14];
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
    isAskWithSiriEnabled = self->_isAskWithSiriEnabled;
    if (isAskWithSiriEnabled != objc_msgSend(v4, "isAskWithSiriEnabled"))
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

  if (!*(&self->_isAskWithSiriEnabled + 1))
  {
    v2 = 0;
    if ((*(&self->_isAskWithSiriEnabled + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isAskWithSiriEnabled + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_commsNotificationType;
  if ((*(&self->_isAskWithSiriEnabled + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isSmsEligible;
  if ((*(&self->_isAskWithSiriEnabled + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isAskWithSiriEnabled;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isAskWithSiriEnabled + 1);
  if ((v4 & 1) != 0)
  {
    v5 = -[ANCSchemaANCAppNotificationMetadata commsNotificationType](self, "commsNotificationType") - 1;
    if (v5 > 2)
      v6 = CFSTR("ANCCOMMUNICATIONAPINOTIFICATIONTYPE_UNKNOWN");
    else
      v6 = off_1E5638918[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commsNotificationType"));
    v4 = *(&self->_isAskWithSiriEnabled + 1);
  }
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANCSchemaANCAppNotificationMetadata isAskWithSiriEnabled](self, "isAskWithSiriEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isAskWithSiriEnabled"));

    v4 = *(&self->_isAskWithSiriEnabled + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANCSchemaANCAppNotificationMetadata isSmsEligible](self, "isSmsEligible"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSmsEligible"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ANCSchemaANCAppNotificationMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ANCSchemaANCAppNotificationMetadata)initWithJSON:(id)a3
{
  void *v4;
  ANCSchemaANCAppNotificationMetadata *v5;
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
    self = -[ANCSchemaANCAppNotificationMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ANCSchemaANCAppNotificationMetadata)initWithDictionary:(id)a3
{
  id v4;
  ANCSchemaANCAppNotificationMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  ANCSchemaANCAppNotificationMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANCSchemaANCAppNotificationMetadata;
  v5 = -[ANCSchemaANCAppNotificationMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commsNotificationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCAppNotificationMetadata setCommsNotificationType:](v5, "setCommsNotificationType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSmsEligible"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCAppNotificationMetadata setIsSmsEligible:](v5, "setIsSmsEligible:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAskWithSiriEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCAppNotificationMetadata setIsAskWithSiriEnabled:](v5, "setIsAskWithSiriEnabled:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (int)commsNotificationType
{
  return self->_commsNotificationType;
}

- (BOOL)isSmsEligible
{
  return self->_isSmsEligible;
}

- (BOOL)isAskWithSiriEnabled
{
  return self->_isAskWithSiriEnabled;
}

@end
