@implementation ODMSiriSchemaODMSiriAggregationInterval

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAggregationIntervalInDays:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aggregationIntervalInDays = a3;
}

- (BOOL)hasAggregationIntervalInDays
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAggregationIntervalInDays:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAggregationIntervalInDays
{
  -[ODMSiriSchemaODMSiriAggregationInterval setAggregationIntervalInDays:](self, "setAggregationIntervalInDays:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAggregationIntervalStartTimestampInSecondsSince2001:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_aggregationIntervalStartTimestampInSecondsSince2001 = a3;
}

- (BOOL)hasAggregationIntervalStartTimestampInSecondsSince2001
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAggregationIntervalStartTimestampInSecondsSince2001:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAggregationIntervalStartTimestampInSecondsSince2001
{
  -[ODMSiriSchemaODMSiriAggregationInterval setAggregationIntervalStartTimestampInSecondsSince2001:](self, "setAggregationIntervalStartTimestampInSecondsSince2001:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriAggregationIntervalReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $DD605746C9C0117442BEAFDA18497874 has;
  unsigned int v6;
  unsigned int aggregationIntervalInDays;
  int v8;
  double aggregationIntervalStartTimestampInSecondsSince2001;
  double v10;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    aggregationIntervalInDays = self->_aggregationIntervalInDays;
    if (aggregationIntervalInDays != objc_msgSend(v4, "aggregationIntervalInDays"))
      goto LABEL_9;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001,
          objc_msgSend(v4, "aggregationIntervalStartTimestampInSecondsSince2001"),
          aggregationIntervalStartTimestampInSecondsSince2001 == v10))
    {
      v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  double aggregationIntervalStartTimestampInSecondsSince2001;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_aggregationIntervalInDays;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    return v7 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  v4 = -aggregationIntervalStartTimestampInSecondsSince2001;
  if (aggregationIntervalStartTimestampInSecondsSince2001 >= 0.0)
    v4 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriAggregationInterval aggregationIntervalInDays](self, "aggregationIntervalInDays"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregationIntervalInDays"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[ODMSiriSchemaODMSiriAggregationInterval aggregationIntervalStartTimestampInSecondsSince2001](self, "aggregationIntervalStartTimestampInSecondsSince2001");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aggregationIntervalStartTimestampInSecondsSince2001"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriAggregationInterval dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriAggregationInterval)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriAggregationInterval *v5;
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
    self = -[ODMSiriSchemaODMSiriAggregationInterval initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriAggregationInterval)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriAggregationInterval *v5;
  void *v6;
  void *v7;
  ODMSiriSchemaODMSiriAggregationInterval *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODMSiriSchemaODMSiriAggregationInterval;
  v5 = -[ODMSiriSchemaODMSiriAggregationInterval init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationIntervalInDays"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriAggregationInterval setAggregationIntervalInDays:](v5, "setAggregationIntervalInDays:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationIntervalStartTimestampInSecondsSince2001"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[ODMSiriSchemaODMSiriAggregationInterval setAggregationIntervalStartTimestampInSecondsSince2001:](v5, "setAggregationIntervalStartTimestampInSecondsSince2001:");
    }
    v8 = v5;

  }
  return v5;
}

- (unsigned)aggregationIntervalInDays
{
  return self->_aggregationIntervalInDays;
}

- (double)aggregationIntervalStartTimestampInSecondsSince2001
{
  return self->_aggregationIntervalStartTimestampInSecondsSince2001;
}

@end
