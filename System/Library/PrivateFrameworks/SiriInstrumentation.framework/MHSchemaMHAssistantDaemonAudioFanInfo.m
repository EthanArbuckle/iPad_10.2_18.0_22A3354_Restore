@implementation MHSchemaMHAssistantDaemonAudioFanInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFanId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fanId = a3;
}

- (BOOL)hasFanId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFanId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFanId
{
  -[MHSchemaMHAssistantDaemonAudioFanInfo setFanId:](self, "setFanId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCurrentSpeed:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currentSpeed = a3;
}

- (BOOL)hasCurrentSpeed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCurrentSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCurrentSpeed
{
  -[MHSchemaMHAssistantDaemonAudioFanInfo setCurrentSpeed:](self, "setCurrentSpeed:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTargetSpeed:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_targetSpeed = a3;
}

- (BOOL)hasTargetSpeed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTargetSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTargetSpeed
{
  -[MHSchemaMHAssistantDaemonAudioFanInfo setTargetSpeed:](self, "setTargetSpeed:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioFanInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $ACD72B5FB8490925DB96324E5CA82910 has;
  unsigned int v6;
  unsigned int fanId;
  int v8;
  int currentSpeed;
  int v10;
  int targetSpeed;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    fanId = self->_fanId;
    if (fanId != objc_msgSend(v4, "fanId"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    currentSpeed = self->_currentSpeed;
    if (currentSpeed == objc_msgSend(v4, "currentSpeed"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    targetSpeed = self->_targetSpeed;
    if (targetSpeed != objc_msgSend(v4, "targetSpeed"))
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

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_fanId;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_currentSpeed;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_targetSpeed;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo fanId](self, "fanId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("fanId"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo currentSpeed](self, "currentSpeed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("currentSpeed"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo targetSpeed](self, "targetSpeed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("targetSpeed"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioFanInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioFanInfo *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioFanInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioFanInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaMHAssistantDaemonAudioFanInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHAssistantDaemonAudioFanInfo;
  v5 = -[MHSchemaMHAssistantDaemonAudioFanInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fanId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioFanInfo setFanId:](v5, "setFanId:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentSpeed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioFanInfo setCurrentSpeed:](v5, "setCurrentSpeed:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetSpeed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioFanInfo setTargetSpeed:](v5, "setTargetSpeed:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)fanId
{
  return self->_fanId;
}

- (int)currentSpeed
{
  return self->_currentSpeed;
}

- (int)targetSpeed
{
  return self->_targetSpeed;
}

@end
