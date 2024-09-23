@implementation PNRODSchemaPNRODMetricDuration

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMetricValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_metricValue = a3;
}

- (BOOL)hasMetricValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMetricValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMetricValue
{
  -[PNRODSchemaPNRODMetricDuration setMetricValue:](self, "setMetricValue:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startTimestamp = a3;
}

- (BOOL)hasStartTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStartTimestamp
{
  -[PNRODSchemaPNRODMetricDuration setStartTimestamp:](self, "setStartTimestamp:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setStartEventIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startEventIndex = a3;
}

- (BOOL)hasStartEventIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStartEventIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteStartEventIndex
{
  -[PNRODSchemaPNRODMetricDuration setStartEventIndex:](self, "setStartEventIndex:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setEndEventIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endEventIndex = a3;
}

- (BOOL)hasEndEventIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEndEventIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEndEventIndex
{
  -[PNRODSchemaPNRODMetricDuration setEndEventIndex:](self, "setEndEventIndex:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODMetricDurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt64Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt64Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $652B1320B5DD2052B02D28CA035CC60D has;
  unsigned int v6;
  double metricValue;
  double v8;
  int v9;
  int64_t startTimestamp;
  int v11;
  int64_t startEventIndex;
  int v13;
  int64_t endEventIndex;
  BOOL v15;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    metricValue = self->_metricValue;
    objc_msgSend(v4, "metricValue");
    if (metricValue != v8)
      goto LABEL_18;
    has = self->_has;
    v6 = v4[40];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v9)
  {
    startTimestamp = self->_startTimestamp;
    if (startTimestamp != objc_msgSend(v4, "startTimestamp"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[40];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v11)
  {
    startEventIndex = self->_startEventIndex;
    if (startEventIndex == objc_msgSend(v4, "startEventIndex"))
    {
      has = self->_has;
      v6 = v4[40];
      goto LABEL_14;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v13)
  {
    endEventIndex = self->_endEventIndex;
    if (endEventIndex != objc_msgSend(v4, "endEventIndex"))
      goto LABEL_18;
  }
  v15 = 1;
LABEL_19:

  return v15;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double metricValue;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    metricValue = self->_metricValue;
    v6 = -metricValue;
    if (metricValue >= 0.0)
      v6 = self->_metricValue;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) == 0)
  {
    v9 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_startTimestamp;
  if ((has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_startEventIndex;
  if ((has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_endEventIndex;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration endEventIndex](self, "endEventIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endEventIndex"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration startEventIndex](self, "startEventIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("startEventIndex"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PNRODSchemaPNRODMetricDuration metricValue](self, "metricValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("metricValue"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration startTimestamp](self, "startTimestamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startTimestamp"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODMetricDuration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODMetricDuration)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODMetricDuration *v5;
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
    self = -[PNRODSchemaPNRODMetricDuration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODMetricDuration)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODMetricDuration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PNRODSchemaPNRODMetricDuration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNRODSchemaPNRODMetricDuration;
  v5 = -[PNRODSchemaPNRODMetricDuration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PNRODSchemaPNRODMetricDuration setMetricValue:](v5, "setMetricValue:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODMetricDuration setStartTimestamp:](v5, "setStartTimestamp:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startEventIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODMetricDuration setStartEventIndex:](v5, "setStartEventIndex:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endEventIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODMetricDuration setEndEventIndex:](v5, "setEndEventIndex:", objc_msgSend(v9, "longLongValue"));
    v10 = v5;

  }
  return v5;
}

- (double)metricValue
{
  return self->_metricValue;
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (int64_t)startEventIndex
{
  return self->_startEventIndex;
}

- (int64_t)endEventIndex
{
  return self->_endEventIndex;
}

@end
