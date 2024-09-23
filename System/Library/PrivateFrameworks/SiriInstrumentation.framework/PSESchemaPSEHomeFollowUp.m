@implementation PSESchemaPSEHomeFollowUp

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFollowUpType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_followUpType = a3;
}

- (BOOL)hasFollowUpType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFollowUpType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFollowUpType
{
  -[PSESchemaPSEHomeFollowUp setFollowUpType:](self, "setFollowUpType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setFollowUpSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_followUpSource = a3;
}

- (BOOL)hasFollowUpSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFollowUpSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFollowUpSource
{
  -[PSESchemaPSEHomeFollowUp setFollowUpSource:](self, "setFollowUpSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasFollowUpAccessoryType
{
  return self->_followUpAccessoryType != 0;
}

- (void)deleteFollowUpAccessoryType
{
  -[PSESchemaPSEHomeFollowUp setFollowUpAccessoryType:](self, "setFollowUpAccessoryType:", 0);
}

- (void)setIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isFollowUpInSameContainerAsSiriRequest = a3;
}

- (BOOL)hasIsFollowUpInSameContainerAsSiriRequest
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsFollowUpInSameContainerAsSiriRequest
{
  -[PSESchemaPSEHomeFollowUp setIsFollowUpInSameContainerAsSiriRequest:](self, "setIsFollowUpInSameContainerAsSiriRequest:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setFollowUpDayOfWeek:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_followUpDayOfWeek = a3;
}

- (BOOL)hasFollowUpDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasFollowUpDayOfWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteFollowUpDayOfWeek
{
  -[PSESchemaPSEHomeFollowUp setFollowUpDayOfWeek:](self, "setFollowUpDayOfWeek:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setFollowUpHourOfDay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_followUpHourOfDay = a3;
}

- (BOOL)hasFollowUpHourOfDay
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasFollowUpHourOfDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteFollowUpHourOfDay
{
  -[PSESchemaPSEHomeFollowUp setFollowUpHourOfDay:](self, "setFollowUpHourOfDay:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setFollowUpDurationSinceSiriRequestInSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_followUpDurationSinceSiriRequestInSeconds = a3;
}

- (BOOL)hasFollowUpDurationSinceSiriRequestInSeconds
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasFollowUpDurationSinceSiriRequestInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteFollowUpDurationSinceSiriRequestInSeconds
{
  -[PSESchemaPSEHomeFollowUp setFollowUpDurationSinceSiriRequestInSeconds:](self, "setFollowUpDurationSinceSiriRequestInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEHomeFollowUpReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PSESchemaPSEHomeFollowUp followUpAccessoryType](self, "followUpAccessoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v6 & 0x20) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3323D48D798CB196FD9081BB92D01970 has;
  unsigned int v6;
  int followUpType;
  int v8;
  int followUpSource;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  $3323D48D798CB196FD9081BB92D01970 v18;
  int v19;
  unsigned int v20;
  int isFollowUpInSameContainerAsSiriRequest;
  int v22;
  unsigned int followUpDayOfWeek;
  int v24;
  unsigned int followUpHourOfDay;
  int v26;
  unsigned int followUpDurationSinceSiriRequestInSeconds;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    followUpType = self->_followUpType;
    if (followUpType != objc_msgSend(v4, "followUpType"))
      goto LABEL_31;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_31;
  if (v8)
  {
    followUpSource = self->_followUpSource;
    if (followUpSource != objc_msgSend(v4, "followUpSource"))
      goto LABEL_31;
  }
  -[PSESchemaPSEHomeFollowUp followUpAccessoryType](self, "followUpAccessoryType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "followUpAccessoryType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_31;
  }
  -[PSESchemaPSEHomeFollowUp followUpAccessoryType](self, "followUpAccessoryType");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PSESchemaPSEHomeFollowUp followUpAccessoryType](self, "followUpAccessoryType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followUpAccessoryType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_31;
  }
  else
  {

  }
  v18 = self->_has;
  v19 = (*(unsigned int *)&v18 >> 2) & 1;
  v20 = v4[40];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
  if (v19)
  {
    isFollowUpInSameContainerAsSiriRequest = self->_isFollowUpInSameContainerAsSiriRequest;
    if (isFollowUpInSameContainerAsSiriRequest != objc_msgSend(v4, "isFollowUpInSameContainerAsSiriRequest"))goto LABEL_31;
    v18 = self->_has;
    v20 = v4[40];
  }
  v22 = (*(unsigned int *)&v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1))
    goto LABEL_31;
  if (v22)
  {
    followUpDayOfWeek = self->_followUpDayOfWeek;
    if (followUpDayOfWeek != objc_msgSend(v4, "followUpDayOfWeek"))
      goto LABEL_31;
    v18 = self->_has;
    v20 = v4[40];
  }
  v24 = (*(unsigned int *)&v18 >> 4) & 1;
  if (v24 != ((v20 >> 4) & 1))
    goto LABEL_31;
  if (v24)
  {
    followUpHourOfDay = self->_followUpHourOfDay;
    if (followUpHourOfDay == objc_msgSend(v4, "followUpHourOfDay"))
    {
      v18 = self->_has;
      v20 = v4[40];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  v26 = (*(unsigned int *)&v18 >> 5) & 1;
  if (v26 != ((v20 >> 5) & 1))
    goto LABEL_31;
  if (v26)
  {
    followUpDurationSinceSiriRequestInSeconds = self->_followUpDurationSinceSiriRequestInSeconds;
    if (followUpDurationSinceSiriRequestInSeconds != objc_msgSend(v4, "followUpDurationSinceSiriRequestInSeconds"))goto LABEL_31;
  }
  v28 = 1;
LABEL_32:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_followUpType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_followUpSource;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_followUpAccessoryType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_isFollowUpInSameContainerAsSiriRequest;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_followUpDayOfWeek;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_9;
LABEL_13:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_10;
LABEL_14:
      v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_9:
  v8 = 2654435761 * self->_followUpHourOfDay;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_10:
  v9 = 2654435761 * self->_followUpDurationSinceSiriRequestInSeconds;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_followUpAccessoryType)
  {
    -[PSESchemaPSEHomeFollowUp followUpAccessoryType](self, "followUpAccessoryType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("followUpAccessoryType"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpDayOfWeek](self, "followUpDayOfWeek"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("followUpDayOfWeek"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpDurationSinceSiriRequestInSeconds](self, "followUpDurationSinceSiriRequestInSeconds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("followUpDurationSinceSiriRequestInSeconds"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpHourOfDay](self, "followUpHourOfDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("followUpHourOfDay"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
LABEL_18:
    v14 = -[PSESchemaPSEHomeFollowUp followUpType](self, "followUpType") - 1;
    if (v14 > 3)
      v15 = CFSTR("PSEHOMEFOLLOWUPTYPE_UNKNOWN");
    else
      v15 = off_1E563A488[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("followUpType"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
    goto LABEL_10;
  }
LABEL_14:
  v12 = -[PSESchemaPSEHomeFollowUp followUpSource](self, "followUpSource") - 1;
  if (v12 > 3)
    v13 = CFSTR("PSEHOMEFOLLOWUPSOURCE_UNKNOWN");
  else
    v13 = off_1E563A468[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("followUpSource"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_18;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEHomeFollowUp isFollowUpInSameContainerAsSiriRequest](self, "isFollowUpInSameContainerAsSiriRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isFollowUpInSameContainerAsSiriRequest"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEHomeFollowUp dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEHomeFollowUp)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEHomeFollowUp *v5;
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
    self = -[PSESchemaPSEHomeFollowUp initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEHomeFollowUp)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEHomeFollowUp *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PSESchemaPSEHomeFollowUp *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PSESchemaPSEHomeFollowUp;
  v5 = -[PSESchemaPSEHomeFollowUp init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setFollowUpType:](v5, "setFollowUpType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setFollowUpSource:](v5, "setFollowUpSource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpAccessoryType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PSESchemaPSEHomeFollowUp setFollowUpAccessoryType:](v5, "setFollowUpAccessoryType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFollowUpInSameContainerAsSiriRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setIsFollowUpInSameContainerAsSiriRequest:](v5, "setIsFollowUpInSameContainerAsSiriRequest:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpDayOfWeek"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setFollowUpDayOfWeek:](v5, "setFollowUpDayOfWeek:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpHourOfDay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setFollowUpHourOfDay:](v5, "setFollowUpHourOfDay:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpDurationSinceSiriRequestInSeconds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEHomeFollowUp setFollowUpDurationSinceSiriRequestInSeconds:](v5, "setFollowUpDurationSinceSiriRequestInSeconds:", objc_msgSend(v13, "unsignedIntValue"));
    v14 = v5;

  }
  return v5;
}

- (int)followUpType
{
  return self->_followUpType;
}

- (int)followUpSource
{
  return self->_followUpSource;
}

- (NSString)followUpAccessoryType
{
  return self->_followUpAccessoryType;
}

- (void)setFollowUpAccessoryType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isFollowUpInSameContainerAsSiriRequest
{
  return self->_isFollowUpInSameContainerAsSiriRequest;
}

- (unsigned)followUpDayOfWeek
{
  return self->_followUpDayOfWeek;
}

- (unsigned)followUpHourOfDay
{
  return self->_followUpHourOfDay;
}

- (unsigned)followUpDurationSinceSiriRequestInSeconds
{
  return self->_followUpDurationSinceSiriRequestInSeconds;
}

- (void)setHasFollowUpAccessoryType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpAccessoryType, 0);
}

@end
