@implementation PSESchemaPSEAlarm

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsSiriResultUseful:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSiriResultUseful = a3;
}

- (BOOL)hasIsSiriResultUseful
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSiriResultUseful:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSiriResultUseful
{
  -[PSESchemaPSEAlarm setIsSiriResultUseful:](self, "setIsSiriResultUseful:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setFollowUpType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_followUpType = a3;
}

- (BOOL)hasFollowUpType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFollowUpType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFollowUpType
{
  -[PSESchemaPSEAlarm setFollowUpType:](self, "setFollowUpType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEAlarmReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $F79B13673CD05D96932B1EEEF809A6B6 has;
  unsigned int v6;
  int isSiriResultUseful;
  int v8;
  int followUpType;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isSiriResultUseful = self->_isSiriResultUseful;
    if (isSiriResultUseful != objc_msgSend(v4, "isSiriResultUseful"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    followUpType = self->_followUpType;
    if (followUpType != objc_msgSend(v4, "followUpType"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isSiriResultUseful;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_followUpType;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[PSESchemaPSEAlarm followUpType](self, "followUpType") - 1;
    if (v5 > 3)
      v6 = CFSTR("PSEALARMFOLLOWUP_UNKNOWN");
    else
      v6 = off_1E563D890[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("followUpType"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEAlarm isSiriResultUseful](self, "isSiriResultUseful"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSiriResultUseful"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEAlarm dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEAlarm)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEAlarm *v5;
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
    self = -[PSESchemaPSEAlarm initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEAlarm)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEAlarm *v5;
  void *v6;
  void *v7;
  PSESchemaPSEAlarm *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSESchemaPSEAlarm;
  v5 = -[PSESchemaPSEAlarm init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiriResultUseful"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAlarm setIsSiriResultUseful:](v5, "setIsSiriResultUseful:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAlarm setFollowUpType:](v5, "setFollowUpType:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)isSiriResultUseful
{
  return self->_isSiriResultUseful;
}

- (int)followUpType
{
  return self->_followUpType;
}

@end
