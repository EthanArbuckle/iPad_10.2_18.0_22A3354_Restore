@implementation POMMESSchemaPOMMESCacheMaintenanceEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumberOfEntriesUpdated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfEntriesUpdated = a3;
}

- (BOOL)hasNumberOfEntriesUpdated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumberOfEntriesUpdated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumberOfEntriesUpdated
{
  -[POMMESSchemaPOMMESCacheMaintenanceEnded setNumberOfEntriesUpdated:](self, "setNumberOfEntriesUpdated:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTotalCacheEntries:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalCacheEntries = a3;
}

- (BOOL)hasTotalCacheEntries
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTotalCacheEntries:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTotalCacheEntries
{
  -[POMMESSchemaPOMMESCacheMaintenanceEnded setTotalCacheEntries:](self, "setTotalCacheEntries:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTimeSinceMaintenanceStartedInSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeSinceMaintenanceStartedInSeconds = a3;
}

- (BOOL)hasTimeSinceMaintenanceStartedInSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTimeSinceMaintenanceStartedInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTimeSinceMaintenanceStartedInSeconds
{
  -[POMMESSchemaPOMMESCacheMaintenanceEnded setTimeSinceMaintenanceStartedInSeconds:](self, "setTimeSinceMaintenanceStartedInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteReason
{
  -[POMMESSchemaPOMMESCacheMaintenanceEnded setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheMaintenanceEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $53BC70F6AD4EDD6FDDA9DE2A40691B04 has;
  unsigned int v6;
  unsigned int numberOfEntriesUpdated;
  int v8;
  unsigned int totalCacheEntries;
  int v10;
  unsigned int timeSinceMaintenanceStartedInSeconds;
  int v12;
  int reason;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numberOfEntriesUpdated = self->_numberOfEntriesUpdated;
    if (numberOfEntriesUpdated != objc_msgSend(v4, "numberOfEntriesUpdated"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    totalCacheEntries = self->_totalCacheEntries;
    if (totalCacheEntries != objc_msgSend(v4, "totalCacheEntries"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    timeSinceMaintenanceStartedInSeconds = self->_timeSinceMaintenanceStartedInSeconds;
    if (timeSinceMaintenanceStartedInSeconds == objc_msgSend(v4, "timeSinceMaintenanceStartedInSeconds"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_numberOfEntriesUpdated;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_totalCacheEntries;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_timeSinceMaintenanceStartedInSeconds;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded numberOfEntriesUpdated](self, "numberOfEntriesUpdated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfEntriesUpdated"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded timeSinceMaintenanceStartedInSeconds](self, "timeSinceMaintenanceStartedInSeconds"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeSinceMaintenanceStartedInSeconds"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = -[POMMESSchemaPOMMESCacheMaintenanceEnded reason](self, "reason");
  v9 = CFSTR("POMMESCACHEMAINTENANCEENDEDREASON_UNKNOWN");
  if (v8 == 1)
    v9 = CFSTR("POMMESCACHEMAINTENANCEENDEDREASON_COMPLETE");
  if (v8 == 2)
    v10 = CFSTR("POMMESCACHEMAINTENANCEENDEDREASON_DEFERRED");
  else
    v10 = v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("reason"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_14;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded totalCacheEntries](self, "totalCacheEntries"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("totalCacheEntries"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESCacheMaintenanceEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESCacheMaintenanceEnded *v5;
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
    self = -[POMMESSchemaPOMMESCacheMaintenanceEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESCacheMaintenanceEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  POMMESSchemaPOMMESCacheMaintenanceEnded *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESCacheMaintenanceEnded;
  v5 = -[POMMESSchemaPOMMESCacheMaintenanceEnded init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfEntriesUpdated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setNumberOfEntriesUpdated:](v5, "setNumberOfEntriesUpdated:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalCacheEntries"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setTotalCacheEntries:](v5, "setTotalCacheEntries:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceMaintenanceStartedInSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setTimeSinceMaintenanceStartedInSeconds:](v5, "setTimeSinceMaintenanceStartedInSeconds:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setReason:](v5, "setReason:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)numberOfEntriesUpdated
{
  return self->_numberOfEntriesUpdated;
}

- (unsigned)totalCacheEntries
{
  return self->_totalCacheEntries;
}

- (unsigned)timeSinceMaintenanceStartedInSeconds
{
  return self->_timeSinceMaintenanceStartedInSeconds;
}

- (int)reason
{
  return self->_reason;
}

@end
