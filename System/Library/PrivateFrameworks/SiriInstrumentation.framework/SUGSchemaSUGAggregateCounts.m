@implementation SUGSchemaSUGAggregateCounts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLastDayCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastDayCount = a3;
}

- (BOOL)hasLastDayCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLastDayCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLastDayCount
{
  -[SUGSchemaSUGAggregateCounts setLastDayCount:](self, "setLastDayCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setLastWeekBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastWeekBucket = a3;
}

- (BOOL)hasLastWeekBucket
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLastWeekBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteLastWeekBucket
{
  -[SUGSchemaSUGAggregateCounts setLastWeekBucket:](self, "setLastWeekBucket:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLast28DaysBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_last28DaysBucket = a3;
}

- (BOOL)hasLast28DaysBucket
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLast28DaysBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLast28DaysBucket
{
  -[SUGSchemaSUGAggregateCounts setLast28DaysBucket:](self, "setLast28DaysBucket:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGAggregateCountsReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1BEFDD17A1494AC702F10A4293EF4E2D has;
  unsigned int v6;
  unsigned int lastDayCount;
  int v8;
  unsigned int lastWeekBucket;
  int v10;
  unsigned int last28DaysBucket;
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
    lastDayCount = self->_lastDayCount;
    if (lastDayCount != objc_msgSend(v4, "lastDayCount"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    lastWeekBucket = self->_lastWeekBucket;
    if (lastWeekBucket == objc_msgSend(v4, "lastWeekBucket"))
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
    last28DaysBucket = self->_last28DaysBucket;
    if (last28DaysBucket != objc_msgSend(v4, "last28DaysBucket"))
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
  v2 = 2654435761 * self->_lastDayCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_lastWeekBucket;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_last28DaysBucket;
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts lastDayCount](self, "lastDayCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("lastDayCount"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts last28DaysBucket](self, "last28DaysBucket"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("last28DaysBucket"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts lastWeekBucket](self, "lastWeekBucket"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lastWeekBucket"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGAggregateCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGAggregateCounts)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGAggregateCounts *v5;
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
    self = -[SUGSchemaSUGAggregateCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGAggregateCounts)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGAggregateCounts *v5;
  void *v6;
  void *v7;
  void *v8;
  SUGSchemaSUGAggregateCounts *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUGSchemaSUGAggregateCounts;
  v5 = -[SUGSchemaSUGAggregateCounts init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastDayCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGAggregateCounts setLastDayCount:](v5, "setLastDayCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastWeekBucket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGAggregateCounts setLastWeekBucket:](v5, "setLastWeekBucket:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last28DaysBucket"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGAggregateCounts setLast28DaysBucket:](v5, "setLast28DaysBucket:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)lastDayCount
{
  return self->_lastDayCount;
}

- (unsigned)lastWeekBucket
{
  return self->_lastWeekBucket;
}

- (unsigned)last28DaysBucket
{
  return self->_last28DaysBucket;
}

@end
